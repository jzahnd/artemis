module Artemis
  module Bot
    class Context
      class System
        attr_reader :dialog_stack, :dialog_turn_counter, :dialog_request_counter

        def initialize(attrs = {})
          @dialog_stack = attrs['dialog_stack']
          @dialog_turn_counter = attrs['dialog_turn_counter']
          @dialog_request_counter = attrs['dialog_request_counter']
        end
      end
    end
  end
end
