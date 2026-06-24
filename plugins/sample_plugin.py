# Sample plugin (Auto-GPT style) - expose metadata + handler
manifest = {
    "name": "sample-plugin",
    "description": "A demo plugin that returns a small message",
    "version": "0.1",
}
def handle(payload):
    # payload is a dict with keys like 'input'
    return {"ok": True, "echo": payload.get("input", "")}
