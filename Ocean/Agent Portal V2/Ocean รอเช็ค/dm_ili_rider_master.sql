-- public.dm_ili_rider_master definition

-- Drop table

-- DROP TABLE public.dm_ili_rider_master;

CREATE TABLE public.dm_ili_rider_master (
	policy_no varchar(15) NOT NULL,
	policy_type varchar(1) NULL,
	rider_code varchar(5) NOT NULL,
	commencement_date timestamp NULL,
	maturity_date timestamp NULL,
	sum_assured numeric(16,4) NULL,
	premium_amount numeric(16,4) NULL,
	extra_premium numeric(16,4) NULL,
	created_date timestamp NULL,
	updated_date timestamp NULL,
	value_hash varchar(32) NULL,
	key_hash varchar(32) NULL,
	pay_to timestamp NULL,
	next_paid_date timestamp NULL,
	CONSTRAINT pk_ili_rider_master PRIMARY KEY (policy_no, rider_code)
);
CREATE INDEX idx_ili_rider_master_policy_type ON dm_ili_rider_master USING btree (policy_type);
CREATE INDEX idx_keyhash_ili_rider_master ON dm_ili_rider_master USING btree (key_hash);
CREATE INDEX idx_valuehash_ili_rider_master ON dm_ili_rider_master USING btree (value_hash);