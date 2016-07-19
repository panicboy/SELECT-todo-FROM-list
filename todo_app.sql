\echo 1.
DROP ROLE IF EXISTS michael;

\echo 2.
CREATE ROLE michael ENCRYPTED PASSWORD 'stonebreaker';

\echo 3.
DROP DATABASE IF EXISTS todo_app;

\echo 4.
CREATE DATABASE todo_app;

\echo 5.
\c todo_app;

\echo 6.
CREATE TABLE tasks (
  id SERIAL NOT NULL,
  title VARCHAR(256) NOT NULL,
  description TEXT NULL,
  created_at TIMESTAMP NOT NULL DEFAULT now(),
  updated_at TIMESTAMP NULL,
  completed BOOLEAN NOT NULL DEFAULT false
);

\d+ tasks;

\echo 7.
ALTER TABLE tasks
  ADD PRIMARY KEY(id);


\echo 8(i)-(iii).
ALTER TABLE tasks
  DROP COLUMN IF EXISTS completed,
  ADD COLUMN completed_at TIMESTAMP NULL DEFAULT NULL,
  ALTER COLUMN updated_at SET NOT NULL,
  ALTER COLUMN updated_at SET DEFAULT now();

\d+ tasks;

\echo 8(iv)-(v)
INSERT INTO tasks VALUES
  (DEFAULT,'Study SQL', 'Complete this exercise',DEFAULT,DEFAULT,DEFAULT);

INSERT INTO tasks VALUES
  (DEFAULT,'Study PostgreSQL', 'Read all the documentation',DEFAULT,DEFAULT,DEFAULT);

SELECT * FROM tasks;

\echo 8(vi)
SELECT id, title
  FROM tasks
  WHERE completed_at IS NULL;

\echo 8(vii)
UPDATE tasks
  SET completed_at = now()
  WHERE title LIKE 'Study SQL';

SELECT * FROM tasks WHERE title LIKE 'Study SQL';

\echo 8(viii)
SELECT title, description
  FROM tasks
  WHERE completed_at IS NULL;

\echo 8(ix)
SELECT *
  FROM tasks
  ORDER BY created_at DESC;

\echo 8(x)-(xii)
INSERT INTO tasks VALUES
  (DEFAULT,'mistake 1', 'a test entry',DEFAULT,DEFAULT,DEFAULT),
  (DEFAULT,'mistake 2', 'another test entry',DEFAULT,DEFAULT,DEFAULT),
  (DEFAULT,'third mistake', 'another test entry',DEFAULT,DEFAULT,DEFAULT);

SELECT *
  FROM tasks
  ORDER BY created_at DESC;

\echo 8(xiii)
SELECT title
  FROM tasks
  WHERE title LIKE '%mistake%';

\echo 8(xiv)
DELETE FROM tasks
  WHERE title LIKE '%mistake 1';

\echo 8(xv)
SELECT title, description
  FROM tasks
  WHERE title LIKE '%mistake%';

\echo 8(xvi)
DELETE FROM tasks
  WHERE title LIKE '%mistake%';

\echo 8(xvii)
SELECT *
  FROM tasks
  ORDER BY title DESC;


\c andrew;