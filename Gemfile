source "https://rubygems.org"

gem 'rake'
gem 'sinatra'

group :local_test do
  gem 'rack-test'
  gem 'rspec'
end

group :integration_test do
  gem 'cucumber'
  gem 'watir-webdriver'
end

group :development do
end

group :production do
  gem 'newrelic_rpm'
  gem 'puma'
end
