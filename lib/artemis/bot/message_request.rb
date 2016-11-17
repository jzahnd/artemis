require 'artemis/bot/input'

module Artemis
  module Bot
    class MessageRequest
      attr_accessor :input, :alternate_intents, :context, :entities, :intents, :output

      def initialize(attrs = {})
        @input = attrs['input'] || Artemis::Bot::Input.new
        @alternate_intents = attrs['alternate_intents']
        @context = attrs['context']
        @entities = attrs['entities']
        @intents = attrs['intents']
        @output = attrs['output']
      end
    end
  end
end
