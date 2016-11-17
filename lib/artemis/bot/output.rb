module Artemis
  module Bot
    class Output
      attr_reader :text, :nodes_visited

      def initialize(attrs = {})
        @text = attrs['text']
        @nodes_visited = attrs['nodes_visited']
      end
    end
  end
end
