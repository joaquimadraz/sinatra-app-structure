$:.unshift(File.dirname(__FILE__))

require 'rack/protection'
require 'boot'

use Rack::Session::Cookie, :key => 'rack.session',
                           :secret => Configs['SESSION_SECRET']

use OmniAuth::Builder do
  provider :twitter, Configs['TWITTER_API_KEY'], Configs['TWITTER_API_SECRET']
end

OmniAuth.config.on_failure = Proc.new { |env|
  OmniAuth::FailureEndpoint.new(env).redirect_to_failure
}

use Rack::MethodOverride
use Rack::Protection::EscapedParams

run SampleApp::Web
