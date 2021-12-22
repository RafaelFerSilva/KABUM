*** Settings ***
Documentation    Arquivo de locators relacionados ao header do site

*** Variables ***

${LOGO_KABUM}=                          id:logoKabum
${INPUT_BUSCA}=                         id:input-busca
${LINK_LOGIN_HEADER}=                   id:linkLoginHeader
${CATEGORIA_DEPARTAMENTOS}=             //div[@id="menuExpansivelCategorias"]//button[text()="TODOS OS DEPARTAMENTOS"]
${DEPARTAMENTOS_ITEMS}=                 //a[contains(@class, "itemCategoriaMenu")]
${DEPARTAMENTOS_ITEM_INDEX}=            //a[contains(@class, "itemCategoriaMenu")][$$]
${DEPARTAMENTOS_ITEM}=                  //a[contains(@class, "itemCategoriaMenu") and text()="$$"]