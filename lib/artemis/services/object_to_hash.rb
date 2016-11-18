module Artemis
  module Services
    module ObjectToHash
      def self.convert(object, opts = { include_nils: true })
        hash = {}
        object.instance_variables.each do |var|
          var_value = object.instance_variable_get(var)

          next if !opts['include_nils'] && var_value.nil?

          hash[var.to_s.delete('@')] = if descendant?(var_value, Artemis::Bot)
                                         convert(var_value)
                                       else
                                         hash[var.to_s.delete('@')] = var_value
                                       end
        end

        hash
      end

      def self.descendant?(value, parent)
        parent = parent.class unless parent.is_a?(Class) || parent.is_a?(Module)
        value.class.to_s.index("#{parent}::").present?
      end
    end
  end
end
