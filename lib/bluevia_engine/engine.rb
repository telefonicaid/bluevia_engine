# Copyright 2011 Telefonica Investigación y Desarrollo, S.A.U
#
# This file is part of bluevia_engine.
# bluevia_engine is free software: you can redistribute it and/or modify it under 
# the terms of the GNU Affero General Public License as published by the
# Free Software Foundation, either version 3 of the License, or (at your option) any later version.
# bluevia_engine is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; 
# without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. 
# See the GNU Affero General Public License for more details.

# You should have received a copy of the GNU Affero General Public License along with bluevia_engine.
# If not, see http://www.gnu.org/licenses/.

# For those usages not covered by the GNU Affero General Public License please contact with::[contacto@tid.es]
#
# Author:: Juan de Bravo (jdbd@tid.es)

require 'rails'
require 'bluevia_engine/engine_config'

module BlueviaEngine
  ##
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
