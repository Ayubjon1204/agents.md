Agent Monorepo — plugins, skills, MCPs demo
Steps:
1) Copy .env.example to .env and fill OPENAI_API_KEY
2) docker-compose up --build -d   # starts MCP services (search & calc)
3) python3 -m venv .venv && source .venv/bin/activate
4) pip install -r requirements.txt
5) python agents/runner.py --domain frontend   # run a domain agent
