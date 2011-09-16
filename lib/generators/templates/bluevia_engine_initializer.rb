
# The next three parameters must be obtained from BlueVia developers portal (https://www.bluevia.com)

# Application unique identifier. Actually its not needed at all
Rails.application.config.bluevia.application_id = "your-bluevia-application-id"

# Application key. This is the first element to authenticate an application
Rails.application.config.bluevia.key = "your-bluevia-application-key"

# Application secret. This is the second element to authenticate an application
Rails.application.config.bluevia.secret = "your-bluevia-application-secret"

# Where to forward the OAuth response data
# By default is configured an action include in the Engine that prints 
# the token and secret got from BlueVia
Rails.application.config.bluevia.forward_action = "bluevia#show"

