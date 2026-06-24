from fastapi import FastAPI
from pydantic import BaseModel
app = FastAPI(title="calc-mcp")
class Calc(BaseModel):
    op: str
    a: float
    b: float
@app.post("/calc")
def calc(c: Calc):
    if c.op == "add":
        return {"result": c.a + c.b}
    if c.op == "mul":
        return {"result": c.a * c.b}
    return {"error":"unknown op"}
