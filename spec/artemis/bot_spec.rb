require 'spec_helper'
require "pry"

describe Artemis::Bot do
  it 'has a version number' do
    expect(Artemis::Bot::VERSION).not_to be nil
  end
end
