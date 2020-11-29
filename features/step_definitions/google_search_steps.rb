Given('I search for {string} on google.com') do |search_string|
  visit GoogleSearchPage do |page|
    page.search_for(search_string)
  end
end

Then('I should find search results for {string}') do |search_string|
  on GoogleSearchPage do |page|
    expect(@current_page.text).not_to include("Your search - #{search_string} - did not match any documents")
  end
end

And('every search result should contain {string}') do |search_string|
  on GoogleSearchPage do |page|
    page.verify_search_results(search_string)
  end
end
