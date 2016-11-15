module Artemis
  module Bot
    module Connection
      def self.included klass
        klass.class_eval do
          include HTTMultiParty
          base_uri "https://gateway.watsonplatform.net/conversation/api"
          headers 'Content-Type' => 'application/json'
          basic_auth Artemis::Bot.username, Artemis::Bot.password
          debug_output $stdout
        end
      end
    end
  end
end
