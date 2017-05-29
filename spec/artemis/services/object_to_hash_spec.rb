require 'spec_helper'

describe Artemis::Services::ObjectToHash do

  before(:each) do
    @message = Artemis::Bot::MessageRequest.new
    @message.input.text = "Hey"
    @message.alternate_intents = true
  end

  describe ".convert" do
    it "converts Artemis::Bot::MessageRequest without context to a hash excluding nils" do
      message_hash = Artemis::Services::ObjectToHash.convert(@message, {include_nils: false})

      expect(message_hash).to eq({"input"=>{"text"=>"Hey"}, "alternate_intents"=>true})
    end

    it "converts Artemis::Bot::MessageRequest with context to a hash" do
      context = Artemis::Bot::Context.new({"conversation_id" => 12345,
                                           "system"=> { "dialog_stack" =>[{"dialog_node"=>"node_1_1479165819302"}],
                                                        "dialog_turn_counter"=>1,
                                                        "dialog_request_counter"=>1} })
      @message.context = context

      message_hash = Artemis::Services::ObjectToHash.convert(@message, {include_nils: false})
      expect(message_hash).to eq({ "input"=>{"text"=>"Hey"},
                                   "alternate_intents"=>true,
                                   "context"=> {"conversation_id"=>12345,
                                                "system"=>{"dialog_stack"=>[{"dialog_node"=>"node_1_1479165819302"}],
                                                           "dialog_turn_counter"=>1,
                                                           "dialog_request_counter"=>1}}})
    end
  end

  describe "#descendant?" do
    context "Artemis::Bot class with an existent value" do
      it "returns true" do
        input_var = @message.instance_variables.first
        var_value = @message.instance_variable_get(input_var)

        expect(var_value).to be_a_kind_of(Artemis::Bot::Input)
        expect(Artemis::Services::ObjectToHash.descendant?(var_value, Artemis::Bot)).to be_truthy
      end
    end

    context "Artemis::Bot class with an nonexistent value" do
      it "returns false" do
        output_var = @message.instance_variables.last
        var_value = @message.instance_variable_get(output_var)

        expect(var_value).to be_nil
        expect(Artemis::Services::ObjectToHash.descendant?(var_value, Artemis::Bot)).to be_falsey
      end
    end

    context "Non Artemis::Bot class with an existent value" do
      it "returns false" do
        alternate_intents_var = @message.instance_variables[1]
        var_value = @message.instance_variable_get(alternate_intents_var)

        expect(var_value).to be_a_kind_of(TrueClass)
        expect(Artemis::Services::ObjectToHash.descendant?(var_value, Artemis::Bot)).to be_falsey
      end
    end
  end
end
