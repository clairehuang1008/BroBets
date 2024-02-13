CREATE TABLE users (
  user_id SERIAL PRIMARY KEY,
  email VARCHAR(255) UNIQUE NOT NULL,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  password VARCHAR(255)
);

CREATE TABLE events (
  event_id SERIAL PRIMARY KEY,
  event_title VARCHAR(255) DEFAULT 'New Event',
  created_at TIMESTAMP,
  last_call TIMESTAMP,
  has_ended BOOLEAN,
  admin INTEGER NOT NULL REFERENCES users(user_id) ON DELETE CASCADE,
  total_points NUMERIC,
  players_count NUMERIC
);

CREATE TABLE bets (
  bet_id SERIAL PRIMARY KEY,
  event_id INTEGER NOT NULL REFERENCES events(event_id) ON DELETE CASCADE,
  type VARCHAR(255) NOT NULL,
  correct_answer VARCHAR(255) DEFAULT NULL,
  question VARCHAR(255),
  points NUMERIC
);

CREATE TABLE answers (
  bet_id INTEGER NOT NULL REFERENCES bets(bet_id) ON DELETE CASCADE,
  answer VARCHAR(255),
  user_id INTEGER NOT NULL REFERENCES users(user_id) ON DELETE CASCADE
);

CREATE TABLE scores (
  user_id INTEGER NOT NULL REFERENCES users(user_id) ON DELETE CASCADE,
  nickname VARCHAR(255),
  event_id INTEGER NOT NULL REFERENCES events(event_id) ON DELETE CASCADE,
  score NUMERIC,
  place NUMERIC
);