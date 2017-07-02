$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'artemis/bot'
require 'artemis/bot/workspace'
require 'artemis/bot/workspace/workspace_example'
require 'artemis/bot/workspace/workspace_collection'
require 'artemis/bot/workspace/workspace_export'
require "simplecov"
SimpleCov.start
