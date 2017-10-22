require 'spec_helper'

describe Artemis::Bot::Workspace do
  let(:workspace_attrs) do
    {
      'name'              => 'Car_Dashboard',
      'created'           => '2016-07-13T12:26:55.781Z',
      'update'            => '2016-11-29T21:46:38.969Z',
      'metadata'          =>   {
        'runtime_version' => "2017-05-26"
      },
      'description'       => 'A car workspace',
      'workspace_id'      => '0a0c06c1-8e31-4655-9067-58fcac5134fc',
      'learning_opt_out'  => false
    }
  end

  let(:subject) { Artemis::Bot::Workspace.new(workspace_attrs) }

  describe 'attributes' do
    it { is_expected.to have_attributes(name: workspace_attrs['name']) }
    it { is_expected.to have_attributes(language: workspace_attrs['language']) }
    it { is_expected.to have_attributes(created: workspace_attrs['created']) }
    it { is_expected.to have_attributes(updated: workspace_attrs['updated']) }
    it { is_expected.to have_attributes(description: workspace_attrs['description']) }
    it { is_expected.to have_attributes(workspace_id: workspace_attrs['workspace_id']) }
    it { is_expected.to have_attributes(metadata: workspace_attrs['metadata']) }
    it { is_expected.to have_attributes(learning_opt_out: workspace_attrs['learning_opt_out']) }

  end
end
