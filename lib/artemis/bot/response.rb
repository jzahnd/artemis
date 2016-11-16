module Artemis
  module Bot
    class Response
      attr_reader :input, :context, :entities, :intents, :output

      def initialize(attrs = {})
        @input = attrs["input"]
        @context = attrs["context"]
        @entities = attrs["entities"]
        @intents = attrs["intents"]
        @output = attrs["output"]
      end
    end
  end
end
