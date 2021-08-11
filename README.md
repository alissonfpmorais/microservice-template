# Template para microserviço
<!-- ALL-CONTRIBUTORS-BADGE:START - Do not remove or modify this section -->
[![All Contributors](https://img.shields.io/badge/all_contributors-2-orange.svg?style=flat-square)](#contributors-)
<!-- ALL-CONTRIBUTORS-BADGE:END -->

Este projeto é um template para a criação de microserviços.

### Sumário

Este projeto está dividido nas seguintes seções:
- [Requisitos básicos](#requisitos-bsicos)
- [Ferramentas para qualidade de código](#ferramentas-para-qualidade-de-cdigo)
- [Configuração inicial do projeto](#configurao-inicial-do-projeto)
- [Configuração do ambiente de desenvolvimento](#configurao-do-ambiente-de-desenvolvimento)
- [Primeiros passos](#primeiros-passos)
- [Guia de estilo](docs/code-style.md)
- [Arquitetura do projeto](docs/architecture.md)
- [Contribuidores](#contribuidores)

### <a name="requisitos-bsicos"></a>Requisitos básicos

Este projeto faz uso da plataforma Node.js e o sistema deve possuir os seguintes executáveis instalados:
- `node`
- `npm`

As respectivas versões estão descritas dentro do arquivo `package.json` (na raiz do projeto) na seção (nó) `engines`.

Caso tenha os executáveis instalados e deseje verificar as versões, no seu terminal (prompt de comando ou linha de comando dependendo do seu sistema) utilize os comandos:

```bash
# Mostra a versão do node
$ node --version

# Mostra a versão do npm
$ npm --version
```

Garanta que as ferramentas tenham total acesso de ___permissão tanto para escrita quanto leitura___, já que vários arquivos e configurações serão gerados automaticamente nos próximos passos.

### <a name="ferramentas-para-qualidade-de-cdigo"></a> Ferramentas para qualidade de código

Esse projeto faz uso de um conjunto de ferramentas para garantir uma melhor qualidade de código. Segue a lista das ferramentas e uma breve descrição do propósito de cada uma:
- `eslint`: ferramenta responsável por identificar, reportar e aplicar diferentes regras de codificação num projeto. Neste projeto, as regras estão definidas dentro do arquivo ___.eslintrc.js___
- `prettier`: ferramenta responsável por estilizar o código seguindo padrões pré-estabelecidos
- `husky`: permite a execução de scripts antes, durante ou após comandos git, exemplo: executar o linter no projeto antes de realizar o commit
- `lint-staged`: garante que apenas arquivos marcados como ___staged___ sejam utilizados por scripts, exemplo: num projeto com 2 arquivos ___index.ts___ e ___person.ts___, se o arquivo ___person.ts___ sofreu alteração e o ___index.ts___ não, apenas o arquivo ___person.ts___ passará pelo processo de linting
- `git-commit-msg-linter`: garante que as mensagens de commit estejam sempre no mesmo formato: \<type\>[scope]: \<description\>

Lembrando que todas as ferramentas contribuem para um código mais limpo e enxuto, mas todos devemos trabalhar continuamente para manter esta qualidade. 

### <a name="configurao-inicial-do-projeto"></a>Configuração inicial do projeto

Primeiramente, faça a instalação das dependências do projeto. Para isso, abra o terminal, navegue para o diretório deste projeto e execute o comando abaixo:

```bash
# Execute a instalação das dependências do projeto
$ npm install
```

Confirme a existência do arquivo `.env` com as ___variáveis de ambiente atualizadas___. Caso não possua, converse com um membro para equipe para que envie a você.

### <a name="configurao-do-ambiente-de-desenvolvimento"></a>Configuração do ambiente de desenvolvimento

Aqui faremos o setup das ferramentas para manter a qualidade do código. Todas as ferramentas são configuradas automaticamente durante a instalação das dependências do projeto, mas o `eslint` e o `prettier` são melhores quando utilizados em conjunto com a IDE.

Abaixo, faremos o setup para as seguintes IDEs:
- [JetBrains IDEs (Intellij, Webstorm, ...)](#jetbrains-ides)
- [VSCode](#vscode)

#### <a name="jetbrains-ides"></a># JetBrains IDEs (Intellij, Webstorm, ...)

Primeiramente, vamos fazer a instalação do plugin `Prettier` na IDE. No menu superior esquerdo clique em `File --> Settings` e navegue para a opção `Plugins`. Outras opções para acessar este menu são:
- Usar a hotkey `ctrl + alt + s` e selecionar a opção plugins
- Usar a hotkey `shift + shift`, digitar ___plugins___ e selecionar a ação `Plugins`
- Usar a hotkey `ctrl + shift + a`, digitar ___plugins___ e selecionar a ação `Plugins`

Selecione a aba ___marketplace___, pesquise por ___prettier___ e instale o plugin. Siga as instruções da IDE (caso ela solicite alguma coisa).

Ainda com a janela de opções (___settings___) aberta, use o campo de pesquisa para encontrar o termo ___eslint___. Para o ___eslint___, selecione as opções ___Automatic ESLint configuration___ e ___Run eslint --fix on save___.

Novamente no campo de pesquisa, procure pelo termo ___prettier___. Para o prettier, siga as instruções abaixo:
- verifique se a opção ___Node interpreter___ está configurada com a versão correta do ___node___, conforme os [requisitos básicos](#requisitos-bsicos)
- para o ___Prettier package___, selecione o diretório do pacote do prettier no projeto. Normalmente o pacote se encontra dentro do diretório ___node_modules___, exemplo: `~/projects/microservice-template/node_modules/prettier`
- garanta que a opção ___Run for files___, esteja configurada da seguinte forma: `{**/*,*}.{js,ts,jsx,tsx}`
- por último, marque a opção ___On save___

Pronto, IDE configurada. Para garantir que a configuração está correta, experimente alterar o código criando uma variável utilizando ___var___. Deve aparecer um erro sublinhando o local e ao salvar este erro deve ser corrigido automaticamente.

#### <a name="vscode"></a># VSCode

Primeiramente, vamos fazer a instalação do plugin `ESLint`. No menu lateral esquerdo, clique em `Extensões`. Outra opção é utilizar a hotkey `ctrl + shift + x`.

No campo de pesquisa, busque o termo ___eslint___. Será apresentada uma lista de plugins, instale o `ESLint` criado por `Dirk Baeumer`.

Pronto, IDE configurada. Para garantir que a configuração está correta, experimente alterar o código criando uma variável utilizando ___var___. Deve aparecer um erro sublinhando o local e ao salvar este erro deve ser corrigido automaticamente.

### <a name="primeiros-passos"></a>Primeiros passos

Com o projeto configurado, basta abrir o terminal, navegar para o diretório do projeto e executar o comando:

```bash
# Roda o projeto
$ npm run start
```

Além deste, existem outros comandos/scripts disponíveis. Para verificar a lista completa, abra o arquivo `package.json` na raiz do projeto. Na seção (nó) ___scripts___ estará a lista completa de todos os comandos que podem ser executados com o projeto e o que cada um faz.

## <a name="contribuidores"></a>Contribuidores ✨

Muito obrigado a todos que contribuiram no desenvolvimendo do projeto ([emoji key](https://allcontributors.org/docs/en/emoji-key)):

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->
<table>
  <tr>
    <td align="center"><a href="https://www.linkedin.com/in/diego-moura-8499a664/"><img src="https://avatars.githubusercontent.com/u/9387797?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Diego Moura</b></sub></a><br /><a href="#ideas-dmourainatel" title="Ideas, Planning, & Feedback">🤔</a></td>
    <td align="center"><a href="https://www.linkedin.com/in/johnbrookson"><img src="https://avatars.githubusercontent.com/u/65250898?v=4?s=100" width="100px;" alt=""/><br /><sub><b>João Ribeiro Junior</b></sub></a><br /><a href="https://github.com/alissonfpmorais/microservice-template/commits?author=johnbrookson" title="Code">💻</a></td>
  </tr>
</table>

<!-- markdownlint-restore -->
<!-- prettier-ignore-end -->

<!-- ALL-CONTRIBUTORS-LIST:END -->

Esse projeto segue a especificação [all-contributors](https://github.com/all-contributors/all-contributors). Contribuições de todos os tipos são bem-vindas!