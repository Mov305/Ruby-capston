CREATE DATABASE IF NOT EXISTS catalog_of_my_things;


-- Genre's Table
CREATE TABLE genres(
  id INTEGER GENERATED ALWAYS AS IDENTITY,
  name TEXT,
  PRIMARY KEY(id)
);

-- Music Album table
CREATE TABLE musicAlbum(
  id INTEGER GENERATED ALWAYS AS IDENTITY,
  genre_id INTEGER,
  author_id INTEGER,
  label_id INTEGER,
  publish_date DATE,
  archived BOOLEAN,
  on_spotify BOOLEAN,
  PRIMARY KEY(id)
  CONSTRAINT fk_authors FOREIGN KEY (author_id) REFERENCES authors(id),
  CONSTRAINT fk_genres FOREIGN KEY (genre_id) REFERENCES genres(id),
  CONSTRAINT fk_labels FOREIGN KEY (label_id) REFERENCES labels(id)
);

-- authors table
CREATE TABLE authors (
    id INTEGER PRIMARY KEY,
    fist_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL
);

--  other tables to be create are genres and labels