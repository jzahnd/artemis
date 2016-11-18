require 'artemis/bot/version'
require 'artemis/bot/message_request'
require 'artemis/bot/input'
require "olimpo"
require 'active_support/dependencies'
require 'httmultiparty'

module Artemis
  module Bot
    extend Olimpo
    autoload :Conversator, 'artemis/bot/conversator'
  end
end
