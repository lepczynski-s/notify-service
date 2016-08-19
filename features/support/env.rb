RACK_ENV = 'test' unless defined?(RACK_ENV)
require File.expand_path(File.dirname(__FILE__) + "/../../config/boot")
Dir[File.expand_path(File.dirname(__FILE__) + "/../**/helpers/**/*.rb")].each(&method(:require))

require 'capybara/cucumber'
require 'rspec/expectations'

Capybara.app = Padrino.application
