/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
  id int generated always as identity,
  name char,
  date_of_birth date,
  escape_attempts int,
  neutered boolean,
  weight_kg decimal,
  PRIMARY KEY(id)
);