*** Settings ***
Documentation   Arquivos de mapeamento de elementos da tela de login do site

Resource    ../locators/login_locators.robot

*** Keywords ***

Verificar se a tela de login está visivel

    Wait Until Element Is Visible    ${FORM_LOGIN}

Adicionar um identificador do usuário para login
    [Arguments]    ${usuario}

    Input Text If Element Is Visible    ${INPUT_USUARIO_LOGIN}    ${usuario}

Adicionar a senha do usuário para login
    [Arguments]    ${senha}

    Input Text If Element Is Visible    ${INPUT_SENHA_LOGIN}    ${senha}

Clicar no botão entrar na tela de login

    Click If Element Is Visible    ${BOTAO_LOGIN}

Verificar se o alert de usuários inválidos está visível
    [Arguments]    ${erro}

    ${element}=    String Replace    ${ALERT_USUARIO_INVALIDO_LOGIN}    ${erro}
    Wait Until Element Is Visible    ${element}
