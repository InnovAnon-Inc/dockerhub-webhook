####
# config.py.example

# Copy this file to config.py, then update APIKEY and HOOKS.

# env $DOCKERHOOK_TOKEN overrides this.
APIKEY = 'abc123'

# Add your script using the name of your repository as the key
HOOKS = {
  'virtual-temple': 'scripts/virtual-temple.sh',
  'ircd'          : 'scripts/ircd.sh',
  'zenbot'        : 'scripts/zenbot.sh',
}

JSONIFY_PRETTYPRINT_REGULAR = False
#DEBUG = False

