# frozen_string_literal: true

ENV['RAILS_ENV'] ||= 'test'

require 'simplecov'

# Generate Simplecov report
SimpleCov.start

require File.expand_path('dummy/config/environment.rb', __dir__)
require 'rspec/rails'
require 'shoulda/matchers'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

RSpec.configure do |config|
  config.infer_spec_type_from_file_location!

  config.order = 'random'

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec

    with.library :active_model
    with.library :action_controller
  end
end
