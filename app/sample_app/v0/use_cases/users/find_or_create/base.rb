module SampleApp
  module V0
    module UseCases
      module Users
        module FindOrCreate

          class Base < UseCaseBase

            context_reader :twitter_uid,
                           :omniauth_data

            def perform
              context.user = \
                Users::FindOne.perform(twitter_uid: twitter_uid).user

              context.user = persist_user if !context.user
            end

            def persist_user
              User.create \
                name: omniauth_data['info']['name'],
                avatar_url: omniauth_data['info']['image'],
                twitter_uid: twitter_uid,
                twitter_handler: omniauth_data['info']['nickname'],
                registration_complete: false
            end

          end

        end
      end
    end
  end
end
