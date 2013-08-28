require_relative '../pages/home'

When(/^the home page is loaded directly$/) do
  @home = @site.load(HomePage)
end

Then(/^a successful response is received$/) do
  @home.is_loaded.should be_true
end
