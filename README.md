# Streaming Graph Database - Neo4j

## Descrição do Projeto

Este projeto apresenta a modelagem de um banco de dados em grafos para um serviço de streaming de filmes e séries utilizando o Neo4j.

O objetivo é representar relacionamentos entre usuários, filmes, séries, atores, diretores e gêneros para possibilitar análises de relacionamento e futuros sistemas de recomendação.

Bancos de dados em grafos são especialmente eficientes para esse tipo de aplicação, pois permitem explorar conexões entre entidades de forma mais natural do que bancos relacionais tradicionais.

---

## Linguagens Utilizadas

- Neo4j
- Linguagem Cypher
- Modelagem de grafos

---

## Entidades do Grafo (Nodes)

O modelo inclui os seguintes nós:

- User
- Movie
- Series
- Genre
- Actor
- Director

---

## Relacionamentos (Relationships)

Os relacionamentos entre os nós são:

- WATCHED → relação entre usuário e filme/série com propriedade **rating**
- ACTED_IN → ator que participou de um filme ou série
- DIRECTED → diretor responsável pelo filme ou série
- IN_GENRE → gênero do filme ou série

---

## Estrutura do Repositório

dados/ → dataset utilizado no projeto  

scripts/setup_database.cypher → script responsável por criar os nós, relacionamentos e constraints no banco  

queries/queries_examples.cypher → exemplos de consultas no grafo  

---

## Exemplo de Consulta

Consulta para encontrar filmes do mesmo gênero:



MATCH (m:Movie)-[:IN_GENRE]->(g)<-[:IN_GENRE]-(rec:Movie)
WHERE m.title = "Galaxy War" AND m <> rec
RETURN rec.title


---

## Objetivo do Projeto

Demonstrar como a modelagem em grafos pode ser utilizada para representar dados complexos e apoiar sistemas de recomendação em plataformas de streaming.



## Modelo do Grafo

O diagrama abaixo representa o modelo de dados utilizado no projeto.

![Modelo do Grafo](images/graph_model.png)

---

## Autor

Projeto desenvolvido como atividade de modelagem de banco de dados em grafos utilizando Neo4j.
