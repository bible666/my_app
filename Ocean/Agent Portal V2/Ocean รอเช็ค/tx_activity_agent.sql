-- public.tx_activity_agent definition

-- Drop table

-- DROP TABLE public.tx_activity_agent;

CREATE TABLE public.tx_activity_agent (
	activity_agent_id serial NOT NULL ,
	fk_activity_data_id numeric NULL,
	agent7 varchar(7) NULL,
	active_flag varchar(1) NULL,
	create_date timestamp NULL,
	create_by varchar(50) NULL,
	update_date timestamp NULL,
	update_by varchar(50) NULL,
	full_name varchar(500) NULL,
	branch_code varchar(7) NULL,
	branch_name varchar(100) NULL,
	CONSTRAINT tx_activity_agent_pkey PRIMARY KEY (activity_agent_id)
);