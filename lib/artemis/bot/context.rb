require 'artemis/bot/context/system'

module Artemis
  module Bot
    class Context
      attr_reader :conversation_id, :system, :default_counter

      def initialize(attrs = {})
        @conversation_id = attrs['conversation_id']
        @system = Artemis::Bot::Context::System.new(attrs['system'])
        @default_counter = attrs['defaultCounter']
      end
    end
  end
end
