-- public.tx_activity_branch definition

-- Drop table

-- DROP TABLE public.tx_activity_branch;

CREATE TABLE public.tx_activity_branch (
	activity_branch_id serial NOT NULL ,
	fk_activity_data_id numeric NULL,
	branch_code varchar(20) NULL,
	branch_name varchar(100) NULL,
	region_code varchar(20) NULL,
	region_name varchar(100) NULL,
	create_date timestamp NULL,
	create_by varchar(50) NULL,
	update_date timestamp NULL,
	update_by varchar(50) NULL,
	active_flag varchar(1) NULL,
	CONSTRAINT tx_activity_branch_pkey PRIMARY KEY (activity_branch_id)
);