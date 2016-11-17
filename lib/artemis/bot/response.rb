require 'artemis/bot/input'
require 'artemis/bot/entity'
require 'artemis/bot/context'
require 'artemis/bot/intent'
require 'artemis/bot/output'

module Artemis
  module Bot
    class Response
      attr_reader :input, :context, :entities, :intents, :output

      def initialize(attrs = {})
        @input = Artemis::Bot::Input.new(attrs['input'])
        @context = Artemis::Bot::Context.new(attrs['context'])
        @entities = attrs['entities'].map { |entity| Artemis::Bot::Entity.new(entity) }
        @intents = attrs['intents'].map { |intent| Artemis::Bot::Intent.new(intent) }
        @output = Artemis::Bot::Output.new(attrs['output'])
      end
    end
  end
end
