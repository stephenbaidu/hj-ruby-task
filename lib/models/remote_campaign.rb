class RemoteCampaign < ModelBase
  attr_reader :reference, :status, :description

  class << self
    def attributes
      %i[reference status description]
    end

    def all
      @all ||= []
    end
  end

  def initialize(reference, status, description)
    @reference = reference
    @status = status
    @description = description
  end
end
