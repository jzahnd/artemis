require 'spec_helper'

describe Artemis::Bot::Conversator do

  it 'parses #message response' do
    allow(Artemis::Bot::Conversator).to receive(:post).and_return(ExampleResponse.new)

    workspace_id =  "example-workspace-id"

    message_request = Artemis::Bot::MessageRequest.new
    message_request.input.text = "Hello there"
    message_request.alternate_intents = true

    response = Artemis::Bot::Conversator.message(workspace_id, message_request)

    #Input
    input = response.input
    expect(input).to be_a_kind_of(Artemis::Bot::Input)
    expect(input.text).to eq("Turn on the lights")

    #Context
    context = response.context
    expect(context).to be_a_kind_of(Artemis::Bot::Context)
    expect(context.conversation_id).to eq("f1ab5f76-f41b-47b4-a8dc-e1c32b925b79")
    expect(context.system).to be_a_kind_of(Artemis::Bot::Context::System)
    expect(context.system.dialog_stack).to eq([{"dialog_node" => "root"}])
    expect(context.system.dialog_turn_counter).to eq(2)
    expect(context.system.dialog_request_counter).to eq(2)
    expect(context.default_counter).to eq(0)

    #Entities
    entity = response.entities[0]
    expect(entity).to be_a_kind_of(Artemis::Bot::Entity)
    expect(entity.entity).to eq("appliance")
    expect(entity.location).to eq([12, 18])
    expect(entity.value).to eq("light")

    #Intent
    intent = response.intents[0]
    expect(intent).to be_a_kind_of(Artemis::Bot::Intent)
    expect(intent.intent).to eq("turn_on")
    expect(intent.confidence).to eq(0.8362587462307721)

    #Output
    output = response.output
    expect(output).to be_a_kind_of(Artemis::Bot::Output)
    expect(output.text).to eq(["Ok. Turning on the light."])
    expect(output.nodes_visited).to eq(["node_1_1467221909631", "node_2_1467232480480"])
  end

  class ExampleResponse
    def success?
      true
    end

    def body
      {
        "input" => {
          "text" => "Turn on the lights"
        },
        "context" => {
          "conversation_id" => "f1ab5f76-f41b-47b4-a8dc-e1c32b925b79",
          "system" => {
            "dialog_stack" => [
              {
                "dialog_node" => "root"
              }
            ],
            "dialog_turn_counter" => 2,
            "dialog_request_counter" => 2
          },
          "defaultCounter" => 0
        },
        "entities" => [
          {
            "entity" => "appliance",
            "location" => [12, 18],
            "value" => "light"
          }
        ],
        "intents" => [
          {
            "intent" => "turn_on",
            "confidence" => 0.8362587462307721
          }
        ],
        "output" => {
          "text" => [
            "Ok. Turning on the light."
          ],
          "nodes_visited" => [
            "node_1_1467221909631",
            "node_2_1467232480480"
          ]
        }
      }.to_json
    end
  end
end
