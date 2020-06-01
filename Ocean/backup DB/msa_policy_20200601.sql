PGDMP     5                     x         
   msa_policy    10.0    12.2     P           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            Q           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            R           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            S           1262    123761 
   msa_policy    DATABASE     h   CREATE DATABASE msa_policy WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C' LC_CTYPE = 'C';
    DROP DATABASE msa_policy;
                postgres    false            �            1259    123793    biz_payment_customer    TABLE     �  CREATE TABLE public.biz_payment_customer (
    id numeric(14,0) NOT NULL,
    branch_code character varying(5) NOT NULL,
    deduct_date numeric(4,0) NOT NULL,
    bank_account character varying(10) NOT NULL,
    bank_account_name character varying(255) NOT NULL,
    policy_type character varying(10) NOT NULL,
    policy_no character varying(25) NOT NULL,
    bizpayment_channel character varying(1) NOT NULL,
    gen_giro character varying(1) DEFAULT 'N'::character varying,
    mode_payment numeric(4,0) DEFAULT 1,
    bank_date timestamp without time zone,
    upload_date timestamp without time zone,
    status_pay character varying(1),
    gen_date timestamp without time zone,
    send_r_biz_payment numeric(4,0) DEFAULT 1,
    status_group numeric(4,0),
    transaction_date timestamp without time zone,
    created_date timestamp without time zone,
    updated_date timestamp without time zone,
    value_hash character varying(32),
    key_hash character varying(32)
);
 (   DROP TABLE public.biz_payment_customer;
       public            postgres    false            �            1259    123786    hermes_other_channel_payment    TABLE        CREATE TABLE public.hermes_other_channel_payment (
    policy_no character varying(15) NOT NULL,
    policy_type character varying(3),
    payment_mode numeric(2,0),
    is_premium_card character varying(1),
    is_notice_letter character varying(1),
    is_barcode_sms character varying(1),
    register_date timestamp without time zone,
    created_date timestamp without time zone,
    updated_date timestamp without time zone,
    value_hash character varying(32),
    key_hash character varying(32),
    case_type character varying(20)
);
 0   DROP TABLE public.hermes_other_channel_payment;
       public            postgres    false            �            1259    123769    hermes_req_bank_payment    TABLE     �  CREATE TABLE public.hermes_req_bank_payment (
    policy_no character varying(15) NOT NULL,
    policy_type character varying(3),
    payment_mode numeric(2,0),
    register_date timestamp without time zone,
    created_date timestamp without time zone,
    updated_date timestamp without time zone,
    value_hash character varying(32),
    key_hash character varying(32),
    payment_cut character varying(2),
    account_name character varying(100),
    account_no character varying(30),
    type_deposit character varying(30),
    status_code character varying(2),
    first_cut_date timestamp without time zone,
    send_payment_cut character varying(1)
);
 +   DROP TABLE public.hermes_req_bank_payment;
       public            postgres    false            �            1259    123762    hermes_req_credit_payment    TABLE     �  CREATE TABLE public.hermes_req_credit_payment (
    policy_no character varying(15) NOT NULL,
    policy_type character varying(3),
    payment_mode numeric(2,0),
    register_date timestamp without time zone,
    created_date timestamp without time zone,
    updated_date timestamp without time zone,
    value_hash character varying(32),
    key_hash character varying(32),
    status_code character varying(2),
    first_cut_date timestamp without time zone,
    cut_type numeric(1,0),
    card_issued_bank character varying(50),
    card_type character varying(15),
    card_name character varying(100),
    card_number character varying(20),
    card_expiry character varying(6),
    send_payment_cut character varying(1)
);
 -   DROP TABLE public.hermes_req_credit_payment;
       public            postgres    false            �            1259    123776    policy_lists    TABLE     �	  CREATE TABLE public.policy_lists (
    policy_no character varying(15) NOT NULL,
    policy_type character varying(1),
    product_code character varying(10),
    policy_status character varying(1),
    sum_assured numeric(16,4),
    premium_amount numeric(16,4),
    commencement_date timestamp without time zone,
    maturity_date timestamp without time zone,
    fully_paid_date timestamp without time zone,
    payment_channel character varying(10),
    payment_mode numeric(2,0),
    next_paid_date timestamp without time zone,
    lapse_date timestamp without time zone,
    payment_term numeric(2,0),
    policy_year numeric(3,0),
    agent_code character varying(7),
    id_no character varying(30),
    first_name character varying(50),
    last_name character varying(50),
    birthdate timestamp without time zone,
    gender_code character varying(1),
    card_type character varying(1),
    title_code character varying(3),
    title_desc character varying(100),
    marital_status character varying(1),
    marital_status_desc character varying(30),
    origin character varying(3),
    origin_desc character varying(30),
    nationality character varying(20),
    nationality_desc character varying(30),
    religion character varying(2),
    religion_desc character varying(30),
    education character varying(1),
    education_desc character varying(30),
    occupation_code character varying(4),
    occupation_desc character varying(100),
    phone1 character varying(20),
    ext1 character varying(6),
    phone2 character varying(20),
    ext2 character varying(6),
    mobile1 character varying(20),
    mobile2 character varying(20),
    age_at_comm_date numeric(3,0),
    annual_income1 numeric(14,4),
    annual_income2 numeric(14,4),
    laser_code character varying(20),
    dopa_check_digit character varying(20),
    monthly_income numeric(14,4),
    email character varying(100),
    cust_code character varying(10),
    created_date timestamp without time zone,
    updated_date timestamp without time zone,
    pay_from timestamp without time zone,
    pay_to timestamp without time zone,
    extra_premium numeric(16,4),
    branch_no character varying(4),
    policy_org numeric(7,0),
    product_name character varying(200),
    customer_province_name character varying(100),
    rider_flag character varying(1),
    rc_status character varying(1),
    rc_pay_date timestamp without time zone,
    premium_ordinary numeric(16,4),
    msapolicy_create_date timestamp without time zone
);
     DROP TABLE public.policy_lists;
       public            postgres    false            M          0    123793    biz_payment_customer 
   TABLE DATA           E  COPY public.biz_payment_customer (id, branch_code, deduct_date, bank_account, bank_account_name, policy_type, policy_no, bizpayment_channel, gen_giro, mode_payment, bank_date, upload_date, status_pay, gen_date, send_r_biz_payment, status_group, transaction_date, created_date, updated_date, value_hash, key_hash) FROM stdin;
    public          postgres    false    200   :       L          0    123786    hermes_other_channel_payment 
   TABLE DATA           �   COPY public.hermes_other_channel_payment (policy_no, policy_type, payment_mode, is_premium_card, is_notice_letter, is_barcode_sms, register_date, created_date, updated_date, value_hash, key_hash, case_type) FROM stdin;
    public          postgres    false    199   3:       J          0    123769    hermes_req_bank_payment 
   TABLE DATA           �   COPY public.hermes_req_bank_payment (policy_no, policy_type, payment_mode, register_date, created_date, updated_date, value_hash, key_hash, payment_cut, account_name, account_no, type_deposit, status_code, first_cut_date, send_payment_cut) FROM stdin;
    public          postgres    false    197   P:       I          0    123762    hermes_req_credit_payment 
   TABLE DATA             COPY public.hermes_req_credit_payment (policy_no, policy_type, payment_mode, register_date, created_date, updated_date, value_hash, key_hash, status_code, first_cut_date, cut_type, card_issued_bank, card_type, card_name, card_number, card_expiry, send_payment_cut) FROM stdin;
    public          postgres    false    196   m:       K          0    123776    policy_lists 
   TABLE DATA           |  COPY public.policy_lists (policy_no, policy_type, product_code, policy_status, sum_assured, premium_amount, commencement_date, maturity_date, fully_paid_date, payment_channel, payment_mode, next_paid_date, lapse_date, payment_term, policy_year, agent_code, id_no, first_name, last_name, birthdate, gender_code, card_type, title_code, title_desc, marital_status, marital_status_desc, origin, origin_desc, nationality, nationality_desc, religion, religion_desc, education, education_desc, occupation_code, occupation_desc, phone1, ext1, phone2, ext2, mobile1, mobile2, age_at_comm_date, annual_income1, annual_income2, laser_code, dopa_check_digit, monthly_income, email, cust_code, created_date, updated_date, pay_from, pay_to, extra_premium, branch_no, policy_org, product_name, customer_province_name, rider_flag, rc_status, rc_pay_date, premium_ordinary, msapolicy_create_date) FROM stdin;
    public          postgres    false    198   �:       �           2606    123800 .   biz_payment_customer biz_payment_customer_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.biz_payment_customer
    ADD CONSTRAINT biz_payment_customer_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.biz_payment_customer DROP CONSTRAINT biz_payment_customer_pkey;
       public            postgres    false    200            �           2606    123790 <   hermes_other_channel_payment pk_hermes_other_channel_payment 
   CONSTRAINT     �   ALTER TABLE ONLY public.hermes_other_channel_payment
    ADD CONSTRAINT pk_hermes_other_channel_payment PRIMARY KEY (policy_no);
 f   ALTER TABLE ONLY public.hermes_other_channel_payment DROP CONSTRAINT pk_hermes_other_channel_payment;
       public            postgres    false    199            �           2606    123773 2   hermes_req_bank_payment pk_hermes_req_bank_payment 
   CONSTRAINT     w   ALTER TABLE ONLY public.hermes_req_bank_payment
    ADD CONSTRAINT pk_hermes_req_bank_payment PRIMARY KEY (policy_no);
 \   ALTER TABLE ONLY public.hermes_req_bank_payment DROP CONSTRAINT pk_hermes_req_bank_payment;
       public            postgres    false    197            �           2606    123766 6   hermes_req_credit_payment pk_hermes_req_credit_payment 
   CONSTRAINT     {   ALTER TABLE ONLY public.hermes_req_credit_payment
    ADD CONSTRAINT pk_hermes_req_credit_payment PRIMARY KEY (policy_no);
 `   ALTER TABLE ONLY public.hermes_req_credit_payment DROP CONSTRAINT pk_hermes_req_credit_payment;
       public            postgres    false    196            �           2606    123783    policy_lists pk_policy_lists 
   CONSTRAINT     a   ALTER TABLE ONLY public.policy_lists
    ADD CONSTRAINT pk_policy_lists PRIMARY KEY (policy_no);
 F   ALTER TABLE ONLY public.policy_lists DROP CONSTRAINT pk_policy_lists;
       public            postgres    false    198            �           1259    123784    idx-policy_lists-six_fields    INDEX     �   CREATE INDEX "idx-policy_lists-six_fields" ON public.policy_lists USING btree (id_no, policy_type, policy_status, birthdate, mobile1, pay_to);
 1   DROP INDEX public."idx-policy_lists-six_fields";
       public            postgres    false    198    198    198    198    198    198            �           1259    123801 "   idx_biz_payment_customer_policy_no    INDEX     h   CREATE INDEX idx_biz_payment_customer_policy_no ON public.biz_payment_customer USING btree (policy_no);
 6   DROP INDEX public.idx_biz_payment_customer_policy_no;
       public            postgres    false    200            �           1259    123791 (   idx_keyhash_hermes_other_channel_payment    INDEX     u   CREATE INDEX idx_keyhash_hermes_other_channel_payment ON public.hermes_other_channel_payment USING btree (key_hash);
 <   DROP INDEX public.idx_keyhash_hermes_other_channel_payment;
       public            postgres    false    199            �           1259    123774 #   idx_keyhash_hermes_req_bank_payment    INDEX     k   CREATE INDEX idx_keyhash_hermes_req_bank_payment ON public.hermes_req_bank_payment USING btree (key_hash);
 7   DROP INDEX public.idx_keyhash_hermes_req_bank_payment;
       public            postgres    false    197            �           1259    123767 %   idx_keyhash_hermes_req_credit_payment    INDEX     o   CREATE INDEX idx_keyhash_hermes_req_credit_payment ON public.hermes_req_credit_payment USING btree (key_hash);
 9   DROP INDEX public.idx_keyhash_hermes_req_credit_payment;
       public            postgres    false    196            �           1259    123785    idx_tmp1    INDEX     F   CREATE INDEX idx_tmp1 ON public.policy_lists USING btree (policy_no);
    DROP INDEX public.idx_tmp1;
       public            postgres    false    198            �           1259    123792 *   idx_valuehash_hermes_other_channel_payment    INDEX     y   CREATE INDEX idx_valuehash_hermes_other_channel_payment ON public.hermes_other_channel_payment USING btree (value_hash);
 >   DROP INDEX public.idx_valuehash_hermes_other_channel_payment;
       public            postgres    false    199            �           1259    123775 %   idx_valuehash_hermes_req_bank_payment    INDEX     o   CREATE INDEX idx_valuehash_hermes_req_bank_payment ON public.hermes_req_bank_payment USING btree (value_hash);
 9   DROP INDEX public.idx_valuehash_hermes_req_bank_payment;
       public            postgres    false    197            �           1259    123768 '   idx_valuehash_hermes_req_credit_payment    INDEX     s   CREATE INDEX idx_valuehash_hermes_req_credit_payment ON public.hermes_req_credit_payment USING btree (value_hash);
 ;   DROP INDEX public.idx_valuehash_hermes_req_credit_payment;
       public            postgres    false    196            M      x������ � �      L      x������ � �      J      x������ � �      I      x������ � �      K      x������ � �     