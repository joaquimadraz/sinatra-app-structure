module SampleApp

  class Web < ::Sinatra::Base

    set(:auth) do |*roles|
      condition { authorize } if roles.include? :api

      if roles.include? :user
        condition do
          unless current_user?
            redirect to('/?please_login')
          end
        end
      end
    end

    def respond_with(use_case_klass)
      context = use_case_klass.perform(declared_params)

      status context.http_status if context.http_status.present?

      json context.data
    end

  end

end

require_relative './auth'
require_relative './home'
require_relative './api/v0/users'

module SampleApp

  class Web < ::Sinatra::Base

    get '/css/application.css' do
      content_type 'text/css'

      erb :'application.css', layout: false
    end

    get '/*' do
      halt 404
    end

  end

end
