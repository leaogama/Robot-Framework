*** Settings ***
Library    SeleniumLibrary
Library    Process

*** Variables ***
${URL}    https://konia.com.br
#${URL}    https://web.whatsapp.com
${MENU_QUEM_SOMOS}    (//a[@href='https://konia.com.br/quem-somos/'][contains(.,'Quem Somos')])[1]
# driver.findElement(By.xpath("(//a[normalize-space()='Quem Somos'])[1]"))
#div[data-testid="chat-list-search"]
${TITLE_QUEM_SOMOS}    Quem Somos » Konia Consultoria e Informática
${MENU_BLOG}    menu-item-218
#${MENU_BLOG}    (//a[@href='https://konia.com.br/blog/'][contains(.,'Blog')])[1]
${BLOG_INPUT_PESQUISAR}    //input[@type='search'][contains(@id,'input-1')]
${BLOG_BOTAO_PESQUISAR}    //button[@type='submit'][contains(.,'Pesquisar')]
${VALIDACAO_ARTIGO}    //a[contains(.,'O que é o JMeter?')]


*** Keywords ***
Abrir o navegador
    Open Browser    browser=edge
    Maximize Browser Window
    
    
Fechar o navegador
    Capture Page Screenshot
    Close Browser

Dado que o usuário esteja na página home page da Konia.com.br
    Go To    url=${URL}
    Sleep    3s
    Capture Page Screenshot
    #Maximize Browser Window

Quando ele clicar no menu "quem Somos"
    Click Element    locator=${MENU_QUEM_SOMOS}
    Sleep    3s

Então o título da página deverá ser "Quem Somos » Konia Consultoria e Informática"
    Wait Until Page Contains    text=${TITLE_QUEM_SOMOS}


Quando ele clicar no menu "Blog"
    Click Element    locator=${MENU_BLOG}
    Sleep    3s

E pesquisar por "${PESQUISA}" no campo de busca
    Input Text    locator=${BLOG_INPUT_PESQUISAR}    text=${PESQUISA}
    Click Element    locator=${BLOG_BOTAO_PESQUISAR}
    Sleep    3s

Então deverá ser exibido na tela a lista de artigos referentes ao tema buscado
    Wait Until Page Contains Element    locator=${VALIDACAO_ARTIGO}
    Sleep    3s