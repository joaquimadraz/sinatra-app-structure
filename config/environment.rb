require 'rubygems'
require 'bundler'
require 'yaml'

Bundler.require(:default, ENV['RACK_ENV'].to_sym)

require 'config/configs'

Configs.load 'config/config.yml', ENV['RACK_ENV']

Requirable.load! 'config/initializers', 'lib', 'app'
