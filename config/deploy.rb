require "bundler/capistrano"

set :stages, %w(production staging)
require 'capistrano/ext/multistage'

set :environment do
  deploy_to = Capistrano::CLI.ui.ask 'Deploy to (p)roduction or (s)taging: '
  case deploy_to.split.first
    when 'p' then :production
    when 's' then :staging
    else :staging
  end
end