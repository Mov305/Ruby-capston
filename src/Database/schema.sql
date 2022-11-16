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