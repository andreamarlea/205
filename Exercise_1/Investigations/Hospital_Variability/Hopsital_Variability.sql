--Hospital Variability
select measure_ID, 
measure_name, 
avg(score) as average_score, 
max(score) as max_score, 
min(score) as min_score,
max(score) - min(score) as score_variation
from care_new
where score IS NOT NULL and measure_name IS NOT NULL
and score <> 'Not Available'
group by measure_ID, measure_name
order by score_variation desc
limit 10;

