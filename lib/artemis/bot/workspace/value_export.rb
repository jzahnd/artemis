module Artemis
  module Bot
    class Workspace < Olimpo::Base
      class ValueExport
        attr_reader :value_export

        def initialize(value_export = {})
          @value = value_export["value"]
          @metadata = value_export["metadata"]
          @created = value_export["created"]
          @updated = value_export["updated"]
          @synonyms = value_export["synonyms"]
        end

      end
    end
  end
end
