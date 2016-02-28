--Responses
DROP TABLE responses_new;
CREATE TABLE responses_new AS
SELECT 
Provider_Number,
Hospital_Name,
Address,
City,
State,
Clean_Quiet_AP,
Clean_Quiet_IP,
Clean_Quiet_DS,
Overall_AP,
Overall_IP,
Overall_DS, 
HCAHPS_Base_Score,	
HCAHPS_Consistency_Score
From survey_responses;
