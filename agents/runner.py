#!/usr/bin/env python3
import argparse, os
from dotenv import load_dotenv
load_dotenv()
from agents import dispatch

parser = argparse.ArgumentParser()
parser.add_argument("--domain", required=True, help="Which domain agent to run (frontend, devops, marketing, android, ios, aios)")
args = parser.parse_args()
dispatch.run_agent(args.domain)
