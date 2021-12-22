*** Settings ***
Documentation    Keywords relacionadas ao header do site

Resource    ../pages/login_page.robot
Resource    ../pages/header_page.robot
Resource    ../pages/busca_produtos_page.robot

*** Keywords ***

Selecionar um item na categoria departamento
    [Arguments]    ${item}

    Abrir o menu de departamentos
    Clicar em um item do menu de departamentos    ${item}
    Verificar qual a página de busca está aberta    ${item}

Selecionar um item random na categoria departamento

    Abrir o menu de departamentos
    ${index}=    Retornar um index random de uma categoria de departamentos
    Clicar em um item do menu de departamentos pelo index    ${index}
    Verificar se a página de busca retornou algum produto 
    
