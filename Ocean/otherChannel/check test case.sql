select new_table.*, m.description_agent_portal 
from (
	select ipm.* ,
		case when 
			current_date >= cast((ipm.next_paid_date2 + INTERVAL '-30 day') as date) and 
			current_date <= cast((ipm.next_paid_date2 + INTERVAL '-1 day') as date)
		then 10 
		else 
			case when
				lower(ipm.policy_type ) in ( 'g', 'i','o') and 
				current_date >= cast((ipm.next_paid_date2) as date) and 
				current_date <= cast((ipm.next_paid_date2 + INTERVAL '30 day') as date)
			then 
				21
			else 
				case when 
					lower(ipm.policy_type ) in ( 'g', 'i') and 
					current_date >= cast((ipm.next_paid_date2 + INTERVAL '31 day')  as date) and
					current_date <= cast((ipm.next_paid_date2 + INTERVAL '60 day')  as date)
				then 
					22
				else 
					case when 
						lower(ipm.policy_type ) = 'o' and 
						current_date >= cast((ipm.next_paid_date2 + INTERVAL '31 day')  as date) and
						current_date <= cast((ipm.next_paid_date2 + INTERVAL '120 day')  as date)
					then 
						30
					else 
						case when 
							lower(ipm.policy_type ) in ('g','i') and 
							current_date >= cast((ipm.next_paid_date2 + INTERVAL '61 day') as date) and
							current_date <= cast((ipm.next_paid_date2 + INTERVAL '150 day') as date)
						then 
							30
						else 
							0
						end
					end
				end 
			end 
		end as group_type,
		current_date as current_date,
		cast((ipm.next_paid_date2 + INTERVAL '-30 day') as date) as start_over,
		cast((ipm.next_paid_date2 + INTERVAL '-1 day')  as date) as end_over,
		cast((ipm.next_paid_date2) as date) as start_datein_due,
		cast((ipm.next_paid_date2 + INTERVAL '60 day')  as date) as end_datein_due,
		cast((ipm.next_paid_date2 + INTERVAL '61 day') as date) as start_date_pass_due,
		cast((ipm.next_paid_date2 + INTERVAL '150 day') as date) as end_date_pass_due,
		case when oth.policy_no is null then 
				case when d.policy_no is null then
					case when c.policy_no is null then 
						case when biz.policy_no is null then
							'N'
						else
							'B'
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
			pay_to as next_paid_date2,
			cast((pay_to + INTERVAL '-30 day')  as date) as start_date,
			case when lower(policy_type ) = 'p' 
			then 
				cast(pay_to as date)
			else 
				case when lower(policy_type ) = 'o' 
				then  cast((pay_to + INTERVAL '120 day')  as date)
				else 
					case when lower(policy_type ) in ('i','g') 
					then 
						cast((pay_to + INTERVAL '150 day')  as date)
					else
						null 
					end 
				end 
			end as end_date
		from ms_policy_lists pl 
		where agent_code = cast(:agent_code as text) 
			and case when lower(policy_type ) = 'o' then lower(rc_status) in ('b','c') else true end 
			--and (
			--	( lower(policy_type ) = 'o' and lower(policy_status) in ('i','l','o','p'))
			--	or
			--	( lower(policy_type ) in ('i','g') and lower(policy_status) in ('0','1','2','3','4','5','6','7'))
			--	or
			--	( lower(policy_type ) = 'p' and lower(policy_status) in ('i','l'))
			--)
	) ipm 
	   left join dm_hermes_other_channel_payment oth on ipm.policy_no = oth.policy_no
	   left join dm_hermes_req_bank_payment d on ipm.policy_no = d.policy_no and d.status_code = '6'
	   left join dm_hermes_req_credit_payment c on ipm.policy_no = c.policy_no and c.status_code = '6'
	   left join dm_biz_payment_customer biz on ipm.policy_no = biz.policy_no and biz.bizpayment_channel = 'Y'
	where current_date >= cast(ipm.start_date as date) and
	 	  current_date <= cast(ipm.end_date as date)
) new_table left join ms_policy_type_mapping m on new_table.policy_type = m.policy_type  and new_table.policy_status = m.policy_status and new_table.apl_flag = m.apl_flag 
--where other_channel = 'N'
--where agent_code = '5311055'
--case where payment_channel
--other_channel in (:payment_channel)
-- case where group type
--group_type in (:group_type)

--limit offset
--limit :limit  offset :offset

-- sort column
--order by :sort