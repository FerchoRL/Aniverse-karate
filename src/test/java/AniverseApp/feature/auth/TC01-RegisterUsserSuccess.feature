Feature: TC101 - Registro exitoso de usuario

    Validar que el endpoint de registro permita crear un nuevo usuario con datos validos

Background: Establecer URL y variables de entorno global

    Given url apiUrl
    * def dataGenerator = Java.type('AniverseApp.helpers.DataGenerator')
    * def payload = read('classpath:AniverseApp/data/New-user.json')
    # create and save x-token in headers
    * def result = callonce read('classpath:AniverseApp/operations/AuthLoginUtility.feature')
    * def accessToken = result.token
    * configure headers = { 'x-token': "#(accessToken)" }

@TC101 @TC102 @RegistroUsuarios
Scenario Outline: '<TC_NAME>': Registro exitoso de usuario con '<ROLE>' y datos validos
    # Initialize data
    * set payload.userName = dataGenerator.getRandomUserName()
    * set payload.email = dataGenerator.getRandomEmail()
    * set payload.role = '<ROLE>'
    Given path 'api/users/'
    And request payload
    When method Post
    Then status 200
    * print response
    # Response validations
    * def userCreatedResponse = response.user
    * def uid = userCreatedResponse.uid
    #SCHEMA VALIDATION Validate each user property
    And match userCreatedResponse ==
    """
    {
        "userName":"#string",
        "email":"#string",
        "role":"#string",
        "state":"#boolean",
        "userOrigin":"#regex ^\\d{4}-\\d{2}-\\d{2}T\\d{2}:\\d{2}:\\d{2}\\.\\d{3}Z$",
        "uid":"#string"
    }
    """
    #Schema validation. Validate date with other form
    #"userOrigin":"#? new Date(_).toISOString() == _"

    #Validate response against request
    And match payload.userName == userCreatedResponse.userName
    And match payload.email == userCreatedResponse.email
    And match userCreatedResponse.role == '<ROLE>'

    #Validate response against get user by ID
    Given path 'api/users/', uid
    When method get
    Then status 200
    * print response
    * def getUserResponse = response.user
    And match userCreatedResponse.userName == getUserResponse.userName
    And match userCreatedResponse.email == getUserResponse.email
    And match userCreatedResponse.role == getUserResponse.role
    And match userCreatedResponse.state == getUserResponse.state
    And match userCreatedResponse.userOrigin == getUserResponse.userOrigin


    Examples:
        | TC_NAME   | ROLE      |
        | TC-101    | USER_ROLE |
        | TC-102    | ADMIN_ROLE|