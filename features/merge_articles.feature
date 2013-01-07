Feature: merge of similar articles

  As a blog administrator
  As multiple users can write similar articles
  I want be able merge similar articles

  Background: Users, articles and comments in database

    Given the blog is set up

    Given the following users exist:
    | id  | login | password |      email    | name |
    | 2   | pepe  |  111111  | pepe@mail.com | Pepe |
    | 3   | paco  |  222222  | paco@mail.com | Paco |

    Given the following articles exist:
    | id |   title  | author | user_id |   body   |      published_at    | 
    | 3  | Article1 |  pepe  |    2    | Content1 |  2012-10-10 10:10:00 | 
    | 4  | Article2 |  paco  |    3    | Content2 |  2012-09-09 09:09:00 |

    Given the following comments exist:
    | id | author |    body   | article_id | user_id |     created_at      |
    | 1  |  pepe  |  Comment1 |     3      |    2    | 2012-11-11 11:11:00 |
    | 2  |  paco  |  Comment2 |     4      |    3    | 2012-12-12 12:12:00 |


  Scenario: An user that isn't admin can't merge articles
    Given I am on the login page
    When I fill in "user_login" with "pepe" 
    And I fill in "user_password" with "111111"
    And I press "Login"
    Then I should see "Login successful"
    #And I am on the edit article '3' page
    #Then I should not see "Merge Articles"

  Scenario: After merge two articles, the new article should be contain the text of the two original articles 
    Given that the articles '3' and '4' were merged
    And I am on the home page
    Then I should see "Article1"
    And I should not see "Article2"
    When I follow "Article1"
    Then I should see "Content1"
    And I should see "Content2"

  Scenario: The autor of the new article should be the autor of one of the two merged articles 
    Given that the articles '3' and '4' were merged
    Then 'pepe' should be author of article with id '3'
    And 'paco' should not be author of article with id '3' 

  Scenario: The comments of the articles that have merged must appear as comments of the new article.
    Given that the articles '3' and '4' were merged
    When I am on the home page
    Then I should see "Article1"
    When I follow "Article1"
    Then I should see "Comment1"
    And I should see "Comment2"

  Scenario: The title of the new article should be the title of one of the two merged articles 
    Given that the articles '3' and '4' were merged
    When I am on the home page
    Then I should see "Article1"
    And I should not see "Article2"



