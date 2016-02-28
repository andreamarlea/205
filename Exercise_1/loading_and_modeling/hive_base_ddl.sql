--hospitals table
DROP TABLE hospitals;
CREATE EXTERNAL TABLE hospitals 
(Provider_ID string,
Hospital_Name string,	
Address	string,
City string,
State string,
ZIP_Code string,
County_Name	string,
Phone_Number string, 
Hospital_Type string,
Hospital_Ownership string,
Emergency_Services string)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
 "separatorChar" = ",",
 "quoteChar" = '"',
 "escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/hospitals';




--effective care table
DROP TABLE effective_care;
CREATE EXTERNAL TABLE effective_care 
(
Provider_ID	string,
Hospital_Name string,
Address	string,
City string,
State string,
ZIP_Code string, 
County_Name string,
Phone_Number string,
Condition string,
Measure_ID string,
Measure_Name string,
Score string,
Sample	string,
Footnote string,
Measure_Start_Date string,
Measure_End_Date string
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
 "separatorChar" = ",",
 "quoteChar" = '"',
 "escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/care';



--readmissions table
DROP TABLE readmissions;
CREATE EXTERNAL TABLE readmissions 
(
Provider_ID	string,
Hospital_Name string,
Address	string,
City string,
State string,
ZIP_Code string,
County_Name string,
Phone_Number string,
Measure_Name string,
Measure_ID string,
Compared_to_National string,
Denominator string,
Score string,
Lower_Estimate string,
Higher_Estimate string,
Footnote string,
Measure_Start_Date string,
Measure_End_Date string
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
 "separatorChar" = ",",
 "quoteChar" = '"',
 "escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/readmissions';


--measures table
DROP TABLE measures;
CREATE EXTERNAL TABLE measures 
(
Measure_Name string,
Measure_ID	string,
Measure_Start_Quarter string,
Measure_Start_Date string,
Measure_End_Quarter string,
Measure_End_Date string
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
 "separatorChar" = ",",
 "quoteChar" = '"',
 "escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/measures';


--survey responses table;
DROP TABLE survey_responses;
CREATE EXTERNAL TABLE survey_responses 
(
Provider_Number string,
Hospital_Name string,
Address string,
City string,
State string,
ZIP_Code string,
County_Name string,	
Comm_Nurse_AP string,
Comm_Nurse_IP string,
Comm_Nurse_DS string,
Comm_Doctor_AP string, 
Comm_Doctor_IP string,
Comm_Doctor_DS string,
Resp_Staff_AP string,
Resp_Staff_IP string,
Resp_Staff_DS string,
Pain_Man_AP string,
Pain_Man_IP string,
Pain_Man_DS string,
Comm_Medicine_AP string,
Comm_Medicine_IP string, 
Comm_Medicine_DS string,
Clean_Quiet_AP string,
Clean_Quiet_IP string,
Clean_Quiet_DS string,
Discharge_AP string,
Discharge_IP string,
Discharge_DS string,
Overall_AP string,
Overall_IP string,
Overall_DS string, 
HCAHPS_Base_Score string,	
HCAHPS_Consistency_Score string
)
ROW FORMAT SERDE 'org.apache.hadoop.hive.serde2.OpenCSVSerde'
WITH SERDEPROPERTIES (
 "separatorChar" = ",",
 "quoteChar" = '"',
 "escapeChar" = '\\'
)
STORED AS TEXTFILE
LOCATION '/user/w205/hospital_compare/surveys';
