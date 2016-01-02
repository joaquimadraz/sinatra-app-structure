module SampleApp
  module V0
    module Serializers

      class Base < ActiveModel::Serializer

        root false

        def self.to_hash(object, options = {})
          new(object, options).serializable_hash
        end

        def initialize(object, options = {})
          @options = options
          super
        end

        def attributes
          super.tap do |attrs|
            if object.errors.present?
              attrs[:errors] = object.errors.to_hash
            end
          end
        end

      end

    end
  end
end
