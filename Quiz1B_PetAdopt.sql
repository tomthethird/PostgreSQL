
-- CREATE DATABASE pet_db;

CREATE TABLE breeds (
  breed_id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  breed_name TEXT NOT NULL
);

CREATE TABLE pet_types (
  type_id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  type_name TEXT NOT NULL
);

CREATE TABLE customers (
  customer_id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  customer_name TEXT NOT NULL
);

CREATE TABLE pets (
  pet_id INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  pet_name TEXT NOT NULL,
  pet_birthdate DATE NOT NULL,
  breed_id INTEGER REFERENCES breeds(breed_id),
  type_id INTEGER REFERENCES pet_types(type_id),
  customer_id INTEGER REFERENCES customers(customer_id)
);

CREATE TABLE adoptions (
  adoption_log INTEGER PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
  customer_id INTEGER REFERENCES customers(customer_id),
  pet_id INTEGER REFERENCES pets(pet_id)
);