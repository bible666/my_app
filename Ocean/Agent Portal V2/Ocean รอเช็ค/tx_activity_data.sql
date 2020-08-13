-- public.tx_activity_data definition

-- Drop table

-- DROP TABLE public.tx_activity_data;

CREATE TABLE public.tx_activity_data (
	activity_data_id serial NOT NULL ,
	activity_name varchar(200) NULL,
	activity_body varchar(2000) NULL,
	cover_image numeric NULL,
	policy_period_start varchar(10) NULL,
	policy_period_end varchar(10) NULL,
	activity_type varchar(1) NULL,
	calculate_type varchar(1) NULL,
	view_number numeric NULL,
	summary_type varchar(1) NULL,
	fyp_flag varchar(1) NULL,
	fyc_flag varchar(1) NULL,
	sum_insured varchar(1) NULL,
	active_flag varchar(1) NULL,
	create_date timestamp NULL,
	create_by varchar(50) NULL,
	update_date timestamp NULL,
	update_by varchar(50) NULL,
	min_insurance_case numeric NULL,
	min_amount numeric NULL,
	position_all_flag varchar(1) NULL,
	policy_type_ord_flag varchar(1) NULL,
	policy_type_ind_flag varchar(1) NULL,
	policy_type_pa_flag varchar(1) NULL,
	policy_type_ul_flag varchar(1) NULL,
	org_all_flag varchar(1) NULL,
	view_type varchar(1) NULL,
	policy_type_rider_flag varchar(1) NULL,
	rider_condition_flag varchar(1) NULL,
	policy_date_start date NULL,
	policy_date_end date NULL,
	priority_flag varchar(1) NULL,
	last_calc_date date NULL,
	CONSTRAINT tx_activity_data_pkey PRIMARY KEY (activity_data_id)
);