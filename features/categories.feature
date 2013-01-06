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


  Scenario: create a new categorie
    Then I fill in "Name" with "NewCategorie"
    And I fill in "Keywords" with "NewKeywords"
    And I fill in "Permalink" with "NewPermalink"
    And I fill in "Description" with "NewDescription"
    And I press "Save"
    Then I should be on the New Categories page
    And I should see "NewCategorie"
    And I should see "NewKeywords"
    And I should see "NewPermalink"
    And I should see "NewDescription"
  
  Scenario: edit categorie
    When I follow Edit for 'General' category
    Then I should be on the edit 'General' category page
    And I fill in "Keywords" with "NewKeywords"
    And I press "Save"
    Then I should be on the New Categories page
    And I should see "General"
    And I should see "NewKeywords"

