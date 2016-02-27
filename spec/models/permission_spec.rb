require 'spec_helper'

describe Permission, :type => :model do

  context 'for guests'  do

    subject { Permission.new(nil) }

    describe 'grants access' do

      it { is_expected.to allow_access_to('home', 'index') }

      it { is_expected.to allow_access_to('users', 'new') }
      it { is_expected.to allow_access_to('users', 'create') }

      it { is_expected.to allow_access_to('sessions', 'new') }
      it { is_expected.to allow_access_to('sessions', 'create') }
      it { is_expected.to allow_access_to('releases', 'index') }
    end

    describe 'restricts access' do

      it { is_expected.not_to allow_access_to('sessions', 'destroy') }    

      it { is_expected.not_to allow_access_to('administrations', 'show') }

      it { is_expected.not_to allow_access_to('dashboards', 'show') }

      it { is_expected.not_to allow_access_to('categories', 'index') }
      it { is_expected.not_to allow_access_to('categories', 'new') }
      it { is_expected.not_to allow_access_to('categories', 'create') }
      it { is_expected.not_to allow_access_to('categories', 'show') }
      it { is_expected.not_to allow_access_to('categories', 'edit') }
      it { is_expected.not_to allow_access_to('categories', 'update') }
      it { is_expected.not_to allow_access_to('categories', 'destroy') }

      it { is_expected.not_to allow_access_to('roles', 'index') }
      it { is_expected.not_to allow_access_to('roles', 'new') }
      it { is_expected.not_to allow_access_to('roles', 'create') }
      it { is_expected.not_to allow_access_to('roles', 'show') }
      it { is_expected.not_to allow_access_to('roles', 'edit') }
      it { is_expected.not_to allow_access_to('roles', 'update') }
      it { is_expected.not_to allow_access_to('roles', 'destroy') }

      it { is_expected.not_to allow_access_to('projects', 'index') }
      it { is_expected.not_to allow_access_to('projects', 'new') }
      it { is_expected.not_to allow_access_to('projects', 'create') }
      it { is_expected.not_to allow_access_to('projects', 'show') }
      it { is_expected.not_to allow_access_to('projects', 'edit') }
      it { is_expected.not_to allow_access_to('projects', 'update') }
      it { is_expected.not_to allow_access_to('projects', 'destroy') }

      it { is_expected.not_to allow_access_to('ownerships', 'index') }
      it { is_expected.not_to allow_access_to('ownerships', 'edit_mutiple') }
      it { is_expected.not_to allow_access_to('ownerships', 'create_or_delete_multiple') }

      it { is_expected.not_to allow_access_to('sprints', 'update') }
      it { is_expected.not_to allow_access_to('sprints', 'complete') }

      it { is_expected.not_to allow_access_to('userstories', 'index') }
      it { is_expected.not_to allow_access_to('userstories', 'new') }
      it { is_expected.not_to allow_access_to('userstories', 'create') }
      it { is_expected.not_to allow_access_to('userstories', 'show') }
      it { is_expected.not_to allow_access_to('userstories', 'edit') }
      it { is_expected.not_to allow_access_to('userstories', 'update') }
      it { is_expected.not_to allow_access_to('userstories', 'destroy') }

      it { is_expected.not_to allow_access_to('acceptance_tests', 'index') }
      it { is_expected.not_to allow_access_to('acceptance_tests', 'new') }
      it { is_expected.not_to allow_access_to('acceptance_tests', 'create') }
      it { is_expected.not_to allow_access_to('acceptance_tests', 'show') }
      it { is_expected.not_to allow_access_to('acceptance_tests', 'edit') }
      it { is_expected.not_to allow_access_to('acceptance_tests', 'update') }
      it { is_expected.not_to allow_access_to('acceptance_tests', 'destroy') }

      it { is_expected.not_to allow_access_to('tasks', 'index') }
      it { is_expected.not_to allow_access_to('tasks', 'new') }
      it { is_expected.not_to allow_access_to('tasks', 'create') }
      it { is_expected.not_to allow_access_to('tasks', 'show') }
      it { is_expected.not_to allow_access_to('tasks', 'edit') }
      it { is_expected.not_to allow_access_to('tasks', 'update') }
      it { is_expected.not_to allow_access_to('tasks', 'destroy') }

      it { is_expected.not_to allow_access_to('current_userstories', 'index') }
    end
  end

  context 'for admins' do
    describe 'grants access to every route' do
      subject { Permission.new(User.new admin: true) }

      it { is_expected.to allow_access_to('home', 'index') }

      it { is_expected.to allow_access_to('users', 'new') }
      it { is_expected.to allow_access_to('users', 'create') }

      it { is_expected.to allow_access_to('sessions', 'new') }
      it { is_expected.to allow_access_to('sessions', 'create') }
      it { is_expected.to allow_access_to('sessions', 'destroy') }

      it { is_expected.to allow_access_to('administrations', 'show') }

      it { is_expected.to allow_access_to('dashboards', 'show') }

      it { is_expected.to allow_access_to('categories', 'index') }
      it { is_expected.to allow_access_to('categories', 'new') }
      it { is_expected.to allow_access_to('categories', 'create') }
      it { is_expected.to allow_access_to('categories', 'show') }
      it { is_expected.to allow_access_to('categories', 'edit') }
      it { is_expected.to allow_access_to('categories', 'update') }
      it { is_expected.to allow_access_to('categories', 'destroy') }

      it { is_expected.to allow_access_to('roles', 'index') }
      it { is_expected.to allow_access_to('roles', 'new') }
      it { is_expected.to allow_access_to('roles', 'create') }
      it { is_expected.to allow_access_to('roles', 'show') }
      it { is_expected.to allow_access_to('roles', 'edit') }
      it { is_expected.to allow_access_to('roles', 'update') }
      it { is_expected.to allow_access_to('roles', 'destroy') }

      it { is_expected.to allow_access_to('projects', 'index') }
      it { is_expected.to allow_access_to('projects', 'new') }
      it { is_expected.to allow_access_to('projects', 'create') }
      it { is_expected.to allow_access_to('projects', 'show') }
      it { is_expected.to allow_access_to('projects', 'edit') }
      it { is_expected.to allow_access_to('projects', 'update') }
      it { is_expected.to allow_access_to('projects', 'destroy') }

      it { is_expected.to allow_access_to('ownerships', 'index') }
      it { is_expected.to allow_access_to('ownerships', 'edit_mutiple') }
      it { is_expected.to allow_access_to('ownerships', 'create_or_delete_multiple') }

      it { is_expected.to allow_access_to('sprints', 'update') }
      it { is_expected.to allow_access_to('sprints', 'complete') }

      it { is_expected.to allow_access_to('userstories', 'index') }
      it { is_expected.to allow_access_to('userstories', 'new') }
      it { is_expected.to allow_access_to('userstories', 'create') }
      it { is_expected.to allow_access_to('userstories', 'show') }
      it { is_expected.to allow_access_to('userstories', 'edit') }
      it { is_expected.to allow_access_to('userstories', 'update') }
      it { is_expected.to allow_access_to('userstories', 'destroy') }

      it { is_expected.to allow_access_to('acceptance_tests', 'index') }
      it { is_expected.to allow_access_to('acceptance_tests', 'new') }
      it { is_expected.to allow_access_to('acceptance_tests', 'create') }
      it { is_expected.to allow_access_to('acceptance_tests', 'show') }
      it { is_expected.to allow_access_to('acceptance_tests', 'edit') }
      it { is_expected.to allow_access_to('acceptance_tests', 'update') }
      it { is_expected.to allow_access_to('acceptance_tests', 'destroy') }

      it { is_expected.to allow_access_to('tasks', 'index') }
      it { is_expected.to allow_access_to('tasks', 'new') }
      it { is_expected.to allow_access_to('tasks', 'create') }
      it { is_expected.to allow_access_to('tasks', 'show') }
      it { is_expected.to allow_access_to('tasks', 'edit') }
      it { is_expected.to allow_access_to('tasks', 'update') }
      it { is_expected.to allow_access_to('tasks', 'destroy') }

      it { is_expected.to allow_access_to('current_userstories', 'index') }
    end
  end

  context 'for members', focus: true do
    describe 'grants access' do
      subject { Permission.new(User.new admin: false) }
      it { is_expected.to allow_access_to('home', 'index') }

      it { is_expected.to allow_access_to('users', 'new') }
      it { is_expected.to allow_access_to('users', 'create') }

      it { is_expected.to allow_access_to('sessions', 'new') }
      it { is_expected.to allow_access_to('sessions', 'create') }
      it { is_expected.to allow_access_to('sessions', 'destroy') }

      it { is_expected.to allow_access_to('dashboards', 'show') }

      it { is_expected.to allow_access_to('userstories', 'index') }
      it { is_expected.to allow_access_to('userstories', 'new') }
      it { is_expected.to allow_access_to('userstories', 'create') }
      it { is_expected.to allow_access_to('userstories', 'show') }
      it { is_expected.to allow_access_to('userstories', 'edit') }
      it { is_expected.to allow_access_to('userstories', 'update') }
      it { is_expected.to allow_access_to('userstories', 'destroy') }

      it { is_expected.to allow_access_to('acceptance_tests', 'index') }
      it { is_expected.to allow_access_to('acceptance_tests', 'new') }
      it { is_expected.to allow_access_to('acceptance_tests', 'create') }
      it { is_expected.to allow_access_to('acceptance_tests', 'show') }
      it { is_expected.to allow_access_to('acceptance_tests', 'edit') }
      it { is_expected.to allow_access_to('acceptance_tests', 'update') }
      it { is_expected.to allow_access_to('acceptance_tests', 'destroy') }

      it { is_expected.to allow_access_to('tasks', 'index') }
      it { is_expected.to allow_access_to('tasks', 'new') }
      it { is_expected.to allow_access_to('tasks', 'create') }
      it { is_expected.to allow_access_to('tasks', 'show') }
      it { is_expected.to allow_access_to('tasks', 'edit') }
      it { is_expected.to allow_access_to('tasks', 'update') }
      it { is_expected.to allow_access_to('tasks', 'destroy') }

      it { is_expected.to allow_access_to('current_userstories', 'index') }
    end

    describe 'restricts access' do
      it { is_expected.not_to allow_access_to('administrations', 'show') }

      it { is_expected.not_to allow_access_to('categories', 'index') }
      it { is_expected.not_to allow_access_to('categories', 'new') }
      it { is_expected.not_to allow_access_to('categories', 'create') }
      it { is_expected.not_to allow_access_to('categories', 'show') }
      it { is_expected.not_to allow_access_to('categories', 'edit') }
      it { is_expected.not_to allow_access_to('categories', 'update') }
      it { is_expected.not_to allow_access_to('categories', 'destroy') }

      it { is_expected.not_to allow_access_to('roles', 'index') }
      it { is_expected.not_to allow_access_to('roles', 'new') }
      it { is_expected.not_to allow_access_to('roles', 'create') }
      it { is_expected.not_to allow_access_to('roles', 'show') }
      it { is_expected.not_to allow_access_to('roles', 'edit') }
      it { is_expected.not_to allow_access_to('roles', 'update') }
      it { is_expected.not_to allow_access_to('roles', 'destroy') }

      it { is_expected.not_to allow_access_to('projects', 'index') }
      it { is_expected.not_to allow_access_to('projects', 'new') }
      it { is_expected.not_to allow_access_to('projects', 'create') }
      it { is_expected.not_to allow_access_to('projects', 'show') }
      it { is_expected.not_to allow_access_to('projects', 'edit') }
      it { is_expected.not_to allow_access_to('projects', 'update') }
      it { is_expected.not_to allow_access_to('projects', 'destroy') }

      it { is_expected.not_to allow_access_to('ownerships', 'index') }
      it { is_expected.not_to allow_access_to('ownerships', 'edit_mutiple') }
      it { is_expected.not_to allow_access_to('ownerships', 'create_or_delete_multiple') }
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
