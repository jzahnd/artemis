module Artemis
  module Bot
    class Entity
      attr_reader :entity, :location, :value

      def initialize(attrs = {})
        @entity = attrs['entity']
        @location = attrs['location']
        @value = attrs['value']
      end
    end
  end
end
