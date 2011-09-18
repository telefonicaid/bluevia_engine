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

module BlueviaEngine
  # Array of elements that should be configured by the user
  # See the initializer for further information about each parameter
  bluevia_engine_config = [:key, :secret, :application_id, :forward_action]

  ##
  # This class defines the parameters that shall be configured to use the
  # bluevia_engine gem in a Rails application
  class EngineConfig  < Struct.new(*bluevia_engine_config)
  end
  
end