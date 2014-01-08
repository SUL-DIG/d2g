set :rails_env, "development"
set :deployment_host, "dig-dev.stanford.edu"
set :repository, "git@github.com:sul-dig/d2g.git"
set :branch, "master"
set :bundle_without, [:deployment,:production]

role :web, deployment_host
role :app, deployment_host
role :db,  deployment_host, :primary => true
