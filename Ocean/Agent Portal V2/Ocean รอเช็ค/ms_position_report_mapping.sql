-- public.ms_position_report_mapping definition

-- Drop table

-- DROP TABLE public.ms_position_report_mapping;

CREATE TABLE public.ms_position_report_mapping (
	position_code varchar(2) NOT NULL,
	"position" varchar(255) NULL,
	position_report varchar(255) NULL,
	position_abbr varchar(50) NULL,
	CONSTRAINT ms_position_report_mapping_pkey PRIMARY KEY (position_code)
);