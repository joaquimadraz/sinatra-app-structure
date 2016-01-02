require 'omniauth'
require 'omniauth-twitter'

module SampleApp

  class Web < ::Sinatra::Base

    get '/login' do
      unless current_user?
        redirect to("/auth/twitter")
      else
        redirect to('/')
      end
    end

    get '/logout' do
      session[:user_id] = nil
      redirect to('/')
    end

    get '/auth/failure' do
      redirect to('/')
    end

    get '/auth/twitter/callback' do
      unless current_user?
        ctx = UseCases::Users::FindOrCreate::Base.perform \
          twitter_uid: env['omniauth.auth']['uid'], omniauth_data: env['omniauth.auth']

        if ctx.ok?
          session[:user_id] = ctx.user.id
          redirect to('/')
        end
      end

      redirect to('/')
    end

  end

end
