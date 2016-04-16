IF OBJECT_ID('comments', 'U') IS NOT NULL DROP TABLE comments;
IF OBJECT_ID('posts_tags', 'U') IS NOT NULL DROP TABLE posts_tags;
IF OBJECT_ID('posts', 'U') IS NOT NULL DROP TABLE posts;
IF OBJECT_ID('tags', 'U') IS NOT NULL DROP TABLE tags;

CREATE TABLE posts (
	id INT IDENTITY PRIMARY KEY
	,title VARCHAR(255) NOT NULL
	,content TEXT NOT NULL
	,created_at DATETIME NOT NULL
	,updated_at DATETIME NOT NULL
);

CREATE TABLE tags (
	id INT IDENTITY PRIMARY KEY
	,name VARCHAR(255) NOT NULL
	,created_at DATETIME NOT NULL
	,updated_at DATETIME NOT NULL
);

CREATE TABLE posts_tags (
	post_id INTEGER NOT NULL
	,tag_id INTEGER NOT NULL
	,PRIMARY KEY (post_id, tag_id)
	,FOREIGN KEY (post_id) REFERENCES posts (id)
	,FOREIGN KEY (tag_id) REFERENCES tags (id)
);

CREATE TABLE comments (
	id INT IDENTITY PRIMARY KEY NOT NULL
	,post_id INTEGER NOT NULL
	,author_name VARCHAR(255) NOT NULL
	,author_email VARCHAR(255) NOT NULL
	,content TEXT NOT NULL
	,created_at DATETIME NOT NULL
	,updated_at DATETIME NOT NULL
	,FOREIGN KEY (post_id) REFERENCES posts (id)
);
