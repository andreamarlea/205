--Hospitals
DROP TABLE hospitals_new;
CREATE TABLE hospitals_new AS
SELECT
Provider_ID,
Hospital_Name,
State
FROM hospitals; 
