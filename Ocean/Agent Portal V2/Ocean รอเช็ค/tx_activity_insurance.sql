-- public.tx_activity_insurance definition

-- Drop table

-- DROP TABLE public.tx_activity_insurance;

CREATE TABLE public.tx_activity_insurance (
	activity_insurance_id serial NOT NULL,
	fk_activity_data_id numeric NULL,
	insurance_code varchar(20) NULL,
	insurance_name varchar(500) NULL,
	cover_year numeric NULL,
	payment_year numeric NULL,
	insurance_type varchar(1) NULL,
	sub_type varchar(200) NULL,
	active_flag varchar(1) NULL,
	create_date timestamp NULL,
	create_by varchar(50) NULL,
	update_date timestamp NULL,
	update_by varchar(50) NULL,
	CONSTRAINT tx_activity_insurance_pkey PRIMARY KEY (activity_insurance_id)
);