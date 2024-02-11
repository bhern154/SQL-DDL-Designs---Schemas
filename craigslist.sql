DROP DATABASE IF EXISTS craigslist;

CREATE DATABASE craigslist;

\c craigslist

CREATE TABLE regions
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE categories
(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE users
(
  id SERIAL PRIMARY KEY,
  username TEXT NOT NULL,
  encrypted_password TEXT NOT NULL,
  preferred_region_id INTEGER REFERENCES regions(id)
);

CREATE TABLE posts
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  description TEXT NOT NULL,
  location TEXT NOT NULL,
  user_id INTEGER REFERENCES users(id),
  region_id INTEGER REFERENCES regions(id),
  category_id INTEGER REFERENCES categories(id)
);

-- ADD SOME DATA

INSERT INTO regions
  (name)
VALUES
  ('Central Los Angeles, CA'),
  ('San Fernando Valley, CA'),
  ('South Bay, CA');

INSERT INTO categories
  (name)
VALUES
  ('electronics'),
  ('apartments'),
  ('home');

INSERT INTO users
  (username, encrypted_password, preferred_region_id)
VALUES
  ('ElviraThePotter', '23kjb4rkj32b2kj', 2),
  ('TheOnlyRobin', '5kjb2kj3bkb52kj3', 1),
  ('BenTheone', '7hb67jhb5786nm6b5', 3);

INSERT INTO posts
  (title, description, location, user_id, region_id, category_id)
VALUES
  ('Macbook Pro 2021', 'i7, 500 gb storage, 16 gb ramm silver', 'Los Angeles, CA', 2, 1, 1),
  ('12 Candles', 'Set of 12 candles by Voluspa', 'San Fancisco, CA', 3, 3, 3),
  ('2 Bedroom Apartment', '2 bedrooms, 2 bathrooms, front yard', 'San Fernando, CA', 1, 2, 2);
