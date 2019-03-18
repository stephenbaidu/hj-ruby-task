class DetectCampaignDiff < ServiceBase
  def initialize(local_campaign, remote_campaign)
    @local_campaign = local_campaign
    @remote_campaign = remote_campaign
    @result = {}
  end

  def call
    @result[:status] = status_diff if status_out_of_sync?
    @result[:description] = description_diff if description_out_of_sync?
    @result[:out_of_sync] = !@result.keys.count.zero? # false if neither status or description diff is set

    @result
  end

  private

  def status_out_of_sync?
    local_status = @local_campaign.status
    remote_status = @remote_campaign.status

    if (remote_status == 'enabled' && local_status == 'active') ||
       (remote_status == 'disabled' && local_status == 'paused')
      false
    else
      true
    end
  end

  def description_out_of_sync?
    @local_campaign.ad_description != @remote_campaign.description
  end

  def status_diff
    {
      remote: @remote_campaign.status,
      local: @local_campaign.status
    }
  end

  def description_diff
    {
      remote: @remote_campaign.description,
      local: @local_campaign.ad_description
    }
  end
end
