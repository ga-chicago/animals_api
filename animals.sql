-- Notes on manual database prep

CREATE DATABASE wdianimalsapi;
\c wdianimalsapi;

CREATE TABLE animals (
  id SERIAL PRIMARY KEY,
  name varchar(255),
  description varchar(255)
);

CREATE TABLE products (
  id SERIAL PRIMARY KEY,
  name varchar(255),
  cost varchar(255),
  description text
);
