import os, requests
def add(a,b):
    url = os.getenv("CALC_MCP_URL", "http://localhost:8002/calc")
    try:
        r = requests.post(url, json={"op":"add","a":a,"b":b}, timeout=5)
        r.raise_for_status()
        return r.json().get("result")
    except Exception as e:
        return a+b
