require 'spec_helper'

describe Sprint, :type => :model do
  let(:sprint)     { create :sprint }
  let!(:userstory) { create :userstory_sprint_accepted, sprint: sprint }

  context 'associations' do
    it { is_expected.to belong_to :project }
    it { is_expected.to have_many :userstories }
  end

  describe '#complete!' do
    it 'completes the sprint' do
      sprint.complete!
      expect(sprint.complete).to eq true
      sprint.userstories.each do |userstory|
        expect(userstory.position).to eq Userstory::POSITION[:done]
      end
    end
  end
end
