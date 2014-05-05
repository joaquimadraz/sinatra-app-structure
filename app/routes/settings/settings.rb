class SampleApp < Sinatra::Base

  get '/settings' do
    'Settings World'
  end

end