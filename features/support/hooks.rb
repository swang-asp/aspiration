Before ("@ui") do
  initialize_browser
end

After ("@ui") do
  @browser.close
end
