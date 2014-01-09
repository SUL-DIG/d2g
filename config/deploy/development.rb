set :rails_env, "development"
set :deployment_host, "dig-dev.stanford.edu"

set :rvm_type, :system
set :rvm_ruby_string, "ruby-2.1.0"

role :web, deployment_host
role :app, deployment_host
role :db,  deployment_host, :primary => true
