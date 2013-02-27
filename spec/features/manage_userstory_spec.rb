require 'spec_helper'

# In order to update the next business value
# As a product owner
# I want to manage acceptance tests and tasks via their userstory

# Given I am a product owner
# And I am member of a project
# And this project has a userstory
feature 'manage userstory', js: true do
  let(:project)   { create :project }
  let(:userstory) { create :userstory, project: project }
  let!(:sprint)    { create :sprint, project: project }

  #before { visit "/projects/#{project.id}/userstories/#{userstory.id}" }

  # When I visit this userstory
  # And click to add an acceptance test
  # Then a form is displayed for adding
  # And the new link disappears
  scenario 'new acceptance test', js: true do
    visit "/projects/#{project.id}/userstories/#{userstory.id}"

    # assert
    within 'section section.actions' do
      page.should_not have_selector('form.new_task')
      page.should_not have_selector('form.new_acceptance_test')
    end

    # user interaction
    within 'section#acceptance_tests section.actions' do
      click_on 'New acceptance test'
    end
    # assert
    within 'section#acceptance_tests section.actions' do
      page.should have_selector('form.new_acceptance_test')
      page.should have_selector('a#new_acceptance_test_link', display: 'none')
    end
  end

  # When I visit this userstory
  # And click to add a task
  # Then a form is displayed for adding
  # And the new link disappears
  scenario 'new task', js: true do
    visit "/projects/#{project.id}/userstories/#{userstory.id}"

    # assert
    within 'section section.actions' do
      page.should_not have_selector('form.new_task')
      page.should_not have_selector('form.new_acceptance_test')
    end

    # user interaction
    within 'section#tasks section.actions' do
      click_on 'New task'
    end
    # assert
    within 'section#tasks section.actions' do
      page.should have_selector('form.new_task')
      page.should have_selector('a#new_task_link', display: 'none')
    end
  end

  # When I visit this userstory
  # And click to add a task
  # And click to add an acceptance test
  # Then a form is displayed for adding
  # And the new link disappears
  # And other forms are removed
  # And other action links are displayed
  scenario 'new acceptance test after new task', js: true do
    visit "/projects/#{project.id}/userstories/#{userstory.id}"

    # user interaction
    within 'section#tasks section.actions' do
      click_on 'New task'
    end
    within 'section#acceptance_tests section.actions' do
      click_on 'New acceptance test'
    end
    # assert
    within 'section#tasks section.actions' do
      page.should_not have_selector('form.new_task')
      page.should have_selector('a#new_task_link', display: 'none')
    end
    within 'section#acceptance_tests section.actions' do
      page.should have_selector('form.new_acceptance_test')
      page.should have_selector('a#new_acceptance_test_link', display: 'none')
    end
  end

  # When I visit this userstory
  # And click to add an acceptance test
  # And click to add a task
  # Then a form is displayed for adding
  # And the new link disappears
  # And other forms are removed
  # And other action links are displayed
  scenario 'new task after new acceptance test', js: true do
    visit "/projects/#{project.id}/userstories/#{userstory.id}"

    # user interaction
    within 'section#acceptance_tests section.actions' do
      click_on 'New acceptance test'
    end
    within 'section#tasks section.actions' do
      click_on 'New task'
    end
    # assert
    within 'section#acceptance_tests section.actions' do
      page.should_not have_selector('form.new_acceptance_test')
      page.should have_selector('a#new_acceptance_test_link', display: 'none')
    end
    within 'section#tasks section.actions' do
      page.should have_selector('form.new_task')
      page.should have_selector('a#new_task_link', display: 'none')
    end
  end

  # When I visit this userstory
  # And click to edit an acceptance test
  # And click to add a task
  # Then a form is displayed for adding
  # And the new link disappears
  # And other forms are removed
  # And other action links are displayed
  # And other items are displayed
  scenario 'new task after edit acceptance test', js: true do
    acceptance_test = create :acceptance_test, userstory: userstory
    visit "/projects/#{project.id}/userstories/#{userstory.id}"

    # user interaction
    within "#acceptance_test_#{acceptance_test.id} .actions" do
      click_on "edit_acceptance_test_#{acceptance_test.id}"
    end
    within 'section#tasks section.actions' do
      click_on 'New task'
    end
    # assert
    within 'section#acceptance_tests section.actions' do
      page.should_not have_selector('form.edit_acceptance_test')
      page.should have_selector('a#new_acceptance_test_link', display: 'none')
    end
    within 'section#acceptance_tests section.incomplete' do
      page.should have_selector("#acceptance_test_#{acceptance_test.id}")
    end
    within 'section#tasks section.actions' do
      page.should have_selector('form.new_task')
      page.should have_selector('a#new_task_link', display: 'none')
    end
  end

  # When I visit this userstory
  # And I fill in and submit the form
  # Then the form disappears
  # And the new link appears
  # And the acceptance test is listed as accepted or not accepted
  scenario 'create acceptance test', js: true do
    visit "/projects/#{project.id}/userstories/#{userstory.id}"

    # user interaction
    within 'section#acceptance_tests section.actions' do
      click_on 'New acceptance test'
      fill_in 'Description', with: 'first'
      click_on 'Save'
    end
    # assert
    within 'section#acceptance_tests section.actions' do
      page.should_not have_selector 'form#new_acceptance_test'
    end
    within 'section#acceptance_tests section.incomplete' do
      page.should have_selector "#acceptance_test_#{AcceptanceTest.last.id}"
      page.should have_link  "edit_acceptance_test_#{AcceptanceTest.last.id}"
      page.should have_link  "complete_acceptance_test_#{AcceptanceTest.last.id}"
      page.should have_link  "destroy_acceptance_test_#{AcceptanceTest.last.id}"
    end
    within 'section#acceptance_tests section.actions' do
      page.should have_selector 'a#new_acceptance_test_link', display: 'inline'
    end
  end

  # When I visit this userstory
  # And I fill in and submit the form
  # Then the form disappears
  # And the new link appears
  # And the acceptance test is listed as accepted or not accepted
  scenario 'create task', js: true do
    visit "/projects/#{project.id}/userstories/#{userstory.id}"

    # user interaction
    within 'section#tasks section.actions' do
      click_on 'New task'
      fill_in 'Name', with: 'first'
      click_on 'Save'
    end
    # assert
    within 'section#tasks section.actions' do
      page.should_not have_selector 'form#new_task'
    end
    within 'section#tasks section.incomplete' do
      page.should have_selector "#task_#{Task.last.id}"
      page.should have_link  "edit_task_#{Task.last.id}"
      page.should have_link  "complete_task_#{Task.last.id}"
      page.should have_link  "destroy_task_#{Task.last.id}"
    end
    within 'section#tasks section.actions' do
      page.should have_selector 'a#new_task_link', display: 'inline'
    end
  end

  # When I visit this userstory
  # And click to add an acceptance test
  # And click to close the form
  # Then page looks the same like for submitting form
  scenario 'close new acceptance test form', js: true do
    visit "/projects/#{project.id}/userstories/#{userstory.id}"

    # user interaction
    click_on 'New acceptance test'
    find('.btn.close').click
    # assert
    within 'section#acceptance_tests section.actions' do
      page.should_not have_selector 'form#new_acceptance_test'
      page.should have_selector 'a#new_acceptance_test_link', display: 'inline'
    end
  end

  # When I visit this userstory
  # And click to edit an acceptance test
  # Then page looks the same like for new
  scenario 'edit acceptance test', js: true do
    acceptance_test = create :acceptance_test, userstory: userstory, description: 'first'
    visit "/projects/#{project.id}/userstories/#{userstory.id}"

    # user interaction
    within "#acceptance_test_#{acceptance_test.id}" do
      click_on "edit_acceptance_test_#{acceptance_test.id}"
    end
    # assert
    within 'section#acceptance_tests section.actions' do
      page.should have_selector "form.edit_acceptance_test"
    end
    within 'section#acceptance_tests section.incomplete' do
      page.should have_selector "#acceptance_test_#{acceptance_test.id}", display: 'none'
    end

    # user interaction
    within 'section#acceptance_tests section.actions form.edit_acceptance_test' do
      find('.btn.close').click
    end
    # assert
    within 'section#acceptance_tests section.actions' do
      page.should_not have_selector "form#acceptance_test"
    end
    within 'section#acceptance_tests section.incomplete' do
      page.should have_selector "#acceptance_test_#{acceptance_test.id}"
      page.should have_link  "edit_acceptance_test_#{acceptance_test.id}"
    end
  end

  # When I visit this userstory
  # And click to edit an acceptance test
  # Then page looks the same like for new
  scenario 'edit task', js: true do
    task = create :task, userstory: userstory, name: 'first'
    visit "/projects/#{project.id}/userstories/#{userstory.id}"

    # user interaction
    within "#task_#{task.id}" do
      click_on "edit_task_#{task.id}"
    end
    # assert
    within 'section#tasks section.actions' do
      page.should have_selector "form.edit_task"
    end
    within 'section#tasks section.incomplete' do
      page.should have_selector "#task_#{task.id}", display: 'none'
    end

    # user interaction
    within 'section#tasks section.actions form.edit_task' do
      find('.btn.close').click
    end
    # assert
    within 'section#tasks section.actions' do
      page.should_not have_selector "form#task"
    end
    within 'section#tasks section.incomplete' do
      page.should have_selector "#task_#{task.id}"
      page.should have_link  "edit_task_#{task.id}"
    end
  end

  # When I visit this userstory
  # And click to add or edit any item
  # And click to edit a task
  # Then page looks the same like for new
  scenario 'edit task after new or edit', js: true do
    task            = create :task, userstory: userstory, name: 'first'
    acceptance_test = create :acceptance_test, userstory: userstory, description: 'first click here'
    visit "/projects/#{project.id}/userstories/#{userstory.id}"

    # user interaction
    within "#acceptance_test_#{acceptance_test.id}" do
      click_on "edit_acceptance_test_#{acceptance_test.id}"
    end

    # user interaction
    within "#task_#{task.id}" do
      click_on "edit_task_#{task.id}"
    end
    # assert
    within 'section#tasks section.actions' do
      page.should have_selector 'form.edit_task'
    end
    within 'section#tasks section.incomplete' do
      page.should have_selector "#task_#{task.id}", display: 'none'
    end
    within 'section#acceptance_tests' do
      page.should_not have_selector 'form.edit_acceptance_test'
      page.should have_selector "#acceptance_test_#{acceptance_test.id}"
      page.should have_selector '#new_acceptance_test_link'
    end

    # user interaction
    within 'section#acceptance_tests' do
      click_on 'New acceptance test'
    end
    # user interaction
    within "#task_#{task.id}" do
      click_on "edit_task_#{task.id}"
    end
    # assert
    within 'section#acceptance_tests' do
      page.should_not have_selector "form#new_acceptance_test"
      page.should have_selector '#new_acceptance_test_link'
    end
  end

  # When I visit this userstory
  # And I update an acceptance test
  # Then page looks the same like for create
  scenario 'update acceptance test', js: true do
    acceptance_test = create :acceptance_test, userstory: userstory, description: 'first'
    visit "/projects/#{project.id}/userstories/#{userstory.id}"

    # user interaction
    within "#acceptance_test_#{acceptance_test.id}" do
      click_on "edit_acceptance_test_#{acceptance_test.id}"
    end
    within "section#acceptance_tests section.actions form.edit_acceptance_test" do
      fill_in 'Description', with: 'first complete'
      check 'Complete'
      click_on 'Save'
    end
    # assert
    within 'section#acceptance_tests section.actions' do
      page.should_not have_selector "form#edit_acceptance_test"
      page.should have_selector 'a#new_acceptance_test_link', display: 'inline'
    end
    within 'section#acceptance_tests section.incomplete' do
      page.should_not have_selector "#acceptance_test_#{acceptance_test.id}"
      page.should_not have_content  'first complete'
    end
    within 'section#acceptance_tests section.complete' do
      page.should have_selector "#acceptance_test_#{acceptance_test.id}"
      page.should have_content  'first complete'
    end
  end

  # When I visit this userstory
  # And I update an acceptance test
  # Then page looks the same like for create
  scenario 'update task', js: true do
    task = create :task, userstory: userstory, name: 'first'
    visit "/projects/#{project.id}/userstories/#{userstory.id}"

    # user interaction
    within "#task_#{task.id}" do
      click_on "edit_task_#{task.id}"
    end
    within "section#tasks section.actions form.edit_task" do
      fill_in 'Name', with: 'first complete'
      check 'Complete'
      click_on 'Save'
    end
    # assert
    within 'section#tasks section.actions' do
      page.should_not have_selector "form#edit_task"
      page.should have_selector 'a#new_task_link', display: 'inline'
    end
    within 'section#tasks section.incomplete' do
      page.should_not have_selector "#task_#{task.id}"
      page.should_not have_content  'first complete'
    end
    within 'section#tasks section.complete' do
      page.should have_selector "#task_#{task.id}"
      page.should have_content  'first complete'
    end
  end

  # When I visit this userstory
  # And I delete an acceptance test
  # Then page looks the same like for update and create
  scenario 'delete acceptance test', js: true do
    acceptance_test = create :acceptance_test, userstory: userstory, description: 'first'
    visit "/projects/#{project.id}/userstories/#{userstory.id}"

    # user interaction
    within "#acceptance_test_#{acceptance_test.id}" do
      click_on "destroy_acceptance_test_#{AcceptanceTest.last.id}"
    end
    # assert
    within 'section#acceptance_tests section.incomplete' do
      page.should_not have_selector "#acceptance_test_#{acceptance_test.id}"
    end
    within 'section#acceptance_tests section.actions' do
      page.should have_selector 'a#new_acceptance_test_link', display: 'inline'
    end
  end

  # When I visit this userstory
  # And I delete a task
  # Then page looks the same like for update and create
  scenario 'delete task', js: true do
    task = create :task, userstory: userstory, name: 'first'
    visit "/projects/#{project.id}/userstories/#{userstory.id}"

    # user interaction
    within "#task_#{task.id}" do
      click_on "destroy_task_#{task.id}"
    end
    # assert
    within 'section#tasks section.incomplete' do
      page.should_not have_selector "#task_#{task.id}"
    end
    within 'section#tasks section.actions' do
      page.should have_selector 'a#new_task_link', display: 'inline'
    end
  end

  # When I visit this userstory
  # And I edit an acceptance test
  # And I delete a task
  # Then page looks the same like for update and create
  scenario 'delete task after edit', js: true do
    task            = create :task, userstory: userstory, name: 'first'
    acceptance_test = create :acceptance_test, userstory: userstory, description: 'first to click'
    visit "/projects/#{project.id}/userstories/#{userstory.id}"

    # user interaction
    within 'section#acceptance_tests' do
      click_on "edit_acceptance_test_#{acceptance_test.id}"
    end

    # user interaction
    within "#task_#{task.id}" do
      click_on "destroy_task_#{task.id}"
    end
    # assert
    within 'section#tasks section.incomplete' do
      page.should_not have_selector "#task_#{task.id}"
    end
    within 'section#tasks section.actions' do
      page.should have_selector 'a#new_task_link', display: 'inline'
    end
    within 'section#acceptance_tests' do
      page.should_not have_selector 'form.edit_acceptance_test'
      page.should have_selector '#new_acceptance_test_link'
      page.should have_selector "#acceptance_test_#{acceptance_test.id}"
    end
  end

  # When I visit this userstory
  # And I add an acceptance test
  # And I delete a task
  # Then page looks the same like for update and create
  scenario 'delete task after new', js: true do
    task            = create :task, userstory: userstory, name: 'first'
    acceptance_test = create :acceptance_test, userstory: userstory, description: 'first to click'
    visit "/projects/#{project.id}/userstories/#{userstory.id}"

    # user interaction
    within 'section#acceptance_tests' do
      click_on 'New acceptance test'
    end

    # user interaction
    within "#task_#{task.id}" do
      click_on "destroy_task_#{task.id}"
    end
    # assert
    within 'section#tasks section.incomplete' do
      page.should_not have_selector "#task_#{task.id}"
    end
    within 'section#tasks section.actions' do
      page.should have_selector 'a#new_task_link', display: 'inline'
    end
    within 'section#acceptance_tests' do
      page.should_not have_selector 'form.new_acceptance_test'
      page.should have_selector '#new_acceptance_test_link'
      page.should have_selector "#acceptance_test_#{acceptance_test.id}"
    end
  end
end
