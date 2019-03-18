require 'spec_helper'

RSpec.describe DetectDiscrepancies do
  let(:diffs) do
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
  let(:result) do
    [
      {
        remote_reference: '1',
        discrepancies: {
          description: {
            local: 'Description 1',
            remote: 'Description'
          }
        }
      },
      {
        remote_reference: '2',
        discrepancies: {
          status: {
            local: 'paused', remote: 'enabled'
          },
          description: {
            local: 'Description 2',
            remote: 'Description'
          }
        }
      }
    ]
  end
  let(:service) { DetectDiscrepancies.new }

  before do
    allow(CampaignDiffs).to receive(:call).and_return(diffs)
  end

  describe '#call' do
    it 'returns discrepancy objects array' do
      expect(service.call).to match_array(result)
    end
  end
end
