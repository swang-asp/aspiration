@ui

  Feature:  Google Search

    Scenario:  Do a google search for ducks and verify search results
               are returned and each result contains ducks.

      Given I search for "ducks" on google.com
      Then I should find search results for "ducks"
      And every search result should contain "duck"
