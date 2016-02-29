#Loading and Renaming Data

#Starting Hadoop & Postgres
/root/start-hadoop.sh
/data/start_postgrest.sh

#Switch user from root
su - w205
mkdir hospital_files
cd hospital_files

#Getting the data
wget -O exercise1.zip https://data.medicare.gov/views/bg9k-emty/files/Nqcy71p9Ss2RSBWDmP77H1DQXcyacr2khotGbDHHW_s?content_type=application%2Fzip%3B%20charset%3Dbinary&filename=Hospital_Revised_Flatfiles.zipunzip exercise.zip
unzip exercise1.zip

#Removing headers and Renaming Files
tail -n +2  Hospital\ General\ Information.csv > hospitals.csv
tail -n +2  Timely\ and\ Effective\ Care\ -\ Hospital.csv > effective_care.csv
tail -n +2  Readmissions\ and\ Deaths\ -\ Hospital.csv > readmissions.csv
tail -n +2  Measure\ Dates.csv > measures.csv
tail -n +2  hvbp_hcahps_05_28_2015.csv > surveys_responses.csv

#make directory in HDFS
hdfs dfs -mkdir /user/w205/hospital_compare
hdfs dfs -mkdir /user/w205/hospital_compare/hospitals
hdfs dfs -mkdir /user/w205/hospital_compare/care
hdfs dfs -mkdir /user/w205/hospital_compare/readmissions
hdfs dfs -mkdir /user/w205/hospital_compare/measures
hdfs dfs -mkdir /user/w205/hospital_compare/surveys

#move data to HDFS
hdfs dfs -put hospitals.csv /user/w205/hospital_compare/hospitals
hdfs dfs -put effective_care.csv /user/w205/hospital_compare/care
hdfs dfs -put readmissions.csv /user/w205/hospital_compare/readmissions
hdfs dfs -put measures.csv /user/w205/hospital_compare/measures
hdfs dfs -put surveys_responses.csv /user/w205/hospital_compare/surveys
