#Loading and Renaming Data

#Starting Hadoop & Postgres
/root/start-hadoop.sh
/data/start_postgrest.sh

#Switch user from room
su - w205

#Getting the data
wget -O exercise1.zip https://data.medicare.gov/views/bg9k-emty/files/Nqcy71p9Ss2RSBWDmP77H1DQXcyacr2khotGbDHHW_s?content_type=application%2Fzip%3B%20charset%3Dbinary&filename=Hospital_Revised_Flatfiles.zipunzip exercise.zip
unzip exercise1.zip

#Renaming files
mv "Hospital General Information.csv" "hospitals.csv"
mv "Timely and Effective Care - Hospital.csv" "effective_care.csv"
mv "Readmissions and Deaths - Hospital.csv" "readmissions.csv"
mv "Measure Dates.csv" "measures.csv"
mv "hvbp_hcahps_05_28_2015.csv" "surveys_responses.csv"

#Removing headers
tail -n +2 "hospital.csv" > "hospital.csv"
tail -n +2 "effective_care.csv" > "effective_care.csv"
tail -n +2 "readmissions.csv" > "readmissions.csv"
tail -n +2 "measures.csv" > "measures.csv"
tail -n +2 "surveys_responses.csv" > "surveys_responses.csv"

#make directory in HDFS
hdfs dfs -mkdir /user/w205/hospital_compare

#move data to HDFS
hdfs dfs -put hospitals.csv /user/w205/hospital_compare
hdfs dfs -put effective_care.csv /user/w205/hospital_compare
hdfs dfs -put readmissions.csv /user/w205/hospital_compare
hdfs dfs -put measures.csv /user/w205/hospital_compare
hdfs dfs -put surveys_responses.csv /user/w205/hospital_compare
