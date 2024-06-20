@sanity
Feature: Using 'Login api' to demonstarte token values of each user are unique(dynamic)

Background:
    #Declarations and file read of headers/ cookies, URL
    * def fetchDataFromPrerequisiteFile = read('../other/prerequsite.json')
    * def getUrl = fetchDataFromPrerequisiteFile.config
    * def getHeaders = fetchDataFromPrerequisiteFile.actualHeaders
    * def getTokenHeaders = fetchDataFromPrerequisiteFile.actualToken

    #Declarations and file read of 'Login.json' request body
    * def getRequestBodyLogin = read('../request/requestBodyLogin.json')

    #Declarations and file read of 'Login.json' response body
    * def getResponseBodyLogin = read('../response/responseBodyLogin.json')

@sessionToken
Scenario: [TC-SV-01] To verify access token are not matched for newly registered v/s existing user

    # Calling pre-requisite register request to generate new 'access_token' and 'refresh_token'
    * def result = call read('ExecutionHelper/Register.feature@generateToken')

    Given url getUrl.storeBaseUrl + getUrl.typeAuthApi + getUrl.login
    * headers getHeaders
    * print getHeaders
    And request getRequestBodyLogin.validEmailPass
    When method post
    And print response
    
    And assert responseStatus == 200

    * def storedAccessToken = fetchDataFromPrerequisiteFile.actualToken
    * print storedAccessToken
    * def existingUserAccessToken = response.data.access_token
    * print existingUserAccessToken
    
    And match storedAccessToken != existingUserAccessToken
    # Expected Result: As access token values are different it will NOT match and result is PASS.

@sessionToken
Scenario: [TC-SV-02] To verify if we try to match the access token for newly registered and existing user it will fail as expected

    # Calling pre-requisite register request to generate new 'access_token' and 'refresh_token'
    * def result = call read('ExecutionHelper/Register.feature@generateToken')

    Given url getUrl.storeBaseUrl + getUrl.typeAuthApi + getUrl.login
    * headers getHeaders
    * print getHeaders
    And request getRequestBodyLogin.validEmailPass
    When method post
    And print response
    
    And assert responseStatus == 200

    * def storedAccessToken = fetchDataFromPrerequisiteFile.actualToken
    * print storedAccessToken
    * def existingUserAccessToken = response.data.access_token
    * print existingUserAccessToken
    
    And match storedAccessToken == existingUserAccessToken    
    # Expected Result: As access token values are different so when will match it FAILS.