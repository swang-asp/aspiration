class GoogleSearchPage
  include PageObject
  include RSpec::Matchers

  page_url "http://google.com"

  text_field :search,          :name  => 'q'
  div        :search_results,  :id    => 'rso'

  # Perform Google Search
  def search_for(search_string)
    search_element.send_keys(search_string)
    search_element.send_keys(:enter)
  end

  # Verify the text in each div representing a search result includes our search string.
  def verify_search_results(search_string)
    search_results_element.when_visible
    search_results_element.div_elements(:class => 'rc').each do |search_result|
      expect search_result.text.downcase.should include search_string
    end
  end
end

