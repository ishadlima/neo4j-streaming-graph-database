// =============================
// CONSTRAINTS
// =============================

CREATE CONSTRAINT user_id IF NOT EXISTS
FOR (u:User) REQUIRE u.id IS UNIQUE;

CREATE CONSTRAINT movie_id IF NOT EXISTS
FOR (m:Movie) REQUIRE m.id IS UNIQUE;

CREATE CONSTRAINT series_id IF NOT EXISTS
FOR (s:Series) REQUIRE s.id IS UNIQUE;

CREATE CONSTRAINT actor_id IF NOT EXISTS
FOR (a:Actor) REQUIRE a.id IS UNIQUE;

CREATE CONSTRAINT director_id IF NOT EXISTS
FOR (d:Director) REQUIRE d.id IS UNIQUE;

CREATE CONSTRAINT genre_name IF NOT EXISTS
FOR (g:Genre) REQUIRE g.name IS UNIQUE;


// =============================
// USERS
// =============================

CREATE
(u1:User {id:1, name:"Ana"}),
(u2:User {id:2, name:"Bruno"}),
(u3:User {id:3, name:"Carlos"}),
(u4:User {id:4, name:"Daniela"}),
(u5:User {id:5, name:"Eduardo"}),
(u6:User {id:6, name:"Fernanda"}),
(u7:User {id:7, name:"Gabriel"}),
(u8:User {id:8, name:"Helena"}),
(u9:User {id:9, name:"Igor"}),
(u10:User {id:10, name:"Julia"});


// =============================
// GENRES
// =============================

CREATE
(g1:Genre {name:"Action"}),
(g2:Genre {name:"Drama"}),
(g3:Genre {name:"Sci-Fi"}),
(g4:Genre {name:"Comedy"});


// =============================
// MOVIES
// =============================

CREATE
(m1:Movie {id:1, title:"Galaxy War"}),
(m2:Movie {id:2, title:"Last Mission"}),
(m3:Movie {id:3, title:"Broken Dreams"}),
(m4:Movie {id:4, title:"Laugh Out"}),
(m5:Movie {id:5, title:"Cyber City"}),
(m6:Movie {id:6, title:"Night Escape"}),
(m7:Movie {id:7, title:"Future World"}),
(m8:Movie {id:8, title:"Silent Love"}),
(m9:Movie {id:9, title:"Hidden Truth"}),
(m10:Movie {id:10, title:"Space Odyssey"});


// =============================
// ACTORS
// =============================

CREATE
(a1:Actor {id:1, name:"Tom Silva"}),
(a2:Actor {id:2, name:"Maria Costa"}),
(a3:Actor {id:3, name:"Lucas Pereira"});


// =============================
// DIRECTORS
// =============================

CREATE
(d1:Director {id:1, name:"James Oliveira"}),
(d2:Director {id:2, name:"Patricia Souza"});


// =============================
// RELATIONSHIPS
// =============================

// Genre relationships
CREATE
(m1)-[:IN_GENRE]->(g3),
(m2)-[:IN_GENRE]->(g1),
(m3)-[:IN_GENRE]->(g2),
(m4)-[:IN_GENRE]->(g4),
(m5)-[:IN_GENRE]->(g3),
(m6)-[:IN_GENRE]->(g1),
(m7)-[:IN_GENRE]->(g3),
(m8)-[:IN_GENRE]->(g2),
(m9)-[:IN_GENRE]->(g2),
(m10)-[:IN_GENRE]->(g3);

// Actor relationships
CREATE
(a1)-[:ACTED_IN]->(m1),
(a1)-[:ACTED_IN]->(m5),
(a2)-[:ACTED_IN]->(m2),
(a2)-[:ACTED_IN]->(m4),
(a3)-[:ACTED_IN]->(m3),
(a3)-[:ACTED_IN]->(m8);

// Director relationships
CREATE
(d1)-[:DIRECTED]->(m1),
(d1)-[:DIRECTED]->(m7),
(d2)-[:DIRECTED]->(m3),
(d2)-[:DIRECTED]->(m4);

// Watched relationships
CREATE
(u1)-[:WATCHED {rating:5}]->(m1),
(u1)-[:WATCHED {rating:4}]->(m3),
(u2)-[:WATCHED {rating:5}]->(m1),
(u3)-[:WATCHED {rating:3}]->(m2),
(u4)-[:WATCHED {rating:4}]->(m5),
(u5)-[:WATCHED {rating:5}]->(m7),
(u6)-[:WATCHED {rating:4}]->(m6),
(u7)-[:WATCHED {rating:3}]->(m8),
(u8)-[:WATCHED {rating:5}]->(m9),
(u9)-[:WATCHED {rating:4}]->(m10),
(u10)-[:WATCHED {rating:5}]->(m4);
