$:.unshift '.'

ENV['RACK_ENV'] = 'development' if ENV['RACK_ENV'].nil?

Dir.glob('lib/tasks/*.rake').each { |r| load r}

require "sinatra/activerecord/rake"
require 'config/environment'
require "app"
