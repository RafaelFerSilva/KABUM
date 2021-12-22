*** Settings ***
Documentation    Keywords relacionadas a funcionalidade de login

Resource    ../pages/login_page.robot
Resource    ../pages/header_page.robot

*** Keywords ***

Realizar login no site
    [Arguments]    ${usuario}

    Clicar no link para login do usuário
    Verificar se a tela de login está visivel
    Adicionar um identificador do usuário para login    ${usuario.email}
    Adicionar a senha do usuário para login    ${usuario.senha}
    Clicar no botão entrar na tela de login

Verificar se o alert de erro para usuários inválidos está visível
    [Arguments]    ${mensagem_erro}

    Verificar se o alert de usuários inválidos está visível    ${mensagem_erro}
