#!/usr/bin/env bash
set -e
echo "1) Copy .env.example to .env and add OPENAI_API_KEY"
echo "2) docker-compose up --build -d"
echo "3) python3 -m venv .venv && source .venv/bin/activate"
echo "4) pip install -r requirements.txt"
echo "5) python agents/runner.py --domain frontend"
