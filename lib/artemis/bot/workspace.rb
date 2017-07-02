require "artemis/bot/workspace/workspace_example"
require "artemis/bot/workspace/workspace_collection"
require "artemis/bot/workspace/workspace_export"

module Artemis
  module Bot
    class Workspace < Olimpo::Base
      def self.create(query = {}, body = {})
        response = post("/workspaces", query: query, body: body)
        parsed_response = JSON.parse(response.body)

        return Artemis::Bot::Workspace::WorkspaceExample.new(parsed_response) if response.success?
        raise_exception(response.code, response.body)
      end

      def self.all(query = {})
        response = get("/workspaces", query: query)
        parsed_response  = JSON.parse(response.body)

        return Artemis::Bot::Workspace::WorkspaceCollection.new(parsed_response) if response.success?
        raise_exception(response.code, response.body)
      end

      def self.find(id, query = {})
        response = get("/workspaces/#{id}", query: query)
        parsed_response = JSON.parse(response.body)

        return Artemis::Bot::Workspace::WorkspaceExport.new(parsed_response) if response.success?
        raise_exception(response.code, response.body)
      end

      def self.update(id, query = {}, body = {})
        response = post("/workspaces/#{id}", query: query, body: body)
        parsed_response = JSON.parse(response.body)

        return Artemis::Bot::Workspace::WorkspaceExample.new(parsed_response) if response.success?
        raise_exception(response.corde, response.body)
      end

      def self.destroy(id, query = {})
        response = delete("/workspaces/#{id}", query: query)
        response.success?
      end
    end
  end
end
