require "rubygems"
require "bundler"
require "yaml"

APP_PATH = "../app"

Bundler.require(:default, ENV["RACK_ENV"].to_sym)

require_relative "#{ENV['ROOT_PATH']}/config/configs"

Configs.load "#{ENV['ROOT_PATH']}/config/config.yml", ENV["RACK_ENV"]

Requirable.load! 'config', 'app'
