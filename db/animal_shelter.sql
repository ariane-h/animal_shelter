DROP TABLE dogs;
DROP TABLE owners;

CREATE TABLE owners (
  id SERIAL primary key,
  name VARCHAR(255),
  email VARCHAR(255),
  phone_number VARCHAR(255),
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
  bio VARCHAR(255),
  ok_with_cats BOOLEAN,
  ok_with_dogs BOOLEAN,
  ok_with_children BOOLEAN,
  owner_id INT REFERENCES owners(id)
);
