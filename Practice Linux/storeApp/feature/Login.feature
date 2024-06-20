@sanity
Feature: Using 'Login api' to demonstarte positive and negative test cases

Background:
    #Declarations and file read of headers/ cookies, URL
    * def fetchDataFromPrerequisiteFile = read('../other/prerequsite.json')
    * def getUrl = fetchDataFromPrerequisiteFile.config
    * def getHeaders = fetchDataFromPrerequisiteFile.actualHeaders

    #Declarations and file read of 'Login.json' request body
    * def getRequestBodyLogin = read('../request/requestBodyLogin.json')

    #Declarations and file read of 'Login.json' response body
    * def getResponseBodyLogin = read('../response/responseBodyLogin.json')

@login
Scenario: [TC-LO-01] To verify 'POST' request for successful login
    Given url getUrl.storeBaseUrl + getUrl.typeAuthApi + getUrl.login
    * headers getHeaders
    And request getRequestBodyLogin.validEmailPass
    When method post
    And print response
    
    And assert responseStatus == 200

@login
Scenario: [TC-LO-02] To verify successful login response message and status
    Given url getUrl.storeBaseUrl + getUrl.typeAuthApi + getUrl.login
    * headers getHeaders
    And request getRequestBodyLogin.validEmailPass
    When method post
    And print response
    
    And assert responseStatus == 200

    * def expectedMessage = getResponseBodyLogin.successLoginMessage.message
    * print expectedMessage
    * def actualMessage = response.message
    * print actualMessage
    And assert expectedMessage == actualMessage

    * def expectedStatus = getResponseBodyLogin.successLoginMessage.status
    * print expectedStatus
    * def actualStatus = response.status
    * print actualStatus
    And assert expectedStatus == actualStatus

@login
Scenario: [TC-LO-03] To verify 'Fuzzy Matching' for successful login
    Given url getUrl.storeBaseUrl + getUrl.typeAuthApi + getUrl.login
    * headers getHeaders
    And request getRequestBodyLogin.validEmailPass
    When method post
    And print response
    
    And assert responseStatus == 200

    * def expectedResponseDataTypes = 
    """
        getResponseBodyLogin.successLoginMessageFuzzyMatch
    """
    * print expectedResponseDataTypes
    * def actualResponseDataTypes = response
    * print actualResponseDataTypes
    And match actualResponseDataTypes == expectedResponseDataTypes

@login
Scenario Outline: [TC-LO-04 - TC-LO-06] To verify error messages for wrong multiple input request
    Given url getUrl.storeBaseUrl + getUrl.typeAuthApi + getUrl.login
    * headers getHeaders
    And request <requestBody>
    When method post
    And print response

    And assert responseStatus == <responseCode>

    * def expectedResponse = <responseErrorMessage>
    * print expectedResponse
    * def actualResponse = response
    * print actualResponse
    And match actualResponse == expectedResponse

Examples:
| Test Case |              requestBody              | responseCode |                  responseErrorMessage                |
| TC-LO-04  |    getRequestBodyLogin.wrongPassword  |      400     |    getResponseBodyLogin.errorMessageofWrongPassword  | 
| TC-LO-05  |     getRequestBodyLogin.blankPassword |      422     |    getResponseBodyLogin.errorMessageofBlankPassword  |
| TC-LO-06  |     getRequestBodyLogin.blankEmail    |      422     |    getResponseBodyLogin.errorMessageofBlankEmail     |
| TC-LO-07  | getRequestBodyLogin.missingEmailField |      422     | getResponseBodyLogin.errorMessageofMissingEmailField |
| TC-LO-08  |     getRequestBodyLogin.wrongEmail    |      400     |    getResponseBodyLogin.errorMessageofWrongEmail     |