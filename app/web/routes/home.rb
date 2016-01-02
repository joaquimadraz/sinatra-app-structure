module SampleApp

  class Web < ::Sinatra::Base

    get '/' do
      erb :index
    end

    get '/me', auth: :user do
      erb :me
    end

  end

end
