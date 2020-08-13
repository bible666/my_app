--สำหรับ การแสดง ลำดับ FYP แบบ ตามงวด
SELECT a.agent_code_7,a.agent_name,"period"
   ,sum(a.premium) as FYP
 FROM dm_newcase_report a
 left outer join dm_ili_rider_master r on ( r.policy_no = a.policy_no ) --r.rider_code != '6' and
inner join ms_position_report_mapping p on p.position_report = a.position 
WHERE policy_status = 'มีผล'
AND "period" in ('2562/01') -- หาตามงวด
and a.policy_type = 'สามัญ' -- หาตามประเภทกรมธรรม
and  effective_date_from >= '2019-11-21' and effective_date_from <= '2020-03-20' -- ตามวันที่
--AND a.branch_code in ('') -- หาตามรหัสสาขา
-- AND p.position_code in ('') -- หาตามรหัสตำแหน่ง
-- AND a.agent_code_7 in ('') -- หาตามรหัสตัวแทน
--AND premium >= 3000 -- หาด้วยเงือนไขขั้นต่ำ
-- ตามกรมธรรมมี 2 ทางเลือก
-- AND a.plan_code in ('','') -- สำหรับหาตามเลขประกันที่เราขาย เช่น "PA017"	"ไทยสมุทรใจกว้างเต็มแมกซ์ 1" มี plan_code = PA017
-- AND a.plan_name in ('','') -- สำหรับหาตามชื่อประกันที่เราขาย เช่น "PA017"	"ไทยสมุทรใจกว้างเต็มแมกซ์ 1" มี plan_name = ไทยสมุทรใจกว้างเต็มแมกซ์ 1
group by agent_code_7,a.agent_name,"period"
having count(a.id) > 0 -- จำนวนเคสขั้นต่ำ 10
order by sum(a.premium) desc


--สำหรับ การแสดง ลำดับ FYP แบบ สะสม
SELECT a.agent_code_7,a.agent_name
   ,sum(a.premium) as FYP
 FROM dm_newcase_report a
 left outer join dm_ili_rider_master r on ( r.policy_no = a.policy_no )
inner join ms_position_report_mapping p on p.position_report = a.position 
WHERE policy_status = 'มีผล'
and a.policy_type = 'สามัญ' -- หาตามประเภทกรมธรรม
and  effective_date_from >= '2019-11-21' and effective_date_from <= '2020-03-20' -- ตามวันที่
AND "period" >= '2562/01' AND "period" <= '2562/02' -- หาตามงวด
--AND a.branch_code in ('') -- หาตามรหัสสาขา
-- AND p.position_code in ('') -- หาตามรหัสตำแหน่ง
-- AND a.agent_code_7 in ('') -- หาตามรหัสตัวแทน
--AND premium >= 3000 -- หาด้วยเงือนไขขั้นต่ำ
-- ตามกรมธรรมมี 2 ทางเลือก
-- AND a.plan_code in ('','') -- สำหรับหาตามเลขประกันที่เราขาย เช่น "PA017"	"ไทยสมุทรใจกว้างเต็มแมกซ์ 1" มี plan_code = PA017
-- AND a.plan_name in ('คุ้ม20/20','') -- สำหรับหาตามชื่อประกันที่เราขาย เช่น "PA017"	"ไทยสมุทรใจกว้างเต็มแมกซ์ 1" มี plan_name = ไทยสมุทรใจกว้างเต็มแมกซ์ 1
group by agent_code_7,a.agent_name 
having count(a.id) > 0 -- จำนวนเคสขั้นต่ำ 10
order by sum(a.premium) desc

สำหรับการแสดงลำดับ ตาม FYC
SELECT a.agent_code_7,a.agent_name
   ,sum(a.commission_first) as FYC ,count(a.id)
 FROM dm_newcase_report a
 left outer join dm_ili_rider_master r on (r.policy_no = a.policy_no )
inner join ms_position_report_mapping p on p.position_report = a.position 
WHERE policy_status = 'มีผล'
AND "period" in ('2562/01') -- หาตามงวด
and a.policy_type = 'สามัญ' -- หาตามประเภทกรมธรรม
and  effective_date_from >= '2019-11-21' and effective_date_from <= '2020-03-20' -- ตามวันที่
--AND a.branch_code in ('') -- หาตามรหัสสาขา
-- AND p.position_code in ('') -- หาตามรหัสตำแหน่ง
-- AND a.agent_code_7 in ('') -- หาตามรหัสตัวแทน
--AND commission_first >= 3000 -- หาด้วยเงือนไขขั้นต่ำ
-- ตามกรมธรรมมี 2 ทางเลือก
-- AND a.plan_code in ('','') -- สำหรับหาตามเลขประกันที่เราขาย เช่น "PA017"	"ไทยสมุทรใจกว้างเต็มแมกซ์ 1" มี plan_code = PA017
-- AND a.plan_name in ('','') -- สำหรับหาตามชื่อประกันที่เราขาย เช่น "PA017"	"ไทยสมุทรใจกว้างเต็มแมกซ์ 1" มี plan_name = ไทยสมุทรใจกว้างเต็มแมกซ์ 1
group by agent_code_7,a.agent_name 
having count(a.id) > 0 -- จำนวนเคสขั้นต่ำ 10
order by sum(a.commission_first) desc

