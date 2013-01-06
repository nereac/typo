Feature: edit and add categories

  As a blog administrator
  In order to organize the articles
  I want to edit and add categories

  Background:
    Given the blog is set up
    And I am logged into the admin panel
    Given I am on the admin content page
    When I follow "Categories"
    Then I should be on the New Categories page



