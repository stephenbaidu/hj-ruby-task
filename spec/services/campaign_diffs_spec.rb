require 'spec_helper'

RSpec.describe CampaignDiffs do
  let(:load_campaign_1) { Campaign.new(1, 1, 'active', '1', 'Description 1') }
  let(:load_campaign_2) { Campaign.new(2, 1, 'paused', '2', 'Description 2') }
  let(:load_campaign_3) { Campaign.new(3, 1, 'active', '3', 'Description') }
  let(:remote_campaigns) do
    [
      RemoteCampaign.new('1', 'enabled', 'Description'),
      RemoteCampaign.new('2', 'enabled', 'Description'),
      RemoteCampaign.new('3', 'enabled', 'Description')
    ]
  end
  let(:result) do
    [
      ['1', {
        out_of_sync: true,
        description: {
          local: 'Description 1',
          remote: 'Description'
        }
      }],
      ['2', {
        out_of_sync: true,
        description: {
          local: 'Description 2',
          remote: 'Description'
        },
        status: {
          local: 'paused',
          remote: 'enabled'
        }
      }],
      ['3', {
        out_of_sync: false
      }]
    ]
  end
  let(:service) { CampaignDiffs.new }

  before do
    allow(Campaign).to receive(:find_by_external_reference).with('1').and_return(load_campaign_1)
    allow(Campaign).to receive(:find_by_external_reference).with('2').and_return(load_campaign_2)
    allow(Campaign).to receive(:find_by_external_reference).with('3').and_return(load_campaign_3)
    allow(RemoteCampaign).to receive(:all).and_return(remote_campaigns)
  end

  describe '#call' do
    it 'returns remote_reference/diff pairs' do
      expect(service.call).to match_array(result)
    end
  end
end
