// ----------------------------------------------------
// Query 1: Filmes mais bem avaliados pelos usuários
// ----------------------------------------------------
MATCH (u:User)-[w:WATCHED]->(m:Movie)
RETURN m.title AS Movie, avg(w.rating) AS AverageRating
ORDER BY AverageRating DESC;


// ----------------------------------------------------
// Query 2: Filmes assistidos por usuários que gostaram
// de um determinado filme
// ----------------------------------------------------
MATCH (u:User)-[:WATCHED]->(m:Movie {title: "Inception"})
MATCH (u)-[:WATCHED]->(rec:Movie)
WHERE rec.title <> "Inception"
RETURN DISTINCT rec.title AS RecommendedMovies;


// ----------------------------------------------------
// Query 3: Filmes de um determinado gênero
// ----------------------------------------------------
MATCH (m:Movie)-[:IN_GENRE]->(g:Genre {name: "Action"})
RETURN m.title AS ActionMovies;


// ----------------------------------------------------
// Query 4: Filmes de um ator específico
// ----------------------------------------------------
MATCH (a:Actor {name: "Leonardo DiCaprio"})-[:ACTED_IN]->(m:Movie)
RETURN m.title AS Movies;


// ----------------------------------------------------
// Query 5: Diretores e seus filmes
// ----------------------------------------------------
MATCH (d:Director)-[:DIRECTED]->(m:Movie)
RETURN d.name AS Director, collect(m.title) AS Movies;
