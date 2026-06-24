import os, requests, time
from skills import web_search, calculator, code_editor

def run():
    print("=== Running devops agent (demo) ===")
    # Example: get a short plan from LLM (mocked here) then call skills
    query = "Sample task for devops team: create a checklist for first steps."
    print("Task:", query)
    # call a web search skill
    print("Calling web_search skill...")
    results = web_search.search(query)
    print("Search results (top):", results[:1])
    # compute example
    print("Calling calculator MCP via skill...")
    ans = calculator.add(2,3)
    print("Calculator result:", ans)
    # simple code edit demo
    print("Code editor skill will create a sample file")
    code_editor.save_sample("${d}_sample.txt", "Hello from ${d} agent at " + time.strftime("%Y-%m-%d %H:%M:%S"))
    print("Done.")
