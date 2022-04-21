Feature: Cadastra usuario
Scenario: Deve ser possivel cadastrar um usuario
    * def aleatorio = '' + Math.floor(Math.random() * 999)    
    * def mailEaleatorio = "nome." + aleatorio + "@mail.com"
    Given url baseUrl
    Given path "users"
    And request
    """
{
  "name": "Iramar Prates",
  "email": "#(mailEaleatorio)"
}
    """
    When method post
    Then status 201
    And match response == "#object"
    * def idCriado = response.id
    #And match response contains {name: '#present', email: "#(mailEaleatorio)"}
    And match response contains {name: "Iramar Prates", email: "#(mailEaleatorio)"}
    And match response contains {"id":"#string", "name":"#string", "email":"#string", "createdAt":"#string", "updatedAt": "#string"}
 