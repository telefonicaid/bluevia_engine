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

