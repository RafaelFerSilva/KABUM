*** Settings ***
Documentation    Arquivos de mapeamento de elementos do header do site

Resource    ../locators/busca_produtos_locators.robot

*** Keywords ***

Verificar se a página de busca está visível 

    Wait Until Element Is Visible    ${PAGINA_RESULTADO_BUSCA}

Verificar se a pagina de busca está vazia

    Wait Until Element Is Visible    ${LISTING_EMPTY}

Verificar se a pagina de busca não está vazia

    Wait Until Element Is Not Visible    ${LISTING_EMPTY}

Verificar se o seção de ordenação dos resultados de busca está visível

    Wait Until Element Is Visible    ${LISTING_ORDENATION}

Verificar qual a página de busca está aberta
    [Arguments]    ${pagina}

    ${element}=    String Replace    ${LISTING_BREAD_CRUMBS}    ${pagina}
    Wait Until Element Is Visible    ${element}

Retornar um index random de produto da tela de busca

    ${count}=    Get Element Count    ${PRODUTO_CARD}
    ${random}=    FakerLibrary.Random Int  min=1  max=${count}

    [Return]    ${random}

Retornar um produto pelo index na pagina de busca   
    [Arguments]    ${index}

    ${index_item}=    Convert To String    ${index}

    ${element}=    String Replace    ${NOME_PRODUTO_PELO_INDEX}    ${index_item}
    ${produto}=   Get Text    ${element}

    [Return]    ${produto}

Mouse Over em um produto da página de busca 
    [Arguments]    ${nome_produto}

    ${element}=    String Replace    ${PRODUTO_PELO_NOME}    ${nome_produto}
    Mouse Over If Element Is Visible    ${element}

Clicar no botão comprar em um produto na página de busca
    [Arguments]    ${nome_produto}

    ${element}=    String Replace    ${BOTAO_COMPRAR_PELO_NOME_PRODUTO}    ${nome_produto}
    Click If Element Is Visible    ${element}