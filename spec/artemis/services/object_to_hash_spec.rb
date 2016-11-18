require 'spec_helper'

describe Artemis::Services::ObjectToHash do

  it "converts Artemis::Bot::MessageRequest without context to a hash excluding nils" do
    message = Artemis::Bot::MessageRequest.new
    message.input.text = "Hey"
    message.alternate_intents = true

    message_hash = Artemis::Services::ObjectToHash.convert(message, {include_nils: false})

    expect(message_hash).to eq({"input"=>{"text"=>"Hey"}, "alternate_intents"=>true})
  end

  it "converts Artemis::Bot::MessageRequest with context to a hash" do
    context = Artemis::Bot::Context.new({"conversation_id" => 12345,
                                         "system"=> { "dialog_stack" =>[{"dialog_node"=>"node_1_1479165819302"}],
                                                      "dialog_turn_counter"=>1,
                                                      "dialog_request_counter"=>1} })
    message = Artemis::Bot::MessageRequest.new
    message.input.text = "Hey"
    message.alternate_intents = true
    message.context = context

    message_hash = Artemis::Services::ObjectToHash.convert(message, {include_nils: false})
    expect(message_hash).to eq({ "input"=>{"text"=>"Hey"},
                                 "alternate_intents"=>true,
                                 "context"=> {"conversation_id"=>12345,
                                              "system"=>{"dialog_stack"=>[{"dialog_node"=>"node_1_1479165819302"}],
                                                         "dialog_turn_counter"=>1,
                                                         "dialog_request_counter"=>1}}})
  end

end
