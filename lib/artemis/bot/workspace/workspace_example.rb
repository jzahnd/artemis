module Artemis
  module Bot
    class Workspace < Olimpo::Base
      class WorkspaceExample
        attr_reader :workspace

        def initialize(workspace = {})
          @workspace_id = workspace["workspace_id"]
          @name = workspace["name"]
          @language = workspace["language"]
          @created = workspace["created"]
          @updated = workspace["updated"]
          @description = workspace["description"]
          @metadata = workspace["metadata"]
        end

      end
    end
  end
end
