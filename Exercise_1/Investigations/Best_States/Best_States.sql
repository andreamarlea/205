--Best States
select State, avg(Score) as scores from care_new 
where State IS NOT NULL
group by State
order by scores desc
limit 10;
