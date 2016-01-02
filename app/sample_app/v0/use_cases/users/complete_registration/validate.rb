module SampleApp
  module V0
    module UseCases
      module Users
        module CompleteRegistration

          class Validate < UseCaseValidator

            target :current_user

            validate :email

            def email(user)
              if !(/\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/.match(user.email))
                user.errors.add(:email, :invalid)
              end
            end

          end

        end
      end
    end
  end
end
