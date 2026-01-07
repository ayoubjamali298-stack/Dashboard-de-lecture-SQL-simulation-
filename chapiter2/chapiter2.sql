CREATE DATABASE chapter2 ;
USE chapter2 ;
CREATE TABLE user_1
(
    id_user_1 INT AUTO_INCREMENT PRIMARY KEY ,
    name_user_1 VARCHAR(30) NOT NULL  
);
INSERT INTO user_1 (name_user_1) VALUES ("PEDRO"),
                                        ("ALEX"),
                                        ("NOAH"),
                                        ("STEVE")
                                        ;
CREATE TABLE article_1
(
  id_article INT AUTO_INCREMENT PRIMARY KEY ,
  content TEXT NULL ,
  title VARCHAR(50) NOT NULL ,
  vues INT NOT NULL ,
  date_article DATE NOT NULL ,
  id_user_article_1 INT NOT NULL ,
  FOREIGN KEY (id_user_article_1) REFERENCES user_1(id_user_1)
);
INSERT INTO article_1 (content,title ,vues,date_article ,id_user_article_1)
                         VALUES ("AAAA","ARTICLE8A",100,"2026-11-01",1),
                                ("BBBB","ARTICLEB",200,"2026-11-02",1),
                                ("CCCCCC","ARTICLE8C",50,"2026-11-03",2),
                                ("DDDDD","ARTICLE8D",500,"2026-11-04",2),
                                ("EEEEE","ARTICLE8E",130,"2026-11-05",2),
                                ("RRRRRR","ARTICLE8R",103,"2026-11-06",4),
                                ("QQQQQQ","ARTICLE8Q",123,"2026-11-07",3),
                                ("SSSSSS","ARTICLE8S",242,"2026-11-08",4)       
  
SELECT COUNT(*) AS ALL_article_1 FROM article_1 ;                              ;
SELECT AVG(vues) AS number_vues FROM article_1 ;
SELECT id_user_article_1 , COUNT(*) AS number_article_1 FROM article_1 GROUP BY id_user_article_1 ;
SELECT id_user_article_1 , COUNT(*) AS number_article_1 FROM article_1 GROUP BY id_user_article_1 HAVING COUNT(*) >= 2 ;
SELECT MAX(date_article) AS last_publication FROM article_1 ;