Feature: Demoblaze API Tests

  Background:
    * url 'https://api.demoblaze.com'
    * header Content-Type = 'application/json'
    * configure logPrettyRequest = true
    * configure logPrettyResponse = true
    
    # Usuario único para evitar conflictos
    * def createUser = callonce read('create-user.feature')
    * def uniqueUsername = createUser.username

  Scenario: 1. SIGNUP - Create new user successfully
    Given path 'signup'
    And request { username: '#(uniqueUsername)', password: 'TestPass123' }
    When method post
    Then status 200
    And match response == '#string'

  Scenario: 2. SIGNUP - Try to create existing user
    Given path 'signup'
    And request { username: '#(uniqueUsername)', password: 'TestPass123' }
    When method post
    Then status 200
    And match response.errorMessage contains 'This user already exist.'

  Scenario: 3. LOGIN - Correct credentials
    Given path 'login'
    And request { username: '#(uniqueUsername)', password: 'TestPass123' }
    When method post
    Then status 200
    And match response contains 'Auth_token:'

  Scenario: 4. LOGIN - Incorrect password
    Given path 'login'
    And request { username: '#(uniqueUsername)', password: 'WrongPassword456' }
    When method post
    Then status 200
    And match response.errorMessage == 'Wrong password.'

  Scenario: 5. LOGIN - Non-existent user (extra)
    Given path 'login'
    And request { username: 'nonexistent_user_xyz_123', password: 'TestPass123' }
    When method post
    Then status 200
    And match response.errorMessage == 'User does not exist.'