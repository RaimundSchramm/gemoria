require 'spec_helper'

feature 'manage userstories' do
  let(:project)  { create :project }
  let(:sprint)  { project.sprints.first }
  let!(:category) { create :category, name: 'Bug' }

  before { login }

  scenario 'new userstory moves to back log, is sprintless and opened', js: true do
    visit "/projects/#{project.id}/userstories"

    # user interaction

    click_on 'New userstory'
    fill_in 'Description', with: 'first'
    select 'Bug', from: 'Category'
    click_on 'Save'

    # assert
    within '#complete_sprint' do
      expect(page).not_to have_content('Complete sprint')
    end
    expect(page).to have_content('Bug')
    expect(page).to have_content('first')
    expect(Userstory.last.sprint).to be_nil
    expect(Userstory.last.position).to eq 'backlog'
    expect(Userstory.last.status).to eq 'opened'
    expect(sprint).not_to be_complete
  end

  scenario 'new userstory moves from backlog to sprint, is in sprint and opened', js: true do
    # create_new_backlog_item
    visit "/projects/#{project.id}/userstories"
    click_on 'New userstory'
    fill_in 'Description', with: 'first'
    select 'Bug', from: 'Category'
    click_on 'Save'

    # user interaction

    click_on '<'

    # assert
    within '#complete_sprint' do
      expect(page).not_to have_content('Complete sprint')
    end
    within 'section#backlog' do
      expect(page).not_to have_content('Bug')
      expect(page).not_to have_content('first')
    end
    within 'section#current_sprint' do
      expect(page).to have_content('Bug')
      expect(page).to have_content('first')
    end
    expect(Userstory.last.sprint).to eq sprint
    expect(Userstory.last.position).to eq 'sprint'
    expect(Userstory.last.status).to eq 'opened'
    expect(sprint).not_to be_complete
  end

  scenario 'update userstories in sprint to mark sprint as complete', js: true do
    # create_new_backlog_item
    visit "/projects/#{project.id}/userstories"
    click_on 'New userstory'
    fill_in 'Description', with: 'first'
    select 'Bug', from: 'Category'
    click_on 'Save'
    # move_backlog_item_into_sprint
    click_on '<'

    # user interaction

    click_on "#{Userstory.last.description}"
    expect(current_path).to eq "/projects/#{project.id}/userstories/#{Userstory.last.id}"
    click_on 'Start'
    click_on 'Complete'
    click_on 'Accept'
    click_on 'Back to userstory management'
    expect(current_path).to eq "/projects/#{project.id}/userstories"

    # assert
    within '#complete_sprint' do
      expect(page).to have_content('Complete sprint')
    end
    within 'section#backlog' do
      expect(page).not_to have_content('Bug')
      expect(page).not_to have_content('first')
    end
    within 'section#current_sprint' do
      expect(page).to have_content('Bug')
      expect(page).to have_content('first')
    end
    expect(Userstory.last.sprint).to eq sprint
    expect(Userstory.last.position).to eq 'sprint'
    expect(Userstory.last.status).to eq 'accepted'
    expect(sprint).not_to be_complete
  end

  scenario 'prepare and complete sprint', js: true do
    # create_new_backlog_item
    visit "/projects/#{project.id}/userstories"
    click_on 'New userstory'
    fill_in 'Description', with: 'first'
    select 'Bug', from: 'Category'
    click_on 'Save'

    # move_backlog_item_into_sprint
    click_on '<'

    # accept one and only userstory in sprint
    click_on "#{Userstory.last.description}"
    expect(current_path).to eq "/projects/#{project.id}/userstories/#{Userstory.last.id}"
    click_on 'Start'
    click_on 'Complete'
    click_on 'Accept'
    click_on 'Back to userstory management'
    expect(current_path).to eq "/projects/#{project.id}/userstories"

    # user interaction

    click_on 'Complete sprint'

    # assert
    within '#complete_sprint' do
      expect(page).not_to have_content('Complete sprint')
    end
    within 'section#backlog' do
      expect(page).not_to have_content('Bug')
      expect(page).not_to have_content('first')
    end
    within 'section#current_sprint' do
      expect(page).not_to have_content('Bug')
      expect(page).not_to have_content('first')
    end
    within 'section#accepted' do
      expect(page).to have_content('Bug')
      expect(page).to have_content('first')
    end
    expect(Userstory.last.sprint).to eq sprint
    expect(Userstory.last.position).to eq 'done'
    expect(Userstory.last.status).to eq 'accepted'

    expect(sprint.reload).to be_complete
  end
end
