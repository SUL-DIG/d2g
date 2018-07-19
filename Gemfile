source 'https://rubygems.org'

gem 'rails', '~> 4.2'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

group :development do
  gem 'sqlite3'
end

gem 'mysql2', '~> 0.3'

# Gems used only for assets and not required
# in production environments by default.
#group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
#end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'

# To install blacklight
gem 'blacklight', '~> 4.6'
gem "unicode", :platforms => [:mri_18, :mri_19]
gem "devise"
gem "devise-guests", "~> 0.3"
gem "bootstrap-sass"
# To create the year slider
gem 'blacklight_range_limit', '~> 2.1'


# gems necessary for capistrano deployment
group :deployment do
  gem 'capistrano', '~> 3.2'
  gem 'capistrano-rails'
  gem 'capistrano-bundler'
  gem 'dlss-capistrano'
  gem 'net-ssh', '~> 4.0'
end

gem 'protected_attributes'
gem 'solr_wrapper', group: :development
