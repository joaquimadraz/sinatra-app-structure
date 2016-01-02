module SampleApp
  module V0
    module UseCases
      module Users

        class FindOne < UseCaseBase

          context_reader :id, :twitter_uid, :user

          def perform

            if !user

              if twitter_uid
                context.user = User.find_by(twitter_uid: twitter_uid)
              end

              if id
                context.user = User.find(id)
              end

            end

          end

        end

      end
    end
  end
end
