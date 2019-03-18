require 'spec_helper'

RSpec.describe LoadRemoteCampaigns do
  let(:fake_json_data) do
    {
      'ads' => [
        { 'reference' => '1', 'status' => 'enabled', 'description' => 'Description 1' },
        { 'reference' => '2', 'status' => 'disabled', 'description' => 'Description 2' }
      ]
    }
  end
  let(:service) { LoadRemoteCampaigns.new }

  before do
    allow_any_instance_of(RemoteJsonData).to receive(:call).and_return(fake_json_data)
  end

  describe '#call' do
    it 'returns 2 remote_campaign objects' do
      array = [
        RemoteCampaign.new('1', 'enabled', 'Description 1'),
        RemoteCampaign.new('2', 'disabled', 'Description 2')
      ]
      expect(service.call.count).to eq(2)
      expect(service.call).to match_array(array)
    end
  end
end
