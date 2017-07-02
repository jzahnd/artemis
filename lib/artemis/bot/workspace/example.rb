module Artemis
  module Bot
    class Workspace < Olimpo::Base
      class Example
        attr_reader :example

        def initialize(example = {})
          @text = example["text"]
          @created = example["created"]
          @updated = example["updated"]
        end

      end
    end
  end
end
