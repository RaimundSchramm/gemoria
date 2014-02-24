require 'spec_helper'

describe Permission do

  context 'for guests'  do

    subject { Permission.new(nil) }

    describe 'grants access' do

      it { should allow_access_to('home', 'index') }

      it { should allow_access_to('users', 'new') }
      it { should allow_access_to('users', 'create') }

      it { should allow_access_to('sessions', 'new') }
      it { should allow_access_to('sessions', 'create') }
    end

    describe 'restricts access' do

      it { should_not allow_access_to('sessions', 'destroy') }    

      it { should_not allow_access_to('administrations', 'show') }

      it { should_not allow_access_to('dashboards', 'show') }

      it { should_not allow_access_to('categories', 'index') }
      it { should_not allow_access_to('categories', 'new') }
      it { should_not allow_access_to('categories', 'create') }
      it { should_not allow_access_to('categories', 'show') }
      it { should_not allow_access_to('categories', 'edit') }
      it { should_not allow_access_to('categories', 'update') }
      it { should_not allow_access_to('categories', 'destroy') }

      it { should_not allow_access_to('roles', 'index') }
      it { should_not allow_access_to('roles', 'new') }
      it { should_not allow_access_to('roles', 'create') }
      it { should_not allow_access_to('roles', 'show') }
      it { should_not allow_access_to('roles', 'edit') }
      it { should_not allow_access_to('roles', 'update') }
      it { should_not allow_access_to('roles', 'destroy') }

      it { should_not allow_access_to('projects', 'index') }
      it { should_not allow_access_to('projects', 'new') }
      it { should_not allow_access_to('projects', 'create') }
      it { should_not allow_access_to('projects', 'show') }
      it { should_not allow_access_to('projects', 'edit') }
      it { should_not allow_access_to('projects', 'update') }
      it { should_not allow_access_to('projects', 'destroy') }

      it { should_not allow_access_to('ownerships', 'index') }
      it { should_not allow_access_to('ownerships', 'edit_mutiple') }
      it { should_not allow_access_to('ownerships', 'create_or_delete_multiple') }

      it { should_not allow_access_to('sprints', 'update') }
      it { should_not allow_access_to('sprints', 'complete') }

      it { should_not allow_access_to('userstories', 'index') }
      it { should_not allow_access_to('userstories', 'new') }
      it { should_not allow_access_to('userstories', 'create') }
      it { should_not allow_access_to('userstories', 'show') }
      it { should_not allow_access_to('userstories', 'edit') }
      it { should_not allow_access_to('userstories', 'update') }
      it { should_not allow_access_to('userstories', 'destroy') }

      it { should_not allow_access_to('acceptance_tests', 'index') }
      it { should_not allow_access_to('acceptance_tests', 'new') }
      it { should_not allow_access_to('acceptance_tests', 'create') }
      it { should_not allow_access_to('acceptance_tests', 'show') }
      it { should_not allow_access_to('acceptance_tests', 'edit') }
      it { should_not allow_access_to('acceptance_tests', 'update') }
      it { should_not allow_access_to('acceptance_tests', 'destroy') }

      it { should_not allow_access_to('tasks', 'index') }
      it { should_not allow_access_to('tasks', 'new') }
      it { should_not allow_access_to('tasks', 'create') }
      it { should_not allow_access_to('tasks', 'show') }
      it { should_not allow_access_to('tasks', 'edit') }
      it { should_not allow_access_to('tasks', 'update') }
      it { should_not allow_access_to('tasks', 'destroy') }

      it { should_not allow_access_to('current_userstories', 'index') }
    end
  end

  context 'for admins' do
    describe 'grants access to every route' do
      subject { Permission.new(User.new admin: true) }

      it { should allow_access_to('home', 'index') }

      it { should allow_access_to('users', 'new') }
      it { should allow_access_to('users', 'create') }

      it { should allow_access_to('sessions', 'new') }
      it { should allow_access_to('sessions', 'create') }
      it { should allow_access_to('sessions', 'destroy') }

      it { should allow_access_to('administrations', 'show') }

      it { should allow_access_to('dashboards', 'show') }

      it { should allow_access_to('categories', 'index') }
      it { should allow_access_to('categories', 'new') }
      it { should allow_access_to('categories', 'create') }
      it { should allow_access_to('categories', 'show') }
      it { should allow_access_to('categories', 'edit') }
      it { should allow_access_to('categories', 'update') }
      it { should allow_access_to('categories', 'destroy') }

      it { should allow_access_to('roles', 'index') }
      it { should allow_access_to('roles', 'new') }
      it { should allow_access_to('roles', 'create') }
      it { should allow_access_to('roles', 'show') }
      it { should allow_access_to('roles', 'edit') }
      it { should allow_access_to('roles', 'update') }
      it { should allow_access_to('roles', 'destroy') }

      it { should allow_access_to('projects', 'index') }
      it { should allow_access_to('projects', 'new') }
      it { should allow_access_to('projects', 'create') }
      it { should allow_access_to('projects', 'show') }
      it { should allow_access_to('projects', 'edit') }
      it { should allow_access_to('projects', 'update') }
      it { should allow_access_to('projects', 'destroy') }

      it { should allow_access_to('ownerships', 'index') }
      it { should allow_access_to('ownerships', 'edit_mutiple') }
      it { should allow_access_to('ownerships', 'create_or_delete_multiple') }

      it { should allow_access_to('sprints', 'update') }
      it { should allow_access_to('sprints', 'complete') }

      it { should allow_access_to('userstories', 'index') }
      it { should allow_access_to('userstories', 'new') }
      it { should allow_access_to('userstories', 'create') }
      it { should allow_access_to('userstories', 'show') }
      it { should allow_access_to('userstories', 'edit') }
      it { should allow_access_to('userstories', 'update') }
      it { should allow_access_to('userstories', 'destroy') }

      it { should allow_access_to('acceptance_tests', 'index') }
      it { should allow_access_to('acceptance_tests', 'new') }
      it { should allow_access_to('acceptance_tests', 'create') }
      it { should allow_access_to('acceptance_tests', 'show') }
      it { should allow_access_to('acceptance_tests', 'edit') }
      it { should allow_access_to('acceptance_tests', 'update') }
      it { should allow_access_to('acceptance_tests', 'destroy') }

      it { should allow_access_to('tasks', 'index') }
      it { should allow_access_to('tasks', 'new') }
      it { should allow_access_to('tasks', 'create') }
      it { should allow_access_to('tasks', 'show') }
      it { should allow_access_to('tasks', 'edit') }
      it { should allow_access_to('tasks', 'update') }
      it { should allow_access_to('tasks', 'destroy') }

      it { should allow_access_to('current_userstories', 'index') }
    end
  end

  context 'for members', focus: true do
    describe 'grants access' do
      subject { Permission.new(User.new admin: false) }
      it { should allow_access_to('home', 'index') }

      it { should allow_access_to('users', 'new') }
      it { should allow_access_to('users', 'create') }

      it { should allow_access_to('sessions', 'new') }
      it { should allow_access_to('sessions', 'create') }
      it { should allow_access_to('sessions', 'destroy') }

      it { should allow_access_to('dashboards', 'show') }

      it { should allow_access_to('userstories', 'index') }
      it { should allow_access_to('userstories', 'new') }
      it { should allow_access_to('userstories', 'create') }
      it { should allow_access_to('userstories', 'show') }
      it { should allow_access_to('userstories', 'edit') }
      it { should allow_access_to('userstories', 'update') }
      it { should allow_access_to('userstories', 'destroy') }

      it { should allow_access_to('acceptance_tests', 'index') }
      it { should allow_access_to('acceptance_tests', 'new') }
      it { should allow_access_to('acceptance_tests', 'create') }
      it { should allow_access_to('acceptance_tests', 'show') }
      it { should allow_access_to('acceptance_tests', 'edit') }
      it { should allow_access_to('acceptance_tests', 'update') }
      it { should allow_access_to('acceptance_tests', 'destroy') }

      it { should allow_access_to('tasks', 'index') }
      it { should allow_access_to('tasks', 'new') }
      it { should allow_access_to('tasks', 'create') }
      it { should allow_access_to('tasks', 'show') }
      it { should allow_access_to('tasks', 'edit') }
      it { should allow_access_to('tasks', 'update') }
      it { should allow_access_to('tasks', 'destroy') }

      it { should allow_access_to('current_userstories', 'index') }
    end

    describe 'restricts access' do
      it { should_not allow_access_to('administrations', 'show') }

      it { should_not allow_access_to('categories', 'index') }
      it { should_not allow_access_to('categories', 'new') }
      it { should_not allow_access_to('categories', 'create') }
      it { should_not allow_access_to('categories', 'show') }
      it { should_not allow_access_to('categories', 'edit') }
      it { should_not allow_access_to('categories', 'update') }
      it { should_not allow_access_to('categories', 'destroy') }

      it { should_not allow_access_to('roles', 'index') }
      it { should_not allow_access_to('roles', 'new') }
      it { should_not allow_access_to('roles', 'create') }
      it { should_not allow_access_to('roles', 'show') }
      it { should_not allow_access_to('roles', 'edit') }
      it { should_not allow_access_to('roles', 'update') }
      it { should_not allow_access_to('roles', 'destroy') }

      it { should_not allow_access_to('projects', 'index') }
      it { should_not allow_access_to('projects', 'new') }
      it { should_not allow_access_to('projects', 'create') }
      it { should_not allow_access_to('projects', 'show') }
      it { should_not allow_access_to('projects', 'edit') }
      it { should_not allow_access_to('projects', 'update') }
      it { should_not allow_access_to('projects', 'destroy') }

      it { should_not allow_access_to('ownerships', 'index') }
      it { should_not allow_access_to('ownerships', 'edit_mutiple') }
      it { should_not allow_access_to('ownerships', 'create_or_delete_multiple') }
    end
  end

  describe 'as guest, admin and non-admin' do
    it 'are all allowed access to' do
      guest     = Permission.new(nil)
      admin     = Permission.new(User.new admin: true)
      non_admin = Permission.new(User.new admin: false)
      roles     = [guest, admin, non_admin]

      roles.each do |role|
        expect(role).to allow_access_to('home', 'index')
      end
    end
  end
end
