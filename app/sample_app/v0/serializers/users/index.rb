module SampleApp
  module V0
    module Serializers
      module Users

        class Index < Serializers::Base

          attributes :page,
                     :per_page

          has_many :users, serializer: Show

        end

      end
    end
  end
end
