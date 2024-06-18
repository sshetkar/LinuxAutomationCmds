
Feature: Failed Scenarios for end to end web testing live site 17-07-2024

  Scenario: TC-Login-05
    Given User is on the login page
    When User enters invalid OTP
    And User submits the form
    Then User should see an OTP failed message

  Scenario: TC-Login-08
    Given User is on the login page
    When User enters incorrect password multiple times
    Then User account should be locked for 30 minutes

  Scenario: TC-Homepage-01
    Given User is on the homepage
    When User interacts with the chatbot
    And User submits a refund ticket
    Then User should see a message that refund ticket cannot be submitted

  Scenario: TC-Search-03
    Given User is on the search page
    When User searches for a non-existent item
    Then User should see a "No results found" message

  Scenario: TC-Checkout-07
    Given User has items in the cart
    When User proceeds to checkout
    And User enters an invalid credit card number
    Then User should see a payment failure message

  Scenario: TC-Profile-12
    Given User is on the profile page
    When User tries to update email with an invalid format
    Then User should see an error message indicating invalid email format

  Scenario: TC-Settings-09
    Given User is on the settings page
    When User attempts to change the password with mismatching new passwords
    Then User should see a password mismatch error message

  Scenario: TC-Registration-14
    Given User is on the registration page
    When User tries to register with an already registered email
    Then User should see an error message indicating email is already in use

  Scenario: TC-Contact-04
    Given User is on the contact us page
    When User submits the form without entering mandatory fields
    Then User should see validation error messages for the mandatory fields

  Scenario: TC-Order-10
    Given User is on the order history page
    When User tries to reorder an out-of-stock item
    Then User should see an out-of-stock error message
