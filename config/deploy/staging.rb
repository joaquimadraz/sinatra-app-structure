require "bundler/capistrano"

set :environment, "staging"
set :application, "##_SAMPLE_APP_##" ####################### <- CHANGE HERE  ####################
set :deploy_to, "/home/ubuntu/public_html/#{application}"

set :keep_releases, 4
set :use_sudo, false
set :port, 22

set :scm, "git"
set :user , "ubuntu"
set :normalize_asset_timestamps, false

ssh_options[:forward_agent] = true
default_run_options[:pty] = true
set :deploy_via, :remote_cache

############################################################ <- CHANGE HERE  ####################
ssh_options[:keys] = ["##_PATH_TO_KEY_IF_NEEDED_##"]  #
set :repository,      "##_APP_REPOSITORY_ENDPOINT_##" #
set :branch,          "##_STAGING_BRANCH_##"          #
role :app,            "##_SERVER_STG_ENDPOINT_##"     #
#######################################################

namespace :deploy do

  desc "Restarting with restart.txt"
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{release_path}/tmp/restart.txt"
  end

  desc "copies configuration files"
  task :copy_configuration_files, :roles => :app do
    run "ln -sf #{shared_path}/config/config.yml #{release_path}/config/config.yml"
    run "ln -sf #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end

end

before "deploy:finalize_update", "deploy:copy_configuration_files"
