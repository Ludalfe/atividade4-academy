Feature: Cadastra usuario
Background: Base url
    # Configuração do baseUrl da API
    Given url "https://crud-api-academy.herokuapp.com/api/v1"

Scenario: Deve ser possivel cadastrar um usuario
    * def aleatorio = '' + Math.floor(Math.random() * 999)    
    * def mailEaleatorio = "nome." + aleatorio + "@mail.com"
    Given path "users"
    And request
    """
{
  "name": "Iramar Prates",
  "email": "#(mailEaleatorio)"
}
    """
    # Configuração do verbo HTTP
    When method post
    # Teste que verifica se o response code é igual a 200
    Then status 201
    And match response == "#object"
    * def idCriado = response.id
    #And match response contains {name: '#present', email: "#(mailEaleatorio)"}
    And match response contains {name: "Iramar Prates", email: "#(mailEaleatorio)"}
    And match response contains {"id":"#string", "name":"#string", "email":"#string", "createdAt":"#string", "updatedAt": "#string"}
 