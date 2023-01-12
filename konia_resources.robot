*** Settings ***
Library    SeleniumLibrary
Library    Process

*** Variables ***
${URL}    https://konia.com.br

*** Keywords ***
Abrir o navegador
    Open Browser    browser=edge
    Maximize Browser Window
    

Dado que o usuário esteja na página home page da Konia.com.br
    Go To    url=${URL}
    Sleep    10s
    #Maximize Browser Window