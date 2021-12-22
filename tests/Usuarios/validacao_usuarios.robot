*** Settings ***
Documentation    Suite de testes para validação de usuários

Resource     ../../resources/keywords/common_keywords.robot
Resource     ../../resources/keywords/login_keywords.robot

Suite Setup       Abrir a página home do site
Suite Teardown    Fechar o browser

*** Test Cases ***

Deve ser retornada uma mensagem de erro ao tentar login com um usuário inválido

    ${usuario}=    Retornar dados de um novo usuário fake
    Realizar login no site    ${usuario}
    Verificar se o alert de erro para usuários inválidos está visível    Dados inválidos, tente novamente!
