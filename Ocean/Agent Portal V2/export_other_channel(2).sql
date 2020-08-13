with payment_map as
(
select '1' as code,'สาขา' as desc1
union all
select '2' as code,'สำนักงานใหญ่' as desc1
union all
select '3' as code,'banks' as desc1
union all
select '4' as code,'หักบัญชีธนาคาร' as desc1
union all
select '5' as code,'ไม่ระบุ' as desc1
union all
select '6' as code,'Counter Service' as desc1
union all
select '7' as code,'ชำระจากเงินสินไหมมรณกรรม' as desc1
union all
select '8' as code,'โอนเงินจากบัญชีรับฝาก' as desc1
union all
select '9' as code,'Auto urr/Auto Paidup' as desc1
union all
select 'A' as code,'ชำระต่างสาขา' as desc1
union all
select 'B' as code,'mpay' as desc1
union all
select 'C' as code,'ตัดบัตรเครดิต' as desc1
union all
select 'D' as code,'ชำระจากเงินทรงชีพ' as desc1
union all
select 'E' as code,'Biz Payment' as desc1
union all
select 'F' as code,'สำนักงานตัวแทน' as desc1
union all
select 'G' as code,'True Money' as desc1
union all
select 'H' as code,'Teaco Lotus' as desc1
union all
select 'I' as code,'Big C' as desc1
union all
select 'J' as code,'APL' as desc1
union all
select 'K' as code,'รูดบัตรเครดิต' as desc1
union all
select 'L' as code,'ไปรษณียไทย' as desc1
union all
select 'M' as code,'ชำระเบี้ยกรณีเวณคืนกรมธรรม' as desc1
union all
select 'N' as code,'บัตรเครดิต online' as desc1
)

select pay_to,premium_amount,payment_mode,mpl.policy_status,mpl.apl_flag ,ptm.description_agent_portal as code_desc,
       policy_no,product_name,rider_flag,title_desc,first_name,last_name,mobile1,customer_province_name,
       payment_channel,pm.desc1 as payment_channel_desc
       ,policy_year
       , commencement_date,maturity_date
from ms_policy_lists mpl left join payment_map pm on mpl.payment_channel  = pm.code
     left join ms_policy_type_mapping ptm on lower(mpl.policy_type ) = lower(ptm.policy_type) and lower(mpl.policy_status ) = lower(ptm.policy_status) and lower(mpl.apl_flag) = lower(mpl.apl_flag) 
where agent_code = '5510044'
limit 10000000