# Kabum


Repositório contendo os testes para o site da Kabum

----

## Dependências
Para instalar as dependências deste projeto execute o arquivo **requirements.txt**
        
        pip install -r requirements.txt
        
---

## Executar os testes local
Para executar os tests execute o seguinte comando na raiz do projeto:

        robot  -d  reports --loglevel TRACE --pythonpath ./resources  .\tests\
        robot  -d  reports --loglevel TRACE  --variable BROWSER:headlesschrome   --pythonpath ./resources  .\tests\

---

## Pipeline com a execução dos testes
https://github.com/RafaelFerSilva/KABUM/actions/runs/1609972676

## Bugs Encontrados.
Ao realizar o processo de adicionar um item no carrinho, para alguns itens acontece um erro na página de precarrinho.

Descrição:
O usuário seleciona um item no menu Departamentos e adiciona o mesmo no carrinho

#### Comporamento esperado.
A página de pre-carrinho é aberta e o usuário tem a opção de acessar o carrinho através de um botão Ir para o carrinho ou voltar as compras clicando em continuar comprando.

#### Comportamento observado.
Ao acessar a página de pre-carrinho a mesma é atualizada e um erro é exibido ao usuário.

       Erro? Application error: a client-side exception has occurred (developer guidance).  

O produto mostrado no gif abaixo é o:

SSD Sabrent Rocket Q4, 1TB, M.2 2280 NVMe/PCIe, Leitura 4700MB/s, Gravação 1800MB/s, NAND E16 - SB-RKTQ4-1TB

E está no departamento Hardware. O teste **Selecione uma categoria no menu de “Departamento” e adicione um produto no carrinho** captura este erro quando é executado com um produto que retorne o erro relatado.

![image info](Erro_tela_precarrinho.gif)
