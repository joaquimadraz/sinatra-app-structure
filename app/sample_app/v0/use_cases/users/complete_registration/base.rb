module SampleApp
  module V0
    module UseCases
      module Users
        module CompleteRegistration

          class Base < UseCaseBase

            depends Users::RequireCurrentUser,
                    ParseParams,
                    Validate

            context_reader :user_attributes

            def perform
              user_attributes['registration_complete'] = true

              if !current_user.update_attributes(user_attributes)
                failure!(:unprocessable_entity)
              end
            end

            def final
              ctx.data = Serializers::Users::Show.to_hash(current_user)
            end

          end

        end
      end
    end
  end
end
