PGDMP                         x         	   ocean_sit    10.0    12.2 �               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    106943 	   ocean_sit    DATABASE     g   CREATE DATABASE ocean_sit WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C' LC_CTYPE = 'C';
    DROP DATABASE ocean_sit;
                postgres    false                       1255    106945    is_date(character varying)    FUNCTION     �   CREATE FUNCTION public.is_date(s character varying) RETURNS boolean
    LANGUAGE plpgsql
    AS $$
begin
  perform s::date;
  return true;
exception when others then
  return false;
end;
$$;
 3   DROP FUNCTION public.is_date(s character varying);
       public          postgres    false            �            1259    106964    activity_group    TABLE       CREATE TABLE public.activity_group (
    group_cd character varying(12) NOT NULL,
    description text,
    created_date timestamp without time zone NOT NULL,
    created character varying(12),
    updated_date timestamp without time zone,
    updated character varying(12)
);
 "   DROP TABLE public.activity_group;
       public            postgres    false            �            1259    106970    agpt_access_log    TABLE     S  CREATE TABLE public.agpt_access_log (
    id numeric(19,0) NOT NULL,
    username character varying(20) NOT NULL,
    access_datetime timestamp without time zone NOT NULL,
    access_menu character varying(255) NOT NULL,
    access_url character varying(255) NOT NULL,
    user_ip character varying(20),
    user_browser character varying(255),
    user_browser_version character varying(255),
    user_browser_os character varying(255),
    user_session_id character varying(255),
    region character varying(50),
    branch_code character varying(4),
    branch_name character varying(50)
);
 #   DROP TABLE public.agpt_access_log;
       public            postgres    false            �            1259    106976    agpt_agent_tax_rate    TABLE     �   CREATE TABLE public.agpt_agent_tax_rate (
    agent_code_7 character varying(7),
    branch_code character varying(4),
    tax_rate numeric(5,2),
    data_date timestamp without time zone
);
 '   DROP TABLE public.agpt_agent_tax_rate;
       public            postgres    false            �            1259    106979    agpt_inactive_policy_calculate    TABLE       CREATE TABLE public.agpt_inactive_policy_calculate (
    id character varying(10),
    period character varying(10),
    branch_code character varying(4),
    branch_name character varying(50),
    headmn_code_7 character varying(7),
    headmn_name character varying(100),
    manager_code_7 character varying(7),
    manager_name character varying(100),
    asst_manager_code_7 character varying(7),
    asst_manager_name character varying(100),
    agent_code_7 character varying(7),
    agent_code_5 character varying(5),
    agent_name character varying(100),
    "position" character varying(100),
    policy_target numeric(10,0),
    premium_target numeric(19,2),
    policy_can_be numeric(10,0),
    premium_can_be numeric(19,2),
    persistency numeric(10,2),
    csv_created_date timestamp without time zone,
    csv_created_by character varying(20),
    _audit_filename character varying(255),
    _audit_filemod timestamp without time zone,
    _audit_filesize numeric(16,0),
    _audit_created timestamp without time zone
);
 2   DROP TABLE public.agpt_inactive_policy_calculate;
       public            postgres    false            �            1259    106985    agpt_inactive_policy_detail    TABLE     @  CREATE TABLE public.agpt_inactive_policy_detail (
    id character varying(10) NOT NULL,
    period character varying(10),
    branch_code character varying(4),
    branch_name character varying(50),
    headmn_code_7 character varying(7),
    headmn_name character varying(100),
    manager_code_7 character varying(7),
    manager_name character varying(100),
    asst_manager_code_7 character varying(7),
    asst_manager_name character varying(100),
    supervisor_code_7 character varying(7),
    supervisor_name character varying(100),
    agent_code_7 character varying(7),
    agent_name character varying(100),
    policy_no character varying(20),
    premium_can_be numeric(19,2),
    premium_month numeric(19,2),
    premium_year numeric(19,2),
    sum_assured numeric(19,2),
    last_grace_period_date date,
    premium_status character varying(20),
    premium_last_period_status character varying(20),
    plan_name character varying(100),
    commencement_date date,
    la_name_surname character varying(100),
    phone1 character varying(100),
    phone2 character varying(100),
    mobile1 character varying(100),
    mobile2 character varying(100),
    paid_to_date date,
    current_agent_code character varying(7),
    current_agent_name character varying(100),
    current_agent_branch character varying(50),
    csv_created_date timestamp without time zone,
    csv_created_by character varying(20),
    _audit_filename character varying(255),
    _audit_filemod timestamp without time zone,
    _audit_filesize numeric(16,0),
    _audit_created timestamp without time zone
);
 /   DROP TABLE public.agpt_inactive_policy_detail;
       public            postgres    false            �            1259    106991    agpt_inactive_policy_summary    TABLE       CREATE TABLE public.agpt_inactive_policy_summary (
    id character varying(10),
    period character varying(10),
    branch_code character varying(4),
    branch_name character varying(50),
    agent_code_7 character varying(7),
    agent_code_5 character varying(10),
    agent_name character varying(100),
    "position" character varying(100),
    policy_target numeric(10,0),
    premium_target numeric(19,2),
    policy_can_be numeric(10,0),
    premium_can_be numeric(19,2),
    persistency numeric(10,2),
    csv_created_date timestamp without time zone,
    csv_created_by character varying(20),
    _audit_filename character varying(255),
    _audit_filemod timestamp without time zone,
    _audit_filesize numeric(16,0),
    _audit_created timestamp without time zone
);
 0   DROP TABLE public.agpt_inactive_policy_summary;
       public            postgres    false            �            1259    106997    agpt_lookup_data    TABLE       CREATE TABLE public.agpt_lookup_data (
    key_group character varying(100) NOT NULL,
    key character varying(100) NOT NULL,
    value character varying(100),
    period_from character varying(10) NOT NULL,
    period_to character varying(10) NOT NULL
);
 $   DROP TABLE public.agpt_lookup_data;
       public            postgres    false            �            1259    107000    agpt_newcase_report    TABLE       CREATE TABLE public.agpt_newcase_report (
    id character varying(10),
    period character varying(10),
    region character varying(50),
    branch_code character varying(4),
    branch_name character varying(50),
    policy_type character varying(20),
    policy_no character varying(20),
    cust_id character varying(12),
    plan_code character varying(10),
    plan_name character varying(100),
    agent_code_7 character varying(7),
    agent_name character varying(100),
    "position" character varying(100),
    commission_first numeric(19,2),
    policy_status character varying(20),
    la_age character varying(5),
    effective_date_from date,
    effective_date_to date,
    sum_assured numeric(19,2),
    premium numeric(19,2),
    payment_mode numeric(19,0),
    last_pay_period_date date,
    la_name_surname character varying(100),
    id_no character varying(13),
    occupation_group character varying(100),
    occupation character varying(100),
    address character varying(150),
    subdistrict character varying(100),
    district character varying(100),
    province character varying(100),
    zipcode character varying(5),
    phone1 character varying(100),
    phone2 character varying(100),
    mobile1 character varying(100),
    mobile2 character varying(100),
    csv_created_date timestamp without time zone,
    csv_created_by character varying(20),
    _audit_filename character varying(255),
    _audit_filemod timestamp without time zone,
    _audit_filesize numeric(16,0),
    _audit_created timestamp without time zone
);
 '   DROP TABLE public.agpt_newcase_report;
       public            postgres    false            �            1259    107006    agpt_persistency_detail    TABLE     G  CREATE TABLE public.agpt_persistency_detail (
    id character varying(10),
    period character varying(10),
    branch_code character varying(4),
    branch_name character varying(50),
    headmn_code_7 character varying(7),
    headmn_code_5 character varying(5),
    headmn_name character varying(100),
    manager_code_7 character varying(7),
    manager_code_5 character varying(5),
    manager_name character varying(100),
    supervisor_code_7 character varying(7),
    supervisor_code_5 character varying(5),
    supervisor_name character varying(100),
    agent_code_7 character varying(7),
    agent_code_5 character varying(5),
    agent_name character varying(100),
    policy_no character varying(20),
    policy_type character varying(20),
    premium_target numeric(19,2),
    premium_can_be numeric(19,2),
    sum_assure numeric(19,2),
    premium_status character varying(20),
    plan_name character varying(100),
    commencement_date date,
    la_name_surname character varying(100),
    paid_to_date character varying(10),
    plan_code character varying(10),
    csv_created_date timestamp without time zone,
    csv_created_by character varying(20),
    _audit_filename character varying(255),
    _audit_filemod timestamp without time zone,
    _audit_filesize numeric(16,0),
    _audit_created timestamp without time zone
);
 +   DROP TABLE public.agpt_persistency_detail;
       public            postgres    false            �            1259    107012    agpt_persistency_summary    TABLE     �  CREATE TABLE public.agpt_persistency_summary (
    id character varying(10),
    period character varying(10),
    branch_code character varying(4),
    branch_name character varying(50),
    headmn_code_7 character varying(7),
    headmn_code_5 character varying(5),
    headmn_name character varying(100),
    headmn_premium_can_be numeric(19,2),
    headmn_premium_target numeric(19,2),
    headmn_persistency numeric(10,2),
    manager_code_7 character varying(7),
    manager_code_5 character varying(5),
    manager_name character varying(100),
    manager_premium_can_be numeric(19,2),
    manager_premium_target numeric(19,2),
    manager_persistency numeric(10,2),
    supervisor_code_7 character varying(7),
    supervisor_code_5 character varying(5),
    supervisor_name character varying(100),
    supervisor_premium_can_be numeric(19,2),
    supervisor_premium_target numeric(19,2),
    supervisor_persistency numeric(10,2),
    agent_code_7 character varying(7),
    agent_code_5 character varying(5),
    agent_name character varying(100),
    agent_premium_can_be numeric(19,2),
    agent_premium_target numeric(19,2),
    agent_persistency numeric(10,2),
    csv_created_date timestamp without time zone,
    csv_created_by character varying(20),
    _audit_filename character varying(255),
    _audit_filemod timestamp without time zone,
    _audit_filesize numeric(16,0),
    _audit_created timestamp without time zone
);
 ,   DROP TABLE public.agpt_persistency_summary;
       public            postgres    false            �            1259    107018    agpt_salereportsub    TABLE     �  CREATE TABLE public.agpt_salereportsub (
    "mPeriod" character varying(12),
    "mName" character varying(12),
    "mBranch" character varying(12),
    "mAreaGroup" character varying(12),
    "mCode5" character varying(12),
    "mCode7" character varying(12),
    "mPosition" character varying(12),
    "mSystem" character varying(12),
    "mNewCaseNo" numeric(5,0),
    "mCreamPrem" numeric(19,2),
    "mFirstPAPrem" numeric(19,2),
    "mCoffeePrem" numeric(19,2),
    "mFirstCom" numeric(19,2),
    "mPnewcB" numeric(19,2),
    "mPinf2B" numeric(19,2),
    "mInfP2" character varying(12),
    "mSecondCom" numeric(19,2),
    "mThirdCom" numeric(19,2),
    "Mgpro46" numeric(19,2),
    "Mgpro47" numeric(19,2),
    "Mgpro48" numeric(19,2),
    "Mgpro48A" numeric(19,2),
    "Mgpro50" numeric(19,2),
    "Mgpro51" numeric(19,2),
    "mSumOV" numeric(19,2),
    "aPeriod" character varying(12),
    "aBranch" character varying(12),
    "aCode5" character varying(12),
    "aMCode5" character varying(12),
    "aCode7" character varying(12),
    "aPosition" character varying(12),
    "aName" character varying(12),
    "aSystem" character varying(12),
    "aNewCaseNo" numeric(19,2),
    "aFirstYearPrem" numeric(19,2),
    "aFirstCom" numeric(19,2),
    "aFirstPAPrem" numeric(19,2),
    "aSecondCom" numeric(19,2),
    "aThirdCom" numeric(19,2),
    "aCreamPrem" numeric(19,2),
    "aCoffeePrem" numeric(19,2),
    "aBonus" numeric(19,2),
    "aBonus3p" numeric(19,2),
    "aKeep" numeric(19,2),
    "aConserv" numeric(19,2),
    "aBonusNewAgent" numeric(19,2),
    "aCreateNewAgent" numeric(19,2),
    "aSumOV" numeric(19,2),
    "aPinf2B" numeric(19,2),
    "aPnewcB" numeric(19,2),
    "aInfP2" character varying(12),
    a7 character varying(12),
    "mMab" character varying(12)
);
 &   DROP TABLE public.agpt_salereportsub;
       public            postgres    false            �            1259    107021    as400_lips_pspempno    TABLE     n   CREATE TABLE public.as400_lips_pspempno (
    empagt numeric(7,0) NOT NULL,
    empno character varying(5)
);
 '   DROP TABLE public.as400_lips_pspempno;
       public            postgres    false                       1259    123753    biz_payment_customer    TABLE     �  CREATE TABLE public.biz_payment_customer (
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
       public            postgres    false            �            1259    107024    dm_agent_income    TABLE     �	  CREATE TABLE public.dm_agent_income (
    id character varying(10) NOT NULL,
    period character varying(10),
    region character varying(50),
    branch_code character varying(4),
    branch_name character varying(50),
    head_business_code_7 character varying(7),
    head_business_name character varying(100),
    headmn_code_7 character varying(7),
    headmn_name character varying(100),
    manager_code_7 character varying(7),
    manager_name character varying(100),
    agent_code_7 character varying(7),
    agent_status character varying(20),
    agent_name character varying(100),
    "position" character varying(100),
    position_group character varying(50),
    personal_id character varying(13),
    occupation character varying(100),
    occupation_group character varying(100),
    education character varying(100),
    education_group character varying(100),
    agent_start_date date,
    appointed_year_desc character varying(100),
    agent_age character varying(5),
    agent_age_duration character varying(20),
    gender character varying(5),
    working_age character varying(5),
    position_date_current date,
    position_age character varying(5),
    license character varying(20),
    license_expired_date date,
    appointed_period character varying(20),
    recruiter_code_7 character varying(7),
    recruiter_name character varying(100),
    recruiter_position character varying(100),
    manager_period_adjust character varying(10),
    manager_adjust_desc character varying(100),
    supervisor_period_adjust character varying(10),
    supervisor_adjust_desc character varying(100),
    premium_cream numeric(19,2),
    premium_pa numeric(19,2),
    premium_coffee numeric(19,2),
    premium_total numeric(19,2),
    premium_portfolio numeric(19,2),
    new_case_ord_ind numeric(10,0),
    new_case_pa numeric(10,0),
    commission_first numeric(19,2),
    commission_first_level character varying(100),
    commission_next_year numeric(19,2),
    premium_can_be numeric(19,2),
    premium_target numeric(19,2),
    persistency character varying(10),
    appointed_agent_amount numeric(10,0),
    keep_amount numeric(19,2),
    ov_supervisor numeric(19,2),
    ov_manager numeric(19,2),
    csv_created_date timestamp without time zone,
    csv_created_by character varying(20),
    _audit_filename character varying(255),
    _audit_filemod timestamp without time zone,
    _audit_filesize numeric(16,0),
    _audit_created timestamp without time zone
);
 #   DROP TABLE public.dm_agent_income;
       public            postgres    false            �            1259    107030    dm_agpt_period    TABLE     �   CREATE TABLE public.dm_agpt_period (
    period character varying(10) NOT NULL,
    start_date date,
    end_date date,
    finalized boolean,
    mt011 date,
    ppyy character varying(4),
    payment_date date
);
 "   DROP TABLE public.dm_agpt_period;
       public            postgres    false            �            1259    107033    dm_as400_phpagmt6    TABLE     �   CREATE TABLE public.dm_as400_phpagmt6 (
    "AGENT#" numeric(7,0) NOT NULL,
    agphon character varying(30),
    agmail character varying(35)
);
 %   DROP TABLE public.dm_as400_phpagmt6;
       public            postgres    false            �            1259    107036    dm_as400_phpmpno    TABLE     k   CREATE TABLE public.dm_as400_phpmpno (
    empagt numeric(7,0) NOT NULL,
    empno character varying(5)
);
 $   DROP TABLE public.dm_as400_phpmpno;
       public            postgres    false            �            1259    107039    dm_as400_pspagmt1    TABLE     �   CREATE TABLE public.dm_as400_pspagmt1 (
    "AGENT#" numeric(7,0) NOT NULL,
    agtitl character varying(50),
    agname character varying(50),
    aglsnm character varying(50)
);
 %   DROP TABLE public.dm_as400_pspagmt1;
       public            postgres    false            �            1259    107042    dm_as400_pspagmt4    TABLE     �   CREATE TABLE public.dm_as400_pspagmt4 (
    "AGENT#" numeric(7,0) NOT NULL,
    "AGREL#" numeric(7,0),
    "AGORG#" numeric(7,0),
    "AGPOS@" character varying(2),
    agpodt numeric(6,0)
);
 %   DROP TABLE public.dm_as400_pspagmt4;
       public            postgres    false            �            1259    107045    dm_as400_pspagmt6    TABLE     �  CREATE TABLE public.dm_as400_pspagmt6 (
    "AGENT#" integer NOT NULL,
    agphon text,
    agmail text,
    agidex text,
    agacdr text,
    agacum integer,
    agacpv integer,
    agfrnm text,
    agmonm text,
    agmrst integer,
    agspnm text,
    agofnm text,
    agofod integer,
    agofov integer,
    aggroc integer,
    aggrop text,
    aggrof text,
    aggrog text,
    agidmg text,
    agchil text
);
 %   DROP TABLE public.dm_as400_pspagmt6;
       public            postgres    false            �            1259    107051    dm_as400_pspagtms    TABLE     �  CREATE TABLE public.dm_as400_pspagtms (
    agtnum numeric(10,0) NOT NULL,
    agent7 numeric(7,0) NOT NULL,
    brnno numeric(4,0) NOT NULL,
    agtttl character varying(30),
    agtnam character varying(50),
    agtsnm character varying(50),
    agtnnm character varying(20),
    agtsex character varying(1),
    poscod character varying(3),
    agtidn character varying(13),
    agtids numeric(8,0),
    agtide numeric(8,0),
    agttxn character varying(20),
    agtlcn character varying(20),
    agtlcs numeric(8,0),
    agtlce numeric(8,0),
    agtlcp numeric(2,0),
    agttax numeric(2,0),
    agtcol numeric(2,0),
    agtfee numeric(14,2),
    agtrsg character varying(1),
    agtrsd numeric(8,0),
    agtclv character varying(100),
    agtrtn numeric(8,0),
    agtrl5 character varying(1),
    agttyp character varying(2),
    agtinc character varying(1),
    agtphn character varying(10),
    agtpvb character varying(100),
    agtpvn character varying(3),
    agtpal character varying(100),
    agtprd character varying(100),
    agtpsd numeric(4,0),
    agtpdt numeric(2,0),
    agtppv numeric(2,0),
    agtptc numeric(5,0),
    agtshn character varying(10),
    agtsvb character varying(100),
    agtsvn character varying(3),
    agtsal character varying(100),
    agtsrd character varying(100),
    agtssd numeric(4,0),
    agtsdt numeric(2,0),
    agtspv numeric(2,0),
    agtstc numeric(5,0),
    agttel character varying(20),
    agtcph character varying(20),
    agtlid character varying(50),
    agteml character varying(100),
    agtbd numeric(8,0),
    agtage numeric(2,0),
    agtbld character varying(5),
    agtedu character varying(1),
    agtocc numeric(4,0),
    agtmrt character varying(1),
    agtspn character varying(100),
    agtftn character varying(100),
    agtmtn character varying(100),
    agtrno character varying(6),
    orgcod numeric(3,0),
    agtact character varying(1),
    credte numeric(8,0),
    cretme numeric(6,0),
    creuby character varying(25),
    upddte numeric(8,0),
    updtme numeric(6,0),
    upduby character varying(25),
    agtstd numeric(8,0),
    agtsep numeric(7,0),
    agtbkn character varying(10),
    agtchd numeric(2,0),
    agtrst character varying(1)
);
 %   DROP TABLE public.dm_as400_pspagtms;
       public            postgres    false            �            1259    107057    dm_as400_pspslorg    TABLE     �   CREATE TABLE public.dm_as400_pspslorg (
    "SLUNT#" numeric(7,0) NOT NULL,
    "SLREL#" numeric(7,0),
    slunnm character varying(20)
);
 %   DROP TABLE public.dm_as400_pspslorg;
       public            postgres    false            �            1259    107060    dm_as400_pspslpos    TABLE     �   CREATE TABLE public.dm_as400_pspslpos (
    "AGPOS@" character varying(7) NOT NULL,
    agabpo character varying(20),
    agpost character varying(200)
);
 %   DROP TABLE public.dm_as400_pspslpos;
       public            postgres    false                       1259    115442    dm_as400_ultsagic    TABLE     �   CREATE TABLE public.dm_as400_ultsagic (
    agntnm text NOT NULL,
    agicvc text,
    iclvnm integer,
    dbgndt text,
    dexpdt text,
    cretdt text,
    cretim text,
    crbynm text,
    updadt text,
    updtim text,
    upbyvc text
);
 %   DROP TABLE public.dm_as400_ultsagic;
       public            postgres    false                       1259    107701    dm_ili_rider_master    TABLE       CREATE TABLE public.dm_ili_rider_master (
    policy_no text NOT NULL,
    policy_type text,
    rider_code integer,
    commencement_date timestamp without time zone,
    maturity_date timestamp without time zone,
    sum_assured numeric,
    premium_amount numeric,
    extra_premium numeric,
    created_date timestamp without time zone,
    updated_date timestamp without time zone,
    value_hash text,
    key_hash text,
    pay_to timestamp without time zone,
    next_paid_date timestamp without time zone
);
 '   DROP TABLE public.dm_ili_rider_master;
       public            postgres    false                       1259    111059    dm_newcase_report    TABLE       CREATE TABLE public.dm_newcase_report (
    id integer NOT NULL,
    region text,
    branch_code text,
    branch_name text,
    policy_type text,
    policy_no text,
    cust_id text,
    plan_code text,
    plan_name text,
    agent_code_7 text,
    agent_name text,
    "position" text,
    commission_first numeric(18,2),
    policy_status text,
    la_age text,
    effective_date_from date,
    effective_date_to date,
    sum_assured numeric(18,2),
    premium numeric(18,2),
    payment_mode text,
    last_pay_period_date text,
    la_name_surname text,
    id_no text,
    occupation_group text,
    occupation text,
    address text,
    subdistrict text,
    district text,
    province text,
    zipcode text,
    phone1 text,
    phone2 text,
    mobile1 text,
    mobile2 text,
    period text,
    csv_created_date timestamp without time zone,
    csv_created_by text,
    _audit_filename text,
    _audit_filemod timestamp without time zone,
    _audit_filesize numeric,
    _audit_created timestamp without time zone
);
 %   DROP TABLE public.dm_newcase_report;
       public            postgres    false            	           1259    123710    hermes_other_channel_payment    TABLE        CREATE TABLE public.hermes_other_channel_payment (
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
       public            postgres    false            
           1259    123717    hermes_req_bank_payment    TABLE     �  CREATE TABLE public.hermes_req_bank_payment (
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
       public            postgres    false                       1259    123725    hermes_req_credit_payment    TABLE     �  CREATE TABLE public.hermes_req_credit_payment (
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
       public            postgres    false                       1259    123732    hist_ili_rider_master    TABLE     `  CREATE TABLE public.hist_ili_rider_master (
    policy_no character varying(15),
    policy_type character varying(1),
    rider_code character varying(5),
    commencement_date timestamp without time zone,
    maturity_date timestamp without time zone,
    sum_assured numeric(16,4),
    premium_amount numeric(16,4),
    extra_premium numeric(16,4),
    created_date timestamp without time zone,
    updated_date timestamp without time zone,
    value_hash character varying(32),
    key_hash character varying(32),
    pay_to timestamp without time zone,
    next_paid_date timestamp without time zone
);
 )   DROP TABLE public.hist_ili_rider_master;
       public            postgres    false            �            1259    106961    ili_policy_master    TABLE     �  CREATE TABLE public.ili_policy_master (
    policy_no character varying(11) NOT NULL,
    policy_type character varying(3),
    policy_year numeric(3,0),
    policy_status character varying(1),
    commencement_date timestamp without time zone,
    maturity_date timestamp without time zone,
    lapse_date timestamp without time zone,
    next_paid_date timestamp without time zone,
    fully_paid_date timestamp without time zone,
    pay_from timestamp without time zone,
    pay_to timestamp without time zone,
    product_code character varying(10),
    sum_assured numeric(16,4),
    premium_amount numeric(16,4),
    extra_premium numeric(16,4),
    payment_mode integer,
    payment_term numeric(2,0),
    agent_code character varying(7),
    id_no character varying(30),
    first_name character varying(50),
    last_name character varying(50),
    birthdate timestamp without time zone,
    gender_code character varying(1),
    card_type character varying(1),
    title_desc character varying(20),
    origin_desc character varying(30),
    payment_channel text,
    title_code text,
    marital_status text,
    marital_status_desc text,
    origin text,
    nationality text,
    nationality_desc text,
    religion text,
    religion_desc text,
    education text,
    education_desc text,
    occupation_code text,
    occupation_desc text,
    phone1 text,
    ext1 text,
    phone2 text,
    ext2 text,
    mobile1 text,
    mobile2 text,
    age_at_comm_date text,
    annual_income1 text,
    annual_income2 text,
    laser_code text,
    dopa_check_digit text,
    monthly_income text,
    email text,
    cust_code text,
    created_date text,
    updated_date text,
    value_hash text,
    key_hash text,
    branch_no text,
    policy_org text
);
 %   DROP TABLE public.ili_policy_master;
       public            postgres    false            �            1259    107063    lg_activity_agent    TABLE     �  CREATE TABLE public.lg_activity_agent (
    activity_agent_log_id integer NOT NULL,
    activity_agent_id integer,
    fk_activity_data integer,
    agent_7 character varying(7),
    agent_title character varying(10),
    agent_name character varying(500),
    active_flag character varying(1),
    create_date timestamp without time zone,
    create_by character varying(50),
    update_date timestamp without time zone,
    update_by character varying(50)
);
 %   DROP TABLE public.lg_activity_agent;
       public            postgres    false            �            1259    107069 +   lg_activity_agent_activity_agent_log_id_seq    SEQUENCE     �   CREATE SEQUENCE public.lg_activity_agent_activity_agent_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 B   DROP SEQUENCE public.lg_activity_agent_activity_agent_log_id_seq;
       public          postgres    false    219                       0    0 +   lg_activity_agent_activity_agent_log_id_seq    SEQUENCE OWNED BY     {   ALTER SEQUENCE public.lg_activity_agent_activity_agent_log_id_seq OWNED BY public.lg_activity_agent.activity_agent_log_id;
          public          postgres    false    220            �            1259    107071    lg_activity_agent_data    TABLE     
  CREATE TABLE public.lg_activity_agent_data (
    activity_data_log_id integer NOT NULL,
    fk_activity_data_id integer,
    activity_name character varying(200),
    activity_body character varying(2000),
    cover_image integer,
    policy_period_start character varying(10),
    policy_period_end character varying(10),
    activity_type character varying(1),
    calculate_type character varying(1),
    view_type character varying(1),
    summary_type character varying(1),
    org_all_flag character varying(1),
    position_all_flag character varying(1),
    policy_type_ord_flag character varying(1),
    policy_type_ind_flag character varying(1),
    policy_type_pa_flag character varying(1),
    policy_type_ul_flag character varying(1),
    fyp_flag character varying(1),
    fyc_flag character varying(1),
    sum_insured character varying(1),
    min_insurance_case integer,
    min_amount numeric,
    active_flag character varying(1),
    create_date timestamp without time zone,
    create_by character varying(50)
);
 *   DROP TABLE public.lg_activity_agent_data;
       public            postgres    false            �            1259    107077 /   lg_activity_agent_data_activity_data_log_id_seq    SEQUENCE     �   CREATE SEQUENCE public.lg_activity_agent_data_activity_data_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 F   DROP SEQUENCE public.lg_activity_agent_data_activity_data_log_id_seq;
       public          postgres    false    221                       0    0 /   lg_activity_agent_data_activity_data_log_id_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.lg_activity_agent_data_activity_data_log_id_seq OWNED BY public.lg_activity_agent_data.activity_data_log_id;
          public          postgres    false    222            �            1259    107079    lg_activity_branch    TABLE     �  CREATE TABLE public.lg_activity_branch (
    activity_branch_log_id integer NOT NULL,
    fk_activity_branch_id integer,
    fk_activity_data_id integer,
    branch_code character varying(20),
    branch_name character varying(100),
    region_code character varying(20),
    region_name character varying(100),
    active_flag character varying(1),
    create_date timestamp without time zone,
    create_by character varying(50)
);
 &   DROP TABLE public.lg_activity_branch;
       public            postgres    false            �            1259    107082 -   lg_activity_branch_activity_branch_log_id_seq    SEQUENCE     �   CREATE SEQUENCE public.lg_activity_branch_activity_branch_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 D   DROP SEQUENCE public.lg_activity_branch_activity_branch_log_id_seq;
       public          postgres    false    223                       0    0 -   lg_activity_branch_activity_branch_log_id_seq    SEQUENCE OWNED BY        ALTER SEQUENCE public.lg_activity_branch_activity_branch_log_id_seq OWNED BY public.lg_activity_branch.activity_branch_log_id;
          public          postgres    false    224            �            1259    107084    lg_activity_detail    TABLE     �  CREATE TABLE public.lg_activity_detail (
    activity_detail_log_id integer NOT NULL,
    fk_activity_detail_id integer,
    fk_activity_data_id integer,
    running_no integer,
    min_value integer,
    max_value integer,
    award_type character varying(1),
    each_value integer,
    award character varying(200),
    active_flag character varying(1),
    create_date timestamp without time zone,
    create_by character varying(50)
);
 &   DROP TABLE public.lg_activity_detail;
       public            postgres    false            �            1259    107087 -   lg_activity_detail_activity_detail_log_id_seq    SEQUENCE     �   CREATE SEQUENCE public.lg_activity_detail_activity_detail_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 D   DROP SEQUENCE public.lg_activity_detail_activity_detail_log_id_seq;
       public          postgres    false    225                       0    0 -   lg_activity_detail_activity_detail_log_id_seq    SEQUENCE OWNED BY        ALTER SEQUENCE public.lg_activity_detail_activity_detail_log_id_seq OWNED BY public.lg_activity_detail.activity_detail_log_id;
          public          postgres    false    226            �            1259    107089    lg_activity_insurance    TABLE     �  CREATE TABLE public.lg_activity_insurance (
    activity_insurance_log_id integer NOT NULL,
    fk_activity_insurance_id integer,
    fk_activity_data_id integer,
    insurance_code character varying(20),
    insurance_name character varying(500),
    cover_year integer,
    payment_year integer,
    insurance_type character varying(1),
    sub_type character varying(200),
    active_flag character varying(1),
    create_date timestamp without time zone,
    create_by character varying(50)
);
 )   DROP TABLE public.lg_activity_insurance;
       public            postgres    false            �            1259    107095 3   lg_activity_insurance_activity_insurance_log_id_seq    SEQUENCE     �   CREATE SEQUENCE public.lg_activity_insurance_activity_insurance_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 J   DROP SEQUENCE public.lg_activity_insurance_activity_insurance_log_id_seq;
       public          postgres    false    227                       0    0 3   lg_activity_insurance_activity_insurance_log_id_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.lg_activity_insurance_activity_insurance_log_id_seq OWNED BY public.lg_activity_insurance.activity_insurance_log_id;
          public          postgres    false    228            �            1259    107097    lg_knows_access    TABLE     �  CREATE TABLE public.lg_knows_access (
    knows_access_id integer NOT NULL,
    fk_knows_data integer,
    agent_code character varying(12),
    accepted_date timestamp without time zone,
    read_date timestamp without time zone,
    created timestamp without time zone,
    create_by character varying(12),
    updated timestamp without time zone,
    update_by character varying(12)
);
 #   DROP TABLE public.lg_knows_access;
       public            postgres    false            �            1259    107100 #   lg_knows_access_knows_access_id_seq    SEQUENCE     �   CREATE SEQUENCE public.lg_knows_access_knows_access_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.lg_knows_access_knows_access_id_seq;
       public          postgres    false    229                       0    0 #   lg_knows_access_knows_access_id_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public.lg_knows_access_knows_access_id_seq OWNED BY public.lg_knows_access.knows_access_id;
          public          postgres    false    230            �            1259    107102    lg_knows_history    TABLE     o  CREATE TABLE public.lg_knows_history (
    knows_history_id integer NOT NULL,
    fk_knows_data integer,
    types character varying(1),
    owner_id character varying(12),
    fk_knows_group integer,
    title character varying(200),
    body character varying(2000),
    show_date timestamp without time zone,
    start_date timestamp without time zone,
    end_date timestamp without time zone,
    status character varying(1),
    piority character varying(1),
    created timestamp without time zone,
    create_by character varying(12),
    updated timestamp without time zone,
    update_by character varying(12)
);
 $   DROP TABLE public.lg_knows_history;
       public            postgres    false            �            1259    107108 %   lg_knows_history_knows_history_id_seq    SEQUENCE     �   CREATE SEQUENCE public.lg_knows_history_knows_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.lg_knows_history_knows_history_id_seq;
       public          postgres    false    231                       0    0 %   lg_knows_history_knows_history_id_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.lg_knows_history_knows_history_id_seq OWNED BY public.lg_knows_history.knows_history_id;
          public          postgres    false    232            �            1259    107110    lx_agent_token    TABLE     x  CREATE TABLE public.lx_agent_token (
    agent_token_id integer NOT NULL,
    username character varying(25),
    generate_date timestamp without time zone,
    agent_code character varying(7),
    agent_name character varying(255),
    branch_code character varying(4),
    branch_name character varying(50),
    position_group character varying(50),
    "position" character varying(100),
    license character varying(20),
    license_expire timestamp without time zone,
    created timestamp without time zone,
    create_by character varying(12),
    updated timestamp without time zone,
    update_by character varying(12)
);
 "   DROP TABLE public.lx_agent_token;
       public            postgres    false            �            1259    107116 !   lx_agent_token_agent_token_id_seq    SEQUENCE     �   CREATE SEQUENCE public.lx_agent_token_agent_token_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.lx_agent_token_agent_token_id_seq;
       public          postgres    false    233                        0    0 !   lx_agent_token_agent_token_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.lx_agent_token_agent_token_id_seq OWNED BY public.lx_agent_token.agent_token_id;
          public          postgres    false    234            �            1259    107118    ms_admin_manage_branch    TABLE     C  CREATE TABLE public.ms_admin_manage_branch (
    email character varying(35) NOT NULL,
    branch_code character varying(8) NOT NULL,
    branch_name character varying(50),
    create_date timestamp with time zone,
    create_by character varying(25),
    active_flag character varying(1) DEFAULT 'Y'::character varying
);
 *   DROP TABLE public.ms_admin_manage_branch;
       public            postgres    false            �            1259    107122    ms_knows_group    TABLE     6  CREATE TABLE public.ms_knows_group (
    knows_group_id integer NOT NULL,
    group_name character varying(200),
    type character varying(1),
    create_date timestamp without time zone,
    create_by character varying(12),
    update_date timestamp without time zone,
    update_by character varying(12)
);
 "   DROP TABLE public.ms_knows_group;
       public            postgres    false            �            1259    107125 !   ms_knows_group_knows_group_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ms_knows_group_knows_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.ms_knows_group_knows_group_id_seq;
       public          postgres    false    236            !           0    0 !   ms_knows_group_knows_group_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.ms_knows_group_knows_group_id_seq OWNED BY public.ms_knows_group.knows_group_id;
          public          postgres    false    237                       1259    111086 	   ms_period    TABLE     �   CREATE TABLE public.ms_period (
    period text NOT NULL,
    start_date date,
    end_date date,
    finalized text,
    mt011 date,
    ppyy text,
    payment_date text
);
    DROP TABLE public.ms_period;
       public            postgres    false                       1259    111078    ms_position_report_mapping    TABLE     �   CREATE TABLE public.ms_position_report_mapping (
    position_code integer NOT NULL,
    "position" text,
    position_report text,
    position_abbr text
);
 .   DROP TABLE public.ms_position_report_mapping;
       public            postgres    false                       1259    111102 
   ms_product    TABLE       CREATE TABLE public.ms_product (
    product_code text NOT NULL,
    product_category text,
    product_type text,
    product_name text,
    product_plan text,
    type text,
    subtype text,
    payment_year integer,
    payment_type text,
    cover_year integer,
    cover_type text,
    premium_per_suminsure integer,
    healthcheck_flag text,
    have_wp text,
    gender text,
    start_date date,
    end_date date,
    active_flag text,
    modify_date date,
    product_line text,
    saving_flag text
);
    DROP TABLE public.ms_product;
       public            postgres    false            �            1259    107127    people    TABLE     �   CREATE TABLE public.people (
    id integer NOT NULL,
    full_name character varying(255) NOT NULL,
    job_title character varying(255)
);
    DROP TABLE public.people;
       public            postgres    false            �            1259    107133    people_id_seq    SEQUENCE     �   CREATE SEQUENCE public.people_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.people_id_seq;
       public          postgres    false    238            "           0    0    people_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.people_id_seq OWNED BY public.people.id;
          public          postgres    false    239            �            1259    107135 
   st_product    TABLE     �  CREATE TABLE public.st_product (
    product_code character varying(20) NOT NULL,
    product_category character varying(20) NOT NULL,
    product_type character varying(20) NOT NULL,
    product_name character varying(500) NOT NULL,
    product_plan character varying(500),
    type character(1) NOT NULL,
    subtype character varying(200),
    payment_year integer,
    payment_type character varying(10),
    cover_year integer,
    cover_type character varying(10),
    premium_per_suminsure integer,
    healthcheck_flag character(1),
    have_wp character(1),
    gender character(1),
    start_date date,
    end_date date,
    active_flag character(1),
    modify_date timestamp without time zone,
    product_line character varying(10)
);
    DROP TABLE public.st_product;
       public            postgres    false            #           0    0    TABLE st_product    COMMENT     Q   COMMENT ON TABLE public.st_product IS 'ข้อมูลกรมธรรม';
          public          postgres    false    240                       1259    125064    st_rider    TABLE     �  CREATE TABLE public.st_rider (
    rider_code character varying(5) NOT NULL,
    rider_category character varying(20) NOT NULL,
    rider_type character varying(50) NOT NULL,
    rider_name character varying(500) NOT NULL,
    type character varying(10) NOT NULL,
    short_name character varying(100) NOT NULL,
    active_flag character(1) NOT NULL,
    modify_date timestamp without time zone
);
    DROP TABLE public.st_rider;
       public            postgres    false            �            1259    107141    tablename_seq    SEQUENCE     v   CREATE SEQUENCE public.tablename_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.tablename_seq;
       public          postgres    false            �            1259    107143    tx_activity_agent    TABLE     �  CREATE TABLE public.tx_activity_agent (
    activity_agent_id integer NOT NULL,
    fk_activity_data integer,
    agent_7 character varying(7),
    agent_title character varying(10),
    agent_name character varying(500),
    active_flag character varying(1),
    create_date timestamp without time zone,
    create_by character varying(50),
    update_date timestamp without time zone,
    update_by character varying(50)
);
 %   DROP TABLE public.tx_activity_agent;
       public            postgres    false            �            1259    107149 '   tx_activity_agent_activity_agent_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tx_activity_agent_activity_agent_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 >   DROP SEQUENCE public.tx_activity_agent_activity_agent_id_seq;
       public          postgres    false    242            $           0    0 '   tx_activity_agent_activity_agent_id_seq    SEQUENCE OWNED BY     s   ALTER SEQUENCE public.tx_activity_agent_activity_agent_id_seq OWNED BY public.tx_activity_agent.activity_agent_id;
          public          postgres    false    243            �            1259    107151    tx_activity_branch    TABLE     �  CREATE TABLE public.tx_activity_branch (
    activity_branch_id integer NOT NULL,
    fk_activity_data_id integer,
    branch_code character varying(20),
    branch_name character varying(100),
    region_code character varying(20),
    region_name character varying(100),
    active_flag character varying(1),
    create_date timestamp without time zone,
    create_by character varying(50),
    update_date timestamp without time zone,
    update_by character varying(50)
);
 &   DROP TABLE public.tx_activity_branch;
       public            postgres    false            �            1259    107154 )   tx_activity_branch_activity_branch_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tx_activity_branch_activity_branch_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 @   DROP SEQUENCE public.tx_activity_branch_activity_branch_id_seq;
       public          postgres    false    244            %           0    0 )   tx_activity_branch_activity_branch_id_seq    SEQUENCE OWNED BY     w   ALTER SEQUENCE public.tx_activity_branch_activity_branch_id_seq OWNED BY public.tx_activity_branch.activity_branch_id;
          public          postgres    false    245            �            1259    107156    tx_activity_data    TABLE       CREATE TABLE public.tx_activity_data (
    activity_data_id integer NOT NULL,
    activity_name character varying(200),
    activity_body character varying(2000),
    cover_image integer,
    policy_period_start character varying(10),
    policy_period_end character varying(10),
    policy_date_start date,
    policy_date_end date,
    priority_flag character varying(1),
    activity_type character varying(1),
    calculate_type character varying(1),
    view_number integer,
    summary_type character varying(1),
    org_all_flag character varying(1),
    position_all_flag character varying(1),
    policy_type_ord_flag character varying(1),
    policy_type_ind_flag character varying(1),
    policy_type_pa_flag character varying(1),
    policy_type_ul_flag character varying(1),
    policy_type_rider_flag character varying(1),
    rider_condition_flag character varying(1),
    view_type character varying(1),
    fyp_flag character varying(1),
    fyc_flag character varying(1),
    sum_insured character varying(1),
    min_insurance_case integer,
    min_amount numeric,
    active_flag character varying(1),
    create_date timestamp without time zone,
    create_by character varying(50),
    update_date timestamp without time zone,
    update_by character varying(50)
);
 $   DROP TABLE public.tx_activity_data;
       public            postgres    false            �            1259    107162 %   tx_activity_data_activity_data_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tx_activity_data_activity_data_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.tx_activity_data_activity_data_id_seq;
       public          postgres    false    246            &           0    0 %   tx_activity_data_activity_data_id_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.tx_activity_data_activity_data_id_seq OWNED BY public.tx_activity_data.activity_data_id;
          public          postgres    false    247            �            1259    107164    tx_activity_detail    TABLE     �  CREATE TABLE public.tx_activity_detail (
    activity_detail_id integer NOT NULL,
    fk_activity_data integer,
    running_no integer,
    min_value integer,
    max_value integer,
    award_type character varying(1),
    each_value integer,
    award character varying(200),
    active_flag character varying(1),
    create_date timestamp without time zone,
    create_by character varying(50),
    update_date timestamp without time zone,
    update_by character varying(50)
);
 &   DROP TABLE public.tx_activity_detail;
       public            postgres    false            �            1259    107167 )   tx_activity_detail_activity_detail_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tx_activity_detail_activity_detail_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 @   DROP SEQUENCE public.tx_activity_detail_activity_detail_id_seq;
       public          postgres    false    248            '           0    0 )   tx_activity_detail_activity_detail_id_seq    SEQUENCE OWNED BY     w   ALTER SEQUENCE public.tx_activity_detail_activity_detail_id_seq OWNED BY public.tx_activity_detail.activity_detail_id;
          public          postgres    false    249            �            1259    107169    tx_activity_upload    TABLE     �  CREATE TABLE public.tx_activity_upload (
    activity_upload_id integer NOT NULL,
    fk_activity_data integer,
    upload_path character varying(200),
    file_name character varying(200),
    status character varying(1),
    file_type character varying(100),
    create_date timestamp without time zone,
    create_by character varying(50),
    update_date timestamp without time zone,
    update_by character varying(50)
);
 &   DROP TABLE public.tx_activity_upload;
       public            postgres    false            �            1259    107175 )   tx_activity_upload_activity_upload_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tx_activity_upload_activity_upload_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 @   DROP SEQUENCE public.tx_activity_upload_activity_upload_id_seq;
       public          postgres    false    250            (           0    0 )   tx_activity_upload_activity_upload_id_seq    SEQUENCE OWNED BY     w   ALTER SEQUENCE public.tx_activity_upload_activity_upload_id_seq OWNED BY public.tx_activity_upload.activity_upload_id;
          public          postgres    false    251            �            1259    107177    tx_agent_income    TABLE     O
  CREATE TABLE public.tx_agent_income (
    id character varying(10) NOT NULL,
    period character varying(10) NOT NULL,
    region character varying(50),
    branch_code character varying(4),
    branch_name character varying(50),
    head_business_code_7 character varying(7),
    head_business_name character varying(100),
    headmn_code_7 character varying(7),
    headmn_name character varying(100),
    manager_code_7 character varying(7),
    manager_name character varying(100),
    agent_code_7 character varying(7),
    agent_status character varying(20),
    agent_name character varying(100),
    "position" character varying(100),
    position_group character varying(50),
    personal_id character varying(30),
    occupation character varying(100),
    occupation_group character varying(100),
    education character varying(100),
    education_group character varying(100),
    agent_start_date date,
    appointed_year_desc character varying(100),
    agent_age character varying(5),
    agent_age_duration character varying(20),
    gender character varying(5),
    working_age character varying(5),
    position_date_current date,
    position_age character varying(5),
    license character varying(20),
    license_expired_date date,
    appointed_period character varying(20),
    recruiter_code_7 character varying(7),
    recruiter_name character varying(100),
    recruiter_position character varying(100),
    manager_period_adjust character varying(10),
    manager_adjust_desc character varying(100),
    supervisor_period_adjust character varying(10),
    supervisor_adjust_desc character varying(100),
    premium_cream numeric(19,2),
    premium_pa numeric(19,2),
    premium_coffee numeric(19,2),
    premium_total numeric(19,2),
    premium_portfolio numeric(19,2),
    new_case_ord_ind numeric(10,0),
    new_case_pa numeric(10,0),
    commission_first numeric(19,2),
    commission_first_level character varying(100),
    commission_next_year numeric(19,2),
    premium_can_be numeric(19,2),
    premium_target numeric(19,2),
    persistency character varying(10),
    appointed_agent_amount numeric(10,0),
    keep_amount numeric(19,2),
    ov_supervisor numeric(19,2),
    ov_manager numeric(19,2),
    csv_created_date timestamp without time zone,
    csv_created_by character varying(20),
    _audit_filename character varying(255),
    _audit_filemod timestamp without time zone,
    _audit_filesize numeric(16,0),
    _audit_created timestamp without time zone,
    asst_manager_code_7 character varying(7),
    asst_manager_name character varying(100),
    position_level character varying(1)
);
 #   DROP TABLE public.tx_agent_income;
       public            postgres    false            �            1259    107183    tx_knows_data    TABLE     �  CREATE TABLE public.tx_knows_data (
    knows_data_id integer NOT NULL,
    types character varying(1),
    owner_id character varying(12),
    fk_knows_group integer,
    title character varying(200),
    body character varying(2000),
    show_date timestamp without time zone,
    start_date timestamp without time zone,
    end_date timestamp without time zone,
    status character varying(1),
    priority character varying(1),
    create_date timestamp without time zone,
    create_by character varying(12),
    update_date timestamp without time zone,
    update_by character varying(12),
    cover_image integer,
    approve_date timestamp without time zone,
    approve_by character varying(12),
    active_flag character varying(1)
);
 !   DROP TABLE public.tx_knows_data;
       public            postgres    false            �            1259    107189    tx_knows_data_knows_data_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tx_knows_data_knows_data_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.tx_knows_data_knows_data_id_seq;
       public          postgres    false    253            )           0    0    tx_knows_data_knows_data_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.tx_knows_data_knows_data_id_seq OWNED BY public.tx_knows_data.knows_data_id;
          public          postgres    false    254            �            1259    107191    tx_knows_upload    TABLE     t  CREATE TABLE public.tx_knows_upload (
    knows_upload_id integer NOT NULL,
    fk_knows_data integer,
    upload_path character varying(200),
    file_name character varying(200),
    status character varying(1),
    created timestamp without time zone,
    create_by character varying(12),
    updated timestamp without time zone,
    update_by character varying(12)
);
 #   DROP TABLE public.tx_knows_upload;
       public            postgres    false                        1259    107194 #   tx_knows_upload_knows_upload_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tx_knows_upload_knows_upload_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.tx_knows_upload_knows_upload_id_seq;
       public          postgres    false    255            *           0    0 #   tx_knows_upload_knows_upload_id_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public.tx_knows_upload_knows_upload_id_seq OWNED BY public.tx_knows_upload.knows_upload_id;
          public          postgres    false    256                       1259    107196    tx_newcase_report    TABLE       CREATE TABLE public.tx_newcase_report (
    id character varying(10),
    period character varying(10),
    region character varying(50),
    branch_code character varying(4),
    branch_name character varying(50),
    policy_type character varying(20),
    policy_no character varying(20),
    cust_id character varying(12),
    plan_code character varying(10),
    plan_name character varying(100),
    agent_code_7 character varying(7),
    agent_name character varying(100),
    "position" character varying(100),
    commission_first numeric(19,2),
    policy_status character varying(20),
    la_age character varying(5),
    effective_date_from date,
    effective_date_to date,
    sum_assured numeric(19,2),
    premium numeric(19,2),
    payment_mode numeric(19,0),
    last_pay_period_date date,
    la_name_surname character varying(100),
    id_no character varying(30),
    occupation_group character varying(100),
    occupation character varying(100),
    address character varying(150),
    subdistrict character varying(100),
    district character varying(100),
    province character varying(100),
    zipcode character varying(5),
    phone1 character varying(100),
    phone2 character varying(100),
    mobile1 character varying(100),
    mobile2 character varying(100),
    csv_created_date timestamp without time zone,
    csv_created_by character varying(20),
    _audit_filename character varying(255),
    _audit_filemod timestamp without time zone,
    _audit_filesize numeric(16,0),
    _audit_created timestamp without time zone
);
 %   DROP TABLE public.tx_newcase_report;
       public            postgres    false                       1259    111069    tx_permission_user    TABLE     �   CREATE TABLE public.tx_permission_user (
    username text NOT NULL,
    permission integer,
    create_date timestamp without time zone,
    create_by text,
    update_date timestamp without time zone,
    update_by text
);
 &   DROP TABLE public.tx_permission_user;
       public            postgres    false            �           2604    107202 '   lg_activity_agent activity_agent_log_id    DEFAULT     �   ALTER TABLE ONLY public.lg_activity_agent ALTER COLUMN activity_agent_log_id SET DEFAULT nextval('public.lg_activity_agent_activity_agent_log_id_seq'::regclass);
 V   ALTER TABLE public.lg_activity_agent ALTER COLUMN activity_agent_log_id DROP DEFAULT;
       public          postgres    false    220    219            �           2604    107203 +   lg_activity_agent_data activity_data_log_id    DEFAULT     �   ALTER TABLE ONLY public.lg_activity_agent_data ALTER COLUMN activity_data_log_id SET DEFAULT nextval('public.lg_activity_agent_data_activity_data_log_id_seq'::regclass);
 Z   ALTER TABLE public.lg_activity_agent_data ALTER COLUMN activity_data_log_id DROP DEFAULT;
       public          postgres    false    222    221            �           2604    107204 )   lg_activity_branch activity_branch_log_id    DEFAULT     �   ALTER TABLE ONLY public.lg_activity_branch ALTER COLUMN activity_branch_log_id SET DEFAULT nextval('public.lg_activity_branch_activity_branch_log_id_seq'::regclass);
 X   ALTER TABLE public.lg_activity_branch ALTER COLUMN activity_branch_log_id DROP DEFAULT;
       public          postgres    false    224    223            �           2604    107205 )   lg_activity_detail activity_detail_log_id    DEFAULT     �   ALTER TABLE ONLY public.lg_activity_detail ALTER COLUMN activity_detail_log_id SET DEFAULT nextval('public.lg_activity_detail_activity_detail_log_id_seq'::regclass);
 X   ALTER TABLE public.lg_activity_detail ALTER COLUMN activity_detail_log_id DROP DEFAULT;
       public          postgres    false    226    225            �           2604    107206 /   lg_activity_insurance activity_insurance_log_id    DEFAULT     �   ALTER TABLE ONLY public.lg_activity_insurance ALTER COLUMN activity_insurance_log_id SET DEFAULT nextval('public.lg_activity_insurance_activity_insurance_log_id_seq'::regclass);
 ^   ALTER TABLE public.lg_activity_insurance ALTER COLUMN activity_insurance_log_id DROP DEFAULT;
       public          postgres    false    228    227            �           2604    107207    lg_knows_access knows_access_id    DEFAULT     �   ALTER TABLE ONLY public.lg_knows_access ALTER COLUMN knows_access_id SET DEFAULT nextval('public.lg_knows_access_knows_access_id_seq'::regclass);
 N   ALTER TABLE public.lg_knows_access ALTER COLUMN knows_access_id DROP DEFAULT;
       public          postgres    false    230    229            �           2604    107208 !   lg_knows_history knows_history_id    DEFAULT     �   ALTER TABLE ONLY public.lg_knows_history ALTER COLUMN knows_history_id SET DEFAULT nextval('public.lg_knows_history_knows_history_id_seq'::regclass);
 P   ALTER TABLE public.lg_knows_history ALTER COLUMN knows_history_id DROP DEFAULT;
       public          postgres    false    232    231            �           2604    107209    lx_agent_token agent_token_id    DEFAULT     �   ALTER TABLE ONLY public.lx_agent_token ALTER COLUMN agent_token_id SET DEFAULT nextval('public.lx_agent_token_agent_token_id_seq'::regclass);
 L   ALTER TABLE public.lx_agent_token ALTER COLUMN agent_token_id DROP DEFAULT;
       public          postgres    false    234    233            �           2604    107210    ms_knows_group knows_group_id    DEFAULT     �   ALTER TABLE ONLY public.ms_knows_group ALTER COLUMN knows_group_id SET DEFAULT nextval('public.ms_knows_group_knows_group_id_seq'::regclass);
 L   ALTER TABLE public.ms_knows_group ALTER COLUMN knows_group_id DROP DEFAULT;
       public          postgres    false    237    236            �           2604    107211 	   people id    DEFAULT     f   ALTER TABLE ONLY public.people ALTER COLUMN id SET DEFAULT nextval('public.people_id_seq'::regclass);
 8   ALTER TABLE public.people ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    239    238            �           2604    107212 #   tx_activity_agent activity_agent_id    DEFAULT     �   ALTER TABLE ONLY public.tx_activity_agent ALTER COLUMN activity_agent_id SET DEFAULT nextval('public.tx_activity_agent_activity_agent_id_seq'::regclass);
 R   ALTER TABLE public.tx_activity_agent ALTER COLUMN activity_agent_id DROP DEFAULT;
       public          postgres    false    243    242            �           2604    107213 %   tx_activity_branch activity_branch_id    DEFAULT     �   ALTER TABLE ONLY public.tx_activity_branch ALTER COLUMN activity_branch_id SET DEFAULT nextval('public.tx_activity_branch_activity_branch_id_seq'::regclass);
 T   ALTER TABLE public.tx_activity_branch ALTER COLUMN activity_branch_id DROP DEFAULT;
       public          postgres    false    245    244            �           2604    107214 !   tx_activity_data activity_data_id    DEFAULT     �   ALTER TABLE ONLY public.tx_activity_data ALTER COLUMN activity_data_id SET DEFAULT nextval('public.tx_activity_data_activity_data_id_seq'::regclass);
 P   ALTER TABLE public.tx_activity_data ALTER COLUMN activity_data_id DROP DEFAULT;
       public          postgres    false    247    246            �           2604    107215 %   tx_activity_detail activity_detail_id    DEFAULT     �   ALTER TABLE ONLY public.tx_activity_detail ALTER COLUMN activity_detail_id SET DEFAULT nextval('public.tx_activity_detail_activity_detail_id_seq'::regclass);
 T   ALTER TABLE public.tx_activity_detail ALTER COLUMN activity_detail_id DROP DEFAULT;
       public          postgres    false    249    248            �           2604    107216 %   tx_activity_upload activity_upload_id    DEFAULT     �   ALTER TABLE ONLY public.tx_activity_upload ALTER COLUMN activity_upload_id SET DEFAULT nextval('public.tx_activity_upload_activity_upload_id_seq'::regclass);
 T   ALTER TABLE public.tx_activity_upload ALTER COLUMN activity_upload_id DROP DEFAULT;
       public          postgres    false    251    250            �           2604    107217    tx_knows_data knows_data_id    DEFAULT     �   ALTER TABLE ONLY public.tx_knows_data ALTER COLUMN knows_data_id SET DEFAULT nextval('public.tx_knows_data_knows_data_id_seq'::regclass);
 J   ALTER TABLE public.tx_knows_data ALTER COLUMN knows_data_id DROP DEFAULT;
       public          postgres    false    254    253            �           2604    107218    tx_knows_upload knows_upload_id    DEFAULT     �   ALTER TABLE ONLY public.tx_knows_upload ALTER COLUMN knows_upload_id SET DEFAULT nextval('public.tx_knows_upload_knows_upload_id_seq'::regclass);
 N   ALTER TABLE public.tx_knows_upload ALTER COLUMN knows_upload_id DROP DEFAULT;
       public          postgres    false    256    255            �          0    106964    activity_group 
   TABLE DATA           m   COPY public.activity_group (group_cd, description, created_date, created, updated_date, updated) FROM stdin;
    public          postgres    false    197   ��      �          0    106970    agpt_access_log 
   TABLE DATA           �   COPY public.agpt_access_log (id, username, access_datetime, access_menu, access_url, user_ip, user_browser, user_browser_version, user_browser_os, user_session_id, region, branch_code, branch_name) FROM stdin;
    public          postgres    false    198   ��      �          0    106976    agpt_agent_tax_rate 
   TABLE DATA           ]   COPY public.agpt_agent_tax_rate (agent_code_7, branch_code, tax_rate, data_date) FROM stdin;
    public          postgres    false    199   �      �          0    106979    agpt_inactive_policy_calculate 
   TABLE DATA           �  COPY public.agpt_inactive_policy_calculate (id, period, branch_code, branch_name, headmn_code_7, headmn_name, manager_code_7, manager_name, asst_manager_code_7, asst_manager_name, agent_code_7, agent_code_5, agent_name, "position", policy_target, premium_target, policy_can_be, premium_can_be, persistency, csv_created_date, csv_created_by, _audit_filename, _audit_filemod, _audit_filesize, _audit_created) FROM stdin;
    public          postgres    false    200   *�      �          0    106985    agpt_inactive_policy_detail 
   TABLE DATA           �  COPY public.agpt_inactive_policy_detail (id, period, branch_code, branch_name, headmn_code_7, headmn_name, manager_code_7, manager_name, asst_manager_code_7, asst_manager_name, supervisor_code_7, supervisor_name, agent_code_7, agent_name, policy_no, premium_can_be, premium_month, premium_year, sum_assured, last_grace_period_date, premium_status, premium_last_period_status, plan_name, commencement_date, la_name_surname, phone1, phone2, mobile1, mobile2, paid_to_date, current_agent_code, current_agent_name, current_agent_branch, csv_created_date, csv_created_by, _audit_filename, _audit_filemod, _audit_filesize, _audit_created) FROM stdin;
    public          postgres    false    201   G�      �          0    106991    agpt_inactive_policy_summary 
   TABLE DATA           ?  COPY public.agpt_inactive_policy_summary (id, period, branch_code, branch_name, agent_code_7, agent_code_5, agent_name, "position", policy_target, premium_target, policy_can_be, premium_can_be, persistency, csv_created_date, csv_created_by, _audit_filename, _audit_filemod, _audit_filesize, _audit_created) FROM stdin;
    public          postgres    false    202   -      �          0    106997    agpt_lookup_data 
   TABLE DATA           Y   COPY public.agpt_lookup_data (key_group, key, value, period_from, period_to) FROM stdin;
    public          postgres    false    203   J      �          0    107000    agpt_newcase_report 
   TABLE DATA           2  COPY public.agpt_newcase_report (id, period, region, branch_code, branch_name, policy_type, policy_no, cust_id, plan_code, plan_name, agent_code_7, agent_name, "position", commission_first, policy_status, la_age, effective_date_from, effective_date_to, sum_assured, premium, payment_mode, last_pay_period_date, la_name_surname, id_no, occupation_group, occupation, address, subdistrict, district, province, zipcode, phone1, phone2, mobile1, mobile2, csv_created_date, csv_created_by, _audit_filename, _audit_filemod, _audit_filesize, _audit_created) FROM stdin;
    public          postgres    false    204   g      �          0    107006    agpt_persistency_detail 
   TABLE DATA             COPY public.agpt_persistency_detail (id, period, branch_code, branch_name, headmn_code_7, headmn_code_5, headmn_name, manager_code_7, manager_code_5, manager_name, supervisor_code_7, supervisor_code_5, supervisor_name, agent_code_7, agent_code_5, agent_name, policy_no, policy_type, premium_target, premium_can_be, sum_assure, premium_status, plan_name, commencement_date, la_name_surname, paid_to_date, plan_code, csv_created_date, csv_created_by, _audit_filename, _audit_filemod, _audit_filesize, _audit_created) FROM stdin;
    public          postgres    false    205   �      �          0    107012    agpt_persistency_summary 
   TABLE DATA           �  COPY public.agpt_persistency_summary (id, period, branch_code, branch_name, headmn_code_7, headmn_code_5, headmn_name, headmn_premium_can_be, headmn_premium_target, headmn_persistency, manager_code_7, manager_code_5, manager_name, manager_premium_can_be, manager_premium_target, manager_persistency, supervisor_code_7, supervisor_code_5, supervisor_name, supervisor_premium_can_be, supervisor_premium_target, supervisor_persistency, agent_code_7, agent_code_5, agent_name, agent_premium_can_be, agent_premium_target, agent_persistency, csv_created_date, csv_created_by, _audit_filename, _audit_filemod, _audit_filesize, _audit_created) FROM stdin;
    public          postgres    false    206   �      �          0    107018    agpt_salereportsub 
   TABLE DATA           �  COPY public.agpt_salereportsub ("mPeriod", "mName", "mBranch", "mAreaGroup", "mCode5", "mCode7", "mPosition", "mSystem", "mNewCaseNo", "mCreamPrem", "mFirstPAPrem", "mCoffeePrem", "mFirstCom", "mPnewcB", "mPinf2B", "mInfP2", "mSecondCom", "mThirdCom", "Mgpro46", "Mgpro47", "Mgpro48", "Mgpro48A", "Mgpro50", "Mgpro51", "mSumOV", "aPeriod", "aBranch", "aCode5", "aMCode5", "aCode7", "aPosition", "aName", "aSystem", "aNewCaseNo", "aFirstYearPrem", "aFirstCom", "aFirstPAPrem", "aSecondCom", "aThirdCom", "aCreamPrem", "aCoffeePrem", "aBonus", "aBonus3p", "aKeep", "aConserv", "aBonusNewAgent", "aCreateNewAgent", "aSumOV", "aPinf2B", "aPnewcB", "aInfP2", a7, "mMab") FROM stdin;
    public          postgres    false    207   �      �          0    107021    as400_lips_pspempno 
   TABLE DATA           <   COPY public.as400_lips_pspempno (empagt, empno) FROM stdin;
    public          postgres    false    208   �                0    123753    biz_payment_customer 
   TABLE DATA           E  COPY public.biz_payment_customer (id, branch_code, deduct_date, bank_account, bank_account_name, policy_type, policy_no, bizpayment_channel, gen_giro, mode_payment, bank_date, upload_date, status_pay, gen_date, send_r_biz_payment, status_group, transaction_date, created_date, updated_date, value_hash, key_hash) FROM stdin;
    public          postgres    false    269   l      �          0    107024    dm_agent_income 
   TABLE DATA             COPY public.dm_agent_income (id, period, region, branch_code, branch_name, head_business_code_7, head_business_name, headmn_code_7, headmn_name, manager_code_7, manager_name, agent_code_7, agent_status, agent_name, "position", position_group, personal_id, occupation, occupation_group, education, education_group, agent_start_date, appointed_year_desc, agent_age, agent_age_duration, gender, working_age, position_date_current, position_age, license, license_expired_date, appointed_period, recruiter_code_7, recruiter_name, recruiter_position, manager_period_adjust, manager_adjust_desc, supervisor_period_adjust, supervisor_adjust_desc, premium_cream, premium_pa, premium_coffee, premium_total, premium_portfolio, new_case_ord_ind, new_case_pa, commission_first, commission_first_level, commission_next_year, premium_can_be, premium_target, persistency, appointed_agent_amount, keep_amount, ov_supervisor, ov_manager, csv_created_date, csv_created_by, _audit_filename, _audit_filemod, _audit_filesize, _audit_created) FROM stdin;
    public          postgres    false    209   �      �          0    107030    dm_agpt_period 
   TABLE DATA           l   COPY public.dm_agpt_period (period, start_date, end_date, finalized, mt011, ppyy, payment_date) FROM stdin;
    public          postgres    false    210   �.      �          0    107033    dm_as400_phpagmt6 
   TABLE DATA           E   COPY public.dm_as400_phpagmt6 ("AGENT#", agphon, agmail) FROM stdin;
    public          postgres    false    211   �.      �          0    107036    dm_as400_phpmpno 
   TABLE DATA           9   COPY public.dm_as400_phpmpno (empagt, empno) FROM stdin;
    public          postgres    false    212   2      �          0    107039    dm_as400_pspagmt1 
   TABLE DATA           M   COPY public.dm_as400_pspagmt1 ("AGENT#", agtitl, agname, aglsnm) FROM stdin;
    public          postgres    false    213   12      �          0    107042    dm_as400_pspagmt4 
   TABLE DATA           [   COPY public.dm_as400_pspagmt4 ("AGENT#", "AGREL#", "AGORG#", "AGPOS@", agpodt) FROM stdin;
    public          postgres    false    214   3      �          0    107045    dm_as400_pspagmt6 
   TABLE DATA           �   COPY public.dm_as400_pspagmt6 ("AGENT#", agphon, agmail, agidex, agacdr, agacum, agacpv, agfrnm, agmonm, agmrst, agspnm, agofnm, agofod, agofov, aggroc, aggrop, aggrof, aggrog, agidmg, agchil) FROM stdin;
    public          postgres    false    215   �;      �          0    107051    dm_as400_pspagtms 
   TABLE DATA           i  COPY public.dm_as400_pspagtms (agtnum, agent7, brnno, agtttl, agtnam, agtsnm, agtnnm, agtsex, poscod, agtidn, agtids, agtide, agttxn, agtlcn, agtlcs, agtlce, agtlcp, agttax, agtcol, agtfee, agtrsg, agtrsd, agtclv, agtrtn, agtrl5, agttyp, agtinc, agtphn, agtpvb, agtpvn, agtpal, agtprd, agtpsd, agtpdt, agtppv, agtptc, agtshn, agtsvb, agtsvn, agtsal, agtsrd, agtssd, agtsdt, agtspv, agtstc, agttel, agtcph, agtlid, agteml, agtbd, agtage, agtbld, agtedu, agtocc, agtmrt, agtspn, agtftn, agtmtn, agtrno, orgcod, agtact, credte, cretme, creuby, upddte, updtme, upduby, agtstd, agtsep, agtbkn, agtchd, agtrst) FROM stdin;
    public          postgres    false    216   #<      �          0    107057    dm_as400_pspslorg 
   TABLE DATA           G   COPY public.dm_as400_pspslorg ("SLUNT#", "SLREL#", slunnm) FROM stdin;
    public          postgres    false    217   @<      �          0    107060    dm_as400_pspslpos 
   TABLE DATA           E   COPY public.dm_as400_pspslpos ("AGPOS@", agabpo, agpost) FROM stdin;
    public          postgres    false    218   �K                0    115442    dm_as400_ultsagic 
   TABLE DATA           �   COPY public.dm_as400_ultsagic (agntnm, agicvc, iclvnm, dbgndt, dexpdt, cretdt, cretim, crbynm, updadt, updtim, upbyvc) FROM stdin;
    public          postgres    false    264   >R                0    107701    dm_ili_rider_master 
   TABLE DATA           �   COPY public.dm_ili_rider_master (policy_no, policy_type, rider_code, commencement_date, maturity_date, sum_assured, premium_amount, extra_premium, created_date, updated_date, value_hash, key_hash, pay_to, next_paid_date) FROM stdin;
    public          postgres    false    258   �R                0    111059    dm_newcase_report 
   TABLE DATA           0  COPY public.dm_newcase_report (id, region, branch_code, branch_name, policy_type, policy_no, cust_id, plan_code, plan_name, agent_code_7, agent_name, "position", commission_first, policy_status, la_age, effective_date_from, effective_date_to, sum_assured, premium, payment_mode, last_pay_period_date, la_name_surname, id_no, occupation_group, occupation, address, subdistrict, district, province, zipcode, phone1, phone2, mobile1, mobile2, period, csv_created_date, csv_created_by, _audit_filename, _audit_filemod, _audit_filesize, _audit_created) FROM stdin;
    public          postgres    false    259   �]                0    123710    hermes_other_channel_payment 
   TABLE DATA           �   COPY public.hermes_other_channel_payment (policy_no, policy_type, payment_mode, is_premium_card, is_notice_letter, is_barcode_sms, register_date, created_date, updated_date, value_hash, key_hash, case_type) FROM stdin;
    public          postgres    false    265   ��                0    123717    hermes_req_bank_payment 
   TABLE DATA           �   COPY public.hermes_req_bank_payment (policy_no, policy_type, payment_mode, register_date, created_date, updated_date, value_hash, key_hash, payment_cut, account_name, account_no, type_deposit, status_code, first_cut_date, send_payment_cut) FROM stdin;
    public          postgres    false    266   ��                0    123725    hermes_req_credit_payment 
   TABLE DATA             COPY public.hermes_req_credit_payment (policy_no, policy_type, payment_mode, register_date, created_date, updated_date, value_hash, key_hash, status_code, first_cut_date, cut_type, card_issued_bank, card_type, card_name, card_number, card_expiry, send_payment_cut) FROM stdin;
    public          postgres    false    267   ��                0    123732    hist_ili_rider_master 
   TABLE DATA           �   COPY public.hist_ili_rider_master (policy_no, policy_type, rider_code, commencement_date, maturity_date, sum_assured, premium_amount, extra_premium, created_date, updated_date, value_hash, key_hash, pay_to, next_paid_date) FROM stdin;
    public          postgres    false    268   ܫ      �          0    106961    ili_policy_master 
   TABLE DATA           $  COPY public.ili_policy_master (policy_no, policy_type, policy_year, policy_status, commencement_date, maturity_date, lapse_date, next_paid_date, fully_paid_date, pay_from, pay_to, product_code, sum_assured, premium_amount, extra_premium, payment_mode, payment_term, agent_code, id_no, first_name, last_name, birthdate, gender_code, card_type, title_desc, origin_desc, payment_channel, title_code, marital_status, marital_status_desc, origin, nationality, nationality_desc, religion, religion_desc, education, education_desc, occupation_code, occupation_desc, phone1, ext1, phone2, ext2, mobile1, mobile2, age_at_comm_date, annual_income1, annual_income2, laser_code, dopa_check_digit, monthly_income, email, cust_code, created_date, updated_date, value_hash, key_hash, branch_no, policy_org) FROM stdin;
    public          postgres    false    196   ��      �          0    107063    lg_activity_agent 
   TABLE DATA           �   COPY public.lg_activity_agent (activity_agent_log_id, activity_agent_id, fk_activity_data, agent_7, agent_title, agent_name, active_flag, create_date, create_by, update_date, update_by) FROM stdin;
    public          postgres    false    219   �h      �          0    107071    lg_activity_agent_data 
   TABLE DATA           �  COPY public.lg_activity_agent_data (activity_data_log_id, fk_activity_data_id, activity_name, activity_body, cover_image, policy_period_start, policy_period_end, activity_type, calculate_type, view_type, summary_type, org_all_flag, position_all_flag, policy_type_ord_flag, policy_type_ind_flag, policy_type_pa_flag, policy_type_ul_flag, fyp_flag, fyc_flag, sum_insured, min_insurance_case, min_amount, active_flag, create_date, create_by) FROM stdin;
    public          postgres    false    221   �h      �          0    107079    lg_activity_branch 
   TABLE DATA           �   COPY public.lg_activity_branch (activity_branch_log_id, fk_activity_branch_id, fk_activity_data_id, branch_code, branch_name, region_code, region_name, active_flag, create_date, create_by) FROM stdin;
    public          postgres    false    223   i      �          0    107084    lg_activity_detail 
   TABLE DATA           �   COPY public.lg_activity_detail (activity_detail_log_id, fk_activity_detail_id, fk_activity_data_id, running_no, min_value, max_value, award_type, each_value, award, active_flag, create_date, create_by) FROM stdin;
    public          postgres    false    225   1i      �          0    107089    lg_activity_insurance 
   TABLE DATA           �   COPY public.lg_activity_insurance (activity_insurance_log_id, fk_activity_insurance_id, fk_activity_data_id, insurance_code, insurance_name, cover_year, payment_year, insurance_type, sub_type, active_flag, create_date, create_by) FROM stdin;
    public          postgres    false    227   Ni      �          0    107097    lg_knows_access 
   TABLE DATA           �   COPY public.lg_knows_access (knows_access_id, fk_knows_data, agent_code, accepted_date, read_date, created, create_by, updated, update_by) FROM stdin;
    public          postgres    false    229   ki      �          0    107102    lg_knows_history 
   TABLE DATA           �   COPY public.lg_knows_history (knows_history_id, fk_knows_data, types, owner_id, fk_knows_group, title, body, show_date, start_date, end_date, status, piority, created, create_by, updated, update_by) FROM stdin;
    public          postgres    false    231   �i      �          0    107110    lx_agent_token 
   TABLE DATA           �   COPY public.lx_agent_token (agent_token_id, username, generate_date, agent_code, agent_name, branch_code, branch_name, position_group, "position", license, license_expire, created, create_by, updated, update_by) FROM stdin;
    public          postgres    false    233   �i      �          0    107118    ms_admin_manage_branch 
   TABLE DATA           v   COPY public.ms_admin_manage_branch (email, branch_code, branch_name, create_date, create_by, active_flag) FROM stdin;
    public          postgres    false    235   �i      �          0    107122    ms_knows_group 
   TABLE DATA           z   COPY public.ms_knows_group (knows_group_id, group_name, type, create_date, create_by, update_date, update_by) FROM stdin;
    public          postgres    false    236   J�      
          0    111086 	   ms_period 
   TABLE DATA           g   COPY public.ms_period (period, start_date, end_date, finalized, mt011, ppyy, payment_date) FROM stdin;
    public          postgres    false    262   d�      	          0    111078    ms_position_report_mapping 
   TABLE DATA           o   COPY public.ms_position_report_mapping (position_code, "position", position_report, position_abbr) FROM stdin;
    public          postgres    false    261   ��                0    111102 
   ms_product 
   TABLE DATA           6  COPY public.ms_product (product_code, product_category, product_type, product_name, product_plan, type, subtype, payment_year, payment_type, cover_year, cover_type, premium_per_suminsure, healthcheck_flag, have_wp, gender, start_date, end_date, active_flag, modify_date, product_line, saving_flag) FROM stdin;
    public          postgres    false    263   �      �          0    107127    people 
   TABLE DATA           :   COPY public.people (id, full_name, job_title) FROM stdin;
    public          postgres    false    238   .�      �          0    107135 
   st_product 
   TABLE DATA           )  COPY public.st_product (product_code, product_category, product_type, product_name, product_plan, type, subtype, payment_year, payment_type, cover_year, cover_type, premium_per_suminsure, healthcheck_flag, have_wp, gender, start_date, end_date, active_flag, modify_date, product_line) FROM stdin;
    public          postgres    false    240   K�                0    125064    st_rider 
   TABLE DATA           �   COPY public.st_rider (rider_code, rider_category, rider_type, rider_name, type, short_name, active_flag, modify_date) FROM stdin;
    public          postgres    false    270   h�      �          0    107143    tx_activity_agent 
   TABLE DATA           �   COPY public.tx_activity_agent (activity_agent_id, fk_activity_data, agent_7, agent_title, agent_name, active_flag, create_date, create_by, update_date, update_by) FROM stdin;
    public          postgres    false    242   ��      �          0    107151    tx_activity_branch 
   TABLE DATA           �   COPY public.tx_activity_branch (activity_branch_id, fk_activity_data_id, branch_code, branch_name, region_code, region_name, active_flag, create_date, create_by, update_date, update_by) FROM stdin;
    public          postgres    false    244   |�      �          0    107156    tx_activity_data 
   TABLE DATA           *  COPY public.tx_activity_data (activity_data_id, activity_name, activity_body, cover_image, policy_period_start, policy_period_end, policy_date_start, policy_date_end, priority_flag, activity_type, calculate_type, view_number, summary_type, org_all_flag, position_all_flag, policy_type_ord_flag, policy_type_ind_flag, policy_type_pa_flag, policy_type_ul_flag, policy_type_rider_flag, rider_condition_flag, view_type, fyp_flag, fyc_flag, sum_insured, min_insurance_case, min_amount, active_flag, create_date, create_by, update_date, update_by) FROM stdin;
    public          postgres    false    246   ��      �          0    107164    tx_activity_detail 
   TABLE DATA           �   COPY public.tx_activity_detail (activity_detail_id, fk_activity_data, running_no, min_value, max_value, award_type, each_value, award, active_flag, create_date, create_by, update_date, update_by) FROM stdin;
    public          postgres    false    248   !�      �          0    107169    tx_activity_upload 
   TABLE DATA           �   COPY public.tx_activity_upload (activity_upload_id, fk_activity_data, upload_path, file_name, status, file_type, create_date, create_by, update_date, update_by) FROM stdin;
    public          postgres    false    250   H�                 0    107177    tx_agent_income 
   TABLE DATA           @  COPY public.tx_agent_income (id, period, region, branch_code, branch_name, head_business_code_7, head_business_name, headmn_code_7, headmn_name, manager_code_7, manager_name, agent_code_7, agent_status, agent_name, "position", position_group, personal_id, occupation, occupation_group, education, education_group, agent_start_date, appointed_year_desc, agent_age, agent_age_duration, gender, working_age, position_date_current, position_age, license, license_expired_date, appointed_period, recruiter_code_7, recruiter_name, recruiter_position, manager_period_adjust, manager_adjust_desc, supervisor_period_adjust, supervisor_adjust_desc, premium_cream, premium_pa, premium_coffee, premium_total, premium_portfolio, new_case_ord_ind, new_case_pa, commission_first, commission_first_level, commission_next_year, premium_can_be, premium_target, persistency, appointed_agent_amount, keep_amount, ov_supervisor, ov_manager, csv_created_date, csv_created_by, _audit_filename, _audit_filemod, _audit_filesize, _audit_created, asst_manager_code_7, asst_manager_name, position_level) FROM stdin;
    public          postgres    false    252   �                0    107183    tx_knows_data 
   TABLE DATA           �   COPY public.tx_knows_data (knows_data_id, types, owner_id, fk_knows_group, title, body, show_date, start_date, end_date, status, priority, create_date, create_by, update_date, update_by, cover_image, approve_date, approve_by, active_flag) FROM stdin;
    public          postgres    false    253   ,�                0    107191    tx_knows_upload 
   TABLE DATA           �   COPY public.tx_knows_upload (knows_upload_id, fk_knows_data, upload_path, file_name, status, created, create_by, updated, update_by) FROM stdin;
    public          postgres    false    255   ��                0    107196    tx_newcase_report 
   TABLE DATA           0  COPY public.tx_newcase_report (id, period, region, branch_code, branch_name, policy_type, policy_no, cust_id, plan_code, plan_name, agent_code_7, agent_name, "position", commission_first, policy_status, la_age, effective_date_from, effective_date_to, sum_assured, premium, payment_mode, last_pay_period_date, la_name_surname, id_no, occupation_group, occupation, address, subdistrict, district, province, zipcode, phone1, phone2, mobile1, mobile2, csv_created_date, csv_created_by, _audit_filename, _audit_filemod, _audit_filesize, _audit_created) FROM stdin;
    public          postgres    false    257   :�                0    111069    tx_permission_user 
   TABLE DATA           r   COPY public.tx_permission_user (username, permission, create_date, create_by, update_date, update_by) FROM stdin;
    public          postgres    false    260   W�      +           0    0 +   lg_activity_agent_activity_agent_log_id_seq    SEQUENCE SET     Z   SELECT pg_catalog.setval('public.lg_activity_agent_activity_agent_log_id_seq', 1, false);
          public          postgres    false    220            ,           0    0 /   lg_activity_agent_data_activity_data_log_id_seq    SEQUENCE SET     ^   SELECT pg_catalog.setval('public.lg_activity_agent_data_activity_data_log_id_seq', 1, false);
          public          postgres    false    222            -           0    0 -   lg_activity_branch_activity_branch_log_id_seq    SEQUENCE SET     \   SELECT pg_catalog.setval('public.lg_activity_branch_activity_branch_log_id_seq', 1, false);
          public          postgres    false    224            .           0    0 -   lg_activity_detail_activity_detail_log_id_seq    SEQUENCE SET     \   SELECT pg_catalog.setval('public.lg_activity_detail_activity_detail_log_id_seq', 1, false);
          public          postgres    false    226            /           0    0 3   lg_activity_insurance_activity_insurance_log_id_seq    SEQUENCE SET     b   SELECT pg_catalog.setval('public.lg_activity_insurance_activity_insurance_log_id_seq', 1, false);
          public          postgres    false    228            0           0    0 #   lg_knows_access_knows_access_id_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.lg_knows_access_knows_access_id_seq', 1, false);
          public          postgres    false    230            1           0    0 %   lg_knows_history_knows_history_id_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.lg_knows_history_knows_history_id_seq', 1, false);
          public          postgres    false    232            2           0    0 !   lx_agent_token_agent_token_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.lx_agent_token_agent_token_id_seq', 1, false);
          public          postgres    false    234            3           0    0 !   ms_knows_group_knows_group_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.ms_knows_group_knows_group_id_seq', 13, true);
          public          postgres    false    237            4           0    0    people_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.people_id_seq', 4, true);
          public          postgres    false    239            5           0    0    tablename_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.tablename_seq', 1, false);
          public          postgres    false    241            6           0    0 '   tx_activity_agent_activity_agent_id_seq    SEQUENCE SET     V   SELECT pg_catalog.setval('public.tx_activity_agent_activity_agent_id_seq', 1, false);
          public          postgres    false    243            7           0    0 )   tx_activity_branch_activity_branch_id_seq    SEQUENCE SET     X   SELECT pg_catalog.setval('public.tx_activity_branch_activity_branch_id_seq', 1, false);
          public          postgres    false    245            8           0    0 %   tx_activity_data_activity_data_id_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.tx_activity_data_activity_data_id_seq', 1, false);
          public          postgres    false    247            9           0    0 )   tx_activity_detail_activity_detail_id_seq    SEQUENCE SET     X   SELECT pg_catalog.setval('public.tx_activity_detail_activity_detail_id_seq', 1, false);
          public          postgres    false    249            :           0    0 )   tx_activity_upload_activity_upload_id_seq    SEQUENCE SET     X   SELECT pg_catalog.setval('public.tx_activity_upload_activity_upload_id_seq', 1, false);
          public          postgres    false    251            ;           0    0    tx_knows_data_knows_data_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.tx_knows_data_knows_data_id_seq', 20, true);
          public          postgres    false    254            <           0    0 #   tx_knows_upload_knows_upload_id_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.tx_knows_upload_knows_upload_id_seq', 20, true);
          public          postgres    false    256            �           2606    107224 (   ili_policy_master ILI_POLICY_MASTER_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public.ili_policy_master
    ADD CONSTRAINT "ILI_POLICY_MASTER_pkey" PRIMARY KEY (policy_no);
 T   ALTER TABLE ONLY public.ili_policy_master DROP CONSTRAINT "ILI_POLICY_MASTER_pkey";
       public            postgres    false    196            �           2606    107226 "   activity_group activity_group_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.activity_group
    ADD CONSTRAINT activity_group_pkey PRIMARY KEY (group_cd);
 L   ALTER TABLE ONLY public.activity_group DROP CONSTRAINT activity_group_pkey;
       public            postgres    false    197            �           2606    107228 $   agpt_access_log agpt_access_log_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.agpt_access_log
    ADD CONSTRAINT agpt_access_log_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.agpt_access_log DROP CONSTRAINT agpt_access_log_pkey;
       public            postgres    false    198            �           2606    107230 &   dm_agent_income agpt_agent_income_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.dm_agent_income
    ADD CONSTRAINT agpt_agent_income_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.dm_agent_income DROP CONSTRAINT agpt_agent_income_pkey;
       public            postgres    false    209            �           2606    107232 ,   as400_lips_pspempno as400_lips_pspempno_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.as400_lips_pspempno
    ADD CONSTRAINT as400_lips_pspempno_pkey PRIMARY KEY (empagt);
 V   ALTER TABLE ONLY public.as400_lips_pspempno DROP CONSTRAINT as400_lips_pspempno_pkey;
       public            postgres    false    208            G           2606    123760 .   biz_payment_customer biz_payment_customer_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.biz_payment_customer
    ADD CONSTRAINT biz_payment_customer_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.biz_payment_customer DROP CONSTRAINT biz_payment_customer_pkey;
       public            postgres    false    269            �           2606    107234 "   dm_agpt_period dm_agpt_period_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.dm_agpt_period
    ADD CONSTRAINT dm_agpt_period_pkey PRIMARY KEY (period);
 L   ALTER TABLE ONLY public.dm_agpt_period DROP CONSTRAINT dm_agpt_period_pkey;
       public            postgres    false    210            �           2606    107236 (   dm_as400_phpagmt6 dm_as400_phpagmt6_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.dm_as400_phpagmt6
    ADD CONSTRAINT dm_as400_phpagmt6_pkey PRIMARY KEY ("AGENT#");
 R   ALTER TABLE ONLY public.dm_as400_phpagmt6 DROP CONSTRAINT dm_as400_phpagmt6_pkey;
       public            postgres    false    211            �           2606    107238 &   dm_as400_phpmpno dm_as400_phpmpno_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.dm_as400_phpmpno
    ADD CONSTRAINT dm_as400_phpmpno_pkey PRIMARY KEY (empagt);
 P   ALTER TABLE ONLY public.dm_as400_phpmpno DROP CONSTRAINT dm_as400_phpmpno_pkey;
       public            postgres    false    212            �           2606    107240 (   dm_as400_pspagmt4 dm_as400_pspagmt4_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.dm_as400_pspagmt4
    ADD CONSTRAINT dm_as400_pspagmt4_pkey PRIMARY KEY ("AGENT#");
 R   ALTER TABLE ONLY public.dm_as400_pspagmt4 DROP CONSTRAINT dm_as400_pspagmt4_pkey;
       public            postgres    false    214            �           2606    107242 (   dm_as400_pspagmt6 dm_as400_pspagmt6_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.dm_as400_pspagmt6
    ADD CONSTRAINT dm_as400_pspagmt6_pkey PRIMARY KEY ("AGENT#");
 R   ALTER TABLE ONLY public.dm_as400_pspagmt6 DROP CONSTRAINT dm_as400_pspagmt6_pkey;
       public            postgres    false    215            �           2606    107244 (   dm_as400_pspagtms dm_as400_pspagtms_pkey 
   CONSTRAINT     y   ALTER TABLE ONLY public.dm_as400_pspagtms
    ADD CONSTRAINT dm_as400_pspagtms_pkey PRIMARY KEY (agtnum, agent7, brnno);
 R   ALTER TABLE ONLY public.dm_as400_pspagtms DROP CONSTRAINT dm_as400_pspagtms_pkey;
       public            postgres    false    216    216    216            �           2606    107246 (   dm_as400_pspslorg dm_as400_pspslorg_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.dm_as400_pspslorg
    ADD CONSTRAINT dm_as400_pspslorg_pkey PRIMARY KEY ("SLUNT#");
 R   ALTER TABLE ONLY public.dm_as400_pspslorg DROP CONSTRAINT dm_as400_pspslorg_pkey;
       public            postgres    false    217            �           2606    107248 (   dm_as400_pspslpos dm_as400_pspslpos_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.dm_as400_pspslpos
    ADD CONSTRAINT dm_as400_pspslpos_pkey PRIMARY KEY ("AGPOS@");
 R   ALTER TABLE ONLY public.dm_as400_pspslpos DROP CONSTRAINT dm_as400_pspslpos_pkey;
       public            postgres    false    218            7           2606    115449 (   dm_as400_ultsagic dm_as400_ultsagic_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.dm_as400_ultsagic
    ADD CONSTRAINT dm_as400_ultsagic_pkey PRIMARY KEY (agntnm);
 R   ALTER TABLE ONLY public.dm_as400_ultsagic DROP CONSTRAINT dm_as400_ultsagic_pkey;
       public            postgres    false    264            +           2606    107708 ,   dm_ili_rider_master dm_ili_rider_master_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public.dm_ili_rider_master
    ADD CONSTRAINT dm_ili_rider_master_pkey PRIMARY KEY (policy_no);
 V   ALTER TABLE ONLY public.dm_ili_rider_master DROP CONSTRAINT dm_ili_rider_master_pkey;
       public            postgres    false    258            -           2606    111066 (   dm_newcase_report dm_newcase_report_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.dm_newcase_report
    ADD CONSTRAINT dm_newcase_report_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.dm_newcase_report DROP CONSTRAINT dm_newcase_report_pkey;
       public            postgres    false    259                       2606    107250 2   lg_activity_agent_data lg_activity_agent_data_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.lg_activity_agent_data
    ADD CONSTRAINT lg_activity_agent_data_pkey PRIMARY KEY (activity_data_log_id);
 \   ALTER TABLE ONLY public.lg_activity_agent_data DROP CONSTRAINT lg_activity_agent_data_pkey;
       public            postgres    false    221                       2606    107252 (   lg_activity_agent lg_activity_agent_pkey 
   CONSTRAINT     y   ALTER TABLE ONLY public.lg_activity_agent
    ADD CONSTRAINT lg_activity_agent_pkey PRIMARY KEY (activity_agent_log_id);
 R   ALTER TABLE ONLY public.lg_activity_agent DROP CONSTRAINT lg_activity_agent_pkey;
       public            postgres    false    219                       2606    107254 *   lg_activity_branch lg_activity_branch_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY public.lg_activity_branch
    ADD CONSTRAINT lg_activity_branch_pkey PRIMARY KEY (activity_branch_log_id);
 T   ALTER TABLE ONLY public.lg_activity_branch DROP CONSTRAINT lg_activity_branch_pkey;
       public            postgres    false    223                       2606    107256 *   lg_activity_detail lg_activity_detail_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY public.lg_activity_detail
    ADD CONSTRAINT lg_activity_detail_pkey PRIMARY KEY (activity_detail_log_id);
 T   ALTER TABLE ONLY public.lg_activity_detail DROP CONSTRAINT lg_activity_detail_pkey;
       public            postgres    false    225            	           2606    107258 0   lg_activity_insurance lg_activity_insurance_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.lg_activity_insurance
    ADD CONSTRAINT lg_activity_insurance_pkey PRIMARY KEY (activity_insurance_log_id);
 Z   ALTER TABLE ONLY public.lg_activity_insurance DROP CONSTRAINT lg_activity_insurance_pkey;
       public            postgres    false    227                       2606    107260 $   lg_knows_access lg_knows_access_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public.lg_knows_access
    ADD CONSTRAINT lg_knows_access_pkey PRIMARY KEY (knows_access_id);
 N   ALTER TABLE ONLY public.lg_knows_access DROP CONSTRAINT lg_knows_access_pkey;
       public            postgres    false    229                       2606    107262 &   lg_knows_history lg_knows_history_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.lg_knows_history
    ADD CONSTRAINT lg_knows_history_pkey PRIMARY KEY (knows_history_id);
 P   ALTER TABLE ONLY public.lg_knows_history DROP CONSTRAINT lg_knows_history_pkey;
       public            postgres    false    231                       2606    107264 "   lx_agent_token lx_agent_token_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.lx_agent_token
    ADD CONSTRAINT lx_agent_token_pkey PRIMARY KEY (agent_token_id);
 L   ALTER TABLE ONLY public.lx_agent_token DROP CONSTRAINT lx_agent_token_pkey;
       public            postgres    false    233            �           2606    107266 )   dm_as400_pspagmt1 mdm_as400_pspagmt1_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY public.dm_as400_pspagmt1
    ADD CONSTRAINT mdm_as400_pspagmt1_pkey PRIMARY KEY ("AGENT#");
 S   ALTER TABLE ONLY public.dm_as400_pspagmt1 DROP CONSTRAINT mdm_as400_pspagmt1_pkey;
       public            postgres    false    213                       2606    107268 2   ms_admin_manage_branch ms_admin_manage_branch_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.ms_admin_manage_branch
    ADD CONSTRAINT ms_admin_manage_branch_pkey PRIMARY KEY (email, branch_code);
 \   ALTER TABLE ONLY public.ms_admin_manage_branch DROP CONSTRAINT ms_admin_manage_branch_pkey;
       public            postgres    false    235    235                       2606    107270 "   ms_knows_group ms_knows_group_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.ms_knows_group
    ADD CONSTRAINT ms_knows_group_pkey PRIMARY KEY (knows_group_id);
 L   ALTER TABLE ONLY public.ms_knows_group DROP CONSTRAINT ms_knows_group_pkey;
       public            postgres    false    236            3           2606    111093    ms_period ms_period_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.ms_period
    ADD CONSTRAINT ms_period_pkey PRIMARY KEY (period);
 B   ALTER TABLE ONLY public.ms_period DROP CONSTRAINT ms_period_pkey;
       public            postgres    false    262            1           2606    111085 :   ms_position_report_mapping ms_position_report_mapping_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.ms_position_report_mapping
    ADD CONSTRAINT ms_position_report_mapping_pkey PRIMARY KEY (position_code);
 d   ALTER TABLE ONLY public.ms_position_report_mapping DROP CONSTRAINT ms_position_report_mapping_pkey;
       public            postgres    false    261            5           2606    111109    ms_product ms_product_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.ms_product
    ADD CONSTRAINT ms_product_pkey PRIMARY KEY (product_code);
 D   ALTER TABLE ONLY public.ms_product DROP CONSTRAINT ms_product_pkey;
       public            postgres    false    263                       2606    107272    people people_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.people
    ADD CONSTRAINT people_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.people DROP CONSTRAINT people_pkey;
       public            postgres    false    238            ;           2606    123714 <   hermes_other_channel_payment pk_hermes_other_channel_payment 
   CONSTRAINT     �   ALTER TABLE ONLY public.hermes_other_channel_payment
    ADD CONSTRAINT pk_hermes_other_channel_payment PRIMARY KEY (policy_no);
 f   ALTER TABLE ONLY public.hermes_other_channel_payment DROP CONSTRAINT pk_hermes_other_channel_payment;
       public            postgres    false    265            ?           2606    123721 2   hermes_req_bank_payment pk_hermes_req_bank_payment 
   CONSTRAINT     w   ALTER TABLE ONLY public.hermes_req_bank_payment
    ADD CONSTRAINT pk_hermes_req_bank_payment PRIMARY KEY (policy_no);
 \   ALTER TABLE ONLY public.hermes_req_bank_payment DROP CONSTRAINT pk_hermes_req_bank_payment;
       public            postgres    false    266            C           2606    123729 6   hermes_req_credit_payment pk_hermes_req_credit_payment 
   CONSTRAINT     {   ALTER TABLE ONLY public.hermes_req_credit_payment
    ADD CONSTRAINT pk_hermes_req_credit_payment PRIMARY KEY (policy_no);
 `   ALTER TABLE ONLY public.hermes_req_credit_payment DROP CONSTRAINT pk_hermes_req_credit_payment;
       public            postgres    false    267                       2606    107274    st_product st_product_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.st_product
    ADD CONSTRAINT st_product_pkey PRIMARY KEY (product_code);
 D   ALTER TABLE ONLY public.st_product DROP CONSTRAINT st_product_pkey;
       public            postgres    false    240            I           2606    125071    st_rider st_rider_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.st_rider
    ADD CONSTRAINT st_rider_pkey PRIMARY KEY (rider_code, rider_category, rider_type);
 @   ALTER TABLE ONLY public.st_rider DROP CONSTRAINT st_rider_pkey;
       public            postgres    false    270    270    270                       2606    107276 (   tx_activity_agent tx_activity_agent_pkey 
   CONSTRAINT     u   ALTER TABLE ONLY public.tx_activity_agent
    ADD CONSTRAINT tx_activity_agent_pkey PRIMARY KEY (activity_agent_id);
 R   ALTER TABLE ONLY public.tx_activity_agent DROP CONSTRAINT tx_activity_agent_pkey;
       public            postgres    false    242                       2606    107278 *   tx_activity_branch tx_activity_branch_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.tx_activity_branch
    ADD CONSTRAINT tx_activity_branch_pkey PRIMARY KEY (activity_branch_id);
 T   ALTER TABLE ONLY public.tx_activity_branch DROP CONSTRAINT tx_activity_branch_pkey;
       public            postgres    false    244                       2606    107280 &   tx_activity_data tx_activity_data_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.tx_activity_data
    ADD CONSTRAINT tx_activity_data_pkey PRIMARY KEY (activity_data_id);
 P   ALTER TABLE ONLY public.tx_activity_data DROP CONSTRAINT tx_activity_data_pkey;
       public            postgres    false    246                       2606    107282 *   tx_activity_detail tx_activity_detail_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.tx_activity_detail
    ADD CONSTRAINT tx_activity_detail_pkey PRIMARY KEY (activity_detail_id);
 T   ALTER TABLE ONLY public.tx_activity_detail DROP CONSTRAINT tx_activity_detail_pkey;
       public            postgres    false    248            !           2606    107284 *   tx_activity_upload tx_activity_upload_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.tx_activity_upload
    ADD CONSTRAINT tx_activity_upload_pkey PRIMARY KEY (activity_upload_id);
 T   ALTER TABLE ONLY public.tx_activity_upload DROP CONSTRAINT tx_activity_upload_pkey;
       public            postgres    false    250            #           2606    107286 $   tx_agent_income tx_agent_income_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.tx_agent_income
    ADD CONSTRAINT tx_agent_income_pkey PRIMARY KEY (id, period);
 N   ALTER TABLE ONLY public.tx_agent_income DROP CONSTRAINT tx_agent_income_pkey;
       public            postgres    false    252    252            &           2606    107288     tx_knows_data tx_knows_data_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.tx_knows_data
    ADD CONSTRAINT tx_knows_data_pkey PRIMARY KEY (knows_data_id);
 J   ALTER TABLE ONLY public.tx_knows_data DROP CONSTRAINT tx_knows_data_pkey;
       public            postgres    false    253            )           2606    107290 $   tx_knows_upload tx_knows_upload_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public.tx_knows_upload
    ADD CONSTRAINT tx_knows_upload_pkey PRIMARY KEY (knows_upload_id);
 N   ALTER TABLE ONLY public.tx_knows_upload DROP CONSTRAINT tx_knows_upload_pkey;
       public            postgres    false    255            /           2606    111076 *   tx_permission_user tx_permission_user_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.tx_permission_user
    ADD CONSTRAINT tx_permission_user_pkey PRIMARY KEY (username);
 T   ALTER TABLE ONLY public.tx_permission_user DROP CONSTRAINT tx_permission_user_pkey;
       public            postgres    false    260            '           1259    107291 !   idx_fk_knows_data_tx_knows_upload    INDEX     f   CREATE INDEX idx_fk_knows_data_tx_knows_upload ON public.tx_knows_upload USING btree (fk_knows_data);
 5   DROP INDEX public.idx_fk_knows_data_tx_knows_upload;
       public            postgres    false    255            $           1259    107292     idx_fk_knows_group_tx_knows_data    INDEX     d   CREATE INDEX idx_fk_knows_group_tx_knows_data ON public.tx_knows_data USING btree (fk_knows_group);
 4   DROP INDEX public.idx_fk_knows_group_tx_knows_data;
       public            postgres    false    253            8           1259    123715 (   idx_keyhash_hermes_other_channel_payment    INDEX     u   CREATE INDEX idx_keyhash_hermes_other_channel_payment ON public.hermes_other_channel_payment USING btree (key_hash);
 <   DROP INDEX public.idx_keyhash_hermes_other_channel_payment;
       public            postgres    false    265            <           1259    123722 #   idx_keyhash_hermes_req_bank_payment    INDEX     k   CREATE INDEX idx_keyhash_hermes_req_bank_payment ON public.hermes_req_bank_payment USING btree (key_hash);
 7   DROP INDEX public.idx_keyhash_hermes_req_bank_payment;
       public            postgres    false    266            @           1259    123730 %   idx_keyhash_hermes_req_credit_payment    INDEX     o   CREATE INDEX idx_keyhash_hermes_req_credit_payment ON public.hermes_req_credit_payment USING btree (key_hash);
 9   DROP INDEX public.idx_keyhash_hermes_req_credit_payment;
       public            postgres    false    267            D           1259    123735 !   idx_keyhash_hist_ili_rider_master    INDEX     g   CREATE INDEX idx_keyhash_hist_ili_rider_master ON public.hist_ili_rider_master USING btree (key_hash);
 5   DROP INDEX public.idx_keyhash_hist_ili_rider_master;
       public            postgres    false    268            9           1259    123716 *   idx_valuehash_hermes_other_channel_payment    INDEX     y   CREATE INDEX idx_valuehash_hermes_other_channel_payment ON public.hermes_other_channel_payment USING btree (value_hash);
 >   DROP INDEX public.idx_valuehash_hermes_other_channel_payment;
       public            postgres    false    265            =           1259    123723 %   idx_valuehash_hermes_req_bank_payment    INDEX     o   CREATE INDEX idx_valuehash_hermes_req_bank_payment ON public.hermes_req_bank_payment USING btree (value_hash);
 9   DROP INDEX public.idx_valuehash_hermes_req_bank_payment;
       public            postgres    false    266            A           1259    123731 '   idx_valuehash_hermes_req_credit_payment    INDEX     s   CREATE INDEX idx_valuehash_hermes_req_credit_payment ON public.hermes_req_credit_payment USING btree (value_hash);
 ;   DROP INDEX public.idx_valuehash_hermes_req_credit_payment;
       public            postgres    false    267            E           1259    123736 #   idx_valuehash_hist_ili_rider_master    INDEX     k   CREATE INDEX idx_valuehash_hist_ili_rider_master ON public.hist_ili_rider_master USING btree (value_hash);
 7   DROP INDEX public.idx_valuehash_hist_ili_rider_master;
       public            postgres    false    268            J           2606    107293 2   lg_knows_access lg_knows_access_fk_knows_data_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.lg_knows_access
    ADD CONSTRAINT lg_knows_access_fk_knows_data_fkey FOREIGN KEY (fk_knows_data) REFERENCES public.tx_knows_data(knows_data_id);
 \   ALTER TABLE ONLY public.lg_knows_access DROP CONSTRAINT lg_knows_access_fk_knows_data_fkey;
       public          postgres    false    3366    253    229            K           2606    107298 4   lg_knows_history lg_knows_history_fk_knows_data_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.lg_knows_history
    ADD CONSTRAINT lg_knows_history_fk_knows_data_fkey FOREIGN KEY (fk_knows_data) REFERENCES public.tx_knows_data(knows_data_id);
 ^   ALTER TABLE ONLY public.lg_knows_history DROP CONSTRAINT lg_knows_history_fk_knows_data_fkey;
       public          postgres    false    253    231    3366            L           2606    107303 5   lg_knows_history lg_knows_history_fk_knows_group_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.lg_knows_history
    ADD CONSTRAINT lg_knows_history_fk_knows_group_fkey FOREIGN KEY (fk_knows_group) REFERENCES public.ms_knows_group(knows_group_id);
 _   ALTER TABLE ONLY public.lg_knows_history DROP CONSTRAINT lg_knows_history_fk_knows_group_fkey;
       public          postgres    false    236    231    3347            M           2606    107308 /   tx_knows_data tx_knows_data_fk_knows_group_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.tx_knows_data
    ADD CONSTRAINT tx_knows_data_fk_knows_group_fkey FOREIGN KEY (fk_knows_group) REFERENCES public.ms_knows_group(knows_group_id);
 Y   ALTER TABLE ONLY public.tx_knows_data DROP CONSTRAINT tx_knows_data_fk_knows_group_fkey;
       public          postgres    false    253    3347    236            N           2606    107313 2   tx_knows_upload tx_knows_upload_fk_knows_data_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.tx_knows_upload
    ADD CONSTRAINT tx_knows_upload_fk_knows_data_fkey FOREIGN KEY (fk_knows_data) REFERENCES public.tx_knows_data(knows_data_id);
 \   ALTER TABLE ONLY public.tx_knows_upload DROP CONSTRAINT tx_knows_upload_fk_knows_data_fkey;
       public          postgres    false    255    253    3366            �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x��}KodG�ޚ��l/J��в/܀��,fc��h�� n�]e�0Y�j�m�b�%SErV�́H����Oq�9q�F\ޫ�WeFJ#�L232o��8�;/�ŕf�1�ś��z��?L���=L�&;[�V�Äl��[ͧ��N�?�����O�D����g������������d�a����b�?�<L~z�߅ot�0�~���ӽ������ar0��T��7������~������ѧ��OG�qvu�C�����a����-���'�E�zҘp5J��J�}����l�x��8�w�_�0�y������W�_m����>5z�4���߻�����n�������������������?��>�/������5��O�7�O�P�}������DX�Y申}���!{����_!x�����E�?���v�=�����Y����0y?��#>��#�|@y��/~y�L2��-X?�a����C�a��l�6���|T��:�E3%�f����|Kpά4i� �-|F�"�
~u	��1;0\����0<ƅ]�R�q�����:	�� 5�3�V^�/`���9,��n�}@�8��9!gM&Z��rq���g��Qʛ5���=�����^�C�u��âp�(�[��s�G����kݰu[�6�}���=��k]d
�~�d�Vs�ZDYse�������b9�};e|H��=�����x3p����w���w�;����.�z�Q��>��޻֚嫓|=L�|�a��69'�6�+��Ɍ�n+�m:=`RK�	��x��
~��~���8S�9���3�3�kx�_�~����̽:�o��~�=d��	�nL�sQ�%�G߸s\-��vi�V�<�{A�� *_�5��ӳB�B4�{�g�w�~���|1w����a�0�7�,Bq"�H�Ǧʹ�x�LP���i�Lߛ���Ǵh+�[�1(�;8�q�����yx�~t�+�o�&³5���#v�ǉ\�t�ͼ�C+�q;�w˘��(piQ��l�ܵ������t�v]i��Wt
�����c��֭S��j�u!^ޮB��c2��=������hp��$�*�ܪM�ޑX�|�Nw��
Ļ/���u:���?$�&��B�y��U���r�׋��6��v��(OՐJƧF������ߓ����pY��<4,p=���K:�?}��> ;��}�t���ܕ� Ǘ#b���� y^����[�U|N�\�F��|�����Ȣ~Q�*Mư���D�l��Ƀ9%{�h���7���S�#Y��F5����7<)w��A�Ddq�����e���u��I�Ɇ��n�ΉQ���5��_�;��ڿV)h�NA+3d�F�[!G��xO4���Е�'b�V�AGG3Q��{MlX +6O�sS^�:�n�����|�@"�_�OIEG�:RP�ҿF�*z5�D'�'�6Ƙ1�	����O�IX�(�"�%W������=�Y�k����Q#X�BR?T(������'��g���~�0��� �z5��o���q��I���'\>������Zi�6� �ާ#�΅϶y���FZ�`�&�{���͓�\�k�Bn����!�п��!�	��/�4%���d�^���+�_�O+o�z�.\
d㠭��n)��dW(ӹ(��Ȕ7�Ϊ�rmbM�6o�J3*�<]$qE��Z��E:-E��{�VU��=�o �mT��v'���߫P�sqMˑotW���H/;�*`�b��|	�T�9����Q���)�n*)H��ޫe#cZ�u�A>��i�^i2��fm�L��_����s�)���X�P�X�b�\ù�XS���dL�P�|L�\�a#��+�I	ޡ|�j���4�-��%�5��.�>��E7�Fr[�������6�$��B\;�9``�����D��������ZC�I���pWל!桛��oQ�l�ɜ8�������Ҧ��������\�/9�"u{���Ƶ���+��<LӢ2eM��$tyo�3�����ц`>Ss�2t.桗�@m��/��%���_x��b � �k�%ݪ�]Ȉ�H�W7z}���O�)\�9U� �>�]���	��jk����M���7E9�qj{u�֣T�^�3�3r򿦬��؎库nVs���%~��܎��ﲓ ^�HA������.O�yT�Ō�7WԧTs�r��K�ޗX����?�y�7����q0���:�KB��jD)��!7ϕr�&Ҝ�4��g�rҐ�G���1���k>�?S�2��S�ϝ��4ڒ�lw9�X.!��o��yx@�]��{.\�9h�s��_�-:&V�~_E��������E�B�LR9ͪ�'��eb�o~!j�O�ά��n�	���ð(�V/��<AG�B����%ŉJ1��	�ی�� �_����e~���,8�$�]��H�4Eƶ�W�pK��-��%��1=8��%n���E�p��9k��ՐA��jV-T�pM�M7}L��/��[�^�BG*$����	�+�&���9H���%�j���5��L��e�/ �pD�(.�χ��֏
�T���o�T��5��JwG�N��7h���%���-��V���"�Cw�<���-��m��3��.��R� �f0(�W�KKX�I9\Մ��mdX�,��&�W�<��Gnٲ��O�d�A����*�/�!�k�c��rK#~��H���,S��O^Q����j{æ� !b!�-	c�֪�-���m�D���ep�?���1����<��@�a?��C;)���bF���LzY��%z�r.r�~M�jd�����21�i�8�sס�V��MwkP�R����nZ*�*��c��]���<��$�_��C$`]bN��ˬa�	z�'-�Y�
r�jqA��,Df�}A�R��m�&邶��<݄n/r�j	"e�i0�6l�:�5�����$w�r���r�,5ż5,�(%&G#��X!*�=7ѕ�D�Q�UpSbAܻ�v�Ư�AXi�9Or��p����	�=bZ��
�{����j��tP�)��Y��vܧ����\}b�'�s��b�����I����؛��zoJmy�6n����ݔ��XSc�Kl�tI�7:b5jչ��%���m�ҭ�~}K��ڼ�Ԍv��WW�ޜj.�h	"l���n�ԺͼC��t�L�%��]�Ɔv�w�E��[���I�\̐�v�궱��%��S���Wdտ"uV���~�`-��+�H�IWԣ��K�8��/��߈j.��C` ��(��vc)uԣi����[�\����EK���KV�z��G��<X�(l7�{�	�I�Wm��pgĨ�S�[�5&[\W(չx�ť*�T��+� Mg�5*_����̧�*ۻ���$�96�l��lCL>���o9�1XpQ&��4S���~CG�J�Nښ[Y����e�wآ�j�U�7i`���3���eJiN׹h(��Cz8�鷇P�*F��C
YL٫i��8��� ��a���}��Tv��Uz�s1S���6���|H�����a�c�D�J;��빈+��m�+�e�i�T$x�$�Qٮ?�U��q����4)��-��sI%v�.�>	��d-Oª��m:�0Z{p�&u�6��cʗ9���� �s�Z��~j�8���~���7z�M>_��wI����B|�?*�M٧�0�tT�"�'�깈*Ø,�'.��G��	7����A����#:c Z�;mbV�K��Ij�H=�C�G��zPUY�ɥ�b����rGޏ�b�*ZZ�aBP����i��J[��^��0���\���L�g��3�ؐZ�a��@
��Mv�����xI����!��&O(9"*�EV�w[�a��A�s�YNy7�|�����w`�wIʘ�M-��PS
��&^g������j:�R�kf(�rTY�����}�Q���߾v���cm�Yʂr.j� ��t:������Se_n8\ƻ�:������
��J���c.��)ָn:��&c�/Ή0�U��T�����2���5:U�L�cbH��8�&DTx��E|-    ]�z01�{5Q�dO�M�+� *����r��H9����h��6K�)��r8�g8�ԍF�%���V�aнI�0sZ Ԣ��+��)N$:����FJ������VCv���k��o(�.D^���Ku��	p.�j~RT0z�̒ ��F�W)@R���;�à�"��\������2ͺ�B�1�U�[{Gɮ���P���s����{�q6�e��:gd���2����cz�@J��Y�9��������bʆ���5��+���d������ޣ	����.� 5�8cKxx�3����
܄�&|�pȡ:�X�	��8$N�"__���ۿ�������HO]�\�G���$x�};�o�#|�pV;�JrͲ�'���MD�B���9;#�6_A�گ>�=v�7[x���j�
g�|P_B�s9��ߤ�Mn�3x�-�Tn��*�>o$Yn�����)���n"��S�u^�۰K�R1�l��A���C��j�%�PB��P�fB�E�E�̗Ε#q}E4����x�b"�y���pV�����T�����yy�� ǜ㼑�A�6�{눔ͫ�i�,�]�~)")ο��U��J3��SL�F�d�'��0-)9E�G�%Ӻ���C�)���~���E��Q#8g���ވ,P�fEtrm��m�(����Q���Q��)�C�O��pI��5�i0��lx�֎(�q�i����JE��F�||P)oTe�B�*�7����}�c����3R��p:)�2.�42�N�����q��Zx�fW���5�Rz,E��X��-a0��La�"f�Mh*��,����4�QX��I�c� ���&똈�J���������5˞r`b�R&�&�\F������U6�o�nIv�Wӊ&�U vU��gSl�U���Q���2F���E�xF�;Ҁ��Epa���t.\��K*��c#&)�ZOkz���~�re��>��y�|���y���<�
%o��|�ke�-����<�O6�Qj+vg<�%~ �ߓ�0I\2�5˜�i&q�%��S���6�$u7$6"���d�%���E�y������a���,ٚ�Fެ�~�/��wrr����C��2m�^���?ˤE�h��jeZ�X��s't�(��Y ����-u��r�U]Ccs'��&D=�s,�z3��TR���m���+�KZ� ��
 �~Y�1��-z�e��AZ+����2���<���2LH� -��4��'��`�f�/���Ҷ�������40e����H5�ϖ��d�9�� �߂юg4�l�������S�g.#b1�^�1��ˇXЅW�3��)t�����x7�ٜ+��M`,��* ��$a��Ă�^��6+�{����6���1���`���M��Q̸�Q�ǾG�tG�겁�Ĳ
�R��t�Q��(����P�.2���0n�E���%�@�R*)���}�:����ɥ��
�����H�1���<ƕa��e��Ub��P;��Ual	���땢��˳��G��I�����;hΰ�T��M�X֭�N2�ĩ�io�͸���y�6Z�����=v�⩤�����s��R7� �X�-*�YUhS1h
���7HY��H���MB��	hIP���X�y4�X�%�{,�,o,�����N(��2%���&�C?R���v�VXa{[��T*�
j��Q�3�]���Oڶ*�� �`rC�>?a�g���Օ������0M>�u-�S�°(V�����)��ֵ5���F.{�T,y50���A���☮�I[4`W�֛瀗���tf�� ��ȕ
\�7��ż�!ZA�p��B௳�����i�ۑ	A�Oi���:���0�/����mz�1��$H���!���9��-c	�Y?.:n����
���8��fc9��v@�=�aڭv���W�����aeI"�P�~�{�k�iN��o����r/�dy,9�i(����W4���睲@�헿�E��q�<�+��nX�xD����%:+�G���be�Bpz��a�G�kdu^�l��:���C�Y�f�b���xA0�$�;�)Ņ��]����ʬ�]��Se�Yf�|O���@��N����:�����=�<���۩Xn��.�U^��s���]0L�HSf��*��$+��in5��c�g��
^�Ψ���QL�TWK�;c���k���˲��&��ż��؁SlX~A��3���u����lTe�c�f�	ׂ��v��qf�P8KL�Ƶ�;1����ٸ�u�D6f�1���rȩX�Rc�U��q�>B�D��v�j#L�	�%�(����m�%����΢̯Q�hK}C�iiO ��(�� ��uq(�g	e4f�qj�&�	�v55�v��1V�?�f�1���"�Z�F��+{H\��Y�1�k�����W��K/ ^Y�������'�6�+<�5w�C#D�<������������?�vQ��v=4�`�E��m��������)Ҙ����K�I�PV�-ݸ���~�ηS��8ƅ�1�g�0u9�g��,��h\����fǎ|�[�3��s6�d<j�9�r���m�����'`����V�Oh��Ot����/5N�V}��eW��}�8�v��8|���(�k�.8��-\�N
���8���u��i��d�s�΅��#R�t{��k>�?S�Ի�L>q��4ڒH-�=I.����'�)
jhV�Z�%1J�ݚ�H��Y|ܠHH���-t2r�3�p
�;�:o�I����j:3���a���a��l�����roz	=eJ���zU\�iXN� ��&D�߼��~EV�D��4p!>�<���{XE�F�<f��yD����gh@��=��$�T�ȥ��O�b$�	�x�5�D@

���T���2�@�ղ�j���[Ь+�`�#�S�E�V��a��<��?�)�Y]ߪE:H�A"��,w�W��.�uې���0�6+{�!�����B�U������8�r��̯	xV�Sn܌ι��YP����KX�-Xi�9�|2͸T^o���o�5�5��cT�n�@��yۀ+,5F?m�zK��s�^�@sZ���a�Y1�;{�G�9�l5���c	k���b	�+i�b�-��á#5w��rU7�u���y����|,@�;i����ԥ�dx��|�S�-�x����ZH�(�in���7�+�r%R��	q��h����V`�sV?�gEL�^N��P��H�S{�󎰩#|�m�_J������U��P�-b�P�T��6L^[غ�|eʍ�>��{�H�5�{�G�yT��-m�����T��IF������w�I���fb��r��c����T*��],�������T�n)�������︂0BRR��& ����J-��|�%�G��S9������"34���ff6D#����H�3�U�+�=A��3S������r�;/�5E�Oi��yg�OLځ4A΄RU�K���j��Rb��λ�4V��M�Č�F5a��c��6L$oj?�]�hg퇥'.���:X�X}T,� ,��`љ;�=eG�7M[�X�T,B��P�Bh�Zv3`�(cW�(z�]�a'1Mh<¦�P���r�]4�9U[S1cSM0��l��߬�����}�|���R+�/ Jqun�/ƹ)B�5�d�����z1�u���Wh�o��&MnRV��D���LoQ�?y�fU�Ѷ[}M:��<wkپ~���涇ғ�2���h���±~5�+бxN�tUŠ�# �+N���?�{;��p^|�HU,6��
�̏j��k��ݖ�v[�ļG��E�Ga>����V*+6� ��ż�-K��Bu�nK�o�ԛ��|�_���Kn��:\l(p18�ګh�f\��6�s��,\l(�q�3��Qjm�H�&_����$q�`��D�!��ۺ��$!Qq�^&�z���98a7���8.�@���S�6�Ȗ��%��{3 �  ̚	��cC��ypne�˙5��A�4�qr��H�w���n]õ6�VǻJ�+������������hg�(;j�T���%�7~7�m��{����U
��y���µp�!s�ǧq�S��v9	�������B���6��Q��w2N �O��P��xҙ~�r�O���n�[L�̲(E�o��dX3U�Z�x�C>��F�'���YS�e%��r�B�c�ͪR�t����G���`l�������x�W��&?=��1��ie�2�>{z�F끂�v���h��Z��t<���3�ed�5�B�Ke�줞���f�)�s�[����s�3i�$؞�ZKX�wF0���.9��Ռ���y�ʜ��D�Mహ�ZB|��&UMg�l2z���_il��,L�,=��tL�.گ�t�����nj�g�&���g�
�6���U�%�X����kxY�;����n5I5v��Zf��_��.�ވ�1���9�u��˥�ތ�@���"��]�GwP����<��e�]����:V&���+�ಯ��.K��T����+�+ƌmR0���3�@��c��+T�)���%����א0�??P��O��7�)���N3��'&e�MJ�&E�/�[�T���i�`u���Y�>,�������L�V�r�]�e�h�%0�,U�v�Yj�4��8����_���S���53�[5�d��Y�	p�0�I�GO���K���~B��i�Q�;�p�>SR��<����k�� T �/~�u��E��t�. G~�{7g���M�H���y��o)0NʇW�*����d�K
3P%���b��l^=�|B�P�L��}�W��K��Ou��\ts��*�Q�DO�j;"������]�^Q��>R[�p��"��\Cw ���2\9�B�D�5 </�j�	�;hSr~�O���DJ2O�Ļ[��I}�-�Z���B���?Y��u�vZItZ��4��8o;�����⨮2V5Wx�^���0�i���ƴ�4�3S un/ƿ��j�P�+R ����	�6�HQ�5C�'N����[U)c�c}bp�M~iG��l��ᤖ"F��
0��8�Ԓ�x<N�b��Ԓ4Y�'Tk��7�7(ٛ�saZնN�C1E0U�x7�N�^Ƽ�'ە�\x+�/;#���g�T�ܨ�5��^�.۟�v�ZX�X�1.�f�ПC���A���Hy,ꎅUm��2|a�ql��W�ڣ7��ʆ�d��/g��
B�_r��G�V�>�n��ў� �e�:�:������e�ʱ�����؁��R>�dy��Vd���=�逗p��.���/���_ =�2`�5�	-�UD�u֐�R�o���a�Ƙ��:x\ +v�Ee�y��x�h��p5p�M�PiiLP�M�!��>�os��2��L�֒D9���[݀���~wiX��.��Ϳ��� �/���꣬���^�PK������3�n��J�"�7_Ý�UХaL��R7qnF��Q
δ!2j������f���W#�Ϊp%:�4�$b�1>N����z�%F�El(�%s���$���"e��c t*��mx<��� ��� :���h���73���ɬ���Z�},�\�H���y���<爯I1��L�E<��>��Wi�Xm>�~�5M�]*U�����Q|Һ����+,�vt�hK�%9t�e}�C�l%���I]%��mCaH)��	�=���i;�ΌVM&�#R���m@q<�[f}=�1r�$�E��"Jb4��#-($��M�ι����B�i���H��5@�L�θZ�D�G��\m��.ϩ%�=76$!�l���אz�(ߎ�^1�EJZ����0&���6�'�chY���ق��r5S�y7]�2֮"���r�����_`�s�V��j���ʮ�F�M���0w��:h���k�0y��x91�~ݠ@t�m��$�i�e׋��.�	�>�������}&�����U�iI�za"��m��%3SaD����o�U�;l���5�������zW�0����"� D6yk8��h*������X"��-�'�>���`�0���VTg�L����4جg �h4�`~��!;^��}�����D�֫	������(V[s3m'�Zab��&�[�6��<��� +�`�3U��R��m����v�a�y�zU���Ծ���5�D5ܛ��T�fhq� H�s��D�0y{�tl���&��/�1�ک�ВɆ	]�XB��mD��@�r��z����Q�uh6)�M���ǜ5�r}HI4�;������ϫ��ͮzT��4*eEY�׬fle�]W
�mc&���⬊�9H�k+ﳛͫl���'.iJx��NKu�F�c�^�5��S���K�ċ��+cաe��Հ����I�]R)�Th)"ya�� ��"�ÝR���c��3,4��'�M�z�h���!�2�=Y�o�˄D��~��"��D�߄�R�����FU��4����J�N��*�-����ߐJ�e���^��m�_/�c�R�X�B�)���faa[{�	�ټz����)�K�eLØjni�&G�5�27�$�]��g�[P��
�V3��n6��bz�Q��DE��*���l�}eg~�{$R��9kmTȯ��v�Ve���M�{�5�(�˹�+��:(�,�@��.ھ���%N�x����o�v����a�AfӉv#l���5�X�h�#��ZpN�75T9�y;��Ktq�	ļ�b$7�h�Mgڍj�e;e��J�Z�����C�P�&[���j.���k��p�δ%���ŗ0�g�iN�<����k��NG�-
��1��4�������Q���M���L��}��cC��>������U�S[T6��7��*®*Q�\�����	ӢaNQm8�t�(��)Kc��qR���1�B�F�6N�?��'���zR3      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �   �  x�5T�u�0;;��������d�9E�Hr�-5��<$Ks�/TܼV���%����e�Js?@�WY�)�{������M5`ľl �KwT^���3�^:��K��d��!�e/�6#��X�f�bP�);h���en_nT�C�|@<3�T�i�OLk'�C-��?W�ѫ��m0E]�9G/����B�N�L�Q �H�𪾉g�ߊg[�2� �J���!�I ���@Ed:ȖS�  �K��	�H�PZ*���%�N��^�E���U���R�0O0��[q��V�a��o��$o��`
��U���t�=�*)_��s+6�JR��Jh/tG�<����L�i����U�}��6���>32%��?���������翐>ޘsM*۟�!�:ꎄ���m}�aD9SD�ҥ���ښv�!�=���e�)!�ؼ�p,,������]qC �L�kБL�Z���뇜���1��l�Gv��n��-GQ�d�QX���&IԱ{m˦Q�8��`{fk?���	�JP�!Q$�hE��;�Q7$�סg�ysLO��mU�ی1�U��,���ss��$�!XP7��`���Mܙp� o0������Ξ�Ʀp��ߟ��� ��9            x������ � �      �      x��]Ko+Gv^ӿ����9�~,��I��� �"	������k0e���ΐ� [��+�:��J�Ωj��d�z�����jvUW����y�Ѻä"���C����g����p6�Ϧ�p|��IHg6�0�Nfӏ���p�?��_f���t<�Ng�����)!�u��I��ϳ�>�s���kޅ�����+���!"��.;�M��#|��'��Ь3{x7��~N��=4��=c'��?�������2���8�w��G�]�������ͦ7�$�����~�O���Ȱ����e�N8�=8⎠��;	���-W5�M��a��>3�4m�ι\��7t5]����]pb�.n�����q������z�Z��fH�X'~����@�ZTd�b}������c�_�{�;x�� %�|TtDC�-
Jc6�l��߿³z���Kw���o(-��0Vlzo������#MG�[����&�M|��e���{�D'��+)'Ђ1
����`Vf���0,�Z���_���􁔗��(]��Б���< �/?�x�/}8��?>d��3���V�A�2՜�;X�G�h*�p��`��.�6wp�����q�)���|�.:���Ο��]��rV��W�L���M�#
���skm��-�0j=_��[���)�;i?'q���� NW6��Nԍ�s���|�5�ݕ�j�ד�i�	S����,P-�\�V���s�Wk�1���4��0W���d������]���5\q�x C���c����|Dt��=4Xf�O����>g��Hϡ)����?w���-�i�-�ia5�kJpZ����c��7̚��Dn�gA�j�g �8�}W1ϡ�k0���e���M��%���6
��![�B�>��9�����(�ࣖi`����FՋQf��Q��#�Zi���.�O����F@Y!m��s[���(��0?E;�4�*&�[�I^���q�Z��.*U@� ���,
�x�����wcy'��`��H����@�S �`���syoӬޔ�S����@��Mv�E�S�A�" h�y$��)�U���y�i��(���"R�k�)%�>߀�������"�BK��ʲ6���bL��=���f�~�q}����y���g�����ַ㷏׷_�k�$�6V[C_7 ?�*�:h2L���+/��ؘ|��c�y�K����'z���5��2�5�8�St<�J4H�<� ֡�����1X�ɹ�:�u��k
C�>��_��M5!K�,�=��Ug�>�e�ޥq�y�ڠ-5�eȾ� ���{��d����v����@U:{;%}�j  ��-3��-�h�n�n6�/b?��nʽe���y+����k�'��Gi�ho=o�/lk��tz� ��j@�Xw��)��R>?�c�6�h�K��ED\��]Ƙ�AUO�i�U�U�>�A]��� N:��C��|,�Mh�4[��̀�����O).����bv��ܺ�m�l2)t�v�96�B�0�b9����{��u����4����J��Lu2�y�?'>by�3K:ИѫL�G�}�a��,wr�](�e�y/����$d7�z����y�� �CR��<�v~�wUGi��Y?�t��}�!�C^�$�����Y�<�m�C���Z\�ϣ�{ߍ�������2��$�͋�����rpU ���4�*}lE�G �e
`�^�i�q hLuR�3�jo�çE�\�0��Ɔ�<�.k��.�YZm��4K��+y��h������ �nÓ���[>7��r��# ������-�޼(��L���X�AAΉ�����ݵ�����]8uW��ƸR�>t��l�qq����ٿ����F_�*�I
���o#�	ft�e�3���!�����X�^J�˟�������]Hp$�������q\��,��;W�u�S%���p���<l?fGX�~5)�_�9��w-咭_sD�j��5�3�t^����)�-X��l�a�x�I4�^}��Sw�u�4��#�b���wh��3Pk�fڀ�Ib�JMm�� {Zz�P�A�Y�UXږ��P����W�1�-�EjA��x�pg�"�CȆʕ<@H]eT��Uw�F?�[`֩L��u_/��Hq0���Me�(�i����/�x�����Z�(��4��CCV��$�(�p��}���4���4HȆ��ܚB����㌜$2=���6\�p`xU���,�N兂8����)�Z̓OY� X\���1X���,]!yC��
B�2�8��E�"$&F_욟B��I.�����o��%�ش~�PM]L�P!,��5�v;���:��F����b��2;j�f�C��	[yļr(h�2�Q��&n(.3�+����%'��	�H�e�B��+�Y88�2���YIi�o19���X]�M����}0�׋��"��%����q�m����O�r���g$���15l�
�©0ه�MIZ���"D�	�ت�PB5U�x����*?�qZ��x��8�[��
&��"�2)Bz�f��j%�`޸�`���_�?�����G��ꋄ�?Ǭ8w�O~]&R�|c�����AdI�$5��"��]��gD0��C�,"�WP�H)���AĊ���eo�R�����w�$��^Ѹ=r����Y��{�5�*o
v%�om�4�/f��E�4�+�I�4���:�Ң��mPFDOBy��Z�P8<Y�����͉:֧
q���]8�1�_��?C��V-��​�	�w�C.�hj�ē�� ,]-�}��_�z8����X��/�:�&pfA��>5~�ӐX�a7��n<%$���2�!�eLOwI���㨅��ӛ���`�j��U����jW���Z $���2K���'�F�+�2���g>,�M\�*,*�UG��:��5S��&���$�R��Q��Wd3��&���x�`����
bd<��S�'�P���Š����1�u�Q�`4��VG��n�i�YL˞�L�TʸL�q��'�����
�K�삛á����;lp#J������D��M�������a�*���+��+�"K�����u��� �a� �I�W�3j�.��
�m.%�9 �6�!��z��q*������pl� 4*!V9��m���l�[ܝ�X��AI������<�s��\E4ϘL�A�+7��Gr@c$�G�}�%'Q ��M�P�n����m�\��AIB=��0��^r��A�� E�1����I�#�z`p[ei����9�юBW�f���m��tCxH�-���HI|��B��e\�U��C~����+ ï�7l!�6�ɒ6Չ�3ٗ�`�GK�(�:p�Q�&����N�Q"*���/5jfr
�����FFdU9��V�����8w2�1��+z�����+"��&�ԭC=_c0�����@󕑭2��ۮ,1�ir�f����X�ۡ&��}ج/��>����SnW ����W�1�"�]p��.U��咢��E�'�Wj'�����x��� Ar�O!���(��BnA�c���=�M�2S�~�� ���{Tl?�Eh�,n���'���P3�b�IS���N
T���R�bѾo!V� fT
'*�4Sњp������x���N�^4߀��ڍ��L�/8���$֏{@��e�K����a;��a����(n�C��z�Nc�7U�|N��NR'Rgj���Jڇ��9L��.�M/F ��ِ��6%�I����KC�aύ��Z]ؤ��W�v7�Q˽ė�~>b�&�M-O���po�����`�G�����;Ӆ+��ap��8��c��P_�K !��
ށ��e�]����ǵ1��o˃�]��@�w�z@{7n(ڏ�Q��4P˩,�@�T���bO~_?���H��1;RlN�6��}Ȝ��B`>:z��� ��;9�N/I�*��D�Yȕ�L�	"G�.�kgtko5([_nT����L�
d�u{D���9u�߶	o�L�5�:Cmϩ�bpVU4 D  ���Բc̢��Մ�#8Ư/�)R�����|{+��+���oi�`X�g�9�aۋERc*jn�/v�=�9RX���"��v��i� ��T�"�I�ԥ>~�E��+��'��y�9u|[)��EUE�Ә�v}=�u�t/� f�`ں�ƕ6��>��I%J|��x����Dv$�0F	e:��b�J���
B�B�dEr�����U�Q�V%6� �e0�l-�� D.����6�UQގ��0��3	;q��a��O�����q��B;6�
��p��5k��ƷU��Q�
���Ι�ⰴAվc!#%b{X�:�^�X}����8&hh�b�%ܖ�[��t���U��62���,��j6�N$��}O�J���)����5)��@��H�C_�S�6�(A����0 b��0�)���� w �0�r�]*���?��|���]��&�3b�Z��H'EP��d�V'�n���	E^۹f��M���C�!��������҇3cb�Fq�u��?o[�����i��Bj������hY
E��b<�=Dԏ�]�|A�о&&�����xi����xql���L�sH�Z��,G��Dg-Y�#���d���. .Xxe�P����0�2w��_U)6�K�W�ZoLsL����^G&�
6#���X��5��C�8@N����|�X��%.�������T�M����s����dWfY7A��ck�e�>O�� ձ�D̈Ix��i��t�[z[$�a�D�L� jZ��.8����p���&�_{8P��6n��C�x�F��8�~����Z�u��\�7-/y9����x���e�d�
����5�"�UKxƼ���JEs���M�U}�E����%�8�1�V���翶�[�F*h޳���)����Q$��-�0�1K���m5;�� W�Rixlg[OT��BTH�R��J�`(��I2*�;NCC����c�*Σh�ư-�xGN���۪ć��v��E3�[��`������CTq[�~���C�+���"����9�F�~ӛ؏�2&Q�&�r�����Ջ��?hֈ^D�-���jEO�<��l�7G���	xC��#�������B��e��$��eQY��qE�U�s��<��J�*��`��ZV��ȣd����#��~�l�}�����GVKP���b�U�7��5L(Q����#�qp�\�U�$��^�2��>LW�f��O��x$,Vz��D��W��a�9�0�+��_��T��h��<1�VU/�'� ��a�J4w�xR�q�[<����9L2���[(��B�"+,���2��~����!�;���%�ng�5�=��(��]�N"Ά�Y�rьT��H:mԉ��F\�zJg�����<ǟ�?�U"h��c�� 2t����R�o�v��Z��[�"�p���mm��P_{���֫�w&��w��2�	Ao�딢��5W�~*�J��� ��Ud�Q�Qm��uG�[n��Xt���j�B����́�Sݩ��cR��[e�M�>���O0إ]B��;`����.*�[Q�	�~�DO\��^����a��7�eQD���=�3��\��i�ҪT+G��d(hhv�}�..RsCT��En�����+co|�Q?��"�W��B�*�3��U�<B�w������h�u�?F�f:L!��[w����K����+@sg�����{�p�A�p�l�E�Im�|im��x1n�1�x��LR�+q�Ą��Ƨ�"�(u�8��2�i�*�t}䅢��k�����z���F���΁1��-��˙l=@C�����XG:H0��V�ǲ��Yƃ�[�c{�B�)�(b�EY�b�(�f��F@	'y|Yl~��fe�iN�=�~�����lrL��~5�T[�d�`���@����*LK)�J��"8���q��P�8���k�(&0��l	��S-�1�\q�
��8pkg�.�mp�_ż�a!�����-:����s
�|����S��_���׶P�\��t@��K�bˊ2L��?�����_���>�D��}4Kָ�.>�����3�}3ct�ƶ��1��n�a��U�Ѥu�&n"��eÄ�4_e�b{B!V�(W��R���Hۑ�L�ɕ`6�s�Mmlv0��{ں����b7L8�������[�A�;~�e,h���������	Ëb�r�� ��b�Ե��J�⣘������!F�� �l*!�t�����F��s��	U�	�'1�w�$/Wfo�#K�U.�Q��c1�¦���`R��O����{0Kl*�Rv_�,j�99[i��vb��ED�B�F�/�a����k(ZWjJ�}����U� A�����T���{E�9j�7��5&�����ZX���ki�^�����q���!3>�������I{u��cx6
A�B{Eו9�r��E�S�T�c4��6�&l�fXO��,����.���\�B/��{��`8��fe��z�FrĚO0bq%j�p���8D#jW���&�����e�8���\o���k���c�P�_6h�˟�S�f���c��a��2P�M��uZp�_S�$� (��(�s#�z�Y��(�?׆	�ǧ�Ja��rw78��g���W14
si��igϒX4on�J&������^6�D����0�Q���j�ev�uN �ƀm�����:@��~� �
V�ˌ1����=f�.W�*Z-�Z�O˅��m�>�,bT&yT|c3�!�+ZB	!��q(��>T�ϲ=�p�)��)g�L#���^��F^v�h,����h�/�E)}�s)(���hsv�w�-�%bǠ�[Z
��e.y$.d���\\xI������i\O��q�&�
T�MTABT�1=��ط�-ƒ(ĲՀIuO�	�c�o�ӟI#�>͠K'd�P�9iī��� VD�
A'�T�DL��1.#8vW^w�T&��	�s����j�"$6�A�~JE���usu �����x��V���2�{<���4�FQjLe��r]�A��{g����,�mIQfY'��a������0"��ŗ4n�ʼ)��J�=_���8<�I ʚeJ��7�L�6��C�~^'�i�V��]@�~�)�R#�<B���;�����v��?~��o�d4:�8�:�;ψ�c�	�V�`�G��nI�`��~|θ֪"=�N?F�#��1gm]ͪ7�A!G���R��(y*���	n�;�}T�Nt����cź��Cx�� (�!���Nw5߹��iU�z�3dܾ�j7}�Z��>U�k�{HhT�E��R�gV�]�I�/&�xٛR��.���Y�� �:�F����ٜ��վ6T�׊����l��M5m��x�Zc��t�ˈ�P^kT�N�NL ��,�.T�y�U��p��3�8��]�b\Sgr�J�f�ro����GoL������(S�}CW�����7igǠ�@��ƽ�0�碡�L�x}�=6)�v��1�������A��M������$돒��>��>tV���|��v1M�D�
�y�e���D�F� iҤ�ͥ�I�~�6mB���� ��x��|R��մee{6'N���F��O�Į�v���{��HeZ�&F[q��*K��S�l5h(���	��L�P�_��[��",��K�*�p�q�4HUӿ�ʁ�,���H���c��h��O��rZn,~#y��+�D�t�@�S�QF�%���^�{Kߍ[@������5�4:��K=����57skU�Ѧ|ݒL�e��4�P����:�j~5�{u�C*?ig�'}E�{��L�*n�W����ɻ�/{9��}���(ߣf5\�,�q
 w��N+C�6.����g�}����W      �      x������ � �      �     x�mU�n�8<�_���n��!�h�`�M22<��~�����0�j��ե�,O�Ɵԉh�x�dI��=�d�ؗ�t�hͳ=?7�K�>�8�T�:!��%��ٺ��	i+��<���Ɲ�A"�S;�.�M�5͂�G.ΜLd��^�4��F�-���m�m����u}����q���3�A�GR[n������~�O9i3S�^oe8�ugt�Ļ����?��~�5\�4ˤ�������������^o_$$c����QO��Ҿ �06����������ы��Ȏj�V:c�(��h1�pؕ���=�j�t���������>b3Z�Vd���1�9�~X��s��V%��S?�2��o���������]�3u+r߮��~�w���zQJ��)�$Ӊ���G/΋zqhm���>b����k%�#��6XzB�9�}�lC`�����nNr�W��:�O��a�]�p�IhA �p*'�tF�f�4����׌LK~,ۂ��	e�7�tU�rB���,�<��o���8>o��N�I?�^P��sbЉ:I��u��-4�L �F= (��M�8����yRkUf(Υ���z���t����.T��(��2��� 3GȮ ;6��l�(���e�
T4�Q`*���(�jHAq�,.��R��U>��;abǒ��Bj�ꂎ�ށ��.�ߥ�2�dbRbC�x|ҫRIK�3������\uh͌!/V� aǀX(�V����!��8�������?��e6      �      x������ � �      �   �   x��RK
�@]7��N���=�v�*�S��X�T��69��W����_f� ���\�K�p)|�n&�g���O�To-��YH��'5Ol�ӟO�UB΍l��������)Q �h��A�0�|��^����.�,rcg�8���_;�#�mx��m�R�q�
;�U�k�x`��\<��]P���-�\��?g���<*l�i|�~����Kr�u�%"�Iӓ      �   �  x��Y[��0
�v3G ����Sȏk'�����ˈ7�Z�(Z�Q|-2�Q�Q�,�j�G�W�FD�ҏ�EJ��Q+_(���ʧR���^�����oR�1�.�3x?U9�6KߧCS
Y|�o��>�a����Ԡ!���o����k�m
����(��st+��R�Q��¿G[���-��a�h-�~ZR~O����S*�B���a�R�W�ԍX5|5���7+U5v�ߩk:��#�4*�`P���4N���H�a�d�)�a�<Y�K��uD7-5����N���-��6d�[[�_�4ƣ	!���S�6ç��5me���D�)��=&�L D 2�[fhu�C�嚎Ӗ>p�Jm��GM0�0�W֑PS���13���u o�"��+m��H�*�O������X��I�CUl[�},����Yk����F-����Y�@��)�m,�����zda�0aB	mp#��pJz1E��mxU��:��1�!���q ��_ &�>E��p��v��2��)Vgn#�R|���bp��>e"MwAm5;l�E����|T�D-P�����nٱ"�&G���w����
������S"*K�_��+�vp;�=�)p�G��2�e�D�:N"�N1��DZ�ȏ�������|�-�Z� Ֆ#�,�G<N����W������2�e;�=ͳV���<���,E�S��%s��c���oQK"&�����uJ��s2MK֤���/"�Rt}ќ�g�>��*C��O�j�(�y�9����~c���a����d�q���|���i��8���Vr���b��*5%�сJ�f��.�z�,cocl%�&9�ZdPC$;G����cb���}׭�>\�O�q�ʕ�r��d���=���d��W�8��<n�)�g:Q�ˮ����+9mǌ�U��Η����q
f�HkC]����
5r����m�#'�޳�����D �(4��96�x	���'����äqo�ɂb���^�Fx2�dԳ�2�p�&b����������5e���j.�|�������z2�\�xѹ�F�u�.���AM!)xR�<%�ܳ�e&ۏ��v�����,HJ� i�b�7�9�8��LSɓ��lɤ��
x�$b��ȸ��J�~�b�?)9	�wo>���צ�~�fD`��cM{"��Ԣn�h^/hu[S�����gv���cD�����dg��Z���5��J��B���w��%s�9f���Z-W�و�KDkW����]�v��~��O_2�A9���܎
�|��Sx�����;�������͖Q^��������;A��2g6��'b��1��l�#���rg�@<7�5K�F0?��dN1�&`@�(�M�0��c�qy�|6<�V��]ٌ��U�B�My���ɊB���s�]��0�ָx�KY/�E-ѵ-�ps��O�co�y��(_2���@���>	w��4_�Wp:tO�=e�� �|!3�=�'?�|!�q���qˠV|(Z.=b�;&�{'7s��3@߲�'?miz�S��c{�7d0���!fڢ��8'a��3Ǯ�42�S�m���dm�񬗞U�9���0����e&�9�:\^�~�i��F��O�.u!���}"���=q���`�@��>_��N�1}�%b�Ķ�ˉ;��fW�ߏ �Z��y�x��;��̑�I��dJ�5��w=�~���w~Fn�nI6�[VyU� sŪ���\�mGb�m!C���D�w2Ȑ�~�ݗ
�y�s��#�:C3���5�GfN���g�����D��ް=�]k��/����(�����'{�����B�z�F}ɸ.`��68�FF�]��MGp�wg�q�*o���#z�𖁆�Z��3*�9�s��� "�i��N!'"�u����&-�4�rv�..c����[��ǖ�ԣ�p��u��^�6�l��+�0�o�@t�r�����L1s;���cS�[���Fʸ�^[zl���-�F�w� S/̺s+���1���?���%��.�ȵ�>2�^��)dļ;+Q�~㽧�t�4�(�z"nۏ#�KFꑚN����=��ɗ�!�7����[�f�ʀ�eTnK���U����-��~��E��f0ob����v��L	���isF����T��R��ϟ?����      �   2   x�3622714���,��K,�/�+Ht�ONM��K��+� ɐ��b���� l!      �      x������ � �      �   r  x��[�r�>�O�������?G+ǼBƠY[������X���%B��x<Jv�o�.��dJ��L�wO�jp68;O����P9ԳC�|���zt�w���ӡ~؏/�r�������o@�����P��g���rr�����~9�7D�]8��y���)�H�=���6�����
�~KO����6I���ow���+�?�~�-�^�EBд���CA�~hFP�����9A�~hAвZ��VM�mu� �F���~�l�Fm|���F��
YJd1ۿB�,����O�^��7k���C"�SK����z�%N��OEQbG�}�����~��1�	��9'�d�>�)�z8"��&@��I���Y�c��9�O�܅�����G)�����)��X�X��`���:���~�"��8i*�k�MJ4Qe��qD��	TY��J�����Z���i��k�Uʔ(�:y�5S�IJ��7�g�@�&�l(�$�Me��'h��U�1�"W���Xś!+To��U��m}�	mz�(��0� P��aPI�h�� ln�xs#ʄ�&4��'uB�T#�M��)Bh�d�W{�B��䠑ܩ��8O���4.'\�TW.f-�+	3��U�����̖��,��Y$A���-6�	؟���������B��{K�4��	u�	�-u-	�E7��[�&�-�"{ŝ��%�%o0X�1}$e�U7��M	����@������IL�X$��=P+����+	4&V,h��Hh)�@�Z]hpi.%���9�e=��p�����qǢ��Ni&v�)Y�ZS��D��ZS_|��a5��ƶ�j@1S����d;��4A+� �=���n?�4���s��O��#2�����d�'��m��M	�����Y?�*��
�4�B�W�L��Ma~�ܔƟ��J��s����£���vo�#�*��K��p2��Ox]��#A�5ȱj��W��]u�G?B���*�-����U�j�"�Ԋy�b����N�aJD�Q�Y�[�b�\�Q����a�#�b���i7�s�IX}\gh>	��c�`�Dz��v���T�� �s���P����C�:
�{���HZf�s������= �s_��x���b6R�+���e8ủ�=b�²<b��
�[�@�5X��Nld8c�t�����jӾ���h�����3��"�{p�zzA#?,��"|,����-��;�aGԩ����+-z�xδV��[o�%�V�x���@eD 4��@����sx�c�i�]��E����zD+<�dgJ)_�jJ�BA�ur�A���C֜�Q:�!cP���T�2̏|��Pf�N�P����X�x��hb!1&`�����,�~`ij��a�Ծ��{��q]"*I"�0�PC��1�/�s<q�(o%ܥ��]���Y�S�A+�b�UU�1n@�y;L$C�P[��W��t؁VC��t#��u��� �N�ӌ�!S���S����C���o�wz@�!0Q2��9';�@�J"��4�H�����2VG���C��!G񂀙N@�F7_h1W�b�%�� Jk�~$�Ȟ��Ư6�+�k��#�S��M��9�� �3a3���d��	t׭�'���"�S��S��{����X�� �C����mp����9�2��B�e�LD@�ȥ�H2n_�H�$�-o=�8і;c݁K.X�qMgm���ݽtL���~�fAR �K�,$�I���I*�tj��ioG���}��ȇ2-F���9�8�?}8ڎJ9mg��\*c�J��}���ߙTq��?����P���f/��u�m��֓������t�ۨ>�_	���8C�3�u�'NH�t:��<��`c>~�X�d9K=8flȥ�C�l�1X9�
.DRvJ�-b�Z+�@���:EN�O ����& �%$9x� �ϰ�8ee�j�עW�+��2��!��K:r`���{��'���cU�]	$�RLT�6a�-:�j�C,����O��o��z2l���D�%T�g�܀�e�"ijx�a��="�������������ߧ��B{ϕ�3Pd��霱��؊�Y�|�K2H�B3�庸P5�u�{Nq����3��kr��G;��Qc��q)o�(�g6[�A|�'�����>������^h����'ҽ���ٕ-���_ U
�Ƀ���-����@
��F��!_��;U����L�De���x^q���6�ۭ��a�̸M�!E��6�{@�@xt~[��a;5q�r��|ؑs�$z#��Wႋ��u&Ԅ
��;����R�Y�^v�qn(���[8k
����h/F�)ǯ����O8�\�A1�q�(�N�䋒�*�<s����*�6�0�)]�hag��ڷ� ѱ/��3A:s-p�����42��z�LA��l����RQr�/M�41��{�M`�I�*u��F8��NP|-���8,ZS�j�"7��)Ȝo#��8��k^��H�"�ꦽc0gbS�p��p��t
s�Ps�!T�K,�<.3k%Ն����\f�t]rO��h.4���{ݭ�F����1�i�PR\���y����X��Li�)��s�Q�rGe=Fb�K�vg:��I*uӁמg`�Z�8e{��'��?8��ڋ�V�� �^u���`7v�Z͇�\Y;�¯?S���P�C�љ�����U�<�-����A�ʈ�\��ђ�:��2q�f�y�Y@H�HzOp�@`����KBP�����ݒ��]�^������fےO~�j0��
4p��  �l�i%	��Df�
�Pޢ.�f�_�Of��N��&���D�N*�5e:��G(r���r�aЋdr���E�yi=z³�g�x��;��3�45I�u.��վ-��c2�P����Oa�O�0s*���X�K*�����7sFyb�|��u���	i]��n�3C�f�s֛��b��7 �����+�B��tʕ^D��#Bi�؇gGq��%���Cz�Ȧ�	��3�,6������bP�s�?� ���5�;��S�&���g���P�~�KJќ�T���[Vd�LFK��A���g2��􌲀-.��+��.O�^�y���C^F�g
;Z����Yz�rW��м��noR���|�U�ng�~`$��z5�E�|�p: ����)�t�[�����������Ȟ<˧f�����Wf��8��"��������;s��Ŗ�gP�z�{`���G�]��� ;�5=��=;n�zo�����'W�T|��!��C�7l����G�v�[��}i(�$���"O001��> �ȉű5��7N%�"����U{����;hd�q_��<n_�}�}��Ŏ�+�3��!��ՎY\+���2)��zi�1�aE�ށI?��m�W1ܵp*KZ�bI�X�9�/͹Vӝ9�7o�]�LU��F�����f��҂.��
�m������f�P��N{��0n׾��xb3$�.��Bn�z Xi�Ѵe�lF��ݧ��ڧ�\��A*=���|I��V�|��� ��R�����Ð���L+6���?�����F�ؗ��]A����yb"v���b��l�<1��Q��zà�q�yj
?�
Ԍ,��$��ϩ6w�B����ҵ,^�}e,�����ɕ������0�a�.9/	�Y�L6����&}[~�;Ԏ����>���׹hax�˽qO��CZIՊ�ZT�<Pg"��yn���8�B��p��.ύ͹-�r���to��2��T�^��|܊ �9nt5u-�q�����3��Ҝ��*��>����h�7m�������ߝ����YɅ      �   l  x��Y[k�F~��z����.�ˣ���y)�%�m�?���Y��ظr��k�k�.���ҙ3��F�]iׁ}���s�s�sf�w�"��c��?����+(�y1C��e��%�{��d���'��V1���O�|�S��X�-�N��+������s�������3�%�����vӊ&����B;�:��R�'��yV�Hc���iq��5vr���7*�+��Q)�s��bNL�A?��r��E �)!aJN����n���}qVs�f�`��-��"��H�Mqu�#g�p鼘��[s��+۠L�^�U��V竧�E��`G�ˌ�V:��z���� �̼3���Q�zQ�*��R~h��1ċ@���x�p����f�~�8H7A�#�St��N�	�#:�����D�:��� ��6p�-ӭ����e�縟���2jV��H��ϵ�� �1b�/��N-�=��z���o�کy��\��/�����f��*ߠ�,��S�d�f�������9���o��y�ł��Y̎&<!�/1X9�p�1BW��)�}ɩ�p�w��\�� �33Z����pj�QY�F��a��A��Fg�9G��e�İ�^�iD�T��.�.�7HV埂�j@
՞���cNP�}
�tR0��+ҷZ��?ar��|�5Y��3,G�5jDl����*8T�6�Q�D�^��Ɩ�9K��"�����p5���OFA��A��j�8�uz�n�D6O�=$>t7!0����%yDRl��ߺ$�H��}T�Z�ޠ Jo/\�����_�a�o{V�+ ��[7VkG� ��ߌߺi=��TV�a0��Ɯj��oA�\+s8}�S�%�!�>�g]��(�P�=|Ҹ�� ��>nw�6��� /7A'C4s�m�K�3\�COӤW��u~��DÇ]ԣ�70����)��0���t�@��9��2���e2�����D��QER�Z��i��B*|�0�0�4�Ț�o��e>���^B���9#�n�6*�^f\{t8A�	�	�"��Ep0�����K$%�\� �I�ݵ��Zх�5�n]��g�ߺ "5k�餣@�^�^��)*���M�p/3�{�2�(RL��:Q���-�	D"����y?��Zf�}�A�����<�;.� C�$���|�GmcOR�o��ėB4�fK�}���C��P'Rϲl,OyZ_C�
�sd�xب�a/�4�vq�@�u�n52�X\��J�dqh���x�7.8i��GL���o�π��	�=�c�&b�i���ŉ5|d����~���ﯶ_�����D��G�gKQvXe=�W���I+�*�fګ.�OYԸ|brR����Vxh�N�^뇝DiAVkؓ�Iy�H����Y�36y���Q�c������p�/Z���J3����3�#���d4��Y�k�6R.�	��p�hB/SR�e�;�8h[��^��G��E�/���=�������=&'�4�(��Ġ�ʖ�'��Q�֎M:�JtbH#���I�[D���=�4VX�w�]L�;��{�T�-���R�־�l�CƯT?*�2
�,�G'�ryc�����D�Y��<��%v+�J-�+�q9bϱ��lAD;�GU{� ��)P�!         ;   x�3320002�40325 R�F�f��� �����!D���(Y\Y\���)����� 4��           x��\ە�8�vE1	؇��l�F��L(k��,<Ȓ@��}�ݦ�� !������O���fo�{���1�o`L�2;斂�M�����俌�ۇ�!.������7gwǭ��#����YV`�n�i�Z*�q�X~����?��8�}����m@�	M��HQ��t��/���0Y�����*8�Q�r������ceb� <�������/�*LG`���@�<▫,s`�"o�x'C�U�#y�q��ɖ���٤��#2�M9�v >e�eKJ�wg��?����z�|LÔ��qywʒ5�B���RYyf���Ъ�WD�4�����şy�$��z���1DEf]�:��y#�9�k<�GUΌ� I@��q`��B��nc\|<ٙ*�W}9UrXGE�Q�ֹe�]8�y�8����������i�^R��+4T��v�X��F�QV��qӕ�>�4�)`m���Oӿ~�Y����*���qOn�^2�2a��9[�|��ؔ�2e~��Xh �oK�՝0�,��i�[q �&�Q55a꒭!��d<];;�n�A=��h��1	��[�l9�����P�/ӟ˨	�o V4���:�<7ʘ�W�A���LGOzY��e���9n8��|���d�2�p0�y�%x��N!{'�>�)tݣ}2jo��z2&�2�,���������^�l2���M���k���T��`y'�?��\�'cbHA�q����Vg�֫c)g{i��㳷p*7�6�f�g+��|w|H��6�;0�����J�����)���H� �����RO<��Fo���+0�Y�
�'(�v��bй����<�����8/�H! (�j�s�z����;�10' s�R�;?��)ߺ�`1)�2���b/ʂ{��$���|K��!��
JrPm7��f�c9$��	[�0hзz�}�U�3@0(� Ȅ�{Ɖ��N�g�*c.���W����h�ۑGl�2`�������*c�.�lNPD*[��H�:�kU\��Awce�bH.�"�d,I��XY>,C~�V���"�B�;��;���MI9<����t��Hf��� �el�e�N�]X��r�5R`�ژû�'�(Z>xY�ο�*���`C��
L��?�vR#�.%,2�@%�\p�X.(\_|�����e~�7:;j'��k�LCz�#�	͘��a,38�9��}ff���fձf�ۮ�L�p�uU�_����w��nm�.Ĳ
$�Эa�7�+������j7l�M�iȧ�3�i�ohK8�XK�����Z�,��oI01����WY$É�/^��`��;�B� j]>���A�8<�A��*�:�~�0~�;�P�9�>b��p_�d�z{���0W�d�^�`0�o�j<Y��*�3��E��HB@,	a�r�nsJI��}�M�oVel(��+kz�F��x˚�|^�y�4��~F�!�ȍ�S��1���ˁV2�V�vpV�P+�P{�H�q,�1�%{z/w+4�8h�����5�ea���ɺOY�Vz�IN[el��gbJ��,��6Y _h���U��,����_ՓG���i�sX.�D5Q;4�)��b���.LQwy�ؕ�/�X� ���1��.�Ƀ��d0B��K�Gl�V�d#������U��9�K�F�$c�.���}�eK��5ؤ/�9|�$�����4�+�`�3����XN��^oZꪌ��`�)�^^r�a�9��	�,�� pJgW��4;г�̘�ñ'� ��&uX6����+}�����K��jhV�>}��Z��|�x�:��8�#�;� Fvo0�M��'���}��$���<n���ll�����!�*)=;E�)��aN�l���@�k m�Ԥ���.߱~���#g�"�T�1�6���v�s:1�\���1uE1�{��������Z�$T��c$��y�q��5��N�0^,[z��v�J� C�����#�N�j��Ã@S^�)�+�vH�Y�w��
���f=�Z�!׸�	�Z�ԯ�����(��s���y#����߃i}����8>��|{�*k��}�i9�dlQ�p�ŷi�����%�}��\�����66�]޿�.��fA�h��
+l�����p�+������J�f�A@F������ml-@�u��� _$�kk]����K�^��,T��#�vn�r�O����-�م�Fv���������6�Ad��j�H��4�Ȃ=����9�7
�3��l���N�I2�:��F(
��d���e?Gz�ř	5��2�6~(SIp�,.�PQv����P�jJ��&�}3xk�~~��m�uf�ui3�8���c��d�F��!�1s��yJ,=��-.];�+�d8� U�_��E&4�L)�����]��Ȫҧ�d�&&N�F��]d7��M�V���V)�հNp�d{C�%s^v�G}4,O��X�j����n��0s0�K#�4�vP|���7
8?�z{�&c� ��O���L��8�a�o��D������1˽�����G�����,�	��{��0$�����Z���|x8��K�����|�L>��gN�R �)�pKts�H:��:���U��2����֢�*��3����ю�%���kXNx}���WG�S�4��8N=Zg8�X�Eկ˸�M>�d:���^��4�~겱�v�H벦�ѱS��S�C����+F��fƶ���:{��Z�=�֌CC����U�| ��<����������r3            x���_oY����S��0��?���w/`��>/ �žنm�5�R��o�ͦ�W3$�@5e^K��m�Q�Dĉ�'�2�Yd�jwC-%��Y�y"�D�������՟>_]~�z��j���<�[�F!��W�?_}�|u����9l���%���D�Ch|4Z��H��Nr��>�|u���
<���w������>zF_���o?_|�������O�������Z)�n�{�)/>_��|��������i����>�w<��/�}�z���)\��I#���1�QB��QH8T����Q�,\��ts��_��N��S�k��ۃGp�_}�h'd:�2�[��k�����K����������z�g������s�������F��w�����O�`!����zN�W{<l8Cz鏴�p��ל�-��|���IWᎃ��Z�C�(�䎈�q�B/��JƯ����/�����Ϳ����}���������ݣ��w��?����>.�Џ����A<�����Y:�p��Mr����(k�Mo�Uz��9%b�M#�Yx���$I��,~%�N�uc�wH�Z9�+�"-�G��s�3\�KZ���l4$)Ǹ�pM�\�"�$�°�Z��zh�ȪFH�dZ4U�-��3���xp��k���p��yS�w���n���ҫ���[�t� "X���i�LW� �q����i�+%v��u�V�b��h����J�Z�	���I�>�����H�w�#��3��&}��Z_쒲�0>P��"���֩qN�H�1��^����W��;��&��6�q�%�1>��lU��m���,�Y̏�>x;�F�_%Iz���ʷ�z�L:>S�gh��ymO�Y�َ�nN�*����ң���9�y��o)�:ᓅRqIB���h�aS	�ѫ�pU���gd���y�[0�"x�1����ns�ƈ>�5L6(?�0�$��%�C!���$�`����~�d@_�;�n���;�˙Y$3�v�;F�Tz����z:��q���m����ey�o�ʓ��Nr���dG�@�W�]��T]i{Y��]���,���I�阼� '9�=�qtW�x�Z$�݃N���#Ǩ"o��D�_ҝ�L_���f�˽�!8Y�_��b/���;{$`��\z��%'��w.�%�!KI��Z.�i�~�O��оI�mڱҚ&�J�F7���؟��;d�-/o����^�r��O�4��PD��9���r��Ѧ��;y��?�?��״{/�"^,=䓻�j:�U_k���:��ߨ-E��Iiv+��?'��Zgڧǀ�Go��Ï�ði1:�$}L�N��͌[�U)����~i���{���>�dD7-���=ڟ���x���������9���2JS�Nʅ�_�0b�)�����ƺv�i.�S1��}�"���N�E�Vۢ�:9������<����3��.g#{���_
T����v�^��^�b�Q�Eq pR���8��ᇭ��Z��w�l�L�.�)�2j�F�5�[�bZ�l�6��$�dt^��S�b�	�t���j�QӋ�M�.|gס�}���_�9��=G���{܇����:�W�@��#��ay����(_+���IdW�#�w?4S|���S��kFCq{t";��=N�1y `��>]��	xW=��=�~�W�G�P��oI�Fl�ҹ�@N�N����Q6m�)��HN�@���Np����o������Th�!y�l@E2H"���I,�Y��v�H�攱��*y���Kc�E�	��%?��ʍD_��u6�����7C���v?`�=�ǧ�P���R�ɶ�
.=�����@쭒C�d'�vZ����q/d�DG�(�-�S<�g�Q�z����˨\���x��i�k��M��o�����bhYRĔ��4���X�B�¾���.���X�(�b)�6*-CLFn!g�,�v(~�*8l��/�[6B�(-Ը�:����@D���6'W��C��|Q&=$X���=��Z:B[�K~�G�2��m��H)�iR���r��A�'�d�n��;Y�뽌��V�*�RrW��[�3dH~����� U����G�Rԯ�����d^�3��,�?�/��d� �@�4̯����n;�ǰ%���&�����r�{]^K�=�n�4�L�AZ����A�_�3�-�9a�h����3J�+�ĳ�Z�
?��W�P
����\%�O�3���|��\.��3�������tjE�i	����a*��)JMiޮ�����������&u�/��R�XϦ�?� ĀW,�����[�~�Jf��O+���Y�f�}�O��go.���{e#��Q�� X��=Vѫr?�+4���7�y����/	�Q)���K�^��$����e�tT��:|h�+O%g�D`.�v��Dܪ������_[���6�á��Y�?V�i��uZ����C��k/��vV�%%����p~���j�yu=$���r�s�_��G��bK��O��9h�u9ձb�L��T)( H��4�}�`/��ç���WN�ȫ<No�	�zSm*���3Q*��{hđ���j=�Me��̪�ip^��o�/�Q��^!��D�I�� )��#c�^c��#�� ���~���.ۧ$�PF׌�� ��,���9Y�[@�d ��Y]WvIpO��c����|�Y5-�u���%,�S!��>�LBysr����
9������9�μ���u=� � ��Ҫ�)݁t����3�����cӄ�U�%k���JL��P2��r�AF�qv�^24�Ё�:��{��`�N~ѠT��l��0}���93]Z��k�	�S���#,�����R	��/�[����l�=.��dc12�� �� p�b�z�L�u�\�%3H$*
g�����z^'�cD����-,�y��n[���^��~��E�|�=?��u�=�2�H&�O�'���Ɇ6�$�$�za�"&aK'4��-R��m�4�h;f�{`���^��!(��O=ʊV� �����5<(�N�S6-[W.���zHW�ѲY�(����e�=�(�e�kx�o�T���.Zz��{h `�A@e�����I�a�Y�e�w�f ���3&6��-�%k�f�| ry�%� �ta�k�@2��j�(ܽ[a����.����-�)��i���}���*1琡-�%^���9EQy�qK�6�M�'b6���
G�G�r�:�'A����C��R
Q��rA��.�; ��cElZ��J)��dy<X����k� 3���9�0 �2�����!�i� �4��=�����}���iN����j"f`+ 9o�uM��ɺza�My����uN�@�K6�9��?yu�Hf>���A�w	b5��l���>\�1G`�o��Ӱ̺2�7�z\,�5���)H�]]V��,��J�Q§�#iex����#|�4H�uɪ���{yaxWO�m2��
����Bz�˗~U�*?�X/�:ci�I`��-#FԌ��t�Rb.�.�ey����ซ��S��=��P;&�$CB�)� �<�V��W�gy��l{N�3iN��בU�%�@$m��P"0|��Y���h 4���b���,�_�xI��=��Q�cq ����-'��%)�	���YM�θ��f�Yڔ���P�Ӎ"�&A`M%���������<��c����pt�0*�Tr��
v��%���&��)^r[p������>r�%�'+���=��Ʃk�n�4o���iJ�C]v��Q�����k>�j���u1�ئ]r�:7�6��Ʀ�ѻY����0D� �J�QX�$��f�[r�{?'A.��m�4D�;�|�J�����߄7Ё�EןͲ�]wWH�o�KSEX[>�D&N�f�?�.�3>�1���ps�Bi�&)^0��!BS��U �.\'<NWK@�n�j}M	HQ�C*Iy\U���J�&@��4��a��jV��9�Wҭ#�3l�7��ǩ���K�w�;�q�֩��XF�"M��j������ ��N    y�y?��ie"�Z䲠�I���S�鯗Ⱥ /�˫�9��p��}��J�LT!Z����)�!��R<�!��û����|�ݳ,,��tR���K�p�\{��W�p��eE�<�T��������"	��$�ᑋ��[h`�?�����$��b�?2%�<��S��W��V��}�& ��PS�����qN��L"��)~�U�ѕsZ�ip��#������'����x؄�2��1�o�U�b�Y�cuR�fpUP D#\�l
��^����xK�%@Y��c�(.m�A�y�bh�k��.��tD���]KD)�0��C�Nd��p˜/4`I��w�R�������������u�$?@�,��������}�����j c�
a@�#�� B~�c_j&����c�P�X�h7��$�]��5>E�״:x[Z�,*P�5��^W5(J+����l����f\-�����9��~���A76gk-m��"�;�׸B�o7�߳,�.�t�F�0��y���YM����>=�-K��"�&򖕒\�\�O��eU��V��҈x��d�Z�-��6С�6��Ͳ�J陾��o	��|�?J9��֚i�=H;��p�&ًr�Qs�I�H#9�~��˿NM�Y��n��C[dS˨Vd�z�</����s�� h��h��1햓�p)ķѸ9�~sFIeW��~��܆e����ư�����k�k6i7~���w��"�����l�I���SF;E��)�V��cTX�W���n�z
���7�zI��W�Ї�z��0u�e�q�4�2E���u��(svL�N�r��[!�`��}z�p�wh�؇�6R�Dl�wt�`)4[����=d�+K\�~j�D�����ɠ��`�$�+���e���t�yG����:��*rɔ���o���9��3-c�Fsv��93�f�FDs�Vyw�
�T[�6�
�KI!�Y� ��,m��u;�!��k����״n����o�x  �=�l�� T�`��	?�'���[������H�v�/l�/�M�o�<B�\��}��H���֙�^��N��:�ۓ�l�wx/	�����Z��:�8��7 �M\Y���٦�N�Y��\��@� m����� 8���v���Y�S�Im��붰�Ru�D\��x�@9�]���B��$��f�I9����]�A>eQ�G��5�0��σ+�oW��R��\�� �R�Qq%c˕�הu��6��x�jQ?��[�j��a"�v8lm���U��L)�%~��y��pK�=o��C��yjl����f$z��V�t��Ψ���n6��/������9�еR;,�>G�̹�v��T\�jP��v$� i��t�{΀��bȶ���{�}�ļ��E
H,�R�o�E`_�7@H�9^�q���3w����N�F�z�l��٤�����ES�qO�Y��p�T��p��7a�y2��%�@
�����S<��h�eyУ�v����u�������}5����e=ٸt��%�R�������Q�c�Mz��kzVͅ�X�ea��f=��?��0��yK[?8������ߝy���SUj]R{��O�p:1@�+���%����x�٦�~[X�N8�e� �
���t���g2@!�5��ج��9&%j�(��;Z�|w���*vɧ�B�{A� Wkf�í)Hu�J=6խ��[���=��}�f��巍q�P#J�5\��/�=r�K��Ƃ��iYUE6�c.0Gc2T6g��x/O�_Wfg���UeU����ħ }r��@�尾,�*��	���~�E�r�?�*n�!����X&�Y���֝��@�%K�7����@_W(�te��ů�݉��f���6��E������� �l|���y��o��M����.�lg/�����'��^ �Q
�o�:��N���������E5 � v�dD:�iS����9��z�����e��)�l�z^�QF5��l���X��w&��g���v�Kz�!�=���=�W�u���^y�ܤ��	��i-	��@ӏ�3����u��.���Y-�g����R��ZZm���������$��7�V�Қ��;ƅ���rDx�4֧��`�8)��
=(�ks�Ҷ�m�E�u��Y���~��z��P�74���d�X�l��k��l���Yè�;�/u�`�Bj�`�4���̯�I�L�Cc������_�\�g{��d!��5�,�NI�!o���b�Yt�����>���`�#Ȧ���
r:,������q��a����R쵓����A�K?�a��|��f��v� d��E)���i���*D�6e�,b=a�f
�ݼ)�����e��b�&7gp�1W0l�����*�/�	$!g�bf��!}���ޱC:�!y���_��ski���򕜕�J|$�"����/��<�K7����G�j*H
U븅��	�dG�{Y�-N9�s�g{Q����3�bJ�Of��V�Bp�M���r�.J���TW�4p��N+�q�0��:��"��3~JaB+��v�B��y&��)�ѥWP���B�t!����G�M���5�ke��Ơ�:���l��K7�:��9�6�$�A�f9�#Z�TIN�j�A���|����>R����H����=c�!�{F5hQ��W������߯h��~K����^R��`�߷F}F�j�v��QF�x�p�:(ͳ����H�Ӛ𶂲&�9$M�z���TF��Xk�T�K)q��<i}��_<[d���S��<��F�"�jV��}t�!�;����?��Y�o�u�o�`I���-z57�	���Qzv�oagY��3�+YTF�0Rb\�L���)P2'�V@w��g���4<��q+)�j�r�|`	�U���~��x`��Ē�*�p���b�7�^|�Ы*�����uZr|G�l>��*�Y����*.�܆z���J$�z�����&�M���N��6&�}��7�SW�y�C�ήL����l�W���6�gU�J��9�#XǛ��F�����T\�+݈&����fn���F-�,�b��������ܭ� o-�>�􂯜��]�1Bwy\��R�>��#�NM�ڀ�pi3@�w�y��"����:6�Sht|����e�TF���B����y�_e���Zc�ݳ�4�f/\�����	���퓊�tޖ���b9�����y��=���nf��n�����^o��Aތ� ]��c5��~�H#��k�̬�����?wph�Oyc�G�zf�����w&��ת14�t�5Q����@���S�+�۹�=t��e���qѨ�\ƶC+̿
������4D�����b���ا�L�r�M{�J�p��]pka��,��ڱ۔q%UA�#��m>�#���Y�GU$�U�R�p
mũ�4"���ҋ^A����W]+Wp�*��ћ�Cx�BB����V�,�V���Dy����1{s!O�c��0n!G�<����IW�-#�t�nO�V{yzS:r�|C�]����JA�
=Y��[�	)c뭿�ݩi�tW���\�B��JG��ڽ�*o � ̉̇�fw�-��^vݘ��U�v ����n�>jg�1w�'�NA���R�����j/��k���C�H6b�@��C0����^�}�������̎�
���.��q�e}�j��DR��W�c�j������y:�!4"��΍�bt� ߔ)9��U~C����^��m�S�*=�Mf��g��^�_�Ngٕ�9s��nP7	@����*�R��ڭN1=���胘�>�S�" ��0Z��`����BD��"��"lQ�9�Nt���P�D��¥&p9*���#���S-U`��ie�֋�&c�Sፙ�؉)��Ȑ�
H�b̞n��M�qA���t�m�H��wX��������۠�����)C�Իl����s:bt�Ƽ�7*���.��v�{g[ ���)_,٤M��H�t:��Z���N�.�ȣσ1�6��-�    s���?�#��UX[�4��D�&���IE1aEH��	>�w̲�Cor}�~oW��T������%ɮ�q��  �)���X���I��nL'`�:�o������]z�<ڠơG0���<�0=ա	��ȬUbӕ���
0r⶙�����i
340;��W�$]�ݚ&�a-2~�9lH'�����k����7JpO��QC�5�)Ǡ��t)'n��l�Okh,q����*��}T��9�f2�]X�_������qYT�n���*�������?��{�wa�F#��&+0Q�T��{G��N�n��͉�%+kIv  A1��rS�����im��EKr�b�>����ŷh�Z��+��So!�D�������_��G�������ѿ��8�rG�K��8�8�iU~_��P��9-��׾7po��q��c�3���k#�(D�^3I}a|;��B"��&(������t�v<Xt��Ur*X_X��[�R��d/"=�V��-��Qc8yۆ�at�:�b�Svz]��CVFQ���6��I���N���(��Ѳ~���q��C��*%קx:l79�ύ+V�{������ܟ��R������������������ލ��IÇڰHP�'�W�t���DV���m�#pR�5�_宜ۗ��r��]�,%]��x�Vþ�Z��H�jO��Y*r�5��R�b݀�n)�	�=.y�\�/�[�M�,�fښ8B�s�����@��o��g�7-_0I^k\ؑC� �m�;�Sy��?����o+�4��g�`��An_"V�C�w%CS7b\�,S��{�|��>�"4y�؍��ۭo�&�ZW��C�z���vVe�1^�34w'���T<��V |�b>���Z=�<��VZ�����V��e�OK=E��zl+	�5�M�\����q�Z��-����F��hN�	��\9#g|�k�^�a�]6�>��1JՍ��ī�J҂�w����%Ɲ���P �<�{Щ�H�e-P ���:���b�sI�� �z���-����sw�d�s�V�(����.Z8�{�HP�]��'��v ���5%	���A��Y�wN��杠�:�t����'v�Őo㲩Ϋy���٫�0b�Anw;�}�`�1�D(��y�R4�xb,�8�'l?,��s����_�'�/Ds��p]��;Dt��Q7!_�}z�� ¸�M�Ƭ5�����\�S�jUwq����S�QZ%�@���f-�xNQ��<kFq����Ӗ�+���ڡ=%V�-P��W�E=mӏ֣��L��9�Q����u
�OB��Ya��_�f��#*�{���gn���׷�u��d^�r��C��2�m����e�@N�{�]��0��+�oՍm_p���լ)(����{]_���e� m|��(�n����7�𯶞\�����(Q-��;o�Ly�X ��|x������-؂<����r1,�l*�$�y��0\����"~:��L'�}�0����*�ޭ���E�f?؜��7�����U2�vެ�\����}��=���KV9�x�����8����F�(��#X�>2�����yaAq*LǼVWM���h7��)����u���K�()[E��и�=���F}�84.�� �cb!c����Ѐp�!A���8����ftѻ��I���]#9jj"�h�~yjb)�ɭ�]�Cv�FɞZ�%��pKcmo��*H9�G{K��t�U��e0'M�T1A�1�Fl�� q�1p�������76��0��l�3�'����?�����3n\�W'h�r4�δP~��C��;�	^�)��jC�Ot���&M�H6��rZh�.�]%x8������pMx��҃���℥@��an�2��fp<�ԥ�wq�Yb��E૶�ԉV�&����R:��pAvG�r؛��͆W����t�˜O;�J��Ĝ��iu=��|0���4�S�(%�%s���cB�c�2;�f1�P�c�[��K�"U�{!CDMX��\�2D閝����!��9,l���+)��rF���q�з��8�		Nm3=�F!W�&�FX=6o�t�d�fnv+�����'v�~7?�k[��9����d3H���@7L�)iF����[�E����+Tn�V����6���Xc���4`�,Nׅ�+��~�`|h�}�	�����$}J�e2wcq�*�Dtr���b������\�%+)+��B���tqY�;CN�֙�cyE��ZM��*k�p>�z���Q}]?�	-��o^ueٵ����韎(��3�3�q�%��e�k��F*�!&�=O���s��r;�[�)�a��f*?�̵�jL�o��VT{�s�������<�v�/���d�y�m�j�Q�|���+C�b���d�|����@]'g	���6'.s�hy��n���ZV��1<��n}�h���H��I�k�q���I��wݷ��c]��e�r�����)Wo���>Ye�t i��7M�ł�?~��t����v��`�o�aR��JQ�\��-dY�!�X:\��6�r��-�����G4�N���њ��y��4΋f��@e+.(fH;ֽ�5l�R�bM��nkנT�q����7���F��!���#ǋ�eKV����	��^�|�lк*���8��!K�*�E��G��_2|:V���L�I��{ߒ�������$�&�}BL3�=�StQ^з-�\�xW�@m��5�41�v�1'�uh��G�4'M��U)ߣ�K+�d �4ѵѥ�Ҽ7ȶ��2i��~�)�HZ)�}��P>��w:9^��{Ö2�&�8����bBY�VObCJ�tz����>����Z�^�|���z�n)����k��F�]3aj�]z;=�\�S�`{����c��7�!�O�P��w�JىZ���4B|��t�~���p�$H:��������VX�ʃ��G�w2��:�9 �zk�C�SN۠R�{����@SN=E��І��>�/�^F�ۮ@0i��U2���F�0��,���\+�5�x�Jz�GL��+n��������BX0��]Q�E�s�N[���$:�;Ux�[l�i CB�˃4�Ғ򀼚#N$��w�5��F|�m�A�*���6Sv�Er�� ���1�T���&❼���兖��8t��/�ﰔ�y�{dΊCb����3���-�X�䓆�z���5$�,u����>�c�����٢O�z�^�`/n�)�8T��$�t��DY��.�iCٓ��E?S��P���A�:5Ɉޭ�ylݮ5�BVR��)�KSz;�{�t�T�)��Or��t��[�(�2c[5%����.�	�qH��Aʓ��?F����^�;�`��P�=?�u�d��7��Pb���dLa������o�m����Fiio(�)���\>G߭�����^%�\�cH�S���GO�:H�_<��XK��?�$�T�#�;z(��`$� ���=�{������n�3�L�o(�F7]�:��G7_^T����Ͻ��)��3+S0���$m,��,�/��Vۥ�V�l��|���)�������λ1�@���!^��SխR�i!瀳�M��6�.W�2���g�2���g	���u��=�g~H|��x��Х�<�Ƅ(���5��#�6ﳬ�*�(�P�����+5_D��4$��[>���O�_��@	"�B��sȄ��eu��O��
=�Ѻ-zDb���1Ϟ�_��uʁ�eى��刃��*���r��f��݉�����AF�� �۪9���_�F�,ſuq�*.�`�9[��O<)��7|Yg<$��9m�Fo�4��Y�9�����|K�oltZ	� �ӗ�����f��N�s�<�����z���'���o[����=�+"��O�V9�a�f݉�7s0�v�Dh����Go���FL��iz$=��ސ�e�7�-�-���Z7`�y�D�17�Ѹ튾�Z�$�A(G3P����!��9*���6��4^O$n�m;���,���l=+Ԇ߳ ^���ąlW    �]�x4��`�4i�(�$R�8]���RYu����[��Έ�z�����P�8��m�	�aB3P�m��x�V"�;�2�l��F� Iߢ��/q�h��E0iA��B��.�����s�:	�{�ۣ���j��fV��
���`�k��Ι�q���v���2~��_l������%��E�5B��e���Kx�E}N�^��1�y���&��`��D�*�o��I;�ټ�v��n��%���.��v�Z#=�v����vK�nciڲ��g��v����6�E�Ϋ8:{�&>�g.�ne��(�v(���
B�5�v�9�֒�����g�-�G&+(���ϱ�4|��08�K֏�|KY?��Qʷ��ȩ��N�W��(}ǋ�=�P�F�x�ަ�l䌓i���{��<FE:a.����[}+��H&�O�׌v-]�-���w�e�~�Ni�5��*�M�N6�$���p�m�>U����	�j�և_t¢��A��;D�s��F;��5�o�ȇ���ΗL�v���Υ`dR���V
3������z�e5��3�G��·�[���Z�h>�K���#���Jѐ��eD4���t��|q��@u��պ��V�]��D�˙��s[����*��j�IG�o=�Uw��r�uYR�ϯO���"��Vʪ �p
W�ҺYX�KN4[rf���a���v��U(q�Rd�_��j�*�����8��*�mb�Q���!��lyV�i$�(��"�����r���/�T	�C0�D��j�o��~��P�:�+k�����i��hH(��o)GA2�| :*c��j�in�~3aW$�.}�������Y��Eh ���,��5e	�C�U\�Ԏ6lZr%D-�Ur��#�Vx�6�VD:�I�k�RJ�!�+���3�x�ѻ\���r����d��.��w����&���r���CG�37�Y�X��wצs��^�8��$�I�b3)�(�N:��l�J]����9���ё��l��Z��PR�[�P�C�sQ{�d�8g�<��ԟo�1��*�q��������m,΀�}�r��xF��9>�Wx����#��ц-�z)�^[W.�'��-��B�Ƶ�!�6Idl�&냿}��a]O��3���a���5z@�U�����=aQ��;ﮕ���z�v��>���E�zsz��{����o���b�{�S���0EYj���,��V^��w�V}y�W�Z>ȃA�8��C�����叩�:��-]�J.܆�:R|a�P������fKvJ;���~���a!n1	�xp��0�B�;���\���tT�~NR����_����PS�ν�˦m�$� �ZB-t;�Rv䲕�<�ӧ�{�G�SRn�<1Ҏ�T�ewPP��������Un��D�P�������_�V���3^���I�" �F���C����]0f�v@��X��/��&�A��c�#���[�Ν�3]�Y��$��瀡H3Ԣ}
��]u�}��4w�5C��5~�W�0�'\&[���
"1Ni��R��>(�H+U�A�s.$�oT�Bo`X?��	t��׀����ƌ��'����엥�'	�q~�J
%q�,k���e)�,���ɀ��A� ����m��Pۂ��3e|J��|�����aĚJ!�d=�#hq��5-�1��.��ɔ����&l�͌�G��w��8D뚞ཛྷ�U�R���4q"����R�
�/��틁�}�1o� )�����*wJ	Zy'��S}>��"�:������Q�Zr��N|�Ku�kA��9��V	b=a����~�������}�Ĥ?��6ӟ���7&�5��jԺ=^h�c�{��= �ZrB.���/�S�mf_�m��B����݈�o�C�L"�B�wԭ���dJke�gM���d$��2v��&���m��@F��x8l����C�>|��|���s�2��cYb�<�)��.ːDԏ�?��z�H=T�.ϦM�V�Q7�B:iS�o�,�{��8\��C�8l�~��\|-4�b�[fm��+>�_�W<Y�-�B�K�X�r��:>�.�,g\҂]{@�?f��i��PFon$�2�Ψ"�{��_�⬝p(I3�ix$��p?����m9�׀t���׃t�pg�s��������eOr3`�c�m���w�k0 �j	��J��U��s��Nj}�%�+!m����!}�!�t$P�cXW+����M��2�m�Q�2��{�¯����s���h#�R��T��+)p��2+��,��(?�wߔ3B��|ڭ3h�ٵv�b��!e��J�3A+��d����8�֝eWtE9�����AC+�9��4�����Ǿ��Q��?�MZQ��K{����M��^W��X��.i�_�ʜ��~B��_�S������")"���L���i���9�1ЛC.mc��Z����m�1%!��R�[\�.��oɼ���%���~�q�f��dn�\�ch�|Z<���2�_l�C��{/����OI������)�Q���]�%TlL0�>�gަx~}:�Q/�@�OsZ��w����ȮҎ���5�Q"*����#&,����4�&_�{f�'�\b�J"�黯���^��.�.��"�2�DՅ������;c��6}�����/4�"�o���RXɎ�I���7�>;U��#��
�x��;��H�I�����B2�qS�~�©J?�x��
'):�y��)AzFrF�����z^Y�0E���m�Z�7N��o�k�K=\3�F݊�`c�
�8e��/hC�6}��W�Y����ij��r[�ѣW
�9 a�<`-�!w�Nj���N!�E+݃������d�`�����?�K�� ���+3��0;+�u�ԍ�$���a�D^h���6��;c$�Lv�M!��k�&TI�cދ�S����v
�gUe�Oya@L�BSh|WÏz�/�����F��}�-���Y��$�.����c�,��E�⸑��I�E�]��u�׷B[�Y��YTޅ-$��e�4�"D}_8���暪ňme�}��%��b��g��}�H=�u0¸�i��%'&�����*?1ol�ì���]��M�X��.eŰLv�ƶO�ULg*1E�� %R�.Z��j��XE���i�^���v�7E����Ss��0f��Rq�,)&w]c��|I�0}R�!
���IH��s�7=�U����g�HQ���26�����՝�vM9�GS��Ѽ�e;M2� =M�¼�����e0I��iV[�~2�O
J|�ysH��i��;���(*2=f���"�1w��F 4-ōr!�j!�K�~���o9�����<	���"I�p���[�E�6�p��=�1�<��i
�;��+��jԣQ��C�G�����xQ�U�v�k^6'���11����@�^)d��-H.������{_�~O��`��dɟ��F��Uý��4P(r��Iҷ��l4*�Yh����� �ũ9�>!wn��=m�����#d�z9���|FL��7笚�?H˒�)g��<JQ��(��Q&��N�'SAY͢�F��Ա��3�^��vX�3�Z�g��s�������c�,h2IZ��y�B�:��yz��e|�����Y(��E�+��[s�f�)X�h|�P �cƘ��7����+s��������&![�4cK��I�pwV��B�_7!���:���N�A3���8E֪f��8l��-L���� R�{����5J�5��b���U����դF�������/`l�с&@�}r�fa������,�����H�Z��M�St�E�u0.G�ȡ[)��=���1nGW����y������?;o�#��a<��{.��x�P�Z�=W�\��r/�G{������'����<�Dd`�M0�U����2�pK��i��,��-��΅Kw��SG5�䟜`�-�6�)8C)hO�s%{񴪚�;�#z#�A\y���
��V[�'(�ۭ��j���|�`Ӣ&�s���'Z�'����9!}� �  ��~ij��\��'mIPyL0�H\�E/�eI~p�ȅ���s!��ua�:�T�t����!;�����b�}&IU3�s(a��-����2����>�C�Ě�E��?��k�Tj-�$1?b���Sm��h�A�@EǙ��1�oc"�I��Y���w��m�P��"�惦h(��O�n���(�Nɞ��}##u�N�z��£2,�q���Y����gl�"�6�~�\{��W�p�+��Ii�U����I6�^��]�	x��K�;�V^��)���8�0S�*���r�t1�K��$�W�K�]�t���N@��,�FB�lv�C��V��k�Ɂ���}4�m�t�#aG�ՙn� i��8�~��4w�0����8f�~�0����>!�ȹmk�/*�`K��{Us��I�I�w9:9�@�EU;�ʬ&�IFU^/�I�dP!�#�T�,��i4�&��.���8*Sd����F\g�@�he��wQ��ǟ;' "g����C�Zc�˒�J%M��,��Ǝ���@NP�r?���S�����
�C�����'�d�
��:�)��5l��v�Sw]v������k�S��*�SE�ް�;�t�	���bh�����C�kp��ǝq�r�@�����2�юϵy�ŉ2<-���Nێ$��tr�v����6�5~_[�|��8��z�/����vb�K�r?�,�Ѧ�?��������G�g��+�*������I��|��ʰ-w�8W8Y2�W/���˦�I5���V��lџ�o&#�$?�c�0c$���s�aN�1B0n-�EHagc�S����T�0���ux�����m���uN!��" �\U��-�p�����Ff�� _� ��q��u�犰�>)�8�=L%�pY'�GA;B����S"�߳
/��NК�&W`����>X���A�15��0�ժU�_�l��I	�?��T�����J�K���a�����z�ჸ`W6�yQ�Q���u�c��Z�W��A�o)�s:�h��A������]AϴK�5Oˁ~���M���3��?3��D�%�����'�����V;�C�z$�R�'�&�����%�,�	^ϟ��"�t��,�Q�
��� �H`�}���/�5�y�D�/t�b���rg(��1-�B�T|�7g-�v�Yo���Y��mFz��R^�){�=pTk���ᙚ��H��~C�Z:����\�R^�E�W�}<?mSi�)�����}�L���qv]7�F*.�
CB���A����� G�9�����L_�*���L�k���mɮ؁��%��R�s��JA96B�P����?Xv�6]�������*�=t�r�=�C�
9O��T�h���>=�aD��W�}<~BI��+w�]Z�ɗLi@�d��4T���]�--8s�_D������ �FIǢwzf��ϒ�i��Sд�ttkw������F�ֽw�d�[k�k��u͋�xy�Ҧ������Ϊ�F�s��a�v�;f|�K5�`�U(�ܬ�m;v�q�7`�!k`ٽse��[���_'�x��%���etů����^'u�c�E�A/��,7�7c(F�_'�-���:����"a�l�y����Y��t��9�S� iD:hV�Ӭ]�r�Z,G%I )��n�J�iUo����u2���p��K��E�ҝ�ɯz�;^���l*�*K���t���wJ��n��:��m?r���,��݌VH���ʫ_$}��>�óN�K�#�P�S	�3�]��3	I�w�D �����徲3]��]�b�ev�)���d ���k)N�q[�>+�Oc�Բ�ە%�W�c'��}��lL�r��mV%K�Y���8�H�H;�B;UўjD�4�$�OБ,�4���%�$~:�{)��6��5f��0+��$	'zB~P?�0b�{��( ��>����M�W�Y���/�r찗������l��ݲ؄3�8�|{$�̠CGzv! �4�֚8���^N�B�J�m�˰O�%�6��&�!�7,�Z~�q�e��v>���F�X���ry�UM�9��\-8�a?���)�à�*����5�X���T�h����9ć�aT�I�A����Q5��:��w
�=p���ܻ�N���Xz3�σ���]�liW�af6��H'�q�4ƞ��K�9�U���g��9o�M촍y��j�L_��(���wP���̶�i����c�5:��vy�s��C���'��7#ݴ�>o�^���N��.o�KŸ`c�O�1���erd@��?���
���:i�z/�>�=y���?�`�����,tɹ/�+J6�`�IFbGFrC$��}������j��1��r*�U"ۀ�_q����^�cfW�zQ�Xߵ�H��3��R{m�m���ꛒn�DX	����ױ���7$�+Ґ��=67�Ug�-OIڎ¢�������P+�s���d�޲wp����
��i���؁y�/�~���+2�S�'��v���\(�����z����bi��7��H�bA8�בR��\�Va�,E[̣6K��Q�vN�m�v4Dy�W��i?� f���,|x����^��MԞG�	��ֿ������y�5��w�i��,�x�vD�rV����w��)�uQ��JKhb���4M�β)����S<�n6[P���6݆��sO�p]q��Oi��c$���8"{�2+��5q�A�I�0����I��1�w.	J��U�S")5.��I~d�~Y9EV��J�J�K
8�����eLh(Z���a�Ю�r��zGl������ԙ�0�r�w�x�����c<!^���I��=���{�� �j�齚&҉��W��2��(ZX�t��7dSfHBs�vA��^��ś�I�8��ND���k[H��ĕ��F<�]F֞0MU@X�$�� ��3����p�g�ϥ;R&=�9��u�����'X/iG��z���$;�F�e
|M��������v�Sg���z{_��o�����7~xŁ�/�m+2G��z����X���vK�Ao3�
��Y��W|�����N���K�Z6)�$�� �vO|�>G���ͩk&� ce��'=ClG�@�i�HP�(��Q줽hˈ�2q�j��-�SM�֤�B�@F�ȑ�tp}��O��˴���T�s��S�A���lY�.���Y�:7T��e��C��;5Y����� ����Z���w��t�`e>\�­�3i>��׋\�V����ށ�&	 J���&jU(��LH���Q3�)���#C+���V����ʂ�)�'�c�����r��9�����;o+���Z�t�� ���2?�8���q�f��C!˲L����n�m�or���~Tf�{����6y���?m����=��Ql0iT*���l�#z�����+~�i�d��zg�ǃ	E[K�;I�/�tO��ks�Q_���q��W�����0�_��o���$���            x������ � �            x������ � �            x������ � �            x������ � �      �      x��ے]Gr%���+�bY�ǽ��e��2}�^�j�/�6�|@%�&�@�mf
,�T �8h�J�����{��9{s��,��D��܉L���p_���+cL3Pr�ہ�i ����/g�1���/�TW��������⏆�3��W�� ������9z��������p����O�)��f�W���w�}�?�~��6~���?|��O�L�����������[��އ������#9�������x�������P!��I������o*>g�3.���9��|�����_K�k!Ź�`)xo��1^F�A���d�yH�J�s�����,Hg,�ญ��
�����ߎ�k�F�~���L5�]?���:c����Ň��+x�|x�O�?�{O(��p����=��ѿ������q��W��?gр��K��(|6����m¯4hց��G[�d����&h�Pe��.*�bI��̊*RÝrF�
��&���~�_��#�
jݖ�՛<�{�#>~6������{�fD�� �������з�g��}���Ь,Ӥ	�����n`��_�qS#�ۦp�>E	��ފd!CHJ��B��2C)�^r�-W*eg�-Y�G��'MRm%p�X	8��� ޑ�M��ю�`�A�G�3A�|K�WPF�Z��K�����e�+>�Ng�P��D���6��ޣ�I}���=���q�5�
 ���Iy�V$��8�!�(�ր���,�܈�֔3�"~5s�x��I�cMS+,��c� �ߑ�⁖����h���ķ��U$�wC=��*���c��܂��4P��-����ϓ1* 9}�������/���ߑ>���-�bZ!�n�AV�BE1�0	��!��I���i\�Z��HѸ���IEH2����k+
g[E�h�Z���юxT8R���0��z
!�MV���b_�.|~�M��a��)���m6wS~q$ܣ��y1��wGZ5Z�睐�uՅ�եh��1�	�<1aj�
��}�,iU�^j�"U�X�o�g�"�Ko�ٖ�Fȱ{�#>î0�v �r]!zNz`(���g1$O�"�7$��і�0]�%\<0	^*����EI��E:U<:�0�p�N�eVj�Tp�b jBP<�V���Yǚ�b�;2�*[�N|Q�9f��s�����V�(d���o����ǣO���0��'R�=ЪN��w�D��~vS�`���f!�S�73���(2&�.o�s9$4��Q����}q��5� �mCݕ5R�ͣ���7]4���3>q�:���>5��{�9ww`&��B;"��hyyD 1S��`v	�� �J�����W�Ds�K�ڀg�' �d��h�[XcʉX�kS}��TS.БmO��ю�~�9��F�rޯ���r���4b���s�Y�k���{��az�.N͠���E�I�%�C��H��,�H/3��� Vc�}�&{cP85�,8k����z�Yl�<Bi'�U������b�g�����^���V�����(�����H�T'O������e˴���Z(�s���΋����1�r�%�'*[Ђ`�g�e�y�]����!����2�[h*���\Q�m�ߓ5R�ͣ�E�����4f��W�#����)��#V���JG���s��r�E��g��\���������yf�) �R�����c�-<����|�&�g'�䅉$Z/�Ŝ*�"�,�'=H�+��qB�V`��U�����lg�w�.�a-M���O�W��z4F��2��j�!�[2�9�C�Oq�]T���78��%�~鬴����K-F����oB��Dc�T����0��x�(��3�<�g��!	�Z	���c��mr}ٕ���ю���o%����M�9��E~�_�W�ݾ��]����l��L���"��Mx��H\g�Y�6���a��s�!BfZt�syg�v^{���u�sl�8�fm�+�er�G;�sJ�|�*���E=�c`_�����W���9ܯ����c��~v��׌)�X���
��
Ϣ_U�{:��o��`��o-���vT�6��Vq��]i�b����=^9e�r(6���� ��8,7:�©����7�[�-���ɠ]�딒/��`�������q��U������"��c=��ū�0�|~}5���v:.@X�zi�	s�$���Y.�I)g���%�ƚ>))4(.�C��s�"��tP׿D���+z��"�Q�M��	��Z��_Q�������d}�'�OWF�o8�N�� ��'�;���a��+����\��#G�f}�K�@)��DL�S�bt3 ��/�a~O֪��f��w�aR��d�?.�����0�1�쳻�������\������R�(r0^��C��	��1���Zcb����@x�'��*e��G^Z�B]o��UOּԍ+���"�cڌ�-�B�+χ�^�������+V��]��,�}��'��������<���v�xexH������-��)�b|8`�$���N ~!�軼mz{cܺ��V7#c9�#k4l��G��h�т�t��l��U��h��y��9��y�7���m�D@�^�׶U `@Cmd� �>F)7!Z�F��(�4٫$s� Ä��V).��Pӝ�:��X�i@;m��%�a�{�#>��+&`9�� ���۷��@w�������T�/.��������#�1�+"y���E�`OEQa�'��A�u):a�g�a��>^�+A�&�ܪ��\�՟î~����w�����i������895�~[!�����S�l�Q�jSЍ껭��q�跭������xn��@?j�m�����Fq6�h��G�Ȣ��q!cp����GV��l���te���{�#>�q����bf���q�Wnc���?���Bk.{s�zf�'�-�st�.^Y[�u
DT��F(� �u�1��O�|��aYbF��d0W5:�bܠ�;9%���k�Ŷ��te���{�#>�KG,5`<����B���U��t:�._�U��P���o�i��R�b�K� �q.0bN��5�|���~,�[�ń�35zZ���tl�a+�[YՕ�nhZEڝ���pbo	�ъ��Y��W�e��k��f��޴����VE�����G�x5u��<��W�3��sog�,�t�utB�g	���)�0s�Y%'�t��&G�$Q���0��\/Fa�M9�hF����q�	��&~gk�����/�=��aX[���7�b������[Y�2>.+|�J�J�G:����|�L�ۖ���lp��h+�c}e�)0�jA@[ 6dkb�2�T�
W�J"K�)c̗1~0�:c0iKi*�rz��щՑ�Pw��,ר韣o&K0Y�ߏ����ߛ:iɢ�ε�N�:�en��:5?��g�1�������ok�ؒ���E�_Kp�6��PdbAZlr���L{�y�:r	2�M�n{�įx���جD�CM}�\�2;�J�F��Z�����yu�)��F��̭Y�� ���1\�_��r��µ�҇{<D*�v���Q��:z�)��`��@��(F1�"bA��13ţDϠ�V ^ �"J� F�/�:��-)�z�턖zH�F�В����юx�}� �U!��T~��/�b|s<-�۹3vYO% �����������?��?|�_����?������/9����8U}�>���Ã9��S������l`�gT�%���� ����s�Io$:%��=	�(q���U!*ō�g�٤�";�!In)	�*|3U��MY{�p���WV�W������ų�Jh<�߬Q�fJJ���_��o<N��~@��h���+��t�7m��7ı�� ]x�η̕�QD����@@�i��F�QBb2b�I� ��F�7��Z��Vx�ڡ��ю��~�	1kAX<��P[���jEh�������h��cS�q�n2�����v�����b����=�Rh�+V3�낆�JQ0��P�Q�    ��I��������h#7��|["��Qo�v��f�l��a}��u�1x2�x>��;iZ�	��O�t���K�I3O��#�.~���9��&�#���T���[����R�V��hl�W΀o;�ǑӦ�14����3��К��)�i���0O����c;�o�r���^�h�e�f��k��d��C(F�b�`x�Y��b���0q�pR9��Y�Q��Y��[����P/�֡�k�egj��QҸ�1s�*���B�i��IF�N���0��xG���2'�}̘&�L�5B!���4 �u����@�s�0�B�a��[c^�9%V��]#���Z��Vs�N|�8(��)?x~�i�f�6z7��?'���^y�eo�m`ƲN;�	���!F��;��Yjj��(���B��a4%+F	�3>����-U�Ra�Wr���F�%�����9!��e�Mo��?�`ܮ
1�To��u����� �{�T��O��2b�A�@t"L*%Ѣ�aǤ��h8�Vd�>�����@gh�1�*@Y�*��m k���~K��8���8��ٛ��="�m-��=�DLs�:������=ʝ�>��a�b��3o]�ܔDќ6* fz���`7�)s��4�
\�I��xν�!���eub��Аq֘��=��cׁ��q5�v<�۽���_ϣ��Fw�!�[6�C޹
`�q޹*>���,J�$�����"�v	ݶ�C0&!vY��c���|0���H=|i�6%>���:�V���B;�9�a|�#�p)�.=ֿEs��O�A�M��n_=���g���u�;Yw���� *AAnhn��(]b��D�0�����L�?7ƃ)&'��4�k�J���kR �5ې�#ku��Fg�N|�}�2�{�쩯ǋ��G�ߧ�V�P���pl_�s�X�oXg@�ma�G[����h��әIm�u����\;�!��*�و�������a��#q�����b֑�j��G;�q�{�gs�`����i.���b�'�an�/�̩N�|
>�K�V�17��Т(j���p��BV>�q�x�m�
�`v�L>#W=�d5�P�d�6�v��G��C5�?V�xL������m �)yq�X�r�"C��l���t�QX!5�m*<�K�x	R�G��f��b��h:�&jά��m��l7�{�#>��J33�4.��4�\��+�S������Z�ZX��Zn���P
as��TN&�i<zL1�"����H ��Up�S!L�B�4���r��N�l�֒5
�G;�:��;Ľ�����|���'e��k�zª��V?�v���C�k_=������EV"*�<F��((6'�U*���	В*T��40͹�9gV�y4��k8����'k0͑֝��*�5l�����H����>_:�i8Q��Fj
Y�J��CZ��w���Z9���C��5��?���YD.{��NJ:!A�QPI����8�8�%d5�����9���Z����[v�sN�a�-V����G#���|�s:��5�������`V�IC��<�!�L��JZOd�-�	�F_$�0��Sbf�E�)h$R16��'��Ey�UG��O����[1b�vN�t��M}��5A�+���B�^��Ds!��?��=N�=m?6�`��<������~��ݶ
\p��@:�&>h�i�MUB�CN2�ш3a��,���ؘ1�r6�Y�w>X�1h���s��ڜAn�vQ��ю��>�ݫo�?~ϜS���#��z�<� �ΒK�QWs�ٓe�q�A �}�]�:�q�q��b' dr��0Ģ6d��UL,�FS�,{�*o$�I�J���j��>�maQwe-j�(6�ğ�8殯Ǒ�/�Ϳ�)F^,
7�6l�ؙ}rG���Ih��g���A"Gt�
���qHA$b~+�шG�&��Bq&;i��y�>V&�Scv�@3r�leTL������G��15&�1r�
9�{���s�泥���`�Bp;�c�2�T
}�I`�2���&ů0N(������q�g���`0�#2���h$�LG�#�(:J�IGt=��>�H�J�*������������ݣ�7��w�'RZQ'���|7�F��w���u���3}�ɞ�G���3�^�D��=��7Nt}���}(���$piB���+wR$�
r���_ Y��}ֺp_B�x�s[jaJ^�p�>@[Nr�)����_s�3�	���p��pë�X�G�'�U�Q�6����v��K%�$��������� ����%ݹ�#�D����[Z�3��`�m� `v2�l��?:�Y�U�$��RC��T`#�~5���5�z;kǷ���5И���G��)<��9ut�.p�L��PxH��,�	t�"Y�)'��J�({�o�Sa��`���� &�=�kY����F�GW��@װX38l�/�F�������k�t�|�]�r}�h$��Q���3��$3S��m�	ә�����h�VhaM��9�bL��~Q	n<����)jq+����V|�|�g����<_�W��f��F��&ꅱ�n��v����F��<�#&g-/�����(]A�Bɐ�il&ru-1iq�/1�I���6l�����'tl���������Qw�Ny�3A/���r˵�L8��3 Y( ��Y���s��$���A�+B���fфOU�C�#6�o\4d��x7���$�ۉ��P����멕q�?��:��7�C�ę�bU;ա4aRs�2�G �B:Ll0�2�0/�hx�A�!eQF����T�,~a�6���T4����u��W�ۊ/��WsO��r�0Ss���tP�7�Oo��YWD`b<r)�j0%�E4��VV�a�@�ɇ�0�� V�)���JyO�EX�M05��\�#B[���u����k�`R�,�㫺�z��2fP	������?��c�:���)!&-�O�T�"�?I�����Y&�`Y����9Y�ex����Uz_>"Vq��+����=�޺�݈/��
�������qk1Y�mw����S&P�v�O ��c�Jp�;L@b6q2�X�~�L��4ݪ7VRe���e��{��b��}�]�Z6Z�f=��i��s
��Q|}|(�;��C�0� ���m�v���8��݌F@>�숽�z�v�~a�o�/{�Zh��S-�m�EeIj͜��s�t���$Y����8$%"�{4��D�'2������at����]'aG��.tmF�������\px4��nk#����Ҷ��=������S�~ﾶ��롲g�*1M\�(�,ԣ��4���e��X��(�@�lO�J�}�M�y�]ζ����`��l?=�\=,�|�l��
����Z���s�C�qD�v��
SVcB�xX�6m� \���e��:��c����;�od����&���0v��)l�����K�o<�?�wsx.ʾ�WA�/Ǟ_j����	��qGL{���E�I�2�Zi�A�V�k�YN`P1r�v>�$U��uA���ɮq��>ujL{�]a?�eW�6��>���&���J����w�*���,�%�Y�)7��-}谀3�5\h�p��I=����;�,��4�gt���bRJz��I-��y���ј��㼣�:�]��Z�����a����7*_��+����恑����ￜ��D�S�Ά(���?Q�4X��C�0о�'tg����!l�z[����
�I��(<��\��-Q�1ʊ����WI��j��\/"�A\G��|�<��?62鼮'��z�t98ы�w���wc��l~�NӴ0��x��j@�h�iÏ��(�1>,Fd�D�0�K��]�E��h�Ή��:���h�=�5��N����i�y=�W�*���@<�M$��S(p����e|{��#����	C�`%��K������(i}��F��.F���Dg���Ԍ�� #7� �-�+k�h������v	�N��c    ���<��`Y�l�v�S�A�&����6�0�>_z�ܫ�HM��!�1�^�C�1�w��O���*C���+͒��/:� ���0�SQh #3-zi�ݚK�:��,��n�G�^�7{qK;��8�$ӿSS��.�����J@�K3?�z+����c�_x(<N�p�)����q'��0��y�&������^X������ߝ讬U�mݧ�ė�m^�w�j���-�aEYzu�@G�����s������X`t �Lb�7R��.#�>K���ڽ����D�-/Q���Zζ�ۢ]O�(�5G�w��>ӫQ���U�����[�z��G�[%>օ�+�i#x���D�.�#��:`D�#�unF{��LF1([�S�2�u9G��1��x�3W�7
|�8�=��8�-YkHX4�}�ğЅ�ǩ���|?�k��DM���p]�-r�v��9m�����1�x��&��;�QAd��`L�>'4i�s����3�PТ豈�8v#>�m�֓5b�ͣ�yT|��}3Ϯ>>V������W�Z��V�M�D��rϝ$)��q:�����$��x��W`yF󭵳h�����$E�:-�p,a�-��?�Zqt�-\�4v����KKf�.�M�?q��Ŵ����a^��އ���nj��zv��S�`�/��gޞq�jl����n廾� ���I�x���3�f�1Y��)2ǭ)%P�1�A^�@{����w` Ţq˧�M� �a�&����].ޑu�������Gg���3��&j�����o�};4;5:w̊�;0w6��O0�*O���MLH����HE���朘@�
�10t�Z|��LH�XE$.�%�>�0+Ʒe��Ύ��������ո�����D���������b)��'�rr���<�M��6��z�d�!��D�D�H��,xc2�h��e0�v�Z�H^�d�|3��"�R:�k��|�}�#��Z�.�Y l���71^M����O�t���������]�}`��d�Y!�����FIo�Q�!x#���Ƣl̸,&e<%D�����w[{z���kn�و� ��c��s�����OG�Y�����ݘ��;qk��d��R.RHA[!>���m�����+�-nhۃ4��'���`(��W^4��J��Cu��AjO����~G����Ņ�U5}6c�n��k<�oǎ83�r�pD�µ6t�&�0��* �ݥ,}��`�F�H�K�^�q�M������^���?p峴�c �1�k�}bW߄m{:Վ�E���*�/��3�ĥ|�B��܁���oj(+�U�#���տ�숧�ϕn���u�;.�3z��}
�yN��Z|�ѫ�LKv��B\}AZD:�l0���vИ��+HMFe��U<��pG�BݴQ7��I��&u�X��=���x���j�q�bl��f!f�z�~}�;������p_�j�ce�B�ř�8;Z�����I�(�@�"���2�A>6:<��X�濤��XFC���\�\��-�{th�5�'�ﾙ3��:�ќ>�مwQ	�n�!�7E�а���n!�hi6�,BI�"�sh��1�%i�uN�u8�рs����GVv��2�M�|W?����}���F|~�������	"��4�s� �M�s�Hơ� | g��AE���"�HQ��T�:��cj�1����g\��1�"u�~Y���5��=G��/���u�����O�w*%�d�ؼOw�
--�:��|P2 RT��JLgNM�脓��QQ3�͐�`Br�Z���l��z�FAl�hG|��Ûv�_���|��n�q邨���k��a�pZN��{��!�%m�-;?�PL��IQ��"���橍�4����� @˭�|Cb|���V4�l�g�)k�����N|I�!�:U�׵fr`��x��&�/&c>������ےϭ��z+ׄ�c6��4{^;�˺�'�DH��Z�Q�%Q�Ec�@�y��Z��]���S�,�:T��J�V���hl���Z&��!�77d�R�#�����7��:������w��b5�ol�|Fף�u��䫇�q�����t��CPR��A�-A��9Z}��$��ũ�@� Q��I ���;h�,v���+Z2h��y�mc/>�.T.w�KS���渱��1��1�s��]��p��_�k�W�uiY�ս���WQ�CLКXt����B�u`���Tj�B[����Y��ʆ� �74!Vvݵ�WV�}CMYk�7��N|~R��l�ǎ��ü���Ē>_��QM��\��<=��|5{��W���vÁ4�볾bP��w�@N�s]��Ji(���xRj��Q�
mL�HVf������m�_X�ץ)k��4{��n��<�)=_�|�O�]��_���[��?��cF�ť~�?Q����
H��e���d
�*˔�?׎%��h~%��& ��Iy�]���+�wd��i��u#>�/�}�?�Ē/����Խ8����s������k��E�1 ��Q���: �Kl�u����J�L�]y��49{�P�Q��B���	�:�d�ux�O��;m��L��>.�`�{�v��=Y�"��¼�s�ʗݤ�ڳ��qY)��QA|Zhm����Y��n]�\�#03��C8�P��/)_�.L'��qǰ�;�Ƅ�a��d+Z0+��'߯ch�mP��G;��ɥ�����{z����៦l������vY���9�œ�����լ��1����E;aED/�	�H	J�F�A��L �CAW��&�7y�Sg_:���q���Z���l����ϯϾ�����:�:N-��0U���g�`�7�;�z�UՒʬ{ص���~������^�dT��I�u1� ��d}򃆀�D��8�}2/9����&CS%��v\@c�]S�n�����g�ZjC͛N���4�l��,�n�������՜26ˁ����6A�ޯ��V��E)�~x�&.�%L��A+���L�.{����X�wj��Yf҃_��X��RkY�o~��V��,��4w�\�W�{[�{�h��l�,�`���]�:g�w���p�c����E���E� �,
��Bc��b�&e�aC�n��ϲ��|]Xz��.��c��X6xt����Y�-�G�hP�@.ց�rL���LG�"�4���
�6��$8���<����<�u��M�hOA֑�+CMZ2~)-�`��q7�宆����L+�iڤ�^���C������FN''��uv�q� ;� gI�5�U(!�PP ����G[�ՠ�OB����C�6���|)�.��۝�Ql��\��^L}Wo��D~8&��1N�}������5�Fx�:ѽ�UǺ�07#�6���9k}�>Ȓ]ׄ!gOlsV&�,�v������.���䎶bW���Z��>�ŧT�&j�iT�Q5��FRޱ���{�����t�r0us�I���i����}�x<uI1s�oL2�Ŝ�*�rV<�Y����bT2������1�ؑ���IG������/�!�v�Pz<� s��Ug&�
�ѫ��6(�{�o������P�׉'�=SF̰D�Ri���LA��6�$**4B��-BU�@u���ߐ��� �U�[�+�H�1��g�x]�;d-	V��%	��l�0'��_ɍ�P�����n�qG��jܿ�����3e�0U�f���ij�[oݽ��]� �F�1��U'�"��3o!�{Q����N�2�8dL�#�%i�:+���x0�,%�}[$�x����yw�ґu��[�xs�T��e��1M�������g�ɯ�����B��-/[�SM�X�k
�0k�s��x�,���__F%�l���6�"�)����4�裭��'L�,z��cԢ*���A$��!D�c˨rM&e����U�����t�F�s�ù�K/��pa4�VcnH2׬ώ����i@���4��K��ꯥ-��#���/������� :u�9S�`�<0�#���I���m�&7e�q�}��N|    ��ّO����cZ9:�#��w��j��6V������*����Y(ԉT����7�FG�>
��7hÂK�9z�b��	{*޹�QZ�2�7:�K"3������ϗ	�����#�4g�ovI�:靖E}���I�tEE���Kv*��'
<�����]*⟘�3I!z��*�]��i��:�u�n.�n��C��u�䇋�w��	�4����~��:��z)���8j�E�d�����D�)M/���b���c|'h�H}MFk��K�sMP�m8�rY+��� ~'>Tç�d�_,ݓ_�Ȗ������?��۪���O�n�v�;�S%:O�5�:]xREP��u�I1�-�
�`�Y��IC��g���lZ�;����EO�r޶9Z�������*	���YޮH"����:M�:׽�̰�4"���q��5/���GM�3k�9;�/
��/�Y�2���^�\|.�z}���D`������#ke��*����;��S�����`^6x�b��\%
��$�P��q>�o�xe{>�S|�T3�v78̲0��ڨFEGaWQ/�B{/��*�\�٪̕Z&0�J���Ƀ�|�i,���Z�0�}Ib.�aˡ|7G�j0^'�jz�v����G����O0�kS��s�\�K�3��5b��ʦ���;`Rm<�a���H�h��s�C9���D�HFG��30��A�������d�wK�D����w#a���� lI�!�h�w3̂d/�n�VM�䍋1"�)an]�XH�9(2.x�qA�
��
�7#b���EO��9s�8k�>&����8wd��v�u_�;�g/kd�^���z��*�2W{�� �f^�]qy6g��X�����p�Ё�5�c�l/j��d��Ƀ-ѫB�Q�Xz�<p~ �W��ˠ�-BάAO�!H�5B�wb�q��턄]GCG�&�ݷ��ģ�#�N�^���j����՜t�Ε.���Hg�Mknm_>�D{=g���	>Z�?��6�1��#�'V�$���=t�%
��x�
�w�wC���o�(�+k�L�Fee'���u\��x^�D[�1*�ɛR���}�Y�zD�E�ғ�⺦K���eS��\�	uy¥� -s�ń�8�w�(d��U�A��/�VFAR�'{Q'���O<z����B�縁��I��/'���.L}�3�u�/u��X ��r��Lw-�H�e-�364�)e4���c �Ā�#&'�����
����z�}�	��E�v��I^�AL8z��<���z&~��5UډX��Z�֑�X����#�@đ�S�b\�0�� �%NWl�+����Y�hЙ�4�б��[�'�R�j̱ўk){Y���6l�N|�q5O�����Ѱ��MՌ��v��_���w*��:;Zйn�|0Q�T�!�^"	��j�)<~��!yn=s�:e�ɔ���;�z�.&-�H �9��ڔ�YBy�%�_�j��ƥ��r�o�F��CXW��ʡq�\���{{W��B/���\�h���I!�%99�мc���E�9HԩYg�c����Z��E��\s�}ͽ'k������n�B>��Ǽ���B$�x�d�lbw���;�C�P�

ó��t��%��Rr�iwe���*L��8(<��N��٥�9&	H���6��T9��Ж�h�Q�]NO֡�j���}9z&9y9Q�Ow��j�����-��ܖ�P�����~@�P����$1#4R�k׻.Y�#�A���Ӏ�A� Z�R���I��߼y03��d-2h�zw�*���J/c/��=y�&�<�����6�r�a�!�m��S:�J���� �'�LdT�!p�K���F�\�$b�$E�M���F�Ex����g�� �ﮦw��M�6�Q�����Sߍm����8u�eS$g�)�e�2��^j9�1����M?	��R S&'):�Sth'�J'�Q��+U��g��]�o�hG|�}=��8N;l��_���BUI��o)�3/�7uW�Q�tۀc�%;!�)�J�ȁ��	����yoR��*�+J�f��¼B��!�.����������:���zo������M1^>�4e��&��\�i�1�f�Ǚ���Q�r�'�xo���#3M.`���y{��6�p�x��z�{I9�朇�"���e�&���fT?��q{�ݑ��,����=m���c9�eY.���G�=�䊭Y�>��w~n�[����KSY:XL߉��r�ݒa�*ƀL��A�]�*(!g|¤�`�.a��p���\ ^7��R�#�Sni��-����d� ��8*��f�)Πe��[F��Q���ٙs.[����v�����m�����礛<��/]��-�8!�`Z��nz{Yx�9��N{ܲ�g�������jhI�����k%	x4f��P�{)s�#�b��&۸Z�M�vvd-\��ׅ���U�5N��@4.�?�?�o�\�mt��mol��ɞO@K;:���9f����\(Q�
���� 3�M)����#�l��4�	-z;6����:� �.
�ʜ� �!V/�WǗX��������Z� Mݦxӝ-+����iF���悎Ν�u�\�s�x&�A+�y!�C�D`�rK�G.J_$Q�F�c��������A�]�cG��y{�/nZ�L��M����ɳeH�U�QR]��ڐ��i�E��^��@�����J:bh�
SZ�?�|.CQY|% ��6�,F��_32�-�1�c�hk7~֓��Xs$m#>�<#�\���K��B��N7�P�������k�jW���o4�{�;{=�Ƴ�[���a^����(�$���o�����m���l��x�hC�$.FU5?��v6`� ۑ��b��!��{o^��x�ox0ѱ���lc�T���<y�.�Y�~�غ���AgC2� D�cf�vD;.��	��U%"���Ax�Lp�j�0N���@��`�n�mמ}���E�%�^�V,����?W�q$��|��ߛ;�O�ɚim���9r�Ym��>1r��H44�G#BYZ�-��B*<�)3��}��.�K�����$�s'�4
�����b1�S4e�j��Ѱn����讬��[}3;�E�������z�i���)�lF��ĵ��?��ӆy���*0�R7lD��J�o�X T�te���i�MǀIz(���픖��0�d1R&F;:���W�֙hCgeX����y��l��/�7y3���:B���^/�!��[3O����8����@m��e�}��x�	<�Y��JIiua�.�#�J%�c�8���M�)�c��Z@��t7�֑��\{:�5��O�z��W#ZO�2��8n���￪_��H�}Xч��+��La?Ϯ�1,�'y9��}F�mIeD�Pڗ�I����|΋^d:�2c��}b��,I�X�8x�~?nސ��m�6G�ݥ�A�`3d�/���3��,��-4��-Ah'`\r}ihXWC��e0�wC���/tk�YQ"��Q'�q��.��1�ȦR l�?�M�X)ǴeW�����cs@������s���NU����+���T����c��|�5bܡ/8��9�bB�~���i�� *3b�̓V����
>��=���3k�/���v��Y�)�_.�uמ�٬�*�ul�:n`�Q�¿L~_5�A�X����?9�.��N������!��k�����$�e���,K<��z�w^I��6�H1�a@W)�|c?�H��s��f'Gb�[�|}AE���i)G.+������Ӑ-�{�Z�:�O`̀V�M�9�x�Ą��(ݥ�K�6K��ѻ�T��d��P2Y�:�H�����+�Y�j/�U{�i�N��ۅ�w���<{�|��4�(�d�m�ҏ~��A��֗g���t�!�h9{�	PC���$���x��E�R��f�އ��g�SA	�AE+�xPb,�B-�pJ�Mn�w��Ykҵ'eݧG��{�Q�۸CQ���,ɝ�\п�}�BNld�k���[(T�G�	��� ��    *D�����Э���	�=�Y���o�xO>�8-���P�4�;�ټ��_��L��"��X^�ݪ��M�z{�w�н�yNw� y��F�m<�s	���1�S�F�k���p<�,�����J�%Kܣ��{]����[����ܔ�o���w�3�%�X���n�W�����=�������
z�u���N�	�А�wv\f �I�he��x���̦lE�,�"D'},���rh)�`���	Ȟ�1�y�#>'���T��<����\� ^�d��#�#-��-_ł��}b����Ѣ�k�;D(�4�˗��ʹ�%F$%���� ~�\�#K�Em��\
Y����=�"����J�rp��vWh�6���c�N�'O���g�׹W�N�v}d���p{>��QďD)\�Zz��@ĜY�#FQ�u�b��Y�űh%�O���=LYؐZ�����ZQ\�w�������#G�xᴙ�C�ݐX� #�c���rdu� ��1���:&����Kk��by`�0���bQ;��7Vp�]������u�|g�;��u^?�_�J���9��1#z8�Xv���twBU�:��X��)Ixoj�Z���q�e%�T<���g.�u�Ӝ"����Y�VNG���C�%���u"*�z.��뎬r���֍���;�~yTo��^���q���W�>;ʱ�w+m��JF	ӻL�#���Y��:'���t�&����D+��� �L��8'����$�-��m��e�#k�L�Z�.c���-���N��G3#c����(�d�wh���rnV��w���呦����A`��?���m��R��,�IƂؠ���d�P\񖛒K�AT{2���E�@�#ki�nk��t�au�����|�������.=nh]��5��HS�⪳�����ȧ�A�2[��3�CO+Y!�l����EqB��6t�����){ȩ� ��6�>v-tYg�j��N|b[�ӣ!������òJ���i��O��}ԟr�޶���]u.O"��4���9ө��\Ҝh+�����fJ)�׵��2�4o�Rl�b'�������]Y{�d'��z컹q��0�=�@_��m5�w1k|o�O�gV�)�{�@����NŎ��B����n�x�ςt�����A�\�x[�h5Sp�1�3Ezx�[У����u�x������6��Ӽ �z)lE_���)�wo܌�ܚ��^7���9����])YRA��bR.l�.��@;Y��'�B��{�N����~��Gwe-/���_�>N�K��8��r��|9�;�U0���w7�����_��~w��8L���^�{dй{��-�Ӷ�E�7����R��h�*R���(r0��E~�"\�{�� ,��(�ߨ
�|G����w�K;l�M�Ut������['W:|k�q�Z�@�M�����v��55�st��FfU�̧���PB�6 �x��M�"5����#u�(ב�
u�m*쥗l���E�FV��y����M=��ѝ�\@�v�89Ѽ]�]ᤒ2[C���U ���:x���*�Wn.�T\K^�6v6��n5nG�:��M(�����΄���|M����zK�����tV�1nLw5_M��w�YL�rax�.`y�M��Y3�r��y1g}4��h���n�)�/|�a�t�F��o�����&t���N�om�ö�2o�z�q��uZ�^�C9xk3�Z������%LEtL\�Z��D��p�ϢxrŘ�k������+�K%������y�hG|�t��g�4�h� |���pj�Z����n�7���.͵q��
�.5�rP)������׺ҿg����8I-�F0��A訉[Fi�(l~��8��q;֓�pnߘ]��"�� ����b��ͭ��<�>M9�zAw\���\��6�h��� c��D��KːD�b%���4�L˱5s���E���<H���v����X�xӟ����!�<��I�����̮\�S�f���da^o���t��J���vojGN3�UN��s�Q/�.���#�`���֖V.+�n�MLk{�̺'k�\�\�O����s��h��U}�_ֲ�oj�������[���?L5U����5����t���j��ذ�7o�a��V-:;VQ-0<�Ω�ɵ�E�mK(��R:�diV���/��^���9��=��0=�m�X'\ԇ�8�MY��g�v�s�}�0M�O.=����a]�Z�A��8��o���WU�u'𥀖���Q9�3d��¤d�9%Шa���1C#8%S*.e�j��>��0̰��nc���������]�޸�?,?G1ۋu��h�����U��u,��j"��h����Yg�2���O����y=bQ�,1����_4�����
m�P4�
��i���lf�7%�+۝�ݣ�=��C~�T�vtxTU��<�2��3u~s2��}���̮����̮��+c�J�>j�/RC��Ę���e�^gDj�	I��F`���A�v�ek�{�����߈/���0� u��R_]fJǮǙ�F�����hv�m�O���˪$������/�m��N�֦�N�� ����cXg���h���#�w�d1P�Jﴏ]f(�`,I7�0�M����^�A㦵)k߾6k���A�m��6�[���$����蚽e�8��ڦ8f���e�9�
�@h�uFp�t�)L�B�Qz!e��$r)�	&cn�7s��l?�ڦ3G�^Nw}�>͎Q���6t}J���Q�I�9�_(Zi��@r�Ċ��0���-F{1bJx"E����֓`V�q�TOG� �_���U��f�\62���MF� պ[���s#�7��IWgOoD'� �w/*]��,'�dǽ�� ��Z��F��F�M�h~YAˬ��e%�����x�c��3�v��(n�#k�=�v��RW���9�8����1O����/����-�̨��ֲ��S��	��s�Ù3R�B�Q1��1+��J���ԟ�1%�(��F[ ;@��f�iW�[�Vݕ�<�lw��K�\��uX�3�2���c�|�����#��Dt�}��af-�C23愯
��:D�M�` &G���	��l���*�jz��oY�tW�!dm�w^�Ԅ�y�����]��z?��M�n�f"�ʞqD�b�v��V�t�F��W�ꬮE@���%b�J +�8�b��֬� ݧ*+e
� ـA��Ci1��`�z3�8J��7ֶ���)k��mN����@��\��h��Syq�ݢ�<Y߬O���:�w��n��	��4�(�WT@�Y@�K�"~��̢�����
�����eSS�����Rm��Wl�ڞ��=%����jv����┪�%�?��w��WL��R�l/T�� X�.O����tc2B��]7EL/E�'>���Q�㕄����m��>���ZF���'��6�|D�������֝N�A�������`Bb>I1LU�4�� ����F�)�\D�Y��D��҄��KB;Ӷ�Ilڏk�ĦG�C;��m��Z�}B��|�����?8x?Y�M���Ԧ�{�i�Ϳ��q�ݒ3�z��'�!Gi9T!yI�Љ�YK�/�)�^�,eִX�Xr ޣd~��+��qV�q�����+k��=�;�E�y�����\���p��� ������ް	���R����]6G.;�r��Ѓ��LEq+Af�,p�e62��,�hh՝-
ͻt�D���Է݂�Ф�:(�7�udm��f)�_��'���\X���\qJ}K�d:�6;*���3<�����	�eq�x���!k�h�=�2m�sε�B**Y��/�XϢ�9���u6����_��X[u�?h<��p�e����viI�*�S����9Ďb`'3T>c
���j-�u�?(@T��B�U�+��ZB.����`�ƫ���@N��yZ�f�T��p^�Q���O>��h^�#��ul{�m�zI�Fdf�����$:BQFk��GG�QO�����|N�op�"�ڸ�Ѕ�9п����    �a�)o}�b�V�K-|�q���W�꣜#f����n<�]1��<�g;)(A��$Y/��q�4�QT��:�N���ec��k�{G��P���+�>?����l^^~������W=F���h EưT<TJ-t�1c2�� �4\e��)�/�c��������Vs�-H�L��N"��1e~��z{4��* ��7t��kfx�]:�w=�au/����+��x
�e�j$���pL�
&�N�9Q�`�vsH�'�2��An�1 s���tK(w��v�e�r�{��d��]��>�Hc,z�?N@�D� =("E�a�3�N&u�J1`��2�����Z�@�&A8�v�u���S���'kս��v�rr8����<�8��y71?ߘ����Oc��D/�K�lW!"ս�p�q��K@���T�ɳ�.#�:I�=H}2��$yi�h)��B�>o˚a�h�����{�\�����ec�B�����|;���Q�[_��-��n=�#�&� �%��+3 �TR�h�� �O ϸ��E��v.j����q�# M�n����#k���q�p��c�/g��}ku�z���'�'�_����Tk9�������-�{+�����o�̗�� W0(+�K��#W΅P�m��<�`J��9�C��r�9 �6��ӎtd���Y�K�HР�C6�M~0Rm��/灷��P��3���ҭ'3��d���#�����J�!�@���<��1�s�R^���k1�@��L��J.:1�c����Yk,
�O~��j�\ud��L5�g=W�e]���a}1�F.���z���E�c7w3"s�m�םeeoU�	���J8����"��=��0���j`^�dcb�VQ` �`�699WJkT]�\y۸���Z�ڶ�9l�����r�u$�~1Ѹ�U
x+�.��t����"pU0�B`���Y�6E�����~s��!FQ�v,2Y��=3� ���"Vsr�MW�ڵ&^z'>'��̪��?��:���3so�oz�Xj]�n�u����$�"`Z@�����Č Lw�|2T�I�Wj?d<��]�p�3 j|�BJ&F ������j��vVw�hG|N��c��b���c! �kk��Lj��oF��+m���a�?*&?Qb:�2�0�*�	+��GOi<Z]���1�@�-+���V���	��-��`K�3��G;�sN�bb:�Ow�s\��y�����S�cݐ{g�sj�<�'�X�E[޵�c�r��� �b����m**��]	��y�cMq-G0��h��%ڱ����믇�u~��g�9�47��]��oN1:q(��0���K��Ӿ�w���W�~~�S&��b�S���s
X�t�M���,��@>�
��xL��D�#lF\���p�3\0���	�1� �ٗ���Lm�e����wۚ����[��k�i��v_���&��aT��v��6�TF4C2FYH*�����k��\+"��O��]?���s�<~���X�+S�X�)�z�o+T����T������B��^�U˷�x�AS�7�� "��1��4�U
���QԤ��=oh$({S��bZa�Ń��i7��k&dl���ݙn�N��7�/�$_}�5�����B���"��o�n�f2`�2vĚv�ǐ�K��i)�yC,\+0"�	H�e��Y$�0�<�����}�N��������G�º����U�Pcޯ+�Mp�o��œ�6mO��ߧR��~�ϋ�����lB�%��G�zH�,X�B)H��H�9q/Rf�ə�e�)��)p#Q�̉�S<	���D[�ÿq'?����lg�dp�+T�~�ؾ���L����-���t���>����;�1�$S��pk�:��k!�T�r z�#�l2Ff+�=3� �SV4o��&1r*iWb��
��ұ}B:t35����ƥң�l�5���ma�4���R�c-�т/86`A�_��;�)�C𹔑��x����Q6�j|��ѝ%{�VDeΗF%�w�3�q���Y�f�!���U�گ�}7"������x�,��=���}=�e�Ft�ca��+��%��%��@+BvV�<ar.�-Q�cd,1I%Jзwqt;Νm?pp������ztO
LW~\���q���&5����}}h.�;��ns�#��#������|����~�w��x\����ˁ~[a�5�HR�,�@b�] a�q#tҚ�$��`���H���Ġt/�0���Ӎ��q�z5�ނ����U�-b����6����gK���Y�H�u���?>�ul�v�U��g��^����Y�~�`���F�-���O��*�~ ��Ό�I�0�o�WVSߙ'bC�FIx�!O*:�PT�.�~�&v��k��Ƕɸ� <�����wcf�w� Ću/�F�a\5�:0��{I$?�C�&{��8&V����t�i��5>Eǹ�fT61��E�28�{��զ�;���������<rր9��í���J�,as�;_-�u�q-��9H%�(}6
_�$x�M8�aVL.�*L���Ek��/��ɩ⽇j�t%l��?"���gm�qL���՟W��-72��o������h��/�P���=1����:�5���G|�3b��b���Hg1u�<ЖT4�$�l"��p<��P�݆�.�K�O*�b�uk1k�m=ە�w�ͯ���t=�/+��7����*�w\u;^����g�-���=�?���F�"D+#���䙏���H��Q%�s7�q#d�,f��'[�UV�է0�R8C'�\4m�*d��]TD�7�Ѹ"h9���r#���͍؝�ܾi��h�n{�nĹ�_n���O�u��؟{��G���H�ۂ��Z.�\ ~���\��,�w�H�ot1�;C�`��x�u���B�}ޥ�:4ֽ֖�<�W�m<���oO�8�Td�����	���So�c׃a�f׃���]+*��T���ـRh�4ˇ��ES�%���5�u�/Q\��m�ao�x�MIEt�'ݳ~I�K�}z|�O����N-B��4M�PM�Y��>�2ݬa��ܗ�����h��`~<hz��̩2����H�	,H��&����O���2���|��U��v����Hu���S�����v4�g=b���ݱ�g��4����7G��������R��4�.�C�������7�3�'%��nÊ��]0�ǫ��pЅ�U���J�Ή'�]GkҺ�>�;Իg�k޽	��K
.D� \���^�*�.K��{����m��rW�!�U#{��RQEBBh���,+ғ��8��d�)���躹�t���HŒ�}ݻ��0��PtT��O6T�fx֯����wǗ�m�U�`�H��������vn������#�{�Bj�F9����yD�%c��-�������
f��d�:���d!0�rrHb��t��Ќ<�כ��۹��h	��DP#;TZ����9���V���>�%;͸�4�5�##/��� b��2�B��;��p��˫v=���謧'1n]]9��HBpy�\�觇 v1�E����֐��t��r'��q�����b qZ!S1��3�c)�g�$�L�[�r4��8��S�$����;�ѤjXZ��pm��٠��[�rwT��m1����F���.���rz{�/��3jБ�!� e5D�)�F�V౰,'�.%�e��������1t��bx\<Ȅ�cb��o�늲���	�&�J��}f�V���/�x������3� E2�Nq����s���}QF��3^L�t.)� ��׶��+a�ze�Nid|I�$I��7��?Ժ�Ö����:�]~�����]z�����SPJ9`���k��zNA�¨/[@�J1'MaM≹1S����/�0Qû���F�{}���e0b.q��>�������}�����H�?���>9����}&�!R��N�Hʜ    ��E��!�Ec�he�Ʒ���/}����[��o��u�sY/��_bĘ���k��z��:ۀ}[>_�Qw�h��z��M��iE	F�#��Y9M��rk,� \rI*�9%�0�M�<ILo5�1�"�6��,�T��x��38�S1vY��{� 5��G��e:Z����8F�j���q� UVh�9�����]"j�T�Yd^�Y�vk�ޤb�������%o��uβm"�Q���zզ���㨦d�r���9�V���2�� �ٶ$�?�K���l*��f:�<��gSh�C�����1�U`x����J��MӰ����1bdX�0�m�O"���|��e_���9�oW�;v��!z_�7z��YC�� �>��x�s�܅ȉ/��,�.���'��9KLo��:*'>�_���	I�.zƪM8������`�z��317y�s�2<9m�T.��,N�֝V;8�Q������e*C1�*F���&i|Ƽ�@FW0�E�0KM�vW47ڛh��G�L��]wp�CI�����.g�,�C���ʣ&3_�J?��\��݉EgP��]mx|ʐ�gt���,�vSH�i�CғA �h�Q�T��.xO��1�C��Z�;��9��C�l75������j���;��n�Ìzf}��o���~~jڀ3��jw��8# p,�Ð���(1[��Q�J�^;˸DC��E���%fA0�c�u$ֻ]�I$w'��1ņ��l��?:8n�+#�C�$X1|�$�_/�<;lo��"_�X'�J&��xz����Y���4#R��g��5� �dT����L0ߤ�Oo�>@�n\*�L�	���]�l��?:8nx�S��۱��գC�g�m|ӆ�+��fn#[�`?����F�p=읍��)$��3\j��`����\0��ɂ���/�F|6s9�L��/=l��bk:8�ζ��������٪�f�4y��e��աgv�{|���<����9'�0��O���7��[kS�?�l}0�f���߇b<��4 �I�r2E��ϗ�Sv�pVB�,��cĠ�i)�)�t�_)ٮ��c�����\75�_��>�������0dB�ˣ����73%!�N^�j��x�����,.�ś��N �7}�/�G;Fg�FsVx����D�
�qO#1�bJ.璼�)�(b�N �:bw�Q|�{!��^�ݠ��7��:zл㫊J?.-�7���Y�_.t�����λ<CPT�4Sf4�te��Rt�B;��7�Y|�1�Ocrĳ���	ψ�4b��M>�PV �E����lPj�6�]�&8���x���c÷���ۃ��0X�6n8^1�4�;`X�<%���,�lY�)1a����D�U�)=K$x�<�1�;L?�B�g�6��S�ş��
�~�!����a:P[2l��$x_��0 ��:00sb2��Nؕ�m�AF����XG_�dL�J0����/��05[L����Y��c������Pe�'���j����?NGc⍞��a�ci뀺Ϋ������i���|��� �5�V��F����+��>�'>weT�(�#� d��^�����+#?|�s��L ��D����%/�t��ѻ�nD}pֳ�>����=D�6�Z��]�u��"'-n�E�ݺ�2XE;T�Z�S㍶"���r���))J@Gm��e|�#k���#���h>G�<��-���?��4ާ�Ck5��0�t��/�'>�Iuz�qH%9;�X
��"�O ��
Ё��C0&��r��J�.2����ɘmk[����&�_fZ�r��7���Yӻ��U^�ٲ����s�e�dz�d�?׏���==k�F����=���
�4�7�U#jg)�V�S�48��`���l��F�WBI��xt��P��������X��14�z��Y/�_6q�V���K�z��iY�|T��l={]������˥����r�rT3E7kG=�1�h�,�A�i�Sm�aX���h+��^��	19�L�$��GW0b?��`;��6<���v�_�O�\r����}�?��A=�����f+)�1I�Ԡ�h1�d�b�J[�>c�L���Y-i>�� ��\N��;D:��<�|�$% JIZ�$��p��%�O3��R�lk����/��s�������pPW[�5�Zɋ�]��`ޢ�8�pE ���5�N��R e�2�ۚw9a>hZ��	�b�d�୥}_����x�������Z�lW��tp|%�/���[������ֺ��ʪ��]W�>o+�8�It��j�g�����#�����(��p����)NEk���[c=�ؘ%�"��	m!��] ��us_oת����p�*���������}v�[P�-&]�w6��5��f߱��n|iGe��Zse�g�vY��f��|��l�[i>x��<�l��Mn!��M^p�e��0�p�$]�����=~ˬ�_Bo�aD�,�5!%U�}���v?m�k%���[�u�}�ӱ�޳=hsƃ���ѢeAe@1�<+ő�q�\PW�:o��3�]0<���-��\�1�d&[����T����G�7��kM�G����՜7p5��v�8�ó�?�~_�ՖGb+���w���w��=r4,}���hi~�Z'� "���ED�	�E�\��ge�4�*MQF�m��Pg��3��0�of�\=�3��3�=��؉����*�+"�?����Τ-MsM�y$��Pש���3��j��t�$EIV3��B+r���E��A����ɖ+kL1P��F?iz���6�t��l�fx�aT�|tp|���>�썻�eM���Ý���U�&tY�ۻ����U(�D����K>�W)a��2��P-T�ʰ�E.���i�L���
���=bNS]�X��K'v��r��m�>��=[:O�B�������e�����[�X�LE��f�4�k\�ׁ��I?�1z4Q�:Z|%=��5�
�Н4#����&ŉ�Cl>s-qu0P��f�pp���w����-Lf�,؏5��GΖHxUh[��8o6�F[eF��g �<��`�%!���$1��7sit�AZ�4��BL�<T��a�1�b=��=>���Y��Yo�L��{�n���u1XY7���3bE�M�4��y�tC�v�������,�H���� �^ǃ0ǰ����SѤ3o��-��v�E� <a�����(R'/"��Z��yt��Ž� an�s������e��;�K+G3���Y5H1���>A��?�]��OsZ�,��;������Y�1ҡ�%�}�4[����3,*�#�2��F��0�rJZ.w%i̢�X��s���1OR~Éd�g��R��I�_��*ʨ�|�>�D�������;1$�#��.��d��a*���g�Q+5"[ꪞ�U����X0 C����0�£}�\��O2�ɬ�w�T	��U����U ~�m��]@�u�R7_�a�3����rj1N�ɛ���u}~O�j+�qg��n�.��F�{�(B	D�a�٭�g:�bFFZ?f�G�o<����[���ɩ]-<���*ZB�Q� �w�A;e��Y_8������;5��1�圕��2ڜ�w�b�*��l�N���̿t��CK8W�l�c��u��B��H�[����$�O���o�2�������KNއ���
sk_�Ԇ߶��������v7�\��s��ߙ��;��Z���ғ䣝W�����9�J¸���cք��� �W4:_��IM�["<�,�"�%s�G���͠�)��Z'��Y�ÿ�Ǘ�^��վ���
]�B��k����V5�������5�Q8v`���9r�3W6��u��h���b�%�}�\�#�R̶YHBa�� �R�fp���zo���JuU��Ir=�hޯs����ڎ�w˦�Q%X�}����"5e���%��%�bTF�R�*�?G��B�M�4�ն����Y�/�;�oR�>:8�(�>x�{u��լF|�P}VK�5w�#�ǃ�����h��x~��ՠ#miD�j��O)��܋��QkS0�&u��    ĳ��X�*cV͕/h�r����\�v�hӮbó]yd���qˠ���F]-���Mo�t�z�gK�j=��UDg�{��iШ��r%�����<�w�~z;.F��7S�n���DcC�<1Q�ԛ�F������NL�"��G�d�=�.�7J��-p�[��#�����F�c���rt�+��N
O���?���[L�����%��Ӣ�~hHn&zo�hZQ�Kǘ+.&j� ���d�K�(�F�*xz�x�&`V���"�x4B&�Et��ꍵ�7[�6ug�ʷ�ЋΔ�q�,=��Z��kC��h^��@KZ��m=��=��h	;OA�	0�CH�_����3˵�!F�}�Ok���c�����s�0&��Rw[��X��q�a�%7��,��z���#?�;�l	@���i��;1��M�a�obޞ����O/�L�����@�W�.�=�d�"B)KGl��R�18��� ��TUCO�I:��X]��{@_�{����*:u��Y���_��_r��G9Q$x�L�4��%�7�]𛹄��Sߏ�5|Ք�]�
����k{e"O^�\�ְ�J� )�lώM�a�LF�{�r����&͙-U�o��YFl�t�:*�i&��'�a��pУ|�'�HhQZ�}i�w�̨�1� 2.e�S)�D�Ϲ�9:�PJ�A0�kL�y��3�B�Y���<g=[��E�/dϝ�_�\uVH}��;��4�v��6"P�}iG�1�b��uV��RE1ox!�.|iu���%ܐ��D�J3eAꠥ.����O6Mc��.�7�v'�88�W�v_!PV��y��5�^�]	Ι�yd�����U�����	��@��Y*y\��B��x�e�0�Ƅ`���u#;���PKrWRa�i-��BdfRڊ�ԨmorG|�;;�?BnԲ��lS���ƺ��?�y��uRa^�9u��Vl��B1����IIR(�vh�yLQ�ũ�C�0%'�G�S`ŗ�e@���D��] �V��ciླ�x����h��^�'�(S�Ro� 2*l0���3Z������Ræ����G�tIK/��"dI҉FAɜyٷ��:����ޙ��"�m��E�}�#gN!��w�+�Zڨm�6U
�6�~�P�f��A�(�Ʉ��$4��Y�Fd�
]I��AE� X�h�k�B��E&~����Rԍ���.����o�#�fQ�`�A�e�����Ń'Q�trPk:�I����`�b�ONym��0�bm�_��Io�v�"U$��)r ƻ[�q�����g�a�Q+�J�|����e��ŋҤ�T��Ëyӱƫ��ݾ�Գ�~ˍ�A<�ӭ�-T��1FZ=/�q-�HR�Vy
B�1���P�↔�E���{9�8�*�w��X��x�1�W�����߃�����v�: �Ȁ8>���s�*B*U0I��"<Gx��K)(���#P�W�ֱ֊�lc�解�S�.�rc��c���~��k��Z�����"�n}�jǯ�
^�B���=:�;%%uhc�(I�bdjh��	Ų�MH�%��<�FR�����L�R�
���PZ��2���ap�ㄐ�_˚Y��E=o�lӛUm!mh)gU5�����߂�G���RTJ�F�hC�e^Lb^^��2�Uᔒ0|`�$�T2QX���� S�Z���3���ݖfw��ଗ��>-��zv�b�0X�3��`�:k� �*�/�[��*����� G5��z����LQ�'PxCRr�h��!e�Ca�uxE dZ��e�[��[s\�(Rd1<۱>�>:8~�2!�I�B��¦��:#9�R=X��a�h\[����P&��rTW�)��Xi4K����G�(SD���?�/� =t"g]�1X�"�U+�^�8Sۦ�\K��9~��țUf���.��}tp|I:�h
+-��3zd�[�ͭ�����[�a��%�_h��L@��Up�J`��rD��AT
h����|1�/\PGd?䖗�~������t �}tu�f�ٝo�L$������x�����C6�R�m\�����#)��X��m̰�tƒ�����CeZ8��z�'�<1K
>2|vE��x6B+ o�ם�3�	6O�,� �;c��!��|t~s|)�L�X|[k��i jឬ2�u@jfr��ݹSz%⃩4v���إ�>c�c�a:�gS^�B͝O�(�~4�Fp�E��U���b@���1�9��I���ڜ��s�ē%�j�+���3��홙����bP��ʨ�S�1���NZ�,��P��4�17B��Ƨd@:��&��3��J�=}[k���.P������S:8땁U�#�:s��j������L,�P�w˞@Ӻ�}[Y�5���jՖ1�F��7z�/���%Nc�u�s� 0��	Ya��cb��I����)c���S�UX�\��EZ�V��c	7�#�%fw��K�V�Ǌp9��tЏ�Ӧ���>�l!Ȼn�=�f�3��ߣ�a��AMA��H[%0u�`�˚kY��4������K$/��1�VA̦KƋټ7}�/�����n�����bF�]��G��çw�<燛��ޞ�<����Z��c�O�Ma#�;���p�����k�cUʠ_�lN�C{��Q�7��0�Ӡ9����Q�Z�b��HS�2��,�u�L{�h��!z#;�RBi',>nς�U�w����ͯ���`h����yʩ_.3'ZE������@���o֎6L�`��L��Gcd����Tn�a�����񞷤CS��[E "`��|�_&�+=�	V��P�c5zt���}tp|-Ar�I<_G�_V[%����;�u��88-�����F�r0�(̔I�/�0��E9i���Q�T
H�m���U���T�)I�Y�&y��-ܭ��z͈�����N��+ϖx�YK�X��7��-,ѵ��r|gV�*�A�J1R�=���6;obс������9�HD��b'ʷ5˘�g�1��Q�"��E�����(�k^tJ�ݳ~�{����"B&ζ��r�SY~��~��U�^i���y�ڲR�������_�br�G^Y���  iR[����������l󔙗�$ģ��#�%ai��-b䕭�I< G�-��J��l�e<���x6$������|Ǔ%b�X+n�
�j[?6^�n/�xm�g�#����^�����X� � ��Cr��2��9f��*�!.0jhP�2y
�Y�����Ȭ������]_�J�U�o�{�,����?Wf.�pr�>�03�n���I�eQ|"�R�4�^=�Nd+�8 �&̓p5$p"/9䄸u���$페�К+~ӊc�/R<T�y?����Pks�#��>�%;��+�N����&NLy
�8#f坔ٹ�	^�M���{���Y���'\�(��a�^{�]<��%��ߦz��|��f�I�/�q~]���G����\}T.-���E�%&���),���*��� Y�K��H�x�4�Hk]P�����mp֣H�}�4ݣH;u�>O#��3+��"#�:ֿ,��?4ߺ�@�p��;��Mc7W�cI���b���LŃ�>d[F�)y���D|:�f
���c F�_�1���o���?wLm��Gː%a�xi\<����4J�n�4�eq����4��J�h�Ěњ��I>e��2�eUTq*pT�Yd/�se�c`��`��xU"���f�T$�f1���O��/��}i���Б���>?�8�Wi�/�ޗ��U�4J��$JѸ��萻���Ah�v4It�D��W��'C`�K�}p.*�{�O� kbvZ�� 2�cHj(�&sAS��q	bGJ=8�합�4�����^�Zs������4��r��t��Yl�}�ɱ�C���z��K0
ӥ��˙K�l*�8�4���:�"{m�Ҥ�&G$�4�d���`0�R����6�K`�'�u���Y����4���Tv�kI�~������M�G�Y��c��TF��1���$2=���Ǽ31�29�:�y�s��    �m�(@JD�eC;����z�Agd�A�;k[O�Ř޳�w�2{�ֻ��z�Å��@ʵh�i=;���3�n�;����+��j`�Iq.Йb=���V�c��C��Yi��H��0�s���/ǿ-y�2R�.����X�v͎�ـqo�k�;���[�I���]����i��w�j{w�����XI�����'��2=�P��%	���-&��$����
��Yf���8�����a��0��FS�5)ƽ*� �� _���m@�Y�������!Eq��EjX;��tJ��̜>Z���P��hQO�ټ`�s�7َ�vXcF�rg��Ƞ@��4�IPH�з V�l a�@ersD�c�>��XX`����^����?��;�W�6���خ�n��E���Aa�y��O6\n����G!�`�384z�̹�X@�R.\��u��$L�R$�9ڟ,�$��]���c���$�����BB�'����5������K}S���,�n3�m���b̓��!m�PS��^�[� ��AӌQ�<dJ�^��~���lU/� HQ��.�Nn�0��>�j0�����P5kYn^K?,�<k[5#=�y��wǇ? χz8y��d�y;�������fZT��@��XD�&�1hB���\P=-��Ij� ��Rlv^y��vp�#���w�_KzKI����2G�XK��ʾ=o3�4Kv�u�"� A�z�[���������K�؂�qJ����_�d��(Ev�Q�;�&��i")
����Rgax�mt�.��~�Y�V1O)��ۙ�]F58������D�G�Bɯ�2���G��1�q]��9;��D���Q 52%-�b�3�!�����*��$2��(��6�L�p�i�[���I�� A�i�t��̇g;���G��H8S�/��՞gb[��_6r�V�^H{j3�����s�<hwq�I��XZ[L��B��,�W�ݯ�a&�4O�i.>�Q`>D|� cfM�1,�@m�rW��&�KW�9?�v�8̏l��n�yG��~�y0�)�sj��}���q�{
�;DS	���Vi���~��B�ʂ?�%�L���74�Z5��"��m��w�4���Zzw�F^�c��Ud��/�hώzMPk�o�ͳyg]�����NÇ�3Xf�֣�Y"	M�����2�LB�'� i�]--����,!��t�P2�����tp��:��-�;���$���of��&�to�p����"��P�7��ﺎ���֮SA��3s����e��f,�<e�3�X't�4ņ��K������)���sU�q<�5�����Ɵeݖ���NX
��(��f'��G�^	�:���Px���'�6g��K�J�-���%�s}�$l��:���Y��W��_5���{��އ���Ӷ՗�3��2l��a��f)�p^k�2�C��+Uй��i�̓��hN�c��I�N\�����j[�64�Ӄu��۷tg=c�~���zapRmpf�����o���f2�����(�Ak0�.0os������>i���ri-��O㘜�`*�&%$�hQ%�b +-��w ��H$�R� {s��3�+ʋʌfW�V+�����*���j��M����̓8�n4�S�F�vJ�j����HcA�yT� �*ZtG�$�r%g���y!��\��U~3��X�0�@��$k��-�g�}�xW�����4X��Nc���v������.W��7�9���ZDJ���Ù���i﬉�]�D����Z���@��E�-���G��� ��Mg�W���UމW�9qh�|݈Xׇ���9�B۽V �m7��4=?;J(�<�gA���Q@c@��y��<XE��@2��9.GĒ�$�!� �a!�L��tAEsؖv[����B��k�������18�z(�PU�����~�5�+�w�����M��'�N�Ւ!U����Y�U��s�Ar튳I𠲴T�ÛQd�P��v´�zG	j�̔A ���	Z� ��_�.���A��>ި�p�(�b��˙	`.�����k�E}������Z�}%����,��ƀ���-H��>���U��\(�cb�&�^ H	=��<s-3�\��G;޹D�-��7T��.���:�����]��Xz�]�?-��䖟�s� ����O�PWM���?\�:��sG�E��;"i��tR�i?Cb���7h|���&�DQ�h���L�x̂�0���MTVD��س������353:|��57R�o��e��bK���}�d�m��	�?Ti3~W���\w����.#P�K ��\aݏ���8^��Q:�YD�d�p�����)q]�p�d�eR�CѦ��yz|1���O)�bH�3ݾ���������h��E��Ӿ�!<�%�č��.� ��9�m��xo�� ���$ʹe���c"zω�z�JL
�c?�K�^���+��p2�D�����3�����r7�*�?ZE�\�^n�n4�[3r�~ Ɖ1�߬;n|�Kv}nVĶ#>ٰ��{4��:��-&)&K ��,�����+²��I V��MK��:����z��_��O���h��h*�d��6����+0��ձ�٬ 0��(M�Yd�TH"ҏ~'|ʈXbX�N!�AxŹ-Ƌ��	��)pn����Y/vr�ww|po�Ů�Ӣ��fy}�k��C�umw��ݦ�80@�f��uǔ\ VK��]�2����h�*�R0�P!$�#c^��b�+��=�Z�:�W����^��;�$-V�N��u�����z�gz���mle�h=_ĥ2�`N[7�Ͻ��ǜ-�sa�A1� 5���W��J�h��SR�\�%R�H#� ������v�P�z6z�����!ѺB?���*�>[B��D�<��h������&���{�=����2���������ߎ�~���p����=؈�R������d|P�$)��F��(
�zJ�Jǅ�J˼S�v�wW��lWDg��{֟,��^9Yn�Rhˋ�Z�Q�����
'���4'�fD����|�\��G�=Y&�*�cm]2��W��;����� �M�I�Hh��s��n���M��.�����1���l_b�[?l=����y���G�A{��x`�-Ý�����g���_�9?�k��_�=�k��{
`|Ԥ)��ɨ��g��`�d�J��Q`��SA!�!2-N㎴C����ޖ�`�������Y����Pޱ��e�p�,�K���r:HN��?n��fjԷߒ}��χ`A�s���+���xU��K�.�~9�du��;a���Dy
��y1�i�n�;��z��"1���D����IS�N���@�϶g�L�30����ܞ�����/�M�A�GW!n�6��X����MB8�$e*ed���H}�&��d��d��˩��2`4���1b�X���vч��G�/t�=fݳ�gw�gw|9�ϗ�L�X�7�W�[=3r��MjѰ�]�=��[f@7{G̠��&���m��a�.B�<���F䬦nZ�4ʃ�yDG􄊝�hOR������L�ڱ�F?���e���F�t)_��(I�v��F+O��GY�>�6i���V<�9q�y�V�-
܀��wI��V�)�£�I�l6�p|�e���S����J�щ��y��F��K��߯mӭ�vSn����������b����/���ޑ�O��0�:�W�Rz�����E����O�圴Q�O7.Y*��R���N�2=����yp��$�ۻJi�	?׵`J�&e�����w#�a�{��J6��%N�>|=[���2F��7�d����h�C��O�Scؚ��1cј��A�d@��*o�}]���~��m��Gg��vϼO�/�Ǿn��[��U.��Wփu��n�

�� ��f4.6Ɣ��p�#g�3�h�5*���*:o���L|��J�HGd���k���H��tK�18�Qjl>:8n/�Y���ɳ%G�	/[�|t�`> )��i�\��
�VbVx�Q��)M    �Q;R�).l��:+F��.��WR�	�M����<������!��^��%�H.���-nO�˅����y��$�Z*? }t
�s9��t}�d����ِOM��yO��2P
� �ː}q�h|9%ǰ����{�5B��mȼ�g=�i����G�_�|fS%AX�{~jk�U����^C�ذ:9Nǲ�!)�1��)En9ږ��S�,��0V�����l<�6R��Y�?b�s��=�Iͫ���l�ƕp�V����ٞG�����g�L��ԁMDt ��F�6����%�	('�Ѧ�1K���轠}{��}���>!�U�Z��h�6�i�C��Hd��r:xˏ�,Iʁ���9 ���!��dā�+
8��&���$"ms��&蜢��F�>f|^��]�6qo�ԍ�����������v�Cn;��٧�H�ù�H��(^c��0`}HZ�:Vy�u+�iY��6��4�\z �p�y�苵�h�Bl=X��3�g<v�s�!N�M�٩v��5�Q�^5�g˄�a4�?m���ܦ�7�`쵃����:J��G�����uumN���|��=.d40�!i�(�M�2
�Xe�6�uF�
�#λ<���;�R����?�?^�|[��M8����~��dг�4�8@pЁG��ı��[_d�h�¦�R�6���)�fg�	,
N�F*�h3M�ة��A�7���mt֋bu��ms|-�o����_���B�}Ե�+?�KI�I�U ƭV#�c�����@{�i�Fk��3Y�=��=/h��i�bI'Jq$B��������mԴ�����l��<=��/�B����=����o�'���d���L�����pGe����!��0EQ��9�D֚�XbQ�d�����b'l|�{Ax�� �l�>ZF�_tj�H��N����X�� �ކ�9f�E�²(4��**�٠��<>�AF'�+�8�/������{�6�D�����h�v�v��Kl��E:��&�y�4�g��ۋ6��4*:�N�<a���h=��)Z�e�1�	0x�!�S
IӉ��'\L>��0	:�KE�ֺg}�!z%��ff���7Gz&��~nJ=�	�?�J����9eh�6�W���c�{S!�݀O��EYH��Hԛl�t��\�h�0f!)�c-Bh�l_�]688<u�pվg��ba�m-�o���ϗZ��3�L%]�9��'����i���h� �P2(2$����@�;�i���N�ڌ��kxD-3�i�2��&s�K���WmY�w����.������>Ǥ�xч��V�N�b�׿��t�����=Վy=3_��o��� ټ~�{H�/�G��箁O̢��#�]T���d�2s����Ad�����YPh��.�Yavٹ%��8�>��uSL�O1�{��/��y^��2��Ñ��<'lkE�q�z�J��f��7sTMR�O����fe�x���Q�9
ØV�Q	p0Ƅ�B�T��E0V)�t	Iz�`i����s��'��g��2�w_�ƿ�GPzbPm����VH��OK��!��Y/m�Ɏ쎯+$ ~n��h�� �7k�t޽�GJ�{a.�51�rr��7�0iG�D���Y1J�C"Anż�.�T��a��YYVCn!*�Puvu�^���3��=��;t;v�C��������G~�JnCK�d��j�n��o�SN�=��%A���/��L�1��e-oK��*놔� ���(�4	���YF�hH�v�/����Y����'�_~�W���SR���?/V�]���`gp�Pâ�U)H|�9Ƥd��ޱ��`�?P|Ȋ��ǽ���tq����9�B���{��������q������
����̗)k�f}=W%����ū�
ɼ\��W���K��o�Z�7�u�An.����(�/���7�X��֨ iQM��^�HD�B�O�����
\��s�Vw6��d�n�_l���n87��?.��b�k�����ӯj��t��m�ѾhJ��ޥ�2�$+��VզޖG�Z�}���|?����R��Ι+b1W�6��L���1�$Ә�'L(AM=���xS�� �l�JYp�s���ͦ��Jg��M�q|��Xg���񺱴4��^�JMH4A��Jt���D�r5�c�dH�$%5P��z�<�$����)������E[<)��JJ�"�=k%b��)��.�7ó�l/��_B�w =�K������Ч���KO�E�;�gum�:����fnԎ�s�
�/�zb#N:FKz'��IK�5��3e
��XT���%������m�]�su��A�>�R��"B�N�vE�C���ݻ;r�i��dBj;z�� b3Y0ZG��3�:c �^rI���q��C��(�	�2�
�bf����쟗���L��&���ӥ���T-��5�z���>[&�Zj��-�n��>�8"#���ލ��:L�#'$�S	L����2����[E��"���j�y���nj1�K��/�&��v����?ja7��^0(�R�}�19���&��fƌ� &˝���)Ӝ����48�\�x}����t�g��:�FM��˭��B��ٲ�9W,���%���<.[Ki���m��Uk+���@�e)0GV^�B�`��fH�Q��S6��L�%O̙��>�,�jDÔ�����f�to�Og6U��72U3�$F��>Ur�&�,"`����<�>Ʒ"��l�$ƈ ���̈�[d�G���$L�ͥ�|�#9�\�C98�W8y�������/�l]o�������:u�A�+@��}^�^��I�B2���y�>���^����!�\D�[�'�-}7�Zo[�B��k������B�u�[?�C�f@`2Ďd���*�����g
���f]���ZbΎl�&˼u$�h���_G4=��Ǝr��O��<�Um�6���эF�0���1��a1&�0)���8U6\+5���Kh��«@$�"d����.pz7ﱛ���������$_�V~�"�S��=Z�En>�82:��5{-v>�4�����c�mqA���J���4��`$R��!�h��)[�,�cg�F��lt��g]��7��;��*3b!K?�i%�Z�y2���3c_��Zf<^-�Po��~�X��/�hw�yP��Hq�R�K��y���ߊ�3��2@�z!F�7ѡzD�Nee0��ɬe	)�*&}�k�������?�T��ٞ�Z��'$��׬hrWU�;*�pkĈ5�����|f&��L�5�5��S fC��m�J�@ JbN҇����̣��|g�ys|��k���2'�M��/.Ɵ)����V��6�x`�ֱa�u��d��f�%!3�#�9�Ex�:bd�8�H�8���CH!�������ϗ��+���43�m�U�g��/=�3p��\���e���O�P�Z��&+� �Ȥ0^RD)�H���K� ��1��^U�R���dȒ[�'�[���.(K���~,r�����ߟ	6z��19S�������_�i��-<P�� ��e���AI~>�dj���/�g9G�!sZ� tޓ�������y�Q�-CR�����N�ܻm[��)�zd��Gtz|}�hV߼7�]�y����g{��E������F�>[>�S��L z d�Ո�M*�%Dj�BaA1	��.�I[��NicQ��[�4����ġ�4��v7����O��ӑ;��*5gQ���>q�1)g�7��2��v���.�j�A�E���R��E	:�L%)�F;.I�M;H	#�� &c�QE`E
���j�G�6���Gg�Z�棃��0��g�>:z��+���_���8B��w3�q�xb>���f�c��b!^���ϕP M\���q\��U��@�`����c|���@li��%�>���v����w$?������g���F��PƎ��1�dEԩ���n�K�%6a���W$�!���\�５�Ú���۝�}G�w�9��*�]����}m�6��    �����*��������U�vkC�Ώi�&LW/���hl��7����$����*�8i+U�Jj�2t���e�`|������/~]1���IE���k=yZ�vէ�޼�&j
pkʷ���i["ס	Ɔ�ޒ��t-8I�y��+M$W�����0�
}���p4�����j�>�������v�s��+�k.����je�m��5��Ϫ�0�y��[Ɨ��П�a���K|r�J��� 9�%��S6h�)�9�a���b4��T�`���-I$�q�H��N�:t
N�9�o��z�������{�'��n@����������+����סJ�|�X�,`�s5�%a@�-��Ej���oA�\�yr ���YZ�$<~B��ë��=�pk�/T'��+�nQs|��H^��E�B�D�d��6�x��1����F��?V��R�$r"�0y]�"��z������Ў!1@Q��a;�b۩�N�{��-��_��1�à��ee��E����W�zq�� 8�`F���@�R�<�0��@:�c�t�<�)ː�6�w�n����(��
0~\A�t�wDG/����ա@������rR� �jc������X�.�c�$�e�\�p��F�T�94�9�4���
9��QK2�T;��.�]��j��<]�M�ټp��m��>9��|���4 �R�1��a�� �s�1�*jT2HRu4QJ���b�����h������,)G�p�����!��ᚏ_��eL��*��FL/ZQ�C��t_5|C+�_1��j��h��km�⨟�=���`R���BN��/���lr�J���
��(�MGg�Q�������zr���z�a��YK`g|Oe�o�q5��0vH�p=�I+ƴ��WʐV�؄ �g*XNR��[D#&th�YȜ'̖��}]��r���uyGg}Z�.��j�#���Y�mn����� v�(i0��`��<ڹ��4�꯺y��z���0j9eGkg�E��y�La�̸'96��K"��M�����[�i[@iQ0�v1)	IcLֽҴ���quO�,��(�Z���?��_����^��x���մ_,B�/���#����%�e��ʻ�y�.��"
;Z�9�C�,��p�Mk�xIf���iA����xZ�Ҡ A
��FRI�)u����RWܟ�~�����W��Ky��L?hU��i�/���/�X�ԴR��0�#��x_/>(XpZ�@;�JB 0�ɮÕD��D�%0�U���wQY������9�tjI��0o�О�T�o�w:ĭݳ���H��һώ6	���M{�c��d�Mzvp�M��r�RT�lI�V�b� �eG�Ǭ�G�6gt�"(=e_�L���7	���Ng(����fuv`�g�����*d4��{3����q��o�h�HV�mc��'�]�?/���rǎI��7���[<�ң��s��8�[:c -��.�S�L2��6�� p@c���xe�����w@m����P�l@���M"�i]b���٥YO?��09{�Z$��3�_g��B,9IcE�DV��T�41;���$yA\w�P���1S����s���OO}�"jC��!K�uo��{���6��*G�͋�#qa��f5����`�xP�Zw�Eɵa,�:^̗��@0��|��G�1���#�_
�K|�,�֪��<ZmEmo�J���A9Y|T=(ŋ&�f%|�,Y����G=�Da�$+:�>h%��H������3�"V��Y�i��{z�#p�k�����QZ���&6�~)�5xk���#�ݿU��e·��_��
��vnU���b�� �kRO�A�H�k�3�r�$ږ+�|3X���F��=eH�M�b(�O�g�֌��d�7���e�3M��G�/1̓͋�p�mW�6-�A"�)�(\^g����#(�A�&A��M˷��^�1:W�ʤ����d���l��4G�e���U�d��e�=��m)cH�ip����_'�	.ܦn�8��(�Q�T+z�dJ_ΛAM�ޝ�>�J� #E;�D<C�`��>�Ĩ�r^Yi}V�ykdP�d�2S@t�TB�<��O��n�hA��(E�L�R{��ǗأfGp���:m����[��['g���"�u�O����_7L�-6����&c���{�bT���b�El �Pl��9V<լh��	�tF�)�ALYx����,c�?�w�9:�������.�XT�<�_.k�4����=�����ü6���~�ٴ�K!t��A7*Bb*C{>B#B�W�	Oݼ��+�~�ހ�,+�"�bȦxk�t`����J_W�̖��S����c^7�^�_����fuR7yϖ��<n�!eZ(�_��dF���J���.�0�V
��	m�L&�ʠ��W:$�:��t��l��_����ٻ��=�W����7���]�G����;���*���׋P٫6Rг�Q�_j5(r��=FH4��!X�i��H��ϡ�����Y�D�7�gQ��If�Y2]ܥٮ��Q�3� ���kT�=�� ���
׃i��*/� }���G�,���Cv�/�����������ĵt��� ��G!�ى�eƇ:� <�rO$�c��gO�A&�&%�p��0�<�X�Vl����E��~�r0��~[F���s%��N�*w%{��f���]��Ջ|Mc�?1z@���?��ƀ.r�J�/E`���d���q�1 �bC�V�Bz�L��>�"j�r��s��u����-a�n~����𸼗�Ǔe
���S\��~��m�@ o���ly�g�Cj7���'|�3>�FRr%�L�4?B>*Ki�3�1f]��91eE ߝ<(���f*~������(`s|�R@#A>�{�b������=^b�#����TXZ�٠�tː]ⴧ�����;��!p0��'Y����G�þ*_�BKM��/C�s!%�<v���)�Ef��"~�8>~�A\I���'�V�ƒ�Ў��3�{PB�'=t�R�ܡ��`��@c!�N�v1�+��<�/�4�0c���i����o���N]w�H�g�������U�����˴ϋ�M_(	���U�N=\���G���D���i��JN�J�<���`�
�Q_Y�)e��w����{�$Ǒe	~�.jU)�~���e�}�#��_C��&�,�lt
�@��dv����̽�f�f����#2	&�a��Q�z��P/�&Gi��y�y�SVԾ5�.��%Gš#S���^T�]"��e��T�p��ʮ�����4��yT闙���&�봒N�x^1�U�J�����0G615�&h�7��j���^�d�M�d8�T��b��"a�� b`n~/��&�s1_ů��YJ��rʟ̶�$�t!������W�n�/��CP��ac��X�S���ȣ���1�eR�b֕�6H������)r�Y7��.�ۆ?uĴ��k��n,_��E/�������|��9.G@�>����������_`K� �6�RC���a�l�BQ��S�(�Ma��S�6� ȃ��!���%��Roh��3����Z7��?:X�&S^N��O��o��_Uf�C��A����#�3�	�SVȞ'�H��=M���ik�砓� 
��`��c�C��7����o��u��Q�;�˗4����6w�S&�h=��e��D#B:��=����y�<F)�7)�&%��qʘנ�)P\Y˘2�?���E	����$l��]%����<-���m��k�C�l�?�$�g{���w��m{���O�cy��u���U�q�Q�h,G����&at����v�b�z�!pF"��zۗ��2E�#]�������ѕ�kB���z8y�@�u�����-�	؍��z��k��(.���.jM	�bZ	�hb.
0�)Z�&�G9�"q,��ZGED����e�E���$��G˗d����Pk�evb�ǖf"��3�&    �h}��I-��O'#��s���ILpҘ5`b��`�C�:d8�Q8�H� ���+(��#��}����K�u��E����Z���������N��Į���T-K�����m
A��6���
�i��8�*@iH20#��V
�]d`{��4K����2��J:��ے�W��Xf�֋oX?�a��F�uel�oF���ee�}Xl�|<��������#:,�1�<[�Q0�y���Û&0�AH!��ȇłd1ɘp�#�8��]8�N�#��`�z���t�|	�� l8�� ��fs<_U�i�ۀ7��T�a�ǀ���R.����ZcW���y��,�Op6!@�`YbYRn�M$qg�o�Sm�G3�4X륇u�TT��:�z�r�b�f�o��:k1��gd�Cg�$�����	�	\����1���L����hp��Z�e�! ��K�박d�i��� �|��}����mz�6� ё��W7���8�?��2� ����:�r�Иu2J�0r��[�Ug��J���d�Q!�~�K�������jTI��zZ��Cg�C:���8a)
#d�D|$2ÜR�9$7���Dyd��N��)J",���{�ȊҐ��z�B�G��qy��	�~;�v���è��N�
aY�s�%�y�g��1������ �� 1A��!`բ��B���1��>p�����l��~�Aö4�^�/1�/�b�֡��	aM�@t�('��w��/��s*+�'�Z��wF��k�sp�V����O��쐈kȒGk�D\�ׁ]K����s����k~R��Z�_����hnK��x�~C`��g�����1�zJ�BB,��Z9pcb���2�$��"89>3��S6��v�y��E����a���.j���>�&������<_If"�?V��jh?+�5��v�gn�7��?��V8��;�#T�w5�22���9ϩ�)Q��N٬�͙$ܪ�H�A;
/u�x2I^m��xJčnxW�*������t��K0������E�}f ?L|�������t�k�}�9��:�A�g{������+I*)�! M!k��4�hiP�"��Ya� gsp3��Ҷ��X]��#�������/;�?����M�zZ�!f��{S��5�mtWQ�}�y�����v:a�4w|���62��<�c����s�s�$_	��D!J�~�{�2w<3Έ�!PG��2lH�ciC~֌�׺�ͬ��̮eo�L�يtT��l��|�j������m��xi��f�˒ଵ�����Jϐ\|8��zC� �$�N�r	�X6^���g38�ɪ 7�O�y��mv��|�-�<4ΐN�Lw��8�׺������g����E���WD	��чr�@��r��U��IȞB�G�E�'�z�B��4��Y�ܿ8����t�Lڪ���J�x���Mi�;{s=@SJ�N"�.$D�/��"j���'/;�q�\AdB�a*Jg9^��� �<!�aE���௧����2[��`���Iw��9�ߟ�S����]�s\���c~N d3���0���Zfp������T�'�tb`.d�T1�#�B���4
B�L!��~	�]�&x~��܅#�����>�Y�bg�1�K��=)���T��yl�[�~?-Q]��<@���!�0��E#�E]4���(�!��ywaB^���g�,D�"G��ŘQ*��b��I ���ށ�e�l�X-2�+�|�Tb�O�N�he
�F6��u��X$S�Ĺ�^��, p!s���K��B˒OGƹʼ���l����m/QpX����K�3�O��W�o���T���zK��BXfUbQ�l4��'��ڧ	�.�
�"��b����چ��!Zc\.C����]n�{�k�i�m�h}����éԓ�`�����>Sa�xɭW��,��W��S
�%�.��n�%��fI2=^�?�kxV~��u������ѿ�	�{���4�?����;�L!��\�Y��a�FC�{C�,���s�]J"+*���=_9���i;,�1RC��I���������G���9�V3.۹��-��F�0|�C����dK쵤p#'3"z��(G29ƌ'4ːx�T�LP�#5�`C�<�J�qTD�����K=胵�=o,W�p��^���9��ݒ+{}��.C�!�K����9ߝW(�>�U�f�����(=H���A:�5��F���p'(/�`9A�N�T"N�dXBeN�6(���0�v��ړBZ��\\o��,_4uN詟��S��u޿+��3ٛ%e��Z�iījQe�j���I����&���
Z�������u����IH�� �s嬉J|��p�i|]���~j�1܃��1s2^�_����'+?T����cVl���؀ �*�v��L��µ�,I�[E�����F�C�C�c�]:�s�^iC3�!�.xZ���N��Z��۽�:ݛ���v#,�ˎ=�CW��x�7oka�Ç�kԏ4��v�ia�1E8\*�@��D��Q�K��N��jl��.^8��fL����8��Z��kM�yt�|Y3|U�)W��%�}2�B�k	��s�4{ ����%jP�:��Ł}�^�*{�nc 8
ŝuN���*kL�&R�=���ΑF"T�{�iU�*{�S}��Ho���z2��/j��	���~9?Kb�A
�kjc�����ĪL��fq���[h�ѵ����A'p�L!�5a)3�&�Ő�e�ِz���;�G
?$7I:A�]�c�u�Z�]m����Z�mOv��z�ms����剎��)��1��~������~��en�"j��5|�t)�W�����������xSH���(����V1�]0���0�Q"�k���(

������kwSX�5����h�X�h,_b47Z��c3Gr����/O�MH��`��o�w�k�K������<-L�g�K���
_�7���3�q�X�lv�2��II�H���r�"f�H!i��"c残�-�����+r�&��ڱ��>:X��$�	;:�.����d~�(�>�y�g;��=�����g�����v" �Q�<�	�, �R�Q����Ͱ ��D�k�$��X��9�Lr^��sB
n�v'��퇘���]���{��o��F�f�V��ْ@9fY�R�ų����V�%UL�.���������a�I��@̓uE�p?���B�&`;� wO&�����!H��1&����z@��T!�K�&*H͡������w»s��n�Ci���\u&�';����X;-M�d����2�7�� ���s�,����GQC,AG���guH,'Pŀ9���(��!�zYn�T9���Қ����֦����^ق`iU����y(ȑ��^-+�:�k��O++�J ^������>�k���,R-���wC84��FM1yp�l3G��p�5w"Y��� u^�D!~�L���M#Q�l�Io�H�w��^2��􃵞�`Z��v�"�8�i�ڊߑC���g���W'a��+7iu�F �-���(��Rg��¹"�A��=i���S0��+�3��G� I�8�G�ő�����_��kM��yt�\qܞ��lM;��L���[�� =�����9G�3_;} 
�QT`����r�;�%��NYn}�/��xQL4�Cg�S��HR(��`���]X����}͚�
�w��1�R�k���|g �J���t=���nK��zii+�E�?�r��3R�F+���Pʛp�ƓYT���q����cp�3��Fp��Ҍa'��*��S�I0���d`���}�`�GJ"��$�CJr��-�ɴWʧ��z��;(��E�<�2���=��X�ڛ�K.�VW\��S�&�'%͑`멳Vk�8�n�a|ʬF:Csʆ���pf�n�)�Z|���Z�S"N.Sv���Z=�m�y�Bk��w՚b��m���8�;�Z����=7��3�P�Y���9�v���zֺ    \���F'�G��[�L�\�Q܃�Ĵ�$��ͳe�e31L��������h�
x�xj��
M ^_�-`'��%7X�y۲�r�,���ƙ���^�^�_,��ID��2-6pY.��*�������ٟvڂ�N�Z%�nٙOJ�����X>�k?9?ȿ@�V��a�:[��ؼ�m��X\2�3��⩁��)����K	NEF�Blb�z�:oa�N��0�Y����^µC��.W�Lnm�ֺ%��+k5
�6��'K!3s5!�d�u�d��lZ�����o�*�%�0jt�4pk8�����j�5 &
p�8Xz$��U����� BY�?��@[u�I��z	�1����0
�^S���dQv�*��3����I�s�*�oU���O�p�K`�IG�"l�AC��q�������V�{���TP^�CA������*r�N���p��C�
m���Z�s�m��._�݅������:2v`�����)��8��F��[�@��\W�H`���{nzb�����1�׭�V!~V!����Ɇ���._hYin�hYSB��J��ߟL�,�ݲ�W�E��4��9FnT+��Ã@Zl:�ab"���i��y
�xɜɒ�('����
�N��H�{G%��>��X�/��h�k��/k,_ē���J+�*�N����@Zf�����G�p�����CX�s��z����j�%�0�$�ޑ$t����L#e>h?9��h����H�$���¡��������������]O�-���ՏvZ�c����Ipn�au��#�%�����d�[MC��L�B���Q�$#�.��f�l�L!�4�S�����Ml���5�Ok�a��!gу/j��)����;8�Q�d|���C���1'C�]8��뢤��3�D�z��ʎ�<�%�� A�AY��e<�:W��]k��ϲ�^I�	=u)ի����\��szq��8��W|hӄ�y�%�ݱ�}w��aM؞AZ�X@S�<�6E�T=2 �vC��Q��`�I�� �9���"m�Hy�O�9��� ��� ��Y�M�CfO�XO�i���+�� ��;���:z'v����x]��$�r�m1��HZl 0�y���5�:%�>��X�)Ұȉs�I'@�r��8�M6�9���`��_��Em����n?�rO5�u���g§��|�&�rr'dt{��d���<��5���p
��ɂ��B蚓s�*/��c� �ə��i�-΃^�<���vMu4|�G˗�G���w}�ׇ���>��_��N�b�^����SLj;�^ǸJp�%��[b��22E�sȏ��$���8��D$Ĳ��`\�M������ڡ�[���8YS��W���Ͻ���?o�&^�BŢos.T�p��x�dO��:T{� �HU�Tk�a��͓��2*)X朦!�K�Zp�m�*?��'��`k=����Z��j�r��ی�2Ox��|�⇵�����?�j���i�!�&%��N|��6d/p@�$�S�y�=Iِ�tT���:�Y�ٶ��o�r<k�
?H�<�>����M�������	|�H���G�Y�(�-Q���2�~���$��hG��g �N�99��3�0�G�E +G�ὂ�YB�EJ<��$6r�q���TnV�
>��A��ss��<B�QCm]!UM3��\���l�ak��ٖz��S�YX����jgz���$�2b�p)����ʄ
mZd@d��� 39D9��y1)�>�r=Nġ���#z��^ϓi� �����GTffZ�.�¯���Y��jSk�7�<i0�'����D�K��KN<�yFb��K.(��HƗ��ܕX�HH��)3Lu�T��e~#��;y`O��մmA�5�u����{9�#��mu�hEFP�qF@Ԫh!�0.:�*��H�I	�E�T4E�x����WD$Q�í���ZZ�D�uA��+��8㝵NE�L�f[hy����$>�β>�޾9_����\'
�xF�x���ʘ��+O��X%m���8Q�|
]��4K�^�:�>�Z��:k	w��`���SK���wiz�N�ϫ��ݦ���'s�}�vz�f��ɔҌ��� 	��"��̞G�x��D��D��K���.5�D�}���	��@�J��Erϥ1��[�F�6o�._t2�'7��yBGI��ワJ��2��.�B�ݑ��.�����d!~��j�q�'�LBK�RL`>#f_h
ȞM�{<e9�@id42j5J>�A��#\��^=S�:���EeNN>��׶�Ơ"~��I/��x��r #�����=�'�!@&12�Di8FѦg�+�a�S����@cl�@]I o�&i�׃�3�Қ�)�i�(Qzyu�i#<~@�;{=����.��������O���l�鬶�ޓ��γC�C�|M|p�U��ᗓ$�8���ߐ"�H���LNL���㞢�7�b�s7΅�3��V� |l�͡Y�4��`��w��v��ڝbN��S�����ǵ��X�c-�CJd���?ϥ��@�*D���3�_�q��!ߎ���˹= �3&�
iU�k��.�Xo|��p6s�cQ��C8���c��E��O[/��κ�dĵ54�e�^�����r�X�7K���*n���Ӕ�|v��%��:N���[ZWO?��e�����rG�F�>�ͨ�>�$j�V�U�����(�͙Fa}�)N��)rT��\�L:��`"Yf�l�f��7�$�'$�s������C��݉se���y�4_C�X�H��ߜ��:�b0{@9�^���`�(�BD�����cI��!)����r�	׃P��Cl��١�RJ��Vǹ�ߊ)���]�k��8�����2�~[�39%Jtw��
��kx�}�r���qґ�m��Q���e� B���
Q�L�r��]dF3�J�57�d��̅��۸sz-���y+�W+�?8x�������~^��e��d�T�Yw�Ke0\�QB��4��e��b���2��<N�$�Ҋ��װ4
��}dݓo�d���4!�`��w.�vyN�����h�d��Xa�Q�ݲozs�6{���WJ���:�z�`��{����>��P�0>x8�*H���6�(�&Q����
[)�sOr�Tn!���
���B����4ߴMTo�C�~��Q�~�[Q{���K]����؎���2��v�@�8C��Y��������̎X��lf�(wƉ51&�1ecP!�{#�����$����0�q�;9��
���w�\�I�=��^>]K)?�c*��Bc�rzUv�EleN���%����+������2j�d\���u0�����$�Ch�v�E��i
��)j�pb���`�"X#E����#_���B��ఋ���#�|��}�UG�
ef���|&�7�~��y��$=[�zn�[5�!���X*�$�d�"��8�{�O�'툕�٢� ��.  ;	ٓm���𺰅���	�f���v�H�G}tz�ia8�I��0S�lok���b>��ի~8���P��n��<�x��C����Qw*��$	FV�:>�� �G��)Y�=�DL3Z�0�T�h��Q�r׸r4�ظ�\�{��.�w.�;z�ʁ�s��2�r*�O5�\>�fQ��s����@s{��xj0ѣT���U[���ܡ�|�L)n�0������6+�R�(q�sP̩�؊�Ó��
�q�m�C���~���]씳�n�S�|��}Z���}~j��V!R��*^J���S=�S�����7K�ՔpI@����#�	.��'F=1vߎ=O�C�o�r�r'��;*���z-�1M�k�"i$�x�Atq��u�VكlN[
h�uW��}��I6��3�=�n�f&�9��t!T"��]���k�)�U��:��Čܷ�F�:XA#���DjQ�S��A��� 2L1��4n6�b:2�Ơ$�<)S�4��Az����Q��[^~�n�}���AOԽ�    FQ�|�8(ڃ�K*�Px����sp;G�Q<ݢT-&���i ��)������
G�.0V]���;�[k�k����;��勊�+Tjy�4�>-���K2��ݭ�7�����O% Fŀ���QF��Dp�X�9M&#���"uh�Y��Y!r�By�h�R�hML��A��#��h��rxt�|�v��/��kYf-���t��[5���S�K��d�m0��5��LJ��N&�h"��2��PGЛ)�3�I��1��cbZECT�],��Ls�u�o��Z/6��[�|Q����M�5��H�"!��\�Ս�� -5îpf���r@�h�?/�פ5�ScNj�*{�B`f�Y&ʣ��2��KQ3�QT&Cl衉����q6[�O�$�G�l+d+=W�`������"o�.m3a����<��C�2�a�t?X ���1�w`�#*Q����F�S��+�%Q&j��?'ub���s����\���k��:���y'�~G�*X�y���??>t���T��,��{�w)	�6�zX�Lb1�UD�� DF��f�� �$X��,���	|1͕�
�Ep�M��cҲ�Q��_�g���Ξw����*�S��"(�|9�OO鐶K�~\�B'����w(�r&RI��h��q��%��:$79깗�3�,����<P�6%�(Z�:j��2�����5�Q���|xt��|AF��_�B��m��V7���y]���I����X�b�ӎs�#:U=hnRlR�T"���?Z�s�^$�$��,&$��B0�;!+�8a�6iR��Z��X=���&���.f�W0��jv��׊A���X3g��y#`��,/�W;�~���AaR9�G�As��w�C�jD�bUv�*k���{׸$>2�ص�$�e�'X�]*��k�gv��z��O}�&A��ˆ�x042?݌�Q����t3�~ݞ���\/5=��>a�v�<Y�����nw҈�IJ9<���p� N�"gh��9C8)S"x7pU �����l1�f���tMBwp�v;@wx�k����t?w�n��v �hi��q�������0K����);�������G�I&�F�(�ɜ�\�`��cN�C�!Dq2$�|@�vBl�:d��<�HA}!�}J�^��2ˀpT*��s	�|�nq�^-���Ҷ�lɓ�G�o��!F�����7jJA2ā�v{.�0:QOJ;�<���99�ȴa���7�ft�|p��LM{���_���t�Х�^���G���N� ��U�����V^l �ߧ�
��I�l�)����XZ���X6�����S��?��^̻�\���2�p��+g)Qg�9uN�4i ă��#�[G�mvZ���F3��`6�>u������7
��Zu�{��G�\�u�&�f�q�H"��ω0}y�ȕM�"w1����鶺=��f`.��~�����@������ � �l�f(���*0	�g&b>p�s4Q�m,�!C��<���e%�?n���!S�����~��;h����	q�虮-�ϊ�=�vsBO�%xA�47_�m�dgɭݧ�옰#�9=�j���%���^k�l��K$갉k��Db!fa� #�%%���J!��_����>l�����-�G�|�Fx�
QM���RQ��S��v3?�4먛�H=�R:cV�������T�����G�$�1�f��̞GkQT���]�P�n�d2X���U��0�k�_U$����g���,Q̋I�W�3ˣc�>4eg`tȫZ�Z�X�&���'zDA@l���d*2 ���9���0Z�����>X��O�MW�O�Z�|�tlۋ�*�Iez4T.�I��;��q��&S�&9pY9(x�`,=5A��|��ƕ�V*�֔Sql�m�Ѓ�^eZ�+����4�8s���Kg�'�6=0��T��C����ŠF͹�cTc��`���l9�O�#	�*p�����hi
���&���>���hI��늪9N���Qd��k}.�4^"߸���=�&�V�d~O>ϞM�!1�Q�A����ġ쌓`A�z�Aew�&�h�!��C��"����г�.��nH:�-j�?Va�zwV*�'s���gcg6:`�]6Rj<��ĞmF�3aG�/FQN /(��)��F������Y�{� �=,�����[o��am,_8�;�ʋ�|=��f�M�W��?�/��&��V�[�_��UY���@n@�Ir��)� W�Si��B���d����l FP�0=���R�ɳbO]A�׍w3X�y<��1"����e��u��|#~�W��V,E��N�����H�m��{�8���O��z��;�d�T
\�eʌ(gä 8��P�B9*��T����6��[qG!������%Y��_.U�e4~���C���):]�MY�%=�N:j8h��DCL��+ͼ%4s, [��
jr���č$	S�� �9�|�����U��^o�gne��� z���Aɛ���>/���k^�+}��U�&{0pp���N�79gr��p'�	�gK�V�}� �rJ�w�e�Q�'+�e�j���d�B�U��5��D�~�y�j��55�7�R�QN����C���rF~2-I�WK���u�U�,���N:�&�S���\��j�N75Ϊ���b����b���`2��׀h�G��8�,5��hm���S��
0��E��k�V�}tŴ��fwH�:Bj(U�(��r.��Y��b��2�G�[�o� ���j{=��s�Ξx��Fxα]��(�#<�dK�鲡��h��R�4���>�eva�'/G�d�F���+��G�29.߉$nP��4�R�f?ǆ��'����u�����Ţ#�s�2�#w�����H� �L��f�Y��=Ά��gD�%�Cr�f�y����j�8��v��Z-�w[du�";?}e�|`̜���\�Ǒ�Z�}�L����I'D���9�D�aIu0`
�HI2��X�p�Z����;"0���H61*\$U֐�^����L=�k7`v&�h����ʺ-��O7ݒ����^,���;���6m�c�CKʯN-��Av��(G��g`d�TS�`j�r��.�t8Y4a�����N���w(�I��!�a,gr7Ot'��څ0�˗dmO40����/K����X����$��A9jr@(G��g�K�\�luv����Sgܗ�h����cQ���'vX�lYJ�����RcJk���y�M9�n���̑S��~Y��W������KR�l�J����r���� &�Z��\�h�LO!EHbVp2!JQ�{�>Y5Ny�;�3�; ։��,%�8��9 ����3��
=���*�q��`w+/���&&��	t�vw�O�fUx<�`�C�?^c�9����C�q��s4%m���u� K��ބ	� �l"P��(2��<+01����5|�c{�9X�=e�����-+�ꖕ2�Yu>��˟6�H�T�|4�Ş�|���o^n̠��r�1�����p$ �L��P!0mD�q�,J�3,2�Q'���'�	��U���u�Tprl]oZW�ks3z�0��%�i]�$�ԧT�"#�����$�]=�y����G���Q���<Ik��!Dɣ��Y�����*�'��I,+��C-Ŝ�\� ����&gQ=�O'Z(~t�������H6:�X�l_"�%آ}���0h[�� t�X�s&qɸP.Z�хl��oJdJ,�:0�dd������ ��¿!��WS7�;����|\���������Y���T����n$��a��b��y�foGͽ.n]ʚ�,0�g2�vs:l����̠���Y�%�2����f孑�\17�9A!ݐg9+QY�~"�l����H��$671�qX#e��yC����p�1!O�K�d�ΫCk��s�l�"_/=�����E�sP���k�x%�|yj��܄H��ufC(�y�dX�7��G4)�`���ct�;�A"J�cE�:ʬF��}*\�Ѭ    ���L�GrX���I!5Ü��B,��~�����ydn��I���-��0�ӹ嶳+Ff����pW�	�
��� 9"��6yϜ5�}*�d]d^�Wb����P�H��
l�;�	�������v� ���>:=}M�U`���
��&S;��r��kY�=j�>خ�;&(*�ڼ̠�Dc�&g$��Keb��[���̀CͻL,5D�@2���j6;���J(�A�kA��ې����<�Փ����;pl��h;v�o7
:X%y�!j{�慰�%����[���.n���1�8]w"Vc��;�(��S���*��٪���!Ã[*���Qf2ֲM�ߐ�ԓ7Xk������%Ң�p�t���쬃�I|�4��"���'A��xq�*��A��X�ȅa�*d*v�E�Ϣ2�k�$2Dx$�+�<��R��D�~\������e�d�=��El�o}t�'��EB�8�V�Y|�8���[�gz�eW�(U�!�|�^����{��?/�s�{�֩�����3�p�F�y�%<j�$�c*
�̜K:��m�V�	��3�wZ#e��`{�{y��t������)�s6?���\A�s�O6�_�1��|��R�|5�S��l7a���A�Q�58��O�G��S�Z�_c�X�mS6*��$������/d�P"������;YD�&l���Z�'ݬ�ayN�nBy.���I0$*�3�Y�}�z��A�� ���(ب��|_�8Pڃ���C*l#���.I�&�����9r�%�9��g����D���%e���FH�'��1]Ѝك�Wǫ��:����`�������7�bcF���w�x�����D���{&���'�A�3���A	0"z�;�1��v���p����HRNy�`�o&e.Ap�i4A��k�^Z7w�2��������|ZTR�.�٧�qL�5�ه�������V�d!��C��3��Gp�����~�[�`�*hj��^T0Ʉ�^�d��$u8 ��5��s �����|Y���z��s"���52~��=}��p���>�������S��hPG�r$��D3�we�4�K�|$�8�
�(��L9�1���OQK�Ur�0e\]��	/����h��v,_ĥ�'��ާ�[^A�������V>qo��Eʲ���7�S��YE.���_����ݿ�L�H�@���7��`���F"�D`�a�6R*'z
Rx��Jh��c�<՞��l��~У&<�������r� bs���Mw!W�@߇8�lϋ��j�
V,bE�f�۾p��5����_8�YI�Q�<LւF0+�.�)k|L&�g�e����� ~������	��ht_��|��V���_�*����חKX[��EI��Ϙ��*����������jTP%��x:�"'���f�]4$
A��/E2��k��xo�z������*az� ���ی�qm���w3���'%�/�ϋa�t9���]��M�]X�TW`�><�7������vpluƙ�o|�H"�VA�0�c�-;
��׍X��4{�"'���[�?N�k�m�8�#��Z�ؓ�i|7�)va�ڈ[ ���*E�![��/�$0���cK5NAxE�,9s�1���#�7VZ�A�F0�V�;}.ͣ�>:=}�A� Y���~RB�*���V<�}��E��?W���\��⻂`wl����Z+-&g��@%���NY��Ǟ��0>I�l�#�2*У�	H���R�(�|�;ּ��k=����`��jx�+I�ے��eig٨C��߬T,�?��������l�Q��V�R@y_���U�� fA�#��G6r8�<��#�����g�ə".��\}�[o$�k��fI��f`���7����* jR>?Ϡ0%��uz�A��[�WlR�Y8�4H��޵9�)%<�2�q��C�D���1=�@M���U��l��/7t��T���j�#�Ƃ�J��O޴}��������+T91 �f�M�/N1��p�r_c�Q���I�[����QQŉeq�a\�)�`��� �c��3��^sv�`M��q���7�!��+�����E
{�b����/�ֻ�9����Ӱ0�Άn2ܨj�&
 �� ��T�$LP�IQU�謣Kx]��W�p��,ࠣNs�ɖɏ܅�(sHa�#��ZMJ�g��S
�^� 8KN�9����L}R��W�VZw�y�S�� �9`������ƀ� �11� P�g@�H�	!<�){� hb���eX�4X�]�,8Ԥ� *(GN���Hwm@�Ի`[v��`��2V�}Q����c�33��9�ǡ�[j�_l�Gw0�1��c����dw�4A��9W�:���4Z2e0�$8~3S4�(��B�L=�9���*�}`�����W��-]N�7����9��܍�v�����&��߁h�n��ۙ�q����L��i�����trL� ��	>�#�^�����n�տ���9���O�Io�1��5��Jœb�O�?���\��GG<���F�=HY5
zϜ�H#�	��2� ':%��^��ĚF�h�^;��>����(Y�$�lˏ�Qc�k}n�Q�t�M��a"`�?�4�ϋ�L�qg�'Ur��L�����o�Q��8�q����W�H�!k���e�8
�!c��L*�m�ԕ�,E���ض����V�g35�Y��Z�cn����,���ήV�b�a��p����`��'s��n���l䙳)���u�������D�
,k�&��M��"�r�&��V�K��;�*m�E¦"<X�U�i���Y� U��x�5
��x��G5�k�v��tf�6�����j�ApI���LL%Fe
>��Ԓq���EFF���K2��NS�$�^jh�.E�:,����3�}�㮫����-,Z�Okݷ�ߖO|3�-���r�{������s�wߎ<';�SS"IF?)�]�p:��
�o�:��=X
Ng&>H��6�3O8�]�E��+�BZg�bڮ�F�k����IC�|I�[~�G'��)�T�Ee�Y9�6������ E3,�Q�*[.��SA���4S�*�������������
v:Oځ�7�������\��م����W�-N(n�uZ�#jo�J�hV�=��ξ�f���.0=�`GP�)2F�ND1V\3C�O�MYs<����E��cYZ�#Æ���qs<����qm>b��u՟[WW��V��7�����L3;�|J(������*=��n�=IeN�m�������s��������ֵ��I}1������bbT���p�0P�9S0K�Ek�����QXp���.i�� ��8�,��HeO���l	������ܕ��K�S�e+���� ��?�h��Y��#K?Hs���Ԛ̂��l��PHd�2o�b6!F�"A��W�#�&gHT�'&0��b v�5ԉ��4���.-��:���'�����n����N���2拷29��?�4�-��j��=J���jN��Nd��DyA���R&�Wnr��C1k2�LT�i�4��-�ۖ��~\+1l����裏NO_ÛZZ����}��
�,U�/���/�?�c�,��/t���Am���M�	���� c!�(�Ui�rJ���1h&%�<f͂�g��D5A��	6;�k���ǵY���w���np �3���dS{�l�7��{W�>*j_o��_����bo�	� �^��33�֊%E�b�e[A3��!�ʒ��KTy����D���L�A��I����S��=� �._T��(�ޝ����v��]�m�rM��s߷��q)mGgyT�7SJރ��s��UQ��SMe�4C�l�"��� �J2	cRJL*���W�SH���F8�^�v6i�֧���+���y%���K~yV ����u�֠o��2R[R������p˂��T��I�p�hH�t�l*z�)5�F��+A��T��3AR�#��O����y�֣�}�d�0$�E�	?�J�9�m>)��˚�r�    ��[�r�t�sD"����8JA��Qa�D��Lh�Q#�C"����0�����T.���oV����D:o�(@W�j�~�w.���:e�G�
�� �X������
���(��I��2��D�Ep$eǥ�J-�G�`O0�����L���e�rE"A�D�4�H�8e��U�d�s�)i���c���^'�Xv�j-̹��z=-�?���:�O�]��T&� �`]�� r-��B+
V�sG�WeE��H�G��z���H��#IN%x�":.� r.u�V�l�֗���Ȏ���J �8�9)1��r���%��<�y_>�ށ��I���X�`c���")�,���i��Tg���(O �|�b-,x����ں1��5�e4;�xݘ�+������ŕA*�����η�s�oQ{����H�U2ڝ�?��D��,3Hg��p)X�F&ˌ�TG�7<##� '��wiх�vS�k��`�gbU�h�._bb�2�����}���׬��	�s@��I�܉��2iT����v�frι͞Y�1� 8h� 6I�N����P$��G�ǴF��ʢ�B+	;V{�|�q���<���������/1ɗˈ�ߗy�w�"�b��K��>j�<��� o �Ґ�G6z�[���3΢�6���p}cb�GSp��]x� �:�g���U�=�r�p�m��/�l�K�Ćl�I�*;�?(U��P��[�N���(:�q~�K��FaĔN�ICp�HO^��%��:pM�p>�m�n8�΅p��e���p`�q�=~\��zZ?�7(���m���\�V��>��:���!�TH\�q�O�k���z�d��0%aD�mp���%���F�K�َ7K޴
��J�����g3�����kC�����U��C��#��e�٨l�N����NE�5Y� �p22�p���>���3l���;<:X��~'�����r_m�As
�Z��R:�&��'4����t�;���w�*�bf�[���`%�x��$= �݅��h���d��$Q}O�ң�e�S�Yk)w�&�ۓy��#�t�(�3��Zy����@(�6��QnV�t�/����L4�!&D�T�,F|;��dnd�|R>	G�%>�N����i��\D�7�H\H�7?}%ٶ!H:Q��Z3�qeί�׹�E�r�Wk8I{��d�-�~�n�0>juB�����,\�I��uR,[�`�a2�� ~g0�����2eȶ�&Ɋ���u\Z�cr��Jri�m�Hi�n�aͣ�>:=}M�p`��yn������vm�6w�T���=��n���Q(>����{u��D������4��P�9gW�����,Cn� ��R*�4��}|L�����g��v۵,v��O�K��@�e�m��?�X�|Ӌ��Z�ŏK����)��fH�����DX+G�`Wx��&W�Ř�tBEuR��hT4�q�:@��Y0Z���oK�!Kw9���B�c�ꎜ�]�^R5�we��G����������I~���_/��<ݥ�%�[����+��"sbX�J����~��� r>ʒ�7�cBe�b�"30�Bj���L*$ۗ*�hJ�� ���X�Q��Ed�M��q�4T��ޤ�8���c��&��O��Iq�*�̧>�z>��ȳu���<g3)��5�q$p��f��;-��D6;3p�'"��RB�L�@M��?�j��I])�lW+�w\��]���W�W��������J'X�`D�ǢB���Ii�x;�̇����]�����,������B
��`�S^Ya3R ���B�/j$�T���Q�摆���D�|˾pl�i���c]M�ã�>:=͏��K���5�ƹ�z ��i��}Q;"��6C(��G�Z�vq@I� ʤ�����'N�5�Anʑb)�I'׌%N���^�'*yN_@�K� WoG.��֗K�Ҵ�Nw~�策���֌�:�R�X�j��8ǠK���������L�W4����3�vRbx�Y@��{׸�T#JQj���D�fђ�+��M��a6Ivګ�5S�}y�v�'�.q�Ž��m� .�ok��Ťoש�`[.s���Qfn�:���V�b&�NG�w@Y[��~9��'�y�d�A�$�=#b{&�/����ZQJ�c���1�y��1�v��L+�ւɪ�7w?v���D�v�v����%�ыI*W��qW�[ǳpd�z�NK�T�Tː�r��4�$��<c�����zF�c�d3p2X�EE4C(wQ,��x��{�����ᓚ8�ti�;B,9�g��ܒt�Y��,y~`��:;���<mM�I�� �/����Y�K���$�1��fɶ��쁞Av&Jk����f����+�󻒽�FT��b˭bxqn�����~B�s0j�%�Iك(k�HR&"'�|�6f3I6�Ȝb�"����
��v��ȏ}]�i�.��v���Y6*U��y98O����ǳ<-���g���>�(��Gx46
���<�����>;�M�Q�l3��7��*`��m�XM;�BP��)�
{lC򲏽:b�:8�֚�X��`�2#�v<9U�}B�d�ڝ�Z��[�׎z���몌��/$�$���D�$(��+&E`�O�� N��L�(+T�"�x8�C��)co�a,et��D�����}����k��!��0v ���f��"2���_�@�h�n���U����R1�ʁ4���8R��G���pv��:E�g�919!���z&<���;�42(�b�u6_����?k9l�m��5}:u���G��nT��j��Ztڿ*��i�&{�Lr>_�"��wݾ4ֻ��ք�IF��jG�b�<7�&���ܲ$]�.9�Q�P����N�g�$�ι.ԲP�i����n��1�B�;r��|'Լy+u�+��\��k������|5�8��o��G�ʌ�|� h9��Tjp���2�DF��d�MZ�یDJ�ؘ"`�:�D�h�Z�;��h�Y���Ot�s��zXE�:�E�Q�){�n!��εu�D��jC��x�S�{�s����P���z-�p�e�ҳ����j�$��0w<���a*h)#\9B���Y����p���*&����h���7�n mG��-���sQ�ȿZ���Xz���Wh�.��%�9��;����uex��j��W[�r�����B@!�1ZH!�y
��(5�Q8��x�bN*Kx�u�5���5Ƕ0֮U2��:{��{�^���
��S,������)1�H����p�s��M3�@��h�u5�(_��Zsb�F��Apq
��A�v<�C��Q��Q������QoZ�
����
N�f�V�����'q���Ȇ�؜���A|�N���d�]F�}I�W��"�Kz����fNND����1i�6����'�o4({Ĝ3�W��b�p��дd�Kd;bރ����m+��rE�oN��Z>2�� f4_�2��3�ko����w�7�:.�ݺ%w�:FLUןPˊn�2.[�|�ZS-�r����b�B�_��h)��D2ǄDSyĔvNcw��b�G���o1�lI���Pͤ��N��tw_��Ȏ"A��Q�]��G��?�lD�� ��j�*	�I)�	a
!��1h&�2���n;�k��Q�5�����2~k5ɭ;$��d����rm��I���u��q�S?��z��>��.m��d,Z���EUJ�Q"b �����
���!����+���q;� .5B��J����4R�f�ʥV�K�)���bM���k�!�\A���积� þ\��oYA�|s� �����`b����x��}��o~G������iT��n5�ٓ$2w�#3���$�����8����R�g�� 	G���(�3��mw'T���R����oՑ_?<�hӝդ���"�E���bA|��~�:_���K�֧��_.�� |VR��ܟ.�����/�R�UM��,��e��[zƿ8��t.�AU_QnG��xO�w��61p����ĝ����j��&X">i$    �<p���>2�<�Z��m|]����6'}\#����'L?�a��z�	�t<*:ǲ�_���<�Q9	�=�����Jm���0�Y�����PQ���,GY`�RȌ� ���)�d<�!k�]BM���k����(����?��^�m{m�:��4�=U������Y/�\�[�)�oː뻥E~)%��U�K�t��s���r8�c�-��S�~6�1����x/@�a��>! e�-5��AL��D)u����[�2����}+Bw/(��R64h��5�j�}���f)��P۹~Z�^,����G� �չ�40L�*��2�‧}=�H9���21!� ޱ=˓!)p�D���i��_
����sA��k|]P4tߧ��!��d�y��Ԯ@���o�õ��mz~���ܾ(1ȧ�-5ö�1�*�ZtNDo�r,qJ�q�I2vv0�@��,:$��j��� L�o��LҌ��s~�i�>��d��n�W�⣽�ܛ��� pϮč���n��j�[i�V���.U�|B蔅�.kJ��oe���}V}�U��1�՜�Z�ם�X���O7*ۄ�����\m�6@⯇&�w��)���
���\� zH�gPd�e��&��e��,p�!Y������q�!^��$)m��Y�@
�{E���P$��N��Uo}�9)�Y�	��h߄bmf��#�� ,�c�$\7p�?FёL�� @�=8�z^1�y�2j���U�_W��ѫi��k}n��k�]�P@�ϼY��W��,��m���Eo��-�dShXU)��VUp�
�J!H�*��$w1Y�7��t&��$�G��AD.��37]T��z��P�Z��Zߝi3���%���jV�8�myQ0�aʉ�C5��D�(͐�p��<c����:�q���w^���2E���\xf�w6�Q2���u��4Kuh�N�@�<ψ��񖼐�Qu4{���{�������[W�>.y��F�K������-�_���\����p��g�:$1[�,zG���>���Фy ';켂�Lw
|��Zh�Z�5w�:m�Z?=�>����6��.���09��+��g��N+���s9�������O���g�R=iiy�,s��b]
.cc�����Y8�,"q��(�
��8!�q$g�j8s�I��/u�l�me	>���c=df �z��gE} _p���R���tVw�L��
9)5C�T1ʖ�N�o�)5'��/k��s(�mڇA�p`b^��&v�z�6�(L�����dܛ�,w�M��W2����a-�w�O����L'��F3s�O��
m���F^��BDˋʌ�;}��8F<
���+ɵ�z�����9&���n�{�6��6���n�Cg��aP��g�|eN;�u�Nܧ���YCR�ګ�}��7\���/ �Wt�$��E_�c���ˣ,)ąx�
�IZ�Y��E�Ϝ1Z*��@J�r7�3Y����lva���#�ok�M�S]g�m}F�%}�T[��i��{XE��b��,��N�G��P���bY�M�꘥��Z7,iy�q �G�p���SC3���<�4�+Պ�Ӗ�6+rS�����i�C��K	��n�N>aNCpA��Ĭ��{�d�<���"Z�"q�ING|����I3�T��JT�j��#�N��7vۘ��M^׆�t.�|+A%P��.���n3%�ok��n��|���		F��j��^@�%�.yƷ�_��$�Ȅ�`:邏��yP�"�ԧ�m(4�홱~1}�K�6D�qd���J�u���q% }{$��5�8x0o蹠?Oʗ����>�|�2�?��F����]���OGw{6f�ԁ���8*��Ua)Y���0�R�Da���q�	�]���(�k!J(9Ezs{�4�>[��k����8�ϷN�o;���:��wk�U��{N��?� ����p��
F��~�(d|b]�H2��r�G���F��1]4�S�)>��y��t�a��Q�ʯC�w�Q�ng�W6��Q��M��V?$k0	����;?#H���}�Ct4���e���6�_H�eqF�p¨]��qD��G�O~�ր¥�V���Y�v餅}����Rl-�j��C�ҙU��BYG5#�z�� 0=;&�O�,�F��S��|1C3��u��U ^���v'��՚.
KQȊ��s��au�e�p�*���.�áz���6�=[)��f����)\8C7�c�^��.���!�%�YU�$)�f)F/��p &���9� ��[I�_L5��!`�a�@��%Y^t��J��	�F�y� }Y_v������;�����J�\0�#�Ǽƀ�C���_z�F+f%n�z���+�ǂ�	��W����OV��/+���ʛ��<�s��{��.gBk�ڣ[� <H�M6B���h(�sYc�h [|���m�g�U�Ɏ�}�٘~yU�k�nm!����m/�7�]�����i���cc���y�Ƽ9�q{��*���џ�,�wO���
I�|��{!q|�#�)��%���MB�S���D��jN��LRex*tM������M��nܟ�T�J��>��ա��tu�ޝJ`���|�:���Ƈ^�+�`���7�k��,�g�h��;:x������d�E�"�\P���L�'�uk~�������c2賖hӓm��Rkvdz����C�EN� ��<#��vԅ��acH��YN�P$��
��K�H��2e��s-UE�8��v�)N���ք�������7㪶�U��z�Lmɀ�:M�iu��u��`�q���f��'-)��I����7:���T:iK��������sn�j�U�8�SQ�#�+�}�WW0�N�g��n@o|�F��7[�|t�}Kw.���-x�8|�gCі���<���uV{V�����j=cCE�W��8<S�in)H��X��K.)��N�ٳR2'�Y���Ⅶ�G�J��+������65oد5����3s��]��Y:Y��ٻVN��0)1b�l�����Ѡ?:q�[>�o�$sj�cI&�(��Ix^	"1��*��u�F��VeeH������<C��W⿟�����a�F�ֈ{���G�ݷp`C�v�k��ǭ�=Ο��j?s������#=۔�Ze�n�f��y�1��/ɨ��f�g4�H���*сNAC�Q����ڝ�aqV�u�]n�P�����u�l��#%�A#���o!-A�����=�)�6�sRba�?	�/@\tBH�r>���Y�2mr0,���W���2h4�.�F�R�!�Jo9��,۵��4d��{��w�rw�&q�5h�]���\̿��)ȶ[Z���y�����ϸ����B.@Qm0qX|f#`ԋ����̵q�3��h��7�8~j��g�;qd���D�����k$)Br�GƟԛ�#������ӕ��媢v�FqmD}�$Fz��Z�Vg�z�ʊa0������>ὕ&s�ՒҀ���̊.�@�M��
!E�1�j(=�������c�K������UP�y�	X��Okq�+?���q�3����8O)�Y���QĂQn���P4�HL��cE��b6pW���g�\!�c��l�ݻV��1�{y��r'�:���fs�O0^���V8�|W!�C��˵���Gq����9	��]�SMLG8�
�Yˢ� #��)Fһ�(�8��Y��M����PR<�H�Ό1t�,0�
0KD�%^��e�%r��c}Ҭ��V�j�ݕ�x	��И��Y?��� ^Ȅ(;��l��F|y�R��s�S:�,4t�}�1��'�;_��FL�\����Z)�C�.��M��F�S�pXQhD�Iצ�y��Y/���'�i+]��֏�ٚȸ��Q�^@S8)rոG�0."*�(R�&��͒b�,z�:�RJ�:����E�P8��ۻ��Y�i���Q���#7����FvzO�r7�Q锞t������_�K���b��]?P d(�s������7��7�    _�j���i}ޮT!w���=�0��[�&9���:�d&F���H��K�	�3@-�`��>k�N9w�Md��ѱ�N���A~z�։Y�\A{B]�]��� �|��Lok#Џ����;>]ecj��jϝk�Qr��M�*�a�Y�K�$��#�f(I���5*��)�-�l�	J��e�V�
�ѹH�B4A��1?�a���Z3��
�W�ݭhj<���U����v
���5��;�{o�!����n��]F3�V"�Iv�	鏓�my�D����|�"��?�B^ y�Y� ����8�������z!�x���B���K�*��	���/��q�~(�a2U/�=o=u�(�$dC�`�8Y���@��O,<
�-qŁKT����v|4lþ�]�aT�v�Z��Y��R��1�������sS�#k�a�$?G���\�u�s�ؾ�D�%D���ًhB��fV2����i���6�E��0�a�e_5�O�9�I�tՖ�f�V��!{�f듏���9�=)x��*a�t��tvγ�D:/�j�]�U����}m�{v#>�9�9�lSn��bY��\�AE)���'��g�,��Sj&�`rA`X�I�fPy$��lEjv�۵V����1�>���۳;��@�S�>	���>>զy��-vT
��`|����� ���g����~q�����^P��Zۤ%M(��_0��^9�T�d;�Y��h��aP��0� f߮�0��a\ֆA��j�t��<���竡�;!�X�Up�Tɮ�Y�o�{����;
%G��7�
�t$���AGa78`t��B.�{G��c�l���tU����
��O���k{%�'�>9~bw*�ѝ4� ���;�����_uN��
<��'�t�}s2q�kq�L��\،�l��B��4zƲ�I��Rk�E�ʂg^fmba�*��(���}����v ���@8}����LK��:�<��n��fb�|EK���ɼcY���wo���UO�a����q`
���Kp�9^�_���4��5x���VI~��9Śk��@h�f�h|<D���Z�4B�TO���A?�pmܣ8T|6�+>;�G� �An_���@,�b\��y���E<R���Z��tv�Sxh^дO]<t�$�p���Yx1
A�����W�Z��D/ �h����0��N<<�����6��q/��A�Ϛ��+��
�8���3q� zҢ1f]���ن\��ZxYJb�$2� "F8:E�$zr2�Jl�	�;F�D�ɑ�����D��/[�NAZ񑙛��.�Y��CS�ɣ�9�\[ɑ2��B���TESUR��Bi�1�`Ϻ�7~��X���f�d�*Rt��� ��ݑ�����xM���˃��oI��>%S�Ĵ�|��������ʖ�\�(��H4�x��E��*�\�����S����a0N����s&��fk#<�6��:�j�i6�zdvp|����3��N'����<h:dd�'�\)��S�g�H�������d����|��8)Z-��l��F�O����#����WZ�F�}���o�Z8�u:��߯��w]x��#+=�J#�-=��s)�40�A������ރ*�,20����P7"�SYq�Ct!X��xc��]磬�8'I������`�m=����R��Ȋ��:72�/O�#������b�J���> :�̪��3�x����4�����
���Ʉ�rA|�dARs��	TF�K(��I��d���I8�׎�cpN�w�\^_�r.o�|̈́�$]�қU�����O�������nd���I
��&Sv�a����jR��lK�'%���Zǈ��V��"�P��\��aȋ�tR��A���Ա`����{�6���A{+�7~N�d��[��mi��k]�i�\��e_���R��vN�p@�'=�nfHZ<��*&0���,Yp>)zOI�л��]v]Ԝ����Yv6	��n�$�6q��B_�REa�|��*^��������Ἢ^�_{��?���$��������h���ـ &*3`�w�{�H�!I�8ŝ��AsW�&��!��-n]�{�c�Ss%}l߽�$�����dXƏ���~RP��s����I��Mm�������fNL���~�?Z>���fE�9�n`D�����B2T�:K���c ���1k�p2:���L�c�i9�V��8\�$&=���PD����;���7L?�)�o�L������� n�FVB0�B#�'��R1QӼ[��rx�gM�%�wD����h �!�J�2�T�8���I��w���ű2,�P�cw�]��2�o.���U@�d@��}�Yg�u2R���$��]ِ5�+x�F�O�qDjcg7��|,�0K�o=��[���BMN��[���~컚E8p�|�������oS���?4��Z�Y�`)ǧ0E���D��,��uA	tg>�=]\u@���]�W�b=S��W�r����C�I~��t�|����B���+�G0ۨ�_W�o��Q�q��q�fȄ���Q瘂�G1B
��lѕu:Ɠ"���9q.�B_)��S@gW�C�>�t3s�����H�`���U��V���8�����j4�/�q��k����_�s������+�ߵYrh(!�0�V�|��f����P��㓝�+�f��-s��A�^$?T�M��r��&9]s��nk����k�tL����������.އG����9\W
"�E�P�w%Z#�D�Z�S�\8���S�prO������F���u\l��p��+��/�����è�����'����E�&��Y�;�8mj��p*6@�q�I+&���S	(�����r���'y�Ǌd�-
����h��N�Z�eC��hv%�k�乍����Wux�mSj���V��g+��ʻg����[V�ݞE��@bxø��Eeb��Ԕ��k�l�&�Ɂó�V9��X�s*iF���l�J�Y��B���ikV���}�Z���M}�G�/D�2WJ�J�I���F�܂��O���������J[J��w��X�,I��)*��(��R�n����N�쓵Qfv�>�~���"��ډ��a���|^�zm��u҇����O{	b�\�	�xΩ�Lde(<Q�fK}E�r�I�IL�^JM��M3�%+� =�F�D� �<\޳B�'�kt�vq~��x*����#q�!�>�8鉕&��ʒ1��!j��/6��(z�DPK0�s6��U�ˢK�!a��b*-�>�;��Z4���Ĥ��]M���P�A�Q�����Mw��5�ޮvuD�A�c��9m1��p��^��$��=:7^f��-��1�"���b3�߄F�h�^H#3�εdBaī{
#io��n��y0�3��,�f�ZOi���:�8�5�����窳R���n�#��J;�s/��H��LR�OT)S�z��8|NU5�7��k�'��v8oI�h�^�M��������N��h��ju��m��:�ך���К?0�v�=zul�F���@0(�����N\aԫ�e�F/,��̤b�Ա0��Ef��K!��Rk������Z�Q��z�՛��5le����3|��5w'����]�/���r{����]���i�ۯ\7]Y�ntw	pQ�D'�*����Hpнo�5�[E��T�F/)E>\x�s),LU�C_W������A��q+>H��>9���8X�@N?�g5.�i3d�fZ�p�G���דF�6����Z�m��>�����a�.�O�$cx��\�e.\9�<��$V�	J��P	H�l�����zA��9����P�vy��{Ρ�.�dm�)Xv��P`U}c}�'kﯗ�ʚ�m̓"�fꆍd/Oūv�s��' .�_N`7"$}�6H��gʅଢ,�(n�r�9'<'Z&e����A�k��_��5?h]�a�l���ɰvku�aX,�l]��f�
Bi���O��V^�ԛn��o��ZQ�s��s�;͟Vѣ    &�� �ݹ$՛�0��L'�	+�ӳhV�Y��>f/x�A[ϊ �C)crE,Q�ԝ�ʓ�'�1�a2z{)��� (��
���lm|�G���rc`:�õVn3\D��3w������m�q�묇��V�[��o֖�?m�����iA�G˅�@a��F򤋉�Z�"ZZ�"�Z4��"FjɦJ���a�w�9[L�ns`����#������F��-wz1����~[��κ2����u����`>u9�u&����N�p+�-�UGr���-@t���ǅ�8�(":��!V�	��?M$�C�%��Ю�?\����f�d��'�����+&��XE����>_�g<�;�P���
��*����d����w|�;wq*����c_�E.�§��>.����YI��*!�� *g�]����+8Ӄ���77��f��_�4�H1�S��o�j3���p|~P���g��+S��?Zjm'M:��`+�t.�3�#ϊUI�ē-0���:�ut�=����## i�d�~Xo�֠��}j��M�8a{���U1���nޣ����u����-}���L��3�hF����,4���$���Yp|[��^��2r_(���`AS��0j�Kva��v��M*�n�q��1�_�d7�|�n�j�]>�rZ���ͱ�['����0�����o/�����_u�t~7��SkL�೐|;&&�"T�K��4^ic�Q1��Mq��a�^��>ek$�a4���B�쮲���z[̀��X�o�u�ۛ�{a������E�c�8��g������$Y����,h��<i���:��S]�/N	��@�u��Z3�D �x�g�2>���r��-^�`<W!�CLm�S���}�m����=̴�A��m�����v�5z\҈���b��W�r�Z{��ʾ�|�oɝ�����e�v��z��/������ �)O�P�M���$��C'�C�I�c%%z�,[�v�L�^Y��+�M�6tB���b��]���Ipf9�ߟ�њx׻����O������9��Wx��ϊ�?��v��Yc�Z;k{Q�M�Z����Gb?n����:M�x�٤Åc�$�B�$Ⴭ4��l)TP�/�B������%�h�!�D#��c��ؙ�vM�չ����ҠC���m��+üY�~׉��oM�|����Z'��S/bO��ONV~X�fG���
��Y3��,��̻͜Գ����@�^���'�.���#
�5"���&my�d"���d)5 �>��*YZ��_r@��]c��`D� =����+���m�NʫN1w�v��څ���Wmf�Pə�l}>�U�񘺆�9s���Bpo��"I52�%h|n1>_X��(c��2*-�Ç�|�N��,8'vCn;7p�6jt1c���\�{���g�{HpxN�{�����vB���oS�k�B�[��a�6�'���rD�ܰ��%��/��0�B�D��B�Az�Lm^��VR�z Tn�����^	h�}c��	�����A�T}��Jr����PGH�gi�����I�1`)�7OJ�p�Hh�eJE��̤vܻ,���p�^��cA�y ����*��b�Q��5`�߻'ޮԥ��w����EuuӔ1�������Y�=�QQ�U%)ǅ�&H�l!	(eAG��¬̩��-w�Za��H�~ZD^�8;˅[���Zg�D��ܦ�._�BS���zr6��Y��]V��V����g� ��bKp�~�Q1�S_{��q�~�6(4���$о�l_,��1�����aN�	���R��r�*|?uU�ֹ�����yP����<zPoȾ������^��݉T�;���5Aq5�S�c,�,�]'E�h�-������F�����n:I�8Nk����b�5İ%�N3�����x��>���6i !8M5>n��)�5�M^Ϸ������RGΫf�/�L�q^|�J`AItk��Een!� �L��hᅇ�
8���,1 ��c�t?%���D���k��r�,�ӣ{��o=�{(g5b�wY�Z�PF_iR뤤��(E̢ �������<������>$���%��v���B	b��| �2��\{�[v��A��EoO���l�{�a�� M���8�
��T.L����ጌ^�4L�[k���*}�"��,��1�qT�	�m��lm�}8��?�a���i���v�#�1��[�Wڇ���n圿��p���:Ir�T2������pi��9�%��/,"�C��2�CF�C�� e�&}'�����+��b�z��oWƱszz|.E}.����V�g��,<KW4��s�H�L�w��m/f)�PR@����:Z�c�Ra(�o�Mi�&a;���Z�-��ӻ�O���Vx�~�NA�O>:��5��u��u��O�dE��Щ;��1�Q���3L�,�j|�U��K�ǅ�T�(��ښ�8Ϥ��E��S�\��1�XJ �������l�v����Nf{�(�s�#�b��J���>�C�Ar����*�'q�x�N�)��p��1��Q�1V��X)LV��v�~慑�������E�%��#K9]�=��X>@�I
#�!8��}�V��һש�UA���m�r��C࣌��i��q�f�t,7S�	��(�F�(����Z�d*�b�hb���f��D�0F5x�E ���D���8�!��.��4�n�����]w�m�vB��.x����5�U	+;�R�v[��kK΋����?x<f\�{ZMƧ']!�չ���_Nj0w'
F߭M�C���
Cn>3xYRNAEd�\ ��A��Zg|��![F�I�p��Y���E�"�gU}η�L�v��n�d���rG=�G�~���������FT��.)o�O����1�)%���zU��[�*^�o��|���]w��~�_�ȃc3%q�T���I�g)���b�J<S�>;*�`��+�����J��1Ћ���D[e��?K�Y��	�~�k��3d�P���7�+m����4g�$_4����}���+�{P��� LyfŌg֌�4�%����ɪ�B(�F.�BԊT�z�%�ĢW&f�yJ���Kc��+�R�mzd�3;\W}�b�f$�q�!_=����$嶱�3��Z+}���n��o����9�������� Kyf���-23>'<�NJ�`���D$Yn���V�Xo4���*.6�v��v�ݴ};�n�ɽ���?"=o����R;rZ[�O�7=�>�i�~!�"8��	A6��s�~<SCm��D�h�I%*
�m�$�#o�F#���J���5C��
�Z��D^�_W��{��l��6��gs'#���D��MK�sX�]�[ ��f̺̣7���([���R2G�/M��n���^�`� _mz�v��n�uǍ����bn���9&a5�����U��V��tK����P�~1R�MP�<�S�Cv�:�.��{hL$�& �h �����+��M�>��V�t����v;˲��ۭ�1�ɰ�7o�|]k`(v�����u��o׹$z<k�����Ѥ�󰹴t�xδ����M� v�8�G�:y�FF��v�I&� M��[��P�G4z�r�&���<�˦�i{�k�:��ɗ�>�Y��] �笠0�����ܟ9���ɘ�Z��|��ZAh-@��*�֒���I<ʌG�*[��a���[�g��o��9`��9�O����e��d6���n�N�Λ�>�Yk1B*�헒'�$����K�c��/J��#U51����
Vr����ǐ��f#��k�ʱf�4N#M|$�a��ƶ��v��Ub�qn<����	ѐ�~�N�ɼ`tw�u9��~PB���K�cL�N�>aܙ�,T�M����+��?<G�x~��g���x��M���f�}�j.Hqּ�ݚ��|�kM7������A]U��9>(z9�,:0���){�g�~� ��s;�1k��`3�����5 ��)c�D�Wǘ3xi)��
�$�	a��4��sG5�������}�n~�����    ����uV論hh��;��ݝ*�(��3���>o��6���)6&	��1zF�KMQ�)4��.�J9˨I�Q��1^�!
�c�NS����x�k�����԰�Y�&��˹�~Fg�~w�b�aM����l�R�CW�є���Wy��h��ǲ4�IL�EJ�9Te1���Q�}��TF���`���D���ƺw��B���:��p��y��Q��f����0j��o�sthਢ|W'm�[|� o?oUE�V��z�^1�r��b���$�g�F�Or°("�����)��1	����c�A@"a���urø'�=�_�fz�ӱ�z��|�'Z!����s��Fs(UWK��{�\;�ݭ�WK�ÔR�p�gɍ1���>do�s^R.
�U�dDG��>����rćZ�(��"�9�cIGM�lm����9P�n���Q�1�����'���H��,�˖A>T~\qy����3��o�����L�UȟV��k��&�ig,�)�O���*c�8H!L�6�uL�4)0�K�IMn��x���g��#����Vl*�l{"fk��z�u�|e,ƌ���/O���z�V@�����Nx^ɷF۾l,P��<=�����g�'�c�U&&|�ENE1c�'>&������x�"WP<��\8�!	c�(�(r����:;����dm�H0a�,_�'���u.�7=�9"	��:_6Zj����ۧ��o�;r0��.��of�?@���R�y������Q��Q�:ڳ+̱�_��� ;t����L]Cc1<N�X��`t���������D�g�����JP�y��C�*�<���H�ϼC�@�Y����2�hTAgOf<�B)&EI}���B��&
q{"��h�m���@q; ���'k9�q�y�_�2|��Z����S�ΎF�Y�qu��� ��.�,����p��d�R���%ʒ�tT2�j��9;�C�c/��.
�	�8�	M9F�����������R��M�����]�̳_�vP�8&��dX�,�eo�n ��~�������H�5 y��3��ȗ`9�]� Y��4���D%�N��X�!�K���JV1�op��s�e"O�+���]��vm?��.��o���Ems8-1�������p�z��g�����ov���O]� �)�"X)�$�����F���D�D��Q7�V'閈��v2et�!����G������î��~�/�o�'�8_�T��Szҹ���{�����Y^�=�	��;�П�M���@�_2��Y`��;q�qҧ��ʂW<���w"��4B��e���!����ڿP	�^F&]���~���`�wŌgky!���.u|�x�k���R�T�섳��v^��iB����i�@���G����q5*��_r����3��o��(�^�WI��T�T�e;y�f��i��h#�(��j��:R~{Sx��f>=T]�q�H��5�������#/R�m_�pP�$.EY����	�tXA�k�~{�V�!���s~V3|����'}^����Ο�����@��a?��m����y}��Y��ʁW�k$3�}��6,��b_pKE���О��1�G\$X��e˷S�|ר4Y�էR����3#?�h8���I]��5�·dd�͛E�(�.`�R�rk!B�Hug�.�/�E���K.�j;�UH�$Ϲ�`|f"+c,��b9��õ�՜A��i�?�����I�yM����^I���8�W=rö�����Y�9��p�Ǹ,I%�̜��|� C� !�EtԳ��Ӳ��V!��gRf0�c�]iq:\��Ѷk�~� ��30}�-ݥ������~�NĲr-���z��M;�����:�93��\82� 0@��I �8�j�7"
�� ,�[�bJ�v �fU(���:e�0@��W���y7��[��pfo���G��7��O���ћ�j��4:�u�v#]��b2���ܸ	�$���j��XG�A��F�d=i�d������)�?G�<�s�+n`�.�Gr��`�H�1��V$�������I:*��ŚG�q^w�f��q���%Z�h���ɿf�Z�� %K��4h\�FE�5^L�!��6�N=V���5��?�p�E�n�"�!��Z|���q�G�%r��r��}	'�� ��M��/�Az���It����[��s�d��yOQ E�H<'Y�H�N!���|z;��5��(<��38v�|մgvU���D��5�k���ᳵ���D�i�d�G�G�a�%Ӟ%Ks7C�EQ�Y�1�M)�ļ�_���!.���]q,F0	�=�~��hi}� �����Shw��0`ĴcF����#F��$�G�朲�B�z�W�&�,T�@� �j,�����Q*�M�%3b�	"�,M���n[N�wv�6f'ػƻ�+�ZGC�+�+�|�Uޭ�Ao�7�cMa�P}�f�{���v"�gW)�o��=���Ƚ[ԡ����o�ڤ�:Q�����wxs��N�_Y/1P�h��X�Cb�`x����?fS@cs��GI��֨�!!���;�ٮ�N��؏�~{�퇅�m�i��	EBˡ�y����G��V�_�e���/:'=��}�6{*8fo��)j�H��$%\�QC��b�H��tʁ$�؄8�MhM	�`��®�t��|�Q�)�f�]�"�%΄�X�v���|��:���W�}���1�J�\��5ό3x�,N{�TzWE8 �D#�_)�h�f�r��(���`4�̎�wc��"��ZUG�G8���~�Zc' ?Y;7�e�f�����z��f��{x�� ЙJ�>���R= Ĺ�	�R�;�K����4�D�<.�I�b��x[0R��NZ_�1a���g��U<B�M�Z���֜�+�E�?��>_�D�;��N	�Uzlڸ)��^�R4�V
)D&~ܔ,�x`��ѝr#_�9�I?���9	O��p�8�T���`��;�4���t�
�n듏��o�c?y@��NsX�->!��t��j��wZ�ش>sn&��4���s��[��	��!=z9�z%8���N���$hr+'�>�4�q�`6�#��s�~���A���z ns5��A����5����&gX<?0��[*(�5��Ӧ[e����z!s6�J�E��q.�YI��7Z
�-y��@�$"�ӥ�w��5�}qV�����Z�s��ui��{oxO
�j'q���:<��*h������Dx��:T٧��e���<c��?�<�.�^O���jO���s��c`el�!�U�ԍ�����;��'�x�sr��D�xx~k%:�)-
�}]��L��df�?��q�F�6�����k6��hS9c&�����@h�_�Ú6��է5��y����n�f��i��7�8S3���AFGB��D���p�y�C�:cT��Oɣϝ$��%**;�A��8(��^� ��g��T��IJ�n�/�І2�.��^��ј���јqf\8���/�'�U��v@dR�H��Z�È��O�7����F�����ãA<]��l߼�[cv;����'w�=��� ����ǣ�F[����_���Y��c�r����k:��:����^<�F[?�e�"�I{Ҽ�{��I�|`&�HT��.'S����C7!yNr�E+����[�Jv�b4c���	����g���"c�}�l�&|4��j����z�&0�=���C�$OSX�w@��g��9g�U�G��G�W����o�u>�Wt;i��T]�^���_{����~��y�v�u�A�{�4Eo5�j�A)�U�}��J:*�2�?P��Ʌ%�b�2Vz�B��.cy��;'��Px��HO;�{� �v���k�+T��[��C��w����'h3��BI�à"p�00y�Q���̌�;at�~z�׀1#�IhxԒf#"Ӥ�:��?o;s�[ۓ	�?�z �|���|\AץA���evw�q|ݫb�5��)8�7����D��F��t2o��^�\�T��[�#�r��ɥ�$KF�腓�G˥6���tR���҆�n     �
�UK��j%}��ǿL�$H-O�S��*A����XeVN��{QK�<:嶚U*�&��s@��<YRK�R�Ƨ���
@�KA0�S��v�����P��ש�� 5vۋ/V_��k�����(F[�S@_��[u�V| �k�1�&�q�vL�XE't4԰]�x����k1..�y���e)���̢$�� �Ji~5��b���?������뚚���7f���]�Kp�Y��ό��&ù ����e[�h��5����ŜЇ*�y�΅����YgM��1���o��
�̇h�.��ߖјS�X^;<��z�ģ����0x��/O�[?֏��>��ϳ��ﺠk���@ٕ�E�*�9+���Xc�J�Q/�*L)Y�1:V���R�"� �J]�H�G�-6�N�1���U�w32�)õd?T�����;�����s���5nn�mD�����˓�f]���jm�����d�PO{�	����a�,��7A�1q+�l
#��Kʌ?��BY�Ç؂�)ë́Oc�͹���P�tm�B60���Z���jy��x��>�-�k�t�ɤ�M��j:k��C�ܗ�٬�d��E�+���`|�],A�%vte�Ò.������"%K�D�9��Yq�Bo[�D��A�f�d��!wÄ��U�{�����y��Bi��ʚ���s�=
3�4	&�iw�om9B������Zp���s$9����L��Ż��j�!� #�A����s\�yޮ�f���~����/_GH�4l��>�5�ܷ��}�$��M��f8��e�7X����B�Q�.��Ȓ7,��b1ԍhӽwxE��k/wz�늣�L��^n*F\���w��j���dk��t�ݭ��]��갶�f�AY�э�4ok���G9B(b�.����P<9PѨ,�]��٤�qY2]�eHA`P����h�u���ǂ���QJ����۲V"��� U���Qҹ��֧S�0���j��
�����KlI�Rf�c���$x����Af|��0@��
F����NY�_��D�����[�gjnmU��è��z���V�P��#e-�M�݁>�Y�ل��q�Z14�`�K)+�S
d4����g�J���!fK���+�DD���9@��2���O�C&l��嫜.bNag,��o�Ǧ���*t�D�N�%W��Ӏ���#�����ŝPB#�ZaP!b�YIЀ�d�d)�q@�)>��O1��(k#��f�����L�����f�@�b5ؕ޻��Z�oAs�/U>�>؄��WгB�B���Sp(�c���Р�C"4��8g�9.>����
�&*��ZwJ&@��N�j�F����` U���xUdzձ����$�����-j��y��z}�)��@{J|q��<u�r�]ӑ�9��+-2d�	Bb؄���A�]<���Ҟ��>�(���I�Ϻ!u�\���mc�V�w����O>:�E�UP�#��C�_��b����������K~��;3)�c ;�2���Qfn,X�֕�^RIBr�%��^��h_%���)Rb(�<ZV��9D0fs-im4�4���o{�E�?ؕd���>?����:K/�����?�h6ʱۭ-NXc�DAl%���T��F��U�1�d��X��ADFs�]���� �s��+&�M�f<��N�"6j����Վ��/�v����t��޹���p=L�K����b� �©[JIY
���D��"Ef���(���X��I:a؋�y�$�i�&�i
�+!x���*o�E��}}��Õ��Cõm횏��1�W#$�,1C�.A!\���z,"@�%t��{����親�{%+�5(�!�T��	�Fn��T�۵f����v����B�6�*�����*{�Lz�*�}׹O�{�N{��}�ÃH��C���VK�&U���h���oa��I��Ƥ�1&"�l�ܕ�wk�I�$G%���u=ODG��qllա�KO�E ��S��Ӽ����W����R� &K�Gώc�ᥱ�(�1^OK-ˤ��HR�9���g��Wt�����͸+�2z�1%������o_n��Ul���_��������ģ�sD�i�U��F1��A0��jF;Zb$����	e1�7l�� (�^L�c��Jo�в��7�~����p�Vy�}#�ćd��fF�����k@�����ib��@
Oә���F�O�6@��)/U�%�tb�j�U�G+k)_k��R!�`)0�2g��ADsۏ�M�L�&���R�n�Jz�|
aM�~����ýs�AQ� �i'88ER��B��C�J�o�c��Yt���vX�80��kڡwk�+.i�.a��(�����1f� s�|�$�W��(�^�̀<[G{��M�Q,�����U[��na)9�mag�G車iz��%È��&�u`���E��Io��xa<�K�U�����DBɹχ�J8�n>�_ݘ��P{|>�wK�UU�U�Z|Md��i������=�^2����2�\�*�s�HdA�X�U^&�mr��I�t@���3�lb�����d
��+9�)��Sr�F4���n|%9����+Y;�am8�h+}�e�:F/v��<�����Qdp3�x%'�Y�~ᅔʡ[CB(O��&��xo�Npp�G��U� �`#Ho�b��7�?�UC��\��G�N'$	�Yfn�%�7uT�G�HF��%#q!A�,%�x�$�玃�Ia��}��g��vnf��٭�I�A^g�u�t�|;P>��ڂߞ����ٗ�C���!�[;'0�x��n��s�ʌ��J�c�L��Ȩ��Ǩ��9����EeDP��l�x�3U��8��kmH��hḮ�'�6��qE�SOk+�'D�Zu-����� 6O�	1'�p- Z�?�+*F��-b�$�4/"fV<�}i��,���~li�tg�{���n�k��f7������n��Zb��ڰ	��Zg�I�I�L�k�\�=�9ͣ�ѓ8�О�GR樌�u�N�L�0�G�!��3�st�J!���>$�3Ɯ��Q�Ò��)=;K����H�� ������U3k�i��|Z�Y���t�~���<%�$d����䡼��1Pt�(I}� |¿��<e��ҋ��T��~�յ�09"�o�!�hi�m{#w���Z�c��򠏠ﾑF
��Z��ӽ�}֕��L���5������S*)<��2����Xr�R2�;)�g��*�.0A�0�*2��=1%�k�8Cܩe�d��Z4p�\�l���m�s�]ɶ�w�(�G]߫�D#H�mY�u�������?���"�4W��f;�����(�s���_�&S�gbF��sFb0zV���	Xp"�H��Y�1ʶ����ܰ�_��D���o,o���|����	-�r�����o��~��T��ǆr�Qj��3��`b\D5��20ŸM�)�/فQ�(�c�������		\�!��Jk���lZ'a����hM�)�v��rfY������o���F#�=��9�o֟wnMWY[ʉOs@�H/�D�e� 4Al��c���B�f@�L)J���CK��Bp�i��k�}j�J�����ݍ��`�ߎG�w[�s4��zR��l��}��h>;&ۛ�O{HW��߮���d��f�Gt����#�l�_PEi|�	<$���P&���QJ�L��r�K(>�l���L%٪�����ů�Q9��Ƃ��m}r�L�qpTիځ���n�F��'<h�?�7«��/��Z�;����Y���ʺAR�l��A%j��6>�T�J�b%F/�M�����\}G�kM��.y��dg����e�ڕͲ��+���(��(ُ��k�A���ֹ�u}��N�V��׼���\�ޙX��o��u��1+�4+,�q.�s:,�lTLV��� '��d�w�4�1{|��axbǘ�+[0V$�&�"��f���tԑ�ӱkd������KU�K��H7�����קY�j	:���V��)F
2Ð��1��A9��z�6��c=���?��    �"�W�[���8*'��I�uጠ/�/=W�*;���H��������.A�ȌGW�K+��u�������+�^n ��Aɏ���n?�>�r��U��+�0����Z����k;�'T��E�������f���G�0������B�s��́s1%~������E�)0j5�60��S�Q��b,���|��(�E"��:1W*�0<>��8f')/�;>����Q�]��F4�'�~Ҁ�Gu�ٞ�N��^�/N-M���j��11�蕧yb�83�e�S��U��ؕ.Ng|4X.&ɹ�x��(]C.����΁f"5�0���d��托��:1̘���r.W�P�i��zq�׮��n��[���5���>���אL�>>�O,9�\�\<�Z#Z�.��T�[�Fz�p/l����!�v	W��5�2j
�d�d�����|*@������?V�~<�b�6��������9�/<�w`�`=a_g�����۠o Mɤ>�{!9��v�[�t�X�{m�pþ,�q�1��0�7�-$���%l�Ww#�۵V��@��;߻Ww�8���D��۫�O[U������Ɓ���E++w�@��M�bz���}&Ϛ4r����1�d���(_�-�v.��-���yz�:��ؙg�"4\������`*��ь�)+�Z;ʻd�����C�N�[���ⅇ�W�g{j,A'�ٚ�kq܈�Ʒ������ �ХP�2qtј�لȭOdA�	)AHTAE�E������Q�� 4F��_����\��յ�]_�~�d���9gR�cqkO	�s�:�{�8��c��U��e��#w{N'��7�4���\���4��7>�F.��9[K�$���#�$�f*	V��8�Sb
���9ԸFk#鲑��n�*y�<�j��=��4�z%�/�����9X�Z�����|d
��9�/o4�y%G������O�GKo��_ }���Ǩ�c2"`��$�o�=��U{R��Z���l�>��{W��@�5+?���"��Ɪ:+�[ϭ��v�Gs���{����[��r��ׂ��VLCsj��L\<-x� y[TD�rt1���a`�5�y)$��"�B�C���ý �'��D�ܰ<��8��;�U�M+õqˈ t�|]N���n%���d�e`)��iR�L6]]��3CAG�5���E��Nm��6�c?%G�\�Qꁘ�r�[1��Q�l�n8�ѕ�!�dBf�EZ�m�2
e�s��8��q|~8'�e�k? �VV|Ӂ��&>�"�l}��q��Xp���r�7'��a��_���������w��GA��c7}ϝ����O���C_�f�.6�$1�w�x�fK��;G�*L��a�@��$Z���q�����D@�!��s<[ppP�[k�4��"�}x��N�ÏS�p8h=�ʸ�/q3xfWQhV,t,F��֓��ZI��+ �}x89�V�}t�׆����k$�����ڭuz�7�f�z_7�WPn�s��:Ss�M����9�|�IjqOmGg$|Z�jf�L�X�&�,U�@�%� U�ۜ$��Jbg@�˝���qQڡK?��d0v	��Z�$U�@��ﾭ�M`d*ّ֨�ȍ��X�����j}O�jk�����#R?��1���Ѥj!��$ق���]�( ���9e�5�F����m1V�Ōav�`v�8�{1&ەA:�����/�Q�&#��9G����$G珔]��>�>�?Ϯ	���N�*s_K�/$P@���h��!��3D�FU���TR��l&�_o�d�L�vmOz��]��o�T#��j>ۈ͛��P��,�}��>�&�>�:4D�.H7�-�,Z��S�Y����kM��bvƣW�0�~�(Z�u�������θD���pӬ���Y��};n��خ��QJ��S�v�� ��-;���q��[���?~~ȵ��������N*�_N��9�	g�����@e��W�-��R�r�j��F;`r4NBr�[]��NQ�`����>p5P��l}rL�n��{��}ɧ��o�0�'U���NPgUm�{��[/���f��lUq���ua�p#<àJ٤�`���TH��C	���rI"9D�H�E}�l�:�� �/ ^�{j�4�r��?�7��yv����g{����G������S�	t�Jt��"4D�>Zo<��,��;g<�'"L�����&t�F�[���{a���|������H#���&�ge6����emjz�wk|�e���s���k�T��y�>z�J+���e�f�ۅ��d�K|ĭ ��}� � �y���'1�Β�ì8F�9:�\2��v�+���1r`�kcc?��q���U������LF^�kL��~����u�x`zd�A�Ϙ6y<��W_����?M�	�I��D1��֒�4Fl����t�D��(����KB�O��9�?�CȠ&C�����c��|�Z��R�9�]��n듓���,�<���������3ܚ"�䧿8ͫ-�xg`���F�n��)Y2@���E�^J��C��tr��^xA���$���Ak��gER��������x6iOQ�[��v�7/�>��s�"����3��=[�CL3z4�[1�(0`�_RMv&�͢���
Vr"�KQ�������q<q!S1Ȑ��:e��!?��3ʈ^۵J�6�/���KeR;[���V������f�X�̾^����Y��}�s���ȶ��\}C%#^ ��R�F�K���G��D>	��&fU@S��$z�2��l�#gC���D���Z�ah--v�|���6�˂���x�4Z��?vR��'\��i��>'4��E#J�{��x���N[��EN��Š���jER�v,P�0�;�bq%�2S�y��n#�3tA��ΈY��-W�><Gֶ��Ǒ��0U�{·� ��ڽ$!	jV0�c:�A�BY-�)���%� !����&W<>y<��Ze�)1����J`�sX\)0�w�V0dëH����f��y�	��g�o.()���1
�F��d�ff,��	�[�h����-��%U�K�ke5��!z�����U� Waǹ���z�\Ž7���xмxU-��aR�A���V�G'' A���f��$FFyA-;�+�=^Ӡ�"���(�:�cb��EK�a
F$#p���M��N]j����O>n}r���*N]A�`VM���y�o���&?^.j
��ҏ�@�$���{�eKn�Jp�Q�Hix?4�ध1�ӬG�Vmm=UPaE&YR�ZA2���TE#,Z1)R��������q���{C��Ǎ�E<x6��k�5A�bə���\�	+1'�q<z���Ie���� ���^ڰ$���&��""6��*'c4�
��H�Ư�͹��l?!߻��OU�惥��ZD�wW�r�o6�\ԗi�����;�z�)	K	A�� W�Zd�@:C2'p��3�[�(��9k84���x��0�M�vk����Px�bd.�t��%p�j�ަ^�ތ�Y���<����_�J_�!��+�æc�b>O;'��d$�\,>��t���u���x|�w'�!C�ຕL9/���76�	��&���{��5�����jq�1���C]eFWA�߯v���.k)��]Jɴ��<��f������($8鐽� ��9Y�gދ�D�k�B@��20&�F�s������ä'S����&��O�7g)N����ە(����v+n"H�:}�ѱG�^8��l݇���@�{�A�5[;�8L�g���XH��wr.K��)�[C���Ύ���G:�xp8:9��(�d{[?�jk7���˷�
-煔��շ🺑��^G�O =M�b��ӿ��FIS�A� ݕ(�j��B8����������D	6B���ФR���h���Z���2��sM�|���pmݶ�NA�a(�Y�/���;f�pG&��&�{�I��(�f��U�T�+� 6���rH�]`�{��S6��2�]���=��    f��p�H��lmX����o�,�CjX�kw�ǣ�Jkվl^�i��b��g�:�8l�N0*V��k��\�I��`V��pw}G�x��ң<{��Y�"z��6x���޶�h����|�Cmu6`a�:�*��`���J�ԙ���O����<��O��2����͘F{l�i���'9+m,��R�����AF
Q� � ���ѡ1�9V��`�_�����D~~d��;KT�"z��+��"��}��
|��@F�FҟwEP{ ŋr{K��|W6��f�+=M���y�@p�x�cƢ���B��3X���p_D�J9�1:ȈY�FX	���Xb���ܐ�.n���-Wz��k���J �vB�]�詸��%�B=�ty�����p2TA'�%l
�`%�)�5�Fx��e��@��Fg�0����P�2~R*�]I���8>m}��e��$y���#���!����Ę_���7uj̐���|��v2�ʽw�-��ȥ��B+�fT2���	YC��q�1xϰ�XMN�+buJ�S� �����F�E|I�gTv�Q��F{��w{����V��۲�����ƉH��7@>�;����
�S�t�0Ҿ�$p�FuK�|F�%�H�Q8
><ߗ.9�}̚qG1\�ĬL��N�V��Ο����o
�s��v�'d �ZY�F�/�b�XQq��Ċ����'��S$;��;�BÆhL�'8Fd�Cd�Q�X�ː E�!4[�_�f���L5aid�r�v~1D����:c}*i���~�[��%�Zz��nuʯ�v�j�
�U��y�������)r3ܑF�������Ay����2H���YD�\���$�
)(E��%Z���u5�����ʳU�Fk���Q�|Z��^%!vi��B��|��}��,	/�L�)W<��"|p�;�Xpw�����ƽ��7�|�Jʥ������_<�8*����)*Qi~]�	����E�t��9=�����9?˧��36�g�:����$Z�A[��Df>]#j�ߴ��螄E}6
eb�	�F��C⌦d`B8��G�Gxb�$`��Da�%I��4�s�-��e���)~]I��I7�<g�6a��>��m�{C������*{�ձjS��򍏶��Ǳ���S;)^Q�ݶN̘�!���^Є��M%E�(����ȱ嫥2�x����G���Ao���66�X��˷DPŗ�\���,kS�����W�sE�C�h���tŘ�iH�2��Ge�dT�㒉����㐨^'�4�Xm(}`x�rhLN�l���@�ʕ�v�5�d�h�ī�����:W:��`���\�Գ2����'�����h�H�ef���h#�vI��!��r�`&� MrI.�I#�A�lR��$����!�ǲ/��Iy_�>ծ&k�Z���u\�ͧ���vϿ�P�����`�۵E�v=����j����N���:%J��}44�p�$���1jyT&���r�8�'\�I,Br�i�PȪ�Д�88��[�Lu}^;<lO�������ҭ�_'�,�#��v/�'e��Jy��~���\�de�n��J|^y*�M������7|Y�*?��Y4��Q�	��'@4�
H�(N2�!	��գ�61��I��)��\��"#��Y�ܸ<)��"��[�8��ژ�u��y��bR�ӈ��~��?Y�P��E�P�*�sj?e�m� 
�����<e[�7��Y#{f}ַ�K88�u��d�C�	��Qc ~A�
M�֑�<J���s�P�V׀_W�#�tSȪ�'Do�V�rc�z�;l��A���Q�Gw^����P-��*��"Pޯ9 f������Wb2hNq|~��Bȁ����Y��4�����l�&���օP3�Ӏl"z�0�r�1<�ϸg�<���ǿ#䶥C1F4�	�m�|�B����v~��o���S�*�O�i��T�zxf��/�����53:�%ǅ��MdHɓࣃ��:lN
�q�F	CL�3fT�F��z��BZ;l3����9�;���Q��m}v�H<g{�K4H�%���.��\|a?[g1���-/����U~�T}�o���ڙ{�N��3bL����w:��s�z�\g�!s��2��B3K��x�ą�!�w��qx�>�@��f���SG�:9�Ҕw�ykT����4���K��S�y�R��ҭ5�y�!��
J�$�&�:���\�U�D�e\���>+i��N�D���3q�Ҩ�0p�W�D�
��yh|��rԼ�'��dm�r�]N���5z�w\���M����ˏ[��[
��Pǜ��7���{�_����r.�O���g���@!��9�
܀�8�c��#�\S��)YB6�,F�Bb���v�'ѯ��c>	;擰>���'�Zk�P\Z0_oQ��+�φ'~[���ȱ�`/��*C42�=�kx( \,�� �2����S���D�&%e$�E�"���3i��į�!��]�����i�G��n�fm{��'�d,U���}�Vu�j��#��Tk�����ٳ
 �hT�P3�3ɹ�^yp��"
R;�݀/�%�ïq`�J�$1�{����㟳��	�g9�p�9��ʙxS'�%ￔ��?� ����@?VD�ݞ�)!B9�(`~&"'����W	[�AX���Im���9Jѿ��e����A� a��L��Or��Z�B=�t��m��[B@Gb��}�rH����-�p����l��_c%���˓�O�1$jV����#��Yp��5�oM�.��0���� 2H��^H�2U�JO�v�:�׋1�!��Řm�Fc��o��Z�%�j�.����~	�_o��=ʪ�@�븏��χH�����ܜ�hY+���6Jl��A14��Zl����&��L�0Y�/\V52���NAp
:�S�ko����4���Jzƭj����:�^\�m�V;�6�R��k��)�i�7<����9�{6>PzB��-��A����9ȱ�`*YNrb�E���T[Hȑ�QhI�Ä�X԰_�m]��^FĞ�JNcm~^+"�4����{��]�m�U����g�5�_��F�~A$/+k���u�5��Z5��[�Ng�!S����'��5�c �q��Iβ�q��Br�)*�ZxQ!�R*;ncJ�K�ԭ[�*z�_�=�VG��cɬ�_+��8�u��q���v	���=H���&��.U��WǠ�X���Ay���@Mx`L>��
l0�',�©��H����,��\�ɒ�(D���R��Q��H�Ą��2�S�Z�Av�3��$0?�U-�s���u��Y&�!�]N Q@e�v�����zr�Ka�}��U�^?��P����.�N�}�}?��΂��
m�s6^; ��!(a(�F���h�2./���9e��ϔRH�K��C�D��[fMs>X��a��>��d�s@8d�=����C����->���Ã;���Li����`��.�F�:��qp:�m�L�0Ğ�_9I��ec�
�9g9��:C8(��QE��3�x��������<#�������@�:�xj��k���τ+������)t����m���Bb+��j*�e��Ǳ��H�:��}���˖$<Y��p�*c�p�"G(<b	�����rl!KcVZɬS<)��3N�	�wc+��d��w�دJ��b�1�s�}������6�K;���W�2���[W�~~LUp�ӭp��ע�&
"z���I6�%TU�/.R�#���֍`}l�d���c�Jz J�D�n�a�wӰ�#����d_�o+D�?�A�G�0܈����v~ج267(�*F��%�y Q;�搹�p�eL
n,�[�P�ʀo��Hؒ�5���� �Я�sK={o�u��t x���x����,�^M�J��uC����˒�Ͱ���0tN�@��Ee*�� ������%�����N~1�7�eDf�w>H��r^�$F���y��`�h�6�6��i#z���!Ƭ,������:��f�n]Ē�[m�f����5������Q��L'�    �6Qa��S�h��1C,	���f���C-���\���'�h���[�O;���p�V)�b�����>A:������'���8_.MM��JG���$�778�6M����-�$z��� �����ל,��#e2�+��! 4�b)\p�k�rۺ�����rHb�H���^yc��b"�a�5(S=	��o�ݲÍ�C��kh`�+�t̉KC(j�B%´P6�Pz.ij������bjy��}��k�/P={o���{����.��
#Fn�����;��_��+һ�Y~����Qi{N�G��o����/��� L��!�Ѯlb7�A��9��=��r�%��!�Ѳ׋༕$^Y�$f�9T��JCr\nN�����A��pNc�|�F��(���A�s4��]V�T*H�����,��v0�����r�S[Jeg#GWl�-CF�/�����0;���
^���/8Ff��L���ԒH9��C[�KE��4��Z�>7O[�]*�=�����Ƞ|���:���-���&}��$)�+���(�\3'dC�UʌQ<�14D��2�Fb�B�CQ��ml�T'�̅���S���)�V��hY�h=�4'_J*�\�
6�\i�?��O�]-|�_O��>�Sm�v͒p/J�8����4�ad����RJ��(c��2T�&�j!���"�Ȓ{xUX�T����%GŊn��֣�xd��-f��2u��=��E�V?���&��N�+��w��!�!R�<(9y�M�pMdA�!h��@E�4SgX�j�Z�adIKHϾNO4��Z�p�����Y�6�D�T;��������o]��)�ʆO׃�m�z�O����;�0Vgm�+6���H Z6��B��)�K�3�ܔsVK��f�g���~��#E�G
"*}����01�ڝ��&y�x�W&y��3��z{1��h-i���)����{�6���W�mb���/��X}.䮑��)�I�=�[M%��)Hԃ0�'�.Xd�(��}����89F+�`b��,P��w�/v*L�F�:Δ�˷u�ؽ��M?��!v��	�ݱ ���ZQK<���,�~7Q���c����!��b�@�;;�!��!J���`�$PZ��Ց�LͱS�e�0�Q��ïp�逩3#����u=�0�ؔ��}Zk��3�m}�#�8����xj��_�#�X�ϋ/~Us�P�������&2����+����(�(�Y1)�����N��y���@&I`1�E���S(�Ɩ�/��ov��_�$t���u8��V���i�����K~��|�`�blp�^��#��Ŭ�G�4��h��ר�� Tw<�lpP���H:26cGc���
;��J�0�����=���J�$��U�q�|�f��>���f�<��?�������@C��C�2'J� ٲ��*�hT�Ϋ�KΜ����� ��D*�"/q��.��=��iF�_;�m��)���;g�|zOh����~XA�+�Z�g�w^�3����]��=��MxW�Z��>
Gq8�r὇�Mp��*?!1���A[)�N�'����8s\r�;�2�]��yWF=�n�&��	ȡ��S�o6Ѭ��o|^.��M֐ފ_���H��޼� )�Q��c�X���N��W��
�	,H��|�0.2�\
�dA��H�&1/�3�!x�E8��A:�>�f�k�5�f�A7��˷`�H�f�?�������%��X��ױ�O��UO@����ciů���Q�^� Ϧ�πH)f�nWN�7V�� f�1�Ȩ">g���� ,B>$��x6*!�Á>
A�Y�,9�Ư����O�F��j8��-�aw'�+�'��P�oG⛪����;3</��6Y	���8��[)%��3��.����]N�s,���L�B���>9X#�@�!HIja�z�|�S�%�5ʎ;p"c�	O!@�?8��C���Z3M�J������JŅ��#6?�ϪOx���C���300�FY��}��e�}����!�d�4IK|T�8e"2nq��&Jkʣ��@��K!H��G�T_c�G�R+Wҥ�����My��Z�>�kd����=���i�m�ೕ�U���}��O:�d�^��Rhk��xH}�ˠ�7��SV�BH(���e��?ڬ�Pqx9�y�qw�6r�ǭ��ۊ{���.ͧ�����<�0����SRhY����Y�)v"<͖� _\`�9�A��ɖ<9�%�����:��QMF+e��Ā}#�Fm��d�ؗj���w������Uo-�N�:�]�`_��kitK5�R-ح�؅���	=6��x&���f�MɂI�,�H���_Bp�.pc��Ő��64k��h���#�E�*k�Qh�'����SMY�g�mLh|UZ�0˫��q/�Wx�����?|�G��3M)=S���)�"�z1H0�7�!�G܊5a!A&I���M<��6K#ӂ�5�Z��pf��5�B��Z���A�M�˷p��߆5껷�}^w�V��
�A<ް#Ne���f�'���,	�_y	�fc2q�i��8������ ~6��!�$ �
�GKn�y�qmJ�:KOWR�WO��r�vf�x��p��ŽѲ�L����yz������`2Uo����Ƨ�ڻמ�n�2�P�3�<4x��kRˤ������%N"��g\���Bk?�g���*�@��֐ܣ ����Z��NyT�t��h�=ڡ�®CSk>Tx)�|ѓNL���:7'D2*�u��B,	���%'Z�%%�!����+I ��Y�p)��d4�	�j�.z�������z����{�C
�:�������E�����e�%x�Y�:��Ñ�d��d���XWs�i�2@q-���jb9Ii3�9�F��-�JM�0�z*N�kmuT��g�J�}O�[��^���z>��/&I�SOc�	�/2�Mߦ�K����L:qj�+�aV��\�"�0�*�l�<�Y!K�9��lhA����,�Ϋ�E�ˍ��m+�5փ�QXП�.N���7�ސٮ�	�o�� #[|�$FB@f�YQ�9٦
XG���j��ǲc�sL���o���������n)gm�^��V�Ǜ�f�rhJԧQ�wjM�5dT��+�d��d�W��X�89��D�JIe��3� �TB��<������9Y��b�u���^��-�yY��k��u��|�b ^�.Q-	R�8���f|Lĸbfך�Q#O�N�����3 ϶"H ���#&
�$#�P��!3�19�����-U��{=W����0�U=~h��;��Aƽ�^�^%V���tG�ZE�;����V�v�)m֧�Pw��͊kC!��13��ΐYd�P��Q�$�`I�������`wl����d�ِ�J@�Z�ʐ$�e���[�H���e�����j����@i���:�
28�G��U���S�6	��y�	ۗ������T#�^&bԼ��u�E����A���y�!���ey)
�Vjp,���	c��휀�֪��(�yp�/�"�!	�wTkl}Y��vբ�����;�������K�Ws�7��3�|3�� �s��Q�$�,sp�YdI��0����	����#���&�2��8a@����js.���I'i�6��t['�7I�`_���r�~�f���҅�7�Æ�Q�L�/ \^�:{��{\:^�)�fn[A����J�e�I�@�EHєS���R�T��a֡�kKxtC�b��o�L��O�7#I���g���=�dE�&�Q��j�|T�r�i�ͪ��
�����K����]��1����̈ѯ�"h��"y�7���NBP&\d9�+ʴ�K�����vy:��p ��ZrEOJA�1����d�4�q��ARU����������Zrjl����߁�%>�Ƚ26������f��edw(%,J[��c�N.����̄���d2�����0]tɑ퓷k�]z{���    ���4��n}vIo���i�X����6ܡ+�~S��<���{'���0\C�|�]�Z�2�s��s(@mx�|�B.��nr��I
������n!ƺ#�bF�$f$�1�8����w�iT��h�׷��K	�6��jZU�t��zL*�NN�̣Mg��W�@�Ae��&[g�p���<�)/�����"D��J��+����@��R���(S�b�����C����T�溿m���c�E�<��uЊ#���//8��O5yֳ9(�V�
�%�������t���&�x
��12k��u(���ڔ���P��ҊS8CV����SSڇb�<�H��hY��jP����C�S�.Q�j�j��?�)�:F�H���~���J)����yv0�Y�����_OApJ�#W�S"�j�0"�^A��U�J�k �X���Z�U�T)O��Y��1��)��bt�p�tũ��k#e��\�}_��#��>�}���~��v��?�e���L���/�!ef�噛��u�2�C��Zɐ�I��U���G
Y]���s�!��O�(�X�������S*M�F&gk�\}(�fG#�W�覨�U;|�:����F����ܪ��7>ktckI������g���������Rɩ�ћ�����%�2��aB:�!����K3�6��tV�/A*-��tP:3��\eb$et�K��N����0&��^���x�f� �}���H$K|Wǭv�]mZ�~l*+���F���
.��Fύm��	*p�3�P� ��/���C5C�7�X�p �wf�ňbK蹒���9��@y��˷�a�u���p���tu�M�X�.y�ѹ����=�pd�I�Քl���Z���,$B���Ɯ�kG�B'AK9>8k��6�@�%�)�2zPjr���V+%�δU�x�t�t?O['�7 ���3ȃ�4��0V�1ۡ@�Tbߕ���:���ƽ\���Y�:�����ۏ����O;���}���ᯗ��T�X*��Fw\�ʮL8pf15����H�+����F��\�ՒS��{��`iPd1�-wγL�xD��u�Tj=�j{Hʠgz�2�C��v��;�~/y��[��vŦ�z��P~��z�����-����Ӿ�j���{�!�ʒg::VG�q4:�`CP1	�9�m���B���X�SRC�2}$�E���qn��m��&����&�/��<L�J�S���#U*��3�G�o�����P2/�f ����{�yz&[4.��l8M�y"�@D �G�j�mB��q��7��=�b倝�uo�{���M�m��n����|h7�֜fS5�pOJM���{32�Y1������H�*��$؄,�]l�4e�J g�bT�<�4�G����T�n��L1ү�!�!ňS���DG�����S/[�(伿i�>R'v\-몧�ݨ	~=��9~g(�+�6��d���%,+��!�	�E����e���PͳK^`H)B
|p�fdk������aK[��r^�!�@��e�����,ҏց��"c�I�'3�Q^��e6h��t��2CX�����`Rť��!嶇��2ל�T�Ѩ�pD$	�d�D,S��������r�l�m��f;�rDk����Nh��ֲ�N��ã�E�R����\b:�����b�9Y�'�}��W��֖߁��*����ckb#V��O���*$���@��FQ���5�M�����(��{��W��\�Ӓ��f�9j��tB9j3��v�g��[�us	Z� ��e�6J�ŸJ"�e���&J4��}Q��ovX���M�Zx2�|�Ft�^'�Tp�"�ĸKF�n2���fH���)x��r��Qx�|���l�;	X�F�>\;��u�|K�)�cV��mk��{��!T��*X�NԈ���_�dT?�}o־�J)��1Bq:�($jR�},��2�(Y��D-�ԑ1O�P(P��,�B9XV,�-���=B�^M&}3�#=�o=�#=n}��e�=@��ĥ�O�?D@�*�P�T�������أ�WE*O4f����2�Sw�,��3Hx?��=q��#��r&3O���f�9���6ڈӲ�A��T��O���TMR�~�Q��b|=N�� U{6�ٛ��K���8|^��.8��� O��*��X�J�7!�PdQV`0��c��9f 懻��{N�X �ԥ쳴��l��Zg"���H)I�����tZ]݅�H��{Ω�o�գD~���!�j��O5�l#���m����1�8����f�Pph�e��V{RHق��sd�`���^�,����)�ֹ�4�+�9�H�I�6#sg��_[4��P�%�W�G��5V��\�i��.���C� �Qx3��������S�z����awB�jT`l���.z�ð��|2~��[.85��i��X2���I�/��$����#˙B�\R&a�U��"#)�FV%�T/;!��죄gD[���O����	Xw�3|�Vr�t��ٮ|ץ{Wu���Wք���H˘���7MS��<M�?U��r��c'�$p�)2q���)�vY�����"I^�Z��/��A�'MN֜o;����@)�F��H)iT�%���g�Pٚ���}Q]���0l������|$vd�)&"'1��sK�xH����1#%࿹GQ���"�Y�q��LT���L�
�ȉY�Az�w�6ᜏ�w�����O�:4���܉Q~�Wq��hz	�'��~��*�>g2m�(�����lAQ�(u[dG�t�����7VL���8�p�d�p��{��P��t����~�頍z]����^����T�*��_�����T߿�$��T�K��>�I�b�y'�X1�DOp�W�����bE�K�����7�aA���o���ZD���Nڨ��=�q�03�n��#�	?s:��Q侮6`�=� �gw�)<5gR���G�t�]����S]��)}dY�!�,ͺ��ő���*
Y0�>����
��A��l 2JcT{H�$R��SM}��!���I�9 *��Pc�J�}Zcu������޻�>�U�G��#l�����(
�,5�Z��ǰ���-<�u׊:��ᝰ��nm+�N��d*�7��Qr�"gg@	���jx�i�͒7YS�֚g��^@,�wD� "0�g�;�9""\p>� �{��"���ho�O���2�;D8��H��p���O��l��߭��bB��4�21\u�F�g�~�/��)�����
8�iAZȤD>Bt�Br���g_Д�^d��ya�A�f�<*1|�>>�f�`��j�v�`7���������S�r��o=�/v�W����P5�Ui�<��wk�m�^9|�/?��<Zwm��fQ�_�9#�)i� ��˯��B�S. o5Y���7\H�(��:���)�ep�C h�5,BP8:�y���ƥ_;+,���)/h��JeG��J&�Yy�YV��n�6ޓ�>1��դ�:�6��d���͛�w��d���f���p��R �CD+<
�YB��c��@��k{���۞po�S�o��[꬐!�i��_�2�_^"��������`�f`����h
�3�:ns;G��!cg4)8��,��M
�ڌ�=$Î	x�Ep�;F�3�fn�1;��Gv6Z��7�4wxZ#%
�"v[W;w˷ٙ1{�s�C3j9&��� �5<z����]}����Ӫ�cκ'skS� J)H��WQkT�
����2����~���T�	��V��=��L���@g����2=���v�3JT���;��������oˑ��o����W�S,�Wq�GJt�A2�pppJ$�������hȜ-���AW����%�!ʏ�/�1�B0�M�"A������8�6:'a���F[��h��o�I��������n�������=�f�b<V�i�U}�a�x���7n+?�}6W
Gd0�ujA�EM38�4D�B����ӗ�B6L5��l.�<6�� ���0Z���b8�/��    �Ds �W�ӏ�i��r��j�"�}4��k�A���ւ���b��^�����|uP��j��ϟ��t��pI�>��$�2��,�bt�'90�(���I	�}bƅ�s�XT1�T�*z9/����8�mOk�Ap�����. .��&�$�f��{v������r�*9v��}��n\b;����F,��=yF�&���D;iH^�w����F0'�#�0��r�lF����s}�MN�F=w1��o��AVb �C%?NP�'�.��:<����l�ؕ_�x:v ��θ!h�8�׵�����E���%�bj4��~������?*��,h��!��>��b}���qS�4�e����l"��*0�,�
�ʁ}/�I�q�6Rpdca���-�Y�=��W������y�`�@$�%��&=pݳ~�s&^;�p�S�lDaNA���6@�s@.$�q����/��\F���Q��(� ��ͥ�(VW䀮�4|m�O�N������˝�k��z��ée�5r�D�c���]9*��mUM�'�@�Fr
~
�[N�T읃�1��d��7�a< b�xtbU�t���Okd�w��l����GQ��¯�e	��i���k7U	���9��7E�HIgW,�	~%W�f�=WK�pO��C��QG�Fq�
c�X�!q��[R�Β�s:�ۜ���;KީA ��UO	����� ��Ͷ�f���\��,5�����N�Zc+劉���{�K�\d�HV����*���^����j%YO~NNp��ژ���rO�"��<�l"�Ug�/�a����re\O��Kzk�煕�t�j���Jȭ3�w��6�J	f���p')��%iŔ'+u�L��s���B�܆��zkvc��Ҷ6�&8�WO�7��1T	irL���迫�	���3���a]�k�A�2+u�-}p g���M3�LI?䉸���:'�Q/d?Q!�v2"e�F�%Z��{�N�|�6.eC��ۨ96��Iz`P��a�B���/5�����U�zM�hQ�R̞ӹ�)Cf�U,���Hf��.+e�3�]L���K&d>؂#��JX���ֆ�?<Q]lIy�{WnX��M3���l���+�{W`�)-{���ls ��J�z�Wn�����t��&0V`�ýt20ِ�읈�)sjhL�	�
���px�&�X��~��d��Z�����$��-��(_��Nm����{���H_mW��¯󼆹��Sd�t��N�an4a�{jp��Tm��I�yO�+a�e2�YX�ȑS*���z�<ң2x�V���m?���*�3q	�>Y��*���3��ߋ}����c���/0��H��h�ɀ�������"E��	�_�q�#9NcN���� �4�db4��g���)�[����K}����������[�Y8��7͙���v�iPmb~��KWD��^������5�����?�l=+l�A��N*��bU�vB���8����b�(D]����8�CRm��΄0�ᘥ�2C��'�
�G�'����x��_'~�_pB�۲��l�J��w!d3t����Z����9L�A��f,�z��֑D9��L�hM�(X��D�y�l���eɛ�ۉ!�"M���F�����5������ 9���MW��u��;_�j?������^��?Se��7����0�ҵ�:cs�(X�쓃( ��vtQ�Fu�WCx�m��A�9�<�yls��S�k-����o9M	�2. d���E���'��ZE[�^�0hN����#��Ox"�x6e	�6��c�^E��5¹��~kH0�.]X gX�ӄs,ҠN
1�2�(�OV���E��\��j�&�ک�u�����cw�h�]Ne��]NRbPb�!���R��K�˹x�"Z� MU�~j�ѣi��q���ez�WW�ۄ1��/m�̦,N�^4��� t��Wt���{��c1iM��*�m��B�A�'�{)�Ŧ>�L�".H>��	b�z����_`�!������ow��>��X��߬?��?K��h�^�d��_@11��3f�k.�q���Hfc�lA�-��$��bc2G��#s��P:{��4�d5@�c�A�����	$yEmT�n�*-D����5m���"J�sx�&��m�Q�P�b�����xH(s�����n*�!:p�6,&E�8mf��[�0�P�y�Y̹a�C������H��3���_~��|Y��Z�mC��ZC�(l�������FF�B��MA�}^���vD��F1u�p�带455�&x�=D-P�xd^$�M���$dZ�(8D�
�4��G(Id1'�C�`j�5D3Ok�o_�L=�!��k��tX���+�)?^�"/|1���|��_y㟺[N�q?s�u՘�%�T�4g������uX��0ᢁ�.���B���D��D:dt�ke��#ѯ�WП�7ܺ�[6@�]���[nש���uݔ�+��7[E_Wb��ͥ�����ٺ9l8�r��/Wz䫯 $ +���6'p��3��$!8sk��dE%������{O�����Yp�}�lsj��qk}!p�6(v['˭�cv-��v����(����e������#S�H	���Cs���#=��@<���^��&���G�<Ȕi���?&�l��<B����Ids��8i���~�/6k&{�= ����t���T�z ��.q�u�U���u��]���'�����ݻ������M���Σ�T���d%<��Z�� ��� �^eL� �\�kDJF�?�Tg���� �,'�0��o�)
�ת��9c?m�\�q�h�-�n�ƻ�f�M��b�ϷXܜ�"�D�tZ��؈�
�z�bE��S��dY �@T�X*E͘@�:�h�P�+@n�ks���YG�k$�.�٬(+MОF�,wٯUb����i�fE>��|p���ֆ������ެs&;q�wH��H��q��j&�Q�o3>	|�Qrp�amH2B6�k��9_ ���G�(3�j����3�CbI�bC;	lw�8��b0P|Z��	�v�y����7���	 W��J��m��6^�����CԡP��Y���Π^Q��1x^;�qТs�	���QZ�v,[��BsP������1�O���:H�G��c�Mz6�Z#�;�a�F�z6W	��[� ](?�n�6ɤK:fH?���u��h�"'qE�C5{�秃� I�><N�h���pG-��J��u�֎�8�q%��l:��W��e6��oj�v:����������j������~�r��ףr���H�?-&|��0���h�_��ޝ�+�u�c�ɵ㋸��+߿��r.s4��"� C���lx	^���[�՘�'(q
	�"����Etn��%$L5��8�3��x#�94|��u�H��H\�����yt˷�[8A�%�%=h��Z�ee\�d)�?�����O/2��� <�zP2�BGi�" I�Z��E�Z
1���1x�R�	Q��Hkc�������w冿�(�*�T��_]4  K��hrd�).���OT\3����hhb68�9$A'�$<qKf�-����db��1Q��zi�_ΗN	������
v���>ە���+����5؅�L�A���e��q=���N{������2U!+MB��������oi�h�$w�Q�-T�9�ʜY+XRy!�����`�x_	<���{�6*��N��Vf:cD_	��V�àl_�{ݸg�;�����O8�AVl֘��B,E$}��n�0�#KN4D�cv��̐����tT��vg����*����xFN�ʃq����C�����U��1廒|{��̰��W���J��ᘳf:�.�!>�����ʆ\�Fc腕6q�ʑ;�����u�5�S��Nd��zKƎ@��u����_+m��i����w�(Ӄd� /V���u�u)�ܚ�ݚ���=
F��	�R�Jl�JI�y����l�嬸�E    Gc��`��8�����Ȓ&k�pL�bF8I��J�Aa31ː�D���*.P<�4d�������	�c�dg��g;.�;�
$a�Mt��	���{jpQ�k�>� ���2X\7���΂�g�'�L^h�Y�H=i� �F#�Q�M"S�L�I�p��)��Ư͌�Ka�T�&k�
��� �}=�/HWBBW��������A?i�aQR.,�O�˟+)C
6��d�FS�)��g�{��Ik��N��C0�0�&>&G ���!�7�)�s
T.����͚�v�<7�&k�3n��ӫ��`-R�ˋ�k��H~��۾�F�����N��?*ƿ��~0m_�y�v
י�
� �!j��%�����re	��,b6,3�H�Dp�2[35ap*,�L���'Wݯ5�ޑ�VcW��u�B#y��l��{���q�(?��Q�I)ɋ�)�n�ŋ5���L(LG_;1�%�QU�c���I	�I�V�<�(%�A)'���>q�p�HQ��ChI���7��!<�Ѳ6J�̀����B���-�J��7�"~9�Q���S��g���ܐ>z�dB����U��yx0�VH}"��2�e'��奞1�����qCT���s��?4:����"H�1JQ�������������m�*ކ���ŜG���s��,Ğ[V8�I�`���/�8U>F�2�UV�����r+QU>cg�Rx/��dT���Z���i��u�\-kw�ő��e�	��5���3����J�E��Z;z��󚡡�E�sN������*�����H�d�2%�F��A�~�g����If�0�$��Ki�:E�(��IE�7ޔ<
9H
Q�[Z�{6v��8'~d��=�v�6@�v['�7�n XS�y�
s�Po����i]�M��=j���Q{��f��ʺ~;Ւ�2��QG�Ž!Jp�#\�I�s�^x�hp`h����a`�����l ��` eP�s���� �Fj�"�w��2�䨐����:*G-��f�sm��FA������ �-��ݪSc�" tG5��~�� ��=�\̚9�s������<��ሦ�9� 1�)���'�Q����ND��K�����d��\�>��^�ݹ ��[�%@y)�Ҿ/V�m���!ޮ�S�AD����Fd]<✜S70F'�K������K!��4	A{"x��U9�?j!���H��e»���c�{�(S�@Ȳ�W�:��9���Z]���q'��(9�u��m��*���Q�f_���/���c��#{α9VLۯs{�ĭ��A�#���@8<�Cj�P���EZ�@�f3��L-79
Ei{h��ٓ�.'?���ZͲG7���쒓�yc9xr��v{�ZS嵪������ެ��7�O� �ؤsN4ù��R�&�e� s���y�m�Q�H�"���&k����h"\�h��.!lid�N�Q��Ok�H#2�n�Τw�W�o�J�_��ߕ��Mf��Pke/C�L���G7����p�Ҵ8>�hL�;1���*$Nm%�L� �P �6� ����s��#X���Ȣ�v#��S������>�]�(��'���u�bv���vC;����7|
����YJ=�����9ቍDG� S:j%K��^ ��<XJ}t**����x'��R�EO�Akc�6nw��^eX�8�l?�Zh����m����ы��>��⌖eӈ�U��Ɣْ�d���d!�AVnΣ��7q��,��	����i��B9.#�ɘ�1��+'ɍ��@r��:Y��ہ:+k��2��|%����,صj����X=���T����0�@gȷ|�y@+���F�Bx�2�6�r��>d�q>�D���S��ɘ������WB'k�Jh�u�|�y������j��4��R����*q�b���[�џ��w]��q�O��{j�7��O�6�,�{�n�8�+δ��2�n��J�QW9�ų �D��:���4��%�$��Y`J��e�����`��z�����g�s|}��%aK6G���DK��OUq���ﶫ�
efr �=��blY�1�b��>�%�)y�BJ
r_�!O��JM������d��0��P�$%�ů͘B/v~�_��ڈo�u�\/���ѣj�\xD~�ť- {���_��,���Z����?�&3odK2!��vϞ��q+d�7�m���9�L���̂�p�x�ꜗRe���Q����(���Ha�sp��&k��m��y';a���_���X�z��4/�w������窪JN������h	ޘ�H0*���9/�D��s�5�h�����wb��0(%� ��(�J���S���w5�>�A�>n�z���C��F_�a���Q��uv|d]3��B�A"X�WD��,R����to`��)�$���z������U8$�����Fk#9=5~	��7J(2z�w�L{v�ϑ˭������7�v��3	�tvo��.�@�	�7��;e���l�8x�=BtnS��bc#��4� >�

䛿L%6F�c��O�N��i�d�逽e?*��~���^<��_h�6�K'gaBNg!Tƶ9�v��ݰ���I�#K��*�*���ࡏ�+8���,�#�\����V���P���g�]v��1W�tlgks�O۪ୋQ�����jC5�t&?�QO�"5�Ŧ���,��q��&���@F)�rHM�QQ���B��Q$&o����I�p�%��}�$��p��V��C�,!:�o�$س�}��Xq��^I�K�]���5��Hԑ%�4#JN)g�D�H���(	V6�(�!hb�A��mPD1cc�A�0�*p�.L�LK��fIF�N#9�1���;<��N[�]:�g�уhQNz���N]��ߔr7�?�����JN�[��RH�z�Bư��/c<*	&��WSK]���(��$ze��E�Ű0�%�.���.�"��6���ų�}1\�����_
��?T�YK
��[q�[��R��s+z�H<:��L�`X�88����'����]U"�Ȁ캐C�<���wO5@��k�.�:�:����{��*�_�Kj�DX��u����_���<rb`�I��$�3�:a�S|�1)/��eDF�2��X�����:���+�2��B$1e&i��6�(4o��MX�ƛ�v�S����Q"1.F�_H�{����!��5+��6�y��~�^���J���{���t��L��NS(�F�P��������"X7Y#� �dEq��)��0�g��~����kfǚ~�6���\?tr����zmJ���*>��%7�Gs YCf��+�Dx!���U��QOL$;�5d�9y�x��f�mC��q�2�>����Q�fr�[݌9`Fh��Ѷ�D��̎��o6�[}J?X1����go��I��k�Rf�$�bO�P�9��24I�v�!������m��XC}�BR����=�q���"�l�6*%�!��[���L������3��e��l,(��_�,��4�9F���M�gQ��� V���(%�8T�t��H����B�
�e�rl�cÿ���j���ќ��GS����-5����o�	��З+�i�����v��5Wz�+:�!���(�_3l�V���k�ĢYf&,՜��s:m��,3��T���S
N��6�C�{��u��kߝ�.��������(6 ���"'Z�^�@��	��fw��z7O�\`*�{͞�8���u �V$-`Z���)���DFJ�	\�K+q�A�i	��'����0����m0+�[]���=�ve|��*48ݡ���n�C��ژC���O��������0¬�k��d����	2I�ERa���H�.9K��<#+����U�'�s1�S@O�b��3cصS�v�s
JTL����{8//t�8��;im��y
(�<��|&pŔ�d�#�?%g�qV����A"�����g�w� ;�@�*Zd���S�pu���#���7��g�6�Ha�A��1�m@�[�Dg�57�g� J  }B(�Ģ������1e%\V1Y�
.N�Lg�ᵆ���pr����V�k���8�z u��jgu�c��@ݯ�HZ3)Z�4&�����Y@_��c�F��ݽ��p(���GC�����-E��7@�D���@�Y$�蒂[�P q���9Y�-�z�Nã��ٷw�h{�|�v�����[b�2�}�'pV��)��:v��(��q���~[_l�g���lޓpAg=�+�d���$8bvR�`D��a}��z�(��1��ɑ�I��q���@�D�>
`g_qZ�g�+��[�N���jDb�ٮ��z�|Y��������l8���iՎn�0�:0�TLX2Oׯ��X0�"���J�w���?_���O�{��5� [H��x�U\X��`tgyM�}���F�];���޻��\���z�V"5+=�5�Vb~U��/da�P�{�L��9Ѩ�f&&z�0p���U�5�5���HD)��d�{����`d��3�UYG�=N�V}NNk-�4G�@�|KU���j�Ԕ��U����S�)~����E'��IȑfA[���ab��R��Ŵ�iq���s!���F�������i+|�D��d�8�����J|
璫�Xʔ:u��s��s1��%1�y��\�IB��Y}�BU��i�d�P�u���T�>���>-�T�����>����1
�r6Z2I��J)H/9��Dk�a�r0�M�S�MD�A)!��r���`١/j��)k���l�_��/�DaH}v�u�����@�^V��yh�$`<��v�:��㘃���OQ]{Vc��^�̲B��B�eNk���%%	ɑ��D:���<f��؛�2��eʣ��t P;^������2��G�S��Y�!�F�#8b$
)7�?1�GQs!��y�̛F}U눴S��t>�OǭUĥ��f��Ě� �b�֞刲_�p$�Q'	d	2��ឈ�R�Eq��P�@�p��&�1��#~Q����:~Jȩpد�$��7?o}vIȝ�C����>m��!;A��V���BD,�Y�'������Ό�4�5��N �I��z�:�:C�$�C�@��PF���b�	�	�GB����K.�!g�
NkM_t�3�m�}�Ƃf$���� �K!��p%���Sؒ5�ߜw*[�B4t��Od�Tч��C�&Nk���f�=���%�{A	��g_�9��,��47X.J�6]h����������s]��{í�v]��-j�=Z� ?#fG��u��9��k��[=0��q
+�[��4)�|�T:��.1/x�K�($ř��zo��9�ڎ�lU8Qx���jU�l?�!�{:Y�󺭓��:�k0I��i���7��'�����M���^�]Xl���M��:}���fl�P�v���R!��<����],x��Q��>A�md��p%��^k���ap4�1U��?��n�;/�2����4Ɣ����S�V_b54~�<VM�I�?��pB�~�!�PL�Y�t�T�D�Lj��D��Ƨ$��Pɼ��z&�q�:�|�����u��)�l'AO���F��x��#�J�/���]Kn7]�Β�.�̆�{` A���;�m$���^�Hv�t��,+��iA#���X�ޓ��R��曅|��2��P���f]�������R��*��Cۧ�"a�Y�Ƕ*�l�>Q�)��B	3��w
�s�椔��D�{2fg�Y'��N3����ޑaW8� q ��)����[tG;���Z��q����h�U���J_�^��_��ow!#ċ���O�� ̾Z3�B�M�y���$!2�)·ؽs(x�򬔵�z y" F� x�YH1QG���ߩ�[�F���z�����E���ź!Qg�5��9�Q��꨿w�P��н�*����N%ܷ�>����O���/��,|K&�T`�f��$&�FE����������&j �$PSпɖ��(fCV9yPu�W�k3��E�׺K�[��;��Z�[��!�Gs���Z�͉ZG�ѐwq����1�]Z�����ˍz3�������-��r�4�����0W�7��1�����N(���Qe|f�R��*�p >{�d��&N�s^%9���A�Q^���uҗ�Ҧ|�ғ���>:Y�e@�a��y(���bE��KY��e@�n"�נ�pm�{�z�U1?ɿԜ�����{)��|��f�sڊLٔ�D|�5��Az�ach�Fy@lI@�����Q��� y��)� XI������%M7��_k�.c��Q�n�6�R�_��%[�}�r��hP�s= �n��j��M�-'�L�2�ȤQ�ϸ@�8S mG�LX�&k�)8�Q"B2eYB��	��r*�%ga���դ�	�]���ޤ۵�V9Rx�=�B��r5��#�r��z&�{l����:O�nє��qaTD�W�>���6��v�qŘp8'�jf�g��NcǕWNH��?i
�WbH���&ax��7��iۏ,=9�҆�nqiO?gą,~��g��\�Hk���ᢄzZ��O�Q�4ӪR��.^�㔉�P��zfX{���R�){�<J�g��%��NT��P�~�
��Âgc�� �{�"u���v����h;��^
�6�o�\y	���>,����a��vw�4Z���/;���~90�t�_�5�C�؅��F�����)���mE���'px�s �yϨ���I�Ȟ��z�+�B��ޯU��`�q�}n�,��L�p!�tP�]G(4/��U5�o����L)g�Wl��X	�c�Ȁ�Y���6
�x8D-��~L�x�4��oh��6�2���މ;�ת���{�2�?S��K��
��7ޟ$��Q���y�c�o�s7G�<��*���J19�D��;�#Dt�3d9z��dy��r�S�H�|�7 �Q�zZ���p�&�*3���i�Ⱦ!i��uGt��Y��R 6)�?��)X�ޤժ�6\Wz[�*�h]�䍌��ĜkCP �J��f����;���V�	��`�i@d�O� �ĕ��ˉZ��19S��~ڠ �;�pww�j��'      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x�32 �?�W� bq"      �      x������ � �      �      x���]oɑ&|}�W��;�!�������`o�j����~����m��1�;�-Xm/v��P�4�I���2$-�����Uy�OdUe<%OC�t�S�*322"���~��_>�껯v�������~�����}���/WI���OO>}<������ާ��?ǟ>>[eI��]��]R<J�/��2��I���EZ����� ��U�ym��~�������է�w�#��S�U���S�ߚ??|���������ّ�+h��И7���י'E���������z�|�yR�Љ���?�����#ē�_�� >1����U~�xk�þy����:�c�x�C�:�w��f�upyw���Y�i��pK���|Փ��U^�ߪ�Z���<li�鵁>6��N��5���f���Ͷk�z����,�nOv���5:І���Y���sc�a�ު���lҮ;Sڠƀ��gܷ�>�ru7慜��=5���7d��St�I�����mٰ]��Yk6�YGzs��N/�ּ�c�Ş*�fk>�;���}�4�=�=顱��+bf>���ln�Cy\�5��w�G��dSzP��e�Y���d<B=cj,�y���g�����[;��O>�ex����|=5?�l�;�v� i�md螪���j�ԉ���
��еy�c����^�3>���|�wf#\3���W�^����=-%.}=c�x��Y�h��d�P>Z��t͟����4���=�����/��%����&���������k.1�|ҝ�YO��J]��^��l����86�>�� M����쮧:Ĝn�{f����\Z�����<���'��6���o�'Ձ��|�W�9tp���O��4~ٙ���dS���W6���Ѐ��sm~���/y;h��7��y����M�Z�[nP���46�/��u����^��� =P��y�����M�1�6koS�tgA��,w�2;�Tw���s����7�Jk_�~��}�<���O�z�[�/ͲE��u�̱1���q�;����G�܆:�bžߩڧ��2�.�w�_�Y]<c�V>蚣��u�����W��y.9E��ٵ�g��B�6S�� ��?S�S��vM�n���F�^�Ev��hEoַ!}6"�[�);��`�����,��Z{��#rt���������\�;g�d�ξ��̟U��_nh"�\
i���������͜�x�^�	�K1�6���;7���nw�iW|b�1�K%(]��'&[�Sc�TЭ穿2��yS��5�5}�Wf�\����W�5>� ���/�p�ټ����Y-*ߒ����Nqlp=�sޟ��n���&{�p�@�¶w��'=0p�j�2�mZ����s�?��3{�l䎝9���V��t7��{ǻ�3�?(	Rv���Ogo�ޖ�T��lx��/�s�b7�̆x<�C׺%�G��\��{����hY�8���l9M���w龨LA�WVs�v�9R����-��K�˔���2��-��sHyz�1��S�9hw��K\��@����pe*���^Qe�2ݘ�y��d5iZ��z�Fn����(�Q�#���c�h��~�H�������SB��Slw&v����/�Ml!�3�8��xk��+�<V. �q��Up�=�n����X�y7^����-/Ϯ4�Vn֍IN�C�J.5_�L�?8$C��ʸ^��Q����OM:j�S��"_�,��>3+I�;���W�U��N�Qxr_���n��e����L$�L5Use�?ޘc�Ҽ��|������.�uǞ��Ygw:��m��5�W�R��B@-��d�q6�:E]��z�����Uq���;Wg:\[O����<e�:XOQ�h3�G��aYA��;KY��g���J����+kGK�q������~����<�����)j��QZ|��_d�NS$��M�U!�!uH4j�J$�.��7c������$�hLM�A�J4�S�%���$y��DC1]u�2G}�a��B���Q4��U)�C`\�>G��a��V�P��V����+䀊E;E͢�U�(�G�-�Q��|D���$�K<�4��_R�h0j�xXY�9SO4Y%�����Q�OR����T��MP�h���i4�aUM<���Q ��l����6�QՍ|��&L��A����P�R�(�F�9��ST:�ZG�<��р�;�Q�|T�>Mգ�������R�h�F�>�QՏ|D��A���稁4,�� xX�A��R�OUi(ª!r@=��U)�����)&��4��"���(|��h����͗?���7���Y_d�Nә�<���ӅL�3*hҀ��M�ȓN���	;E���>i����	���	�4�s�Q��)˨P*|�`*�b�pJC!����T�)�*�a��e��JC1*�ҀO\���L^i(f	�≂B,� +|�0K�hi`��,�[|I��p���\�2�QA�|��KA4"�� �^XI��	��a�`�)B�x�1A�9,�G� Ӏ�b؀`L�)`C2�D!Y4E@P���Ń��x�	B3���\x.�4��-s� M�?Q�O��iH��4���5�$�?,`S ��ųL�i�
�4�a��Y�i0�7�lᛆk� .*�5YHgmѿ͆վ�ET���RMм�~��n���n��un�I&i�"P��m���m�tm�Q�i�"�g��f3�ֲE0�ױE�LӰE �ԯ�7��k��g��"�h�"���fOҪE����" 'k�"�����OѦE�Nӥ���I��n�z��x3�h�AZޘm6��l6^��l6�<�Y�d��|��z���1Z��$Suf��5f��e�QCڲ�`ue��'i�"P���"�'k�fcOґE��ѐE��׏�'����:Y7<A36u�^,xL+9M'<M#6x�>,{�6,{�.,�d�&,x�l>�-X��l����i���	گ�ɺ��س4_��^�cZ��i:����4^���"��i�"���f��tE`�_E0L^E O]�F�'��������V(�"�&��fc�PB�ƞ�����R@E��T?E0LS>���z��x� �U;EP�)�" '���c�U8E0�Q7E�OS6E OV5ͮ꘧h����f�M2�d����b��`��S/E@�T.�g��Z��*�f㍫�fC�+�"�����"��+��LQ'E��)�" ����x���ِ��H���H��'��"P'(�f�NUE �)�" �TG�c�����j��9J���c*��i
���#��xS�E��UE�'*�f���"��J��x3TD�sD�����ʡ�i�����C��B�Q�*�f3�P	E`�
��	�Ԡ2(oL42N�#��`����ow��.�.K��Y�E���M���$�I�d�ؿ��_�j;YY����Q�|�$_��N�Y�f��I����]������}���&���҆x��Fg�]�65��!��o�nױ�X�,�K�9NC5����t#j�4!��O�´'�z�BC����RA&d�\&�!�LP@J���T2A!�e�B�����	ZA*����,�W�����j�T�,H�aM��5	�!,K6�,2�������No�������Bi�l#�,�\\*[)&�VJĲ��e���x
ٶ|��ܿ���VŒ@I!��A,�B�$L�X�lC�� �����|;=��l.�M�(,�4�P>X h�|� �`@9F�pU��:۰g����T��v�j���M`B,�j��&Ě��kN`B,�z���~�Bh����dm�õ�C��z�B�|�u���sh���<4�/����B��p7L����Y���X�/�X�O�CW�o��V؏Xn�F���0P�ЈU;Q14"8��S�K�ðC#Rm�m/BBQi"]!��-���D�"6|�HwBĞ�Ѕ� bۧɃ �v~�^	�͟&������� С�:�
�I*�T�!H��
٭��[S�vM�+^�Z!�    ,8�{�|T�IK�)Īso�6̽m l�0��A�0o�����so#7̽mn4��K��V���4��1�.l����d�b�*Y�ؠJ.6�����d�b�*	n���ZG���,{�u˞j���ЩV'ق��}�[^���-�C_�סK��b�n�{��{`��I>��D��)1�1}��T��KEg;襢��R��z��lCŪO���G<�w�	\���B�M#�)�,�F���tYW�z1xW�z1xW�z1xW�z1xW�z1 /������I��� R޺n�'�#��{.�?l�v�H�ԭ�ﬕf���<y�	�y�~��޼��`.m���? jK�j� ��`�NZ��G-�v��@ �}4�)K�5��D��W��$阠�P�Rao>�����ؽ9���Ӵ!�}�w�%jb�X�Ό�A
v���Ohp��Լi�?!����с]�VX	�'-��O[����G���Ɠ-��TMM����v��.䬉vM�4��;��0YB�]���i��d��~sJ�پ�ܖ��S��yZ�l#?��U۲f6��>��U ��?�3��ˏ�1��s�<��9y����F�j3�,�k�p�5�*x��ycb�@ �de�nD
:Js|9��ʓ�_�� �l��{ݷ�r�yt�����
�VƱt���!0ض��_�6Bs�0�Tc|a��vҔ��6(�n�S�"�"�m��u��w�����,׍����u�|��l\_+܋7�<�C�q���m"C��8�Ư/�!Hjۖ�=Kί1k���F�^��w��";2jc{[s7�2ؗ�����r���F�5��ԍ5���lI�3Ȼ�,Bm��ss��X5po�%{�Ɏ�9�;� ��������]E ?�4�t}��6gT�S�;�z ��{᜘e�m
�~�8�#y5��B�\�5�_ ��oj�hA�k�j���jN��7�=� �z=�H2ڦ׬�yN�AO������|���+�w�x����ux$��zt����]X�K�0f��7���~��p��>o_|:h���oc}9d-嶁�2|E���:���:��S�5<�A�:`i��ut��>0Q\<m���a�\q����:����u<��:�3�U$�S�� O��A��ɳ�u$������?��o�0_}��tCx~�
�N�gz�m=��N �Y�}N������Llס�m���綫�C��u����*�� wp�B97ܢ��dx���:���}ocǈ��4{^)��נ
�5�s���xj���DCc<(�p��6�^�0:�^?��W?g��z���^���F��������T<\��/&G��'tY��Ӫ4��� �9�{�y�:�U�׼ܨ�� v3���_.Vx?�H(��g���;��my��Q����}�sv1�t6d{�����+r� ��:��8,�� ���qT��w1�4w����c|�<ټ���-o �VN�&�J�,�~X�y6�rJJ�< T�7��� dE]N.�.W�����/7KWZta�d�A <�Ƶ��^��p��/ħ�t3�Z̭"�� �욣z���gL�W��Su��p��)� >a6<�](��X�S�әS�m�"�w�Q!�59���7�\�x�Y-��| ���~.�&1��p7����^9�+v�OQ~�ڸ����r�,��x�����|�W�����]l�?�-�I�]s�{.���
����)QtoՍ�qt�kWY}��PwM��J��g^$���h��3,c�S(�/[��G^r=�.�S��?w�� ψ�t�F_���W���5��w��Y�-5粝�ׅ��U�iۃ,0 �Қ.�↕�{���ȑ�N��ߡ6Nɮ�&8����@�^W�bwdۘF6Ř���e��J��������qN-�~�z[ܭ�}su#B@�-��ꍑݧ�� ,ؕS��o0/Q�����b>S)�\P�隵��L��Hr���7T7���zlk����h��
ֽ���|�4 �z�'2�3���d��e{��.f�y����w�@<�w�S��* rW�|=X�AVw״ ����L�%f�dó~#��4�Ef���
AmW45N���AV��ŵ>ʝ15.��6|E�J�Q53E�Z�nE���ӳ�Z���q������ �{�{K��y�oHE�S��o���ၰ�~��UD!>-�<��<:~��`�&�cnՁW��#�o� �V��tx�)� �-o ������A�{�tЙ=3IAt	�5;+N����v���Vhڄ�/m�W4�!<�Z��t=�|&.Z.1:bh7���>ϸ�a�[����=ǘGC=�҂��ԺQ7|k��6>7^��+�s����}G5dƟ�RO��+��4��'nL���)�Çt� 3�m�r7�O�a�^��aN�������V%y�gfqc,F�sG�W�5#V���s�n���
��k�~Q�[�C�0�У,=�����S�}��ˍ��+�Հ�H�������+' B`��X���+��]��z�SOi>����|��;��r�e���:1e�k_�9�cRi�aV*�cg*nTH&
PV��G|�}0'�52,�~�tׯ��wL������:Pju��u)b�����s`_�lمPI�������j�R�7T�G�g��t����] Lܫc�
4d���^y}b`� ec\�E5���|"�ɦ����h�ZZ�o�)�cv{�@�ǆ�֫�{�ר�m��<C-�*����4�.J�W�SSQ��]�C|Am	!���^��X�o��LSP�|��� �*e�<�PT�������|?�@���X�9G�(A�z���[uqW�t1Y��%��+D�p�?�9�d ���b�i�}��P���X�k\o�G���~��-W�qV�3�m�~�fܐ}z�/9�w�y-$���H�MOs��*� �➔,>�.��RU^��"����UFRk�;�
�еg��A����;�~����:�l�1l%6����߮� B����c��=t����|���o����o�|�x���  �F7<�[U�Ь�������;�n������H���~<�vVᚈ���>ojZaN�~3�bx����`��`��3�i�3�i�3�i�3�i�3�i�3�i���If]!id���GHZ�d���0I*��Gs0Y�����k�%ҥ�M�SK��<Y"2]�
e�0�t)���Kfs��,Wn�TZ8�Ha�'��VZ�"��E����rq)m�E-�B�A�ӔO�h}��?_u�J�;L�Z,�lq�
�@
��0jQ��y�����	ŰEQ>X�P��|�(P�E�`Q<��-��I��P.q5\�'=ø��G��3�G��	l��Xע��Z��p�\s������z�RB���R�K��j��	r��N��XO�	~G�3�� �i���4�/��v|;�aE;��WA;��?{;���s;��?l��M�� ãBk�0���Z;�1<*���i�
���=��Ig[.E0|�֊�i"]VQ��Nl�� ��p5E��4yp�`����1��E��d+�d`+|���c�1�,M�۾�`F#75lW�ҮNQ�:��0
�S��4� �l`��af0��0K8�In����0'�A���Ü�	�$s�$(�8�In���0'��Q�1MC[������Y�4��SЮ���P�Q%��p�J>C�F�|�*��U�*0��Oǎd�ӱ#Y�t�H�?+�o~�ӱN��o���7ώa�gǰ�ͳc�n���=IwOܯ�MQ'�X*ET|Ƅ]��vuR.�����Bw�KF�;�%��?12�C��w�I]����S#��4���F�i��"L�w������k�=�e\�f�!-�7Ci׸zH$ ������r�X��d��Ӓ��g�)���+E��oͽk�'�O�_PnB㞺_H�7/��,�K;9��(C�R`^ ���Ɖ�h���T��O���Ѭ�����E����!�I�3A�K�_��G-�0����k��U�����N�4kǛ. �iڿ    �Y�>w��$:3�ۛn�{~�]�mt�\�mh:��l��0o�5�ߝ1<L�������)H����=�m������)}��>��Xi�3��Ԁg	�sk87&#��w�µϋ��=�_����7f��3��)�6?���$,��O�/z;w2J��d!��ݽ�Z���}4�0�M���汏�@Th}�;'Ϲ�4�(�Bx�%~m�3۽�)L��=ةW#l#��z��)�1�,�+�����F��}��9�NF���k&�g��#�d�k>�N'�� -E�m�N��5�z�s�h��9n�ԶY躋�Ӝ�|��_Bn�+�w��)�n��c?�������5���D�ܱs��^��:Bն�{n0�wQ��f߸a �o�δ~�R7
��n͝���`{��]�n^�F'�&"�FmKP݈.����Θ�2)�-yt�;����+[�x`�ߓOv6�1w6>0�	tE�U�]
_��R�0}�\��;w#�᧞WΓ@�)�?�xX����/T�P�����8��F`+�4��F���.�r7� ��Ϣ:�Fn��G�2��׬{N�SnFXlS:�Z|B.�';�w���<�!Ѓ�����5�h����f���2�4���kz��p�]}���(��|S��>�<����v��?'��>uߴ��=�Q:�T�?��G:��ք��E�à�]Z��#���@��%4�g�r�n.40non[K'��UZ��@��O(y��`�D�7������bRR�����z��5�,�V|dP���k�k�ޢ��d#Xq��1PV��ӎٗC^
V����o��}W�D\G4̒�Cw���|���n%4f%�dD��%���4��f�3���7u�<�Ko{��Pw�����Ϭ�?�I�@������4+h�I��`^���)�K�b�9s.2�	��Ҕ]zgXf�*�lЌ����Ճ�\(�G�;s�PT⃂%���Hwf#�c�����>�^�@�����8��g�7�����r�)O9~��d6�]��Go�6ޥȌ)�A�b���zp�/*�Y1�/�×�������18��»z�np���-�!/aGL�1�况N��3JO�=�P9[�a�0�K}5����Xs8��3������V�_�R$� �fx��4�Xq�ᐣ�P|{�|4����F�e������ ]��v�n�챣#,nf�����:�P2�F!��9'v`��' ���(�q4���q��j}w��͓̀B_Z���唊۷~��k�d��JEܛ�٦S\GIP�F�z�`�.CW?���ru�x�FR���+�It��q���7���=~Ùݾ����̈́z��q���zY�� ٳ��<��[ΫY�����������p�̄"��î�H�~�.������?��.��i��Oe]�Œ=��2v��>�7#vפ�CO �K�?��-�'F��7+���k,�38�9a���6w&Ѝ�c���E�=:�b��S�ݥCn\e�{o;�O]<L�P>�l�3�Q�a�����ǽ����Gp��+�I����J7s�nf@BN�_�p�1�oQ��zׄ�Y3��s�E�.z�X�4~� ZW�Sp蔯�ˤ�򒫯w�ӟ.��]���+Ч���k����(�ܚO�;9-�ƚ�#��̫C�;+��|#G��D�?����}E�YG�>_��<�]/	s�Z�A��vŮ�ӽ��Sn���x��Q�[��ʼ(�H�oíg
�z�7�T"�=��������#�p`N��3���D"�.x��K:MM5�C��kV����%��Q��4@�}i{g�V��{�q��=G��Ww4�X��/O��g�;�������
Rt�S8-�Y�^�*N�ѧ�}cP��H�z�>\`ȃ|��i�J�.twᙦK�*ʆ��Fzmދ̆�=�ܮ��(A�c/5��RS�m��;c�\�d�:�����#+���+�9F�t�"�S7��	�\q:�Y���6���o�����1%��>;G�%��O�Cc��h��}C}n,��v����9�ӚK�մ^�	��j,\���p���|T[ny��P=|������Lz�KX䫨�r�j�2�/V�~צώx��Ţ�����0�Ƚ_rj{/Z.�1jyx����Yϸ�e�[����XǸ�H#������(�Ժk7|{��6X7^��,�w ��GՃ�g�b`�-������'n��)��t��`3�r�E�O��^��a�	E����{s@s{%y�gf��,L�s��W浣V��E^�K|�WGQ��ي,��$Fe���H�J�r(��"a�r�������z�t-yR����I�P��@�� ��HW�&�t�XP��zG�Ң`�]qa���9G��ˊ�K��c���>�sd�������=�.U�n��\䢬R۩����Npn��@e]鮅q�
����uP�v��K�P+��F����9�f�n�+�ʆ��o��\c�п!+l:L+�����Z�by��K�;�v����-�(+3d����o�*u�6u�/�F~�@-��2�{�ehH�����B�x������g�Y%\]�B���U����t�*j˵k�/��(,��� k-X�
��W��OC�3 �^��BgX*�u��d�'�`w�G표#��H��\	�������똋�84jy����C����9��@]۪b�������%U��z�.?�M���J�[���7���+;^��M�"��DQr0���H���P����<�]U^��x)��(����-hUPUՉ�p��w�a��kϜ>痃:Uk���p8nS�C+w��c�*m8��w�^w󄱬��;��#�}�c�����ǿ����v���d �68���"���&�������ޙv�e���V�D�7�シ3�,���y��*s�n�_������㬇#�`��sA��� 	j�\�5~.H�?$A����2ɬ��A�F&�5�>H��$��ׇHRy�?�7�>����'�[��d�0�y)k�%���,O�#���BY"Lt^�"��ٜ�{8ӥ�Jg)l�����J�ZD����Ң�R..����U�6�{�Y#���1���T��a*�b)d��T�Rȶ��P��|�(��уDcs�a��|�(P�E�`Q<�B-����x@�[��%���o�{W:�[��p
l��X���Z��p-
l��X��5���x����+%�[/�p�9Q���� 'j�4����D��wD;#M����&���.I3��jǷ� vQ���z������Ð�;��`�Ö��Q�D;�1<*��Ck�
��àã�i�0���@Z�n۳���g��R�n�(ː&�ee�L�m ��1WS��H��f Y	;_r�P�!��@�"M��g �;�r�b����;f4RqS�vu*����Ӏ���=e�L2���fӀ;��Ü�	�s�$({8�In��L�0'�A���Ü�	�0s���e�4��a{>�y��L�>��*��U�
7��3nT�g(ܨ��P�Q%��#Y�t�H�?;��Oǎd�ӱr�<�$[���1,|���yv�<;��Y��ޓt���
��	�u���rQD�gL�ul�1aW'�Q�~�(t�d��_2
�P��#�9d)�{�I��l���$̦���$̧�=�0]�5n��2�q3���q������k�=�e\�f�!m��<��6�Sj���`E��#{bNK���E� 3�Үi@��5��u��=�~A�	�{�~!�޼���.�L��?�qK�y��K'P���{�RmW?�X�G��rG'r�7��o��&Y�e�.�7�o ���
;|c���[T�Z�/;�֬oR�[�i�r6dU���P�X��{'A<>���A�6:w.�7��7����t��5v�����'i�;tS;P4v	P���';<>�Y|��h��>�;bilk�gl��1�6$�wn�I\�� �k��1įV���3w��ìBf��s�JS[�'���?�&@W�0��    G�h�M��>�g���,Ȼ�y��>P9��ؿ�s�;Ks�2-4T�Y��V1;�U]��$��؃�zQ�6b�����������:(^��mt���9��,%�\{0�>keY'�^k�a�v��@���(jnuu��}�y��S��Fs]�q���MPםFh�����A�~	����xG��ln�h�+�k���fL�z\�3N� �B|�r��	�@{ɯ�ET�>������G�֛E䆯����4b%���^�c/�������d�D�^��m	���~u�|��]T&��%���cG��ue���{b��^��|`>�l�7�#���1Daz���w�F�O=���T��Sn�j��,�J��#�_��5�^�׹$���a+�4��F���.�r;�!��� ;��o�ŃDm�kV�=�����AA�Ȏ�+��Kc_ O�4���<|�2yelԬ�NA��w�i�� ��k3�yTw� x��_��EQ��9��X�y [c��tgN\3� >u���=�Q:�T�?��G:��ք��E�à�]Z�#���@��%4�?p9w7
����%�d�*-��Xw�^�'�<z0�z�ʛErg�ƇEn1))�w��?j� n���O+>2(L�ǵյ�ZoQDi�����(�U�i��ˡ/+^��ٷ{Ǿ+\"�#f��;�k{>�����hҤK�Y^p{G��ˌ�C^Û:u��=M^�;�`�C�gօ�������|�r{S�)4�$�vcE��f���I��9����~i�.�3,�f��7�8c�"m�m�`�3���QL���\-���`I���ҝ�ƈ︁4A��'؋������!q�ys�`9�,g�����Of��0�څ\�f��c��̚��*���+�G����|��:|YQ�{����QY)��g����]�r�v�dS���/8�T���cu��������W��)hŚÑ7��A�5�/p\������"�8~ �7����a�Ŋ����������}5�-�]�: ��� �}�svk#F�Yܜ=���u̡dP�BF�sN��[O ��Q��h�ˑ��������
�/�'�����̣�)�o��	���"��7c�M�<<��(���<����]��~��]����?�~��(7_W�E����7��o�=){��3�}'(.���	��s�n79��8��gW�yƧ��W��2�j|7���� �Y��/�B(W�b���<�&����s��6Y����1�)ެxfޮ�E���,�s�{4Z��n@w玥�
O�����_N����q5��� [<u�0�	7�0iN��E����.�u����np�=�|@���ݔw�C�9ej]��U���E�
�]8:du�v�ɺ<�b���|h@Na�S� .��K����O�H�"w���@�T_��W���5��w�rZ�5����W��!V^���F6DA)ad���0��]���5|��w�	��^��g��|u�]�=�{�çX����3�YM���u��yQΑ��[[����o��D
JP�7B���<�G����R�g|�z�Dn]��=_��g���h׬17�AK�P;��?4i4��>��μ�[��B1�����X7��2hҦ �_$����|w0����u �8��pU�g�{	�8�E����A��"����p�!2㻦(mZ� ۅg�.q�(��`�y/2���ar�z���T�(�JM����ir�Z�u�(*�ȳ��Y*r���y�)��O���#0�r����f�i�.�����/�[�<�|C���|C?u������J��IZ|����?
�|T�j.V}z�!&���p}N:����2Gl��m�:8���6xL�>�g0)�.a���fg�i�q��X�J[��:����3�G���~ɩy�=dX�h�����b���[=��@��o����X�V#�*�O��S�����6�`�x	K�βL��I܁T��������vA�L����W����,CP���9
��X�s�]�>}�_z�:�y&/�;������ŏ�0eΝi_�׎Z������!�B����ZH�l�eAb���g�R�V�O9��a��i�Q�z�}Gp�w:��<�[Ct��g(�t��[@��Q�+�}^��)(�z��OiQ�鮸����#��e�*#��1e�k��9��Xi�Vr�g�*nJ�	.rQV��)~�}D'7�>��t��wN�����:(l�4��֥H�^W��?����e�e�µFe��ɷ	P_�1K�ߐ6��2Ӂ��w-p����*�=R;�z��I�[����|�7\��:v�:�c#�k�?���zT�}���q�"�W���_#���� ����\(�ܢJ���_��SE�vM������:�`=��b���SAP�I��iHvdث��=�KE}�.��\���l�n��=�sd�i?�+��XQ�wsQ\�F-oһ��s�ԁ7��8���ZU�3�����$�*֢,׏���e�_Iv�w�����ze!ܻ9Zd�ނ(Jf��^�q}�ӓ�ݵ��+�/%��C� U�W��
��:q�4"�ζ��=|����rP�jm�ס��m�zh�N9�{]������뾛0��3�5sd�]��\�~��o��_�|��S�RCL���o�DIB�d����_�k�4���\�?�L"Ț����Y�n�5���im��
7s�s"}���6=�"���R`�)0c���pA
�H� f \���)f��R42Ōa�A�V��1J>D��{�ќA��l`?<���$K�Q��ؕ,�&/cc�D�����a��2�'����YnZ�RZ.�(A�&�VR���ť����rqm%�,�B�7�Ӝ`�hi��?�9H$�&�,�B�.L�Y�lW���K�<zy�fl�9h)���"�R(,�D��P>X
�PK�#¸��p�m�bJǙ@+��<�������0��?����ʸ� ��� ���p}��@���� #f��õdĬ�&��F�~X'�	~9������h��[����v(C.�v"�~�v�~�v�~�vC�r8�Kh�A0Ǆ��a���1��v�bpLȫ���j�m�河��\j@��mc�D�db̀�\�b	:|�J�1i�����{`�/nÇ�;�q>�*���*���`�:nÇ���}��C*n`�N��b�pp|A��2si��Y�4�݂�]pjA�n�ܠ���ap�c��y�
���7(0�o�ܠ���aps�a,`���7h������i`���^%��DT��%U�xID�,^Q%��DTIpk�(�>�:��O��b铯�X��\���N�:��/v���;�E�����_�/;�7$�Q�@�1B6A��cISM�ْd�gK��I�\D�_."܁/����7T���W������*����
�e��f��
�����C�.��6C�g	��<K�����Y��m�>�.n3�y6( >OK��)5��~�2�֍==1'!u!z�r�SȖoi�$��ޚ;ӺN��PO_n���_<�7���,�K;���c�R�\�@���I�hq��8��O���Ѧ��ǈ�b�������I�2A!K����G����ݘ�k��S�Ճ����I5�ś� �iڿ�1�>w�F�;3�ݛa�zv�ł�[t�\�m~Do��?��鵲k,��ߝ1�=D���<ݱ���H���d>��Vz}��h��>�k��h���[gj{��9�tsc<bz�\��9�A�j��ܿ+s��9�)D`��97c$�,5K|b~�۹�[d%��]����p��y�y������>��P	������Φ\c��r���U��l�"0��7������mW��9Y�c�4G�����N�dM 4��_�����B���;��Y��	��*r��f��i����FM'pZ�@��<������Lm�w�{d���y-����q�_���Ք7@�p/׮����0�g�(��20�&������_�    ���}�߳p^�� t�M�q�B�ߠ�W���	�ܚ{��8�"��q�0�9vM����j��_ؗf�����1j[ �v�ZK�6��ظ'�K�z�����@.���o�{����B���k�}�n� ���y�:妡�=|]��N�4�¼*Js�1f��V�	:�m��]��.nL@ ݟIu���";\i2ں׬wzNq���k���u�=!'哝��:�ҌY�x�A���啱E3F�j����j3G�ȯ�(��=����j8�|�.C�&����Y�ZW���fJL3� :�����=�1�7�4�?���G���՜+OaZHP--�Ϗq�oJm��ו6���{��Ԃ��	.���|*�;.���9ă9�p�ʛ{qg�Ç� )�w��?h��o���|O+>(l�ǵe��No14i�V����Tc]��a�+�^�ٷ{ž%TꫣJɗ���k{��������i��K����]O{����{�]��:u���MF�;�@^A�'҅������y�r�L�S3�$�u�*��&��}Iy�\3� =~j�/eu���ʃЛ��ዶ޶bЙ��H�#g���
e0���s~:<��m��iD�O�����A��P�����f�7��W�r�O9}�yX6(
b�]�GoV6��HŌ���b�o��
i̯)�1�&���������14Z���[z�Nl���-��.AH�1�B��2>�h=�@�N�`ZN�+�}5�1{��֨9�x3�]s����uj+��y��z3�?X�]�8�ȱW �=L>�H��w@�ܲ��~�0Imx.��:g�t��� ����bz����9���g����A�yztN.�G�]�^�ַ����)���_����|矾`OHj�v�E�v�;u�v�Z����u�7
}���ϗSBmߖ������k!Ne�n3G�<���"���<���o��>�ɍ����?�x�#(7�jWvES��b�7.�o`�{�s�}�$$➧�)��#��;9�q8��U�y����W��5�Zw7����$
�1����,啱� '8ϼɥ�&9�7�Mβ���w̞�nV<wm�؜g`c�����5���������':�b��S�ͣ�m\��{o��L]<LU�C>�!�S�E�A蹋j�'����kPϥ pA���N��Nw*X%~N9V�wU&�oP�2xׄ�Y��#�E�. �X�G4����)|sʗ�%�;y�ɻ��O�S�.�C�KQ������k@���������_B˼����3��0���+";��C(����q�D���̑�jϗ�4�o�K���DNc�`/�]���d/Q�[;/|ޝ�*��ֻb�2�ȹ��f�m{����%�(!	Ƽ��i��q����0P�S���oA/q�����GSi��P��Uצp���hr�@��7��D�;�^t��`����a]¿�K�IzBl{�x�?��oI?���\G��L�j��zW�Tq�>I��Bb�E�׋���d�wM�Hҳp��]�VN6�
6R�X^d6`��� �v�@�t���j]�jf���䒬+�T�sfWIT�^��1�R��61�6@��۝��j�l�5�Í�߳�0���=�x׹�/�F}�$_��]��#����Ϭ�~ʍ,��Ը�V�y�&��j�P}=:��`�26h��=��KH�M�Ee�����=5��Q��C��`���WQ���D�(�t]�lѬ�Z����E�Y�#h�[a*{��<�.�]�\wc���V+E�]��q��h����=��ͧ�2J,cpS��������xV+u,�u��$�~GE|Ƶ��[�g,���\��'�n
��)��t�B@3V��rs@��ߡ�^׋a�C�����R St%��gf��,I�s�W�ucV�k En�Kt)VGP��z��2)J�A�:e�)�H J�r�����r���x���t-�E���ʩ�0��@6W�w�e�����^���A^j�+�g��*縔{Y� �fLu���z�k�U�ˢU��Gٟ��a���
\�Ujd_z��i���&H+��#�]S%���������(�u�fE������sh�c�lٙ`P���w��/k̲�7\L�h��t��z��T���BlS��^ym��Uecuy,>6_���b�Ӧ������ZY!h��Ukߣl@�@�������{�׸�ng:=�-�*��G������W�TQ��]�:}A�/A!��_��X���PR�|Α=��*��	(RQ� "�Z�;9fG�)�l������U�`�]�\<�E�1˙d���x�tЍ��9�i;V��m��\���N�5��~^� �u�r�'�Q?�^����n�Y������w��C
X_��E���Q���(�J����xø;U�R�u��N\Y)M3��2@^{&�9��iY��t���q��ڲSN��eÉ3���$�c��q�Y�C��q:����m�2X`>E��\�ԑ�1���� �O7�A���&������?
Z�6�W~�H��8�`o�ȑ��q����O��<��=u��{��N���IǠN��<��s���9,��9rF��8�i]��'wW����U9�'��8rB������q����1�#�y� 宼1xS;��`�h1?��5u�;jꌮ�q�Ӻ��a�u%�A5��7���6����FƀMj,vF���1�aj�(�)mc���`�����Q1���Pq$�*o��)>���i�b�Ft<1�1��8�9ʚ(���&rD�:��hFb�F�"1�#�8Ƞt#r\��*K5"�d�@�Xl6^d�:��>X,{���c�&��� Ǘ�ǱM(9��R �o_��g�|����o�&��GP��U;UZt�[���9��/���w~59�f�4��ˢh�����[<�h�-z,�;-�>!�H��SJY�x�i��h|1?�8=I�1������bq�rv�Sw��S�w��Rx�Уy�X��ɼx���Ʊ�SZp�COi�>�包���G���G������g,��g<��h<��Dh<GD64�,��ǝ��E����gHcq�Ҥ�\i,��i,���i<�h�4zB�4zN5�cb&5�`4�̩F��$V#q���xP)��8-��.'[cgf\ci&�]�	&�^c�g&`ci�g�)�'<S���E�nu7:�,zdșw��h��d
�9���i�c�bq'�S@�����R@�C��A'M�R�Oy�@�3�JA36�*:<6*w��%���%�H��")�Ӑ��($���h��E�Г&�(���(���p�q���QL$�@�0�%}�<�h�I�\蓇�DsL�}M0o���f�8�<�D:aI<��)$
�i#Hc�G���ĢO�<� �3v$�&X�:Z�=�Z=�)P�:�n=�#X��`�+c�ō�e�'�U�M3R��*����+��׏��N("��T�G���c��X�	����S��c���xD��<qZ�y,���<�rJ�y4����X�I=���x+��ݻ�r��xй-�L��kG��h�����Y[7��v4�Ԟ��[�]+��F�
�`�h�P�f��ͱ����
�mM�p���
\�]s4���8Ql!�8�ۯ}r�_G��o4�x^��
�	mq�ѷ��U��5�U@��F�Nm�M0�NV�;���}Z#�h��]d6e�0��b%U;�m�~���Ć睡�6�b�s�&;D��Չ���8W�Jw�F���So��[��֩G�[?����Y{���?���۝_9�Vh�eH��:��VW��Zy���W�� ������:�+�@b4�2A��: �SY�$Z�u X����B� 0Bi�GH�Ex��:��[��0�u�A-���z� 6Bp-���"6Fr�Gh��� �Nu-#e���:��^HP^�t�� 0B{-���l��Z�ʯ�
���
`�Hv�D- V	  ��l)���T��[�V�eT�[�)���Rl������"$X�-����2D�-�"@��FH��:M�)ʖ���l[+� #t�"�V� �*�e�4[Fh��:q��Wg��l���#�x�B;���h��J���iH�*� 6B�-ãt��P; �PjP�Rm���1b� �Z���ɵE`�^;��l��m#��1�� <N�-��T�"X��Y@�`S����nH@�� �Z��F��%x�|;� �o�<*w U����� �B�@ŉ�E��[DUɸET��[^D�`�*�e��[�h�ET��[֪��:9��s��n	U��!�%�"$@��F��E�xUw 2V�-Bbt�"���� 'B�-�C��"<F���w�t�� �B�-�����(����TxH�$�<��[$���e�8�w O!���t�"�J�@E(�%x��;��������X��/�!���"$F���)�$:ɷ�|��� <B�-�Gʾxj�w ['��a�o�A+� #��x��[d�������Jx � �Hp� �Z.b�D��
�7_��ǿ����v~���B.CjT�T�
\�֪�E`�
\���E�U��Xx ��	�U�H�
\$Ѫ��:��U��*� <B.�T�l�
\Ć��j���P��*p^��1*� <B��U� u*p���T��
<@��
<��S��*p�`�T�"�V V��ET�
\d@��$j��P���Hx��0�U�"�J.�*U��N@�U�����!�*p��� *p�y *� 6B�ש�E�H���W���Zx ��*� 0T.�(U�0B�֩�e`�
<��P���x ��CU��
\�V��E`�
<@�V��*p�0�T�`�
<��V��� ���Q���*� �N.�T��
< �P�����Q��q*p���*� �*� �B@E��ex�
<@R��*� 6B.��T��
\�Q���j���W��*� *N.��T�"�J.�jU�"�"*� T.�(U�2�F.�jU�"�V ֩�E`�
<��P�K�
��!*� 6B.�ǫ���*p��T�8*p���w�y�՗����S�՛Gi�E�|��;u��U�F�.��]y >JW�����
]��
ו��t�"RW �ҕ�p�r��+��t�<��<��ӕ��*]y �+��u�� j��<��ӕ�cu�"d��\��ו��]y �+��t�"0@W�F���]��+�u�l��\���E��< �Е�A�r��+0 t�"<LW.3(u�`��\"���j]��ӕ���������E7����R���zQ� �֔� I���P��K
�E�h=����K��jr(&8�ZrW)%p�Jr"$�!:r!#��*r'"	����	�Q�K� � ҏ��������q�9P�q� �9���dJݸ����ո���j͸�����8Ÿ@ ��z�� ����P��ȁ��z�� ���K�Z��v\�P\�։� ����P��h��@�ӈK����V�4��ч��Jy����� �pZ�q!�p]�q��p�F�ߎ����JU�����M� 
����E�����4z=�����P5�ȡ���-�����J%������z� ���� ������J���������� ������@����h��H���[$�(�EP��[BG�E��[$Ы�Eh��{;:P�-`%��N�-����zo�I#�A�jo�C'�@uZoT-�p�Qz�dX��D��yK�*�� �Vy�j�����x����Qxo��D��[@DȻEh��[@W��E�hm���v�K*�EJ��[B��%t�[D��`�pJ	���Q`K�x������k�#N}-���N{-DJ�E8��ZU
�\��Z�Ȯ��+U�"h��Z�Sj�E�hɵ��P\�
����[��@��ȡT[����Z���������BkZ��pq2k�@��q!"k��pk� ���qk�@��q����@u�H�W�8m�H��V���o����;��n �h�&"������X�1iu,�4iu,�iu,�BZ=�6���߿�r��2�!5�0��^�"�v%����(�֢���b�Bj��^7�v�H��U#������������_�������_G����Ԭ;��/�ꋴ�)˴����o;����������]      �   
  x���MJ1���S��I��I��z�Y6�����VDdc3� ڌP�MŤ���(���彀h�F\
%�W�*�%�`LP���{���Y:��τ�;aK��		?(��(NӅa,�X�,�_yH��~��/�/�oد��!gז�Oߌ�)��m��8g��h�n]1t9�ekʚ$^0%R�#�&h��S1:�����V�Ӎ�{��>@ �E��%��țT�';n{#.R%+�+%� m _ˑ�a�uQ_y��      
   o  x�M�[v�:�s撎�&�r�?��D�]��"L�(Gq��}�O�|�o��u>�����2~�O��_}�
#�>��������ϝx��R1��S0�{*�=w��!�����N|�(����i�o]}�b�S�?0��|�t����Yo�>�H�Nլ�V���
O9��W����?����CgK
�|R=筇֖�z��S�MU=%m�r�1�-H|�����E�m�ɱ&O]���_M��
#\��ï&�x5��0�[*&41>`��TLhb<1�W���_0
G*&41�at���	M�pV&4�j�𕊑&������&�+<�H�H�I�H�(xkr��&���&��0mckb~����51����q�ԣ���U@o�������et��DX���;�`��(?�^��w��o�U:������b��o��?w��+���8de����>�ʌ��~`�)f>w:ƯV���8������ �;U��j
}��l����{�Bc�{��z�[�-(�W��G/�� ��~���S�-�9��)w�ܲ��?jT���[6PsZ���hu��E�V5iU��^aJ�֪Z+��{#��W+�=�[4�)�=w��FxOńV�'x3ޟ;M��b�:U����E�r�Z+�F�z���_��_�.��2��|R���H+���zie^�=,�I�H+�(x��he~ ��ke>z��]��2���W�e��o�갮�W��Ͽ�oje�ZM�F��i��x�ɛ�2�c\Z��U�V��pkլ��	ތ�V�W��������>S1���N�V¯V��UKZ5�2� �;U#��W ��J+�j졞��V�;P�h���� �w=��|��Z��UC+�H|������C��V�_.z���iխ�^aJ�~Zuke����V�Z�1.�zҪ[+�FxOńV�'x3Z_1>(f�bB+�F�LńV�8ńV¯V�z��je>Aj�~��x�je>A�!�H+�j졞�GZ��@q+��he~ �M��Z���Z����he~��V��o��0N��V��.��֍�հV[x�)Z�a��7�|X+��aKńV����S1���	ތ�V�W�K�������>S1���N1����,�Y�ie>A
w�FZ��@�Z�Wc�i>��|�[�o*�V�c���m?���7PuXu}o{��Ehi�v�����󖤉�����P��j&���:�+L��ZMke���ǧ���x�q=�fze1�������bZ+�F�П3�Z_0�a5Z�0�gZ����m�_/�+��%��R���,�/�3�>�T��2_����RZ�Wc�:i�H+�(x�V�� x��mo>z�m?�+�ɶ7��B|�R���ǔ��Ec��?	�����6�[������ϟ���+i���LS3+C%B�$��S+C$��%5���]����R��)��H)��R��N�N�H<14�}�J{i�;q�Ԓ��CJ�.�L-kI�j�����2Df��e��y��1TRm8�2]m��mYɖe[������Pq�{ʛ��n^#��^�-���v^7��Vrcٍ���?�b#L��Vh�E��	�z��-;k�������b?h��XsO���@�e=����'��'~�ޖ����X�z����ԉ��P��g��QP<UF$B���8
��%�((ql������� M)qƐ��7��Fj����!f��nG�ڑ��:���v;
S�XDoJ���5w�:�1�,�#�Ӝ2;C1�v�l�4�sO��I��I�9	4W�v2Ĭ��I�改�lei}�9U����|������F�AK'��#�0�x��_o�%�7�2�1Ӑ��SS�H`��c~��K��}�71~�q��ۏ���Ԏ�4��-9>
ҔC�FG��M�(�ߺ�Pq���( �*q0�D/���T��8�!��Q�ΐ��J9|�>����ީL��xE�J��2��x�����!��IZ��Lk������j-���^-Z���A�ʜh{ͼ{fjI��iJ���.\����δD��Zy�a��+++�k�Ȥ��ўF�2�N=����J��9�l3�!���{��j,P�,6��=��w8�=�;���}p�w4�V$r��Dm�;������������T��      	   +  x�ՔAj�0EיS�����m��r��!	7Y��]�vp����m�(�H�Ʋ�ƻ�f��_��t>~�b7�O�_���+�o��=�G�
Żp��^��D����������w�^�v�k2�4r�&tNߋw�LZr&d�i�L��9}/ޕ3n����FάG�XG�����'����:�* �ڥB�R����GaE�gӃx��}���c{�����"�����p�� �"�[��Y�幟��P�����xi �.[��zޡZe���?n~<S(��6�.kк�u�<Z(�-���`            x�͚�n7�ϫ�أsPEr��sTZr�ݢ���K��J8��S���aM��vc��6|�r�KiW˕f-	-�0�4%~3���#Č%�1/���H�s�n���յV
�uq�թVh��V�x�ձ.~��m�� 	�� ?��$|f�+���,Hp?�R����G���ϲ>g��w�=KG'V�iu��	N�z4?Ü�W��VwZM���VO�,iPrC�0���x�� �sя��3�y�W#�K}��<��&���gFwc�>iu���q�p'�|A]�ߵ*P��b����5�A��4���V��HKK�a�������_�L�4"ԇQ�|�P���Jg�����B��⤔��5��r�{S$EKI��h�D�	���	��N��>�����ެ�6��5�F���r4���簰�+��Yi���5��{�HkE���� �QpXG�'�fzW�����p��AN��B�tq�aD�D^�u�uB��s��6ڄ�$���s0S� b	��T[�4^��� Bf�J�;f�*+�³���	 ���{)� {��p����%�@øF��1��?MA������P��M��qi��� ܿ����b7��O"�"����o�Ǜh�G]$��=�r�@)N���v�8
���.�ݱ�(�1;g��QK��oKkQR���p&Q��cJAѥ��d}J�E�F��p���zb�-�u�Ă����n	�m�O�T��?=����RH��ߖ8ڝ�n{t�.�ltT6�m�O5-��a����M�ل��e,ټXZ�#R��yYA�??����:	�!��_�[(�J��VrD�h9��G'��Ƚ��1�#���O�Wql��Y��vX�8�j�P�ݴ��ZE�_����vB�i
JF��:�x�2%���do���O*�0�g#o`Q��c�on ��Iq���Y�u.o��ug�Vvg���p�����N�-����3s@�[�l!��m�r�mY,Q�rS���c�dَ,; �
JHB~��9�Y�u�}�C���Fh{����?����#��n#���7�'xr���ϟn~�%!���k��C�vD�h������[���8�D3`?0V���I@d��`ha�m����`$\g�0�u��gJ�ğ�0��"A�ڊ��������(]��Z]�}k�{[��?A�Q����g\�#��pV�7�׆%���0�u�ҟ��٫�b2��D��e\��\&�����4l�h���-1xK�w��z��p��%2 �1潟���lxN����o�-�E.�1=���ߢ.��4x�^aT�w>�v�e���A�e�0`�̩�[_Ҭ�}��]�9��d����Zf\��o�<��&����r���	q6�p9sd���ܩ��v�z�j)<@bv�����[U�EC��f�96���KM�W�׭�y?\��κ���4�k�Q�T�я}F��Q�␑}d6C�8�˖V�� �������ӝ�6�l	a����^��/�?
�      �      x������ � �      �      x������ � �            x������ � �      �   �   x�}�A�C1C��fd0��ݏ���c&m7�R�l��m�h��E@����~��ﶈ��6�3�@{/[�S�!��C�@4J@*��H��VBڝ�0���TQB�A�	xo(��v^��t̊�H��.B�T�]47/�l�:�mH��s���^��^&��1�F����H���������{��w�uu/������Dj�H�HM�H�HMރ�Dj���)�G����s��n)�n      �   C  x����n�0Ưӧ�	��%N^�{�=��&��	ҡ��B�¤�།���N���bn�4Em��;��߱�'��D�	�E�Tf�ܚ��̬���Z�^�qN�����5����f���3���N^��ŀdd��F�hk2�J��*3۞Z� �����M��]��+k����*�$g����o��m�����]j�A����ϥ�>Y�0|��ߧP�!Du!k� �atI�p>�]����?y�D���Оu����!@5�2�U1H�������3}Ei����A� �2�`���6X����=L�}A��훌R��5&�`�%����[�x�kD{;�3>B�GX�a��>V�J(�o�@8s�����CA��(;�I�7���&B���D���|
��Wӊ��騢��������/�$r>��Q�j��n}=lT�brZA	�@��ƿ�Q�<�1�@�X�M�z����4�;J���8��5���;�z��Ȓ�E�O߀k0z��;�W�nD�2Z��rQ�22P+�n�t�$�E05v���A��ay�dA,���;��N��(��٬����:�Vu��+�l�D_ �������ę����R����^���oĖ)H9��ꛯ{H̟J��m
X*%�ۤt
�g�؍e2@��j��<w�6I��s����w+3=ng���ѭEY��{���@�My��(3ؖ�g������'hO��D$�I�5�����l���F�q.{�q����<W���"N��EȼO�U�R}6R��!eW#^�
���/QB���:���_I60_��cZ\���S6
ԏ$�K�Ğ���d2�D�ۺ      �   B  x��[[o�~^��A �a�;�\��7׍� �4y�>���H��R��O�,���<����6���T��b{�o�%�9g����HJ�����]��̙s�ΙY/p�G/�hG?��V��A��~��E/���'O�������6���+�}O��(���6zO6�`�d~�����kx�G���FmǓ��LG�3�T$�o��(ͼ����,��ܹ�$<�s��W���2t����GN �/Y�>t� ���^N:��� l��s���]������n�l���h����;kkw>�[���+�3gmeuM}儡#	������ܺ1�y��|�|"I�d.�?$�sIw�v��H�4V<� �#`�������ޏaU[RV�ݚ������|��:�!%�.��=H<�e�Kr�؁!�lH��i��3cК�q�.Ƥk=������:��yN��}[��^b�tݻ�8]�t����SP��M�`����فqP�_$Ԛ�A���O����&��~��Aڜ��6C�ZB[Rj��Q+��U�U�Vvc����/�R�R�F��@�sJ(��~d�ݺ��~�n}u��"��L#� *ۀl�3�����0_��:��u�zZd���>�>�"[���ӉqW|RRk��z�sS��t��1,��F���_�y��zr�FX��߁�2��RyX�^�m������ry�v���[K�3�����Bcд��pV>"${���c��}Xy�s�ݗJ%�2 ������;���p�C�
0(u��д�3�囿��qӚ���ϱ�Q{F	yJ��E�<��Fg��£�7HGv���4��s��V�Ci��������g��k�X)�1�e�
~�]�1.���9aR�q�V1]�4�@�>1��S�}���{ʏX��!ŷB�a��m�2)�uC�t,E~�̎�3tk3�`??|�I@W�p�1�rb7k�4 �r ����6��<P�c��ܸ�%=�هd���@rR6�dFIF������Tj���	��G5M7͢.��m�zti@608�!�B"嬢7񭦋�DWT!<�zCv�}z'��(�ň~~��xz.k|ga�vD��:Qݽ&�#��w��֓��
���t�Z�KP�>L��A5���`�y�ai�iߟ�f���9y��8�0��F��	��U���K^�n�DN���T�H�	�����ā^A��~
9��c�ۂ3c7�T�Cl�G�Bg�]6J ȧ�	y���>��>�x��B���B�(W*�D.��X�\���&+p�:�ye#�����D�jB������:�N��c�M�)[�3r���b &Gdt�,�2��/8p�*�=�?S�A� a����KY�Y	sZMe��R�n|e�nS�4R�� �[6���j�+���7МƊp�YRq���]��&?e<�����[�L�8�׬G�I�`ܻ�ǎ���7Y'=�W7���ӓ��ҙ�:�0-i��I�e�$����Ӫ��
�jHP�s6\f�́���4�Y55r�;��U+�\H��2�ki�/y�	)�9DӰN&���CX����[D�ǃ�����zB0y*y���̀5c�O �{��E#�^gi>ۀ��,��)�O����9�m��)/ E�����ѱ����:d`�=�kג/��x��/iL��ٕ���{j����6>ӟ�f���y��sW���Θ�N��ůi�Ƈ�tUI�,y�t�!�P��S�����]L�~Fc���D��%n*'T3��K>�)Ꞃ?>��v��%*��h��4��!p�Li캓)��� f1�Px{��*�%~|�`�C�W���0	�r�!A��3M��-ؘ�SM��P@�½I �<����|x��K���z��e̢"�����(�.Z!���o����ݜ(�,}�)#h���p]�Q�O��7F,���!A�L�%Sc���
D���PI����RyD����abKc��3)�ϓ��r�E^c�s糕���_��v-����_���[@�ʀ܄F��������+�,�0r�:(�2�X�L��Ll�lf	����y�N�{���<��&����&7}$R,���B��2�b&�E���M�����k��h{,�1�kg��J\&��r��	���F`�����"����aT+<�Az�HҌ��tl�������+��ސ�6��6�{����"�(V�_'� vH2xk�!p\X�B��? _:>���T�t@͍�j�3��(��?�Y�ȂJwX��/����k�L����E���m�DO3�Ib�*�gewԇc�&	�\�f�M��[ �$���4��WO��.M�����YxdU���M^�G�O�Ρ���u��=�p%�,'����gB�>oq�8ef$K�C��z���f���/VW+MG�\i v
�laE��g��Ҳ����j�C����J��-��j�;�*�yqa����CV�[�A�R����++����T(o��b�������:�.<1y�Ӹ�:Lv;�k#�VV�Z3��u�呅UE�Y��ׅ�B@֖���?�3+)-mL���tg�3zO1h�v	�J��!O�	�JTE�"_U��!Pˢ�G�h�"KV6��.υ�C���rH/�̉ύ�js7�x/YrWY��-5��t3c�d�����lD�̹�fn!�<+�Z80Z�E���ԃT�$�VL�U�[�qi���~>n�F�@rp��I�#`�.U�S�Mm�N�@�ա��&͛}=@�&)�������� ��u}�84�^��ɰzS��	//��(�����*TRͅA3j�K�C�>y��(4Ǹ@��U�z�cR��1,tR]q��G䵬�Y������<��GJ��)�m�����%�?=�,>s<n'f�ڗN̚��g$f˖��*�'�쿳��m{�>0��q��*��m����{@��^ȱ*�h��k|��B:�� K�����RR� �%�f���%���9���A��<�.�yeٙY�_+�d1�7T�@���kn�s�Y���xnNp�s^�ݔ��M���Xr��w�H��KʺN�q���!j-�7(1�K�꿼����9Ki��/�9R���A�����e��s�y�uh֓�Ix��GT\y�%�>��"�bV�:���\Hm�RT&װ�C�r��M��l�c�扒<�yg�\0+��L��0=�_s��>��=�'�_{L�('/je��0��@u��tu�#�I�xI���"�k�R�%TQj���R����,*Wa��6��j��~�.���u��O�œo�Bj�A�I�	�
���*ׯݧ�d_�_R\
C�#?�S"� G%�\;G�}�R����z,      �     x����M1��o��
P��L�w�=��S �����)���(�,CE���9���q~;�䨗������\�!$=�������+�����x��h�)��J��C�?��$P[3��������S/��Ə՜z9ك�L^�;:[�jen85�ߣS͕�@�I^K�
&\M���Ŕ�E�k��a�X����s�����ŢI5ie���C�@��h����}�o����y��)ds��T�>}O���C��1J�"��I�q��;=?,��p�      �   �  x����nT1Eמ��ى��k���@| R'qUDg�R�~2�}H�ds|�s-+�#��6MPZJع
N)��l����'������p��������Z.1���p�4Q�Lt�:����F��g>�)���ܒ��(#*6J%Im�W,HG�j�̻q�>���oV�#�5Ks��:���r������oB	8��4t6F%ߧ#o�P\��F�[9�
��{�y�+�.�0���Ғm[�=zj��v���X�3�ȊA�;Iԙ��d�L���A3��^�O�JZkD��!���H��j�j�f�2R%y_��r�Ok޽����˛dk�<K���u�̾��s���:�$H�)!��}�{V��8^����z�q>����y���%�ɹcr"gCo�1��\�&�[��!l��B�x��@+d���T��������$��             x������ � �         P  x�͖��� ���}M���&���rX/}�E�����@m�(߀f��0`��k7�v���?�L�`7 6�:vR���Zcb�����z�Br��n�K�Èq�Z���s\3�q�,�w��T�������+��k?cg.zj̚�tW��8B���{@\,����.-E�;�V[��f"d�X��#o��A�Dh]��1z����k;"K��9�ހ�PG*�K��C�P�+QezgsQ�J�I1i�P_��z���@�;3O����T�P͛�5*Q���Qg�HL�S
ĝӹ�*L�2\a���Z����6k��         �   x���;
�0��zt�\��f�\"'p�"���"Ȉ5�c?A����f���c�%�D�X/�K)�՘�}�����`0Q�ȢPP~����QQ�-��EG���!�����cD��Z'T�d�BY��Te�jt��� �J�ک��h�1���2�            x������ � �            x�K��CF\��F(�=... �T     