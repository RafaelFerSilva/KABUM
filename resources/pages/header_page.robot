*** Settings ***
Documentation    Arquivos de mapeamento de elementos do header do site

Resource    ../locators/header_locators.robot

*** Keywords ***

Verificar se o logo da Kabum está visível

    Wait Until Element Is Visible    ${LOGO_KABUM}

Verificar se o input de busca está visível

    Wait Until Element Is Visible    ${INPUT_BUSCA}

Adicionar um texto no campo de busca
    [Arguments]    ${texto}

    Input Text If Element Is Visible    ${INPUT_BUSCA}    ${texto}

Verificar se o link para login do usuário está visivel

    Wait Until Element Is Visible   ${LINK_LOGIN_HEADER}

Clicar no link para login do usuário

    Click If Element Is Visible    ${LINK_LOGIN_HEADER}

Verificar se o header do site está visível

    Verificar se o logo da Kabum está visível
    Verificar se o input de busca está visível
    Verificar se o link para login do usuário está visivel

Realizar busca de um item
    [Arguments]    ${termo_busca}

    Adicionar um texto no campo de busca    ${termo_busca}
    Pressione a tecla     ENTER

Abrir o menu de departamentos

    Mouse Over If Element Is Visible    ${CATEGORIA_DEPARTAMENTOS}

Clicar em um item do menu de departamentos
    [Arguments]    ${departamento}

    ${element}=    String Replace  ${DEPARTAMENTOS_ITEM}    ${departamento}
    Click If Element Is Visible     ${element}

Clicar em um item do menu de departamentos pelo index
    [Arguments]    ${index}

    ${index_item}=    Convert To String    ${index}

    ${element}=    String Replace  ${DEPARTAMENTOS_ITEM_INDEX}    ${index_item}
    Click If Element Is Visible     ${element}

Retornar um index random de uma categoria de departamentos

    ${count}=    Get Element Count    ${DEPARTAMENTOS_ITEMS}
    ${random}=    FakerLibrary.Random Int  min=1  max=${count}

    [Return]    ${random}