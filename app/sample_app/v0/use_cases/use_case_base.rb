module SampleApp
  module V0
    module UseCases

      class UseCaseBase < RestMyCase::Base

        include RestMyCase::HttpStatus

        context_reader :current_user

        alias_method :ctx, :context

      end

    end
  end
end
