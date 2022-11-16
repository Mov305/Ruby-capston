-- Author Table
CREATE TABLE author (
  id int PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  first_name varchar(100),
  last_name varchar(100)
);
