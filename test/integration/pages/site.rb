class UnnamedAppSite
  def initialize(browser, root_url)
    @browser = browser
    @root_url = root_url
  end

  def load(pageClass)
    page = pageClass.new(@browser, @root_url)
    page.load
    page
  end
end
