module SampleApp
  module Helpers

    module CurrentUser

      def halt_with_401_current_user_not_found
        halt 401
      end

      def authorize
        halt_with_401_current_user_not_found if !current_user?
      end

      def current_user
        return @current_user if @current_user.present?

        if current_user_id > 0
          @current_user ||= V0::UseCases::Users::FindOne.perform(id: current_user_id).user rescue nil
        end
      end

      def current_user?
        current_user_id > 0
      end

      def current_user_id
        Float(session[:user_id]).to_i rescue -1
      end

    end

  end
end
