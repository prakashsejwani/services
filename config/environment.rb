# Be sure to restart your server when you modify this file

# Uncomment below to force Rails into production mode when
# you don't control web/app server and can't set it the proper way
# ENV['RAILS_ENV'] ||= 'production'

# Specifies gem version of Rails to use when vendor/rails is not present
#RAILS_GEM_VERSION = '2.3.5' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  
  config.gem "capistrano-ext", :lib => "capistrano"
  config.gem "configatron"
  config.gem 'mislav-will_paginate', :version => '2.3.6', :lib => 'will_paginate', :source => 'http://gems.github.com'
  
  config.time_zone = 'UTC'
  config.action_controller.session = {
    :session_key => '_base_session',
    :secret      => 'c5cfc6d7a49cc5f796a77ad683cc49aa0b2b43f8e32e43e2c30050ff65aa809d6c3353e1efd8712e1f8702bc008a70b9891e53b6ea649b2319a438e2b17457b2'
  }
  config.load_paths << "#{RAILS_ROOT}/app/sweepers" 
  # Use the database for sessions instead of the cookie-based default,
  # which shouldn't be used to store highly confidential information
  # (create the session table with "rake db:sessions:create")
  # config.action_controller.session_store = :active_record_store

  # Use SQL instead of Active Record's schema dumper when creating the test database.
  # This is necessary if your schema can't be completely dumped by the schema dumper,
  # like if you have constraints or database-specific column types
  # config.active_record.schema_format = :sql

  # Activate observers that should always be running
  # Please note that observers generated using script/generate observer need to have an _observer suffix
  # config.active_record.observers = :cacher, :garbage_collector, :forum_observer
end
# Email settings
ActionMailer::Base.delivery_method = :smtp
#ActionMailer::Base.default_content_type="text.html"
ActionMailer::Base.smtp_settings = {
  :address        => 'smtp.amexgroup.in',
  :port           => 25,
  :domain         => 'amexgroup.in',
  :authentication => :login,
  :user_name      => 'info@amexgroup.in',
  :password       => 'info123'
 }
