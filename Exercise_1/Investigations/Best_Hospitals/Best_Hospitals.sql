select State, Hospital_Name, avg(Score) as scores from care_new 
where Score IS NOT NULL
group by Hospital_Name, State
order by scores desc
limit 10;
