module SampleApp
  module V0
    module Serializers
      module Users

        class Show < Serializers::Base

          attributes :id,
                     :name,
                     :email,
                     :avatar_url,
                     :twitter_handler,
                     :registration_complete

        end

      end
    end
  end
end
