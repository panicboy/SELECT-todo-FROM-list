--1
DROP ROLE IF EXISTS michael;

CREATE ROLE michael PASSWORD 'stonebreaker';

DROP DATABASE IF EXISTS todo_app;


CREATE DATABASE todo_app;

\c todo_app;



CREATE TABLE tasks (
  id SERIAL NOT NULL,
  title CHAR(256) NOT NULL,
  description TEXT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT 'now',
  updated_at TIMESTAMP NULL,
  completed BOOLEAN NOT NULL DEFAULT false
);


\d+ tasks;






\c andrew;