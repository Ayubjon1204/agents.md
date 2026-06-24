from fastapi import FastAPI
from pydantic import BaseModel
app = FastAPI(title="search-mcp")
class Q(BaseModel):
    q: str
@app.post("/search")
def search(q: Q):
    # Demo: return mocked search results
    return {"results":[{"title":f"Result for {q.q}", "url":"https://example.com/1"},{"title":"Another","url":"https://example.com/2"}]}
