module SampleApp
  module V0
    module UseCases
      module Users

        class RequireCurrentUser < UseCaseBase

          context_reader :current_user

          def perform
            failure!(:unauthorized) if current_user.blank?
          end

          def final
            if ctx.status.unauthorized?
              ctx.data = { error: 'Unauthorized' }
              ctx.http_status = 401
            end
          end

        end

      end
    end
  end
end
