module Artemis
  module Bot
    class Entity
      attr_reader :entity, :location, :value, :confidence

      def initialize(attrs = {})
        @entity = attrs['entity']
        @location = attrs['location']
        @value = attrs['value']
        @confidence = attrs['confidence']
      end
    end
  end
end
