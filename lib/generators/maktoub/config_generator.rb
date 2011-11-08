module Maktoub
  module Generators
    class ConfigGenerator < Rails::Generators::Base
      source_root File.expand_path('../templates', __FILE__)

      def generate_maktoub
        copy_file "maktoub.rb", "config/initializers/maktoub.rb"
      end
    end
  end
end
