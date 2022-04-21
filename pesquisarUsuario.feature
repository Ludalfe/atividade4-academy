Feature: Pesquisar por usuario
Background: Base url
    # Configuração do baseUrl da API
    Given url "https://crud-api-academy.herokuapp.com/api/v1"
Scenario: Deve ser possivel buscar um usuario
    * def aleatorio = '' + Math.floor(Math.random() * 999)    
    * def mailEaleatorio = "nome." + aleatorio + "@mail.com"
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
    * print (emailCriado)
#Teste buscar usuario
    Given path "search"
    And request { value: "#(emailCriado)" }
    When method get
    Then status 200
    And match response == "#array"
   