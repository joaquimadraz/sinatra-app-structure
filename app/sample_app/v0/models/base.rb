module SampleApp
  module V0

    class Base < ActiveRecord::Base

      self.abstract_class = true

      default_scope { order('created_at DESC') }

      def methods_to_hash(*args)
        {}.tap do |h|
          args.each do |key|
            h[key] = self.send(key)
          end
        end
      end

    end

  end
end

