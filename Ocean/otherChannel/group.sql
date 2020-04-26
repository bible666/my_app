select policy_type,group_type ,count(group_type ) as group_count
from 
(
	select ipm.* , 
		case when 
			to_date(:current_date::text,'YYYYMMDD') >= (ipm.next_paid_date2 + INTERVAL '-30 day')::date and 
			to_date(:current_date::text,'YYYYMMDD') <= (ipm.next_paid_date2 + INTERVAL '-1 day')::date
		then 10 
		else 
			case when
				lower(ipm.policy_type ) in ( 'g', 'i','o') and 
				to_date(:current_date::text,'YYYYMMDD') >= (ipm.next_paid_date2)::date and 
				to_date(:current_date::text,'YYYYMMDD') <= (ipm.next_paid_date2 + INTERVAL '30 day')::date
			then 
				21
			else 
				case when 
					lower(ipm.policy_type ) in ( 'g', 'i') and 
					to_date(:current_date::text,'YYYYMMDD') >= (ipm.next_paid_date2 + INTERVAL '31 day')::date and
					to_date(:current_date::text,'YYYYMMDD') <= (ipm.next_paid_date2 + INTERVAL '60 day')::date
				then 
					22
				else 
					case when 
						lower(ipm.policy_type ) = 'o' and 
						to_date(:current_date::text,'YYYYMMDD') >= (ipm.next_paid_date2 + INTERVAL '31 day')::date and
						to_date(:current_date::text,'YYYYMMDD') <= (ipm.next_paid_date2 + INTERVAL '120 day')::date
					then 
						30
					else 
						case when 
							lower(ipm.policy_type ) in ('g','i') and 
							to_date(:current_date::text,'YYYYMMDD') >= (ipm.next_paid_date2 + INTERVAL '61 day')::date and
							to_date(:current_date::text,'YYYYMMDD') <= (ipm.next_paid_date2 + INTERVAL '150 day')::date
						then 
							30
						else 
							0
						end
					end
				end 
			end 
		end as group_type,
		to_date(:current_date::text,'YYYYMMDD') as current_date,
		(ipm.next_paid_date2 + INTERVAL '-30 day')::date as start_over,
		(ipm.next_paid_date2 + INTERVAL '-1 day')::date as end_over,
		(ipm.next_paid_date2)::date as start_datein_due,
		(ipm.next_paid_date2 + INTERVAL '60 day')::date as end_datein_due,
		(ipm.next_paid_date2 + INTERVAL '61 day')::date as start_date_pass_due,
		(ipm.next_paid_date2 + INTERVAL '150 day')::date as end_date_pass_due,
		case when oth.is_premium_card is null then 
				case when d.policy_no is null then
					case when c.policy_no is null then 
						case when biz.policy_no is null then
							'B'
						else
							'N'
						end
					else 
						'C'
					end
				else 
					'D'
				end
			else
					'O'
		end as other_channel
	from (
		select *,
			case when lower(policy_type) in ('p') then pay_to else next_paid_date end as next_paid_date2,
			case when lower(policy_type ) = 'p' 
			then 
				(pay_to + INTERVAL '-30 day')::date
			else 
				(next_paid_date + INTERVAL '-30 day')::date
			end as start_date,
			case when lower(policy_type ) = 'p' 
			then 
				pay_to::date
			else 
				case when lower(policy_type ) = 'o' 
				then  (next_paid_date + INTERVAL '120 day')::date
				else 
					case when lower(policy_type ) in ('i','g') 
					then 
						(next_paid_date + INTERVAL '150 day')::date
					else
						null 
					end 
				end 
			end as end_date
		from ili_policy_master
		where agent_code = :agent_code::text
	) ipm 
	   left join hermes_other_channel_payment oth on ipm.policy_no = oth.policy_no
	   left join hermes_req_bank_payment d on ipm.policy_no = d.policy_no and d.status_code = '6'
	   left join hermes_req_credit_payment c on ipm.policy_no = c.policy_no and c.status_code = '6'
	   left join biz_payment_customer biz on ipm.policy_no = biz.policy_no and biz.bizpayment_channel = 'Y'
	where to_date(:current_date::text,'YYYYMMDD') >= ipm.start_date::date and
	 	  to_date(:current_date::text,'YYYYMMDD') <= ipm.end_date::date 

) AA
group by policy_type,group_type