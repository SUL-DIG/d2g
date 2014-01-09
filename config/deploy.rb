require 'net/ssh/kerberos'
require 'bundler/setup'
require 'bundler/capistrano'
require 'dlss/capistrano'
require "rvm/capistrano"
require 'capistrano/ext/multistage'

set :stages, %W(development)
set :default_stage, "development"
set :bundle_flags, "--quiet"

set :sunet_id,   Capistrano::CLI.ui.ask('SUNetID: ') { |q| q.default =  `whoami`.chomp }
set :repository, "https://github.com/SUL-DIG/d2g.git"
set :deploy_via, :copy

set :shared_children, %w(
  log
  tmp
  config/database.yml
  config/solr.yml
)

set :user, "efahy"

set :destination, "/home/efahy"
set :application, "d2g_test_efahy"

set :copy_exclude, [".git"]
set :use_sudo, false
set :keep_releases, 3

set :deploy_to, "#{destination}/#{application}"

set :branch do
  DEFAULT_TAG = 'master'
  tag = Capistrano::CLI.ui.ask "Tag or branch to deploy (make sure to push the tag or branch first): [#{DEFAULT_TAG}] "
  tag = DEFAULT_TAG if tag.empty?
  tag
end

namespace :deploy do
  task :start do ; end
  task :stop do ; end
  task :restart, :roles => :app, :except => { :no_release => true } do
    run "touch #{File.join(current_path,'tmp','restart.txt')}"
  end
end

after "deploy", "deploy:migrate"
after "deploy:update", "deploy:cleanup"