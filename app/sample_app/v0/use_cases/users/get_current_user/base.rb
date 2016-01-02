module SampleApp
  module V0
    module UseCases
      module Users
        module GetCurrentUser

          class Base < UseCaseBase

            depends Users::RequireCurrentUser

            def final
              if ctx.ok?
                ctx.data = Serializers::Users::Show.to_hash(current_user)
              end
            end

          end

        end
      end
    end
  end
end
