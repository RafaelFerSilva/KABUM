*** Settings ***
Documentation    Arquivo de locators relacionados a tela de busca de produtos

*** Variables ***

${PRECARRINHO_NOME_PRODUTO}=            //span[contains(@class, "productName") and normalize-space()="$$"]
${BOTAO_GO_TO_CARD}=                    //button[contains(@class, "buttonGoToCart")]
${NOME_PRODUTO_CARRINHO}=               //a[contains(@class, "productName") and normalize-space()="$$"]
