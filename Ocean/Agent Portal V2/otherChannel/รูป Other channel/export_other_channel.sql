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
), policy_type_map as
(
select 'o' as policy_type,'i' as code , 'มีผลบังคับ' as code_desc
union all
select 'o' as policy_type,'f' as code , 'ชำระครบ' as code_desc
union all
select 'o' as policy_type,'o' as code , 'ค้างชำระ' as code_desc
union all
select 'o' as policy_type,'w' as code , 'ยกเว้นชำระ' as code_desc
union all
select 'o' as policy_type,'e' as code , 'ขยายเวลา' as code_desc
union all
select 'o' as policy_type,'r' as code , 'ปิดบัญชี' as code_desc
union all
select 'o' as policy_type,'p' as code , 'ปิดบัญชีอัตโนมัติ' as code_desc
union all
select 'o' as policy_type,'c' as code , 'ยกเลิก' as code_desc
union all
select 'o' as policy_type,'d' as code , 'มรณกรรม' as code_desc
union all
select 'o' as policy_type,'s' as code , 'เวนคืน' as code_desc
union all
select 'o' as policy_type,'l' as code , 'ขาดผล' as code_desc
union all
select 'o' as policy_type,'a' as code , 'เวนคืนอัตโนมัติ' as code_desc
union all
select 'o' as policy_type,'t' as code , 'ขาดผลครบ 5 ป' as code_desc
union all
select 'o' as policy_type,'m' as code , 'ครบสัญญา' as code_desc

union all
select 'i' as policy_type,'0' as code , 'มีผลบังคับ' as code_desc
union all
select 'i' as policy_type,'1' as code , 'มีผลบังคับ (ขาดชำระ 1 เดือน)' as code_desc
union all
select 'i' as policy_type,'2' as code , 'มีผลบังคับ (ขาดชำระ 2 เดือน)' as code_desc
union all
select 'i' as policy_type,'3' as code , 'ค้างชำระ (Outstanding 3 เดือน)' as code_desc
union all
select 'i' as policy_type,'4' as code , 'ค้างชำระ (Outstanding 4 เดือน)' as code_desc
union all
select 'i' as policy_type,'5' as code , 'ค้างชำระ (Outstanding 5 เดือน)' as code_desc
union all
select 'i' as policy_type,'6' as code , 'ค้างชำระ (Outstanding 5 เดือน)' as code_desc
union all
select 'i' as policy_type,'7' as code , 'ขาดผล' as code_desc
union all
select 'i' as policy_type,'8' as code , 'ชำระครบ' as code_desc
union all
select 'i' as policy_type,'0' as code , 'มีผลบังคับ' as code_desc
union all
select 'g' as policy_type,'1' as code , 'มีผลบังคับ (ขาดชำระ 1 เดือน)' as code_desc
union all
select 'g' as policy_type,'2' as code , 'มีผลบังคับ (ขาดชำระ 2 เดือน)' as code_desc
union all
select 'g' as policy_type,'3' as code , 'ค้างชำระ (Outstanding 3 เดือน)' as code_desc
union all
select 'g' as policy_type,'4' as code , 'ค้างชำระ (Outstanding 4 เดือน)' as code_desc
union all
select 'g' as policy_type,'5' as code , 'ค้างชำระ (Outstanding 5 เดือน)' as code_desc
union all
select 'g' as policy_type,'6' as code , 'ค้างชำระ (Outstanding 5 เดือน)' as code_desc
union all
select 'g' as policy_type,'7' as code , 'ขาดผล' as code_desc
union all
select 'g' as policy_type,'8' as code , 'ชำระครบ' as code_desc
union all
select 'p' as policy_type,'i' as code , 'มีผลบังคับ' as code_desc
union all
select 'p' as policy_type,'l' as code , 'ขาดผล' as code_desc
union all
select 'p' as policy_type,'m' as code , 'สิ้นสุดสัญญา' as code_desc
union all
select 'p' as policy_type,'b' as code , 'บอกล้าง' as code_desc
union all
select 'p' as policy_type,'c' as code , 'ยกเลิกสัญญา (โดยบริษัท)' as code_desc
union all
select 'p' as policy_type,'d' as code , 'เสียชีวิต' as code_desc
union all
select 'p' as policy_type,'f' as code , 'ปฏิเสธการจ่ายสินไหม' as code_desc
union all
select 'p' as policy_type,'z' as code , 'ยกเลิก (ลูกค้า)' as code_desc
)

select pay_to,premium_amount,payment_mode,policy_status,ptm.code_desc,
       policy_no,product_name,rider_flag,title_desc,first_name,last_name,mobile1,customer_province_name,
       payment_channel,pm.desc1 as payment_channel_desc
       ,policy_year
       , commencement_date,maturity_date
from ms_policy_lists mpl left join payment_map pm on mpl.payment_channel  = pm.code
     left join policy_type_map ptm on lower(mpl.policy_type ) = ptm.policy_type and lower(mpl.policy_status ) = ptm.code 
where agent_code = '5510044'
limit 10000000