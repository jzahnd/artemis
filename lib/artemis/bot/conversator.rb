require 'artemis/bot/response'
require 'artemis/bot/message_request'
require 'artemis/services/object_to_hash'

module Artemis
  module Bot
    class Conversator < Olimpo::Base
      headers 'Content-Type' => 'application/json'

      def self.message(workspace_id, message_request = Artemis::Bot::MessageRequest.new)
        message_request_hash = Artemis::Services::ObjectToHash.convert(message_request, include_nils: false)

        response = post("/v1/workspaces/#{workspace_id}/message?version=2016-09-20",
                        body: message_request_hash.to_json)

        parsed_response = JSON.parse(response.body)

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
