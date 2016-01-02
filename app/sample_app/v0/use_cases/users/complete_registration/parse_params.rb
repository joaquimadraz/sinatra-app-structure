module SampleApp
  module V0
    module UseCases
      module Users
        module CompleteRegistration

          class ParseParams < UseCaseBase

            context_reader :user_attributes

            def perform
              context.user_attributes = user_attributes.slice('email')
              context.user_attributes['registration_complete'] = false

              current_user.assign_attributes(user_attributes)
            end

          end

        end
      end
    end
  end
end
