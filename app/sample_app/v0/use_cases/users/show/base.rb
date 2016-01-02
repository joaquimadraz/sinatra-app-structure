module SampleApp
  module V0
    module UseCases
      module Users
        module Show

          class Base < UseCaseBase

            depends Users::FindOne

            context_reader :user

            def final
              ctx.data = Serializers::Users::Show.to_hash(user)
            end

          end

        end
      end
    end
  end
end
