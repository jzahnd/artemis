module Artemis
  module Bot
    class Intent
      attr_reader :intent, :confidence

      def initialize(attrs = {})
        @intent = attrs['intent']
        @confidence = attrs['confidence']
      end
    end
  end
end
