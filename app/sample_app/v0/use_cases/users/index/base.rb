module SampleApp
  module V0
    module UseCases
      module Users
        module Index

          class Base < UseCaseBase

            depends Users::RequireCurrentUser,
                    UseCases::Index

            context_reader :page,
                           :per_page

            def perform
              ctx.users = User.page(page).per(per_page).all
            end

            def final
              ctx.data = Serializers::Users::Index.to_hash(ctx)
            end

          end

        end
      end
    end
  end
end
