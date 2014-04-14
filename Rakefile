$:.unshift '.'

Encoding.default_external = Encoding::UTF_8
Encoding.default_internal = Encoding::UTF_8

ENV['RACK_ENV'] = 'development' if ENV['RACK_ENV'].nil?

Dir.glob('lib/tasks/*.rake').each { |r| load r}

require "sinatra/activerecord/rake"
require 'boot'
