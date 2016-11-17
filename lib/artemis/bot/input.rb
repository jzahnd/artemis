module Artemis
  module Bot
    class Input
      attr_accessor :text

      def initialize(attrs = {})
        @text = attrs['text']
      end
    end
  end
end
