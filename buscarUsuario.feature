Feature: Buscar usuario
Scenario: Deve ser possivel buscar um usuario
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
    * def idCriado = response.id
    * print (idCriado)
#Teste buscar usuario
    Given path "users/"+idCriado
    When method get
    Then status 200
    And match response == "#object"
    And match response contains {"id":"#string", "name":"#string", "email":"#string", "createdAt":"#string", "updatedAt": "#string"}