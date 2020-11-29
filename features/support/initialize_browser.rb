def initialize_browser
  if ENV['HEADLESS']
    require 'headless'
    headless = Headless.new
    headless.start
  end

  @browser = Watir::Browser.new :firefox
end
