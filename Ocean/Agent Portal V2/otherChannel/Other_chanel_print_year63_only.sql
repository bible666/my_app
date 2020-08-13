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
, noti_gorup as
(
select '10' as code,'ก่อนถึงวันรับชำระ' as desc1
union all
select '21' as code,'ถึงวันรับชำระ(ไม่เกิน 30 วัน)' as desc1
union all
select '22' as code,'ถึงวันรับชำระ(31-60 วัน)' as desc1
union all
select '30' as code,'เกินกำหนดวันรับชำระ' as desc1
)
, agent_check as
(
-- select '3808659' as agent_code, 'OceanPadTest3' as username
-- union all
-- select '3807537' as agent_code, 'OceanPadTest1' as username
-- union all
select '-------' as agent_code, 'OceanPadTest25' as username
union all
select '4700373' as agent_code, 'OceanPadTest8' as username

)

select pay_to,premium_amount,tot_rider_premium_amount ,
	       payment_mode ,apl_flag ,policy_status ,
	       policy_no,product_name,rider_flag,title_desc,first_name,last_name,mobile1,customer_province_name,
	       payment_channel,payment_term 
	       , commencement_date,maturity_date,ng.desc1 as noti_group ,endData.agent_code,ch.username
from (
select ipm.*,case when 
			current_date >= cast((ipm.pay_to + INTERVAL '-30 day') as date) and 
			current_date <= cast((ipm.pay_to + INTERVAL '-1 day') as date)
		then '10' 
		else 
			case when
				lower(ipm.policy_type ) in ( 'g', 'i','o') and 
				current_date >= cast((ipm.pay_to) as date) and 
				current_date <= cast((ipm.pay_to + INTERVAL '30 day') as date)
			then 
				'21'
			else 
				case when 
					lower(ipm.policy_type ) in ( 'g', 'i') and 
					current_date >= cast((ipm.pay_to + INTERVAL '31 day')  as date) and
					current_date <= cast((ipm.pay_to + INTERVAL '60 day')  as date)
				then 
					'22'
				else 
					case when 
						lower(ipm.policy_type ) = 'o' and 
						current_date >= cast((ipm.pay_to + INTERVAL '31 day')  as date) and
						current_date <= cast((ipm.pay_to + INTERVAL '120 day')  as date)
					then 
						'30'
					else 
						case when 
							lower(ipm.policy_type ) in ('g','i') and 
							current_date >= cast((ipm.pay_to + INTERVAL '61 day') as date) and
							current_date <= cast((ipm.pay_to + INTERVAL '150 day') as date)
						then 
							'30'
						else 
							'0'
						end
					end
				end 
			end 
		end as group_type
from (
	select pay_to,premium_amount,tot_rider_premium_amount ,
	       payment_mode,mpl.apl_flag ,ptm.description_agent_portal as policy_status ,
	       policy_no,mpl.policy_type,product_name,rider_flag,title_desc,first_name,last_name,mobile1,customer_province_name,
	       pm.desc1 as payment_channel,mpl.payment_term ,mpl.agent_code 
	       , commencement_date,maturity_date,
	       cast((mpl.pay_to + INTERVAL '-30 day')  as date) as start_date,
				case when lower(mpl.policy_type ) = 'p' 
				then 
					cast(pay_to as date)
				else 
					case when lower(mpl.policy_type ) = 'o' 
					then  cast((pay_to + INTERVAL '120 day')  as date)
					else 
						case when lower(mpl.policy_type ) in ('i','g') 
						then 
							cast((pay_to + INTERVAL '150 day')  as date)
						else
							null 
						end 
					end 
				end as end_date
	from ms_policy_lists mpl left join payment_map pm on mpl.payment_channel  = pm.code
	     left join ms_policy_type_mapping ptm on lower(mpl.policy_type ) = lower(ptm.policy_type) and lower(mpl.policy_status ) = lower(ptm.policy_status) and lower(mpl.apl_flag) = lower(ptm.apl_flag)
		 inner join agent_check ch2 on mpl.agent_code = ch2.agent_code
	where case when lower(mpl.policy_type ) = 'o' then lower(rc_status) in ('b','c') else true end 
			and (
				( lower(mpl.policy_type ) = 'o' and lower(mpl.policy_status) in ('i','l','o','p'))
				or
				( lower(mpl.policy_type ) in ('i','g') and lower(mpl.policy_status) in ('0','1','2','3','4','5','6','7'))
				or
				( lower(mpl.policy_type ) = 'p' and lower(mpl.policy_status) in ('i','l'))
			)
 ) ipm
 left join dm_hermes_other_channel_payment oth on ipm.policy_no = oth.policy_no
	   left join dm_hermes_req_bank_payment d on ipm.policy_no = d.policy_no and d.status_code = '6'
	   left join dm_hermes_req_credit_payment c on ipm.policy_no = c.policy_no and c.status_code = '6'
	   left join dm_biz_payment_customer biz on ipm.policy_no = biz.policy_no and biz.bizpayment_channel = 'Y'
	where EXTRACT( year FROM pay_to) = 2020
		  

) endData left join noti_gorup ng on endData.group_type = ng.code
inner join agent_check ch on endData.agent_code = ch.agent_code
order by endData.agent_code
limit 10000000