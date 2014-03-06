module HumanizeQuery

  class Scarlett < UseCase::Base

    def perform
      context.user = User.random_user
    end

  end

end