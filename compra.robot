*** Settings ***
Documentation               Fluxo de compra no site da Petz

Library                     SikuliLibrary

Suite Setup                 Add Image Path      ${EXECDIR}//resources//images
Suite Teardown              Esquecer Encerrar

*** Test Cases ***
Compra
    [Tags]    SMOKE

    Dado que acesso o site da Petz
    Quando pesquiso o produto "comedouro retratil"
    Entao visualizo o resultado da pesquisa
    Quando seleciono o produto
    Entao visualizo o nome, preco
    E adiciono duas unidades ao carrinho
    Entao visualizo o produto e o total no carrinho

*** Keywords ***
Dado que acesso o site da Petz
    Click                   icone_chrome.png
    Click                   modo_visitante.png
    Input Text              barra_endereco.png      https://www.petz.com.br
    Press Special Key       ENTER

Quando pesquiso o produto "${produto}"
    Set Test Variable       ${produto}
    Input Text              barra_pesquisa.png      ${produto}
    Click                   lupa.png

Entao visualizo o resultado da pesquisa
    Wait Until Screen Contain   resultado_para.png      20000
    Screen Should Contain       resultado_para.png

Quando seleciono o produto
    Click                       pote.png

Entao visualizo o nome, preco
    Wait Until Screen Contain   comedouro_bowl.png      20000
    Wait Until Screen Contain   preco.png               20000
    Click                       lgpd.png

E adiciono duas unidades ao carrinho
    Click                       btn_mais.png
    Screen Should Contain       btn_mais_2.png
    Click                       adicionar_carrinho.png

Entao visualizo o produto e o total no carrinho
    Wait Until Screen Contain   pote_carrinho.png       20000
    Screen Should Contain       pote_carrinho.png
    Screen Should Contain       preco_carrinho.png
    Screen Should Contain       qtd_carrinho.png
    Screen Should Contain       preco_total.png

Esquecer Encerrar
    Click                       excluir_carrinho.png
    Click                       confirma_exclusao.png
    Wait Until Screen Contain   carrinho_vazio.png      20000
    Click                       fechar_X.png
    Stop Remote Server