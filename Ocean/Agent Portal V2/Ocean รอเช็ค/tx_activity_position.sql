-- public.tx_activity_position definition

-- Drop table

-- DROP TABLE public.tx_activity_position;

CREATE TABLE public.tx_activity_position (
	activity_position_id serial NOT NULL ,
	fk_activity_data_id numeric NULL,
	position_code varchar(2) NULL,
	active_flag varchar(1) NULL,
	create_date timestamp NULL,
	create_by varchar(50) NULL,
	update_date timestamp NULL,
	update_by varchar(50) NULL,
	CONSTRAINT tx_activity_position_pkey PRIMARY KEY (activity_position_id)
);