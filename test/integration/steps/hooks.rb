require 'rspec/expectations'
require 'watir-webdriver'
require_relative '../pages/site'
require_relative '../pages/home'

browser = Watir::Browser.new

Before do
  root_url = ENV['INTEGRATION_TEST_TARGET']
  @site = ComparablySite.new(browser, root_url)
  @site.load(HomePage)
end

at_exit do
  browser.close
end
