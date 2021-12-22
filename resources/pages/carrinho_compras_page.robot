*** Settings ***
Documentation    Arquivos de mapeamento de elementos do carrinho

Resource    ../locators/carrinho_compras_locators.robot

*** Keywords ***

Verificar o nome do produto na tela de precarrinho
    [Arguments]    ${nome_produto}

    ${element}=    String Replace    ${PRECARRINHO_NOME_PRODUTO}    ${nome_produto}
    Wait Until Element Is Visible    ${element}

Clicar no botao ir para o carrinho

    Click If Element Is Visible     ${BOTAO_GO_TO_CARD}

Verificar o nome do produto no carrinho de compras
    [Arguments]    ${nome_produto}

    ${element}=    String Replace    ${NOME_PRODUTO_CARRINHO}    ${nome_produto}
    Wait Until Element Is Visible    ${element}
