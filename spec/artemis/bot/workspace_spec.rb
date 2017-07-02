require 'spec_helper'

describe Artemis::Bot::Workspace do
  describe "API Methods" do
    describe ".create" do
      it "should return information about the new workspace" do
        stub_response = WorkspaceExampleResponse.new
        allow(Artemis::Bot::Workspace).to receive(:post).and_return(stub_response)

        expect(Artemis::Bot::Workspace.create({})).to be_a_kind_of(Artemis::Bot::Workspace::WorkspaceExample)
      end
    end
    describe ".all" do
      it "should return a list of the workspaces" do
        stub_response = LisOfWorkspacesExampleResponse.new
        allow(Artemis::Bot::Workspace).to receive(:get).and_return(stub_response)

        expect(Artemis::Bot::Workspace.all({})).to be_a_kind_of(Artemis::Bot::Workspace::WorkspaceCollection)
      end
    end
    describe ".find" do
      it "should return information about a specific workspace" do
        stub_response = WorkspaceExampleResponse.new
        allow(Artemis::Bot::Workspace).to receive(:get).and_return(stub_response)

        expect(Artemis::Bot::Workspace.find({})).to be_a_kind_of(Artemis::Bot::Workspace::WorkspaceExport)
      end
    end
    describe ".update" do
      it "should return information about the updated workspace" do
        stub_response = WorkspaceExampleResponse.new
        allow(Artemis::Bot::Workspace).to receive(:post).and_return(stub_response)

        expect(Artemis::Bot::Workspace.update({})).to be_a_kind_of(Artemis::Bot::Workspace::WorkspaceExample)
      end
    end
    describe ".destroy" do
      it "should delete a workspace" do
        stub_response = DeleteWorkspaceExampleResponse.new
        allow(Artemis::Bot::Workspace).to receive(:delete).and_return(stub_response)

        expect(Artemis::Bot::Workspace.destroy({})).to eq(true)
      end
    end
  end
end

class WorkspaceExampleResponse
  def body
    '{
      "application/json": {
        "name": "Pizza app",
        "created": "2015-12-06T23:53:59.153Z",
        "language": "en",
        "metadata": {},
        "updated": "2015-12-06T23:53:59.153Z",
        "description": "Pizza app",
        "workspace_id": "pizza_app-e0f3"
      }
    }'
  end

  def success?
    true
  end
end

class LisOfWorkspacesExampleResponse
  def body
    '{
      "application/json": {
        "workspaces": [
          {
            "name": "Pizza app",
            "created": "2015-12-06T23:53:59.153Z",
            "language": "en",
            "metadata": {},
            "updated": "2015-12-06T23:53:59.153Z",
            "description": "Pizza app",
            "workspace_id": "pizza_app-e0f3"
          }
        ],
        "pagination": {
          "refresh_url": "/v1/workspaces?version=2016-01-24&page_limit=1",
          "next_url": "/v1/workspaces?cursor=base64=&version=2016-01-24&page_limit=1"
        }
      }
    }'
  end

  def success?
    true
  end
end

class DeleteWorkspaceExampleResponse
  def success?
    true
  end
end
