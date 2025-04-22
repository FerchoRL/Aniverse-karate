Feature: TC101 - Registro fallido de usuarios

Validar que el sistema rechace correctamente los intentos de registro con datos inválidos o incompletos.

Background: Establecer URL y variables de entorno global
#Initialize URL
Given url apiUrl
#Define functions and data
* def dataGenerator = Java.type('AniverseApp.helpers.DataGenerator')
* def payload = read('classpath:AniverseApp/data/New-user.json')
* def getErrorMessageProperty = eval(read('classpath:AniverseApp/operations/filter-property.js'))

* set payload.password = ""
* set payload.role = ""


@TC103 @TC104 @TC105 @TC106 @RegisterwithEmptyData
Scenario Outline: '<TC_NAME>': Registro fallido de usuario. '<ERROR_DESCRIPTION>'
# Initialize data
Given path 'api/users/'
And request payload
When method Post
Then status 400
* print response
# Response validations
# Email message validation
* def property = '<PROPERTY>'
# Function to get property message
* def error = getErrorMessageProperty(response.errors, property)
And match error.msg == '<ERROR_MSG>'


* print error

Examples:
    | TC_NAME   | PROPERTY      | ERROR_DESCRIPTION | ERROR_MSG |
    | TC-103    | userName      | user name vacio   | El username es obligatorio |
    | TC-104    | email         | email vacio       | El correo es obligatorio |
    | TC-105    | password      | password vacia    | El password es obligatorio |
    | TC-106    | role          | role vacia        | El rol es obligatorio |




@TC107 @TC108 @TC109 @TC110 @RegisterwithInvalidEmail
Scenario Outline: '<TC_NAME>': Registro fallido de usuario con correo invalido. Formato: '<DATA>'
# Initialize data
Given path 'api/users/'
* set payload.userName = "Test user"
* set payload.email = '<DATA>'
And request payload
When method Post
Then status 400
* print response
# Response validations
And match response.errors.email.msg == 'El correo no es valido'

Examples:
    | TC_NAME   | DATA |
    | TC-107    | @gmail.com |
    | TC-108    | test@gmailcom |
    | TC-109    | test@7.7 |
    | TC-110    | testgmail.com |

   

@TC111 @RegisterwithInvalidPassword
Scenario: TC111: Registro fallido de usuario con contraseña invalida. Formato: 4 digitos
# Initialize data
Given path 'api/users/'
* set payload.userName = "Test user"
* set payload.email = 'test@test.test'
* set payload.password = '1111'
And request payload
When method Post
Then status 400
* print response
# Response validations
And match response.errors.password.msg == 'El password debe tener mas de 4 caracteres'


@TC112 @RegisterExistedEmail
Scenario: TC112: Registro fallido de usuario con email existente.
# Initialize data
Given path 'api/users/'
* set payload.userName = "Test user"
* set payload.email = 'rlfernando7@gmail.com'
* set payload.password = '11111'
And request payload
When method Post
Then status 400
* print response
# Response validations
And match response.errors.email.msg == 'El correo ya está registrado'

@TC113 @RegisterInvalidRole
Scenario: TC113: Registro fallido de usuario con rol invalido.
# Initialize data
Given path 'api/users/'
* set payload.userName = "Test user"
* set payload.email = 'rlfernando7@gmail.com'
* set payload.password = '11111'
* set payload.role = 'invalidrole'
And request payload
When method Post
Then status 400
* print response
# Response validations
* def role = payload.role
And match response.errors.role.msg == `El role ${role} no esta registrado en BD`