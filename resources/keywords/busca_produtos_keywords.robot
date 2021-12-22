*** Settings ***
Documentation    Keywords relacionadas a funcionalidade de login

Resource    ../pages/busca_produtos_page.robot
Resource    ../pages/header_page.robot

*** Keywords ***

Verificar se a página de busca retornou algum produto 
    
    Verificar se a pagina de busca não está vazia
    Verificar se a página de busca está visível 
    Verificar se o seção de ordenação dos resultados de busca está visível

Retornar o nome do produto pelo index na tela de busca
    [Arguments]    ${index}

    ${produto}=    Retornar um produto pelo index na pagina de busca    ${index}

    [Return]    ${produto}

Clicar no botão comprar de um produto na tela de busca
    [Arguments]    ${nome_produto}

    Mouse Over em um produto da página de busca   ${nome_produto}
    Clicar no botão comprar em um produto na página de busca    ${nome_produto}

Adicionar um item random do carrinho de compras

    ${index}=    Retornar um index random de produto da tela de busca
    ${produto}=    Retornar o nome do produto pelo index na tela de busca    ${index}
    Clicar no botão comprar de um produto na tela de busca    ${produto}

    [Return]    ${produto}
