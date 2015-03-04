module Sinatra
  module SessionAuth

    module Helpers

      def authenticated?
        true
      end

    end

    def self.registered(app)
      app.helpers SessionAuth::Helpers
    end

  end

end
