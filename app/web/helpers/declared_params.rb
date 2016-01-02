module SampleApp
  module Helpers

    module DeclaredParams

      def compel!(schema)
        params.delete('splat')
        params.delete('captures')

        params.merge! Compel.run!(params, Compel.hash.keys(schema))
      end

      def declared_params(namespace = nil)
        _declared_params = params.merge({
          current_user: current_user
        })

        if namespace
          _declared_params = declared_with_resource_attributes(_declared_params, namespace)
        end

        _declared_params
      end

      def declared_with_resource_attributes(declared_params, namespace)
        resource_name = "#{namespace}".singularize

        mappings = {
          "#{resource_name}" =>
          "#{resource_name}_attributes"
        }

        declared_params.keys.each do |k|
          if mappings[k]
            attributes = declared_params.delete(k).to_hash
            declared_params[mappings[k]] = attributes
          end
        end

        declared_params
      end

    end

  end
end
