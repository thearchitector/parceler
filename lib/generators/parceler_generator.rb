class ParcelerGenerator < Rails::Generators::Base
    source_root File.expand_path("../templates", __FILE__)

    def create_initializer_file
        copy_file "config.rb", "config/initializers/parceler.rb"
    end
end