สำหรับการแสดงลำดับ ตาม จำนวน  case
SELECT a.agent_code_7,a.agent_name
   ,count(a.id)
 FROM dm_newcase_report a
 left outer join dm_ili_rider_master r on (r.policy_no = a.policy_no)
inner join ms_position_report_mapping p on p.position_report = a.position
WHERE policy_status = 'มีผล'
AND "period" in ('2562/01') -- หาตามงวด
and a.policy_type = 'สามัญ' -- หาตามประเภทกรมธรรม
and  effective_date_from >= '2019-11-21' and effective_date_from <= '2020-03-20' -- ตามวันที่
--AND a.branch_code in ('') -- หาตามรหัสสาขา
-- AND p.position_code in ('') -- หาตามรหัสตำแหน่ง
-- AND a.agent_code_7 in ('') -- หาตามรหัสตัวแทน
--AND premium >= 3000 -- หาด้วยเงือนไขขั้นต่ำ
-- ตามกรมธรรมมี 2 ทางเลือก
-- AND a.plan_code in ('','') -- สำหรับหาตามเลขประกันที่เราขาย เช่น "PA017"	"ไทยสมุทรใจกว้างเต็มแมกซ์ 1" มี plan_code = PA017
-- AND a.plan_name in ('','') -- สำหรับหาตามชื่อประกันที่เราขาย เช่น "PA017"	"ไทยสมุทรใจกว้างเต็มแมกซ์ 1" มี plan_name = ไทยสมุทรใจกว้างเต็มแมกซ์ 1
group by agent_code_7,a.agent_name 
having count(a.id) > 0 -- จำนวนเคสขั้นต่ำ 10
order by count(a.id) desc

สำหรับการแสดงลำดับ ตาม ทุนประกัน
SELECT a.agent_code_7,a.agent_name
   ,sum(a.sum_assured) as sum_assured
 FROM dm_newcase_report a 
 left outer join dm_ili_rider_master r on (r.policy_no = a.policy_no )
inner join ms_position_report_mapping p on p.position_report = a.position 
WHERE policy_status = 'มีผล'
AND "period" in ('2562/01') -- หาตามงวด
and a.policy_type = 'สามัญ' -- หาตามประเภทกรมธรรม
and  effective_date_from >= '2019-11-21' and effective_date_from <= '2020-03-20' -- ตามวันที่

--AND a.branch_code in ('') -- หาตามรหัสสาขา
-- AND p.position_code in ('') -- หาตามรหัสตำแหน่ง
-- AND a.agent_code_7 in ('') -- หาตามรหัสตัวแทน
--AND sum_assured >= 3000 -- หาด้วยเงือนไขขั้นต่ำ
-- ตามกรมธรรมมี 2 ทางเลือก
-- AND a.plan_code in ('','') -- สำหรับหาตามเลขประกันที่เราขาย เช่น "PA017"	"ไทยสมุทรใจกว้างเต็มแมกซ์ 1" มี plan_code = PA017
-- AND a.plan_name in ('','') -- สำหรับหาตามชื่อประกันที่เราขาย เช่น "PA017"	"ไทยสมุทรใจกว้างเต็มแมกซ์ 1" มี plan_name = ไทยสมุทรใจกว้างเต็มแมกซ์ 1
group by agent_code_7,a.agent_name 
having count(a.id) > 0 -- จำนวนเคสขั้นต่ำ 10
order by sum(a.sum_assured) desc

การแสดงผลแบบรายการ สำหรับทุนประกัน
SELECT a.agent_code_7,a.agent_name
   ,SUM(CASE WHEN a.sum_assured >=  50000 AND a.sum_assured <= 100000 THEN 1 ELSE 0 END) as case_1
   ,SUM(CASE WHEN a.sum_assured >= 100001 AND a.sum_assured <= 200000 THEN 1 ELSE 0 END) as case_2
   ,SUM(CASE WHEN a.sum_assured >= 200001 AND a.sum_assured <= 300000 THEN 1 ELSE 0 END) as case_3
 FROM dm_newcase_report a 
 left outer join dm_ili_rider_master r on ( r.policy_no = a.policy_no )
inner join ms_position_report_mapping p on p.position_report = a.position 
WHERE policy_status = 'มีผล'
	AND "period" in ('2562/01') -- หาตามงวด
    and a.policy_type = 'สามัญ' -- หาตามประเภทกรมธรรม
and  effective_date_from >= '2019-11-21' and effective_date_from <= '2020-03-20' -- ตามวันที่

	AND a.agent_code_7 in ('3805021') -- หาตามรหัสตัวแทน
