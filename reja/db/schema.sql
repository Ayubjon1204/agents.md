-- Applied to the Supabase project as migrations roadmap_docs_store + roadmap_docs_cap_900 (shown merged).
-- The owner explicitly chose an OPEN plan: anyone who has the link may read AND edit, with no login or code.
create table public.docs (
  collection text not null,
  id text not null,
  data jsonb not null,
  updated_at timestamptz not null default now(),
  primary key (collection, id),
  constraint docs_collection_ok check (collection in ('projects', 'sections', 'tasks')),
  constraint docs_id_ok check (id ~ '^[A-Za-z0-9_-]{1,64}$'),
  constraint docs_data_object check (jsonb_typeof(data) = 'object'),
  constraint docs_data_small check (octet_length(data::text) <= 20000)
);
create table public.rev (id int primary key check (id = 1), n bigint not null default 0, at timestamptz not null default now());
insert into public.rev (id) values (1);
create table public.history (
  hid bigint generated always as identity primary key, at timestamptz not null default now(),
  op text not null, collection text not null, id text not null, old_data jsonb, new_data jsonb
);
create index history_doc_idx on public.history (collection, id, hid desc);

create function public.docs_before() returns trigger language plpgsql security definer set search_path = '' as $$
begin
  if tg_op = 'INSERT' then
    if not exists (select 1 from public.docs d where d.collection = new.collection and d.id = new.id)
       and (select count(*) from public.docs) >= 900 then
      raise exception 'Too many documents' using errcode = '53400';
    end if;
  elsif new.collection is distinct from old.collection or new.id is distinct from old.id then
    raise exception 'A document cannot be renamed' using errcode = '22023';
  end if;
  new.updated_at := now();
  return new;
end $$;

create function public.docs_after() returns trigger language plpgsql security definer set search_path = '' as $$
begin
  if tg_op = 'INSERT' then
    insert into public.history (op, collection, id, old_data, new_data) values ('INSERT', new.collection, new.id, null, new.data);
  elsif tg_op = 'UPDATE' then
    if new.data is not distinct from old.data then return null; end if;
    insert into public.history (op, collection, id, old_data, new_data) values ('UPDATE', new.collection, new.id, old.data, new.data);
  else
    insert into public.history (op, collection, id, old_data, new_data) values ('DELETE', old.collection, old.id, old.data, null);
  end if;
  update public.rev set n = n + 1, at = now() where id = 1;
  if random() < 0.02 then
    delete from public.history h where h.hid <= (select max(hid) from public.history) - 5000;
  end if;
  return null;
end $$;

create trigger docs_before_write before insert or update on public.docs for each row execute function public.docs_before();
create trigger docs_after_write after insert or update or delete on public.docs for each row execute function public.docs_after();

create function public.patch_doc(p_collection text, p_id text, p_patch jsonb) returns jsonb
language sql security invoker set search_path = '' as $$
  update public.docs set data = data || p_patch
  where collection = p_collection and id = p_id and jsonb_typeof(p_patch) = 'object'
  returning data;
$$;

alter table public.docs enable row level security;
alter table public.rev enable row level security;
alter table public.history enable row level security;
create policy "read plan" on public.docs for select to anon, authenticated using (true);
create policy "add to plan" on public.docs for insert to anon, authenticated with check (true);
create policy "change plan" on public.docs for update to anon, authenticated using (true) with check (true);
create policy "remove from plan" on public.docs for delete to anon, authenticated using (true);
create policy "read rev" on public.rev for select to anon, authenticated using (true);
revoke all on public.docs, public.rev, public.history from anon, authenticated;
grant select, insert, update, delete on public.docs to anon, authenticated;
grant select on public.rev to anon, authenticated;
revoke execute on function public.docs_before(), public.docs_after() from public, anon, authenticated;
revoke execute on function public.patch_doc(text, text, jsonb) from public;
grant execute on function public.patch_doc(text, text, jsonb) to anon, authenticated;
