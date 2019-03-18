require 'spec_helper'

RSpec.describe DetectCampaignDiff do
  let(:local_status) { 'active' }
  let(:remote_status) { 'enabled' }
  let(:local_description) { 'Description' }
  let(:remote_description) { 'Description' }
  let(:local_campaign) do
    Campaign.new(1, 2, local_status, 1, local_description)
  end
  let(:remote_campaign) do
    RemoteCampaign.new(1, remote_status, remote_description)
  end
  let(:service) { DetectCampaignDiff.new(local_campaign, remote_campaign) }

  context 'when local/remote status pair is active/enabled' do
    it 'returns out_of_sync as false' do
      result = service.call
      expect(result[:out_of_sync]).to be false
    end
  end

  context 'when local/remote status pair is active/disabled' do
    let(:local_status) { 'active' }
    let(:remote_status) { 'disabled' }

    it 'returns out_of_sync as true' do
      result = service.call
      expect(result[:out_of_sync]).to be true
    end
  end

  context 'when local/remote status pair is paused/enabled' do
    let(:local_status) { 'paused' }
    let(:remote_status) { 'enabled' }

    it 'returns out_of_sync as true' do
      result = service.call
      expect(result[:out_of_sync]).to be true
    end
  end

  context 'when local/remote status pair is paused/disabled' do
    let(:local_status) { 'paused' }
    let(:remote_status) { 'disabled' }

    it 'returns out_of_sync as false' do
      result = service.call
      expect(result[:out_of_sync]).to be false
    end
  end

  context 'when local/remote description pair differs' do
    let(:local_description) { 'Desc' }
    let(:remote_description) { 'Description' }

    it 'returns out_of_sync as true' do
      result = service.call
      expect(result[:out_of_sync]).to be true
    end
  end
end
