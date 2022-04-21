Feature: Listar usuario
Background: Base url
    # Configuração do baseUrl da API
    Given url "https://crud-api-academy.herokuapp.com/api/v1"

Scenario: Deve ser possível listar os usuários do sistema 
    Given path "users"
    When method get
    Then status 200
    And match response == "#array"
    And match response contains {"id":"#string", "name":"#string", "email":"#string", "createdAt":"#string", "updatedAt": "#string"}