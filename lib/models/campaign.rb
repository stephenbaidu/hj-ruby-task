class Campaign < ModelBase
  attr_reader :id, :job_id, :status, :external_reference, :ad_description

  class << self
    def attributes
      %i[id job_id status external_reference ad_description]
    end

    def all
      @all ||= load_campaigns
    end

    def find_by_external_reference(reference)
      all.find { |campaign| campaign.external_reference == reference.to_s }
    end

    private

    def load_campaigns
      query = 'SELECT id, job_id, status, external_reference, ad_description FROM campaigns'
      DB.execute(query).map do |row|
        Campaign.new(*row)
      end
    end
  end

  def initialize(id, job_id, status, external_reference, ad_description)
    @id = id
    @job_id = job_id
    @status = status
    @external_reference = external_reference
    @ad_description = ad_description
  end
end
