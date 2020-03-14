DROP TABLE dogs;
DROP TABLE owners;

CREATE TABLE owners (
  id SERIAL primary key,
  name VARCHAR(255),
  email VARCHAR(255),
  phone VARCHAR(255),
  bio VARCHAR(255),
  has_cats BOOLEAN,
  has_other_dogs BOOLEAN,
  has_children BOOLEAN
);

CREATE TABLE dogs (
  id SERIAL primary key,
  name VARCHAR(255),
  age INT,
  gender VARCHAR(255),
  size VARCHAR(255),
  breed VARCHAR(255),
  ok_w_cats BOOLEAN,
  ok_w_dogs BOOLEAN,
  ok_w_children BOOLEAN,
  bio VARCHAR(255),
  owner_id INT REFERENCES owners(id)
);
