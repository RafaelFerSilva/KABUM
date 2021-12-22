*** Settings ***
Documentation   Arquivos de locators relacioando ao login de usuários do site

*** Variables ***

${FORM_LOGIN}=                          id:formLogin
${INPUT_USUARIO_LOGIN}=                 id:inputUsuarioLogin
${INPUT_SENHA_LOGIN}=                   id:inputSenhaLogin
${BOTAO_LOGIN}=                         id:botaoLogin
${ALERT_USUARIO_INVALIDO_LOGIN}=        //section[@id="formLogin"]//div[normalize-space()="$$"]
