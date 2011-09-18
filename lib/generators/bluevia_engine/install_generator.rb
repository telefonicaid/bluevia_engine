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
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path(File.join(File.dirname(__FILE__), "..", "templates"))

      desc "This generator copies an initializer file at config/initializers"
      def copy_initializer
        template "bluevia_engine_initializer.rb", "config/initializers/bluevia_engine_initializer.rb"
      end  
    end
  end
end