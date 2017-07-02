module Artemis
  module Bot
    class Workspace < Olimpo::Base
      class PaginationExample
        attr_reader :pagination

        def initialize(pagination = {})
          @refresh_url = pagination["refresh_url"]
          @next_url = pagination["next_url"]
          @total = pagination["total"]
          @matched = pagination["matched"]
        end

      end
    end
  end
end
