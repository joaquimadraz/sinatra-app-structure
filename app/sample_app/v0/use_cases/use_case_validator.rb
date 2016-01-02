module SampleApp
  module V0
    module UseCases

      class UseCaseValidator < RestMyCase::Validator

        context_reader :current_user

        alias_method :ctx, :context

        def validate_url_format_for(attribute)
          if !uri_regex.match(target.send(attribute))
            target.errors.add(attribute, 'invalid url format')
          end
        end

        def uri_regex
          /^(http|https):\/\/|[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,6}(:[0-9]{1,5})?(\/.*)?$/ix
        end

      end

    end
  end
end
