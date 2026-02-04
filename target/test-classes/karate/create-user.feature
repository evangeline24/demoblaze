@ignore
Feature: Reusable User Creation

  Scenario: Create User
    * def time = java.lang.System.currentTimeMillis()
    * def random = Math.floor(Math.random() * 90000) + 10000
    * def username = 'testuser_' + time + '_' + random