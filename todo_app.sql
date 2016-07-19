--1
-- DROP ROLE IF EXISTS michael;

createuser -E michael;
CREATE ROLE michael PASSWORD 'stonebreaker';

DROP DATABASE IF EXISTS todo_app;


CREATE DATABASE todo_app;

\c todo_app;



-- CREATE TABLE tasks (
--   id
--   completed_at timestamp,

-- )









\c andrew;