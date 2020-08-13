-- public.tx_activity_agent_data definition

-- Drop table

-- DROP TABLE public.tx_activity_agent_data;

CREATE TABLE public.tx_activity_agent_data (
	activity_agent_data_id serial NOT NULL ,
	fk_activity_data_id numeric NULL,
	fk_policy_period varchar(10) NULL,
	agent7 varchar(7) NULL,
	region varchar(50) NULL,
	branch_code varchar(4) NULL,
	fyp numeric(19,2) NULL,
	fyc numeric(19,2) NULL,
	suminsured numeric(19,2) NULL,
	create_date timestamp NULL,
	create_by varchar(50) NULL,
	update_date timestamp NULL,
	update_by varchar(50) NULL,
	agent_name varchar(255) NULL,
	branch_name varchar(255) NULL,
	case_count numeric(6) NULL,
	running_no numeric(6) NULL,
	"position" varchar(255) NULL,
	"period" varchar(7) NULL,
	fk_activity_detail_id numeric NULL,
	CONSTRAINT tx_activity_agent_data_pkey PRIMARY KEY (activity_agent_data_id)
);