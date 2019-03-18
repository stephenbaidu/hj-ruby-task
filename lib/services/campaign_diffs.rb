class CampaignDiffs < ServiceBase
  def call
    remote_campaigns.map do |remote_campaign|
      remote_reference = remote_campaign.reference
      local_campaign = Campaign.find_by_external_reference(remote_reference)
      diff = DetectCampaignDiff.call(local_campaign, remote_campaign)
      [remote_reference, diff]
    end
  end

  private

  def remote_campaigns
    @remote_campaigns ||= RemoteCampaign.all
  end
end
