*** Settings ***
Documentation    Keywords relacionadas ao header do site

Resource    ../pages/carrinho_compras_page.robot

*** Keywords ***

Verificar o produto no pre carrinho e clicar para ir para o carrinho
    [Arguments]    ${nome_produto}
    
    Verificar o nome do produto na tela de precarrinho     ${nome_produto}
    Clicar no botao ir para o carrinho

Verificar se o produto foi adicionado no carrinho de compras
    [Arguments]    ${nome_produto}

    Verificar o nome do produto no carrinho de compras    ${nome_produto}