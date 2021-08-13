# Guia de estilos

O guia de estilo contém as ___regras___ usadas neste projeto para ___codificação e nomenclatura de arquivos e diretórios___. Existem vários motivos para termos um projeto com guia de estilos, dentre eles:
- garantir a continuidade do projeto
- facilitar a entrada de novos membros
- prevenir o uso de múltiplos padrões de codificação (dificultando legibilidade)
- prevenir más práticas durante o desenvolvimento
- conscientizar sobre boas práticas durante o desenvolvimento
- facilitar a manutenção do código
- facilitar a inclusão de novas features

___Obs___: o ___eslint___ junto ao ___prettier___ possuem um conjunto de regras para validar os itens descritos neste documento. Caso você verifique que um determinado estilo não está coberto pelo sistema de linting ou que a cobertura é parcial, adicione a cobertura ou peça a orientação de algum outro membro da equipe para que façam em conjunto. É importante que as regras estejam cobertas pelo sistema de linting para que não tenhamos de fazer validações manuais. 

### Sumário

Este guia de estilos está dividido nas seguintes seções:
- [Nomenclatura de arquivos](#nomenclatura-de-arquivos)
- [Nomenclatura no código](#nomenclatura-no-codigo)
- [Demais regras](#demais-regras)
- [Padrões de nomenclatura](#padres-de-nomemclatura)

### <a name="nomenclatura-de-arquivos"></a>Nomenclatura de arquivos

Todos os diretórios e arquivos do projeto deve seguir o estilo `kebab-case`, ou seja, nomes escritos da seguinte forma: ___guia-de-estilos___. 

### <a name="nomenclatura-no-codigo"></a>Nomenclatura no código

No código propriamente, existem diferentes estilos para nomenclatura de variáveis, funções, métodos, atributos, classes, interfaces, etc. Abaixo segue uma lista com mais detalhes:
- ___variáveis___, ___funções___ e ___parâmetros___ devem utilizar o padrão `camelCase`.
- ___variáveis___ e ___parâmetros___ que forem do tipo ___boolean___ devem utilizar o padrão `camelCase` com algum dos prefixos: `is`, `should`, `has`, `can`, `did` ou `will`
- ___constantes___ devem utilizar o padrão `UPPER_CASE`
- ___enumeradores___, ___classes___, ___interfaces___, ___tipos genéricos___ e ___alias de tipo___ devem utilizar o padrão `PascalCase`
_ ___membros de enumeradores___ devem utilizar o padrão `UPPER_CASE`
- ___propriedades___, ___parâmetros de propriedades___, ___métodos___ e ___assessores___ devem utilizar o padrão `camelCase`
- ___propriedades___, ___parâmetros de propriedades___, ___métodos___ e ___assessores___ que forem ___privadas___ devem utilizar o padrão `camelCase` com o prefixo `_` (underscore)
- ___propriedades___, ___parâmetros de propriedades___, ___métodos___ e ___assessores___ que forem ___protegidos___ ou ___públicos___ devem utilizar o padrão `camelCase` e não podem utilizar o prefixo `_` (underscore)
- ___propriedades___, ___parâmetros de propriedades___, ___métodos___ e ___assessores___ que forem ___privados___, ___estáticos___ e ___apenas de leitura___ devem utilizar o padrão `UPPER_CASE` e não podem utilizar o prefixo `_` (underscore)
- ___tipos genéricos___ devem utilizar o padrão `PascalCase` e não podem conter apenas 1 letra como identificador, ao invés disso dê um nome que faça sentido para aquele contexto. Exemplo: ao invés de `interface Array<T>`, utilize algo como `interface Array<Item>`
- ___classes abstratas___ e ___interfaces___ devem utilizar o padrão `PascalCase` com o prefixo `I` (letra I maiúscula) 
- ___decoradores (decorators)___ devem utilizar o padrão `PascalCase` (não existe uma regra no linter para esta validação)

### <a name="demais-regras"></a>Demais regras

Nesta seção estão listadas as regras que devem ser aplicadas durante a codificação neste projeto.

- `eqeqeq`: regra para verificar se as condicionais utilizam `===` e `!==` ao invés de `==` e `!=`
```typescript
const num: number = 2;

// Erro
const isEvenError = num % 2 == 0;

// Sucesso
const isEvenSuccess = num % 2 === 0;
```

- `func-call-spacing`: regra para verificar se existe espaçamento entre `()` e nome da função
```typescript
// Erro
function sum (num1: number, num2: number): number { /** TODO */ }

// Sucesso
function sum(num1: number, num2: number): number { /** TODO */ }
```

- `no-empty`: regra para verificar se não existem blocos de código em branco
```typescript
// Erro
if (isEven) {}

// Sucesso
if (isEven) { /** TODO */ }
```

- `no-unreachable`: regra para verificar se existe código após um comando de interrupção
```typescript
function sum(num1: number, num2: number): number {
  const result: number = num1 + num2;
  return result;
  console.log(result); // Erro
}
```

- `no-constant-condition`: regra para verificar se uma condição é avaliada com um valor fixo ao invés de dinâmico
```typescript
// Erro
const isEvenError: boolean = 2 ? true : false;

// Sucesso
const num = 2
const isEvenSuccess: boolean = num % 2 === 0
```

- `no-param-reassign`: regra para verificar se o parâmetro da ___função___ ou ___método___ sofreu alteração
```typescript
// Erro
function sum(num1: number, num2: number): number {
  num1 = num1 ? num1 : 0
  return num1 + num2;
}

// Sucesso
function sum(num1: number, num2: number): number {
  const num3 = num1 ? num1 : 0
  return num3 + num2;
}
```

- `no-unsafe-finally`: regra para verificar se existe algum comando de interrupção dentro de um bloco finally
```typescript
// Erro
function getWeirdResult() {
  try {
    return 0;
  } catch(error) {
    return -1;
  } finally {
    console.log('finally');
    return 1;
  }
}
console.log(getWeirdResult()) // Mostra 'finally' e 1 em seguida

// Sucesso
function getWeirdResult() {
  try {
    return 0;
  } catch(error) {
    return -1;
  } finally {
    console.log('finally');
  }

  return 1;
}
console.log(getWeirdResult()) // Mostra 'finally' e 0 em seguida
```

- `require-atomic-updates`: regra para verificar se existe "race conditions" ao utilizar estruturas de programação assíncronas.
```typescript
// Erro
let result;
async function foo() {
  result += await somethingElse;
  
  result = result + await somethingElse;
  
  result = result + doSomething(await somethingElse);
}

// Sucesso
let resultSuccess;
async function foo() {
  resultSuccess = await somethingElse + resultSuccess;
  
  const temporary = await somethingElse;
  resultSuccess += temporary;

  let localVariable = 0;
  localVariable += await somethingElse;
}
```

- `use-isnan`: regra para verificar se condicionais que verificam por ___NaN___ utilizam a função ___isNaN___
```typescript
const maybeNum: number = parseInt('not a number');

// Erro
const isNumError = maybeNum == NaN;
const isNumError2 = maybeNum === NaN;
const isNumError3 = maybeNum === Number.NaN;
const isNumError4 = maybeNum instanceof NaN;

// Sucesso
const isNumSuccess = isNaN(maybeNum);
```

- `valid-typeof`: regra para verificar se o `typeof` é utilizado da maneira correta
```typescript
// Erro
typeof foo === undefined
typeof bar == Object
typeof baz === "strnig"
typeof qux === "some invalid type"
typeof baz === anotherVariable
typeof foo == 5

// Sucesso
typeof foo === "undefined"
typeof bar == "object"
typeof baz === "string"
typeof bar === typeof qux
```

- `functional/immutable-data`: regra para verificar se o código modifica uma propriedade de um objeto ou array. Obs.: é permitida a modificação de uma propriedade é uma classe
```typescript
// Erro
const objError = { foo: 1 };
objError.foo += 2;
objError.bar = 1;
delete objError.foo;
Object.assign(objError, { bar: 2 });

const arrError = [0, 1, 2];
arrError[0] = 4;
arrError.length = 1;
arrError.push(3);

// Sucesso
const objSuccess = { foo: 1 };
const arrSuccess = [0, 1, 2];

const x = {
  ...objSuccess,
  bar: [
    ...arrSuccess, 3, 4
  ]
}
```

- `functional/no-method-signature`: regra para verificar se ___interfaces___ ou ___alias de tipo___ marcam funções como ___readonly___
```typescript
// Erro
type Foo = {
  bar(): string;
};

// Sucesso
type Foo = {
  readonly bar: () => string;
};
```

- `functional/prefer-readonly-type`: regra para verificar o uso de estruturas ___readonly___, tanto de propriedades quanto ___objetos___ e ___arrays___. Obs.: propriedades de classes não são verificadas e, caso haja necessidade, é possível ignorar a verificação utilizando um nome de variável com o prefixo `mutable`
```typescript
// Erro
interface Person {
  name: string;
}

// Sucesso {
interface Person {
  readonly name: string;
}
```

- `functional/no-return-void`: regra para verificar funções com "retorno" ___void___. Funções sem retorno (que retornam ___void___), são funções que obrigatoriamente causam algum efeito colateral e a ideia é evitar o uso indevido destas funções. Para criar uma função que causa efeito colateral, faça uso de `async/await`
```typescript
// Erro
function log(text: string): void {
  console.log('app:', text);
}

// Sucesso
async function log(text: string): Promise<void> {
  console.log('app:', text);
}
```

- `sonarjs/cognitive-complexity`: regra para verificar a complexidade cognitiva de uma função. Simplificando muito, complexidade cognitifica é um método para entender quão fácil ou difícil é entender uma determinada função. Para mais detalhes acesse [este link](https://www.sonarsource.com/docs/CognitiveComplexity.pdf)

- `sonarjs/no-inverted-boolean-check`: regra para verificar se uma condicional está escrita ao contrário
```typescript
const num: number = 2;

// Erro
if (!(num === 2)) { /** TODO */ }

// Sucesso
if (num !== 2) { /** TODO */ }
```

- `sonarjs/no-redundant-jump`: regra para verificar se existe quebras desnecessárias no código
```typescript
// Erro
function redundantJump(x) {
  if (x === 1) {
    console.log('equals');
    return; // Desnecessário
  }
}

// Sucesso
function redundantJump(x) {
  if (x === 1) {
    console.log('equals');
  }
}
```

- `sonarjs/no-empty-collection`: regra para verificar se uma coleção/lista vazia está sendo iterada ou acessada
```typescript
// Erro
let stringsError = [];
if (stringsError.includes("foo")) { /** TODO */ }
for (str of stringsError) { /** TODO */ }
stringsError.forEach((str) => doSomething(str));

// Sucesso
const stringsSuccess = ['foo'];
if (stringsSuccess.includes("foo")) { /** TODO */ }
for (str of stringsSuccess) { /** TODO */ }
stringsSuccess.forEach((str) => doSomething(str));
```

- `@typescript-eslint/explicit-function-return-type`: regra para verificar se funções e métodos identificam o tipo do retorno da função
```typescript
// Erro
function sum(num1: number, num2: number) {
  return num1 + num2;
}
async function get(url: string) {
  return httpClient.get(url);
}

// Sucesso
function sum(num1: number, num2: number): number {
  return num1 + num2;
}
async function get(url: string): Promise<string> {
  return httpClient.get(url);
}
```

- `@typescript-eslint/no-explicit-any`: regra para verificar se existem usos do tipo `any`
```typescript
// Erro
function sum(num1: any, num2: any): any {
  return num1 + num2;
}

// Sucesso
function sum(num1: number, num2: number): number {
  return num1 + num2;
}
```

- `@typescript-eslint/no-unused-vars`: regra para verificar se existem variáveis que não estão sendo utilizadas no código

- `@typescript-eslint/typedef`: regra para verificar o uso de `tipos` na aplicação. Todas as definições, seja variáveis, funções, propriedades, assesores, etc, devem definitir o tipo explicitamente.
```typescript
// Erro
const numError = 2;

// Sucesso
const numSuccess: number = 2;
```

### <a name="padres-de-nomemclatura"></a>Padrões de nomenclatura

Aqui estão definidos os diferentes padrões de nomenclatura e a expressão regular que realiza a validação:
- `kebab-case`: ^([a-z][a-z0-9]*)(-[a-z0-9]+)*$ ___(guia-de-estilo)___
- `camelCase`: ^[a-z][a-zA-Z0-9]+$ ___(guiaDeEstilo)___
- `PascalCase`: ^[A-Z][a-zA-Z0-9]+$ ___(GuiaDeEstilo)___
- `snake_case`: ^([a-z][a-z0-9]*)(_[a-z0-9]+)*$ ___(guia_de_estilo)___
- `UPPER_CASE`: ^([A-Z][A-Z0-9]*)(_[A-Z0-9]+)*$ ___(GUIA_DE_ESTILO)___