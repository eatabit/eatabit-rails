require 'rails/generators/base'
require 'rails/generators/active_record'

module Eatabit

  module Generators

    class InstallGenerator < Rails::Generators::Base

      include Rails::Generators::Migration

      source_root File.expand_path('../templates', __FILE__)

      def create_eatabit_initializer
        copy_file 'eatabit.rb', 'config/initializers/eatabit.rb'
      end
    end
  end
end
