module Artemis
  module Bot
    class Workspace < Olimpo::Base
      class Counterexample
        attr_reader :counterexample

        def initialize(counterexample = {})
          @text = counterexample["text"]
          @created = counterexample["created"]
          @updated = counterexample["updated"]
        end

      end
    end
  end
end
