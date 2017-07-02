module Artemis
  module Bot
    class Workspace < Olimpo::Base
      class DialogNode
        attr_reader :dialog_node

        def initialize(dialog_node = {})
          @dialog_node = dialog_node["dialog_node"]
        end

      end
    end
  end
end
