Feature: Listar usuario
Scenario: Deve ser possível listar os usuários do sistema 
    Given url baseUrl
    Given path "users"
    When method get
    Then status 200
    And match response == "#array"
    And match response contains {"id":"#string", "name":"#string", "email":"#string", "createdAt":"#string", "updatedAt": "#string"}