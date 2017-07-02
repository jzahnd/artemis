require "artemis/bot/workspace/value_export"

module Artemis
  module Bot
    class Workspace < Olimpo::Base
      class EntityExport
        attr_reader :entity

        def initialize(entity = {})
          @entity = entity["entity"]
          @created = entity["created"]
          @updated = entity["updated"]
          @description = entity["description"]
          @metadata = entity["metadata"]
          @fuzzy_match = entity["fuzzy_match"]
          @values = []
          build_values(entity["values"]) if entity["values"] != nil
        end

        def build_values(values)
          values.each do |value|
            @values << Artemis::Bot::Workspace::ValueExport.new(value)
          end
        end

      end
    end
  end
end
