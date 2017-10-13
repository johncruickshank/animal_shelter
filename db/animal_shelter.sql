DROP TABLE pet;
DROP TABLE animal;
DROP TABLE owner;

CREATE TABLE owner (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE animal (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  type VARCHAR(255),
  breed VARCHAR(255),
  adoptable boolean,
  admission_date date
);

CREATE TABLE pet (
  id SERIAL8 PRIMARY KEY,
  owner_id INT8 REFERENCES owner(id),
  animal_id INT8 REFERENCES animal(id)
);
