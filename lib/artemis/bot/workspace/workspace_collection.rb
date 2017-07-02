require "artemis/bot/workspace/workspace_example"
require "artemis/bot/workspace/pagination_example"

module Artemis
  module Bot
    class Workspace < Olimpo::Base
      class WorkspaceCollection
        attr_reader :workspaces, :pagination

        def initialize(attrs = {})
          @workspaces = []
          @pagination = Artemis::Bot::Workspace::PaginationExample.new(attrs["pagination"]) if attrs["pagination"] != nil
          build_workspaces(attrs["workspaces"]) if attrs["workspaces"] != nil
        end

        def build_workspaces(workspaces)
          workspaces.each do |workspace|
            @workspaces << Artemis::Bot::Workspace::WorkspaceExample.new(workspace)
          end
        end
      end
    end
  end
end
