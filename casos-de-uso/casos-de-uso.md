# Casos de uso do Grafitall

**Ator:** responsável pela produção e pelo estoque da fábrica.
O diagrama está em [`diagrama-casos-de-uso.puml`](diagrama-casos-de-uso.puml).

Os três cadastros (Matéria-prima, Lote de produção e Cliente) funcionam do mesmo jeito,
por isso os quatro casos abaixo valem para cada um deles (12 casos no total).

## Listar
1. O ator clica no cadastro no menu (ex.: "Clientes").
2. O sistema lê o arquivo JSON do cadastro e mostra uma tabela com todos os registros.
3. Cada linha tem os links **Editar** e **Excluir**; acima da tabela há o link **Novo**.

## Incluir
1. Na listagem, o ator clica em **Novo**.
2. O sistema abre o formulário em branco.
3. O ator preenche os campos e clica em **Salvar**.
4. O sistema cria um id novo (maior id + 1), grava o registro no JSON e volta para a listagem.

**Exceção:** se um campo numérico vier com texto, o sistema mostra a página de erro (`erro.jsp`).

## Alterar
1. Na listagem, o ator clica em **Editar** na linha do registro.
2. O sistema abre o mesmo formulário com os campos preenchidos (o id vai na URL).
3. O ator muda o que quiser e clica em **Salvar**.
4. O sistema troca o registro de mesmo id no JSON e volta para a listagem.

## Excluir
1. Na listagem, o ator clica em **Excluir** na linha do registro.
2. O navegador pede confirmação.
3. O sistema remove o registro com aquele id, regrava o JSON e volta para a listagem.
