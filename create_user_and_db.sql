-- Create PostgreSQL user and lab1_db
-- Run with: sudo -u postgres psql -f create_user_and_db.sql

CREATE USER "muhammad-asif-khan" WITH PASSWORD 'asif.khan';
ALTER USER "muhammad-asif-khan" WITH SUPERUSER;
CREATE DATABASE lab1_db OWNER "muhammad-asif-khan";
\l
\q
