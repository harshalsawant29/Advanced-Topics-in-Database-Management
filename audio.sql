--DROP TABLE audio;

CREATE TABLE audio
 (num_id     NUMBER (3),
 title       VARCHAR2 (30),
 artist      VARCHAR2 (30),
 label       VARCHAR2 (30),
 year        NUMBER (4),
 price       NUMBER (5,2),
 CONSTRAINT  audio_num_id_pk PRIMARY KEY (NUM_ID));
 

 SET SCAN OFF
 INSERT INTO audio
 VALUES (1,'All Mixed Up','LaBouche','RCA', 1996, 13.95);
 
 INSERT INTO audio
 VALUES (2,'Load','Metallica','Elektra', 1996, 11.95);
 
 INSERT INTO audio
 VALUES (3,'In The Mirror','Yanni','Windham Hill', 1997, 12.99);
 
 INSERT INTO audio
 VALUES (4,'Pure Moods','Various','Virgin', 1994, 13.95);
 
 INSERT INTO audio
 VALUES (5,'Ozzmosis','Ozzy Osbourne','Epic', 1995, 12.45);
 
 INSERT INTO audio
 VALUES (6,'Anthology 3','The Beatles','Apple', 1996, 23.95);
 
 INSERT INTO audio
 VALUES (7,'To The Faithful Departed','The Cranberries','Island', 1996, 13.45);
 
 INSERT INTO audio
 VALUES (8,'Watermark','Enya','Reprise Records', 1988, 10.99);
 
 INSERT INTO audio
 VALUES (9,'Sheryl Crow','Sheryl Crow','A&M', 1996, 13.95);
 
 INSERT INTO audio
 VALUES (10,'16 Most Requested songs','Andy Williams','Columbia Records', 1986, 12.95);
 
 INSERT INTO audio
 VALUES (11,'Escape From Television','Jan Hammer','MCA Records', 1987, 11.95);
 
 INSERT INTO audio
 VALUES (12,'Crystal Planet','Joe Satriani','Epic Records', 1998, 13.95);
 
 INSERT INTO audio
 VALUES (13,'Shepherd Moons','Enya','Reprise Records', 1992, 12.45);
 
 INSERT INTO audio
 VALUES (14,'Very Best Of Mikis Theodorakis','Mikis Theodorakis','FM Records', 1997, 15.99);
 
 INSERT INTO audio
 VALUES (15,'Albedo 0.39','Vangelis','Windham Hill', 1975, 10.95);
 
 INSERT INTO audio
 VALUES (16,'Music From Mission Impossible','Lalo Schifrin','Hip-O Records', 1996, 12.99);
 
 INSERT INTO audio
 VALUES (17,'The Rock Original Soundtrack','Hans Zimmer','Hollywood', 1996, 12.49);
 
 INSERT INTO audio
 VALUES (18,'Aquarium','Aqua','MCA Records', 1997, 14.99);
 
 INSERT INTO audio
 VALUES (19,'The Very Good Years','Frank Sinatra','Reprise Records', 1991, 11.99);
 
 INSERT INTO audio
 VALUES (20,'Collective Soul','Collective Soul','Atlantic Recording', 1995, 11.95);
 
 INSERT INTO audio
 VALUES (21,'My Favorite Chopin','Van Cliburn','RCA Victor', 1961, 11.99);
 
 INSERT INTO audio
 VALUES (22,'Joe Cocker Ultimate Collection','Joe Cocker','Hip-O Records', 2004, 10.99);
 
 Commit;