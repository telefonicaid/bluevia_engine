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