class RemoteCampaign < ModelBase
  attr_reader :reference, :status, :description

  class << self
    def attributes
      %i[reference status description]
    end

    def all
      @all ||= LoadRemoteCampaigns.call
    end
  end

  def initialize(reference, status, description)
    @reference = reference
    @status = status
    @description = description
  end
end
