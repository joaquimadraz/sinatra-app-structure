module HumanizeQuery

  class Base < UseCase::Base

    depends Scarlett

    def perform
      { error: false, message: "#{context.user} is comming." }
    end

  end

end