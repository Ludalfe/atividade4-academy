Feature: Deletar usuario
Background: Base url

    Given url "https://crud-api-academy.herokuapp.com/api/v1"
Scenario: Deve ser possivel deletar um usuario
    * def aleatorio = '' + Math.floor(Math.random() * 999)    
    * def mailEaleatorio = "nome." + aleatorio + "@mail.com"
    Given path "users"
    And request
    """
{
  "name": "Nome para delete",
  "email": "#(mailEaleatorio)"
}
    """
    When method post
    Then status 201
    * def idCriado = response.id
    * print (idCriado)

    Given path "users/"+idCriado
    When method delete
    Then status 204