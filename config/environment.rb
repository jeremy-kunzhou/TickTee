# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Rails.application.initialize!
# ENV['RAILS_ENV'] ||= 'production'

ActionMailer::Base.smtp_settings = {
  address: 'smtp.sendgrid.net',
  port: '587',
  authentication: :plain,
  user_name: 'app26655623@heroku.com',
  password: 'wfcgboik',
  domain: 'heroku.com',
  enable_starttls_auto: true
}