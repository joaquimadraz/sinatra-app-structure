module SampleApp

  class Web < ::Sinatra::Base

    get '/api/v0/users/me', auth: :api do
      respond_with UseCases::Users::GetCurrentUser::Base
    end

    get '/api/v0/users/:id', auth: :api do
      compel! \
        id: Compel.integer.min(1).required

      respond_with UseCases::Users::Show::Base
    end

    get '/api/v0/users', auth: :api do
      compel! \
        page: Compel.integer.min(1),
        per_page: Compel.integer.min(10)

      respond_with UseCases::Users::Index::Base
    end

  end

end
