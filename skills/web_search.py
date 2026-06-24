import os, requests
def search(q):
    # call the search MCP if available
    url = os.getenv("SEARCH_MCP_URL", "http://localhost:8001/search")
    try:
        r = requests.post(url, json={"q": q}, timeout=5)
        r.raise_for_status()
        return r.json().get("results", [])
    except Exception as e:
        # fallback: mock result
        return [{"title":"Mock result for "+q, "url":"http://example.com"}]
