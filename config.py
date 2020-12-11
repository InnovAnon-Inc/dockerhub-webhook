####
# config.py.example

# Copy this file to config.py, then update APIKEY and HOOKS.

# env $DOCKERHOOK_TOKEN overrides this.
APIKEY = 'abc123'

# Add your script using the name of your repository as the key
HOOKS = {
  'dockerhub-home'   : 'scripts/dockerhub-webhook.sh',
  'dockerhub-webhook': 'scripts/dockerhub-webhook.sh',
  'honeypot'         : 'scripts/honeypot.sh',
  'ircd'             : 'scripts/ircd.sh',
  'virtual-temple'   : 'scripts/virtual-temple.sh',
  'zenbot'           : 'scripts/zenbot.sh',
}

JSONIFY_PRETTYPRINT_REGULAR = False
#DEBUG = False

