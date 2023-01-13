*** Settings ***
Resource    konia_resources.robot
Test Setup    Abrir o navegador
Test Teardown    Fechar o navegador

*** Test Cases ***
Caso de Teste 01 - Acesso ao menu "Quem Somos"
    Dado que o usuário esteja na página home page da Konia.com.br
    Quando ele clicar no menu "quem Somos"
    Então o título da página deverá ser "Quem Somos » Konia Consultoria e Informática"