require 'spec_helper'

feature 'managing roles' do
  scenario 'adding a new role' do
    login create :admin
    visit '/administration'
    expect(page).to have_link 'Roles'
  end
end
