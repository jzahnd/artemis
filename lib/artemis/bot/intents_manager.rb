require 'artemis/bot/errors'
require 'artemis/bot/intents_response'
require 'artemis/services/object_to_hash'

module Artemis
  module Bot
    class IntentsManager < Olimpo::Base
      headers 'Content-Type' => 'application/json'

      def self.intents(workspace_id)
        response = get("/v1/workspaces/#{workspace_id}/intents?version=2017-05-26")

        parsed_response = JSON.parse(response.body)
        return Artemis::Bot::IntentsResponse.new(parsed_response) if response.success?

        raise_exception(response.code, response.body)
      end

      private

      def self.raise_exception(code, body)
        raise Artemis::Bot::ServerError.new(code, body) if code >= 500
        raise Artemis::Bot::ClientError.new(code, body) if code < 500
      end
    end
  end
end
