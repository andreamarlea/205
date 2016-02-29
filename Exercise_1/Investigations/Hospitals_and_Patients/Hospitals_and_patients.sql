--hospitals_and_patients

--create temp table for variation
drop table variation;
create table variation as 
select provider_ID,
avg(score) as avg_score, 
max(score) - min(score) as score_variation
from care_new
where score IS NOT NULL and measure_name IS NOT NULL
and score <> 'Not Available'
group by provider_ID
order by score_variation desc; 

--create temp table for base score
drop table response;
create table response as
select provider_number, 
HCAHPS_Base_Score as response_score
from responses_new
where HCAHPS_Base_Score IS NOT NULL
and HCAHPS_Base_Score <> 'Not Available';

--join by provider
drop table all_scores;
create table all_scores as
select a.provider_ID, 
a.avg_score, 
a.score_variation, 
b.response_score * 1.00 as response_score 
from 
variation a
inner join response b
on a.provider_ID = b.provider_number;

--get correlations
select corr(avg_score, response_score) from all_scores;

select corr(score_variation, response_score) from all_scores;
