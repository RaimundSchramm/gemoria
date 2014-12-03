require 'spec_helper'

describe AcceptanceTest, :type => :model do
  context 'associations' do
    it { is_expected.to belong_to :userstory }
  end

  context 'scopes' do
    describe '.complete' do
      it 'returns all completed acceptance tests' do
        expect(AcceptanceTest.complete).to eq AcceptanceTest.where(complete: true)
      end
    end

    describe '.incomplete' do
      it 'returns all incompleted acceptance tests' do
        expect(AcceptanceTest.incomplete).to eq AcceptanceTest.where(complete: false)
      end
    end
  end
end