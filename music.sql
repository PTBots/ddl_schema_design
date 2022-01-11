-- from the terminal run:
-- psql < music.sql

DROP DATABASE IF EXISTS music;

CREATE DATABASE music;

\c music

CREATE TABLE producers
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE artists
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE albums
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  artists INT REFERENCES artists,
  release_date DATE NOT NULL
);

CREATE TABLE songs
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  duration_in_seconds INTEGER NOT NULL,
  release_date DATE NOT NULL,
  artists INTEGER REFERENCES artists,
  album INT REFERENCES albums,
  producers TEXT[] NOT NULL
);

INSERT INTO producers
  (name)
VALUES
  ('Dust Brothers'), --1
  ('Stephen Lironi'), --2
  ('Roy Thomas Baker'), --3
  ('Walter Afanasieff'), --4
  ('Benjamin Rice'), --5
  ('Rick Parashar'), --6
  ('Al Shux'), --7
  ('Max Martin'), --8
  ('Cirkut'), --9
  ('Shellback'), --10
  ('Benny Blanco'), --11
  ('The Matrix'), --12
  ('Darkchild'); --13

INSERT INTO artists
  (name)
VALUES 
  ('Hanson'), --1
  ('Queen'), --2
  ('Mariah Cary'), --3
  ('Boyz II Men'), --4
  ('Lady Gaga'), --5
  ('Bradley Cooper'), --6
  ('Nickelback'), --7
  ('Jay Z'), --8
  ('Alicia Keys'), --9
  ('Katy Perry'), --10
  ('Juicy J'), --11
  ('Maroon 5'), --12
  ('Christina Aguilera'), --13
  ('Avril Lavigne'), --14
  ('Destiny''s Child'); --15

INSERT INTO albums
  (title, artists, release_date)
VALUES
  ('Middle of Nowhere', 1, '04-15-1997'), --1
  ('A Night at the Opera', 2, '10-31-1975'), --2
  ('Daydream', 3, '11-14-1995'), --3
  ('Daydream', 4, '11-14-1995'), --4
  ('A Star Is Born', 5, '09-27-2018'), --5
  ('A Star Is Born', 6, '09-27-2018'), --6
  ('Silver Side Up', 7, '08-21-2001'), --7
  ('The Blueprint 3', 8, '10-20-2009'), --8
  ('The Blueprint 3', 9, '10-20-2009'), --9
  ('Prism', 10, '12-17-2013'), --10
  ('Prism', 11, '12-17-2013'), --11
  ('Hands All Over', 12, '06-21-2011'), --12
  ('Hands All Over', 13, '06-21-2011'), --13
  ('Let Go', 14, '05-14-2002'), --14
  ('The Writing''s on the Wall', 15, '11-07-1999'); --15

INSERT INTO songs
  (title, duration_in_seconds, release_date, artists, album, producers)
VALUES
  ('MMMBop', 238, '04-15-1997', 1, 1, '{"Dust Brothers", "Stephen Lironi"}'),
  ('Bohemian Rhapsody', 355, '10-31-1975', 2, 2, '{"Roy Thomas Baker"}'),
  ('One Sweet Day', 282, '11-14-1995', 3, 3, '{"Walter Afanasieff"}'),
  ('One Sweet Day', 282, '11-14-1995', 4, 3, '{"Walter Afanasieff"}'),
  ('Shallow', 216, '09-27-2018', 5, 4, '{"Benjamin Rice"}'),
  ('Shallow', 216, '09-27-2018', 6, 4, '{"Benjamin Rice"}'),
  ('How You Remind Me', 223, '08-21-2001', 7, 5, '{"Rick Parashar"}'),
  ('New York State of Mind', 276, '10-20-2009', 8, 6, '{"Al Shux"}'),
  ('New York State of Mind', 276, '10-20-2009', 9, 6, '{"Al Shux"}'),
  ('Dark Horse', 215, '12-17-2013', 10, 7, '{"Max Martin", "Cirkut"}'),
  ('Dark Horse', 215, '12-17-2013', 11, 7, '{"Max Martin", "Cirkut"}'),
  ('Moves Like Jagger', 201, '06-21-2011', 12, 8, '{"Shellback", "Benny Blanco"}'),
  ('Moves Like Jagger', 201, '06-21-2011', 13, 8, '{"Shellback", "Benny Blanco"}'),
  ('Complicated', 244, '05-14-2002', 14, 9, '{"The Matrix"}'),
  ('Say My Name', 240, '11-07-1999', 15, 10, '{"Darkchild"}');
