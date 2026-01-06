drop database if exists blog;
create database blog;
use blog;
CREATE TABLE users (
    id_user INT PRIMARY KEY AUTO_INCREMENT,
    user_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    date_birth date not null
    
)COMMENT = 'Table of users';

CREATE TABLE category (
    id_category INT PRIMARY KEY AUTO_INCREMENT,
    category_name VARCHAR(30) NOT NULL
    
)COMMENT = 'Table of category';

CREATE TABLE Posts (
    id_post INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(50) NOT NULL,
    content TEXT NOT NULL,
    publish_date DATE NOT NULL,
    statu ENUM('published', 'draft'), 
    id_user INT,
    id_category INT,
    FOREIGN KEY (id_user) REFERENCES users(id_user),
    FOREIGN KEY (id_category) REFERENCES category(id_category)
    
)COMMENT = 'Table of artlicles';

CREATE TABLE comments (
    id_comment INT PRIMARY KEY AUTO_INCREMENT,
    content TEXT NOT NULL,
    publish_date DATE,
    id_user INT,
    id_post INT, 
    FOREIGN KEY (id_user) REFERENCES users(id_user),
    FOREIGN KEY (id_post) REFERENCES Posts(id_post)
    
)COMMENT = 'Table de commentaire';


CREATE INDEX idx_email ON users (email);
CREATE INDEX idx_user ON Posts (id_user);
CREATE INDEX idx_article ON comments (id_post);

INSERT INTO users (user_name, email, date_birth) VALUES
('abdsalam', 'abdsalam@gmail.com', '2003-11-06'),
('hasan', 'hasan@gmail.com', '2000-05-20'),
('Ayoub', 'ayoub@gmail.com', '1986-11-08');

INSERT INTO category (category_name) VALUES
('Technologie'),
('Santé'),
('Voyage');

INSERT INTO Posts (title, content, publish_date, id_user) VALUES
('Premier Article', 'Ceci est le contenu du premier article.', '2024-01-10', 1),
('Deuxieme Article', 'Ceci est le contenu du deuxieme article.', '2024-02-15', 2),
('Troisieme Article', 'Ceci est le contenu du troisieme article.', '2024-03-20', 1);

INSERT INTO comments (content, publish_date, id_user, id_post) VALUES
('Excellent article!', '2024-01-11', 1, 1),
('Merci pour ces informations.', '2024-02-16', 2, 2),
('bien article', '2024-03-21', 3, 3);



select * from posts;

SELECT title, publish_date FROM posts;

SELECT title, publish_date
FROM posts
WHERE publish_date >= '2024-01-10';

SELECT title, publish_date
FROM posts
ORDER BY publish_date DESC;

SELECT title
FROM posts
ORDER BY publish_date DESC
LIMIT 2;