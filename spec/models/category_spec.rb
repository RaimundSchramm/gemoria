require 'spec_helper'

describe Category, :type => :model do
  context 'associations' do
    it { is_expected.to have_many :userstories }
  end

  context 'attributes and constants' do
    xit 'has an accessible name' do

    end
  end

  context 'associations' do
    xit 'has many userstories' do

    end
  end
end
