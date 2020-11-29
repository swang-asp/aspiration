# aspiration

This repo contains the Cucumber tests to perform a google search for ducks and
GET requests againsts the /posts endpoint provided by JSONPlaceHolder.

## Directory Structure

```
aspiration/
├── bin
│   └── geckodriver	
├── config
│   └── cucumber.yml
├── features			
│   ├── google_search.feature		
│   ├── jsonplaceholder.feature
│   ├── step_definitions
│   │   ├── google_search_steps.rb
│   │   └── rest_api_steps.rb
│   └── support
│       ├── env.rb
│       ├── hooks.rb
│       ├── initialize_browser.rb
│       ├── json_spec.rb
│       └── pages
│           └── google_search_page.rb
├── Gemfile
├── Gemfile.lock
└── README.md
```

## Running the tests

The tests are implemented in Ruby.  My suggestion would be to install ruby and rvm which doesn't require root privileges
and will result in Ruby gems being installed under the user's home directory.  In addition to Ruby, the bundler gem needs 
to be installed in order to install all of the dependent Ruby gems identified in Gemfile.lock.

Note, to run the tests headless as suggested in item 6 below, Xvfb must be installed.  In my Ubuntu VM running under
VirtualBox, I installed this by executing "sudo apt-get update -y", followed by "sudo apt-get install -y xvfb".

1.  Install rvm and ruby, if not already installed.
2.  Install the bundler gem via "gem install bundler".
3.  Issue a git clone to retrieve the repo.
4.  Change directory to where the repo resides and execute "bundle install" to install the dependent gems.
5.  The google search test is implemented with firefox and makes use of the geckodriver in the bin directory, which must be in the current $PATH.
6.  Execute "export PATH=$PATH:./bin" to add the bin directory to the search path.
7.  To run the google search test, execute "cucumber features/google_search.feature".
8.  To run the google search test headless, execute "cucumber -p headless features/google_search.feature".
9.  To run the JSONPlaceHolder tests, execute "cucumber features/jsonplaceholder.feature".

