*** Settings ***
Documentation               Fluxo de compra no site da Petz

Library                     SikuliLibrary

#Suite Setup                 Start Sikuli Process 10000
#Suite Teardown              Stop Remote Server

*** Test Cases ***
Compra
    [Tags]    SMOKE

    Inicia sessao
    Dado que acesso o site da Petz
    Quando pesquiso o produto "comedouro retratil"
    Entao visualizo o resultado da pesquisa
    Quando seleciono o produto
    Entao visualizo o nome, preco
    E adiciono duas unidades ao carrinho
    Entao visualizo o produto e o total no carrinho
    Encerra sessao

*** Keywords ***
Aponta para as imagens
    Add Image Path              ${EXECDIR}\\resources\\images

Inicia sessao
    Aponta para as imagens

Dado que acesso o site da Petz
    Aponta para as imagens
    Click                       icone_chrome.png

Encerra sessao
    Stop Remote Server