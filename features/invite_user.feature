Feature: Invite user
  As a
  I want to be able to invite users and admin users to use the system
  so that the people who need to access the system are able to do so.

  Background:
    * I am logged into the system as an admin

  Scenario: Add a user
    Given a users email address "normaluser@test.com"
    When I enter the email address into the user form
    And I send the invite
    Then I see a user created message
    And the email address is in the list of users


  Scenario: Add an admin user
    Admin users are able to invite other people to use the system
    Given a users email address "adminuser@test.com"
    When I enter the email address into the user form
    And I select that the user is an admin
    And I send the invite
    Then I see a user created message
    And the email address is in the list of users

  Scenario: Add a duplicate user
  email addresses must be unique the test email is
  used to login to run the tests so is a duplicate
    Given a users email address "test@test.com"
    When I enter the email address into the user form
    And I send the invite
    Then I see an error message about the email

  Scenario: Normal user cannot add a user
    Given a users email address "normaluser@login.com"
    # Login as a normal user
    When I am logged into the system
    Then I cannot access the user form
