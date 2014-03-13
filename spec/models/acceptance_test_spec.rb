require 'spec_helper'

describe AcceptanceTest do
  context 'associations' do
    it { should belong_to :userstory }
  end

  context 'scopes' do
    describe '.complete' do
      it 'returns all completed acceptance tests' do
        AcceptanceTest.complete.should eq AcceptanceTest.where(complete: true)
      end
    end

    describe '.incomplete' do
      it 'returns all incompleted acceptance tests' do
        AcceptanceTest.incomplete.should eq AcceptanceTest.where(complete: false)
      end
    end
  end
end