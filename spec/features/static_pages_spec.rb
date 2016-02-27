require 'spec_helper'

feature 'static pages' do

  background do
    visit '/'
  end

  scenario 'As a Guest I want to have a link to see all releases' do
    expect(page).to have_link 'Releases'
    click_on 'Releases'
    expect(current_path).to eq releases_path
  end
end
