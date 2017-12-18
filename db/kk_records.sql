DROP TABLE IF EXISTS artists;
DROP TABLE IF EXISTS stocks;
DROP TABLE IF EXISTS sales;
DROP TABLE IF EXISTS distributors;
DROP TABLE IF EXISTS albums;

CREATE TABLE albums (
  id SERIAL4 PRIMARY KEY,
  title VARCHAR (255),
  artist_id INT4,
  format VARCHAR (255),
  thumb_url VARCHAR (255)
);

CREATE TABLE artists (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE stocks (
  id SERIAL4 PRIMARY KEY,
  album_id INT4 REFERENCES albums(id),
  quantity INT4 DEFAULT 0,
  buy_price NUMERIC(6,2) DEFAULT 0.00,
  sell_price NUMERIC(6,2) DEFAULT 0.00,
  reorder_level INT2
);

CREATE TABLE sales (
  id SERIAL4 PRIMARY KEY,
  album_id INT4 REFERENCES albums(id),
  quantity INT4
);

CREATE TABLE distributors (
  id SERIAL4 PRIMARY KEY,
  album_id INT4 REFERENCES albums(id),
  name VARCHAR (255),
  address VARCHAR (255),
  email VARCHAR (255),
  phone VARCHAR (255)
);
