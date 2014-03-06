$:.unshift(File.dirname(__FILE__))

Encoding.default_external = Encoding::UTF_8

require 'config/environment'
require 'app'

run SampleApp
