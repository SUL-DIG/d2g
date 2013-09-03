# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
D2g::Application.initialize!

ActionMailer::Base.default(:from => "no-reply@opening_night.stanford.edu")