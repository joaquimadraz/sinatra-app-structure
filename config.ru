$:.unshift(File.dirname(__FILE__))

Encoding.default_external = Encoding::UTF_8

ENV['ROOT_PATH'] = "#{File.dirname(__FILE__)}"

require 'config/environment'
require 'app'

run SampleApp
