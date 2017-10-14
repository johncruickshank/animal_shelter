DROP TABLE pets;
DROP TABLE animals;
DROP TABLE owners;

CREATE TABLE owners (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE animals (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  type VARCHAR(255),
  breed VARCHAR(255),
  adoptable boolean,
  admission_date date,
  image VARCHAR(255)
);

CREATE TABLE pets (
  id SERIAL8 PRIMARY KEY,
  owner_id INT8 REFERENCES owners(id),
  animal_id INT8 REFERENCES animals(id)
);
