--1
DROP ROLE IF EXISTS michael;

CREATE ROLE michael PASSWORD 'stonebreaker';

DROP DATABASE IF EXISTS todo_app;


CREATE DATABASE todo_app;

\c todo_app;


CREATE TABLE tasks (
  id SERIAL NOT NULL,
  title VARCHAR(256) NOT NULL,
  description TEXT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT now(),
  updated_at TIMESTAMP NULL,
  completed BOOLEAN NOT NULL DEFAULT false
);

\d+ tasks;

ALTER TABLE tasks
  DROP COLUMN IF EXISTS completed,
  ADD COLUMN completed_at TIMESTAMP NULL DEFAULT NULL,
  ALTER COLUMN updated_at SET NOT NULL,
  ALTER COLUMN updated_at SET DEFAULT now();

\d+ tasks;

INSERT INTO tasks VALUES
  (DEFAULT,'Study SQL', 'Complete this exercise',DEFAULT,DEFAULT,DEFAULT);

  INSERT INTO tasks VALUES
  (DEFAULT,'Study PostgreSQL', 'Read all the documentation',DEFAULT,DEFAULT,DEFAULT);

  SELECT * FROM tasks;






\c andrew;