require "artemis/bot/response"
require "artemis/bot/connection"
require "artemis/bot/errors"

module Artemis
  module Bot
    class Conversator
      include Artemis::Bot::Connection

      def self.message(workspace_id, params = {})
        response = post("/v1/workspaces/#{workspace_id}/message?version=2016-09-20", body: params.to_json)

        parsed_response  = JSON.parse(response.body)

        return Artemis::Bot::Response.new(parsed_response) if response.success?

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
