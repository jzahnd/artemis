require "artemis/bot/workspace/example"

module Artemis
  module Bot
    class Workspace < Olimpo::Base
      class IntentExport
        attr_reader :intent

        def initialize(intent = {})
          @intent = intent["intent"]
          @created = intent["created"]
          @updated = intent["updated"]
          @description = intent["description"]
          @examples = []
          build_examples(intent["examples"]) if intent["examples"] != nil
        end

        def build_examples(examples)
          examples.each do |example|
            @examples << Artemis::Bot::Workspace::Example.new(example)
          end
        end

      end
    end
  end
end
