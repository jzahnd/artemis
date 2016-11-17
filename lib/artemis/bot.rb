require 'artemis/bot/version'
require 'artemis/bot/message_request'
require 'artemis/bot/input'
require 'active_support/dependencies'
require 'httmultiparty'

module Artemis
  module Bot
    autoload :Conversator, 'artemis/bot/conversator'

    # Username for authentication
    mattr_accessor :username
    @@username = nil

    # Password for authentication
    mattr_accessor :password
    @@password = nil

    # Method to set the authentication keys for the bot
    def self.configure
      yield self
    end
  end
end
