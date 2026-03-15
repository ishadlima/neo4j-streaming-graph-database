// ============================
// CONSULTAS DE NEGÓCIO
// ============================


// 1 - Ver quais filmes cada usuário assistiu

MATCH (u:User)-[:WATCHED]->(m:Movie)
RETURN u.name AS usuario, m.title AS filme


// 2 - Filmes do mesmo gênero (base para recomendação)

MATCH (m:Movie)-[:IN_GENRE]->(g)<-[:IN_GENRE]-(rec:Movie)
WHERE m.title = "Galaxy War" AND m <> rec
RETURN rec.title AS recomendacao


// 3 - Usuários com gosto parecido

MATCH (u1:User)-[:WATCHED]->(m)<-[:WATCHED]-(u2:User)
WHERE u1 <> u2
RETURN u1.name AS usuario1, u2.name AS usuario2, count(m) AS filmes_em_comum
ORDER BY filmes_em_comum DESC


// 4 - Filmes mais assistidos

MATCH (:User)-[:WATCHED]->(m:Movie)
RETURN m.title AS filme, count(*) AS total_visualizacoes
ORDER BY total_visualizacoes DESC


// 5 - Filmes com determinado ator

MATCH (a:Actor)-[:ACTED_IN]->(m:Movie)
RETURN a.name AS ator, m.title AS filme
