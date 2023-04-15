### 1. Introdução
 Este documento possui como finalidade a apresentação dos requisitos funcionais e não funcionais

### Requisitos funcionais
| ID | Nome o Requisito|
|----|-----------------|
|R01 | Realizar cadastro|
|R02 | Realizar Login |
|R03 | Pesquisar Vídeo|
|R04 | Avaliar Vídeo |
|R05 | Visualizar detalhes do vídeo |
|R06 | Assistir filmes |
|R07 | Assistir série |
|R08 | Escolher o episódio |
|R09 | Adicionar filmes |
|R10 | Remover filmes |
|R11 | Editar dados |
|R12 |Autenticar usuário|

### R01
**Realizar cadastro**

**Ator:** Usuário

**Fluxo normal:**
1. Inserir um nome
2. Inserir um e-mail
3. Inserir uma senha
4. O usuário solicita o cadastro
5. O usuário é cadastrado com sucesso

**Extensões:**
1. Verificar se o nome, senha e e-mail estão preenchidos
2. Verificar se existe algum usuário cadastrado com o mesmo e-mail

### R02
**Realizar login**

**Ator:** Usuário

**Fluxo normal:**
1. Inserir o e-mail e senha
2. O usuário solicita o login
3. O usuário é autenticado com sucesso

**Extensões:**
1. Verificar se o nome, senha e e-mail estão preenchidos
2 Verificar se existe algum usuário cadastrado com esse e-mail e senha

### R03
**Pesquisar vídeo**

**Ator:** Usuário

**Fluxo normal:**
1. O usuário insere o nome do que deseja buscar
2. O sistema verifica se o usuário está autenticado
3. O sistema busca pelo nome que o usuário inseriu
4. O sistema retorna os vídeos para o usuário

**Extensões:**
1. Verifica se o usuário inseriu algum nome
2. Verificar se existe algum vídeo com esse nome no banco

### R04
**Avaliar Vídeo**

**Ator:** Usuário

**Fluxo normal:**
1. O usuário entra na página do vídeo
2. O usuário realiza a avaliação do vídeo
3. O sistema verifica se o usuário está autenticado
4. A avaliação é salva com sucesso

### R05
**Visualizar detalhes do vídeo**

**Ator:** Usuário

**Fluxo normal:**
1. O usuário seleciona o vídeo
2. O sistema verifica se ele está autenticado
3. O usuário entra na página do vídeo

### R06
**Assistir filmes**

**Ator:** Usuário

**Fluxo normal:**
1. O usuário seleciona o filme
2. O sistema verifica se ele está autenticado
3. O usuário entra na página do vídeo
4. O sistema abre o filme

### R07
**Assistir série**

**Ator:** Usuário

**Fluxo normal:**
1. O usuário seleciona a série
2. O sistema verifica se ele está autenticado
3. O usuário entra na página do vídeo
4. O usuário seleciona o episódio que deseja assistir 
5. O sistema abre o filme

### R08
**Escolher o episódio**

**Ator:** Usuário

**Fluxo normal:**
1. O usuário seleciona a série
2. O sistema verifica se ele está autenticado
3. O usuário entra na página do vídeo
4. O usuário seleciona o episódio 

### R08
*Adicionar filmes**

**Ator:** Administrador

**Fluxo normal:**
1. O administrador insere o nome do filme
2. O administrador insere a data de lançamento do filme
3. O administrador insere os gêneros do filme
4. O administrador solicita ao sistema para salvar o filme
5. O filme é salvo no sistema

**Extensões:**
1. Verifica se os dados foram inseridos corretamente
2. Verifica se existe algum filme com esse nome no banco

### R10
**Remover filmes**

**Ator:** Administrador

**Fluxo normal:**
1. O administrador insere o nome do filme
2. O sistema busca por um filme com aquele nome no banco
3. O administrador escolhe apagar o filme
4. O filme é apagado do sistema

### R11
**Remover filmes**

**Ator:** Administrador

**Fluxo normal:**
1. O administrador insere o nome do filme
2. O sistema busca por um filme com aquele nome no banco
3. O administrador seleciona o filme
4. O usuário edita os dados do filme
5. O sistema atualiza o filme

**Extensões:**
1. Verifica se os dados foram inseridos corretamente

### R12
**Autenticar usuário**

**Ator:** Sistema

**Fluxo normal:**
1. O usuário faz o login no sistema
2. O sistema envia um _token_ para a autenticação do usuário
3. O usuário envia o _token_ de autenticação para o sistema
4. O sistema valida o token

**Extensões:**
1. Verifica se o _token_ está ativo
