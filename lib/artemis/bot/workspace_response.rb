require 'artemis/bot/workspace'

module Artemis
  module Bot
    class WorkspaceResponse
      attr_reader :workspaces

      def initialize(attrs = {})
        @workspaces = attrs['workspaces'].map { |workspace| Artemis::Bot::Workspace.new(workspace) }
      end
    end
  end
end
