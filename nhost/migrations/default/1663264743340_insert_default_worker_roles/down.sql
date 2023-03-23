-- Could not auto-generate a down migration.
-- Please write an appropriate down migration for the SQL below:
-- INSERT INTO worker_roles(name, description)
-- VALUES
-- ('Carer',''),
-- ('Nurse', ''),
-- ('Domestic Staff', '');
DELETE FROM worker_roles;