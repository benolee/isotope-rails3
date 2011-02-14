require 'erb'

# RVM bootstrap
$:.unshift(File.expand_path("~/.rvm/lib"))
require 'rvm/capistrano'
set :rvm_ruby_string, '1.9.2-head@isotope-rails3'
set :rvm_type, :user

# Bundler bootstrap
require 'bundler/capistrano'

# main details
set :application, "isotopebeta.isotope11.com"
role :web, "isotopebeta.isotope11.com"
role :app, "isotopebeta.isotope11.com"
role :db, "isotopebeta.isotope11.com", :primary => true

# server details
default_run_options[:pty] = true
ssh_options[:forward_agent] = true
set :deploy_to, "/home/deployer/isotope-rails3"
set :user, "deployer"
set :use_sudo, false

# repo details
set :scm, :git
#set :git_username, "knewter"
set :repository, "git://github.com/altrux/isotope-rails3.git"
set :branch, "production"
set :git_enable_submodules, 1

# runtime dependencies
depend :remote, :gem, "bundler", ">=1.0.0.rc.2"

# tasks
namespace :deploy do
  before 'deploy:setup', :db

  task :start, :roles => :app do
    run "touch #{current_path}/tmp/restart.txt"
  end

  task :stop, :roles => :app do
    # Do nothing.
  end

  desc "Restart Application"
  task :restart, :roles => :app do
    run "touch #{current_path}/tmp/restart.txt"
  end

  desc "Symlink shared resources on each release"
  task :symlink_shared, :roles => :app do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end
end


namespace :db do
  desc "Create database yaml in shared path"
  task :default do
    db_config = ERB.new <<-EOF
production:
  database: isotope_site_rails3_production
  adapter: mysql
  username: root
  password: isotope_bang
    EOF

    run "mkdir -p #{shared_path}/config"
    put db_config.result, "#{shared_path}/config/database.yml"
  end
end

after 'deploy:update_code', 'deploy:symlink_shared'