--AND a.branch_code in ('') -- หาตามรหัสสาขา
-- AND p.position_code in ('') -- หาตามรหัสตำแหน่ง
--AND premium >= 3000 -- หาด้วยเงือนไขขั้นต่ำ
-- ตามกรมธรรมมี 2 ทางเลือก
-- AND a.plan_code in ('','') -- สำหรับหาตามเลขประกันที่เราขาย เช่น "PA017"	"ไทยสมุทรใจกว้างเต็มแมกซ์ 1" มี plan_code = PA017
-- AND a.plan_name in ('','') -- สำหรับหาตามชื่อประกันที่เราขาย เช่น "PA017"	"ไทยสมุทรใจกว้างเต็มแมกซ์ 1" มี plan_name = ไทยสมุทรใจกว้างเต็มแมกซ์ 1
group by agent_code_7,a.agent_name 
having count(a.id) > 0 -- จำนวนเคสขั้นต่ำ 10

การแสดงผลแบบ รายการสำหรับ FYP
SELECT a.agent_code_7,a.agent_name
   ,SUM(CASE WHEN a.premium >=  50000 AND a.premium <= 100000 THEN 1 ELSE 0 END) as case_1
   ,SUM(CASE WHEN a.premium >= 100001 AND a.premium <= 200000 THEN 1 ELSE 0 END) as case_2
   ,SUM(CASE WHEN a.premium >= 200001 AND a.premium <= 300000 THEN 1 ELSE 0 END) as case_3
 FROM dm_newcase_report a 
 left outer join dm_ili_rider_master r on (r.rider_code != '6' and r.policy_no = a.policy_no and a.policy_type = 'สามัญ')
inner join ms_position_report_mapping p on p.position_report = a.position 
WHERE policy_status = 'มีผล'
	AND "period" in ('2562/01') -- หาตามงวด
	AND a.agent_code_7 in ('3805021') -- หาตามรหัสตัวแทน
--AND a.branch_code in ('') -- หาตามรหัสสาขา
-- AND p.position_code in ('') -- หาตามรหัสตำแหน่ง
--AND premium >= 3000 -- หาด้วยเงือนไขขั้นต่ำ
-- ตามกรมธรรมมี 2 ทางเลือก
-- AND a.plan_code in ('','') -- สำหรับหาตามเลขประกันที่เราขาย เช่น "PA017"	"ไทยสมุทรใจกว้างเต็มแมกซ์ 1" มี plan_code = PA017
-- AND a.plan_name in ('','') -- สำหรับหาตามชื่อประกันที่เราขาย เช่น "PA017"	"ไทยสมุทรใจกว้างเต็มแมกซ์ 1" มี plan_name = ไทยสมุทรใจกว้างเต็มแมกซ์ 1
group by agent_code_7,a.agent_name 
having count(a.id) > 0 -- จำนวนเคสขั้นต่ำ 10

การแสดงผลแบบรายการสำหรับ FYC
SELECT a.agent_code_7,a.agent_name
   ,SUM(CASE WHEN a.commission_first >=  50000 AND a.commission_first <= 100000 THEN 1 ELSE 0 END) as case_1
   ,SUM(CASE WHEN a.commission_first >= 100001 AND a.commission_first <= 200000 THEN 1 ELSE 0 END) as case_2
   ,SUM(CASE WHEN a.commission_first >= 200001 AND a.commission_first <= 300000 THEN 1 ELSE 0 END) as case_3
 FROM dm_newcase_report a 
 left outer join dm_ili_rider_master r on (r.rider_code != '6' and r.policy_no = a.policy_no and a.policy_type = 'สามัญ')
inner join ms_position_report_mapping p on p.position_report = a.position 
WHERE policy_status = 'มีผล'
	AND "period" in ('2562/01') -- หาตามงวด
	AND a.agent_code_7 in ('3805021') -- หาตามรหัสตัวแทน
--AND a.branch_code in ('') -- หาตามรหัสสาขา
-- AND p.position_code in ('') -- หาตามรหัสตำแหน่ง
--AND commission_first >= 3000 -- หาด้วยเงือนไขขั้นต่ำ
-- ตามกรมธรรมมี 2 ทางเลือก
-- AND a.plan_code in ('','') -- สำหรับหาตามเลขประกันที่เราขาย เช่น "PA017"	"ไทยสมุทรใจกว้างเต็มแมกซ์ 1" มี plan_code = PA017
-- AND a.plan_name in ('','') -- สำหรับหาตามชื่อประกันที่เราขาย เช่น "PA017"	"ไทยสมุทรใจกว้างเต็มแมกซ์ 1" มี plan_name = ไทยสมุทรใจกว้างเต็มแมกซ์ 1
group by agent_code_7,a.agent_name 
having count(a.id) > 0 -- จำนวนเคสขั้นต่ำ 10