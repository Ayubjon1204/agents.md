from .frontend import frontend_agent
from .devops import devops_agent
from .marketing import marketing_agent
from .android import android_agent
from .ios import ios_agent
from .aios import aios_agent

def run_agent(domain):
    mapping = {
        "frontend": frontend_agent.run,
        "devops": devops_agent.run,
        "marketing": marketing_agent.run,
        "android": android_agent.run,
        "ios": ios_agent.run,
        "aios": aios_agent.run,
    }
    fn = mapping.get(domain)
    if not fn:
        print("Unknown domain:", domain)
        return
    fn()
