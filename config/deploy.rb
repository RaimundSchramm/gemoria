require 'bundler/capistrano'
require 'rvm/capistrano'

# app relevant
set :application, 'gemoria'# name is also host relevant because it is used to create the appdir

# repository relevant
set :repository, 'git@github.com:RaimundSchramm/gemoria.git'# is also host relevant because it forces you to install and use vcs type
set :scm, :git

# host relevant
server '192.168.178.21', :web, :app, :db, primary: true
set :user, 'raimund'
set :deploy_to, "/Users/#{user}/Desktop/projects/#{application}"
default_run_options[:pty] = true# clearify; seemed to be needed for deploy:setup
set :rvm_ruby_string, 'ruby-1.9.3-p194-perf@gemoria'

ssh_options[:forward_agent] = true

# if you want to clean up old releases on each deploy uncomment this:
# after "deploy:restart", "deploy:cleanup"
set :keep_releases, 2
after "deploy", "deploy:cleanup"

namespace :rvm do
  task :trust_rvmrc do
    #run "echo #{release_path}"
    run "rvm rvmrc trust #{release_path}"
  end

  task :info do
    run "cd #{current_path} && gem li"
  end
end

namespace :deploy do
  task :setup_config, roles: :app do
    run "mkdir -p #{shared_path}/config"
    put File.read("config/database.production.sample.yml"), "#{shared_path}/config/database.yml"
    puts "Now edit the config files in #{shared_path}"
  end

  task :symlink_database_yml, roles: :app do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end
  after "deploy:finalize_update", "deploy:symlink_database_yml"

  task :setup_db, roles: :app do
    run "cd #{current_path} && bundle exec rake db:create RAILS_ENV=production"
  end

  task :start, roles: :app, except: { no_release: true } do
    run "cd #{current_path} && bundle exec thin -d -e production start -p 3067"
  end

  task :stop do
    run "cd #{current_path} && bundle exec thin -d -e production stop"
  end

  task :restart, :roles => :app, :except => { :no_release => true } do
    stop
    start
  end
end


desc "tests connection to github from workstation and host"
task :github do
  run "ssh -T git@github.com"
end

desc "initial app startup"
task :startup do
  #run "rvm info && type rvm | HEAD -1"
  #run "cd #{current_path} && gem li && rvm gemset name && rvm info"
  #run "cd #{current_path} && rails s"
end

namespace :maintenance do
  task :update_data, roles: :app do
    run "cd #{current_path} && bundle exec rake production:userstories RAILS_ENV=production"
    run "cd #{current_path} && bundle exec rake production:projects RAILS_ENV=production"
    run "cd #{current_path} && bundle exec rake production:sprint_userstories RAILS_ENV=production"
  end
end
