-- from the terminal run:
-- psql < air_traffic.sql

DROP DATABASE IF EXISTS air_traffic;

CREATE DATABASE air_traffic;

\c air_traffic

CREATE TABLE airports (
  id SERIAL PRIMARY KEY,
  airport_code TEXT NOT NULL
);

CREATE TABLE airlines (
  id SERIAL PRIMARY KEY,
  airline TEXT NOT NULL
);

CREATE TABLE flights (
  id SERIAL PRIMARY KEY,
  flight_number INTEGER NOT NULL,
  to_city INTEGER REFERENCES airports,
  from_city INTEGER REFERENCES airports,
  departure TIMESTAMP NOT NULL,
  arrival TIMESTAMP NOT NULL,
  airline INTEGER REFERENCES airlines
);

CREATE TABLE passengers (
  id SERIAL PRIMARY KEY,
  first_name TEXT NOT NULL,
  last_name TEXT NOT NULL,
  seat TEXT NOT NULL
);

INSERT INTO airports
  (airport_code)
VALUES
  ('DCA'), --1
  ('SEA'), --2
  ('HND'), --3
  ('YXU'), --4
  ('LAX'), --5
  ('LAS'), --6
  ('MEX'), --7
  ('CDG'), --8
  ('CMN'), --9
  ('DXB'), --10
  ('PEK'), --11
  ('JFK'), --12
  ('CLT'), --13
  ('CID'), --14
  ('ORD'), --15
  ('MSY'), --16
  ('GRU'), --17
  ('SCL'); --18

INSERT INTO airlines
  (airline)
VALUES
  ('United'), --1
  ('British Airways'), --2
  ('Delta'), --3
  ('TUI Fly Belgium'), --4
  ('Air China'), --5
  ('American Airlines'), --6
  ('Avianca Brasil'); --7

INSERT INTO flights
  (flight_number, to_city, from_city, departure, arrival, airline)
VALUES
  (234, 1, 2, '2018-04-08 09:00:00', '2018-04-08 12:00:00', 1),
  (873, 3, 4, '2018-12-19 12:45:00', '2018-12-19 16:15:00', 2),
  (9872, 5, 6, '2018-01-02 07:00:00', '2018-01-02 08:03:00', 3),
  (1010, 2, 7, '2018-04-15 16:50:00', '2018-04-15 21:00:00', 3),
  (783, 8, 9, '2018-08-01 18:30:00', '2018-08-01 21:50:00', 4),
  (811, 10, 11, '2018-08-01 18:30:00', '2018-08-01 21:50:00', 5),
  (122, 12, 13, '2019-02-06 06:00:00', '2019-02-06 07:47:00', 1),
  (933, 14, 15, '2018-12-22 14:42:00', '2018-12-22 15:56:00', 6),
  (6552, 13, 16, '2019-02-06 16:28:00', '2019-02-06 19:18:00', 6),
  (1135, 17, 18, '2019-01-20 19:30:00', '2019-01-20 22:45:00', 7);

INSERT INTO passengers
  (first_name, last_name, seat)
VALUES
  ('Jennifer', 'Finch', '33B'),
  ('Thadeus', 'Gathercoal', '8A'),
  ('Sonja', 'Pauley', '12F'),
  ('Jennifer', 'Finch', '20A'),
  ('Waneta', 'Skeleton', '23D'),
  ('Thadeus', 'Gathercoal', '18C'),
  ('Berkie', 'Wycliff', '9E'),
  ('Alvin', 'Leathes', '1A'),
  ('Berkie', 'Wycliff', '32B'),
  ('Cory', 'Squibbes', '10D');


--ORIGINAL CODE


-- CREATE TABLE tickets
-- (
--   id SERIAL PRIMARY KEY,
--   first_name TEXT NOT NULL,
--   last_name TEXT NOT NULL,
--   seat TEXT NOT NULL,
--   departure TIMESTAMP NOT NULL,
--   arrival TIMESTAMP NOT NULL,
--   airline TEXT NOT NULL,
--   from_city TEXT NOT NULL,
--   from_country TEXT NOT NULL,
--   to_city TEXT NOT NULL,
--   to_country TEXT NOT NULL
-- );

-- INSERT INTO tickets
--   (first_name, last_name, seat, departure, arrival, airline, from_city, from_country, to_city, to_country)
-- VALUES
--   ('Jennifer', 'Finch', '33B', '2018-04-08 09:00:00', '2018-04-08 12:00:00', 'United', 'Washington DC', 'United States', 'Seattle', 'United States'),
--   ('Thadeus', 'Gathercoal', '8A', '2018-12-19 12:45:00', '2018-12-19 16:15:00', 'British Airways', 'Tokyo', 'Japan', 'London', 'United Kingdom'),
--   ('Sonja', 'Pauley', '12F', '2018-01-02 07:00:00', '2018-01-02 08:03:00', 'Delta', 'Los Angeles', 'United States', 'Las Vegas', 'United States'),
--   ('Jennifer', 'Finch', '20A', '2018-04-15 16:50:00', '2018-04-15 21:00:00', 'Delta', 'Seattle', 'United States', 'Mexico City', 'Mexico'),
--   ('Waneta', 'Skeleton', '23D', '2018-08-01 18:30:00', '2018-08-01 21:50:00', 'TUI Fly Belgium', 'Paris', 'France', 'Casablanca', 'Morocco'),
--   ('Thadeus', 'Gathercoal', '18C', '2018-10-31 01:15:00', '2018-10-31 12:55:00', 'Air China', 'Dubai', 'UAE', 'Beijing', 'China'),
--   ('Berkie', 'Wycliff', '9E', '2019-02-06 06:00:00', '2019-02-06 07:47:00', 'United', 'New York', 'United States', 'Charlotte', 'United States'),
--   ('Alvin', 'Leathes', '1A', '2018-12-22 14:42:00', '2018-12-22 15:56:00', 'American Airlines', 'Cedar Rapids', 'United States', 'Chicago', 'United States'),
--   ('Berkie', 'Wycliff', '32B', '2019-02-06 16:28:00', '2019-02-06 19:18:00', 'American Airlines', 'Charlotte', 'United States', 'New Orleans', 'United States'),
--   ('Cory', 'Squibbes', '10D', '2019-01-20 19:30:00', '2019-01-20 22:45:00', 'Avianca Brasil', 'Sao Paolo', 'Brazil', 'Santiago', 'Chile');