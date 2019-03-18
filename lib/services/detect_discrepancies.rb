class DetectDiscrepancies < ServiceBase
  def initialize
    @result = []
  end

  def call
    campaign_diffs.each do |remote_reference, diff|
      next unless diff[:out_of_sync]

      @result << {
        remote_reference: remote_reference,
        discrepancies: diff.slice(:status, :description)
      }
    end

    @result
  end

  private

  def campaign_diffs
    @campaign_diffs ||= CampaignDiffs.call
  end
end
