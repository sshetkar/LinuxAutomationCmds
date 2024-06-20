@sanity
Feature: Using 'Todo api' to demonstarte basic way to write feature file and few basic validations

Background:
    # As implementation of this feature file is without 'Page Object Model' we are not using background keyword 

@todo
Scenario: [TC-TD-01] To verify sample 'To-Do' request
    Given url 'https://api.storerestapi.com/todos'
    When method get
    Then status 200
    
@todo
Scenario: [TC-TD-02] To verify sample 'To-Do' request (with addition of 'path' keyword)
    Given url 'https://api.storerestapi.com'
    And path '/todos'
    When method get
    Then status 200

@todo
Scenario: [TC-TD-03] To verify we are succesfully print the response
    Given url 'https://api.storerestapi.com/todos'
    When method get
    Then status 200

    And print response

@todo
Scenario: [TC-TD-04] To validate status reponse is 200
    Given url 'https://api.storerestapi.com/todos'
    When method get
    Then status 200

    And print response
    And assert responseStatus == 200

@todo
Scenario: [TC-TD-05] To verify reponse headers and cookies
    Given url 'https://api.storerestapi.com/todos'
    When method get
    Then status 200

    And print response
    And assert responseStatus == 200
    And print responseHeaders
    And print responseCookies