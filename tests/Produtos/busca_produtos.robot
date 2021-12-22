*** Settings ***
Documentation    Suite de testes para validação da busca de produtos

Resource     ../../resources/keywords/common_keywords.robot
Resource     ../../resources/keywords/busca_produtos_keywords.robot

Suite Setup       Abrir a página home do site
Suite Teardown    Fechar o browser

Force Tags    busca_produtos

*** Test Cases ***

Realizar a busca de produtos no site e verificar se obteve algum resultado

    Realizar busca de um item    iphone
    Verificar se a página de busca retornou algum produto
