Feature: Pesquisar por usuario
Scenario: Deve ser possivel pesquisar por um usuario
    * def aleatorio = '' + Math.floor(Math.random() * 999)    
    * def mailEaleatorio = "nome." + aleatorio + "@mail.com"
    Given url baseUrl
    Given path "users"
    And request
    """
{
  "name": "Joao Grillo",
  "email": "#(mailEaleatorio)"
}
    """
    When method post
    Then status 201
    * def emailCriado = response.email
    * def nomeCriado = response.name
    Given path "search"
    And request { value: "#(emailCriado)" }
    When method get
    Then status 200
    And match response == "#array"

    #busca por nome
    Given path "users"
    When method post
    Given path "search"
    And request { value: "#(nomeCriado)" }
    When method get
    Then status 200
    And match response == "#array"
   