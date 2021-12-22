*** Settings ***
Documentation    Arquivo de locators relacionados a tela de busca de produtos

*** Variables ***

${PAGINA_RESULTADO_BUSCA}=                          id:listing
${LISTING_EMPTY}=                                   id:listingEmpty
${LISTING_ORDENATION}=                              id:listingOrdenation
${LISTING_BREAD_CRUMBS}=                            //div[@id="listingBreadcrumbs"]//a[text()="$$"]
${PRODUTO_CARD}=                                    //div[contains(@class, "productCard")]
${PRODUTO_PELO_INDEX}=                              //div[contains(@class, "productCard")][$$]
${NOME_PRODUTO_PELO_INDEX}=                         ${PRODUTO_PELO_INDEX}//h2
${PRODUTO_PELO_NOME}=                               //div[contains(@class, "productCard")]//h2[normalize-space()="$$"]//ancestor::div[contains(@class, "productCard")]
${BOTAO_COMPRAR_PELO_NOME_PRODUTO}=                 ${PRODUTO_PELO_NOME}//div[contains(@class, "availableFooterCardHover")]//button
