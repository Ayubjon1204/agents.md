def save_sample(path, content):
    with open(path, "w", encoding="utf-8") as f:
        f.write(content)
