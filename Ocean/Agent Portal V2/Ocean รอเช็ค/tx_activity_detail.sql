-- public.tx_activity_detail definition

-- Drop table

-- DROP TABLE public.tx_activity_detail;

CREATE TABLE public.tx_activity_detail (
	activity_detail_id serial NOT NULL ,
	fk_activity_data_id numeric NULL,
	running_no numeric NULL,
	min_value numeric NULL,
	max_value numeric NULL,
	award_type varchar(1) NULL,
	each_value numeric NULL,
	award varchar(200) NULL,
	active_flag varchar(1) NULL,
	create_date timestamp NULL,
	create_by varchar(50) NULL,
	update_date timestamp NULL,
	update_by varchar(50) NULL,
	CONSTRAINT tx_activity_detail_pkey PRIMARY KEY (activity_detail_id)
);