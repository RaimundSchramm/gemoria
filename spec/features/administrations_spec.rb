require 'spec_helper'

# AS an Admin User
feature 'Administration' do
  let(:admin) { create :admin }

  background do
    login admin
  end

  scenario 'WHEN I log in THEN I want to have a top-level-menue for my options' do
    within 'ul.settings' do
      expect(page).to have_link 'Settings'
      expect(page).to have_link 'Ownerships'
      expect(page).to have_link 'Projects'
      expect(page).to have_link 'Roles'
      expect(page).to have_link 'Style Guide'
    end
  end

  scenario 'WHEN I visit the administrations page THEN I want to see all my options' do
    visit '/administration'
    within 'section.administrations' do
      expect(page).to have_link 'Ownerships'
      expect(page).to have_link 'Projects'
      expect(page).to have_link 'Roles'
      expect(page).to have_link 'Style Guide'
    end
  end
end
