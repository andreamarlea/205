--Care Effectiveness
DROP TABLE care_new;
CREATE TABLE care_new AS
SELECT 
Provider_ID,
Hospital_Name,
State,
Measure_ID,
Measure_Name,
Condition,
score
FROM effective_care;
