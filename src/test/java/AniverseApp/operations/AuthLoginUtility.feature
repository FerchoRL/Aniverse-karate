Feature:User login and Create token

Scenario: Create token
    Given url apiUrl
    Given path 'api/auth'
    #Recibo parametros desde karate-config
    And request { "email": "#(auth.email)", "password": "#(auth.password)" }
    When method Post
    * def token = response.token
    
