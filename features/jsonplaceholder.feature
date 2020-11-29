@api

  Feature:  JSONPlaceHolder

    Scenario Outline:  Verify a GET for /posts endpoint returns 100 posts.

      When a GET is issued for "/posts" to JSONPlacerHolder
      Then the last response code should be 200
      And the JSON response should have 100 entries
      And the JSON should include:
      """
      {
        "userId": 1,
        "id": 1,
        "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
        "body": "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
      }
      """
      And the JSON should include:
      """
      {
        "userId": 5,
        "id": 50,
        "title": "repellendus qui recusandae incidunt voluptates tenetur qui omnis exercitationem",
        "body": "error suscipit maxime adipisci consequuntur recusandae\nvoluptas eligendi et est et voluptates\nquia distinctio ab amet quaerat molestiae et vitae\nadipisci impedit sequi nesciunt quis consectetur"
      }
      """
      And the JSON should include:
      """
      {
        "userId": 10,
        "id": 100,
        "title": "at nam consequatur ea labore ea harum",
        "body": "cupiditate quo est a modi nesciunt soluta\nipsa voluptas error itaque dicta in\nautem qui minus magnam et distinctio eum\naccusamus ratione error aut"
      }
      """

    Scenario:  Verify a GET for /posts/1 returns the first post.

      When a GET is issued for "/posts/1" to JSONPlacerHolder
      Then the last response code should be 200
      And the JSON should be:
      """
      {
        "userId": 1,
        "id": 1,
        "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
        "body": "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
      }
      """

    Scenario Outline:  Verify that JSONPlaceHolder returns nothing for non-existent or invalid post ids.

      When a GET is issued for "<endpoint>" to JSONPlacerHolder
      Then the last response code should be 404
      And the JSON should be {}

        Examples:
          | endpoint    |
          | /posts/1000 |
          | /posts/abc  |
          | /posts/-100 |


