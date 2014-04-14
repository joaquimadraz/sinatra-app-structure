$:.unshift File.expand_path(File.dirname(__FILE__))

Encoding.default_external = Encoding::UTF_8
Encoding.default_internal = Encoding::UTF_8

ENV['ROOT_PATH'] = "#{File.expand_path(File.dirname(__FILE__))}"

require 'config/environment'
require 'app'