require "artemis/bot/workspace/intent_export"
require "artemis/bot/workspace/entity_export"
require "artemis/bot/workspace/counterexample"
require "artemis/bot/workspace/dialog_node"

module Artemis
  module Bot
    class Workspace < Olimpo::Base
      class WorkspaceExport
        attr_reader :workspace

        def initialize(workspace = {})
          @workspace_id = workspace["workspace_id"]
          @name = workspace["name"]
          @language = workspace["language"]
          @created = workspace["created"]
          @updated = workspace["updated"]
          @description = workspace["description"]
          @metadata = workspace["metadata"]
          @status = workspace["status"]
          @intents = []
          @entities = []
          @counterexamples = []
          @dialog_nodes = []
          build_intents(workspace["intents"]) if workspace["intents"] != nil
          build_entities(workspace["entities"]) if workspace["entities"] != nil
          build_counterexamples(workspace["counterexamples"]) if workspace["counterexamples"] != nil
          build_dialog_nodes(workspace["dialog_nodes"]) if workspace["dialog_nodes"] != nil
        end

        def build_intents(intents)
          intents.each do |intent|
            @intents << Artemis::Bot::Workspace::IntentExport.new(intent)
          end
        end

        def build_entities(entities)
          entities.each do |entity|
            @entities << Artemis::Bot::Workspace::EntityExport.new(entity)
          end
        end

        def build_counterexamples(counterexamples)
          counterexamples.each do |counterexample|
            @counterexamples << Artemis::Bot::Workspace::Counterexample.new(counterexample)
          end
        end

        def build_dialog_nodes(dialog_nodes)
          dialog_nodes.each do |dialog_node|
            @dialog_nodes << Artemis::Bot::Workspace::DialogNode.new(dialog_node)
          end
        end

      end
    end
  end
end
