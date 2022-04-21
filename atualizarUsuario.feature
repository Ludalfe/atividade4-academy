Feature: Atualiza usuario   
Scenario: Deve ser atualizar  um usuario
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

    * def aleatorio = '' + Math.floor(Math.random() * 999)    
    * def mailEaleatorio = "novo-nome." + aleatorio + "@novomail.com"
    Given path "users/"+idCriado
    And request
    """
{
  "name": "Iramar Prates atualizado",
  "email": "#(mailEaleatorio)"
}
    """
    
    When method put
    Then status 200
    And match response == "#object"
    * def idCriado = response.id
    And match response contains {name: "Iramar Prates atualizado", email: "#(mailEaleatorio)"}
    And match response contains {"id":"#string", "name":"#string", "email":"#string", "createdAt":"#string", "updatedAt": "#string"}
