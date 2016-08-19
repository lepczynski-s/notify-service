# Defines our constants
RACK_ENV = ENV['RACK_ENV'] ||= 'development' unless defined?(RACK_ENV)
PADRINO_ROOT = File.expand_path('../..', __FILE__) unless defined?(PADRINO_ROOT)

# Load our dependencies
require 'bundler/setup'
Bundler.require(:default, RACK_ENV)

##
# ## Enable devel logging
#
# Padrino::Logger::Config[:development][:log_level]  = :devel
# Padrino::Logger::Config[:development][:log_static] = true
#
# ## Enable logging of source location
#
# Padrino::Logger::Config[:development][:source_location] = true
#
# ## Configure your I18n
#
# I18n.default_locale = :en
# I18n.enforce_available_locales = false
#
# ## Configure your HTML5 data helpers
#
# Padrino::Helpers::TagHelpers::DATA_ATTRIBUTES.push(:dialog)
# text_field :foo, :dialog => true
# Generates: <input type="text" data-dialog="true" name="foo" />
#
# ## Add helpers to mailer
#
# Mail::Message.class_eval do
#   include Padrino::Helpers::NumberHelpers
#   include Padrino::Helpers::TranslationHelpers
# end

# Default application locale
I18n.default_locale = :en

# Development boot configuration
if Padrino.env == :development
  require 'better_errors'
  Padrino::Application.use BetterErrors::Middleware
  BetterErrors.application_root = PADRINO_ROOT
  BetterErrors.logger = Padrino.logger

  Padrino::Server::DEFAULT_ADDRESS[:Port] = 3010
end

# Scheduler configuration
scheduler = Rufus::Scheduler.new :frequency => 5

# Scheduler jobs
scheduler.every('15s', :overlap => false)         { Jobs::Notifications.instant_notifications_job }
scheduler.cron('*/15 * * * *', :overlap => false) { Jobs::Notifications.scheduled_notifications_job }
scheduler.cron('00 22 * * *', :overlap => false)  { Jobs::Notifications.digested_notifications_job }
scheduler.cron('00 06 * * *', :overlap => false)  { Jobs::Notifications.old_notifications_job }

##
# Add your before (RE)load hooks here
#
Padrino.before_load do
end

##
# Add your after (RE)load hooks here
#
Padrino.after_load do
end

Padrino.load!
