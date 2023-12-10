# frozen_string_literal: true

if ENV["COVER"] == "true" || ENV["CI"]
  require "simplecov"
  require "active_support/core_ext/numeric/time"

  puts "simplecov runnnig..."

  SimpleCov.profiles.define :rhc_custom do
    track_files "{app,lib}/**/*.rb"
    track_files "db/script/**/*.rb"

    add_filter "app/models/application_record.rb"
    add_filter "app/controllers/application_controller.rb"

    add_filter "db/migrate"
    add_filter "vendor/"
    add_filter "spec/"
    add_filter "lib/devour/rails_config_loader.rb"

    add_group "Config", "config"
    add_group "Controllers", "app/controllers"
    add_group "Dictionaries", "app/dictionaries"
    add_group "Libraries", "lib/"
    add_group "Migration Scripts", "db/script"
    add_group "Models", "app/models"
    add_group "Transformers", "app/transformers"

    use_merging true
    merge_timeout 1.day
  end

  SimpleCov.start :rhc_custom

  SimpleCov.at_exit do
    SimpleCov.result.format!
    SimpleCov.minimum_coverage 90
    SimpleCov.minimum_coverage_by_file 70
  end
end
