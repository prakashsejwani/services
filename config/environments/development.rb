# Settings specified here will take precedence over those in config/environment.rb

# In the development environment your application's code is reloaded on
# every request.  This slows down response time but is perfect for development
# since you don't have to restart the webserver when you make code changes.
config.cache_classes = false

# Log error messages when you accidentally call methods on nil.
config.whiny_nils = true

# Show full error reports and disable caching
config.action_controller.consider_all_requests_local = true
config.action_view.debug_rjs                         = true
config.action_controller.perform_caching             = true

# Don't care if the mailer can't send        -------- made it true --------
#config.action_mailer.raise_delivery_errors = true

# -------- changes made below are done by sachin for mailing --------
# set delivery method to :smtp, :sendmail or :test
#config.action_mailer.delivery_method = :smtp

# these options are only needed if you choose smtp settings
#config.action_mailer.smtp_settings = {
#  :address => "mail.econify.com",
#  :port => 25,
#  :domain => "192.168.0.210:3000",
#  :authentication => :plain,
#  :user_name => "sn@econify.com",
#  :password => "5%cp0will"
#}

# -------- changes complet --------

#require 'ruby-debug'
