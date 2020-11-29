When('a GET is issued for {string} to JSONPlacerHolder') do |endpoint|
  uri = "https://jsonplaceholder.typicode.com#{endpoint}"
  @last_uri = uri
  @last_response = HTTParty.get(uri, :verify => false)
  log JSON.pretty_generate(JSON.parse(@last_response.body))
  @last_json = @last_response.body
end

Then('the last response code should be {int}') do |response_code|
  pretty_json = JSON.pretty_generate(JSON.parse(@last_response.body))
  expect(@last_response.code).to eql(response_code),
    "Expected response code #{response_code}, got: #{@last_response.code}\n" <<
    "\nURI:     #{@last_uri}\n" <<
    "\nCode:    #{@last_response.code}" <<
    "\nMessage: #{@last_response.message}" <<
    "\nResponse JSON:\n#{pretty_json}"
end

