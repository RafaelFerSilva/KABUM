*** Settings ***
Documentation    Keywords comuns a todo framework

Library         SeleniumLibrary
Library         FakerLibrary    locale=pt_BR
Library         String
Library         ScreenCapLibrary
Library         BuiltIn

Resource    ../pages/header_page.robot

Variables    ../utils/config_variables.py

*** Keywords ***

Abrir o navegador
    [Arguments]    ${url}

    Open Browser    ${url}    ${BROWSER}    options=${BROWSER_OPTIONS}
    Set Window Size    ${1920}   ${1080}

Abrir a página home do site

    Abrir o navegador    ${TESTED_HOST}
    Verificar se o header do site está visível

Fechar o browser

    Close Browser

Fechar todos os browsers

    Close All Browsers

Mouse Over If Element Is Visible
    [Arguments]   ${element}  ${wait_time}=10s

    Wait Until Element Is Visible     ${element}    ${wait_time}
    Mouse Over    ${element}

Click If Element Is Visible
    [Arguments]   ${element}  ${wait_time}=10s

    Mouse Over If Element Is Visible     ${element}    ${wait_time}
    Click Element  ${element}

Click If Button Is Visible
    [Arguments]   ${element}  ${wait_time}=10s

    Mouse Over If Element Is Visible     ${element}    ${wait_time}
    Click Button  ${element}

Click If Link Is Visible
    [Arguments]   ${element}  ${wait_time}=10s

    Mouse Over If Element Is Visible     ${element}    ${wait_time}
    Click Link  ${element}

Input Text If Element Is Visible
    [Arguments]   ${element}    ${text}    ${wait_time}=10s

    Wait Until Element Is Visible     ${element}    ${wait_time}
    Input Text  ${element}    ${text}

Check Element Attribute
    [Arguments]    ${element_locator}    ${expected_value}    ${attribute}

    Wait Until Element Is Visible    ${element_locator}
    ${return_value}=    Get Element Attribute    ${element_locator}    ${attribute}

    Should Be Equal    ${return_value}    ${expected_value}

String Replace
    [Documentation]  Replaces the ocurrences of '$$' for the respective strings.
    [Arguments]  ${template_string}  @{replacement_strings}

    FOR    ${string}    IN    @{replacement_strings}
        ${template_string} =   Replace String    ${template_string}   $$   ${string}    count=1
    END

    [Return]    ${template_string}

Realizar Scroll
    [Arguments]  ${locator}
    
    ${x}=        Get Horizontal Position  ${locator}
    ${y}=        Get Vertical Position    ${locator}
    Execute Javascript  window.scrollTo(${x}, ${y})

Verificar se o button link está visível
    [Arguments]    ${text}

    ${element}=    String Replace    ${BUTTON_LINK}    ${text}
    Wait Until Element Is Visible    ${element}

Clicar no button link
    [Arguments]    ${text}

    ${element}=    String Replace    ${BUTTON_LINK}    ${text}
    Click If Element Is Visible    ${element}

Pressione a tecla
    [Documentation]    https://robotframework.org/SeleniumLibrary/SeleniumLibrary.html#Press%20Keys
    [Arguments]    ${tecla}    ${locator}=${None}

    Press Keys    ${locator}    ${tecla}

Retornar um grupo random de letras
    [Documentation]    O argumento ${number} é a quantidades de caracteres que queremos na string
    [Arguments]    ${number}

    ${grupo}=   Set Variable    ${EMPTY}

    FOR  ${num}  IN RANGE  ${number}
        ${letra}=    FakerLibrary.Random Letter
        ${grupo}=    Catenate    SEPARATOR=     ${grupo}    ${letra}
    END

    [Return]    ${grupo}

Retornar uma substring
    [Documentation]    https://robotframework.org/robotframework/latest/libraries/String.html#Get%20Substring
    [Arguments]    ${string}    ${start}    ${end}=${NONE}

    ${ignore}=  Get Substring	${string}   ${start}    ${end}

    [Return]    ${ignore}

Realizar click via Javascript
    [Documentation]    Executar um click via javascript em um elemento identificado pelo xpath.
    ...                Uma alternativa em casos que temos um elemento sobreposto ao outro.
    [Arguments]    ${xpath}

    ${element}=    String Replace    ${XPATH_RESULT}    ${xpath}
    Execute Javascript    ${element}

Espera justificada
    [Documentation]    Usar sleep em testes não é uma boa opção, porém existem situações em que se faz necessário.
    ...                Em casos que não tenhamos outra forma de espera devemos utilizar o sleep porém justificando seu motivo.
    [Arguments]    ${wait}    ${message}

    Log    Motivo para utilização do sleep: ${message}
    Sleep    ${wait}  

Retornar o celular formatado com () e - para celular com 11 caracteres
    [Arguments]    ${celular}

    ${fone_final}=    Get Substring    ${celular}    -4
    ${fone_start}=    Get Substring    ${celular}    0    2
    ${fone_meio}=     Get Substring    ${celular}    2    7
    ${mobile}=     Catenate    (${fone_start})     ${fone_meio}-${fone_final}
    
    [Return]    ${mobile}

Inicar gravação de evidências

    Set Selenium Speed    0.2 seconds
    Start Video Recording    name=${TEST_NAME}

Finalizar gravação de evidências

    Stop Video Recording
    Set Selenium Speed    0 seconds

Remover parenteses espaços e hífem de uma string
    [Arguments]    ${text}

    ${return_text}=   Remove String   ${text}   (   )   -   ${SPACE}

    [Return]   ${return_text}  

Realizar hide em um modal via javascript
    [Documentation]     Esta keywords força que um modal seja fechado via javascript.
    ...                 Neste caso estamos utilizando o id do elemento
    [Arguments]  ${modal_id}

    Execute Javascript     $('#${modal_id}').modal('hide')


Retornar um arquivo da pasta files
    [Documentation]    Retornar um arquivo para ser utilizado nos testes.
    ...                path: orbia-tests\resources\files\
    [Arguments]     ${pasta}    ${file}

    ${file}=    String Replace    ${PATH_FILES}     ${pasta}     ${file}

    [Return]   ${file}
 
Formatar uma data para o sistema pt-BR
    [Documentation]    Formatar uma data que esteja como 1945-07-30 00:00:00 para somente a data no sistema pt-BR 30-07-1945
    [Arguments]    ${data}

    ${mouth}=    Set Variable If    ${data.month} < 10        0${data.month}    ${data.month}
    ${day}=    Set Variable If    ${data.day} < 10        0${data.day}    ${data.day}

    [Return]    ${day}-${mouth}-${data.year}

Retornar a data atual

    ${data} =	Get Current Date	result_format=datetime

    [Return]    ${data.day}/${data.month}/${data.year}

Retornar dados de um novo usuário fake
    [Documentation]    Keyword com o objetivo de criar dados fake para a criação de um novo usuário

    ${EMAIL}=       FakerLibrary.Email
    ${NOME}=        FakerLibrary.Name
    ${SENHA}=       FakerLibrary.Password

    ${user}=    Create Dictionary    nome=${NOME}     email=${EMAIL}     senha=${SENHA}

    [Return]    ${user}
