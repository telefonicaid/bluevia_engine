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

  ##
  # This class is the base class that handles any error related to the OAuth mechanism
  class Error < StandardError
  end
  
  ##
  # This exception is used when the application config is not recognized by Bluevia
  class UnauthorizedError < Error
  end
  
  ##
  # This exception is used when the application config is invalid
  class InvalidConfig < Error
  end
end