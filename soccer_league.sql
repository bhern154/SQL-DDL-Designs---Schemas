DROP DATABASE IF EXISTS soccer_league;

CREATE DATABASE soccer_league;

\c soccer_league

CREATE TABLE teams
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  city TEXT NOT NULL,
  country TEXT NOT NULL
);

CREATE TABLE referees
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE season
(
  id SERIAL PRIMARY KEY,
  start_date DATE,
  end_date DATE
);

CREATE TABLE players
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL,
  date_of_birth DATE NOT NULL,
  height TEXT NOT NULL,
  weight INTEGER NOT NULL,
  gender TEXT NOT NULL,
  current_team_id INTEGER REFERENCES teams(id)
);

CREATE TABLE matches
(
  id SERIAL PRIMARY KEY,
  home_team_id INTEGER REFERENCES teams(id),
  away_team_id INTEGER REFERENCES teams(id),
  location TEXT NOT NULL,
  match_date DATE NOT NULL,
  season_id INTEGER REFERENCES season(id),
  head_referee_id INTEGER REFERENCES referees(id),
  assistant_referee_1_id INTEGER REFERENCES referees(id),
  assistant_referee_2_id INTEGER REFERENCES referees(id)
);

CREATE TABLE results
(
  id SERIAL PRIMARY KEY,
  team_id INTEGER REFERENCES teams(id),
  match_id INTEGER REFERENCES matches(id),
  result TEXT NOT NULL
);

CREATE TABLE goals
(
  id SERIAL PRIMARY KEY,
  player_id INTEGER REFERENCES players(id),
  match_id INTEGER REFERENCES matches(id),
  goal_count INTEGER NOT NULL
);

CREATE TABLE lineups
(
  id SERIAL PRIMARY KEY,
  player_id INTEGER REFERENCES players(id),
  match_id INTEGER REFERENCES matches(id),
  team_id INTEGER REFERENCES teams(id)
);

-- ADD SOME DATA

INSERT INTO teams
  (name, city, country)
VALUES
  ('Barcelona', 'Catalonia', 'Spain'),
  ('Liverpool', 'Liverpool', 'United Kingdom'),
  ('Napoli', 'Naples', 'Italy');

INSERT INTO referees
  (name)
VALUES
  ('Erik Casey'),
  ('Daryl Miller'),
  ('Aubrey Henderson');

INSERT INTO season
  (start_date, end_date)
VALUES
  ('2010/08/01', '2011/05/01'),
  ('2011/08/01', '2012/05/01'),
  ('2012/08/01', '2013/05/01');

INSERT INTO players
  (name, date_of_birth, height, weight, gender, current_team_id)
VALUES
  ('Alton Black', '1985/05/25', '6''2"', 210, 'Male', '1'),
  ('Justin Weber', '1992/03/21', '5''11"', 195, 'Male', '2'),
  ('Gerald Pearson', '1997/07/13', '6''1"', 230, 'Male', '1'),
  ('Clint Mack', '1983/02/24', '6''5"', 185, 'Male', '3'),
  ('Clark Perkins', '1984/09/27', '5''10"', 215, 'Male', '2'),
  ('Van Holloway', '1991/04/05', '5''9"', 205, 'Male', '1'),
  ('Sheldon King', '1990/03/17', '6''0"', 230, 'Male', '3');

INSERT INTO matches
  (home_team_id, away_team_id, location, match_date, season_id, head_referee_id, assistant_referee_1_id, assistant_referee_2_id)
VALUES
  (1, 2, 'Liverpool, United Kingdom', '2011/02/01', 1, 1, 2, 3),
  (2, 3, 'Naples, Italy', '2012/02/01', 2, 2, 3, 1);

INSERT INTO results
  (team_id, match_id, result)
VALUES
  (1, 1, 'win'),
  (1, 2, 'loss'),
  (2, 1, 'loss'),
  (2, 2, 'win');

INSERT INTO goals
  (player_id, match_id, goal_count)
VALUES
  (1, 1, 3),
  (2, 1, 1),
  (3, 1, 1),
  (4, 1, 0),
  (5, 1, 1),
  (6, 1, 0),
  (7, 1, 0),
  (1, 2, 2),
  (2, 2, 2),
  (3, 2, 0),
  (4, 2, 0),
  (5, 2, 1),
  (6, 2, 1),
  (7, 2, 0);

INSERT INTO lineups
  (player_id, match_id, team_id)
VALUES
  (1, 1, 1),
  (2, 1, 2),
  (3, 1, 1),
  (4, 1, 3),
  (5, 2, 2),
  (6, 2, 1),
  (7, 2, 3);
