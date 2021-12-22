*** Settings ***
Documentation    Suite de testes para o carrinho de compras

Resource     ../../resources/keywords/common_keywords.robot
Resource     ../../resources/keywords/header_keywords.robot
Resource     ../../resources/keywords/busca_produtos_keywords.robot
Resource     ../../resources/keywords/carrinho_compras_keywords.robot

Suite Setup       Abrir a página home do site
Suite Teardown    Fechar o browser

Force Tags    carrinho_comprar

*** Test Cases ***

Selecione uma categoria no menu de “Departamento” e adicione um produto no carrinho
    
    Selecionar um item random na categoria departamento
    ${produto}=    Adicionar um item random do carrinho de compras

    Verificar o produto no pre carrinho e clicar para ir para o carrinho    ${produto}
    Verificar se o produto foi adicionado no carrinho de compras    ${produto}
