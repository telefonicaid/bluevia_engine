require 'rails'
require 'bluevia_engine/engine_config'

module BlueviaEngine
  #
  # This class defines the BlueVia Rails Engine to handle OAuth authentication.
  # The Engine defines two new routes to handle each of the OAuth steps
  # 1.- forward the user request to BlueVia server
  # 2.- get the OAuth code, request a valid access token and forward the token info to a user defined action
  #
  # How to configure BlueVia Rails Engine
  #
  # :key => application key (get it from www.bluevia.com)
  # :secret => application secret (get it from www.bluevia.com)
  # :application_id => application unique identifier (get it from www.bluevia.com)
  # :forward_action => controller#action where the user token data will be redirected:
  #           - :token
  #           - :token_secret
  #
  # These configuration can be included in an application initializer. You just need to run the following generator
  #  and update the values:
  #
  #     rails generate bluevia_engine:install
  
  class Engine < Rails::Engine
    
    # we need to create the hashblue config hash before loading the application initializer
    initializer :bluevia, {:before => :load_config_initializers} do |app|

      app.config.bluevia = BlueviaEngine::EngineConfig.new
    end
    
  end
end
