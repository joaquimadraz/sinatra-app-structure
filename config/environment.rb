require "rubygems"
require "bundler"
require "yaml"

APP_PATH = "../app"

# require gemfile
Bundler.require(:default, ENV["RACK_ENV"].to_sym)

require_relative '../config/configs'
Configs.load("config/config.yml", ENV["RACK_ENV"])

# require my app objects
require_relative "#{APP_PATH}/routes/init"
require_relative "#{APP_PATH}/models/init"
require_relative "#{APP_PATH}/helpers/init"
require_relative "#{APP_PATH}/usecases/init"

# initializers
require_relative "initializers/active_record"