require 'artemis/bot/intent'

module Artemis
  module Bot
    class IntentsResponse
      attr_reader :intents

      def initialize(attrs = {})
        @intents = attrs['intents'].map { |intent| Artemis::Bot::Intent.new(intent) }
      end
    end
  end
end
