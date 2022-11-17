/* Books table */
CREATE TABLE books (
    id INT NOT NULL GENERATED BY DEFAULT AS IDENTITY,
    title VARCHAR(255) NOT NULL,
    author VARCHAR(255) NOT NULL,
    gener VARCHAR(255),
    source VARCHAR(255),
    label VARCHAR(255),
    publish_date DATE,
    publisher VARCHAR(255),
    cover_state VARCHAR(255),
    PRIMARY KEY (id)
);

/* Labels table */
CREATE TABLE labels (
    id INT NOT NULL GENERATED BY DEFAULT AS IDENTITY,
    title VARCHAR(255) NOT NULL,
    color VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

/* Books labels table */
CREATE TABLE books_labels (
    book_id INT NOT NULL,
    label_id INT NOT NULL,
    PRIMARY KEY (book_id, label_id),
    FOREIGN KEY (book_id) REFERENCES books(id),
    FOREIGN KEY (label_id) REFERENCES labels(id)
);

CREATE TABLE source (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  name VARCHAR(200)
);

CREATE TABLE movie (
  id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  silent BOOLEAN,
  publish_date DATE,
  archived BOOLEAN
);

-- Author Table
CREATE TABLE author (
  id int PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  first_name varchar(100),
  last_name varchar(100)
);

-- Game Table
CREATE TABLE game (
  id integer REFERENCES item(id),
  multiplayer boolean,
  last_played_at date,
  publish_date date,
  author_id int,
  gamename text
);