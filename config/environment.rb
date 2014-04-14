require "rubygems"
require "bundler"
require "yaml"

APP_PATH = "../app"

# require gemfile
Bundler.require(:default, ENV["RACK_ENV"].to_sym)

require_relative "#{ENV['ROOT_PATH']}/config/configs"

Configs.load "#{ENV['ROOT_PATH']}/config/config.yml", ENV["RACK_ENV"]

# require app objects

Configs.folders do |f|
  f 'app/helpers'
  f 'app/models'
  f 'app/routes'
  f 'app/usecases'
  f 'config/initializers'
end

Configs.require_all