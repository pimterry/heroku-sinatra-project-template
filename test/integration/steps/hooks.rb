require 'rspec/expectations'
require 'watir-webdriver'
require_relative '../pages/site'
require_relative '../pages/home'

if ENV['WEBDRIVER_URL'] then
  browser = Watir::Browser.new(:remote, :url => ENV['WEBDRIVER_URL'])
else
  browser = Watir::Browser.new(:phantomjs)
end

Before do
  root_url = ENV['INTEGRATION_TEST_TARGET']
  @site = UnnamedAppSite.new(browser, root_url)
  @site.load(HomePage)
end

at_exit do
  browser.close
end
