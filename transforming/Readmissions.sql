--Readmissions
DROP TABLE readmissions_new;
CREATE TABLE readmissions_new AS
SELECT 
Provider_ID,
Hospital_Name,
Address,
State,
Measure_Name,
Measure_ID,
Score
from readmissions;
