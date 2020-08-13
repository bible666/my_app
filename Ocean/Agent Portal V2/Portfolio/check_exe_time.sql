--Query 1
EXPLAIN ANALYSE 
select * 
from agpt_newcase_report anr 
where "period" = '2562/01'  and agent_code_7  = '3314429';

-- Query 2
EXPLAIN ANALYSE 
select agent_code_7 
from agpt_newcase_report anr 
where "period" = '2561/01' and agent_code_7  = '3314429';


-- Query 3
EXPLAIN ANALYSE 
select count(agent_code_7) as agent_count
from 
(
    select agent_code_7 ,recruiter_code_7 ,min("period") as min_period
    from agpt_agent_income dai
    where recruiter_code_7  <> '' 
    group by agent_code_7 ,recruiter_code_7 
) my_data
where recruiter_code_7 = '4801934' and min_period = '2562/01'


-- Query 4
EXPLAIN ANALYSE 
select count(agent_code_7) as agent_count
from 
(
    select agent_code_7 ,recruiter_code_7 ,min("period") as min_period
    from agpt_agent_income dai
    where recruiter_code_7  <> '' 
    group by agent_code_7 ,recruiter_code_7 
) my_data
where recruiter_code_7 = '4801934' and min_period = '2561/01'


