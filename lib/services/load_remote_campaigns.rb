class LoadRemoteCampaigns < ServiceBase
  AD_SERVICE_API_URL = 'https://mockbin.org/bin/fcb30500-7b98-476f-810d-463a0b8fc3df'.freeze

  def call
    data['ads'].map do |row|
      reference, status, description = row.values_at('reference', 'status', 'description')
      RemoteCampaign.new(reference, status, description)
    end
  end

  private

  def data
    @data ||= RemoteJsonData.call(AD_SERVICE_API_URL)
  end
end
