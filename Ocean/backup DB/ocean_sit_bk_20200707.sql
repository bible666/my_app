PGDMP             
            x            ocean_sit_bk    10.0    12.2 �               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    137576    ocean_sit_bk    DATABASE     j   CREATE DATABASE ocean_sit_bk WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C' LC_CTYPE = 'C';
    DROP DATABASE ocean_sit_bk;
                postgres    false                       1255    137577    is_date(character varying)    FUNCTION     �   CREATE FUNCTION public.is_date(s character varying) RETURNS boolean
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
       public          postgres    false            �            1259    137578    activity_group    TABLE       CREATE TABLE public.activity_group (
    group_cd character varying(12) NOT NULL,
    description text,
    created_date timestamp without time zone NOT NULL,
    created character varying(12),
    updated_date timestamp without time zone,
    updated character varying(12)
);
 "   DROP TABLE public.activity_group;
       public            postgres    false            �            1259    137584    agpt_access_log    TABLE     S  CREATE TABLE public.agpt_access_log (
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
       public            postgres    false            �            1259    137590    agpt_agent_tax_rate    TABLE     �   CREATE TABLE public.agpt_agent_tax_rate (
    agent_code_7 character varying(7),
    branch_code character varying(4),
    tax_rate numeric(5,2),
    data_date timestamp without time zone
);
 '   DROP TABLE public.agpt_agent_tax_rate;
       public            postgres    false            �            1259    137593    agpt_inactive_policy_calculate    TABLE       CREATE TABLE public.agpt_inactive_policy_calculate (
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
       public            postgres    false            �            1259    137599    agpt_inactive_policy_detail    TABLE     @  CREATE TABLE public.agpt_inactive_policy_detail (
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
       public            postgres    false            �            1259    137605    agpt_inactive_policy_summary    TABLE       CREATE TABLE public.agpt_inactive_policy_summary (
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
       public            postgres    false            �            1259    137611    agpt_lookup_data    TABLE       CREATE TABLE public.agpt_lookup_data (
    key_group character varying(100) NOT NULL,
    key character varying(100) NOT NULL,
    value character varying(100),
    period_from character varying(10) NOT NULL,
    period_to character varying(10) NOT NULL
);
 $   DROP TABLE public.agpt_lookup_data;
       public            postgres    false            �            1259    137614    agpt_newcase_report    TABLE       CREATE TABLE public.agpt_newcase_report (
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
       public            postgres    false            �            1259    137620    agpt_persistency_detail    TABLE     G  CREATE TABLE public.agpt_persistency_detail (
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
       public            postgres    false            �            1259    137626    agpt_persistency_summary    TABLE     �  CREATE TABLE public.agpt_persistency_summary (
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
       public            postgres    false            �            1259    137632    agpt_salereportsub    TABLE     �  CREATE TABLE public.agpt_salereportsub (
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
       public            postgres    false            �            1259    137635    as400_lips_pspempno    TABLE     n   CREATE TABLE public.as400_lips_pspempno (
    empagt numeric(7,0) NOT NULL,
    empno character varying(5)
);
 '   DROP TABLE public.as400_lips_pspempno;
       public            postgres    false            �            1259    137638    biz_payment_customer    TABLE     �  CREATE TABLE public.biz_payment_customer (
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
       public            postgres    false            �            1259    137644    dm_agent_income    TABLE     �	  CREATE TABLE public.dm_agent_income (
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
       public            postgres    false            �            1259    137650    dm_agpt_period    TABLE     �   CREATE TABLE public.dm_agpt_period (
    period character varying(10) NOT NULL,
    start_date date,
    end_date date,
    finalized boolean,
    mt011 date,
    ppyy character varying(4),
    payment_date date
);
 "   DROP TABLE public.dm_agpt_period;
       public            postgres    false            �            1259    137653    dm_as400_phpagmt6    TABLE     �   CREATE TABLE public.dm_as400_phpagmt6 (
    "AGENT#" numeric(7,0) NOT NULL,
    agphon character varying(30),
    agmail character varying(35)
);
 %   DROP TABLE public.dm_as400_phpagmt6;
       public            postgres    false            �            1259    137656    dm_as400_phpmpno    TABLE     k   CREATE TABLE public.dm_as400_phpmpno (
    empagt numeric(7,0) NOT NULL,
    empno character varying(5)
);
 $   DROP TABLE public.dm_as400_phpmpno;
       public            postgres    false            �            1259    137659    dm_as400_pspagmt1    TABLE     �   CREATE TABLE public.dm_as400_pspagmt1 (
    "AGENT#" numeric(7,0) NOT NULL,
    agtitl character varying(50),
    agname character varying(50),
    aglsnm character varying(50)
);
 %   DROP TABLE public.dm_as400_pspagmt1;
       public            postgres    false            �            1259    137662    dm_as400_pspagmt4    TABLE     �   CREATE TABLE public.dm_as400_pspagmt4 (
    "AGENT#" numeric(7,0) NOT NULL,
    "AGREL#" numeric(7,0),
    "AGORG#" numeric(7,0),
    "AGPOS@" character varying(2),
    agpodt numeric(6,0)
);
 %   DROP TABLE public.dm_as400_pspagmt4;
       public            postgres    false            �            1259    137665    dm_as400_pspagmt6    TABLE     �  CREATE TABLE public.dm_as400_pspagmt6 (
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
       public            postgres    false            �            1259    137671    dm_as400_pspagtms    TABLE     �  CREATE TABLE public.dm_as400_pspagtms (
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
       public            postgres    false            �            1259    137677    dm_as400_pspslorg    TABLE     �   CREATE TABLE public.dm_as400_pspslorg (
    "SLUNT#" numeric(7,0) NOT NULL,
    "SLREL#" numeric(7,0),
    slunnm character varying(20)
);
 %   DROP TABLE public.dm_as400_pspslorg;
       public            postgres    false            �            1259    137680    dm_as400_pspslpos    TABLE     �   CREATE TABLE public.dm_as400_pspslpos (
    "AGPOS@" character varying(7) NOT NULL,
    agabpo character varying(20),
    agpost character varying(200)
);
 %   DROP TABLE public.dm_as400_pspslpos;
       public            postgres    false            �            1259    137683    dm_as400_ultsagic    TABLE     �   CREATE TABLE public.dm_as400_ultsagic (
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
       public            postgres    false            �            1259    137689    dm_ili_rider_master    TABLE       CREATE TABLE public.dm_ili_rider_master (
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
       public            postgres    false            �            1259    137695    dm_newcase_report    TABLE       CREATE TABLE public.dm_newcase_report (
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
       public            postgres    false            �            1259    137701    hermes_other_channel_payment    TABLE        CREATE TABLE public.hermes_other_channel_payment (
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
       public            postgres    false            �            1259    137704    hermes_req_bank_payment    TABLE     �  CREATE TABLE public.hermes_req_bank_payment (
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
       public            postgres    false            �            1259    137707    hermes_req_credit_payment    TABLE     �  CREATE TABLE public.hermes_req_credit_payment (
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
       public            postgres    false            �            1259    137710    hist_ili_rider_master    TABLE     `  CREATE TABLE public.hist_ili_rider_master (
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
       public            postgres    false            �            1259    137713    ili_policy_master    TABLE     �  CREATE TABLE public.ili_policy_master (
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
       public            postgres    false            �            1259    137719    lg_activity_agent    TABLE     �  CREATE TABLE public.lg_activity_agent (
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
       public            postgres    false            �            1259    137725 +   lg_activity_agent_activity_agent_log_id_seq    SEQUENCE     �   CREATE SEQUENCE public.lg_activity_agent_activity_agent_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 B   DROP SEQUENCE public.lg_activity_agent_activity_agent_log_id_seq;
       public          postgres    false    227                       0    0 +   lg_activity_agent_activity_agent_log_id_seq    SEQUENCE OWNED BY     {   ALTER SEQUENCE public.lg_activity_agent_activity_agent_log_id_seq OWNED BY public.lg_activity_agent.activity_agent_log_id;
          public          postgres    false    228            �            1259    137727    lg_activity_agent_data    TABLE     
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
       public            postgres    false            �            1259    137733 /   lg_activity_agent_data_activity_data_log_id_seq    SEQUENCE     �   CREATE SEQUENCE public.lg_activity_agent_data_activity_data_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 F   DROP SEQUENCE public.lg_activity_agent_data_activity_data_log_id_seq;
       public          postgres    false    229                       0    0 /   lg_activity_agent_data_activity_data_log_id_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.lg_activity_agent_data_activity_data_log_id_seq OWNED BY public.lg_activity_agent_data.activity_data_log_id;
          public          postgres    false    230            �            1259    137735    lg_activity_branch    TABLE     �  CREATE TABLE public.lg_activity_branch (
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
       public            postgres    false            �            1259    137738 -   lg_activity_branch_activity_branch_log_id_seq    SEQUENCE     �   CREATE SEQUENCE public.lg_activity_branch_activity_branch_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 D   DROP SEQUENCE public.lg_activity_branch_activity_branch_log_id_seq;
       public          postgres    false    231                       0    0 -   lg_activity_branch_activity_branch_log_id_seq    SEQUENCE OWNED BY        ALTER SEQUENCE public.lg_activity_branch_activity_branch_log_id_seq OWNED BY public.lg_activity_branch.activity_branch_log_id;
          public          postgres    false    232            �            1259    137740    lg_activity_detail    TABLE     �  CREATE TABLE public.lg_activity_detail (
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
       public            postgres    false            �            1259    137743 -   lg_activity_detail_activity_detail_log_id_seq    SEQUENCE     �   CREATE SEQUENCE public.lg_activity_detail_activity_detail_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 D   DROP SEQUENCE public.lg_activity_detail_activity_detail_log_id_seq;
       public          postgres    false    233                       0    0 -   lg_activity_detail_activity_detail_log_id_seq    SEQUENCE OWNED BY        ALTER SEQUENCE public.lg_activity_detail_activity_detail_log_id_seq OWNED BY public.lg_activity_detail.activity_detail_log_id;
          public          postgres    false    234            �            1259    137745    lg_activity_insurance    TABLE     �  CREATE TABLE public.lg_activity_insurance (
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
       public            postgres    false            �            1259    137751 3   lg_activity_insurance_activity_insurance_log_id_seq    SEQUENCE     �   CREATE SEQUENCE public.lg_activity_insurance_activity_insurance_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 J   DROP SEQUENCE public.lg_activity_insurance_activity_insurance_log_id_seq;
       public          postgres    false    235                       0    0 3   lg_activity_insurance_activity_insurance_log_id_seq    SEQUENCE OWNED BY     �   ALTER SEQUENCE public.lg_activity_insurance_activity_insurance_log_id_seq OWNED BY public.lg_activity_insurance.activity_insurance_log_id;
          public          postgres    false    236            �            1259    137753    lg_knows_access    TABLE     �  CREATE TABLE public.lg_knows_access (
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
       public            postgres    false            �            1259    137756 #   lg_knows_access_knows_access_id_seq    SEQUENCE     �   CREATE SEQUENCE public.lg_knows_access_knows_access_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.lg_knows_access_knows_access_id_seq;
       public          postgres    false    237                       0    0 #   lg_knows_access_knows_access_id_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public.lg_knows_access_knows_access_id_seq OWNED BY public.lg_knows_access.knows_access_id;
          public          postgres    false    238            �            1259    137758    lg_knows_history    TABLE     o  CREATE TABLE public.lg_knows_history (
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
       public            postgres    false            �            1259    137764 %   lg_knows_history_knows_history_id_seq    SEQUENCE     �   CREATE SEQUENCE public.lg_knows_history_knows_history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.lg_knows_history_knows_history_id_seq;
       public          postgres    false    239                       0    0 %   lg_knows_history_knows_history_id_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.lg_knows_history_knows_history_id_seq OWNED BY public.lg_knows_history.knows_history_id;
          public          postgres    false    240            �            1259    137766    lx_agent_token    TABLE     x  CREATE TABLE public.lx_agent_token (
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
       public            postgres    false            �            1259    137772 !   lx_agent_token_agent_token_id_seq    SEQUENCE     �   CREATE SEQUENCE public.lx_agent_token_agent_token_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.lx_agent_token_agent_token_id_seq;
       public          postgres    false    241                        0    0 !   lx_agent_token_agent_token_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.lx_agent_token_agent_token_id_seq OWNED BY public.lx_agent_token.agent_token_id;
          public          postgres    false    242            �            1259    137774    ms_admin_manage_branch    TABLE     C  CREATE TABLE public.ms_admin_manage_branch (
    email character varying(35) NOT NULL,
    branch_code character varying(8) NOT NULL,
    branch_name character varying(50),
    create_date timestamp with time zone,
    create_by character varying(25),
    active_flag character varying(1) DEFAULT 'Y'::character varying
);
 *   DROP TABLE public.ms_admin_manage_branch;
       public            postgres    false            �            1259    137778    ms_knows_group    TABLE     6  CREATE TABLE public.ms_knows_group (
    knows_group_id integer NOT NULL,
    group_name character varying(200),
    type character varying(1),
    create_date timestamp without time zone,
    create_by character varying(12),
    update_date timestamp without time zone,
    update_by character varying(12)
);
 "   DROP TABLE public.ms_knows_group;
       public            postgres    false            �            1259    137781 !   ms_knows_group_knows_group_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ms_knows_group_knows_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.ms_knows_group_knows_group_id_seq;
       public          postgres    false    244            !           0    0 !   ms_knows_group_knows_group_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE public.ms_knows_group_knows_group_id_seq OWNED BY public.ms_knows_group.knows_group_id;
          public          postgres    false    245            �            1259    137783 	   ms_period    TABLE     �   CREATE TABLE public.ms_period (
    period text NOT NULL,
    start_date date,
    end_date date,
    finalized text,
    mt011 date,
    ppyy text,
    payment_date text
);
    DROP TABLE public.ms_period;
       public            postgres    false            �            1259    137789    ms_position_report_mapping    TABLE     �   CREATE TABLE public.ms_position_report_mapping (
    position_code integer NOT NULL,
    "position" text,
    position_report text,
    position_abbr text
);
 .   DROP TABLE public.ms_position_report_mapping;
       public            postgres    false            �            1259    137795 
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
       public            postgres    false            �            1259    137801    people    TABLE     �   CREATE TABLE public.people (
    id integer NOT NULL,
    full_name character varying(255) NOT NULL,
    job_title character varying(255)
);
    DROP TABLE public.people;
       public            postgres    false            �            1259    137807    people_id_seq    SEQUENCE     �   CREATE SEQUENCE public.people_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.people_id_seq;
       public          postgres    false    249            "           0    0    people_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.people_id_seq OWNED BY public.people.id;
          public          postgres    false    250            �            1259    137809 
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
          public          postgres    false    251            �            1259    137815    st_rider    TABLE     �  CREATE TABLE public.st_rider (
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
       public            postgres    false            �            1259    137821    tablename_seq    SEQUENCE     v   CREATE SEQUENCE public.tablename_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.tablename_seq;
       public          postgres    false            �            1259    137823    tx_activity_agent    TABLE     �  CREATE TABLE public.tx_activity_agent (
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
       public            postgres    false            �            1259    137829 '   tx_activity_agent_activity_agent_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tx_activity_agent_activity_agent_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 >   DROP SEQUENCE public.tx_activity_agent_activity_agent_id_seq;
       public          postgres    false    254            $           0    0 '   tx_activity_agent_activity_agent_id_seq    SEQUENCE OWNED BY     s   ALTER SEQUENCE public.tx_activity_agent_activity_agent_id_seq OWNED BY public.tx_activity_agent.activity_agent_id;
          public          postgres    false    255                        1259    137831    tx_activity_branch    TABLE     �  CREATE TABLE public.tx_activity_branch (
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
       public            postgres    false                       1259    137834 )   tx_activity_branch_activity_branch_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tx_activity_branch_activity_branch_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 @   DROP SEQUENCE public.tx_activity_branch_activity_branch_id_seq;
       public          postgres    false    256            %           0    0 )   tx_activity_branch_activity_branch_id_seq    SEQUENCE OWNED BY     w   ALTER SEQUENCE public.tx_activity_branch_activity_branch_id_seq OWNED BY public.tx_activity_branch.activity_branch_id;
          public          postgres    false    257                       1259    137836    tx_activity_data    TABLE       CREATE TABLE public.tx_activity_data (
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
       public            postgres    false                       1259    137842 %   tx_activity_data_activity_data_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tx_activity_data_activity_data_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 <   DROP SEQUENCE public.tx_activity_data_activity_data_id_seq;
       public          postgres    false    258            &           0    0 %   tx_activity_data_activity_data_id_seq    SEQUENCE OWNED BY     o   ALTER SEQUENCE public.tx_activity_data_activity_data_id_seq OWNED BY public.tx_activity_data.activity_data_id;
          public          postgres    false    259                       1259    137844    tx_activity_detail    TABLE     �  CREATE TABLE public.tx_activity_detail (
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
       public            postgres    false                       1259    137847 )   tx_activity_detail_activity_detail_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tx_activity_detail_activity_detail_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 @   DROP SEQUENCE public.tx_activity_detail_activity_detail_id_seq;
       public          postgres    false    260            '           0    0 )   tx_activity_detail_activity_detail_id_seq    SEQUENCE OWNED BY     w   ALTER SEQUENCE public.tx_activity_detail_activity_detail_id_seq OWNED BY public.tx_activity_detail.activity_detail_id;
          public          postgres    false    261                       1259    137849    tx_activity_upload    TABLE     �  CREATE TABLE public.tx_activity_upload (
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
       public            postgres    false                       1259    137855 )   tx_activity_upload_activity_upload_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tx_activity_upload_activity_upload_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 @   DROP SEQUENCE public.tx_activity_upload_activity_upload_id_seq;
       public          postgres    false    262            (           0    0 )   tx_activity_upload_activity_upload_id_seq    SEQUENCE OWNED BY     w   ALTER SEQUENCE public.tx_activity_upload_activity_upload_id_seq OWNED BY public.tx_activity_upload.activity_upload_id;
          public          postgres    false    263                       1259    137857    tx_agent_income    TABLE     O
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
       public            postgres    false            	           1259    137863    tx_knows_data    TABLE     �  CREATE TABLE public.tx_knows_data (
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
       public            postgres    false            
           1259    137869    tx_knows_data_knows_data_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tx_knows_data_knows_data_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.tx_knows_data_knows_data_id_seq;
       public          postgres    false    265            )           0    0    tx_knows_data_knows_data_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE public.tx_knows_data_knows_data_id_seq OWNED BY public.tx_knows_data.knows_data_id;
          public          postgres    false    266                       1259    137871    tx_knows_upload    TABLE     t  CREATE TABLE public.tx_knows_upload (
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
       public            postgres    false                       1259    137874 #   tx_knows_upload_knows_upload_id_seq    SEQUENCE     �   CREATE SEQUENCE public.tx_knows_upload_knows_upload_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.tx_knows_upload_knows_upload_id_seq;
       public          postgres    false    267            *           0    0 #   tx_knows_upload_knows_upload_id_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public.tx_knows_upload_knows_upload_id_seq OWNED BY public.tx_knows_upload.knows_upload_id;
          public          postgres    false    268                       1259    137876    tx_newcase_report    TABLE       CREATE TABLE public.tx_newcase_report (
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
       public            postgres    false                       1259    137882    tx_permission_user    TABLE     �   CREATE TABLE public.tx_permission_user (
    username text NOT NULL,
    permission integer,
    create_date timestamp without time zone,
    create_by text,
    update_date timestamp without time zone,
    update_by text
);
 &   DROP TABLE public.tx_permission_user;
       public            postgres    false            �           2604    137888 '   lg_activity_agent activity_agent_log_id    DEFAULT     �   ALTER TABLE ONLY public.lg_activity_agent ALTER COLUMN activity_agent_log_id SET DEFAULT nextval('public.lg_activity_agent_activity_agent_log_id_seq'::regclass);
 V   ALTER TABLE public.lg_activity_agent ALTER COLUMN activity_agent_log_id DROP DEFAULT;
       public          postgres    false    228    227            �           2604    137889 +   lg_activity_agent_data activity_data_log_id    DEFAULT     �   ALTER TABLE ONLY public.lg_activity_agent_data ALTER COLUMN activity_data_log_id SET DEFAULT nextval('public.lg_activity_agent_data_activity_data_log_id_seq'::regclass);
 Z   ALTER TABLE public.lg_activity_agent_data ALTER COLUMN activity_data_log_id DROP DEFAULT;
       public          postgres    false    230    229            �           2604    137890 )   lg_activity_branch activity_branch_log_id    DEFAULT     �   ALTER TABLE ONLY public.lg_activity_branch ALTER COLUMN activity_branch_log_id SET DEFAULT nextval('public.lg_activity_branch_activity_branch_log_id_seq'::regclass);
 X   ALTER TABLE public.lg_activity_branch ALTER COLUMN activity_branch_log_id DROP DEFAULT;
       public          postgres    false    232    231            �           2604    137891 )   lg_activity_detail activity_detail_log_id    DEFAULT     �   ALTER TABLE ONLY public.lg_activity_detail ALTER COLUMN activity_detail_log_id SET DEFAULT nextval('public.lg_activity_detail_activity_detail_log_id_seq'::regclass);
 X   ALTER TABLE public.lg_activity_detail ALTER COLUMN activity_detail_log_id DROP DEFAULT;
       public          postgres    false    234    233            �           2604    137892 /   lg_activity_insurance activity_insurance_log_id    DEFAULT     �   ALTER TABLE ONLY public.lg_activity_insurance ALTER COLUMN activity_insurance_log_id SET DEFAULT nextval('public.lg_activity_insurance_activity_insurance_log_id_seq'::regclass);
 ^   ALTER TABLE public.lg_activity_insurance ALTER COLUMN activity_insurance_log_id DROP DEFAULT;
       public          postgres    false    236    235            �           2604    137893    lg_knows_access knows_access_id    DEFAULT     �   ALTER TABLE ONLY public.lg_knows_access ALTER COLUMN knows_access_id SET DEFAULT nextval('public.lg_knows_access_knows_access_id_seq'::regclass);
 N   ALTER TABLE public.lg_knows_access ALTER COLUMN knows_access_id DROP DEFAULT;
       public          postgres    false    238    237            �           2604    137894 !   lg_knows_history knows_history_id    DEFAULT     �   ALTER TABLE ONLY public.lg_knows_history ALTER COLUMN knows_history_id SET DEFAULT nextval('public.lg_knows_history_knows_history_id_seq'::regclass);
 P   ALTER TABLE public.lg_knows_history ALTER COLUMN knows_history_id DROP DEFAULT;
       public          postgres    false    240    239            �           2604    137895    lx_agent_token agent_token_id    DEFAULT     �   ALTER TABLE ONLY public.lx_agent_token ALTER COLUMN agent_token_id SET DEFAULT nextval('public.lx_agent_token_agent_token_id_seq'::regclass);
 L   ALTER TABLE public.lx_agent_token ALTER COLUMN agent_token_id DROP DEFAULT;
       public          postgres    false    242    241            �           2604    137896    ms_knows_group knows_group_id    DEFAULT     �   ALTER TABLE ONLY public.ms_knows_group ALTER COLUMN knows_group_id SET DEFAULT nextval('public.ms_knows_group_knows_group_id_seq'::regclass);
 L   ALTER TABLE public.ms_knows_group ALTER COLUMN knows_group_id DROP DEFAULT;
       public          postgres    false    245    244            �           2604    137897 	   people id    DEFAULT     f   ALTER TABLE ONLY public.people ALTER COLUMN id SET DEFAULT nextval('public.people_id_seq'::regclass);
 8   ALTER TABLE public.people ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    250    249            �           2604    137898 #   tx_activity_agent activity_agent_id    DEFAULT     �   ALTER TABLE ONLY public.tx_activity_agent ALTER COLUMN activity_agent_id SET DEFAULT nextval('public.tx_activity_agent_activity_agent_id_seq'::regclass);
 R   ALTER TABLE public.tx_activity_agent ALTER COLUMN activity_agent_id DROP DEFAULT;
       public          postgres    false    255    254            �           2604    137899 %   tx_activity_branch activity_branch_id    DEFAULT     �   ALTER TABLE ONLY public.tx_activity_branch ALTER COLUMN activity_branch_id SET DEFAULT nextval('public.tx_activity_branch_activity_branch_id_seq'::regclass);
 T   ALTER TABLE public.tx_activity_branch ALTER COLUMN activity_branch_id DROP DEFAULT;
       public          postgres    false    257    256            �           2604    137900 !   tx_activity_data activity_data_id    DEFAULT     �   ALTER TABLE ONLY public.tx_activity_data ALTER COLUMN activity_data_id SET DEFAULT nextval('public.tx_activity_data_activity_data_id_seq'::regclass);
 P   ALTER TABLE public.tx_activity_data ALTER COLUMN activity_data_id DROP DEFAULT;
       public          postgres    false    259    258            �           2604    137901 %   tx_activity_detail activity_detail_id    DEFAULT     �   ALTER TABLE ONLY public.tx_activity_detail ALTER COLUMN activity_detail_id SET DEFAULT nextval('public.tx_activity_detail_activity_detail_id_seq'::regclass);
 T   ALTER TABLE public.tx_activity_detail ALTER COLUMN activity_detail_id DROP DEFAULT;
       public          postgres    false    261    260            �           2604    137902 %   tx_activity_upload activity_upload_id    DEFAULT     �   ALTER TABLE ONLY public.tx_activity_upload ALTER COLUMN activity_upload_id SET DEFAULT nextval('public.tx_activity_upload_activity_upload_id_seq'::regclass);
 T   ALTER TABLE public.tx_activity_upload ALTER COLUMN activity_upload_id DROP DEFAULT;
       public          postgres    false    263    262            �           2604    137903    tx_knows_data knows_data_id    DEFAULT     �   ALTER TABLE ONLY public.tx_knows_data ALTER COLUMN knows_data_id SET DEFAULT nextval('public.tx_knows_data_knows_data_id_seq'::regclass);
 J   ALTER TABLE public.tx_knows_data ALTER COLUMN knows_data_id DROP DEFAULT;
       public          postgres    false    266    265            �           2604    137904    tx_knows_upload knows_upload_id    DEFAULT     �   ALTER TABLE ONLY public.tx_knows_upload ALTER COLUMN knows_upload_id SET DEFAULT nextval('public.tx_knows_upload_knows_upload_id_seq'::regclass);
 N   ALTER TABLE public.tx_knows_upload ALTER COLUMN knows_upload_id DROP DEFAULT;
       public          postgres    false    268    267            �          0    137578    activity_group 
   TABLE DATA           m   COPY public.activity_group (group_cd, description, created_date, created, updated_date, updated) FROM stdin;
    public          postgres    false    196   ��      �          0    137584    agpt_access_log 
   TABLE DATA           �   COPY public.agpt_access_log (id, username, access_datetime, access_menu, access_url, user_ip, user_browser, user_browser_version, user_browser_os, user_session_id, region, branch_code, branch_name) FROM stdin;
    public          postgres    false    197   ��      �          0    137590    agpt_agent_tax_rate 
   TABLE DATA           ]   COPY public.agpt_agent_tax_rate (agent_code_7, branch_code, tax_rate, data_date) FROM stdin;
    public          postgres    false    198   �      �          0    137593    agpt_inactive_policy_calculate 
   TABLE DATA           �  COPY public.agpt_inactive_policy_calculate (id, period, branch_code, branch_name, headmn_code_7, headmn_name, manager_code_7, manager_name, asst_manager_code_7, asst_manager_name, agent_code_7, agent_code_5, agent_name, "position", policy_target, premium_target, policy_can_be, premium_can_be, persistency, csv_created_date, csv_created_by, _audit_filename, _audit_filemod, _audit_filesize, _audit_created) FROM stdin;
    public          postgres    false    199   6�      �          0    137599    agpt_inactive_policy_detail 
   TABLE DATA           �  COPY public.agpt_inactive_policy_detail (id, period, branch_code, branch_name, headmn_code_7, headmn_name, manager_code_7, manager_name, asst_manager_code_7, asst_manager_name, supervisor_code_7, supervisor_name, agent_code_7, agent_name, policy_no, premium_can_be, premium_month, premium_year, sum_assured, last_grace_period_date, premium_status, premium_last_period_status, plan_name, commencement_date, la_name_surname, phone1, phone2, mobile1, mobile2, paid_to_date, current_agent_code, current_agent_name, current_agent_branch, csv_created_date, csv_created_by, _audit_filename, _audit_filemod, _audit_filesize, _audit_created) FROM stdin;
    public          postgres    false    200   S�      �          0    137605    agpt_inactive_policy_summary 
   TABLE DATA           ?  COPY public.agpt_inactive_policy_summary (id, period, branch_code, branch_name, agent_code_7, agent_code_5, agent_name, "position", policy_target, premium_target, policy_can_be, premium_can_be, persistency, csv_created_date, csv_created_by, _audit_filename, _audit_filemod, _audit_filesize, _audit_created) FROM stdin;
    public          postgres    false    201   9      �          0    137611    agpt_lookup_data 
   TABLE DATA           Y   COPY public.agpt_lookup_data (key_group, key, value, period_from, period_to) FROM stdin;
    public          postgres    false    202   V      �          0    137614    agpt_newcase_report 
   TABLE DATA           2  COPY public.agpt_newcase_report (id, period, region, branch_code, branch_name, policy_type, policy_no, cust_id, plan_code, plan_name, agent_code_7, agent_name, "position", commission_first, policy_status, la_age, effective_date_from, effective_date_to, sum_assured, premium, payment_mode, last_pay_period_date, la_name_surname, id_no, occupation_group, occupation, address, subdistrict, district, province, zipcode, phone1, phone2, mobile1, mobile2, csv_created_date, csv_created_by, _audit_filename, _audit_filemod, _audit_filesize, _audit_created) FROM stdin;
    public          postgres    false    203   s      �          0    137620    agpt_persistency_detail 
   TABLE DATA             COPY public.agpt_persistency_detail (id, period, branch_code, branch_name, headmn_code_7, headmn_code_5, headmn_name, manager_code_7, manager_code_5, manager_name, supervisor_code_7, supervisor_code_5, supervisor_name, agent_code_7, agent_code_5, agent_name, policy_no, policy_type, premium_target, premium_can_be, sum_assure, premium_status, plan_name, commencement_date, la_name_surname, paid_to_date, plan_code, csv_created_date, csv_created_by, _audit_filename, _audit_filemod, _audit_filesize, _audit_created) FROM stdin;
    public          postgres    false    204   �      �          0    137626    agpt_persistency_summary 
   TABLE DATA           �  COPY public.agpt_persistency_summary (id, period, branch_code, branch_name, headmn_code_7, headmn_code_5, headmn_name, headmn_premium_can_be, headmn_premium_target, headmn_persistency, manager_code_7, manager_code_5, manager_name, manager_premium_can_be, manager_premium_target, manager_persistency, supervisor_code_7, supervisor_code_5, supervisor_name, supervisor_premium_can_be, supervisor_premium_target, supervisor_persistency, agent_code_7, agent_code_5, agent_name, agent_premium_can_be, agent_premium_target, agent_persistency, csv_created_date, csv_created_by, _audit_filename, _audit_filemod, _audit_filesize, _audit_created) FROM stdin;
    public          postgres    false    205   �      �          0    137632    agpt_salereportsub 
   TABLE DATA           �  COPY public.agpt_salereportsub ("mPeriod", "mName", "mBranch", "mAreaGroup", "mCode5", "mCode7", "mPosition", "mSystem", "mNewCaseNo", "mCreamPrem", "mFirstPAPrem", "mCoffeePrem", "mFirstCom", "mPnewcB", "mPinf2B", "mInfP2", "mSecondCom", "mThirdCom", "Mgpro46", "Mgpro47", "Mgpro48", "Mgpro48A", "Mgpro50", "Mgpro51", "mSumOV", "aPeriod", "aBranch", "aCode5", "aMCode5", "aCode7", "aPosition", "aName", "aSystem", "aNewCaseNo", "aFirstYearPrem", "aFirstCom", "aFirstPAPrem", "aSecondCom", "aThirdCom", "aCreamPrem", "aCoffeePrem", "aBonus", "aBonus3p", "aKeep", "aConserv", "aBonusNewAgent", "aCreateNewAgent", "aSumOV", "aPinf2B", "aPnewcB", "aInfP2", a7, "mMab") FROM stdin;
    public          postgres    false    206   �      �          0    137635    as400_lips_pspempno 
   TABLE DATA           <   COPY public.as400_lips_pspempno (empagt, empno) FROM stdin;
    public          postgres    false    207   �      �          0    137638    biz_payment_customer 
   TABLE DATA           E  COPY public.biz_payment_customer (id, branch_code, deduct_date, bank_account, bank_account_name, policy_type, policy_no, bizpayment_channel, gen_giro, mode_payment, bank_date, upload_date, status_pay, gen_date, send_r_biz_payment, status_group, transaction_date, created_date, updated_date, value_hash, key_hash) FROM stdin;
    public          postgres    false    208   x      �          0    137644    dm_agent_income 
   TABLE DATA             COPY public.dm_agent_income (id, period, region, branch_code, branch_name, head_business_code_7, head_business_name, headmn_code_7, headmn_name, manager_code_7, manager_name, agent_code_7, agent_status, agent_name, "position", position_group, personal_id, occupation, occupation_group, education, education_group, agent_start_date, appointed_year_desc, agent_age, agent_age_duration, gender, working_age, position_date_current, position_age, license, license_expired_date, appointed_period, recruiter_code_7, recruiter_name, recruiter_position, manager_period_adjust, manager_adjust_desc, supervisor_period_adjust, supervisor_adjust_desc, premium_cream, premium_pa, premium_coffee, premium_total, premium_portfolio, new_case_ord_ind, new_case_pa, commission_first, commission_first_level, commission_next_year, premium_can_be, premium_target, persistency, appointed_agent_amount, keep_amount, ov_supervisor, ov_manager, csv_created_date, csv_created_by, _audit_filename, _audit_filemod, _audit_filesize, _audit_created) FROM stdin;
    public          postgres    false    209   �      �          0    137650    dm_agpt_period 
   TABLE DATA           l   COPY public.dm_agpt_period (period, start_date, end_date, finalized, mt011, ppyy, payment_date) FROM stdin;
    public          postgres    false    210   �.      �          0    137653    dm_as400_phpagmt6 
   TABLE DATA           E   COPY public.dm_as400_phpagmt6 ("AGENT#", agphon, agmail) FROM stdin;
    public          postgres    false    211   /      �          0    137656    dm_as400_phpmpno 
   TABLE DATA           9   COPY public.dm_as400_phpmpno (empagt, empno) FROM stdin;
    public          postgres    false    212    2      �          0    137659    dm_as400_pspagmt1 
   TABLE DATA           M   COPY public.dm_as400_pspagmt1 ("AGENT#", agtitl, agname, aglsnm) FROM stdin;
    public          postgres    false    213   =2      �          0    137662    dm_as400_pspagmt4 
   TABLE DATA           [   COPY public.dm_as400_pspagmt4 ("AGENT#", "AGREL#", "AGORG#", "AGPOS@", agpodt) FROM stdin;
    public          postgres    false    214   (3      �          0    137665    dm_as400_pspagmt6 
   TABLE DATA           �   COPY public.dm_as400_pspagmt6 ("AGENT#", agphon, agmail, agidex, agacdr, agacum, agacpv, agfrnm, agmonm, agmrst, agspnm, agofnm, agofod, agofov, aggroc, aggrop, aggrof, aggrog, agidmg, agchil) FROM stdin;
    public          postgres    false    215   �;      �          0    137671    dm_as400_pspagtms 
   TABLE DATA           i  COPY public.dm_as400_pspagtms (agtnum, agent7, brnno, agtttl, agtnam, agtsnm, agtnnm, agtsex, poscod, agtidn, agtids, agtide, agttxn, agtlcn, agtlcs, agtlce, agtlcp, agttax, agtcol, agtfee, agtrsg, agtrsd, agtclv, agtrtn, agtrl5, agttyp, agtinc, agtphn, agtpvb, agtpvn, agtpal, agtprd, agtpsd, agtpdt, agtppv, agtptc, agtshn, agtsvb, agtsvn, agtsal, agtsrd, agtssd, agtsdt, agtspv, agtstc, agttel, agtcph, agtlid, agteml, agtbd, agtage, agtbld, agtedu, agtocc, agtmrt, agtspn, agtftn, agtmtn, agtrno, orgcod, agtact, credte, cretme, creuby, upddte, updtme, upduby, agtstd, agtsep, agtbkn, agtchd, agtrst) FROM stdin;
    public          postgres    false    216   /<      �          0    137677    dm_as400_pspslorg 
   TABLE DATA           G   COPY public.dm_as400_pspslorg ("SLUNT#", "SLREL#", slunnm) FROM stdin;
    public          postgres    false    217   L<      �          0    137680    dm_as400_pspslpos 
   TABLE DATA           E   COPY public.dm_as400_pspslpos ("AGPOS@", agabpo, agpost) FROM stdin;
    public          postgres    false    218   �K      �          0    137683    dm_as400_ultsagic 
   TABLE DATA           �   COPY public.dm_as400_ultsagic (agntnm, agicvc, iclvnm, dbgndt, dexpdt, cretdt, cretim, crbynm, updadt, updtim, upbyvc) FROM stdin;
    public          postgres    false    219   JR      �          0    137689    dm_ili_rider_master 
   TABLE DATA           �   COPY public.dm_ili_rider_master (policy_no, policy_type, rider_code, commencement_date, maturity_date, sum_assured, premium_amount, extra_premium, created_date, updated_date, value_hash, key_hash, pay_to, next_paid_date) FROM stdin;
    public          postgres    false    220   �R      �          0    137695    dm_newcase_report 
   TABLE DATA           0  COPY public.dm_newcase_report (id, region, branch_code, branch_name, policy_type, policy_no, cust_id, plan_code, plan_name, agent_code_7, agent_name, "position", commission_first, policy_status, la_age, effective_date_from, effective_date_to, sum_assured, premium, payment_mode, last_pay_period_date, la_name_surname, id_no, occupation_group, occupation, address, subdistrict, district, province, zipcode, phone1, phone2, mobile1, mobile2, period, csv_created_date, csv_created_by, _audit_filename, _audit_filemod, _audit_filesize, _audit_created) FROM stdin;
    public          postgres    false    221   �]      �          0    137701    hermes_other_channel_payment 
   TABLE DATA           �   COPY public.hermes_other_channel_payment (policy_no, policy_type, payment_mode, is_premium_card, is_notice_letter, is_barcode_sms, register_date, created_date, updated_date, value_hash, key_hash, case_type) FROM stdin;
    public          postgres    false    222   ��      �          0    137704    hermes_req_bank_payment 
   TABLE DATA           �   COPY public.hermes_req_bank_payment (policy_no, policy_type, payment_mode, register_date, created_date, updated_date, value_hash, key_hash, payment_cut, account_name, account_no, type_deposit, status_code, first_cut_date, send_payment_cut) FROM stdin;
    public          postgres    false    223   ��      �          0    137707    hermes_req_credit_payment 
   TABLE DATA             COPY public.hermes_req_credit_payment (policy_no, policy_type, payment_mode, register_date, created_date, updated_date, value_hash, key_hash, status_code, first_cut_date, cut_type, card_issued_bank, card_type, card_name, card_number, card_expiry, send_payment_cut) FROM stdin;
    public          postgres    false    224   ˫      �          0    137710    hist_ili_rider_master 
   TABLE DATA           �   COPY public.hist_ili_rider_master (policy_no, policy_type, rider_code, commencement_date, maturity_date, sum_assured, premium_amount, extra_premium, created_date, updated_date, value_hash, key_hash, pay_to, next_paid_date) FROM stdin;
    public          postgres    false    225   �      �          0    137713    ili_policy_master 
   TABLE DATA           $  COPY public.ili_policy_master (policy_no, policy_type, policy_year, policy_status, commencement_date, maturity_date, lapse_date, next_paid_date, fully_paid_date, pay_from, pay_to, product_code, sum_assured, premium_amount, extra_premium, payment_mode, payment_term, agent_code, id_no, first_name, last_name, birthdate, gender_code, card_type, title_desc, origin_desc, payment_channel, title_code, marital_status, marital_status_desc, origin, nationality, nationality_desc, religion, religion_desc, education, education_desc, occupation_code, occupation_desc, phone1, ext1, phone2, ext2, mobile1, mobile2, age_at_comm_date, annual_income1, annual_income2, laser_code, dopa_check_digit, monthly_income, email, cust_code, created_date, updated_date, value_hash, key_hash, branch_no, policy_org) FROM stdin;
    public          postgres    false    226   �      �          0    137719    lg_activity_agent 
   TABLE DATA           �   COPY public.lg_activity_agent (activity_agent_log_id, activity_agent_id, fk_activity_data, agent_7, agent_title, agent_name, active_flag, create_date, create_by, update_date, update_by) FROM stdin;
    public          postgres    false    227   �h      �          0    137727    lg_activity_agent_data 
   TABLE DATA           �  COPY public.lg_activity_agent_data (activity_data_log_id, fk_activity_data_id, activity_name, activity_body, cover_image, policy_period_start, policy_period_end, activity_type, calculate_type, view_type, summary_type, org_all_flag, position_all_flag, policy_type_ord_flag, policy_type_ind_flag, policy_type_pa_flag, policy_type_ul_flag, fyp_flag, fyc_flag, sum_insured, min_insurance_case, min_amount, active_flag, create_date, create_by) FROM stdin;
    public          postgres    false    229   i      �          0    137735    lg_activity_branch 
   TABLE DATA           �   COPY public.lg_activity_branch (activity_branch_log_id, fk_activity_branch_id, fk_activity_data_id, branch_code, branch_name, region_code, region_name, active_flag, create_date, create_by) FROM stdin;
    public          postgres    false    231   %i      �          0    137740    lg_activity_detail 
   TABLE DATA           �   COPY public.lg_activity_detail (activity_detail_log_id, fk_activity_detail_id, fk_activity_data_id, running_no, min_value, max_value, award_type, each_value, award, active_flag, create_date, create_by) FROM stdin;
    public          postgres    false    233   Bi      �          0    137745    lg_activity_insurance 
   TABLE DATA           �   COPY public.lg_activity_insurance (activity_insurance_log_id, fk_activity_insurance_id, fk_activity_data_id, insurance_code, insurance_name, cover_year, payment_year, insurance_type, sub_type, active_flag, create_date, create_by) FROM stdin;
    public          postgres    false    235   _i      �          0    137753    lg_knows_access 
   TABLE DATA           �   COPY public.lg_knows_access (knows_access_id, fk_knows_data, agent_code, accepted_date, read_date, created, create_by, updated, update_by) FROM stdin;
    public          postgres    false    237   |i      �          0    137758    lg_knows_history 
   TABLE DATA           �   COPY public.lg_knows_history (knows_history_id, fk_knows_data, types, owner_id, fk_knows_group, title, body, show_date, start_date, end_date, status, piority, created, create_by, updated, update_by) FROM stdin;
    public          postgres    false    239   �i      �          0    137766    lx_agent_token 
   TABLE DATA           �   COPY public.lx_agent_token (agent_token_id, username, generate_date, agent_code, agent_name, branch_code, branch_name, position_group, "position", license, license_expire, created, create_by, updated, update_by) FROM stdin;
    public          postgres    false    241   �i      �          0    137774    ms_admin_manage_branch 
   TABLE DATA           v   COPY public.ms_admin_manage_branch (email, branch_code, branch_name, create_date, create_by, active_flag) FROM stdin;
    public          postgres    false    243   �i      �          0    137778    ms_knows_group 
   TABLE DATA           z   COPY public.ms_knows_group (knows_group_id, group_name, type, create_date, create_by, update_date, update_by) FROM stdin;
    public          postgres    false    244   [�      �          0    137783 	   ms_period 
   TABLE DATA           g   COPY public.ms_period (period, start_date, end_date, finalized, mt011, ppyy, payment_date) FROM stdin;
    public          postgres    false    246   u�      �          0    137789    ms_position_report_mapping 
   TABLE DATA           o   COPY public.ms_position_report_mapping (position_code, "position", position_report, position_abbr) FROM stdin;
    public          postgres    false    247   ��      �          0    137795 
   ms_product 
   TABLE DATA           6  COPY public.ms_product (product_code, product_category, product_type, product_name, product_plan, type, subtype, payment_year, payment_type, cover_year, cover_type, premium_per_suminsure, healthcheck_flag, have_wp, gender, start_date, end_date, active_flag, modify_date, product_line, saving_flag) FROM stdin;
    public          postgres    false    248   /�      �          0    137801    people 
   TABLE DATA           :   COPY public.people (id, full_name, job_title) FROM stdin;
    public          postgres    false    249   ?�      �          0    137809 
   st_product 
   TABLE DATA           )  COPY public.st_product (product_code, product_category, product_type, product_name, product_plan, type, subtype, payment_year, payment_type, cover_year, cover_type, premium_per_suminsure, healthcheck_flag, have_wp, gender, start_date, end_date, active_flag, modify_date, product_line) FROM stdin;
    public          postgres    false    251   \�                 0    137815    st_rider 
   TABLE DATA           �   COPY public.st_rider (rider_code, rider_category, rider_type, rider_name, type, short_name, active_flag, modify_date) FROM stdin;
    public          postgres    false    252   y�                0    137823    tx_activity_agent 
   TABLE DATA           �   COPY public.tx_activity_agent (activity_agent_id, fk_activity_data, agent_7, agent_title, agent_name, active_flag, create_date, create_by, update_date, update_by) FROM stdin;
    public          postgres    false    254   ��                0    137831    tx_activity_branch 
   TABLE DATA           �   COPY public.tx_activity_branch (activity_branch_id, fk_activity_data_id, branch_code, branch_name, region_code, region_name, active_flag, create_date, create_by, update_date, update_by) FROM stdin;
    public          postgres    false    256   ��                0    137836    tx_activity_data 
   TABLE DATA           *  COPY public.tx_activity_data (activity_data_id, activity_name, activity_body, cover_image, policy_period_start, policy_period_end, policy_date_start, policy_date_end, priority_flag, activity_type, calculate_type, view_number, summary_type, org_all_flag, position_all_flag, policy_type_ord_flag, policy_type_ind_flag, policy_type_pa_flag, policy_type_ul_flag, policy_type_rider_flag, rider_condition_flag, view_type, fyp_flag, fyc_flag, sum_insured, min_insurance_case, min_amount, active_flag, create_date, create_by, update_date, update_by) FROM stdin;
    public          postgres    false    258   ��                0    137844    tx_activity_detail 
   TABLE DATA           �   COPY public.tx_activity_detail (activity_detail_id, fk_activity_data, running_no, min_value, max_value, award_type, each_value, award, active_flag, create_date, create_by, update_date, update_by) FROM stdin;
    public          postgres    false    260   2�      
          0    137849    tx_activity_upload 
   TABLE DATA           �   COPY public.tx_activity_upload (activity_upload_id, fk_activity_data, upload_path, file_name, status, file_type, create_date, create_by, update_date, update_by) FROM stdin;
    public          postgres    false    262   Y�                0    137857    tx_agent_income 
   TABLE DATA           @  COPY public.tx_agent_income (id, period, region, branch_code, branch_name, head_business_code_7, head_business_name, headmn_code_7, headmn_name, manager_code_7, manager_name, agent_code_7, agent_status, agent_name, "position", position_group, personal_id, occupation, occupation_group, education, education_group, agent_start_date, appointed_year_desc, agent_age, agent_age_duration, gender, working_age, position_date_current, position_age, license, license_expired_date, appointed_period, recruiter_code_7, recruiter_name, recruiter_position, manager_period_adjust, manager_adjust_desc, supervisor_period_adjust, supervisor_adjust_desc, premium_cream, premium_pa, premium_coffee, premium_total, premium_portfolio, new_case_ord_ind, new_case_pa, commission_first, commission_first_level, commission_next_year, premium_can_be, premium_target, persistency, appointed_agent_amount, keep_amount, ov_supervisor, ov_manager, csv_created_date, csv_created_by, _audit_filename, _audit_filemod, _audit_filesize, _audit_created, asst_manager_code_7, asst_manager_name, position_level) FROM stdin;
    public          postgres    false    264    �                0    137863    tx_knows_data 
   TABLE DATA           �   COPY public.tx_knows_data (knows_data_id, types, owner_id, fk_knows_group, title, body, show_date, start_date, end_date, status, priority, create_date, create_by, update_date, update_by, cover_image, approve_date, approve_by, active_flag) FROM stdin;
    public          postgres    false    265   =�                0    137871    tx_knows_upload 
   TABLE DATA           �   COPY public.tx_knows_upload (knows_upload_id, fk_knows_data, upload_path, file_name, status, created, create_by, updated, update_by) FROM stdin;
    public          postgres    false    267   ��                0    137876    tx_newcase_report 
   TABLE DATA           0  COPY public.tx_newcase_report (id, period, region, branch_code, branch_name, policy_type, policy_no, cust_id, plan_code, plan_name, agent_code_7, agent_name, "position", commission_first, policy_status, la_age, effective_date_from, effective_date_to, sum_assured, premium, payment_mode, last_pay_period_date, la_name_surname, id_no, occupation_group, occupation, address, subdistrict, district, province, zipcode, phone1, phone2, mobile1, mobile2, csv_created_date, csv_created_by, _audit_filename, _audit_filemod, _audit_filesize, _audit_created) FROM stdin;
    public          postgres    false    269   K�                0    137882    tx_permission_user 
   TABLE DATA           r   COPY public.tx_permission_user (username, permission, create_date, create_by, update_date, update_by) FROM stdin;
    public          postgres    false    270   h�      +           0    0 +   lg_activity_agent_activity_agent_log_id_seq    SEQUENCE SET     Z   SELECT pg_catalog.setval('public.lg_activity_agent_activity_agent_log_id_seq', 1, false);
          public          postgres    false    228            ,           0    0 /   lg_activity_agent_data_activity_data_log_id_seq    SEQUENCE SET     ^   SELECT pg_catalog.setval('public.lg_activity_agent_data_activity_data_log_id_seq', 1, false);
          public          postgres    false    230            -           0    0 -   lg_activity_branch_activity_branch_log_id_seq    SEQUENCE SET     \   SELECT pg_catalog.setval('public.lg_activity_branch_activity_branch_log_id_seq', 1, false);
          public          postgres    false    232            .           0    0 -   lg_activity_detail_activity_detail_log_id_seq    SEQUENCE SET     \   SELECT pg_catalog.setval('public.lg_activity_detail_activity_detail_log_id_seq', 1, false);
          public          postgres    false    234            /           0    0 3   lg_activity_insurance_activity_insurance_log_id_seq    SEQUENCE SET     b   SELECT pg_catalog.setval('public.lg_activity_insurance_activity_insurance_log_id_seq', 1, false);
          public          postgres    false    236            0           0    0 #   lg_knows_access_knows_access_id_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.lg_knows_access_knows_access_id_seq', 1, false);
          public          postgres    false    238            1           0    0 %   lg_knows_history_knows_history_id_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.lg_knows_history_knows_history_id_seq', 1, false);
          public          postgres    false    240            2           0    0 !   lx_agent_token_agent_token_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.lx_agent_token_agent_token_id_seq', 1, false);
          public          postgres    false    242            3           0    0 !   ms_knows_group_knows_group_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('public.ms_knows_group_knows_group_id_seq', 13, true);
          public          postgres    false    245            4           0    0    people_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.people_id_seq', 4, true);
          public          postgres    false    250            5           0    0    tablename_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.tablename_seq', 1, false);
          public          postgres    false    253            6           0    0 '   tx_activity_agent_activity_agent_id_seq    SEQUENCE SET     V   SELECT pg_catalog.setval('public.tx_activity_agent_activity_agent_id_seq', 1, false);
          public          postgres    false    255            7           0    0 )   tx_activity_branch_activity_branch_id_seq    SEQUENCE SET     X   SELECT pg_catalog.setval('public.tx_activity_branch_activity_branch_id_seq', 1, false);
          public          postgres    false    257            8           0    0 %   tx_activity_data_activity_data_id_seq    SEQUENCE SET     T   SELECT pg_catalog.setval('public.tx_activity_data_activity_data_id_seq', 1, false);
          public          postgres    false    259            9           0    0 )   tx_activity_detail_activity_detail_id_seq    SEQUENCE SET     X   SELECT pg_catalog.setval('public.tx_activity_detail_activity_detail_id_seq', 1, false);
          public          postgres    false    261            :           0    0 )   tx_activity_upload_activity_upload_id_seq    SEQUENCE SET     X   SELECT pg_catalog.setval('public.tx_activity_upload_activity_upload_id_seq', 1, false);
          public          postgres    false    263            ;           0    0    tx_knows_data_knows_data_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('public.tx_knows_data_knows_data_id_seq', 20, true);
          public          postgres    false    266            <           0    0 #   tx_knows_upload_knows_upload_id_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.tx_knows_upload_knows_upload_id_seq', 20, true);
          public          postgres    false    268                       2606    137906 (   ili_policy_master ILI_POLICY_MASTER_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public.ili_policy_master
    ADD CONSTRAINT "ILI_POLICY_MASTER_pkey" PRIMARY KEY (policy_no);
 T   ALTER TABLE ONLY public.ili_policy_master DROP CONSTRAINT "ILI_POLICY_MASTER_pkey";
       public            postgres    false    226            �           2606    137908 "   activity_group activity_group_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.activity_group
    ADD CONSTRAINT activity_group_pkey PRIMARY KEY (group_cd);
 L   ALTER TABLE ONLY public.activity_group DROP CONSTRAINT activity_group_pkey;
       public            postgres    false    196            �           2606    137910 $   agpt_access_log agpt_access_log_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.agpt_access_log
    ADD CONSTRAINT agpt_access_log_pkey PRIMARY KEY (id);
 N   ALTER TABLE ONLY public.agpt_access_log DROP CONSTRAINT agpt_access_log_pkey;
       public            postgres    false    197            �           2606    137912 &   dm_agent_income agpt_agent_income_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.dm_agent_income
    ADD CONSTRAINT agpt_agent_income_pkey PRIMARY KEY (id);
 P   ALTER TABLE ONLY public.dm_agent_income DROP CONSTRAINT agpt_agent_income_pkey;
       public            postgres    false    209            �           2606    137914 ,   as400_lips_pspempno as400_lips_pspempno_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.as400_lips_pspempno
    ADD CONSTRAINT as400_lips_pspempno_pkey PRIMARY KEY (empagt);
 V   ALTER TABLE ONLY public.as400_lips_pspempno DROP CONSTRAINT as400_lips_pspempno_pkey;
       public            postgres    false    207            �           2606    137916 .   biz_payment_customer biz_payment_customer_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.biz_payment_customer
    ADD CONSTRAINT biz_payment_customer_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.biz_payment_customer DROP CONSTRAINT biz_payment_customer_pkey;
       public            postgres    false    208            �           2606    137918 "   dm_agpt_period dm_agpt_period_pkey 
   CONSTRAINT     d   ALTER TABLE ONLY public.dm_agpt_period
    ADD CONSTRAINT dm_agpt_period_pkey PRIMARY KEY (period);
 L   ALTER TABLE ONLY public.dm_agpt_period DROP CONSTRAINT dm_agpt_period_pkey;
       public            postgres    false    210            �           2606    137920 (   dm_as400_phpagmt6 dm_as400_phpagmt6_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.dm_as400_phpagmt6
    ADD CONSTRAINT dm_as400_phpagmt6_pkey PRIMARY KEY ("AGENT#");
 R   ALTER TABLE ONLY public.dm_as400_phpagmt6 DROP CONSTRAINT dm_as400_phpagmt6_pkey;
       public            postgres    false    211            �           2606    137922 &   dm_as400_phpmpno dm_as400_phpmpno_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.dm_as400_phpmpno
    ADD CONSTRAINT dm_as400_phpmpno_pkey PRIMARY KEY (empagt);
 P   ALTER TABLE ONLY public.dm_as400_phpmpno DROP CONSTRAINT dm_as400_phpmpno_pkey;
       public            postgres    false    212            �           2606    137924 (   dm_as400_pspagmt4 dm_as400_pspagmt4_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.dm_as400_pspagmt4
    ADD CONSTRAINT dm_as400_pspagmt4_pkey PRIMARY KEY ("AGENT#");
 R   ALTER TABLE ONLY public.dm_as400_pspagmt4 DROP CONSTRAINT dm_as400_pspagmt4_pkey;
       public            postgres    false    214            �           2606    137926 (   dm_as400_pspagmt6 dm_as400_pspagmt6_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.dm_as400_pspagmt6
    ADD CONSTRAINT dm_as400_pspagmt6_pkey PRIMARY KEY ("AGENT#");
 R   ALTER TABLE ONLY public.dm_as400_pspagmt6 DROP CONSTRAINT dm_as400_pspagmt6_pkey;
       public            postgres    false    215            �           2606    137928 (   dm_as400_pspagtms dm_as400_pspagtms_pkey 
   CONSTRAINT     y   ALTER TABLE ONLY public.dm_as400_pspagtms
    ADD CONSTRAINT dm_as400_pspagtms_pkey PRIMARY KEY (agtnum, agent7, brnno);
 R   ALTER TABLE ONLY public.dm_as400_pspagtms DROP CONSTRAINT dm_as400_pspagtms_pkey;
       public            postgres    false    216    216    216            �           2606    137930 (   dm_as400_pspslorg dm_as400_pspslorg_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.dm_as400_pspslorg
    ADD CONSTRAINT dm_as400_pspslorg_pkey PRIMARY KEY ("SLUNT#");
 R   ALTER TABLE ONLY public.dm_as400_pspslorg DROP CONSTRAINT dm_as400_pspslorg_pkey;
       public            postgres    false    217            �           2606    137932 (   dm_as400_pspslpos dm_as400_pspslpos_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.dm_as400_pspslpos
    ADD CONSTRAINT dm_as400_pspslpos_pkey PRIMARY KEY ("AGPOS@");
 R   ALTER TABLE ONLY public.dm_as400_pspslpos DROP CONSTRAINT dm_as400_pspslpos_pkey;
       public            postgres    false    218                       2606    137934 (   dm_as400_ultsagic dm_as400_ultsagic_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.dm_as400_ultsagic
    ADD CONSTRAINT dm_as400_ultsagic_pkey PRIMARY KEY (agntnm);
 R   ALTER TABLE ONLY public.dm_as400_ultsagic DROP CONSTRAINT dm_as400_ultsagic_pkey;
       public            postgres    false    219                       2606    137936 ,   dm_ili_rider_master dm_ili_rider_master_pkey 
   CONSTRAINT     q   ALTER TABLE ONLY public.dm_ili_rider_master
    ADD CONSTRAINT dm_ili_rider_master_pkey PRIMARY KEY (policy_no);
 V   ALTER TABLE ONLY public.dm_ili_rider_master DROP CONSTRAINT dm_ili_rider_master_pkey;
       public            postgres    false    220                       2606    137938 (   dm_newcase_report dm_newcase_report_pkey 
   CONSTRAINT     f   ALTER TABLE ONLY public.dm_newcase_report
    ADD CONSTRAINT dm_newcase_report_pkey PRIMARY KEY (id);
 R   ALTER TABLE ONLY public.dm_newcase_report DROP CONSTRAINT dm_newcase_report_pkey;
       public            postgres    false    221                       2606    137940 2   lg_activity_agent_data lg_activity_agent_data_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.lg_activity_agent_data
    ADD CONSTRAINT lg_activity_agent_data_pkey PRIMARY KEY (activity_data_log_id);
 \   ALTER TABLE ONLY public.lg_activity_agent_data DROP CONSTRAINT lg_activity_agent_data_pkey;
       public            postgres    false    229                       2606    137942 (   lg_activity_agent lg_activity_agent_pkey 
   CONSTRAINT     y   ALTER TABLE ONLY public.lg_activity_agent
    ADD CONSTRAINT lg_activity_agent_pkey PRIMARY KEY (activity_agent_log_id);
 R   ALTER TABLE ONLY public.lg_activity_agent DROP CONSTRAINT lg_activity_agent_pkey;
       public            postgres    false    227                       2606    137944 *   lg_activity_branch lg_activity_branch_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY public.lg_activity_branch
    ADD CONSTRAINT lg_activity_branch_pkey PRIMARY KEY (activity_branch_log_id);
 T   ALTER TABLE ONLY public.lg_activity_branch DROP CONSTRAINT lg_activity_branch_pkey;
       public            postgres    false    231                       2606    137946 *   lg_activity_detail lg_activity_detail_pkey 
   CONSTRAINT     |   ALTER TABLE ONLY public.lg_activity_detail
    ADD CONSTRAINT lg_activity_detail_pkey PRIMARY KEY (activity_detail_log_id);
 T   ALTER TABLE ONLY public.lg_activity_detail DROP CONSTRAINT lg_activity_detail_pkey;
       public            postgres    false    233                       2606    137948 0   lg_activity_insurance lg_activity_insurance_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.lg_activity_insurance
    ADD CONSTRAINT lg_activity_insurance_pkey PRIMARY KEY (activity_insurance_log_id);
 Z   ALTER TABLE ONLY public.lg_activity_insurance DROP CONSTRAINT lg_activity_insurance_pkey;
       public            postgres    false    235            !           2606    137950 $   lg_knows_access lg_knows_access_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public.lg_knows_access
    ADD CONSTRAINT lg_knows_access_pkey PRIMARY KEY (knows_access_id);
 N   ALTER TABLE ONLY public.lg_knows_access DROP CONSTRAINT lg_knows_access_pkey;
       public            postgres    false    237            #           2606    137952 &   lg_knows_history lg_knows_history_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.lg_knows_history
    ADD CONSTRAINT lg_knows_history_pkey PRIMARY KEY (knows_history_id);
 P   ALTER TABLE ONLY public.lg_knows_history DROP CONSTRAINT lg_knows_history_pkey;
       public            postgres    false    239            %           2606    137954 "   lx_agent_token lx_agent_token_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.lx_agent_token
    ADD CONSTRAINT lx_agent_token_pkey PRIMARY KEY (agent_token_id);
 L   ALTER TABLE ONLY public.lx_agent_token DROP CONSTRAINT lx_agent_token_pkey;
       public            postgres    false    241            �           2606    137956 )   dm_as400_pspagmt1 mdm_as400_pspagmt1_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY public.dm_as400_pspagmt1
    ADD CONSTRAINT mdm_as400_pspagmt1_pkey PRIMARY KEY ("AGENT#");
 S   ALTER TABLE ONLY public.dm_as400_pspagmt1 DROP CONSTRAINT mdm_as400_pspagmt1_pkey;
       public            postgres    false    213            '           2606    137958 2   ms_admin_manage_branch ms_admin_manage_branch_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.ms_admin_manage_branch
    ADD CONSTRAINT ms_admin_manage_branch_pkey PRIMARY KEY (email, branch_code);
 \   ALTER TABLE ONLY public.ms_admin_manage_branch DROP CONSTRAINT ms_admin_manage_branch_pkey;
       public            postgres    false    243    243            )           2606    137960 "   ms_knows_group ms_knows_group_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.ms_knows_group
    ADD CONSTRAINT ms_knows_group_pkey PRIMARY KEY (knows_group_id);
 L   ALTER TABLE ONLY public.ms_knows_group DROP CONSTRAINT ms_knows_group_pkey;
       public            postgres    false    244            +           2606    137962    ms_period ms_period_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.ms_period
    ADD CONSTRAINT ms_period_pkey PRIMARY KEY (period);
 B   ALTER TABLE ONLY public.ms_period DROP CONSTRAINT ms_period_pkey;
       public            postgres    false    246            -           2606    137964 :   ms_position_report_mapping ms_position_report_mapping_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.ms_position_report_mapping
    ADD CONSTRAINT ms_position_report_mapping_pkey PRIMARY KEY (position_code);
 d   ALTER TABLE ONLY public.ms_position_report_mapping DROP CONSTRAINT ms_position_report_mapping_pkey;
       public            postgres    false    247            /           2606    137966    ms_product ms_product_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.ms_product
    ADD CONSTRAINT ms_product_pkey PRIMARY KEY (product_code);
 D   ALTER TABLE ONLY public.ms_product DROP CONSTRAINT ms_product_pkey;
       public            postgres    false    248            1           2606    137968    people people_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.people
    ADD CONSTRAINT people_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.people DROP CONSTRAINT people_pkey;
       public            postgres    false    249            	           2606    137970 <   hermes_other_channel_payment pk_hermes_other_channel_payment 
   CONSTRAINT     �   ALTER TABLE ONLY public.hermes_other_channel_payment
    ADD CONSTRAINT pk_hermes_other_channel_payment PRIMARY KEY (policy_no);
 f   ALTER TABLE ONLY public.hermes_other_channel_payment DROP CONSTRAINT pk_hermes_other_channel_payment;
       public            postgres    false    222                       2606    137972 2   hermes_req_bank_payment pk_hermes_req_bank_payment 
   CONSTRAINT     w   ALTER TABLE ONLY public.hermes_req_bank_payment
    ADD CONSTRAINT pk_hermes_req_bank_payment PRIMARY KEY (policy_no);
 \   ALTER TABLE ONLY public.hermes_req_bank_payment DROP CONSTRAINT pk_hermes_req_bank_payment;
       public            postgres    false    223                       2606    137974 6   hermes_req_credit_payment pk_hermes_req_credit_payment 
   CONSTRAINT     {   ALTER TABLE ONLY public.hermes_req_credit_payment
    ADD CONSTRAINT pk_hermes_req_credit_payment PRIMARY KEY (policy_no);
 `   ALTER TABLE ONLY public.hermes_req_credit_payment DROP CONSTRAINT pk_hermes_req_credit_payment;
       public            postgres    false    224            3           2606    137976    st_product st_product_pkey 
   CONSTRAINT     b   ALTER TABLE ONLY public.st_product
    ADD CONSTRAINT st_product_pkey PRIMARY KEY (product_code);
 D   ALTER TABLE ONLY public.st_product DROP CONSTRAINT st_product_pkey;
       public            postgres    false    251            5           2606    137978    st_rider st_rider_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.st_rider
    ADD CONSTRAINT st_rider_pkey PRIMARY KEY (rider_code, rider_category, rider_type);
 @   ALTER TABLE ONLY public.st_rider DROP CONSTRAINT st_rider_pkey;
       public            postgres    false    252    252    252            7           2606    137980 (   tx_activity_agent tx_activity_agent_pkey 
   CONSTRAINT     u   ALTER TABLE ONLY public.tx_activity_agent
    ADD CONSTRAINT tx_activity_agent_pkey PRIMARY KEY (activity_agent_id);
 R   ALTER TABLE ONLY public.tx_activity_agent DROP CONSTRAINT tx_activity_agent_pkey;
       public            postgres    false    254            9           2606    137982 *   tx_activity_branch tx_activity_branch_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.tx_activity_branch
    ADD CONSTRAINT tx_activity_branch_pkey PRIMARY KEY (activity_branch_id);
 T   ALTER TABLE ONLY public.tx_activity_branch DROP CONSTRAINT tx_activity_branch_pkey;
       public            postgres    false    256            ;           2606    137984 &   tx_activity_data tx_activity_data_pkey 
   CONSTRAINT     r   ALTER TABLE ONLY public.tx_activity_data
    ADD CONSTRAINT tx_activity_data_pkey PRIMARY KEY (activity_data_id);
 P   ALTER TABLE ONLY public.tx_activity_data DROP CONSTRAINT tx_activity_data_pkey;
       public            postgres    false    258            =           2606    137986 *   tx_activity_detail tx_activity_detail_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.tx_activity_detail
    ADD CONSTRAINT tx_activity_detail_pkey PRIMARY KEY (activity_detail_id);
 T   ALTER TABLE ONLY public.tx_activity_detail DROP CONSTRAINT tx_activity_detail_pkey;
       public            postgres    false    260            ?           2606    137988 *   tx_activity_upload tx_activity_upload_pkey 
   CONSTRAINT     x   ALTER TABLE ONLY public.tx_activity_upload
    ADD CONSTRAINT tx_activity_upload_pkey PRIMARY KEY (activity_upload_id);
 T   ALTER TABLE ONLY public.tx_activity_upload DROP CONSTRAINT tx_activity_upload_pkey;
       public            postgres    false    262            A           2606    137990 $   tx_agent_income tx_agent_income_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.tx_agent_income
    ADD CONSTRAINT tx_agent_income_pkey PRIMARY KEY (id, period);
 N   ALTER TABLE ONLY public.tx_agent_income DROP CONSTRAINT tx_agent_income_pkey;
       public            postgres    false    264    264            D           2606    137992     tx_knows_data tx_knows_data_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.tx_knows_data
    ADD CONSTRAINT tx_knows_data_pkey PRIMARY KEY (knows_data_id);
 J   ALTER TABLE ONLY public.tx_knows_data DROP CONSTRAINT tx_knows_data_pkey;
       public            postgres    false    265            G           2606    137994 $   tx_knows_upload tx_knows_upload_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public.tx_knows_upload
    ADD CONSTRAINT tx_knows_upload_pkey PRIMARY KEY (knows_upload_id);
 N   ALTER TABLE ONLY public.tx_knows_upload DROP CONSTRAINT tx_knows_upload_pkey;
       public            postgres    false    267            I           2606    137996 *   tx_permission_user tx_permission_user_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public.tx_permission_user
    ADD CONSTRAINT tx_permission_user_pkey PRIMARY KEY (username);
 T   ALTER TABLE ONLY public.tx_permission_user DROP CONSTRAINT tx_permission_user_pkey;
       public            postgres    false    270            E           1259    137997 !   idx_fk_knows_data_tx_knows_upload    INDEX     f   CREATE INDEX idx_fk_knows_data_tx_knows_upload ON public.tx_knows_upload USING btree (fk_knows_data);
 5   DROP INDEX public.idx_fk_knows_data_tx_knows_upload;
       public            postgres    false    267            B           1259    137998     idx_fk_knows_group_tx_knows_data    INDEX     d   CREATE INDEX idx_fk_knows_group_tx_knows_data ON public.tx_knows_data USING btree (fk_knows_group);
 4   DROP INDEX public.idx_fk_knows_group_tx_knows_data;
       public            postgres    false    265                       1259    137999 (   idx_keyhash_hermes_other_channel_payment    INDEX     u   CREATE INDEX idx_keyhash_hermes_other_channel_payment ON public.hermes_other_channel_payment USING btree (key_hash);
 <   DROP INDEX public.idx_keyhash_hermes_other_channel_payment;
       public            postgres    false    222            
           1259    138000 #   idx_keyhash_hermes_req_bank_payment    INDEX     k   CREATE INDEX idx_keyhash_hermes_req_bank_payment ON public.hermes_req_bank_payment USING btree (key_hash);
 7   DROP INDEX public.idx_keyhash_hermes_req_bank_payment;
       public            postgres    false    223                       1259    138001 %   idx_keyhash_hermes_req_credit_payment    INDEX     o   CREATE INDEX idx_keyhash_hermes_req_credit_payment ON public.hermes_req_credit_payment USING btree (key_hash);
 9   DROP INDEX public.idx_keyhash_hermes_req_credit_payment;
       public            postgres    false    224                       1259    138002 !   idx_keyhash_hist_ili_rider_master    INDEX     g   CREATE INDEX idx_keyhash_hist_ili_rider_master ON public.hist_ili_rider_master USING btree (key_hash);
 5   DROP INDEX public.idx_keyhash_hist_ili_rider_master;
       public            postgres    false    225                       1259    138003 *   idx_valuehash_hermes_other_channel_payment    INDEX     y   CREATE INDEX idx_valuehash_hermes_other_channel_payment ON public.hermes_other_channel_payment USING btree (value_hash);
 >   DROP INDEX public.idx_valuehash_hermes_other_channel_payment;
       public            postgres    false    222                       1259    138004 %   idx_valuehash_hermes_req_bank_payment    INDEX     o   CREATE INDEX idx_valuehash_hermes_req_bank_payment ON public.hermes_req_bank_payment USING btree (value_hash);
 9   DROP INDEX public.idx_valuehash_hermes_req_bank_payment;
       public            postgres    false    223                       1259    138005 '   idx_valuehash_hermes_req_credit_payment    INDEX     s   CREATE INDEX idx_valuehash_hermes_req_credit_payment ON public.hermes_req_credit_payment USING btree (value_hash);
 ;   DROP INDEX public.idx_valuehash_hermes_req_credit_payment;
       public            postgres    false    224                       1259    138006 #   idx_valuehash_hist_ili_rider_master    INDEX     k   CREATE INDEX idx_valuehash_hist_ili_rider_master ON public.hist_ili_rider_master USING btree (value_hash);
 7   DROP INDEX public.idx_valuehash_hist_ili_rider_master;
       public            postgres    false    225            J           2606    138007 2   lg_knows_access lg_knows_access_fk_knows_data_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.lg_knows_access
    ADD CONSTRAINT lg_knows_access_fk_knows_data_fkey FOREIGN KEY (fk_knows_data) REFERENCES public.tx_knows_data(knows_data_id);
 \   ALTER TABLE ONLY public.lg_knows_access DROP CONSTRAINT lg_knows_access_fk_knows_data_fkey;
       public          postgres    false    265    237    3396            K           2606    138012 4   lg_knows_history lg_knows_history_fk_knows_data_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.lg_knows_history
    ADD CONSTRAINT lg_knows_history_fk_knows_data_fkey FOREIGN KEY (fk_knows_data) REFERENCES public.tx_knows_data(knows_data_id);
 ^   ALTER TABLE ONLY public.lg_knows_history DROP CONSTRAINT lg_knows_history_fk_knows_data_fkey;
       public          postgres    false    3396    265    239            L           2606    138017 5   lg_knows_history lg_knows_history_fk_knows_group_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.lg_knows_history
    ADD CONSTRAINT lg_knows_history_fk_knows_group_fkey FOREIGN KEY (fk_knows_group) REFERENCES public.ms_knows_group(knows_group_id);
 _   ALTER TABLE ONLY public.lg_knows_history DROP CONSTRAINT lg_knows_history_fk_knows_group_fkey;
       public          postgres    false    3369    239    244            M           2606    138022 /   tx_knows_data tx_knows_data_fk_knows_group_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.tx_knows_data
    ADD CONSTRAINT tx_knows_data_fk_knows_group_fkey FOREIGN KEY (fk_knows_group) REFERENCES public.ms_knows_group(knows_group_id);
 Y   ALTER TABLE ONLY public.tx_knows_data DROP CONSTRAINT tx_knows_data_fk_knows_group_fkey;
       public          postgres    false    265    3369    244            N           2606    138027 2   tx_knows_upload tx_knows_upload_fk_knows_data_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.tx_knows_upload
    ADD CONSTRAINT tx_knows_upload_fk_knows_data_fkey FOREIGN KEY (fk_knows_data) REFERENCES public.tx_knows_data(knows_data_id);
 \   ALTER TABLE ONLY public.tx_knows_upload DROP CONSTRAINT tx_knows_upload_fk_knows_data_fkey;
       public          postgres    false    265    3396    267            �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x��}KodG�ޚ��l/J��в/܀��,fc��h�� n�]e�0Y�j�m�b�%SErV�́H����Oq�9q�F\ޫ�WeFJ#�L232o��8�;/�ŕf�1�ś��z��?L���=L�&;[�V�Äl��[ͧ��N�?�����O�D����g������������d�a����b�?�<L~z�߅ot�0�~���ӽ������ar0��T��7������~������ѧ��OG�qvu�C�����a����-���'�E�zҘp5J��J�}����l�x��8�w�_�0�y������W�_m����>5z�4���߻�����n�������������������?��>�/������5��O�7�O�P�}������DX�Y申}���!{����_!x�����E�?���v�=�����Y����0y?��#>��#�|@y��/~y�L2��-X?�a����C�a��l�6���|T��:�E3%�f����|Kpά4i� �-|F�"�
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
��U���t�=�*)_��s+6�JR��Jh/tG�<����L�i����U�}��6���>32%��?���������翐>ޘsM*۟�!�:ꎄ���m}�aD9SD�ҥ���ښv�!�=���e�)!�ؼ�p,,������]qC �L�kБL�Z���뇜���1��l�Gv��n��-GQ�d�QX���&IԱ{m˦Q�8��`{fk?���	�JP�!Q$�hE��;�Q7$�סg�ysLO��mU�ی1�U��,���ss��$�!XP7��`���Mܙp� o0������Ξ�Ʀp��ߟ��� ��9      �      x������ � �      �      x��]Ko+Gv^ӿ����9�~,��I��� �"	������k0e���ΐ� [��+�:��J�Ωj��d�z�����jvUW����y�Ѻä"���C����g����p6�Ϧ�p|��IHg6�0�Nfӏ���p�?��_f���t<�Ng�����)!�u��I��ϳ�>�s���kޅ�����+���!"��.;�M��#|��'��Ь3{x7��~N��=4��=c'��?�������2���8�w��G�]�������ͦ7�$�����~�O���Ȱ����e�N8�=8⎠��;	���-W5�M��a��>3�4m�ι\��7t5]����]pb�.n�����q������z�Z��fH�X'~����@�ZTd�b}������c�_�{�;x�� %�|TtDC�-
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
�,�G'�ryc�����D�Y��<��%v+�J-�+�q9bϱ��lAD;�GU{� ��)P�!      �   ;   x�3320002�40325 R�F�f��� �����!D���(Y\Y\���)����� 4��      �     x��\ە�8�vE1	؇��l�F��L(k��,<Ȓ@��}�ݦ�� !������O���fo�{���1�o`L�2;斂�M�����俌�ۇ�!.������7gwǭ��#����YV`�n�i�Z*�q�X~����?��8�}����m@�	M��HQ��t��/���0Y�����*8�Q�r������ceb� <�������/�*LG`���@�<▫,s`�"o�x'C�U�#y�q��ɖ���٤��#2�M9�v >e�eKJ�wg��?����z�|LÔ��qywʒ5�B���RYyf���Ъ�WD�4�����şy�$��z���1DEf]�:��y#�9�k<�GUΌ� I@��q`��B��nc\|<ٙ*�W}9UrXGE�Q�ֹe�]8�y�8����������i�^R��+4T��v�X��F�QV��qӕ�>�4�)`m���Oӿ~�Y����*���qOn�^2�2a��9[�|��ؔ�2e~��Xh �oK�՝0�,��i�[q �&�Q55a꒭!��d<];;�n�A=��h��1	��[�l9�����P�/ӟ˨	�o V4���:�<7ʘ�W�A���LGOzY��e���9n8��|���d�2�p0�y�%x��N!{'�>�)tݣ}2jo��z2&�2�,���������^�l2���M���k���T��`y'�?��\�'cbHA�q����Vg�֫c)g{i��㳷p*7�6�f�g+��|w|H��6�;0�����J�����)���H� �����RO<��Fo���+0�Y�
�'(�v��bй����<�����8/�H! (�j�s�z����;�10' s�R�;?��)ߺ�`1)�2���b/ʂ{��$���|K��!��
JrPm7��f�c9$��	[�0hзz�}�U�3@0(� Ȅ�{Ɖ��N�g�*c.���W����h�ۑGl�2`�������*c�.�lNPD*[��H�:�kU\��Awce�bH.�"�d,I��XY>,C~�V���"�B�;��;���MI9<����t��Hf��� �el�e�N�]X��r�5R`�ژû�'�(Z>xY�ο�*���`C��
L��?�vR#�.%,2�@%�\p�X.(\_|�����e~�7:;j'��k�LCz�#�	͘��a,38�9��}ff���fձf�ۮ�L�p�uU�_����w��nm�.Ĳ
$�Эa�7�+������j7l�M�iȧ�3�i�ohK8�XK�����Z�,��oI01����WY$É�/^��`��;�B� j]>���A�8<�A��*�:�~�0~�;�P�9�>b��p_�d�z{���0W�d�^�`0�o�j<Y��*�3��E��HB@,	a�r�nsJI��}�M�oVel(��+kz�F��x˚�|^�y�4��~F�!�ȍ�S��1���ˁV2�V�vpV�P+�P{�H�q,�1�%{z/w+4�8h�����5�ea���ɺOY�Vz�IN[el��gbJ��,��6Y _h���U��,����_ՓG���i�sX.�D5Q;4�)��b���.LQwy�ؕ�/�X� ���1��.�Ƀ��d0B��K�Gl�V�d#������U��9�K�F�$c�.���}�eK��5ؤ/�9|�$�����4�+�`�3����XN��^oZꪌ��`�)�^^r�a�9��	�,�� pJgW��4;г�̘�ñ'� ��&uX6����+}�����K��jhV�>}��Z��|�x�:��8�#�;� Fvo0�M��'���}��$���<n���ll�����!�*)=;E�)��aN�l���@�k m�Ԥ���.߱~���#g�"�T�1�6���v�s:1�\���1uE1�{��������Z�$T��c$��y�q��5��N�0^,[z��v�J� C�����#�N�j��Ã@S^�)�+�vH�Y�w��
���f=�Z�!׸�	�Z�ԯ�����(��s���y#����߃i}����8>��|{�*k��}�i9�dlQ�p�ŷi�����%�}��\�����66�]޿�.��fA�h��
+l�����p�+������J�f�A@F������ml-@�u��� _$�kk]����K�^��,T��#�vn�r�O����-�م�Fv���������6�Ad��j�H��4�Ȃ=����9�7
�3��l���N�I2�:��F(
��d���e?Gz�ř	5��2�6~(SIp�,.�PQv����P�jJ��&�}3xk�~~��m�uf�ui3�8���c��d�F��!�1s��yJ,=��-.];�+�d8� U�_��E&4�L)�����]��Ȫҧ�d�&&N�F��]d7��M�V���V)�հNp�d{C�%s^v�G}4,O��X�j����n��0s0�K#�4�vP|���7
8?�z{�&c� ��O���L��8�a�o��D������1˽�����G�����,�	��{��0$�����Z���|x8��K�����|�L>��gN�R �)�pKts�H:��:���U��2����֢�*��3����ю�%���kXNx}���WG�S�4��8N=Zg8�X�Eկ˸�M>�d:���^��4�~겱�v�H벦�ѱS��S�C����+F��fƶ���:{��Z�=�֌CC����U�| ��<����������r3      �      x���_oY����S��0��?���w/`��>/ �žنm�5�R��o�ͦ�W3$�@5e^K��m�Q�Dĉ�'�2�Yd�jwC-%��Y�y"�D�������՟>_]~�z��j���<�[�F!��W�?_}�|u����9l���%���D�Ch|4Z��H��Nr��>�|u���
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
��Y��W|�����N���K�Z6)�$�� �vO|�>G���ͩk&� ce��'=ClG�@�i�HP�(��Q줽hˈ�2q�j��-�SM�֤�B�@F�ȑ�tp}��O��˴���T�s��S�A���lY�.���Y�:7T��e��C��;5Y����� ����Z���w��t�`e>\�­�3i>��׋\�V����ށ�&	 J���&jU(��LH���Q3�)���#C+���V����ʂ�)�'�c�����r��9�����;o+���Z�t�� ���2?�8���q�f��C!˲L����n�m�or���~Tf�{����6y���?m����=��Ql0iT*���l�#z�����+~�i�d��zg�ǃ	E[K�;I�/�tO��ks�Q_���q��W�����0�_��o���$���      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x��ے]Gr%���+�bY\<n�6/���W�~����h�@�Ŷ�)�P )� %p����O�ؗs��� 3Yl�<��<��o��o�WƘfB���� �O�_�>a��_����d�7�G;��-������~����9z������/�_�������S]͢/�_��O���8�)�����_����>}2��˿��߿���ן��E��{���7֟����������~��~�r�W�R5���������o*?e��e�����Y>�]}W�o��V�o8��,�m֒f���P� �<$i���C�Bz��,�3V�ญ�
�����ߎ�kX�n?�E�#Sx׏v�����~����
�����n��gz�	��������2�����1�����w��,p�c�W�Og=���4��M���u�]��-	��8�´��-��֥A�P,I�-*��
�b�S΀���n������+�}$_A��2X��#λG;�3�g#�����0��GI�ݮ�����}7�xZ_�GMp��2M���7���F�u��75��m*g�c����LVd��Q(�� Y�����l�R);l�
?���80I����c%����lo�w�v��� ����=z�B�;��2jHՂw�$d���/�X�iu:{_�Z��&Z�uմ�=�%O���d��a|�����+��m���r�HL�#p*��TZ4��g ��Ȅ֔3�"~5s�x��ꅱ��}Աg�ߑ�⁖����h����7��W$��C=�o+���c��܂��4P��-����ϓ1* 9}�7���UO�WU��#}�c5[ŴB��!�����bi��V�\b�&n�B3�mp�k�"E��e�O*�)�%��0'][Q8�*�l(EK֊֏vģ��#Eql�(B�0��Bzӟ����p����_|]!}XA�a�+����b�ώ$��{4�:�g��H�F��r���p~���"W�0�:��g!&�B�@�S���	V�A����X�U����p��A]$y�Mxmo��G;�3�������^�+D�Hŗ��"�䛣H�5I�`�e'Lx/
m��(P���Q�SţC�
s��$[fA[����	A�Z��fk�S�1R��t#�le ;�E��I><���7�BT[�:�0�1�V޾-XBKT���>��>�a��H�@�N8�����>��qLQ��+��"�J�x��)e�EE�1u�x���!ɠ�,�J�j�^їG�[�
2�6t�]Y#��<���~�E�����?���cxPO�Q�w�rw�`���hG\�G��B�=@�K�l�I`T�(�><~� �_��Fx&�`����MykL9k5bm��^�j�:��I�?�ӏ6��V�Ĉ�X��u��Z���FLv^~*nVG���3�ƞ#g�ޫ�G3ha�L��$��!ke �?���5�A`F���"�1܋>[��1AP85�����3=�,7Q����*�F~�GG1ߊ?�3�p~w5�ׄëa������z0J~B���B�õ����1|��ո�h��v� AK%{�]v�y1x��5fA��lɆ��� �Yn�s�+x�2$4��Y&tME0v�+"jb��d�`�hG|�k���;����U��ƨje��j�U�~��a�Ü���s�����+�~��3�?~ڀ�w
�F})�v��x�1{��K\J�Y�BP���� �0��CK�e��S^ C	<�0x����	ya�:� K?��j�\6d��v6}��b����H����X�Gc��\�������oɨ� �?�wQ-X��������9��,X�Q諀���#ut��7!��$0��>�p1�3
c��2O��C�$O��Nb�I�6�>te�ÿ{�#>��[`��R��1�~������*ף�7��kwڟm�E'�C�m�B�݀�I�����,5��f��1��u�b�"3ݿ�\��&��k�Y|�!��d���۬��]&�{�#>�4��B:Y��3=��x\-����ȿ���
�{@�1֌�������1����_�|T�Y��˪z�̿曪!���[K1��սM�+�UܣeWڱX8���xσWNE� C�� ��,����
�3Z�Tna[
��ߓ�vͯSJ����a.�G�sv��E�o�&�����E��z�1�Wsa����j�i,�t\����Ҁ� ��֤��S���rIcM� ��e��v�x�^#�-����C�����Hl�~]E��v:��v��E�}u��o�)Y����ӕ���μ�@@���>���D��0D��7�:�3����YF���P
�>t��TD1� J
E����0�'kU�e3�߈�;�bR��d�?.�����0�1�쳻�������\������,@�(s�x-�	���cho�/��*:�>����O�U�F��<X�B]o��UOּԍ+���"�cڌ�-�B�+φ�^�ٌ����+V��]��,�}��'�������<���v�xexH������-��)���p��/ ���N�BT�����q낾Z݌������ �y�#�-WJ����%�ө�W������C�(��U�����U �z�^�V!4���q�1�t܄hE4�eG��^%ȁ0:L2X��p���t��NǲM� �iӰ�-��ݣ�9�_1)����( ���}q�jq tǋ����M5���k[`\��|i��]�ɛX4	�=��
�>�/��.E'm�,:�1���JХ�4��"=�z��bW���X�������i������8�D��_�����h�S��c�)�F���q��m��VC/C���c2���0���9�-�<�^(38�Q��,Z��Y�<:.!'Q�[0J8:���f�d�+۝�ݣ�9��'3K��OC�r��^՜��tT��[sٛ��3;=E�R;G��2�吵/�SBF%x�@�H��`Cu��S*ߨbX��Q��Fg]��t'���z��6���lwPw�v�gt�ȥfC �'v��S��U����N���K��w���4Mp����9*��`�K�ؤ��q�'_�,���x1!�L�����,���,1��o�
�VAVue��V�v'>��F89���h�����ͿϪ��ڀg5^{��jo��}oj�"h�PΣZ��:�g�x�����sog�,�t�ut��I���)�0s�Y�%'�t��&G�H�P]_a<��^��p�r(��EQ'����&~gk�����/�=��aX[���7�b���ī��[Y�2>.+|�J�J�G:����|�L�ۖ���lp��h+�c}e�)0�jA@[ l���l!�T�
rA%��!e��2��ZgLl)MePN���5:�:��ݝ�5�s���d	&+���C�Ps�{S'-Y�/׹֛�Q��l�����N�O~���w��7��2>����>���Sz���RF�N��	}(�X k�MN��,Ӟi���F��`���^��b���ڈ�uȡ���Uf�W�Ѩ#Y���~�#>��7ev����5����S8�����^�Q��p������ʽ�}��s�Ⓨ^t��B2�I N�(F1�"bA��13�#�gPV+!�D�e�D��Z��H�Q5mI�Գm'4�m �ACK���G;�Q/��^�V}$0���L-�W���xZ䋹3vYO% �����������?��?|�_����?������/9����4U}�>����Ã9��S������l`�gT�%���� �A*�9��@�ĕ���'�%��v�*D���2�1/���䖒`��7S��1Aؔ��
w]!{�y�aU]q����^<]�����������;;��}����D������殍�҈N}�F_2|C�J������6ʈ�s� �1��`T���9&5�p�6�ިNj}�Z�j��G;�c�g�yk$Ĭma�`4�Cm�~>���ܟq7��cD����R���v�d���e1�\�!|�S��p ��θb5�`h�X4,d��C���z�8�    ��������h�~A�-�d�(���S;�y�eLl��a}��u�1x2�x6���4����ߧ�:EGˁu��`�(j?u�E��AP��͂���`E�-Ƈht��\�d�	�&�F���v~�#�MY+bht���g\�5;2GS��l�a�0|UO��v*^߬�+O���J�:�b'�׊��=&���:��ೠ��<!;i�0�&r<�����t���Y��m�ק�^d�C�׊�*��  ����q<.c�tU��Ņ������B3�a���&ig!'�}̘&�L�5R!���44�^OM��� Ka��,���ϷƼ�sJ�
	�F@ݕ�
	������qPt[S~�����xm�v�f�6������0t���e�v���C�w4؛3hj��P���_INH�B��a4%+F	�3>����-U�Ra�8 �`���F�%�����9!��e�Mo��?�`ܮ
1�To��u����� ��,�"zg��Xe�����D(h�ѰcR�y4�E����>����Ƃ��c�� ud���k�����-=?�����8n<g��C�����,x�H1͡�`�7��(w�����ɋ��R*μu1rSEsڨ 0������O�c�YT���Ϲ7Bk���:��~h�8k�m��ϱ낉��jn�xV�{�����G����
vC^�l�;��s�$�sU|i�!X�9��f��s�N��n[�!����X �������o#m٦��v�YG֊�X�^h'>'b3�o{.Eߥ����hΕ7th��\ v�b�I�|5��د��������q�\�4��	�u��K�MTY
&�t0"���č�`��	�9&=��p�aM
D��f�ud�.>���ډϿZ�u�O�=��xQ��� ��4���*n� -����m	���w[Z�h��e)�1Zİ;i�tf��D�nE"z74׎c.�J�c6�dm� Ee�0�qƑ����zLn1��v5�ݣ��8�=��9{0�f��i.���l�'�an�/�̩N�|
>�K�VJ�17���eQ�`��:1��|��2��4��.S�슙&|V=�d5�P�d�6�v��G��C5�?U�xL������m �)yq�X�r�"C��l��i:��(��b�
�hH���̔��M'h�����mކ�=��v1�G;�s��43��G�B}�A����5x���:U>L-�ܬ媅e;���h{��6H�d�ƣ�3)"���x!$��J���0(�L#�m,�]���C���Q��<���9��!�}97�<����?)�}U��WV5�eb�oΎ?4N���CN*/p�Զ(��Q1�12ME�bsb^�28��BU8M�	�9��sfE4���0{'�68�d� �9Һ�Q����m;��|7�gK�:'ʛ�HM!�X�~H�c��Z+G:��1�Y3ByA�ρ�Das���^먓'AH4
*IY���G����_���m�b��Vo�h�-;�9'�0��{]�磑T�j�޹?^��j~�n�hvF0�Ǥ��_{����R`@��4@�ޒ�`l���O����3�.JLA#�����Q?���=VY?��O^�wRoň��9��?�������n�U{ݏͅ,���o8�8Q�M����?���gG��{H��U�%���Sj�M�h����t��G#Τu��VbcƬ��8fUt��`����&rs��jjs�)�EQ�G;��F�4st����t<�=sL}�o�hb�E�4:K.)G]�]gO�����A���)���c�;)B�!�XԆ�Հ����e|�h��e��Fb�\c�ٺ�`��Eݕ��M�ظW����G>;4�l�y�\(��ڰ�cg>P��UG>$�iT��9���+��␂L��V�s��tM�ř�d����XqT��Zq������g+�b�؏��qt[�Sc�#g���gl���0�l>]�ohpLlYngp�W� �З��7F6��@�㤁b)�.h�L.}gx���Sj02c�FC �/��>G�Qt�IGt=��>�HB�m�GHn��dCVӌ����ѿ���ӻ��)��ߒmg��?#i�����:j��ș��d���#�}�N������'������>�uq 8��1�F���DWA�[;��H�{i h��g��%Ĉ�;�����2}�h��I�?Ecw���k�~�9~�\��@\��j��h�@Y�5��a#a��@��\\*Q&D̗�F8�,�)Eg�|�0��%p%�ݧ����Њ:�+�m�Nƚ��GG1k�j�İR�bp�
l��/�3��fPo�c����r�sR�b�� ����ӈɐcQGg�'@�܄�C�e�GL����JXH9I�Q���n����S��L��`�eu�n�]\�Z�A]�b��a��x16��d�o56��Tç���嫠���E#)����M8S�A� 3����&�0�	j��<��h��$�#.����ۈ�p��iǭ��M�P�[�ŷ��3��?#�N���|9^ܛ�-��1~�����
��1�'B(f���D�����("J�>(�#��Ѕ�E�����5Hb�₾`\Ą&a���sڰ���g�б����'��zG�};��=U���kL:��3Bd�|B�(���!c���u��0�s��2LZm�M�T�N8D<r3��eCVi�wq�G��@����� ���8��Z�Q��1�����|�84K��7*V5�SJ�[�(3| �,�ab�a��PXüLLDÓ��(�2�R�S�4��M/�E¶!ݤ�� me��� ���V|����{�0���c���5�X�H��%}���n�uE&�#���������>���*� ���8��#�
b��r�}�\)�i���	�k0�oĈ�VF��}�x���Z|��"+��U�D=�d3����s��Uñ�n�ΰigJ��E����X��>����`y�1yV��!����q�4�#kDv^4�.g�ޗ��U��m�Jc �)k���d7�yŧ�»%���y�t��A�C�l��n'/�	����S@ж`��C	�z�	H�&"N�+�2��=&�[��U��\V!y�G�i��Q�c�����[�FKܬ�X#�V|NP2����rg2z���ۙ����n�W���q���'��W_��n?,����g�����7ՂٶZT�А@k�\,����������8$%#�{4��D�'3������at�%l����#ku�6#�Z|���|.8<�ZH�5��r���-Bog�n�>��}�Ԯ߻��mG�z��@%����k��B=jbP�&�c�A�L��6
V��8JH(�}����%�>���&Ǽ�w�.g[�b{z�ou��9�\=,�|�l��
XU@n��۹�!�8"~���J�)�1!d<�
S��|dpQ�2�h�r�TEi���7�i;�+�I�?/���,X5����VV{I����G��oO��0���Ы ��c�/��]E�.��qGL{���E�I�2�Zi��Y�̵�,'aP1r��|�	T��uA���ɮq��>ujL{�]a?�eW�6���}�y[M��E9��~3*�;�Un!�YVK~��Sn(�[��ag
jq�a��5E�X��Fc�|����p���F��R�e�Z&�Lb�er�Fc��������v�����d���@o'>�Q�j�^y|<,p5��<���4, nJ;��l�¾9���#���Ps�1����	�E+��9��P@ox���p��x-1h@G�E�0�*dm�r�y��,h��{�Ԁ>�j�֝��"b�ud���ͣ��c#�Ϋz�_�� M���h{w�-�y7�~���4MKcy���Ժ��6�x���a12���a�ؗ���.U�l@t�6��j��vNt�֑��D��a��v��-��f����~5��)�D��h�D�1��:�"n�4�o�"x���=a��1 �`iX��'� ���>�Z�l���4#���3C}q��q�``�ĶE���?������A�.��ҩ�j,�?    �gv,��-��B}�7��d������KOҀ{��i�;�4�݋z���{��0��Q�Q�a�/8��J�$�@ƀi勎*����y*
dd�E/m�[�É�ҿ��E3+ڋ �n��^�7{qK;��8�$�_����M�.�����J@�K3?�zN^��1�/<� <N�p��Q�E��?0����c���<�¥��i겗V�&�F��+�w'�+k�k[�);�m���ݾ�}�tKvX�F�^��Бd褣�ܡq�-���k�����B�4�~�2�q0ұ�3pt��mDJ�	JT���qn��l;��-��d�B^s�|'>�g3�Ez/�Z��r TusX/���q�ć��{>m$�uڟ���w��Z�Ȅ�r����6�(e�tJ��q]Α�Aw�<��U���8�l��hݖ�5$,��v����vj���.?L���+QS�7\�~�ܿbpN�.��hA,m���e�U�� 2�ia0&D��4��9�������(Ѣ豈�8v#>�m�֓5b�ͣ�yT|��}=Ϯ>>V���o(�����ۭڛn���;-H ��q:�����$��x��W���[kg�&���I��uZ��X��[�����[����t�¥%3m
ݦp�9U�|Z�D���0�ryT���Tm75pO=���שw�
���W3o�8V56�q�~?��]�k�����(����53Ę,�Ȕ"��[/SJB�c^=x��BO4߁	�`(��X>lZ�� 4��m���r񎬳�����n>8Cŏ8�R6QԴ�Я}3�ۡ٩ѹ`V�u؁���}�	Vy�dmbWr;T�����91��@c`�r������XE$.�%�>�0+Ʒe��Ύ��������ո����D���xQ�xnjz�f�G9���	~�^S��w�w���s�o"Z�A�ePVxc2�hBIe0@;y�uL&/!<��xj������m!�m_��:%��F��o֥l���71^M����O?t���������]�}`HXvVJ��#>f�Q��r2J9o�55e����bR�SB�Q/: ;� ���ӓ�H�]s��F|�G��c�����MfM���wcNC�ĭ�ɂۥ\����B|���ڣ9"p1�"FL�mqC��@�n|������	}��E�_�$m��"`��:h����_3��ǣߑu�4;jqaaUM����,�O���#Ό�\7�o�p����̽�
�}w)K{�1���x.�� h��l�e�=&d)Cp��+��C��r�2&uͳO�꛰mO�ڑ�(Vu[%���5b書��WH��;0����Be�^��0�oo[��O�x��\)�^�O['���;��ا�Q��:����`�zʴdm@)���"��d��� �1i36r�ɨ,`���4��Z��6��b�1�ؤ���G����?_�>�X��_/ČZoۯoq�ºb����Z�=Vƾ*D]�I���)i�0�%Q�l��/����b�ϥ�O~2���/)68��1�&�[�]ݖ��=�h�5����}=gj�uڣ9}^�!���vCto���am3"T7�BP��l�Y9$Ɋt<s̡1���p���uN�u8�рs����GVv��2�M�|W?����}���F|~�������	���i��J�D7]�a"��p�x1�(1 ô[f�!*8�
Q'x�cL��8r���~�%Xb*R�����X�j�cp��|��\��L}�4�y�Rb�N����t����"��������6W� `:sjrD'�t5��9H&�c���<Ƙd���Փ5
b�G;�sE޴+P��fX�E�w�KD�_�]K�Ӆ�r��݋�i.iCo��	m��"u�Y h��6>�B��S�5FI��[���a�U"�Z��!�FD�,7e��ى� 	<�W������L�������ḑr��1�Rv[�ZoE����^�f�k�cY����H���U�XUZ4_AhV"��P+���+
o8���T,Ka�UF�j+��d4�a�d-��ސɛ2O)�M��yxb�[^�RO}m�;؏�c�76X>���ͺ�V��C�8�z�We:��!(��� �-A�9Z}�� s��T�Y�gQ��$���;�DY�V��W�d�Y+�������PX�B������qc��c
+c*�z#f�t���W���4/G�Ҳ��{��u��և��5����)0:��h�!�2?P�%Jm�r�Gg��*����	���%���b�7Ԕ���x�	���'U_Ζ{�z<̛�N,��U	�q��.��ε��������W��Y~�^kG1� ӻ>�+��x��)p�K1V)-�D#�,�����b"^���~)����s����M�k��4e���f���;��#�狑o�I���\ӛ���ݣv�����ȹ�ԏ��'
_\p\�	:��"XHVB�[e����ڱ��ͯ�0c��4�=�cF�ZT��yG֮��ZY7��Q�l�g��L,�b�_YN��#/0��?7�ok]�����\t����q�;��ǵ]b���$)�W*f2��K`r��Y���Z�⋑D�u*ɠ��t���w4�60U�2}\��l��ڕ{��EJ��y#>��/�I���cW�R����������˿�&�nQݺ��`fN�pʡ(�-'(_�.L'���<�a=w>�k�	�� !��l�����|�����A�W4��Ϻ'=�u�*����.ϛ5��?M���������{�#r��'[U'�V���� ������9q�L"8L�dJ�nT4�~�T@�q(�
|����y�Sg_:���q���Z���l����ϯϾ�����:�:N-��8U����`�7�;�z�eՒʬ{ص���~����D/Y�w��.��A�l�O~�"`F �ǴB恋Trr�d�T	m�����)k�K�	�wⳆل8����7�4��h��}Y$��H=������1�9el�{-7\�Km�b�_���68�~x��&.�%LA�lҚ0\�\)I?����-f�I~u�bQ��K�e��y�Z�l�c��s�^q�MU�T�9�5��}�����kw�.��C4�w9F�_���YT>�Y�
���e��Pj�0X�֤,C�1l�ڭ��E����K��vl����֡>�v�4K���������:P��CB��~��AqT*�IS))�Ψ�is=�
���5p��̊��S[���dY�2Ԥ%�ҒQ�^��sY�j8�{���b��Mj���<D����m��trB�Xgg��	p�����BI0R�"�p� 1�h���I*t��z�M��7�/����|�Ӝ5��MY�B�Ӄ�w�˩����ȏ�d�c7��	!�oy���޴��['�7��X����`���BSϜ�>x��@�5a���ۜ�I������ml�K�� ;��V�zY���g���J�D�=�*?����H�;6���~�����6�NW�n�=�x	V�@�Mp���S�3�xc�)\�9��,g�3!5ˀ<*F%����\���Ǝ��?�'�#'�w�_�C��<��x�A2�⏫�L��g�W��mP��v�2ge/q롪�O�1z�(��a��	@i��(62����#m�IL���HI�o�UT�W��SG�!��A�9�зzWB�1�ϰ��I5v�V��%I��l)0'��_ɍ�P�����n�qG��jܿ�����3e�0U�f���ij�[oݽ��]� �F�1��U'�"�C���[�(TSOI'Ul2&ݑْ��:YZk�s�U�-���]�C����ZK�T#�ډ���8/"Yș��;��r�I��.Ƴ)��o�l��] t6ǟj��ёb��Դ�"1�68'(�D�l��l�ӀG�+`�![\D��I��#Gn��,�m�mW�ݝud���ֽ��t@E�eO�1���� G��jx�r��d�M#���Ng��\�m
�8�����t�7�U���J�ލ:�-SFS�%4�Ex�c�e���*I�)=�s�y@Ue(�B� �C3"ˍ	t�X��Fٴ#k�R    m��j/�݈���M�p>����7�K����Å8��ZX�!_`��>��g�T�j��=��� 3p��=A��P�4-�t���IK�S�4�F`|f2'��Yzf3Z�� ��lo�S�MY{�|?����0�d��<��U�鐎l}��{���uз����v��6��{/�ꌵ�N�RD�e��U�#
�:�A\���S1!dɩx�BFM�;�	�7:�k��r��?Ϡ��TԞ�&�Ss�i��߬ߢu�;�S�F .F5�I!�������T0&I�4�x:��܅� U�?1�6f�C�RU.vq��i�#�8�V#��tPYJ�T�Ւ��ޮ�_���Ӛ9�zE�vJ�jg���Yɓ��*�E���R���0��P�Ж�������sMP��:p��:�Vpg��N|V�Χu�d��/���ͻ䖾��ϭ�?��۪����n��;upBt��Nj�)v�𤊤�7Z�|'�b��
�`�&�
��C5�t�:���)�A7ӓ���mN�l��ݯ�Y���|��ۮ�=�F��N3���u/,3�3X�;To\�A��<���4#X�sv�_�F�_����e&#:]^�\|.�%z}֢kE`��T&vœ��UP�F��N|����L͆3Y�yo��q ��a�Jn��qam�v>ί�(�{>�SG�T��v78̲0��ڨ,���®�$^z��^F�U()���U�+-5$0�J�5x��|�i�\��ZmM�}�e.e�aˡ|;G�j0^��jz�fZ�0�	���-a�צ�l�MAp�/=����h&W6��&��j��{��e
EK��^䐣@����-`9f|�8l���q���;p�>��ߎ�OFn��o�ϱ%9�3�M��0�^��.�UM�cDtS�ܺ6���s�@\��8&��9���oF3
�-������q�}�6�x��8wd��v}_�;�g/��Zs@����ۧ�e�����A�ͼx���tΨ�	�qm��ÅzC�� ����������D�
1�y"\,<��b�u9mm�:pfzz-X.��}�ޤ���mS��5�tdm^����N<� � ]��K��F}�o^�I��\�g����?Hߴ������k�I�f��� ��:���v�q���	\�a%qAe��)��/QbXL�3Uzw|7T�m���MEwe-�٨��ė2���.�[�h!�#r�#�(���R�6;p�X>?�_zR_\�bi{�v�v��%�P�`\�	`�&�������W�f>�<8��I�h�YD����x��eG������q#��j�_L���]�ZNg*�;tX��/� �7����>�Z�<��364�)e4���c�Ȁ�	V`����Blt���m����0k*���h�}.���R����"5�xog���������Nt�p�ZG�S`����G:	G�Oq�q-��<�8]�a�ȓ�=̊��IK�J{�ȿU�q�*��������uh\m���������z��}<�-��Tͨ5�&���nM坊���Ҏt:'�&ʘ�4d�K� Azڲ�0��/8;$ϭg.Sӓ!�g	L)�
�Q�\;'�r�Bm8o��6em�W�&|��ڥ7u)���[����틼ҡ�E<W����J��
]t��&�S�;�<���ya ��˓�ͻ46�^D��
�N%�u�<F��+x�5��@��Ú���k�=Y���U�߈ϼH_w����.?��O�x�N��SSz%���������Z��WP�uT�3�b`���#(k\�Va��A��Gu g���$AzD��1��A�H�_[*��Fev=8=Y����2��虯����?�q�[rV��O�:��0�t[Cu,&f�r�څb��	0#4R�� H���`�0���4 f2-�g��Y�@�)�7o��IkZ�/�h�zw�*�/�J/c/��{�&�8���:��6�r���!�m��S:�J��	��iO-�Ȩ.hC�6�λ �#r)r	Iƈ?. E�M�b�r���8,]�ub�dd2����z�7e��d�Y���N}7:���>��m�M�S�C�2�񳤶x�[���M?	��� S&'):�SthgĝS�qE�?�MY�x��/�\�ҿK�Se��{���z,�O�J�����T�7��׃Ȍ�s*03�h��Q[8g�d�����޽�� �CaQ��H�!{TK�7nN���wdm"˦��xOj;�c,���#�Ų��芠�\�5+�GV��Ozk4�妝j��b�G\%�c��0�W�ɳ8袹^� J���04�"�1d�KDb ���_Ktw�a*�C �[Z�x�a�{�>�!#���Y�g0`�-#���d*aH���#�98����顶��^u^��t�g���uz8���L���M��.��:�p��Z�lq�rYC�jhIP��vy�QhLͬ�R9�H�+сgj�k�j�6.�aؑ�p����rL�&_�q���e����K�q���6��퍍c��I�N@K;:�Ǆ+f����\(Q�Jx+���aTfJ�HO�5�&*ـ�Mh��۱��5{G�!h]��V�-��b��{u|�1NS?�?���K�o��e�[?};6\�\��)�[����8�g�0�Қ!�;��A�-�4��"�LFHE�C�b)�I/cg���F���h�ʍ_����a��ˣj��e��e-lQ2��vq�
a;�4g��j'/�wG묒�GڧV��H>����
����6�,F�ï����M���Y��Z�?�9Ǵ��%��G��럆uV�TZ�*D��t�&�R�;X{�na�\m���c��́�v~g��xvv��t��3̫B�1��?J)�f@{���,� ��h�i̯��x�hC#���g�P;����Z��}搏ꤼ7�W}�4�?��������JT���<y�.��Y�~�к��։Άd�;@�6��#�v
��I��U%"��� �f&8L��O�a�f z�Ba�n�mמ}��i�NK�[4�Xn'>������� ��7�Q=�*Z5���E�!s��V���I}b�;��hh@�F����[�*<�)3��}��]ܗ�����$�s��d�$��b��h�Ƃj���b�k�k��]Y�㷚-v�h	^N�-:�����"�S���k[	&n����N�gSU`��m؈N�"�|�2����:&=Ϟ�t���R8�y�Ni�u��y� $F;:���W��AZCgeX����y��l��/*���q�~!N�p���ǿϭ�o�:p�8����@ڦ����@'4�x�3JX]��[�(|��Hc�8�!E�6Ѧ��~jM�s[~��TG֚�r�f�i>y��X�h}3�ah%�q�ueh}�e��F��Ê>|t\ѷf
�ev-w�a���ˁ��3��J*#�ҾdM�'�0�s^�e����@I�bi��D�����rCF.�Mۜ[v�����\���c�ΐS�����]y����q���а����C0	�<� #|_�U`fa04D�ԎG�$Ɖ^�\h��D�#�J!Ķ��ܴȕRpL[vU8]�
>��G����gw���}^Q5-��?m�M烯����)��Y��:�-Q�l�`�fޠV �	2���$�,<�&�R�m]`�
ܑ�����]K�I�@�ͪ�_Ǿ�����*����U�t�տ���C�����@�,}�oq^�&�-��8x�%Zr4�V�x������6Dc1�À&� [��_f���|���9��+__P���|�F���ˊ q�M���ֽ�y�{m�'�f�V�rBJ�!(����(ݥ�K�6�I��]P�xO����P2Y�:0G���LJ�+�Y�j��=|\���(�fa�]��fXY>�i��w2(�_�G?|䠿�I��3g�^:3th�����!A4�+@�^�ӻ�Y�c�����x*(a<�h%J���"ʖZ8r���ݼ\G֚�s��J�q���^e��6��$��B<8t�qg+��a{�������V*���    ��� nU������B����&����΢�7�xCw�{�I�i��_����ށ�m���rnf��GǪ�|nq|9m�������]�[�t�u�w�N@h�h�K��"�y�R47����(�ǃ�"�?Q��X�]�����#�Nna��ئ�}�����b?�r��Ⱦ\��gP���������s�U����wz�N(�Y`�����L�1	�V6{i0�Wy(^��l�VF�rP)Bt�c�.�CK!$sb۩�����t�G;�s�{���]��th^�ϥu��̰��u�u�R�j�R�X��Ԣφӻ�1Z�z�x�=��v��\��V�Ĉ�$�mO�Ha�4�9�ȒwQۄ~$�"s:�g�A����ŪR�܆���U4}�Eu�1}'��'G�37�ܫq'U�>��Vs��=Y�(�Gb��d�9!c�,x��Q�l]��gVrq,Z`��	7�:��i!+6L;?���V���;�3�c���Q?^�P&�I{7�'�:�X���Y����L�YrK`�{��J/�������$���;��Z��n�q�%��Z�y�hG|)��g���ǌ���b��3���	�E��vb1���Qg7h���^�JT�x�у��u��p���ج�T+�#�l8:�h�����z�؅�Y+���խ�yw�8��Q��Œz����K7_���(Ǻ߭��v+%M�2��tL>
�
��9�$�m���F^�d�:hOSK(3!G�8��IJ[H+��=�{j����3�k����H:���ᯖ;�?͌���g��<2�ޡ�>^ʹY�2��^��L/�k��$CP�\&j�2��1Yb ��A�d�P\񖛒Kщ���U����.��|G����}�T�������0��g3`��]z�к&��kⒹ��j�Ug/D�0^w�VO��He�g�C��V�����O��I0��m*��E��){ȩ� ���7�>v-tYg�j��N~d[�7G��?s��q�e�\>sߟ��?�F�m�i��\�.�E�5 h���T0L��{rIs�:(��b��)�(^���Ie�iHU����Np���!��]Y{���b'������q��0�H�9�@_��m5�w1�zo�O��f*�)�{�@����NŎ��B����n�x���d��KWǠc.C
�-�v���)����	<�-�����@Uv�������6��n�B���/o���Ի7n:��'��M�,`Fγ���}W
J*������K[�˵D%���x���A�~,��d�XA�������o����JO��ҿ:��>��1���η�Lv��ݍ�������y>��:0Sy-��iy��@t�^0qD��-h���e����<(���R�BCꠙ�D&ں�]��a5��/��7�"v��#k��;���&�*�?�����xꭃ�ߚb2�V$йd��?肹��jM��]���Y��T� CV\���<�l�>��ej͏�G��]Q�#k�l�T�K/�&�����oG*�y����M=RZѝ�\@�v�8���.�.�@dkh3��J@�1U�\e�����-��A ����uhcg�;�[�ۑ�N�m�Ю���73���0_S}�*����9�0��|��]��GSg�rӮ\F����H�&Nˬ�L9p�1g}4��hGK�Dܯ|�a�t�F��o�����&tZ��N�omA���2��z�q��X�ݡ�?�ڌ��´��_ü������\+r��e�(��,�\1&�Zi�4�Wv�r��=�=Y�4o�Ϛn5������b��N�R+f�y���Q�٥��#�[)ݥ����yyx�ZW���\�6{��l$s��1����e��ۄ��,��o܎�d-��7f�w��Z��2�Xl�fs�}5��OS��^�W��p�S���;Z�v1��x90����C�����&�i9�f.#�x��̴����;k'Mɪ}����7�ɺ+k�ͣ�����ٕ�z�^�띞L#��5o����Q�Zp�^'�v��13�Q��(:G����«���I���v�����ˊ8f�x��ڞ�mfݓ�N.on ڈ�-����s��h��e}�_Բ�?�b��1`{5�6���j�vu5{k�����q7�մ�a�;nު�.��Zts�Z`xj�S�k닦ۖPJ�`��Y%�)_2ݽ:��s�{��az��j�N���q䛲���8�����wa�b;�\z2��ú<v�"+qv�+���^U��E��Z��RG�<�"�?�&%+�S�&�
�-34b�S�Rq)�W3�����a��t��d���Η�풖���q!�9�ٞ�;�G3��\��ܬc�}��X�G#���:�wQ'D���N� �X|�P���1��g���K;p���sfL
�+�R�p�0�L�|�v`3���(1]��4����i��C��w�ã�
��q�i��������dv��^P(����� \�pV��Qې}-2�&�4H���Խ�h��&$U�F�i_K0��I��y����?Z&#��N���u@K}u�)�g�X��-u��n�6�.���UIu�-:�!_�[%:-tt[����>`��a��2�M���D$��"7Tz�%ސU4BY| cI���-n�z{'7�MY���Ys���o�-�i��S��Rb�O��Eu�7�foY�.�������8�rYĜL
�@h�uFr�t�)L�B��(єD.E2� �=�+��v����s�ҋ�யԧ�1�Qۆ�����7��:):�v�E+-�.F-���(��iˇ�^���H�v>+w���#"Λ��i��@���v2S�Z�shdr�ӛ�\�u����F���--�<��ΞވN��^T��YN�"��G��b��RFam��|�`T����4��Jo�Th�D��c}����F�p�Y��ɶ����Z��űu���y"����|�}5]l�fFu��������� O���4Μm
m��L�̨��Y�/0��:R�ǔL
G�V6ښ� ّ �>�0�M�l�[uW����b�K�\��yض2�2��Ūc�|�����#��Dt�}��af�!�3愯����R4���DH���4D&'���Y��fPɵP����|�ʤ��!k���B�&̃]�͋뿭'dd�����D~�=��Ÿ���m�>z{.��W���;E@�I�l�E+)X��A���Z�$�>ePY)Sh�jJ���Gwb��PZ�����ݦMY{�is�->? zP��2�G{/?�ʋ3�M�A}�>��6`���qݎ��1�i0nQ<h��P-�g�.%��R3��RdTW��YZ�v�15�hp�ة-�oxŦ��)y�S�JJ�fg�p8\,N��X���8~�oz�t�-e{�j� ���b�Jn�K7&#����릈�L����G�t1;�q�QT>�m���Y�h�Q��ܣ�ƹ��h1���>�Ӻ��4�^�z��L�")�i�ʘ�[��7��60���?HY�"�Β }�K>�/	�HL۲&�i?���]�(˷�ki�	e��M�JF��������x���M��B�z�k�v�%g��X�O�C�`9T	<ʤ�u�D�YK�/�)�^��5펕>���(Y�_@cc��>���6�t�HRwe����\r'��4/s��^<��@ߎ�Ok	���x���o�� �a?>*^�?��ѵas䲓�*��m=�8�T�  ��w��D�Gh`x�5@s�V�٢м�3%������&u�A�a�#k3W7K��&>	�gsa���fp�i��V�tfmvT�\Ugx��j�`Cq�x���!k���{
�e�"��k 	�J�0ǋ2ֳ�}�>�o�-�z;����z���<�4�?�m��]�^o��$�ݩ뭂�9Ďb`*�1�Yiw�oc�EAT��H%$��W\f5�\l;'��]�Wu��T�����T�\��;.4��L���a�|4sѼ�G��ֱ�Ek�=�b�Z/���0��f :BQFk��GG�QO�����|�N�op�"�ڸ�Ѕ�9    п����a�)o}�r�V�K-|�q���W�꣜#f����n<�]1Q��P$���D)h� DHd�L�6ŷP�4�QT��:�N��堡1{εܽ��n�Ax���d��MZ�n��.��y{zc��	�c4"E-�a�x�-u�1c2��  ��,��!e��x̓�4#c(�����n���⨓����ۘ2?Zv�=����k���53��.���w=�au/����Zb<���� ������XL�S�Vs�x�0��"1�t�Ы�ǀ���b��-YB����#/��S�ݻ�'�w�{�|#�q���8���
�ѳE��1s��ɤT�f�)�mZy�u�o��og^����<5:�z�Vݫ�m�.'�3ˑm�I�É�J�����h.���8��NXN����v"R�7wk<�?/0��>yV�eD��N ���'#Q?PM��dK!�B�!x[��e;,��ߛ皿7./;��gu���澎�ި��2�݂��ֳ�02mB»��seF� 
DJ-w����g�ip�f���Z{/#m�m�(M�n����#k���q�p��c�/g��}ku�z���'�'�_����Tk9���H���E�ފ?ix/����w�%-���� 0(+P��%{�ĕs)��lۢ=O*��sq�z�Щ��h�B�mZ������s�"*.�"A��1ظ7��H�}l�?��^-C���H{�[K����6����r�^�F�+m�e���7:�x`b�Q�
/�h���T �g�Sq%���ƱL�_���5%�O~��j�\ud��L5�g=W�e]�������n#���U=�O�㢿ɱ���9ݶ��β�[�uk幒C���0B�,(L�1���lL̠�*JB0A���+�5*�.�F�6�4:�֡��k۸�8�C��oIG��O4�n��ʬK�-��u��P�
&QLR�4+�M��0y��/`����Q���JR��gf Z�]�j���te�]k���;�9��fV-�����������{3}ӳ�R��>p��k�dg$A(�$��M ��!�����!�O��Jx ���C�*X �B�,j|�BJAL�@��H�r��ڑ����ю��4
߅����3��B r���&��
��]_�,�-W��G����)P1�����\;�)�TAZ����)x��ƣ�e����T�2Z�R�&�FlA5 [��y�=��s:���|r���?Γ>��>�j��;۝S���>��B.��=�S��� �(�ْ�ҋlSQ�e�JP��s��ch��h9z�C���\�D;v\~=�{���\���/���6���������)��CgB�#?�C/������o�����ղ_����I�7��������*]�@�6�#��� 
L�YL<�AY"��6#���\����Gc���u ��K�u�w[���2���X�*S�Խ��TǕ5x�ߢ�\#N+��u?�o��F�h�l���c!�ʈfH��(	IU�m�Qz���wf��d�%����A���X+�q�w +1E�T���m���:��J�v�]��Y{�+�j���O1�`b�B��W�D��9&����J��7s#
���S�a���eo��`]B+�x�}?�f��ÿ́�m��;3Íaީa�����������QT���R��b5Y����m�L�[ƎX��!���y	1-ś�!o��kFd5���}p9��A����!"���W�࣯3���S��r���ZX���9�
�k��uű	N�cS�x2�Ԇ����T�^��u��>R��b�M������h`Z)��W(�	2'�E�,�19��lA3�3n�"jр9~�'!�?�hKr�'��1�b�B����z�*�����9����sr�󣥂���ߺ�'�cu�}g>F�d���n-\�B�a-D�jRD��}d�M��l%�g�@p�
��M��$FN%��A}]�6[:�OH�n��x�p�=>иTz�����F���a4�-�F�P�p�E8Z��,���k�t0�u>�2�� ou�R9ʦ~S��=�S�d/T������Ҩ$C�p�7n~7P?:�=Ԭ;d�9�jQ�u��F�27�^�o�ų��w��G��݈�|�#L^�|�׶䐘 �d�hE��J�'�B�EC�%�`y��%&�D���.�nǹ���z=B���W��I�I���Oky�9�6�Ӥ�~\����%qg��m.}q��q$�˽#��/?^Z���~�3��?w9�o� l�&I��H�� �>Nxq�NZ3��RL�	�1�����v���2��Y���[��_����E̗�����&��5��l	��2���}���ǧ��M��J���7���y 5�ٯ�ޟC��E�2�I@�Qe�tߙ�4���-��j�;�Dl�\�(	�=�IE�W*��#����/���"8�o����6W�u��US�n�,����ذ�E��>��]FRt/��G}�d�0��*xa�t�"9m1��Ƨ�8�A�l��&&�۠�S�u�Z��Խvg� �w�t�qs<�G�0g���~����6Ǿ��®X��ҭ����Tr�P���g��N�Gڄ�f�䂭�$��I�P��N���R*��*�{��M�P��#r��oKp����xaY��w�/Z�r#�v\�/�ߏf����<��s[�ˮ�]c�|�8#�*�.�(�tSg�mIE�A0O�h�&��.�s@O��m�낻T���)6^�����ֳ]�z��������J�s���B{ x�^/Z��B}�U��Ս�j|��R����e^�o�,B�2b�tJ����x��a�[5P"<w#7BF�bf1`��y��`Ze5Z}
�*�3t��E�֩BF/�y�EEt�x`��+��s�I,7�ܯ�܈�Y���V������F�{���̡��D^������z4��_��-Xϭ�8��7.a
͕��2}7,���F��3D��� 6I�G��H�pSG;m��Y�P�u�wǗ���i�bM{�H9r���:)���}VPl��&�� �����%f��%Zf�B;�].�W�%�s��$=��RXBNxF�1Z�>�J;r��Wr��n[�Ӻ��R٧�%����si��)���>��<>�{}�џ���A�x��Hv�ޣ�0�ފ��&o��yE6��t��ĈۢË%��q�s��L�}��m�a��:(P��ɺg��Y����������4B꿏ɸ�a�Zja5� +��R������g7�F���h��`���t��G\�38���g1e��4.0x'�hi�R5�=��Yb���Z؎�����m_]�v��.��{�ݏ���iX�;LTs�^>�b�Jt���<���v��	�G.�n����(Z`tV+�w1d �oJ��~�W9b�(��:'��vEQ�6�j�P��y�&l�/)�L�p���º:;�Қ���UZ�nݗ�rL̬�s���JgB���Y�j`�<����%#P	D{n|@��}�p�A��X̾n�Ԧ'}��7*�oJd�3<����"��K���*Z����Ϗ*+���vn}���L��'��*+c �g�k�YA�l������D#~%xe�Iv�3���شd!0�vrH�F�tuޖЌ<�כ&�۹���'��t_#;TZ��n�9���V���>�%;͸�4�5�##/��� b2�2�B��;��0��˫v���*�謧2nP^9x�H(ry�\�觇 v1�Eݓ��א��t��s'��q��ڗ�b rZ!S1��3�c)�g�$f��[�r4��8�ӴS�$2 ��$Z�Ѥ�gZ�!�p���`����>w��������94�7u
�� ?^�Eg���#u7 ڥ�j�2S��#��caY84N�]J��4q!p�I��c謵��x�	]1�������+�v7N��'��������n_�%!V�i�3g.�A�d��"�$�)6�60�����&�b{#�m����Ib�qn�v���Y�y�)��/���_����������ꅟ-�;�}��1ۻ�����,�PJ9�/���D�    C�� @aԗ- vJ���&������&aL��ϙ��ZJ�r	���.���]'��z������2�1���P�WN3�@��\�
����mT��O�6ܜ���j��$���k�D$�U@�X�"Lsڐ��ʢ��T��Z��mx���>�N�`���2ó�6�e���K����H�+��fAֶF�(֮�eZZ��^�m��}��ѿ��0+ǣI�`����K.I�0��&����'��&C5S$ڙc=���j��y�g}��.ד{O��F��h��~��LG˓����H>�2�B�rA��
2��S�KD BĹ6��0��n՛T���4���mf����Y�M�vRy����e��tz|y���_.��4�jkS��A4����e~����<�D�0��9��M��n�g�4��i���T��V��h����du�� ���m|Y����-������p|�jw��=�����LGz-����w�{���.DN�x�&�$pI��>�o�YbzC��Q9���,�Re-MHZu�3Vm¡�����t����;Ĝ�����K���i{�26�x
��h��I���T�6�x%(Si6���PA0Z�7I�3��$ 2�ڀ�-�Yj򴡤���D�7="��(��J�_�Wv9�f�`^]��rU��ֺ��s1���w�J�r�dW�2d�� ]$�1�]�c��d��b�6n���T�r���Ů�V`�Nor�:��?����>:8�?h�e��r��0��G��-+������6���8Q��p0�
�L�0d�$#J�V+c�����2.��|�~Q�%h��FL�&Z��0B�y��	��d�!08�,�����������&	V��ӴL¼9�5���y	e_�CR~�OϳQ�3�"q��FcDj0�L8��D���2��	���M�ЍKe�\=�St��mc��G��c*�p;�Is 0{t(�,�o�%����`e�����_.�������1�6��sq�K���9~>�" f�1Y�!��#�Eۈ�fN"���)Q󥇭R[lM���6Y�tp<��#[����D��}�p)�:�̎r����(��<�F��0��Ͻ��6K�K��#��{�}(���Jb�T0.'S+�|	=eg%dɢK>�,��2R�S�龿R�]-�7:8��nj�9���nǵ����aȄ2�G�O��of�I����՜��p��Y\�Q�7�k�d^zo�� ��6��AJf��9h/Iz����1�k ��r.�+�"��"F��#�x�!H'�m:�o�����{���k��x���c÷� ~����ڸa�}�iDaX�<%�;�lY�)1a"���D�U�)=K$x�<�1�;L?��g�6��өe�鏫��_k���%�FjK��UX� �Z�ccj&�Jh��Dos2�'5:j}a�d�K0��]�/�05[L�}��Y��c�.���Xmg��F�[�Y�׿c�;7z�G�e����8�����K��>\����s���׈Z�n�Ϸ�~�R����ܕQE�D���F�x5�FS�X�	���!:�@@����/�t��ѻ��nxypֳ�>����=D�6�K�K�]��OK����"
un�q�D������x�����瀏|f��`J��QC�Y�ɮaޖ�6iG��eh0Gm�@h��{�i�+�>�Z��̄9�S6G�=��M��CJ��h u�b),i�VS�.��W��`L֓�,�1��Le�po2�a��I��יc�\��͆��a�s���7n�q}�l�=k��?-;.o����Ѷt@��g��h��@�<\�?�M`U�9;K��2��i�� ,~ 3���ek�4Z�JrLҢN��O�������ƚŎ�ap�+T�������Y�J|����&�L���:��e�����w�_.��kz����Q5ݬu'��A�X0�����HL���a1j��1��"z]�N$��|2ɓt�]���Pq���]��lWq�}tpL�>�rɹ�ϝ�����.�l|�L��r�������$�R�.��|o�$"ˡ��3�D�˜Ւ:��(G1��r�h��!ҩ����')QJ�b8'���=�,���|�I5��g[+�tp|QՔ�g����A]m���s�/�wy'�y���h������H;%�J��M�@ok2���T�92k'����1����}��ךK�}t4<�v@�h���:�����+�|�����*�ώ臟-47u�}�7�����sEQ�b��D��Ƞ:z�*H^9��L�̊^�LP�h��T��x]�5�c��Y-�K�0�2��U LY7��v�f�-���r�ޫ"�?���>���gW����`�u�c�J[��o��[��ƗvT���ݗJ��o��������u�惧[˃n���L����U WX�0�M�ѥ�=�����z�%�!V@$��^RRUݧHl�ӆ�V"N���^��ȇ�Q<��=ۃa<(���-Z�qQ�ʳR	�������1;S^x��3��z ��a�cLf�eߝQNՙx�t�xs�N��4{�~^��q��Q��m���=<������Zm��k�N��za(�#Gc�猝�P����'�u"��]YD���\d�E�xV�H����+c��ֿuZZ1��3�f��ճ>3�>9s��K���K�<��"r�����L��4�ĝ���u��Y�a=�[��.g�NR�d5�A*-�"�-��Z�����Y
>�l���%+h(���zhk#O�`�vl�gF��GǗ������X^���:��nA<]�iv�U��[��(Q��N� �^_���q�q�F�)��Bu�KY�2Y_���ʄ	k(���Yi �4� ��_�tb7z��z �ږ�Zڳ�s�*t�����LX���q+Iǝ���Ѭ��x�W�u��`h��s�M�肎�_IϧlM�#t'M���Ģ��Iq�>���\K\/�sA� ��@�����uE�{��7K�S��a�%^��V��N"��V�c��+m6cI�99`1I����\]z�$����-O�u��{��X`|�O�eg�sp�9���O���|g]V>����̅XQh3M.o^3���l�ૣ'y,K?���$A<���� �1��`�T4��|~K4���j0O����c�<��ɋ$�#~�yrq�;@�[��\�Bg�IQ٩�������� �wVR̵Fv�)A�|�?���B�9�]և����ލ�Y.���������� �-]E�Q��ՑY�u�oq�X9%-	���4fхr,M�}��A��a�1ó�Ρ�0��/SFeԿW�̎Q"��L�P�����s�]wW�h2��0�����3쇌(����tU��*��	�t,�!��F|�y[�Ѿ].l��'�dV�ŻA����J��Xl�*��6Zۮ&��:늛��/��0��{���1��E���B���>$歕ำ�v7����ƽj����}�P���J�3\��##-�2�#�7�|��-c�F��Ԯ�x"l-��]��;᠝���/��XG���m�����ʒ�Jm��;B�i��Q6h'�wp�_��#NZϸfk��,�"x��E��R���H!�d�	�,c�Z,����}�|�0���Lz�m+�=_0n,=/jw��%(1���)1�«��?�/=�A>چD;*�����$��Ș=fM�[�KqE������d�%*L�r)�["1wNPq������˯u��Y��;�{z|I�E�>���f���u.丁�v����lU��([ �ol�X��cg ֙��#7<se#8_��1�F��@L�$���+tdR���6I(��B`Z، ����Y���\����=I�g��un�a���P^�1�n��;�$���ܵo���vYD"-,�4`��|�dU��h�S*^�����Y(�)�&c´�����^5���{g���G�%��|����Ո���j	���u��x��=Z�>�mE��o��t�-�h]x�	#e0�{��<jm    
fԤ. ��x֐�Qe̪��M]@�"��k�Nm�Ulx�+��>:8n�:܂5è�e�_�魓��B��l�_��?����nOB�;5��Z��7��������Bo��h�]�f��-�ޘhlH�'&J��zS��p��2q�b։iQ���h�l�GЅ�FI5�n{�y�׳����r춦��Q��@{�_�I��ɲyu󧶫u������_YT��̈́B��M#
�z�s�E�D-�;��s)E��YO���̊��Zb��F�$����]��v�f�ݦ��W�}zrљ�4����\�Q9m(��K�hIk�����g�g�-b�)�;f�a��<�~f��>ĈA�/4��ia�{|L��1z|��\X�nP"K"�� �3Lܶ�[���Yo>Xt��wǗ-��B|s<-|z'fX�i3{9��S���`����	Ҁ��H�����ǔ,SD"e�g�[��91�����j艃6I��KWt��r4��VE���=��V��$��K�Y�('\�O�	�&���f�%|3�0C�{��>���j��+Bau�sm�L������6Q	 %�����);L߃���c]����ۤF�%���<ˈ���WGCE?�t��d?�C��z���d	M�0J$C�_�4&�@FåLz*Ŗ(�9�0#G�J�4�Cz��;��`�uFShc7�����g�=%��񅼪s���n�
�/Vtg��Ò��.�Fj��!��8&� BLQ#��* Sʡ(�/�ԅ/�r2��RҜ8i�,H��Ő���Mc����Fꍻ��1��U��GǗ@���n��s���}W�s��l�#c}��d�@�m��oBA5��q�J�j�r1^rY0��1!�m��N"|�0ԒܕT�fZK��������5jۛ�Q���NY����,��a�p���n����BA�r�T�uNE]o��*�PFj#g�tR�����kS�hq*�%L�I�$�Q�X�%kq�6ѼH���X���,�og��jx����I7�T͛kC�
L�h7����⼤�G%���԰)1�`�$&��"]�ҋ(�Y�t�QP2g^�m�Z��e���w���}[�km�j_�m�������6j��M�­��2`�ĬgP4Jq2a:B%	��u�Y�BW�'�9hP�*V%���P)r��y�������qF����Km"���ȽY�x��z�vYme&��v��I �Ԛ�yR��A,>XA�&��ÓS^�!L�X[藬p�[���ǠHɬ�����)F�2�����Yc�
�����9��|���l�4)=�'���b�t��*�q��8�,��rc�hO��fU!s�Q�Vϋv\K&�� ��U��Fd�p2�,ԅ��!�3D����^�&��_�
��1�/m�զ���B�`��wr�݁��#2 �������JL�����:�R
�)?�����u���1�3��h�����ܘ����߿횭��li�a��[E_����F÷G��W�Pl*{c�N�NI��@�صJ��������eB�,fR�F	Em<����"j���%�ŬT�6�>��m�L����8!d�@wǗŲf��hQ��:��f�ZHZ�Yu'����{���� ���;:F����$�f������3DU8�$��,��2�L�逿�&����{��"bl���]�18�e$�OX-������7V���L�2�x���<H�
���;�Ja0�.8�QMa�^&��=Sԟ��	ސ��1�"1�AH�C��P�$B^���uAf��=��*���.ʆ.W�v����߹L�dҭ�������HΣT<~\��ז�5��h/�I��F`
��U��h��G)��'x���e @��YaV�t�J��%6Ͷ�"��u���)7�W���Kgv_�� �C�}���?V�k+���������GD�g eI���!�<�g�X�)�%b��(>�F&_�a����Ϫ�^I��.ݞс� �����г;�ęH��;�c����~Yu��W�ld��۸L�!�e��K%v�1���KV,�^�_�i�G�S���x,)��H
����� ��^wv�8&�p<��|�j\��|������3�b�m��>����{�
����ɥ3,w�N镈�f�إv�zc�������鄞8Ly�
e4w>y�0��<�EdݻW�c�M�[��\p���4&qstks��ʒ͓O��M�ԟ��
_�T�gf��3[�A}(+�BNIǀ�:i�g���C�F�tK��������H8D�4+U��m��S��@��{S��N��WV����̥���־{K�:3�,��-{M�me���~�U[��7����� F�z�8��ցs̅��$_@0&d�����e�O&��Ş���OE0TaYr�Si[�%�c������B.9[�+�m���AYpN���3�� �e��ܛ	��,t��6�%��^5#mi���)�.kZ�eYH'Ӕ�#��s,��0��Z0�./f���u�J����M��6���ztg���o����n"jz{2 ���j����A?Y7����0�z©;�v򪯝�UC�~��Q89�юG�`>^�DO��,
z�#FmDk��-�[c M!�����/0큳��2���K	��<���=2W�3�eF��w�=|���"H\Xk�՜��2�q�bso��><��1�a�h�t&i�$��k�q4FF|͝N��6��q	=<�yK
%���Q ���W�e���3�`��u:V�Gg����G��$����u��eŰU��H�˸�]W�����Hxmt�N*��L���R�s.^���`Ȫ1��Ie^J����FH*[��I%�a��Da��o��������׌���/��ĺ��l����D�ǥm�|����]��i�wf�/�����#-�3Ki��&��_�,�S��l.v�|[��9|6�IU,�i[$Z�q=����E���=뗽��/"d�lk�/g>��G����^5ꕦ黙��-+�,ܮ�Λ��+&�z��`8@�	�Z���X�HAZ̞�^���6O�y�I\::9rZ�6)Ѳ F^ٚ��p��ۢ����z��cЯ�����l�\�;�,�<�Z�p[Tp�Tk������u{��i����a�T�RGg�O�K�X�!9HcS��qo�54��<�,��^�_eVRN�{|qĮ/���*7�=^O	��G�~��+3�8�nt�^7��g���(>
�u)�gD/�h'���C 	S�I�8	��rBܺx�Ord�vG�jh��iű�)*�ͼ�`Xr�{����KF�?�֒����
�Sa0��S��*��Yy'ev.�@R�x���-��^#bp֫�@��	WoJ��rؿ�����z	���5_�S�YzR���_תx7��~b0;I���g@��R[�Zb��M���*k�����e0�d�4Z�'Js��f����N���g=�4ݧH�=��#P���4{<3�R�.2�c��ҫ�S���ھc�`�4vs�;��6,-�:�T<(�C�%`䜒7��Nħ�h�@kk<`���.c+����V�m���p���[��Y����ų����L�4����J�[��p��I�{���&H������S��/^VE�wA�E�$�^�:�x	&ڈW%b��lfNE�l����P��Z�Z��'����i�Q��c��}�֐�rr}y�\%O�4�N���.��{؁| �vkG�Dg�A�)����T�8S\z�sQQ�|�X��B ��aCRCY�0����p,��K;R��Yo�L��	�Ǘl��ך�%ϗ-��8��3���﵁�9��@�c��������`�K#֗3���T
q�iDu"E��&|%�I%M�HPi>�X-�`¥�-���m����O2�3�0�׳ؑ��e��-$��N	֒���O�#t���X�)�.�Ǡ۩�facx��Id .z*^�Ïy5fbert��    �6@ۂQ������vޅ�������N�bwֶ�F�1�g_��e�^�w#
������݁�k� �zv�'\�gD�vw��W�}WR;F��P��\�3�z\K"��$�����=��is<ΩX!�rp�Ӓ�+#U�bHjNn��l������ƻ�K�?�E��/�Q��5�{:�vmaa�qW��ww�����$���~"�-ӣ5�[�0I�b�nM���Ϭ`��I�]���D��"br���.M%֤�Z�D |j |��s�	 Ygq�{6 ��/sl��	��a���)��2s�h�;@�庣E=�g�R���-�d;r��a��˝"�):�`&e@!uB�^h�Xy|̳��A^` ���y����X2c}`5l�ݳw�z���~�����_	����c�^�%oe����n?�p��2W��c�Y����)3�v`m E�K�phzX�/�0QK�$�h�ĒtV>t�;��}3dp�k��:���	y��+{�C���,�����/�M�C�h��H���ۋ5b4Ɔ��g@M�r|{�+lтd
4M3F�)Cx1w�I�g�U��� E)���:����n�lp6���"���K@�L�e�y-����1l�<����f�� <B�����a��0FW�N�G�iQ"Ųc�xƠ	�JrA��TH"H&��h{J��y����Y�����Y~-�-%Q�{��<Qc-�*���̀�,��֙����U�mn]��K;�<��C/�b��)9�>�)�ã�F���XLp����(x��>J���!@��Y����	f1OX�<�TJngJw���ǣ�W�)
u$�Z���Y��h�u5���-4##G�Ȕ��E�t�,r�: 3�d"�ȌJ��R۠2��o�RxR$�_w�ͧ�rЩ�2�픖w_�"�L;��V{��m��l�h������f��s'�&Ny����ܫ����+�X�Y �l�_	$4�&L~i� �\|f��|��n<�̚�c:X*���宊58Lt�6��s~��zq���9/��󎤽���`TS0��(���H3I�4�>�w��()���NI�)�������K)�����(kԤ��4b��s�����k��y��Vy�uz�p�=;�]4A�yH��7��uu��?��:��`��[�f�$4�R�w<˼2	�k����1v���.c�ڳ�����B����K���w��,������Ɠ����i��0ҽE������w��B)�D�o��:�"�[�L�J�x�5c4���!��򔝓Θb���&.,�����d�Sl(�U��9�l��[:���u[f�:a)�ӣ g���&�z]dD$0��2SdC�)Z��ۜ2�.M*1��J�T�E�Q���s����g���^9kw|���2�1�{��cO�V_��T�˰�������4�y�1��hY:�TTA�⋦�6t4~�9i�
&�:q���.c��m��hO�]o������m�z,Z���I���	���R�YJC�ɘ�N����|��d���͍2cCV���v4�ʥ��R�K>1�cr���H̚��|�E�����L���߁P�#��K��U���p�(/*3�]1|[��n�_�𯪫�e�6�'��6� ���N]��)a��Y�6k#����QyL�h�9�H�ʕl�aNF���s����$f��P?` �v�I�f-[x�j�������i�j������0(�1&E?��]�B�/svk����FkÇ3%�O)@���Y�`� "t�Vt��*)�H[:Q%��At��z�"�ǫ���s6��N���<����sN��{� ��n��i<z~v�P*9x*ς�1���ƀb	�F�y���ρd�'�s\��%I�CvA
�BΙ��邊�-��g����4M��O�cp �P8Z3��j#i�k���k2W��4ї<֛\EO��N�Ւ!U����Y�U��s�Ar튳I𠲴T�ÛQd�P��v´�zG	j�̔A ���	Z� ��_�.���A��>ި�p�(�b��˙	`.����_j�E}������Z�}%����,��ƀ���-H��>���U��\(�cb�&�^ H	=��<s-3�\��G;޹D�-��7T��.���:�����]��Xz�]��,��䖟�ϬA�k�����#t��t@�}�865���)wD�࿭tR�i?Cb��ÿ7h|���&�DQ�h���L�x̂�0���MTVD��س������353:|��57R�o��e��bK���}�d�m��	�?Ti3~W���\w����.#P�K ��\aݏ���8^��Q:�YD�d�p�����)q]�p�d�eR�CѦ��yz|1���O)�bH�3ݾ���������h��E��Ӿ�!<�%�č��.� ��9�m��xo�� ���$ʹe���c"zω�z�JL
�c?�K�^���+��p2�D�����3�����r7�*�?ZE�Z�^i�n4�[3r�~ Ɖ1�߬;n|�Kv}nVĶ#>ٰ��{4��:��-&)&K ��,�����+²��I V��MK��:����z�X��O���h��h*�d��6����+0��ձ�٬ 0��(M�Yd�TH"ҏ~'|ʈXbX�N!�AxŹ-Ƌ��	��)pn����Y/vr�ww|po�Ů�Ӣ��fy}�k��C�umw��ݦ�80@�f��uǔ\ VK��]�2����h�*�R0�P!$�#c^��b�+��=�Z�:�W����^��;�$-V�N��u�����z�gz���mle�h=_ĥ2�`N[7�Ͻ��ǜ-�sa�A1� 5���W��J�h��SR�\�%R�H#� ������v�P�z6z�����!ѺB?���*�>[B䟚D�<��h������&���{�=����2���������_��~���p����=؈�R������d|P�$)��F��(
�zJ�Jǅ�J˼S�v�wW��lWDg��{֟,��^9Yn�Rhˋ�Z�Q�����
'���4'�fD����|�\��G�=Y&�*�cm]2��W��;����� �M�I�Hh��s��n���M��.�����1���l_b�[?l=����y���G�A{��x`�-Ý�����g�����9?�k��_�=�k��{
`|Ԥ)��ɨ��g��`�d�J��Q`��SA!�!2-N㎴C����ޖ�`�������Y����Pޱ��e�p�,�K���r:HN��/� ��Ԩo�%�n�����z=�Vg��xY��]�=�r0.��*ֵw�H᳉*�4&Z�bN��ݺ+v
���y�EbF�x	����ޝ ��M�d�m�z��g`�=3��=����^ț���]��B�zlX�F	Yo��p�I�T"(��$������M4C�>�� �S)�e�h^G�c��/���"4�1�!�b_�{̺g������r�/����o���zf��[�Ԣaɻv3z8�̀n���A��)Lz�����]��y����YMܴh���>���	;�ў�6��Y0ۙ2�7>�c�~���.ח�p��R��eQ�h�·�V�B����}�m�����x0s�=�έ�[�O=�Vӭ�Sd�GA���lt���9=�*y�`#g������F�@k�&{�_ۦ[a��ܲ�3���-�������M���#^��ɽ#şF3a>�ux����ē7r��`C	�^�9i�&�n\�TDe�LQ)t#��ez��ǣ���GI��w���~�k���iM���5�3<j��F��D�"��lj3K�"}�z<�~�e�^�oV�>��'�і��	��0�ư5scƢ1g���(�LuU��1������6ۮۏ���y�_��}�(N����\��Wփu��n�

�� ��f4.6Ɣ��p�#g�3�h�5*���*:o���L|��J�HGd���k���H��tK�18�Qjl>:8n/�Y���ɳ%G�	/[�|t�`> )��i�\��
�VbVx�Q�    �)M�Q;R�).l��:+F��.��VR�	�M����<������!��^��%�H.���-nO�˅������Ub-��>�?Ϲ�k�>��M2�otQ�lȧ&|������r(�M��eȾ�T4���cXMZ^��!��6d�B��������v���/V>��� ��=?���*�wk���RlX�'�cYʐ��Ĕ"�m�ӆ�)A�Ac����i�YP6�sK�)t�sǬ�1׹��Ԥ�����Z�J8g�dz��l�#�S`� �3�W&KL��&":��f�DTAa������hS����Pt�^о����>�bgz�����G-�|4Q�ʴ�!H�$�Gr9���O�$����{R��~p����
2���s���H���f�����jtN�QE�p3>����]��7O�FAM�z�c�J�QU��!��G����u����^���y�1Go�>$-B��޺ڴ�,bp�\Hr.=�F��<e���C4A!���I��i�3;�9�'�&����g���(}���eB�0�ӟ�6n�pn���w0���XN�B%DǣQ�Z�􊺺6'ATc>ab�2�ː4K�&~W��N�:#h�p��]�?��u)`w����/z����&�pFp�W�Mz2��qA 8��#�Ye�XF����/2k4BaS`)J�k����@�3�'q#�y���^���튠՛�r��6:�E�����9��7u
��j�/[�`��>��͕yץ���*�V��U�1E�SVA����4�A�5b��,ϞS۞4VôS1���8!O��tcSi�6j�X�zCW��l�_��k���Bޞ�F����vk
�w2WB�Z�g���X��2���F���Sv��(SA��f"k�rV,�����M�JӁO�6��Z�� ��I ~�tQ-��/:5v$�{�J�Df,{[}oCs�3ʢ}aY�EP��l��O� �ʕ`���U�Zi^�=w�|��U]g}�F;A�J�%6��"�|��<l��3]��E�GeA'��	�0G��������Ҏ�����ň)���D�L�.&�zl��؆��ckݳ�����Of3�@Oߛ#=�Fh?7�̈́�@%J�k�2�A���+U\�1н����n�'��,�Ic$�M�R:jb	.B�h����b��!�`�/�.���^�j�3C|��ն������K-��T��.ܜ�rԓ�z@�4�PM4o�a�
�G�a ����LJ'km��p�5<��״Yxp�9ˇ%�G����ûLpt����qs|�j�cRv���C[�N'h����cy��?�_�YߞjǼ��/g�7��f�l^��=�����#F�s��'f�X��.*I�@2J�9WS�� �@���P�,(��ފ�0��\���f�|�N�Ϻ)�駘�=S̗�L�<�ro���Ho`����"�C=Z�lc3�z��9�&)Ч���J��L<R�����aL+�8c�[��m*r�"��M��$=f�4����s��'��g��2�w_��?�GPzbPm����VH��OK��!��Y/m�Ɏ쎯+$ ~i��h�� �7k�t޽�GJ�{a.�51�rr��7�0iG�D���Y1J�C"Anż�.�T��a��YYVCn!*�Puvu�^���3��=��;t;v�C��������G~�JnCK�d��j�n��o�SN�=��%A���/��L�1��e-oK��*놔� ���(�4	���YF�hH�v�/����Y����'�_~�W���SR���?/V�]���`gp�Pâ�U)H|�9Ƥd��ޱ��`�?P|Ȋ��ǽ���tq����9�B���{��������q������
����̗)k�f}=W%����ū�
ɼ\��W���K���Z�7�u�An.����(�/���7�X��֨ iQM��^�HD�B�O�����
\��s�Vw6��d�n�_m���n87��?/��b�k������oj��t��}�ѾhJ��ޥ�2�$+��VզޖG�\�}����0����R��Ι+b1W�6��L���1�$Ә�'L(AM=���xS�� �l�JYp�s���ͦ��Jg��M�q|��Xg���񺱴4��^�JMH4A��Jt���D�r5�c�dH�$%5P��z�<�$����)������E[<)��JJ�"�=k%b��)��.�7ó�l/��_B�w =�[������Ч���KO�E�;�gum�:����fnԎ�s�
�/�zb#N:FKz'��IK�5��3e
��XT���%������m�]�su��A�>�R��"B�N�vE�C���ݻ;r�i��dBj;z�� b3Y0ZG��3�:c �^rI���q��C��(�	�2�
�bf����쟗���L��&���ӥ���T-��5�z���>[&�Zj��-�n��>�8"#���ލ��:L�#'$�S	L����2����[E��"���j�y���nj1�K��/�&��v������n`��`Pf�r��crD/�M+(̌�AL4�;IC=S�9t���iph�2�>�.�.�����J�zeu֍�6Ǘ[�����e�s�X|1�K���y\��Ҏ����\��V^o����R`���*��J�"%̐УN�+�l�DK��3	�}�X4���)�	7��������l�V�o.d2�f�I�2�1|��M�YD��'�y �}�oE1لI�A:z%�ͷ�ԏ�)�I���K_��Gr���]�rp֯p: �:�#m����+���.DW�V���u��XW�(1��D/�.L'%���d<)���;| O������!�\D�[�'�-}7�Zo[�B��k������B�u�[?�C�f@`2Ďd���*�����g
���f]���ZbΎl�&˼u$�h���_G4=��Ǝr��O��<�Um�6���эF�0���1��a1&�0)���8U6\+5���Kh��«@$�"d����.pz7ﱛ���������$_�V~�"�s��=Z�En>�82:��5{-v>�4�����c�mqA���J���4��`$R��!�h��)[�,�cg�F��lt��g]��7��;��*3b!K?�i%�Z�y2���3c_��Zf<^-�Po��~�X��/�hw�yP��Hq�R�K��y���ߊ�3��2@�z!F�7ѡzD�Nee0��ɬe	)�*&}�k�������?�T��ٞ�Y��'$��׬hrWU�;*�pkĈ5�����|f&��L�5�5��S fC��m�J�@ JbN҇����̣��|g�ys|��k���2'�M��/.Ɵ)����V��6�x`�ֱa�u��d��f�%!3�#�9�Ex�:bd�8�H�8���CH!�������ϗ��+���43�m�U�g����8yGz�w����� _���F(p��u��RaPZdR/)�� ^�����%I D��[O��M)`tk2dɭ���CF_���V`?��E���X�����Âȇ����^�]^��4��{u���_�٠$?�A25�Y�³�#Ӑ9-� :�I��ˈO�d��<�(Ж!�u�|HLp'U�]������g=2
��#:=��n4�oޛ�.�<f�u��=j	Ї�jn����F�>[>�S��L z d�Ո�M*�%Dj�BaA1	��.�I[��NicQ��[�4����ġ�4��v7����O��ӑ;��*5gQ���>q�1)g�;��2��v���.�j�A�E���R��E	:�L%)�F;.I�M;H	#�� &c�QE`E
���j�G�6���Gg�Z�棃��0��g�>:z��+������8B��w3�q�xb>���f�c��b!^���ϕP M\���8.h�*KY c0�Ql�1>��� �4��p�O[;�����;�\L�w��3o��M��Z(cG���X�"�T��U�h��%�͒�0RL�+ΐ�w^L�J`��w�J�aMPN�����#�;���p�.]�o��_۫    �~�mi�}s��w����Z�ҪZ��!�Q�Ǵm�����`J4	6E��LH�L��q���BS���*I%�S�:]��2_0>��xK�jm����
�	c�����F൉�<�?h���S}o^\5�5��p�д-���cC�ho�ZI���
���Z`��&��+\Z��@k
�d��>P�B�����K�_k5z�K��m�n~e;��9���5�}Es�u�2ٶyT���gU׼��-��g�i���0����%>9g%�T\��ؒe�)4Ӕ������k1�ΌR*Q0�vҖ$��8[���C�l:�sɜ�7�g=K�|tp|	�=�U�m7�H�|�R������F�I��P%o�E��M0��T��0����"�	�q� �H.�<9��L�,-b?�\d��UP�g
���W��\����9>^k$���"�vaE!~"~�B|O<�qϘ倅��x�@��U:h�;��H)C^W�H������a.��1$�(J�;l�@^l;���#u������㫲�6Fx4|��l��(�0��JY/n� G�h���Vc��C
��"���Hgx�ΞG� e2�f����M�<�t=�[ƏC�+ȟ� b@�����t��:(ڂ���QN�]�=C�cL2@���3�Ey��D�Lc����0Ө�
>�&:����T!GR� jI�j���c��K1A��Y��+�i:"�ΐ����'�[�����@V
�5�1�$�a�3�XE���AI��&J) 84Q���݃|R�%�HtT��>�z;\��K ~��	?Y��׈��A+J�`�Ct���F�ohe��+&4_--t@��]���g?L���X�I��!Y�M��@IP_!��ݠ��?*�>�__On�_TO>�[<k	���-6�F[�	Πg0iŘ��Y��Jr���� `�L�I�5x��bĤ��9���rݸ��+zZnZ��.��O��U\Mz$��q>��m��܃���%q,��G;�t��_�M7���B�r�sFM"��h-�̵(1:O�)���$Ǧ�t�Bd�	�9�|�<m(-
F�.&%!i�ɺ�B�V��?��I��włV�z���G������˼C�/38����E���<p���T�� �䴬�Xy�=��^DaG�:g u��eT��i�/ɬ1;-(�Ҙ��OKY$(B���A*�|J�r<=���g�_k������U~��Rz��Z�꿚�Km��K/V2�5m�Ԭ�#�����׋
��k��� L|�+�p%��<�n� �gF���&�FT���c�u�$�Z�>̛:�g ���qk���&9R����M�/� z����أ?Yx��~S�<��ܦ�7[������3Ȃ�D�Q��1��Ƒv��ݬJO�<�1E��MBp|����
��dw�Y���Y��7��
Mn��L�|Dhwܱ�G%�9��d�X���z�����o��ܱc�������Ƕ�h��u3���@�$�K�)�a�<)e1 ����@�2^/d����P�n�!�;��~�Hw�D�Xw`vi��~<L�޺	#����;��Y*��KN�XQ,�b0�,M�NE`f�2I^�fD�v9p̔b�}��v����E_��ڐ�eȒf�[q��2v�����Qq���H�DX>�Y�e$�#$��]bQrm�<j&���%�+�F%_��e��������<�����V[Q�ۼ���"(�EPNUJ񢉩Y	#K���d�QOF1Q�� �J���ZI/���"x��L�H�U�{�g��Ǟ����=;>zq��>m��Mǀz�B�|�Z���Hs�����B��m��W��B��[� ��Ab&����i�*R��Zt�̲\,����
#��d!��<sOxӻJ�S��5c3<�+��M{w|�LS���KL�`��.܂f�ոM�h�aJ:
��٩-~�
�`����I&�F��-"��Cg���2�`��0�"%!#>�Ƒ�f���{�%Yf�@��D+~[��b�m���G��G�	~���[(�f 7�{G�=Պ�,�җ�fPӡw'��R"@�H��v�P$Xr��O!1����WVZ�`��$Y�L�])�E$��ө���(ZPyi7J�?����x���%����?.�N[n�/f��d�V��Yg��~�꓿���?��g˄�냆2����?��޽U�A���X{�{a&,�hl��O5+Z�u�&��p
�gS^nh&'˘������s`���tj�},���/��Q�~�����k�v�i^�[a��l����Ơ!1��=��!�鄧n^��X?yo@k��I�x1dS��^:����xUE��+pf���)E^��z�1�I/���C��:���gK�b�ѐ2-�s��Ct2��_L�@	Lk�Ii+����6B&�BePH��+m�DY��r��p�/�����݅|��+��/�����.x]ӣ���D��ˍ�M�����E��U)�����/�9��#$�P���4JQ$Z��PD�S�	�U��ݳ(V�$�Ĭ�.��lW����u�z��5*����k���t����Fb�����a��#Y����!��������oz�A~�m�Z:q�u�������H��D�2�C�S�h�'ϱ��с p�i�
��x�`��u,V+��U�����Y�d9��z�-��e��p�'~������yY3�p��I��E�����������p|c@�t%E��"0�`E2�Y¸�S�!k�I!�`&g��
5D9��9]�:_��͖�e7��?��gx\�K���2��d�).�C?V�޶a �7h`\���3�!���	Q����J�m#)���K
�H�!	����R���.Y霘�"��N��nb3�{�Gg���^�9� e)�� ��=h1@���v��/��M��K*,��l�}:�e�.q�S��Z�H̝��8D�	���,L���飌���a_�/�BKM�ׯC�s!%�<v�}��"�u�i?� ��o��_��cI{hGKL���=(�ᓞ�b)
B��Hu��J��F'h������N�֗l�S��Y���4O��B܂�SLn��;{�ݳ�niw����*B��։�e��E��/��x�d�*�W��.����#}CI�Zd�4G�Z%'C�l��^�n0^�ਯ�ʔ���;q�u he����c�ݒ�8�,�o�E-�*Eߏ������u$8��k(�����n CA(�"��Np7���W����T���ArD&��#4?�W���rs����o����%v�Qq����`��m�H�<'G�&9*�:e���?+(~5�'zU�e�y���߯��:���/ށWxչR��a;`� ̑MLEM�	Z�M�y���p�"Yx�#�0�`����-�H��v>������	q�\�W�륁o�R����'��.	3]>�%�8t�畧���b��boGA�{.��%�4�a?o��k�T��ue���)D,���b��c�M)�����O1����Zc��G��s���������&��q�����q�����5�`�����1 �M����g6x�.���P�D�,��T+�`Sm��M) �`�o�D�w	�������LyG2��������ɔ�S���������W���Ps{Pfon�H�|B���	!��pO��dd�Z�9�!��(:-q��X�����$n���j|]�cT�N��%�C�"�ߦ���I-�F�|�n0�����tϠ��t�9E�Q
��GJ�II�x�2�5(~JW�2�����1u�D��߇��|,%	��mW��9.��O�b��o�Z��;[�!��%���^��];y۞�5��k�X^o|���E�sD�bi6ˑ�)1���@�?�<�]�����e��ȧ����e��L�H-k��=�rte��1��^N�-]h�vsp�iCv�!���Z&#��km����ES��V�$����t�V�	�Qγ���`�n��QEQxa�.�ti��5I�����%Y.�p?Ԛ���汥���    ̥	&Z�nR�f��Ɉ���3�q�4f�X�8����)��� Ng��*R?H��6�
ʱ��H.x��j�:���j]kj�ga���i.y��r��S��/���u2U�R�b7�ot�BP!��m�ļ��xi6���
F���n���p�^n5�e佤�$���}�����&����֏oص�`][�[�j0�EY�yV[�Ͻ{�z��!��KCg̩��FGs�z�3��4x��	LwR�=�a� YLD2&��!�jN����H�+��n��1�,_B�#��=�����W�C��6�l)�|��1 �+��K�%8����U��0z5�K��MP,X�C�Ԃ[dIܙ$����T����$�z�a�'�����޶ܼ�;�������Z����Y5�Du�p�y�r�4��(u��,�#�s�,�3�r�քg�pHirĒ�:le kZ�~#�.��q�*��x���<Htd����5�� ��ρh��L&��er���%4f���"��5�q��YC�"�R<�9Y�A��F�ߪ��s�t�����U��%���������'��NX��<���0���{ɍ� {�<QY专�D�u��H�`c���:��4$7��޴�������a\^9v���γe"�0����B�AV�p	y2��l�6�3�s}b>�'@L�}�C��l�Pz:{cL`��bG��@t6[��_jа-M��K����u� `B�AS�95�I�+�ݠ����J2�	��i���@��ڨ��9m}���g5;$����Z?��u`�(#m�:��������V��Eoo�(�ےl!^��X9:�Y@}�~&f����q�Vܘ����:�<	��N���!�&d�f^x� o�+rpz��Ǭ����O��s{m&�8�W����U����ʨF�߮���������*-���:���2�]�����c�sjrJ��~�S6kps&	����:�bƃŎ�K� �L�B۩*��q��գJ�h�'1D;)�f���Be-�s�~�j��������!�Zh_fκ��|A�����=�x��J�JJ{HSȚ2��$M9Z�&�bmV�8ș����ô���',�#VW8��|{;�(�E��N��i��xSƲ��~����ޔs�DMe�UTfo7�����NX7�_�gEF����#���������\ 	B�W� Q������ާ�ό3�s�Q��Rw�Xڐ�5����.{3�7�kٛ9j�"�7�8�2���=�}!�a��>^Z%����$8k��m%₿�3$��ސ$�0I�S�\B,���!��Y�F��h�*���d�GE`'E�]��%l#�3��$�]�7�t��ŵ.��r�����ma�b�"*�Q�9�y���(�`���4G����f���l����޶Pm+�)aV+�/N��{5�5����R'�+oS@5���\��������-�	џ�������"�	�K��{6W��l���Y���=@ O�wX��7E:��ia����?.��4�E�]}�CN����Ԭ9�r��\����� �L)�Gg���97��YF �+��2�p��3���(UL9����Ci�$���#S:�_�BW�	��(3w�����Om���̅��{uOJ��|�?�^�V��OE�@�xD5��>o�9�it�gQ�(j=
z�D�`�]��W"e��Y$���QCdi1f�Ju1���w��$�w�|�G?�/�_�L�J6_&���S��<EC�«�M,h��1�	�.q.���9 \��3��;��Ʋ���ӑq�2�"+�: �$Fk�c�K���r�R����j�U��uG�0ծ4��{���Y�X�6�"��("��iB����B���l����~,���{v����P��vz���ZaZi<�G}tz�p*��6�A0vt�)�O�T>^r��o%���lI����[w�+�Y�L���O���du���B!�Co�ojB�ޤ�-z#M�O(�!����1�p��A�&<�Az�rX�����2�t�\g��ȊJ�>r�WNc9s�K�G�Ԑ�iGR���>��h����Q�p�kN�Ռ�v��lK�����_�g.k0�{-)�ȉŌ��:0ʑL�1�	�2$�4vT�HM2�?���e��!�}�R�`�h��G��&�㫗��r��}���^l���P�b��!73m�w��
��g��k��.!�A�fF�{��mg�Q&d7�	�K/XN��$���@-��A���J=8��)��ݭ���P�V�5�[�8�G�M�z����?m���L�fI�}��{�ZTٺ�D ~&i8�	�hp��V���/d�p�#o9%:F��9���G9k���*\b_W�����v�`�g�ǜ���W�!�l������U;���y�~�A%6  ���]690�p�2K��BQpŬ`<:�Q����Xf����W���c�����f��Ss����vo�N�����c����+^���ZX����#����qC}L�
8��=�*fT�"��-y��"t���b���}��8�����ZS<k,_�_Ut�U�}	v�L�P��Z����7�@&o4�b��� gq`�������Bqg��418�����j�b-.�s��U�rZ��ߞ�T���!��ko�������D�b�,g��_��ϒ�|�����X���Ǧ6�*S|�Y�{&z'{��jt����q�	�_#�FHiME�L��b1$l�Aj6������N�đ���M��No��|]��tE��)�7��Vzۓ�>��lۜ�;�|`�ky��y}�ba�2;��.���<�߇7s����ڶ��e�?]
�m��~%k49��4C�1�|-� <�6p}�U~W�?�1L�j���.��!���4rE�2���Vn�ơ� =Z;�8�G˗ƍ֧��̑\y9�p��mRf<������?�撾)���� OS��فz�ҩ�d��Mk �<mj� �3��L+gRR/��d����2��Y�$RHZf���Ș��oK�kF����\�ɥ�v,|����4	rN��y4sC�l+��,
�Og���N,�l.¹����$���}��@j3�w�� @��{�#,F$j3,�� Q�n	�;�rN4���"✐�ۣ�	�"u�!f��Gu�:���+�9�Q���yx�$P�Yֿ�m�lfj�UnIӥ�~�{}�?`�fu�r2�d]�8�`*���	�N"�]�ÓI#��&j�9�k�	���+�" U�ҫ�
Rs(b�q���������i���P���(W�I��N}��z/�NKS�>�}�G�A!�L��3�z0�.#�5p�Q�Kő� ��w�Y�I�F1`ΩC�"�czȩ�C���%UNw7���=�3�����ߩW� XZ��Ca/f
rd��W��ú�N�Zl��ʊ�������:�����?�T˯���� N�QSLD8��k<�x͝H���`s�+@��.Q�i S �u�H6[�w��7�ꝯ���7�`��+�V7�]��5l����w��~��j���I����MZ����@sKgp4�:����l��w�p�s�y�E�4�D@���J�̨�Q;&H9NlƑmq�b��=��6��ZS!i,W��_0+[���!S0k�<7H�8~��}�����N�aT�������h� �S�[��6�K+<^�����x":�T�
>!�t��C֪x�jt_�&��5r̮T��G�29.�ȱҫ�$]Og�G����^Zڊr��O������T��
�w<��&���dmdt�f����qƌ@����d�4c؉l�
>��k��=<��#i_C@2X둒�>)�萒��h�u2�U���zG�޷����k�#��L0tz�;8Vy��&��A��Ch����n�IIs$�z�՚+��p�2����М�aD��=�Y�EkJ�_gh��䔈Ӆ˔�m�V�t[�n�К��G��ع8E[?l.����ǥz�x���L1TgV�{���;5��    ��W`������i�08�iE��%1�$��d�lr�L��!�(lk� ڦ�%���B�����e�ǉ�h��z޶촜6�sx�q��8n��W���K�}�|�L��\���J�o!�z������ӸV	�[v�R.���,?�O��O��/p���zCX�Ζge6/h$r�L��xj`1|�`���R�S�Q��ث��BX��;L}�,�`��p퐮���+�[���nI���Z�«M���RH��\M�=Yb�y� 9�=�/6����Jj�0�]t���76rEũ���gȆ��:'���	.t��c`��"��P㏯+�V�n�냵^�}��>}>�������?/Y�]��"�����~R@��ܿ
�[�eh-�8�_���;`ґ���x�a;a�q�(:�&��^#!+� ���PP�:D� ����:��'��0���оB/m����h`�˗ynFw���p������=8p���8����3�26��,!'����X�>�,s�u�m�U��U�,a -s�!�y����ZV�[�Z֔Pk�*��'�&K~���i�u��0G���Jz�� �V�N�E��H���sv|s�1^2g��)��&g���������&���Q	����A8���-��k���G���+B��J�J�S9�+������k�(\��~�g����;ƣ'l-�dIE2L:I�w$	l$p'�H��O>$ڂ�e3�<!	���D�p(z sz$��C�8q��|��durד�ex�t�����n�`;}��kX,�`�F� g ��?Y�V��P��(���.k�>���`���3=SȄ&�"� �?fG=�Gs���Zb�fe�Y�����b�u?��Nt��&%��<8w�	Ðr'�()��L!����;.��c<�`��!H�kP�"f�O��Ε�@uך>��,�WR�hBO]J�*���>/׬�\�^�`%�lA��4�`^fI~w�pߝb`G�g�V,��1O�M�"U�Ȣ��P+�C�2�j�!�kN�l�H�C)R��s��6Hw�6�lr�w����S>֓jZ���ʮ=H/�}~���މ$4��+^�(ɤx[Lz8� �q^zp{��N	�O�4�fJ�4,r�x�	P���r-��|��jN�`m X���/cQ[f>+������E�qc�qÙ�i�'߻�����Iݞc8�?(!�o@qMi� ,��k�����䜶����3�ur&&�@Z~��$�n�]S�����%�ѩ���B_��a��F�������������:������1��}I-���� ��L���3?Is6�3�=>	��ü3X`�up5��D�w�vh��tF=5N�T����.<�s��n �ϛ��W��G��ۜ�U,�b#^3�SdD�(��ƞ< &R"�ZeX"Db�(���JA
�9�)C뒴\�D[�J��kz��j=��Zϫ�}��w��;�\1�6c��z5߯�a��!�� �O�Zw5~�x9�I�'�S��D���@2��T`�{OR6$�2�2DE�~�q���a�۾�ڵ��6ϵ�>���tS�?{�h��z�,R?/�Q|V.�gKCԮ4����|�fp 	60���H3�fENE�'2�L2���Qc���ex���t�p��)� ���i!+&��դ��w��C����,��v�P�GWHU�LwG)�k"4�}�Z1}�����g֧�1u�ę�����ɦ�XD!\��-���2�B���u9�ČFQ�do�ALJt�O��E�qhi���`���dZ6�v���w��Y���B������u��E����Z�7O��	�#��ix��l����ʃ�;҂���:!3w�VA8v�f�S](�0�v��H��N�S��o5m[C�mM{�.z���^΃��H�yDG]2Z�Q�`��*Z/������s>FrRBp�Ä�MQ0^:���I��p�:0��%|]5���o6�xg��S�)���Z�-b?+�Ϸ��O��oΗ?�~$�É�1��(^����2���l#VI[���=N$��GW$A-�R�צN����G<m��ZC��>:X����~��]��������|�i�'�ɜu߫�ަ�tp2�4���3H��h:��x�*ł7�:%6-���q2�K�1�h���fB%�=�E���o��sį��z�Ѫ�۶��LE�ɍ�a��Q�/���R���K��mw䤱K�?} �9Y��!�Bl��)���R��O��E���'E}�OYN)PM���Z���O{����`�W��Ne�|Q����O�����1��߫u��+"��ȱd �`jO��j�IL�L"Q�Q�)�Y��B`���T3��>И ["PWF���I��������aJiZkJ�^^�v�χ��^�*��Ŷ��B4��)��bn?�{:�m��侹`������#_�b�#"F��d	8��n�7��>R�"8��� &fǸ�(���܍s!��? �hshV �;4X���4��]�o�v��S*������:�q�j!��X��������s)�4��
Q��������s�w|ȷ#��rnH��I�B�@�G����d��,0��\�X�1�β�k<��{@�c����k��.�%qm{��<{��|㟿\ß:V��Ruy�ʅ�r��4�/���o����m�����ӏ�x�*k������`3*�7����`�j�8�(��@s�QX�i���n����5(��('�H�Yo������6���I���x�4��P�{w�\��67s^�M��P$�-R#�7�湎��P�����0�+���Q������X�)�DHJ$;p�\�B�� ��[�@gv�|������q��bʼ��b���*>�~�������_N�ݝ���d��p���gwq�tdq�t�nqz8�n��BT.S��.m��L�R��>G�'k�*s�! �6�܅^�;A�
��
��ޯ����r���?|Y�<)�%Uo����RY��b�P;?:&�m)�=�0��� 9�7A	>��"%�5l��6{Y��!�!�#M�>X��K�]�0�?&2�b���*VXxg����z�͞;8�������ΩB:�$��^z@03��q<�'�ι
�E9e����8ʭI�*&.�A��ܓ�!�[H�������$��9G��Ā�"�7m���п��{Ԯ��V�^���R���42�c�z��"��<P'�Pl�_�<o����38�#�3���$ʝqbM�	vL�TC�`����8ky�6�dtF�� �p��ΆAE�G����2�wR9i����O�R�O�
��������^��F[�����~�"�(��g���}g��5��~�mF�C�)x�98%I�ZƤ]b��h��hs�b�F���!-7��Ho����Wzu�Ы+8��w�:���.-�`_l�Q�BF����5?����ba/=I�V��[0�Vs�g�5�J��$�!+��^㓳��I;bev�(,-�� �N�B��C�(/�.l����c¨Y+��$���G��nZ�l��|*��*��Z���؃Ofr��N�=1�:B���'�6^��"�zԝ��=I��U���O)) ��wJ|A� �ӌ�$�$�.Z0}Ե�5��>6.4��^��ꝋ��^�r��\x�L��J�SM$���Y�p�\k��4��^����L�(|�Bs�}Ֆ��58w��8SJ���ۀ9��,g��J��2J��s��'�"��;���t\C�h���>��_�omv;������T/_�o����z��Zx+�U���������z�T�:�T�j>����w5%\P/zw��d�d��QO����#�Eϓ������	��
�� �^��BA���Z��A	6�b]�=|]��U� �Ӗ�z�U�o}t�͹��rO�[⇙Im��<E���y�����9k
�l�h��!;1#�m��V�7��8�ZA��lCvv99�Sx���������1(	)O�y&���F���?Fs�<��V�����`���f�    u/n�QG&_0��`�J �G���fF���QkO�(U�	;�q��,iJp$�sD6�����Uc+y���V���Z������~���=�
�Z^=͠O�5���L?ew��́��6D|�S	�Q1 |9f���ܡCqN��H���HZi��pV��P^(���>Z�S�y@�i���1Z���,_�]C�����Z�Y� ?.���V����T�Ҳ7�L�jM����(���;�'F��aF ���fJA��Ly�e�y�$阘V�sK+��f��۳�֋�M;��._���D09{�kMe#ҹHH~>��ku�v�?@KͰ+�Y���P����K�5i���Ԙ�����ޥ��|��򨢷L�=�R@�~��zh"��tx��V��9!���'�
�J�U#�o�`�0Ǿț�K�L��=�)�����P��b�"����bLFz���JT49�����é�JiI��Z&E���I�X�6��%)�>��;���Z/���9u�ɩ�ѧ
Vi�f��Ϗ�u�U�%K��^�]J��MF�V�ǀ'�XL2CQ>3��a���4��0��$'�a%��C_Ls夂}�\oS!꘴�5B�`x����0.���ݬ㮣�����=_���S:�풸נЉ��(�J���T�y�8��dD4�s	q��M�z��'�{p�4����M	,���΀Z�n��&k}�fs���'] =,_���Fs�׮��d[o�Ս*�x�@��9�gR�~/����\�NU���*�H�*��V�I:��(�		` m��_p��NȊqN���M��4�V�5�G�괉dk��Y�䵚�%�bP�ħ'�̙1u�Xe�3�K��N�߯!}P�B���zМ������s�XՂ���gh���5.�����v�1�i��	�a��+��]Ad���b��S�I�e��5��O7�x�Ak?��9݌u�_�'��3�KM�D4�OX�]1O���g�۝4�l�R��x8+��H���e��E
���M\��up#[��"98]D���������Z9,}n=��]�[� +Z��E|���|��,���>̒��at�N{������~x��;G����7�8d2gA&2�p���Q��9P������#�(R�E_��D�����2 ����\,�[ܲW�6x��-<[�$�Q�[({��~������R�q௝��K-�N�ǃҎ�9�� <qNN<2m��A)�û�7�u:S��^1�����6��5t�m��y��G����.��a������@��i�B~�dR>�;B�}0�4ց�02��`�u�Խ��纗�.(W����9�*��Y�BԙpN�S8M����H��QFp���<�D��Ldc���Oݭb�>����{�V�������G'׾C��ɴY{�*�H3�s"L_�DC7reSA��]��e�k��nz��K�Ƕna��x;P#騾yf3�9�1�Jh�l�
L�ك�����MT�q�hC�*(�!yYI�"=r�Դ>�`������g�{B�,z�k�����DO�ݜ�Sk	^��͗j�.��Yr�G�));&�N�a#`I$*¼��$3��:l��<��D�Y/�H�vII���AHC&E�F��e#h��w@��7B���,_�ޮBT��B|�TT��T.���1�:�f&R�������9D#0'!=U�+��sđ<	m��Y%��-���ZG�1�yF#Ա��)���턭`U�|%�5�Z��W��f����{;K�b��������M��@��V'�B�	n�@D�	�B�e .(���@�:ph�.���c�A��z��q��6_����;��oR���GR$玡qGE9����I\�B
�+KOMPAjo � ��qe��J��5�T�}�*�`�W��ʴ��2!��.���Y�I�ML+?�{�P�z8b{1�Qsn����#X�r9[���HB��\#d*��;Z��F$-�	�fi��O%5�/Z�����j��?�i���GD��C4���7�d)fO�ɸU7�ߓϳgS�dHFjTg�cƣ�3q(;�$XP��ހiP��ݩI�?Zk�����y���b��=����K��[��w�Z�U�ޝ�
���a ���ف�Xa����`)�g�� �L��Q��Q���
��z�j��ap�hd�{�<�0xK!y�����[khX�G�N����"<_O�Yq��g���%��:�U����l��@uU��!:�Pr�\z�|ʁ(D�U�TZCm�x3�h��;�T)LOᴅ�g�l��SF��u���z��w�ȫ;F0yY1x]�i?_Ĉ߬�Ue�KQo�Ӷs�q?Rq���#Nl8���Ӡ����z)�E~��8d�2#��0)Nx0T�P��J�<U$k��M=�V�G��"��y	E����KUb��xF/�P|;�}�N|S�zI�Ӆ���� ��2����J3o	�Ȗ'�����"q#I�T�&�|�._�!��}@U���[�[�z�����&!kP�f��"�ϋi����J_�o�A��\�����MΙ��u2\�Ie��Ҿ%D1�y���gF�b�Ɋp����� ��.CU�f/,ѡ�k����rM���7G�S�7������$�\���LK����a�|o�5�}/��x��D�4x8#Wi������M��*�l!v���ǀ"�p<��4�2����5 ��i%�*K��#Z[��u��n�Lka���ڮ�m]1m���R���JU#�����og��X�������V��8H#$���^������',��sl��1�d�O1�w�l��:Z��!�4���d�]X���Q:"٬������ѺL��w"��T:9�Ծ�ϱ�}A��F-d�l]�<h�o�~���\�����)�C:18��22*��z�,q���*1���Q|�򐜤�h��$=0���$N�����V���Yݶ��O_٬3gj�(��q���p�.�(��_g�	���yk����zXR��¸��B���-�y!��V�h���F9�@@#�M�
�D�5���x��uS�����	"ڴ��>��n����M��y0�Kfh����M��X�В�S��q��+0�)��4Ք(����'�K"NM��,��i�Ss21�Ju��c�}˙���	�v!���%Y�̶p2����F�v74V'<�=I=zP�����(��1�3[��/9'C��Y�%�&��&Ao��X�c䉀�>[փRca堿Ԙ���@h�g^eSμ�����0s�T�_V���0�`e�����>���C��ܮ=c<�I��#>W=�#�SH���L�R��OVD�S��N����u"�{)K	<&�*kN��������BO�����r\�#��ʋ�Ǥ��I�n���������YF�5����XiN�!��f. �MI[�m `1�ҥ�7a'H&�g %�'�<�
LCL��jm_+���bV�mO��=�nˊ��e�L}V��y��1�'�%�u�'7���㛗3����GL- �)G:	�%2�1TLBe�4��G��i��	� �I`�6zU.ux]0�[כ����܌�+��~�FuZW/�$�)���, �n �uW��A^�������bj��?�>O�idQ�e`�.p�����$o�
?�PK1'F86�/&`��YTO�Ӊ���d�6;�=���;�:ۗ�z	�h_�zږ>l�%���I\2.���@t!�"*�[��˷̹!���8mz;@�ü�oȨ�����fo*0����������o��7Ճ+&��	*l��X��_����Qs��[��&�+��L���dm7�F73� k:y�b��L�tD;�Gyk�7W�M:jNPH7�Y����#�AT���,�@�i� !��>�͍AL{c�HY�kސ��#��;m\nL�S+ƒ-Y�������\?[���K�/+nhQ�Խ���>^	:_�h/7!R0:(F���c^"������MJ$�k������x�Ȁһ�E�C���2��F�f�
�a    C4kx'�.S���ń�/ajRH�0gG����Ć�'�{���?G����c��:L�tn��슑�`z��:�l���$� @΂���M�3g��p��4Y�F�ׄ���G���$<{���Nf´1-i��<@�裏NO_�f��@��������΁�~������A�Fe�Z��+:��	�ʺ�6/3h$ј���	�>�R�ũ�d��3�P�.KQ$��B&1���G"'�Jk�Z7{�6��k�8�k�d71C���ۼ�������ۍ�VI^m��^�y!�w�2�~��q��[!Ggw�$N���ǝ������#
���`�
��x�*dmm�� ��J,rv����l�7�0��֚��yt�|���&�.#%';��<�l�,��3�H�l��Aг�^\"���fP�*�7ra��
��|�ǳ����<����+���*Q4����#hũb١ �iO�u����G��	�d�8���z�.��7�V�^ {ٕ9J~�?_e�W*�(!����\�^�u�g��r��(��yo	��)�昊<3璎>g��`Bt��G��H�,�^�^�FC)%�-a)e�w�����b,"W����M�v�/�x�>_����=�MX��p�l�fM �k�������{��������<i���b��>����6� ���3��(=D�� ��N�	?|����I7k{X�ӳ�P�~�~����_�s_��o{P���/g:
6��"�WE9�� ���
�1��ǠK���e'�c�\�D	w�d�Ypa�1Q�4vIYl�����IniLtc�����*d��Ω><:X�('��m9��ؘͤ�y}��*��/��>�a�����A;�	g��,fPBL������A%��ݟ��99=g�%��S�)�4�I�KyM���)�ڿ�����Lh�"��ru>����K�i~�qMr��hrD�%��0g�U4Yn�+��L}����6<�ߥ�1Ǥ
�Z/��L2�$Y&?I�C�g{� m��>._$q���,�H �e���/tOߟF�k9\�����uv�����<T���	��F7ь�]�+M��'	1�B9
�8S�lL#� �S�Rz�\0L�EWne��,|Cd?Z�݇G�q����t����WP���}/����O�[�l��������V�K��������/=�=R2E����4�d���� ��A���J�����p��m�3O���*l �� ��	�Fkm-�yt�\7��o�d�]ȕ>��!�+����|�����XQ��Y�/�`ͅ�3C�9�����DVoT@.���L �ʩ�i
���`�sYxA��&+����a���e4�*��9����)��׳ʃ��&���֖�`QR2�3�C�J���<�.�'����TI;*������"���x	�B&�K�� ��4�� ޛ��'�@��漢J��4�/��6�y\���>�݌'�:�I	勆��bX?]���<{v}S4B�7�������nFGcrC8Ť[�q&�_(��U*��غ�Dˎ��f�u#�;͞��	8o=8�;�����Z8e[6��H���,��~E� ��{ʄ]ػ6���<x-��F�h��+��p	Ld�����RM�S^�DhKΜ�c��ƦFG��ꍕ�e��:���N�K�裏NO_yP!H�|�������8��|_ Q,��U�{6��!��� �[i%���J����!FI��S�f8h8́OR:��ȧ�
��h��輔=�l��5o���Z�';<:X���^�J���$?~Y�Y6�Ї���7+K��e��n�u0(0[�u�v0�U�P�W2��v>1�Y�u2�N21�Ȣ�'!��|r��K�+WD��	��Zo�C�Y�v��ؿ/�M�m�������3(L	�|F�C���B(����gN!�8�wmiJ	���z��-Qoj�yeL�?P{�k��-����~3��7;��H�� �R*mƓ7�__�:��>����
U�C���p���S�f��£��{��D�����Ă�lTTqbY@�l�`�-gg9���z���w�ל&X�9v\�=�wH�芽i�C�@��޶����:��na��l���4�L����7������5��=�9	�g�FTU5:��^�*��)\�*8��|�e�#wa4�R��c�V�����<��¤�4 Βb�q��8S���մ���d@��'�p` x$�f�1��1|L�"TC��1yBOy��0 ��h$l3Vh<5):�
�đӧ�!�]1�.ؖ]�.�y�G���C_T�?����ry�q��������`��o0��!�8M�r��f"3��L4	΃��1�l��)SOt��#�
xGC6��5�p|�_������}ay:w�ݵp3r��I��w �����v&`$�<��$��G�-�*i9��:�r���H�ׁ��&����{l�o��k}��.��h�wLfrM�R�X�{�OuF�?z�:����m}��dRV���3g<�pB����>��N�"����#��Q(���l��*%o��3�E�=�l ��ct����Z��i4]gӹ$vG���5���3Scܙ�I�h'��������yԳ�(�b�37����'��`Țl=�`�;�n�o5��s0u�%KQ(�8�m�0����LMg�b�����De�|��,�����U�~�v��f!o2�u���w��j�(y�l
!�xb0 k��p8����ڥ	.g8��D����I8����c��J�c����zUb�a;h�/@���?^�h��?+���Q��Z�]{�?�Y���g{8�Z9"A\R}�G-S�Q���p0�d�i�u��Q�'��B�h��T8�����KѤ1�!3��o���%dk}�����Z�������̃u�"�\���=3<��ݷ#���ԔH��O�`W%�N��BE�����N$b��ә��@�M:���e�wQ��
�����C���k�Q�Z��ja�>_��щ��DJ2ոhQ��eVN��u��43��:@��{c�ʖKG��T& �͔��J|vp(=����ib`e���Γv�)���=�(�Ż�cv������y���������ڛ��x-�Up����o�Y=`�L�"��j���,�ŇS�QE����fS��:�.`mѤF�X���Ȱ��a�d3�~\��Xon]�����������i���/���6���u�����J����xOR�S�n���>�����~;7�o�|*�um�{�A_�8��w�ퟘ��4|5(��(C��e�k�a�x\�,�KZ3�#H�,N%k'Rٓ5�.[�39�>�3we%��~��J/�������O4ڥ)G¡������!�&�`o��8� ����¡�M��{ch�H��i�U���	x���pub�&�k���K�k�NA+���Ime��[0����ka����L���17F�䀭��y���<��쥓�4Q^C,����蕛#�B��P�ڄL2b� �}p��Ŷe�Ƹ�J���:<������V~*�l���'KU��<�����+���orx�Cۻ�G}�x�e/�q�X4��yUZc��R����}��II-�Y����Yb-�BAMzp��N��o�qmB�l�9��@F�z�:<��>������U�0�����[���n�8���cB1�����Ì���bIQ�x�V����s���d`�U<�Dl�7Ѧ����qХ{�-7�B���k}��)��"0��w���p?���{}۾\� ���mz:FBJ��Y��͔���e�$xU �TS#�/[7���p=+���L��
nk�����R9��u������M��i:��J��Ĺs^ɮ���_�@�qw��5�[k��Ԗ����y<=ܲ�6�=�)i";<1�����sJ��da��Jn&(�L��'���c=�eC��(<E�!Y4�wQx�Rx�e�OJ�`���    ������V�\-�����h� �R�frT�(��1�h�H��H���6L2��19��$r�'𸳁�"��*
�Ħڷ���K��D�����Bv3�/�i��5����-��s���Lo,��CI�q��RK�'�a  8})S'�w��D��H�$Q *�>cNdf�2��hAJ���X�h���8�]��Z�s�xq�^O�`���~��N��}��-2U�	!1XW�<�\�h�Њ���Q���UYQ%9�QG��^p+"�#�H�S	�����.���C��9���w�-7��}v��.N�`NJ�*��\D�7�ii	7�|ޗ��w �o���r5�&�����#�H
D,#�rE�%ՙ#!.��/�X����亡�n�goMu��0^7&��{�e��uqe�ʺ~��������[�^o.�1R{��v'��#*Q�3K���/#\
�QG���2�"�Q��O��H<�I=��]�Eta����s:X�X�2ڵ˗�X��!|�q_k%��5k��~����)z�7wb}�Lե�<�����sn�g�{L3�Z:�M8��Dp�*T��h���1�p��(��J՞&|\k�7�>�>����|0��KL��2"��e�ݴ�D�X�<�Rz���;�f7�HA�4�瑍ނ���D��B;팳(��<8�\ߘ�����an� �+ �κ��*�{Uc�_��.�d�+��=���6�!�R��#�JU�!T��V���#�Nj���R<�Q1�Sz�ǂ#�S��D�e���\�>��Ov���9�s!���E�Ef�2X\z�W���O���k[�,?׭���0����:��tr(�`����婞"��C LI�d\,}m�D�� F�����y��͒7��?��kjhC�ٌh=��d�ڐ쫦>x����<�he�d6*[��d0�g�S|�DM�1� ��L(��!��C���ux���/����B%����W�|М���Vd��Φ�@o�	x�&���xz㝱���Y�u�3X	�1�e9I�pw!z�>0�4Y��<&IT���h`Y�v�Z�ݳ���d����1]A8��LE6�VD�.)�"g7
�M�}���'������f�-�s�	�%��,����%��1��Od��AC��u~ t�9?���$���O_I�m�N���L~\����u�v�ǲ���N���b١@�ߤ�,���Z�p')�~'�e�"f��.X�i�E�-���#�$�0��L�-�I��dk|] ���\鮒\Z}�5R��bX�裏NO_�0�oa��x�t����][���-���u�!��?dw���1��F�23�f)�`�(M��8�}�Y�Ul!�a9KƐ�5����<�$s�S'���'��v-���z���?'u�n[f�(�?���o��}���1��ĨJ����~;2��х>��9�ɕp1� �P�CQ�")� �g�(s�)j���RA@~��]���P����#�xWz���T���]Y+����>�e�2y�d��n�����x5Ow�cI�V�n�������ǜ��R���'�_~s0����$�M�X�P�������$��Zd�-�
�����)��>�.2:�|�,zY�hq�$�`�7�5�x���I���c|R���/�遏���5=�l�c7����L�.{�y	\�8�����NK��$������a��|� PS�(䏥ڃ�lRG��!��
���l� ���U#�w������	�+���P�q|R�-��z&�!{9;tW�����F%E9�~?`~ņ�B <�W�A�ƌ��<�����I#�A�`�t�E�y�!v��-�9߲/k�5��XW��裏NO��~8���hͩq�H�~Z�{_Ԏ��w��ʨ��֢]�P�!�2ip�!(�gj�[�r�X�b�	�5c�<gp��W&C�ǉJނ��P��+��ۑK��咺4�������y��w���5㳅��"��Z`:�1�Rl"�B�³�ylG��;�c�M���̦ ���vC��(����5�1�H�R�n=7�����C�$���coSpu�M����f͔|h_�]6�I�K\:dq��|[+ȇ���� +n1��u�?ؖ��\�`z���N'������	�Ƒ�P֖⽟D�`�Id^0�p�4	p�H�؞I�K.���Vԅ��3�s�i^�p��]�(��q��`�*���ϟ��(�+�4�ݦd�as����C�b�J�xb\������,�$�����%�2�2d���g8�.	)<Ϙ�,��낞���&���zG�B��]�2���^�r9?u��&N>]D�K�홿=�$d��3K��غ��Ύ2n9OD[�r�{ ���:8f�⒦.y%Ir�+�Y�-!� {�g�����Z/�.����(�������d���%��r�^��[�u�A���_�P���eI$CR���Z'���ȉ"�����L�M.2�X��>)���;���0�c_i��k�˷A�]���E���A#|^��i?���,O������C�$�|����|t��w�&���x�m�6�L��M62�
�&g V����zʳ�ې��c��سν��8�>:X�̈�ON�D{_�P>Y�v綃V�����i���*����"��?$*�5	����I��S� 8'�Sp>0�
ծ�"�8�;s����hK�1��F��z���G}tz��}���4� ����Y}���m��5PF)Z�9~8f���,D�T�r Mi 8��+�fa<��$��N�cNL�A�h���	��'�ʯ�D�Di�M��p�7��Z�k[�vC�Nݫ}��G����������$�dڧ��.���ײ���]�/��.�A�5�b��w5�����6ύ�	c%<�,I��AN�k(4r�����	;�s��,T�|Cھoĭ�ۇ5r�A�P��49.�	5/C�J���~.����<��r1>_�3�������E�2�!�3Z.1�)��(�,9�Cd��*�A�6#�R46���)Q:�>����8Zg֮����<�Vѱ�w�t@p�^�[��*�sm:w���!=��T����=�;8��(�^(�c��,�ॢ�&ɩ#�O#�Ek�
ZD�W�P�,x�*� !�.�����h;�/:��ͣ@����uK9;��\T�����$�����گˣs�x�}펺�6��A]�{CG���Ֆ��+�g��E�u�RH�C��e1Jn��'�5F����e]|��;|ͱ-��k�L����!�&�������tzJL.�6�m&܀����oӌ;�b7~]�#���֜����ao\��a~�] ���Gzmw���2v�qԛ����~*��Ӯٶ�}t�<'&�	G�al&���46'��r��S���>Yd��e_�iǕ#�H�^ou��Y��Q��ecxL���M��!�Ƀ��1���ղ@c�X�;�?=4-��َ��`�'�m�
�\��S�ı���eD��͗�L���E��[1����]�����d�n���SA��'Բ�[��˖2��TK�6���:�����j8�ZJ<c�5��1!��T1����]k������E��[L?[��/7F3)軓<;��׷1��E���`�f�l������6�/Hk�Z��F�iR�cB�Bjs�	Ŵ��"��N��tT�zkM�}t���ZMr�	}<�hy����\��`Ra!�{]�|\�ԏk�^%��#�K�=��#hQ��d��o� ��£��xBj����
/�s�N"�F���!���$<����r���R�Aʺ��X��g�i�7W�;�����(Ȱ/�-|�[V�-��,��qA��m��.�t3^�m_����Q��g��($h��ǻ�[�t�$����nf0	�c1�>N�Bs������ @c# ���c�]�	���z�6�[u���>�tg5��rsF,�XG�-����1~��Ҡ�i�䗋�1 ��T2<���������<��eU�a3�q�}�/Nc;��}P�W��ѭ0�)�]�M�mb�k!q�st�=��<��	��O    ��-%����&��V�i_�=aā���I�H�w��	��z��l���α,���2�8�lTNB{O���)�d�R�p�:u�z0m�$TT~ ��;�Q��2c�% '�gʄ)�b��s�P�=i�Ze2::
�=��O����@�^۳�k3|O���>?}e���~���2��ni�_J��|�~��<ݴ�'�fC�N��@qKpG�Ի��~��(�2�3CX��OHA�fDEK��"b�31QJ]�(���Ld�ߊ��J6���`�G��Zj�v��YJE�a+�v��֥K/<���� �bun,������8�)D_�z%R��LL&��w,�G��dH
\',sDz���e 3��\��_��i�a�$Yd��{%�+b&��p-}r���9�6�/J�)`KͰmk�J�V��[��K�Rv�p�̄�Lr��<�	ĩ�/i6 S�[-/�4�)����n��;�z!�����մ�h�6��"���) ܳ�q#e��[v��r�A,��)$��K�.���:e�˚��,�[��'AE�UBEwU}L~5g���u'!�?��Ӎ��6!F��48;Wۻ���	�r�`����/o?�>��� ������F��Igk�.�bHVp*'m�b�f���92IJ!r�1�B��CQ�3�IA~��A�r�[�fN
mVu�o��7�X�&/��!+@��1	��;ǏQEt$*- Pp���W�y���Z@���cի��9u�jZ���Z�[���o�/�3oV��Հ�/K��x[��f��t��!��VBJ}�U�D�8�R���*#�]L�M�&�	 (	��ke����̇�MU��{9��V���wg�Lu�|	����U"y[^Lj�r��Pa��#8�_3$ �0�X`�,x��j�'c>ÝWpp�L��o�,�Y����a���(+"C�u;�R��S'2�3��eE�%/��{T��jjy�m��E~�)����K���Q��R&D<�i~{�s{��1�>�#59 xܥᙀ�IF�V&��QD&�蹏(���:4i��;���ӝ������b�]�NG��OO��n�����,�G� L�a��-��"��ʥ��\N���:;���S��D�1v��=�TOZZ#�;༠X���`��qr�4�H!,��B��No�ٶ�g�1����� �0�rj��f��,�&6����7[�븲��_�2e>�X�ϴ� ���	������6�.A��a(�+�"[���Sjow?'��7�7@�%Ht8��X���<�1����Os���|���u43���t͌��.��˕�BA\�p�"� .O2��t�_����w�O�m-�����%|owރ�ބ���:s���=?��3s�:G��[�OMg����8�Wߤ}��ה���� 	Wp���Y"_�%���K��ч	y���DaH"!�>s��h)��)�����`�7��޲>��{O@�)6�N5��7Ō֗�yUmE��N��a��J�Q\30�q�:Z0�Z%.9���p��M�Z+_�,-O��J�&�C3= !>b{ ;���Z?54r����	MN�R��;li��"���-�_-�~��#.%f���v�s��㘘�{/�H�FpwB�H�l�Ѫ �Pi�Q��
5���$d�ZW����rޘ}c�A7y^뾧c��k	*���2/ˏW�)�?�E�o�\�3���$EB�ˑ{M��X�ۘe�	l%��+("
� QQe0ʖ9J��@�>ej|��ȑ��7?Go�4'f����X����g�7'rQr��yE��ypR���N�{;+�|fZ���^��o�������hLˡ5:f�X>�"�Lb4�xT3!&�@C\O�q6�]���(�)γ�)�=xsG�4�>{�rh���8��[�ם�?�|h/�;�v�jp5�i�I���߾��0dTЊ�,�����w�$p��0[C��kg�h0�+�-QY�<R���W�9��w��P~¼K�«9�}Z�4�G}�p�J����O�� ��#�Fv~D�d&|�|�8��!��L��e:�(�i`D� p��\���G�	G�M����K�f���,|35��6P�rF����e5�ա`��U�ǇB�5#�,x�>3x����]�y��j�T,K����L@|�)s�#�n�Pps���jM���(dF�m�ؿ^F#����g�2ܲȵЇ��p�.}�O��'3��7��,9T{!#��3��@��Yp�g��M�)�Qj	iV%���H��TC8����gL%�=��%A~1��s��3m7�-�dy�D��`&\��A��,>ot��)�;��Ǝ�B��!�C�K����C���<x�ZIbl�{���Jǂ���W����f��3�rS{�Mlt�����=�#��3x{���O�rƨ$餹2��!P,O�&Q�fɀ��NYx�	\M������˫�\�wm���[-��ծ�_{S�4Gk+b�u�+����m]�+���D��>�
}�+�$=���,�-H����O&rά��%�3FQ���pf���S�J҇_ןo��Ϸ���3��#Ur��ƗKM���|�]K`ꒊ|�:���JC���m���7Ǩ+����%�h��;��s�������"Q�����!�O8�.�F�ZS罽�S2蓚�ӓu��Pk6dZ��T�C�EN@��<#�����sM5����3��P*JE���UJ#�"&��S)Ua)�	��s��C�j��ι��Z���~U[��="�d@_��A��r��>�M^wؚ`�5�AK
�4��2o�F��IREeP>��ܤXP)1j�Q�y#c��+�T>8�B'�ڮ.'B��g���Co�]�p�u�w[}p�}Mw.�w���q��Ȇڣ-ߪ��^��W{T�1l���p��PC�0�K5�	�^�)��zG��IΉ�`���x�]v\aѣt���z�h�N�N��7;�U����3�s��C��Y:Q��NٻZN�f���1l�K����''�w�G#R\���c�@Mh�QGDr4rǸ�I̹é
5)��9~�4�G���Cdf2�.��+��W�6�kv\CG�ǁ}�����k8�Y�v�s�ʇ����A��O���l�6��m�c-f���$��8K!���/ɰ�l3�3�Gf��g˂e*z�D��c��Pvs���2���w��üC]|غ����e�l��%��r��W������Y�z�l����:xJ,u������ ���E0^�x#"�L��5g�M�h�W6�z"S�h�@��ii�K��:�T��*�S��B_����[4��k�B��|]���b0X��1�6{Z���<E�4��g\S��RLb!�Y��`�&0`f��`C!�L���n%U�Z�oR�oj7⊃82��D�:����K$1B��E����"����ς�z�Ms����;�Q�Q�VɁ�=4��Ց�=�ޒ	�b�d��o��po�Np5�4 `��<��2*8�Xd!Y�>�;j(չ�����U}�K������YP�i�	���Kq������q.3����q2R ����|�\��1>+�2�
�=���6$m nsф��J ��<[�v�]��Zߣ��a��E���ٜ֝�	���?��wk����?����~8��=�Jω@/wyL51�+dG-�j@�p;�J�,��.'�,R&��$&�#���Dk���0�dfĠ Qn���lYd� 9����\5+�����js�1^bm{���謯b�#�g2!Ҍ�A�!�1,��2@�c�on��R�L���ED�0��f�k��'�Y��	DL�\
�����C�!���z�S��pXb[hD�Iת�����������5߿ַ�ld�����pϠɭ�h܃�� .B*��c
:q��C$8�5�:Ҝs4*���r�s_8���;�Ħ���w�pGk������r�
[�SN�8�g:�G����Rr��|i�W���c�q-��B��>'�N���~�_S�    �/�
��f��f�
��N��gC@��v��>s,�5V$d4��eAc�1�T"<3&'��7�Q��JE(>���@"��c�,ߒ�N~z�ֈY�\AGB]�_��� �|��+LoJ#������;>�ecJra����֨��܆AĊl�Y��t�H�:�,G=UF�HB��6c�ᒶ�K>����G��F�,�A{��������v*�����w+ж_���V����ZofY����(��~�B�;�}g�!K�z��vq�ш���G��j@�cńc[�J��p.������{�&�I�,&�yN}�h������EZ!�t�y�B��n�K�*{�] j�Z�dߗ�0������2Q���%��`9[��w�1��]$>�Q��+n�+�وEL&cV���b��p�E���a�բm�m��0بq
Ǿ�p�#X�Tn�?�E��=L����>�#t��W�x	����x|0�$�����ἧU���}H��4$��Y�{"��'�U{���Z�ӻ�5���>8�>����������I��~��97��x���֫$n��mi�{���v��6�!7���$I�Hl�^0�f�'�d�Y���cj�g�S`-3��f`y�w���Ej���Z�����>�>=��͝W����u��}g��i�6}���������%���I��d>�_\o "<�H� �|�LT��B��g�����VI1��"�l#m�a�)6��ub�����q<뗵Y'�?GV5� ���f ���P߭�7�}���;U��{{�m��By>�3�P���~�����$hpv�e�yiSr΢h	�7�(��D��`�vO�a�����kG%�Gt�>:~�p*�ѝc�D��o��~�п�XK�/�Ru
~�x<Ӂ�^Elz-־��8���(��i|RN3��6$)��2ؚh�e%�/��!�`$Ұ "��@]
,8&F���ˁ�j��D�LK��2��������n������hɼSY���7o���EO�a����X���l����s
�{�~e#���h��삳�d���6$��&�!:�Jx��
�Oi��R4�PF��}��ӏ�]��(v����ϖ�Q]�<���y�?-�����ϫW�x[��Z`.��ΧfF:�g���v�p�@��N (��l��sFx��G����In��D�:}� ��Sƾ@c'ϵ�\Q?l�6h�I��e�"�A������8�=�C-:BR>o��OY9��9G¦�/�"��<9I!��� �#�{"W�ȷLN�L�pv������5l� ��xc��a�K�p��2�Pg�xt�&JU�t��3Z�P(p��E��{�<�.�a�t1T�l��w~�l,�kGk�u�|)���q�%�~w";+�n��Zx<��J���Z�פ^��aCj���|��������əآQ���]��#�����A|L�9�pqz�+��"L�X���x�X�(�[��	�N�)�"�����4ό?YO+��?����=�8�R��?5�{�z�!����/��,L��d։y��D��Vp���Y��Q9�Hc��F5�	AM����/t���n���Z8�uw:Ɨy�o�x�U�|h�x��w�!���1����50���a�,�"8�dz��h����J�j����4@Gśk]�eIf�-I�վ��a�����ҙ�GeOԹ�1}�N���/Z'�ٔ@o�>� :��*��#�x�� {�Ot����2U`�DW9�H� �9���d��K��QJ� ti�D��k���%Ȼd.��]8�w\�dBK��x����|W���Y����>k�[7��cJ
��Sv�a4L��U��G�X�O��-!���֭M�S.9�RZ2��<�(f�(�k�c�,��h�绻���A{-�7|N�d��[����i�OK]�j�X��f�Ք�R����1���E7#$�Op#�^M͒ ޺(ў�������l��1ؠ(*�G�"ɚ�-ܺ���s��(��U�˗�?��e���OG��,΋�������Z��L2|�C��30��(����z 1b��T�%�A80�p�Q �)Kj\���Y($��������>�95�Ƕ݇L�X��a �zb�˪��y��-γU��ui�����/�f3���S�^?��τ�8- �d�"�Z7 "a�����e�v��"� �`#BR&EF�O��ڬ��!�eZq�vncwm�h��^{Cy���v�c���~\R_��*��x�}����(q-�&��F�8�
��JϠ��Á?����#g�K��B�(�}/�H�~��߮*�_���N�a^�zn��w&�K���\�+3ΣfR�J*Y�;��#L@(���I��&�E�θ�tG�v��N?��:b	ǭ�wv/�p_�I�>v�ӽ�Ǿ+Y��[��{z��Z��NY�\h|5����R
�0
�9�Șʵ^rpg%�N
�.�Z���� ]�W�l�,����bw5��^�q�«��<��ïf@O`�Q�fǯ+����q��8C�	dĔ��cL������d���*jB�D��&�R�TX	�R��F�.��$���t7�Ū�߲�S<@�]�S�
���*��ӟ~�]�a6�#����?�r�3� e}�ޭ�:�`�Fɡ1��d��Zf���%Et&!.���O��'	�6�`�2GG-������*�딸@NW_%����ӭ�T̪�|~>WL�� ���nON�Q��]x��a�Ùp%r���2q6�9�fg�aQL�i���Ƙ �����NI���7�R�������.��|�O�z�Q5�A������C�8L��{dG�Ⱙ���l0ǙF%	�ͧ��c|�����"�O�� ã�&K>������;yB�k��u�Wӡy8�,/���7�����(�Ko�zP�w|1��>���g�=��o"p;nY�t}��"�F��-2!+6Ŧ4p]�!�0���I�4Ig�%p��S�Q3ꈨ(g�W"�:��-�O���k�¿/��������m���B�,c�#$��h��N ����TS�y<�N*�ɼl��d�\�ȽV^g��!����F���)"��>&�k����c�����F����e����|Z~�rn��v�����{b6����cWO�`x"S��A���1+��t�.d:uB(�V�4S��T��pib���|o�M8
P���n
�ͮ�����I��)X����C�]jq����g09A�eA�$\6!EG��U�{9y�`��7I��*g�#�y6�.��н�=G�ך��w�j�5��&C�j�����?ﺃ�-�h�v�-#"�]�a�	|�#�z�j�42u��8�����l)��QK��&1����J�R�ļ�Z��0��]ÈC��kxX�d����,�n�ROi���8�Z�j~�i�s�Tp���p��a~�� 	���#V�$��>$Na.�	���i�ÕT��ƀ�w8xgP���\�]�=��׎���/h*�jy�����2�W����М?вt�ݼ:�O1����@�K���i�N��L�WӉ���H�W3��QB�L��f����/�`{
�������k�F���Y��^�/a+�\����x���[��6�z?oJ�홇�J6m��s���r9�xe����E�y�X#M�`=���{��d��F��A�@z+�^bb�P�J�G?YF4~��<�z?S��@?�[�N�����i����Vd���R��wCVu�	7ZD��}=h��x�ϭEߔ=ϋ1�������`��3G dF�OA�L�����O"�i/�K��$���;�,������[�;�.�-�[�z�k���K�rX�����S?Yex9�V�oe��A_1S�m${�:/���v�M ����]}�,���3^����{k$f!y�S�CH)�9Q"JͥH(�]K8�ڴ��u����\=�a���C�X��:����9��Z�����ڛ���o���
��s��s�:�    ѓ&�v �n+I��1tޅ~&�"Ӏ�C��Y)�,R��48��#�#�!�̧�p�N(�P�ɘ��0��r��ٽ
���h��{���re`Z��#�.$�Q͙[(vv�0xu�r����;�gY��e���fn���^����&�	1�h9s0l�NU�!_x��V���^M
���Dj��B�c�a ;ќ�:wO�vw�!.�G�[��F�N����iX�oJ�Ԧ+���N\FA��QX�����@��\:���-�2pW-�=f��2�+�A�\�0a���k8��Z/��O#�yn��n
�P���n�w�u�\�f��c�{�+&1�TE����>��c<�[z���p_7Z�E�/���;��DG�3N-�ΝAK�������zj�2X�����e�>+�B�`%�{�u�y�l#�K��q�6zP��}}���}�>�S�����u��b����:���k*���+S��?����t� )�)��)�ϴ
4IR$A"�&3!>��h*�;��Ah�Q� <�����%; ��z��
Mw��S3m�u���q����ϊ����w���ҷ3���F�c��]���+KG<�g�8��Y��rTҚ�8ۊ��������)o�!�
�ԙ`�]4QU���hbyvG���ǰ�Z#�9�c[��q���i����cv�V����0������/of|?_���J��%���>
�G�C`�}�\�0�OÕֆk">�1L�Z�s���d� ?���b��!yv[X����W3Xg�/�w�:���򽰋�%^X�>�zl�:��d1��b~Ԓd�*������D2�["�#�*�_#D����µ&Vq����NV;�]DE=if[�^;*5@*���*��VZ�L�~��ﻛi�L��/WL��H�5x\B��r5Z�i�+y>k�=�[e�>�7�N�}���j;«=����:���@>�I�R��>>	Hbgx��I$�i�X	(��d��$��W�*�ls�^�ц� N�d�x��u9	VO[���I��w}�:X��$�v��b�k���]�y�������v��Ie��;k[Q�N��;���W���ȏ:M��2�I�3��
x�3>'6�Dx0ق�Ș�t2�*DAu���)�#^}Sđ��1�hl�]d5.���2���?�rdzj�0�g��7b����)�O�4ؗ��v1���E쁩�h���<6S�;j���Y����	xQg�{'e�mf�U��'�%�EJQ8T킀,R8p��IM�0�7%iK�RL�#��LJ�s	��O�P%c�V�KtH�k���D����tpAR��)g�Iy�(�i��˻�a����L*9s�����h]R���k�����x#��-g�����$�s��Dr�Zj-�A*�-�!ֻ����Y����n�`������>�����iBu�з�`�kfĖ�27���o=�6��f�Kq��S�&)�\��
�d�f�j �8yp�E���)ҠJ��NG]�W� ���.���������m���\Z��x_.��k���3�͋�j�$C�!9���r�CC$�Ȁ%9�<!��x��[Ę��~JD(K�M"*&��SBA,�$��R{E�_l>�>��[�ě���?~z��N��$�����#݁lܮo�&���1�<���QZ�E�^�h2J@I�TpS�Ĉs��P��P�O�@sGF6�Pd?`�_k�⽙(ۑ����KRh�|�m��>�}��L0Z��w%5��<���&����iT�&���C*h"����ǐy��6��Bd8Q�a8����lRNʹe����R�\J]�v<�{��\�<�7�/J�����</��7"���N��uؚ ����1�(�u\'���H�y�Vт�v4�����X���2paVÚ[g���Si�҅}*m�u� �S��8|X�5�%��^�7��_���R{����D_�=��:�we*�1� �F�e��N������w,��,��Rw��#��t?&��l"_7���c:E����<��nG�n�F��.�QK���DMj�p�gA*w)G5Ig�J�"��n��}��01U:T5~��d|���'�2�21�j����E��FoVՂ�[���0k�2=*�qD&��\��4x�]��j��i��xÙ%2C��b�ʒ 3� ���<L��[~Gk=���`8;�x��Sh�L�<ݷӜ�����V�yx�O�V��[-���o�PQ�C��E�g���
ÅI�N��]&Q#�<O$�?�8��JRzh�w�+�y^��p(�*�/gA�Ƹ�ff��Ӄ���\�������dΠ�i6+�!�֢)�적۞��C�$3���ک`A	���.�¨]$BLq��[��[�"�����|�%|}���V��y��e}q�ɊV#��Qw�}c�M����D�,ƈ*���H������~��L&et��#��l��ɳ"6�����G�������l�~���V�v�=���Y��;��n	<�C�6�Q�<��7��w<�D�d��=���<HmĊ4j#�N2Q�,��4t�u�,ǈ�beI������'�O��$���,���}m��өu'�S����wȱ[{��C��{���$;�B�ni_n� $"���{Α�"Y��1֊���jRȔC�Ip+� `�j�Fs��9i��3|�q�C��.��4�a�����]�u�~B��.xY�%�T	;�T�vk�7sKγ����?x<�_�{\���W]!����c�/���J����4�թ��a��g.KL�ˠ���r!�W2Z�3��IË�A�$p�sv$�Yf+��6U}J��������ES�{fOO��+�}I+u8&���JT��&)o�M�֛�1�1&����|��*��o��|<���w�m��/'�α�8	,Ӎ�$�� �W�d�)�̎L�kI�
�l�D����{���)��łϒ"F�jBG���Z��tY:�m���J��i>?�Y�����xz�:���C���{�<�|�3��B �m����hd��gn�*}PU�z�4%�H��:$�4z����C��Cg����H�g��֯�t�nuOH�<CX=bO���$徱�1���+}�����¯����Y�`����]�� K:��tl��h�"`+��l����em���MJ�l�V�%�UR����I���M;����������!�y}a?j�.�#����X@|ݢ�mM��Iy�aD����:F�w�&l�F��-�3ɈE!�¤t�~�4�\+�9?�4J�Ep�a���W��9�������3�u�������
�;n���K�cX5�]��;\=̈���C�Q2�&� �_<<�2�9�.9Ճ|��;f�����v[狹[��6d�`�c[Y,����>�U�]�T�yuj�`e`�#��#��}�!D�zp��OYG�e�x�H�D�h0�e�r͍`D�q���U��Z�O-���,ˁ7��ƌæ޼��e�1B��	�� �U��g�\�R�mbqe4���<l.�ݠ���(y2BSM�] �Gy��-������:/��DQ@^!�^_��4-x���&c����?����^��fL�(���|W�� )}7ŅQ�!����#�q��8���� ���s��a,�IfŢR����4�G�H��F�>�B�ݟN�ӱ1����m����^����i�}5��r7['{�M{�s�Z�rs���;Ƀ�9GM�w�$B�TY�lQ@EM�b����M~�Sp*����ڽf#��#t���}�v�LXG�`$�a�����'�5��Yb�rn<-����!#u�N���`tw��)� ~P�Ƥr�bL	N��.B���X�ޠ���,�����\PA7���x��U���j�}��\&��y�՜��tk�kU7��������d��l'�&�Y?��H�`�y��=$E�Rl�c0h\=c>�!���L���1�Ĝ0�03��I*�}��Ӽ���j��w��v��m�a~{    M�@�ٷ��yV�˚h���_����J6��ߙ���k�����Yg"��)�1xF�d�MQ�Jx|'�јrA��#�>A��|�8*ܽ�ƮS���x��k�����d��[�$��ڝ~Fc�~�P1|7'kh#[��mו����]�*�����"c_�'<��28��,��"1%y�p��:��UWn0�[F ���ƺ���	+y��Ul������Q��Z}�i���k�k���s��2����]��i��$A^^��X�x���|8�e�����L[Q&h0�¢��\'e�&����U�8�<"	l����;�=���`ǵ�Lwz:[x�˗8��=�O�k_�5��4T\-Y��sm���/��gCJ%M�%7��
�����:��(�W2+8�����*0�
	yΙfΈ��[UP�͖VX�:���������Q;l}t�Q;��3TAݐ�~Q3�Ke���7u�=3���nu�e�V�B�6SL\¾7�N[m�hHa|"l�Fj�Ap��1^���I®0e��iA�͌�/NZ���	;��ús"��
2ٟ���!�>l,_�m[s��U�����Dk?	��|k����8`��Ӟ���;3:j>�$�0���)fI�q��8�B$�'��T�� ��2�#���D�s��c���Tk�F���n��<��q��n��I@)_����҂`˟(��1�}y�߉�qK��/��3�km:J|n��G�# V3xpωD���'��%9E:e�v��qI= )�2����|��X����>l,_@��y�?{S���i>�!�a��a�!?��d��:~��G��qZfp�D�c@�Y�@�������$F.l��B"�u�W(�d�q�`m '�/<���KT�OQ_m�C}�ּ��#��ָ���yh�G	�{/z�Ճp��d̀R���D̒�tT��(��)YE}�c/��הgx&l�Dx�!��h�K'�)Tx��ΐ҃l���<m��f���2�1�ǫa������������y>������W�A,�ȏ��� ���bt�� K��D�"�<8y�#>��l�%��~��N���<6��F�������
�C��v_�!����pjb��������p�r��w�����ov��Ǐ*]s�!�"3B�AHg�	���H��ǃ���VGa� ���"&p�YH�C������g�^��q>O�џ���|AS	�O�Q�J��~�~��W���;l�9w��?����D��O2>��}FQ��y�'��$�W�#q��:
.��P�u��P���Jh�2�a�׷s����_3��=�E���VO���V���:gԑ���g#e���:a�@h�!1�]�4�8	���l~N	'F�OH4 ����1�� �z��n��\��K�����
�9�Fh�Q8	Ǖ*v�|��)<�K3/U��u��q�ƒQ�~w�U �	��s�+~8�VG*x�8,!=
a#�{���d�R]ܕV����"`����Gm^����Ϝ�O�q S����6�z&~\_�t��?���E�Z2��S��fk⭏!� �`�Ε�>ɈL?�"
�%�E����4=4*�ze��� ��yi����$� �G�dRS=����!�n�fQ�Fjg�FJp��޳�u��ʎY�5	nR���j[�UJ�S�B��L��X*�ǲ�Rw��Ws������7&ݧ%���}9����i��x��)B��{�g�c�Šg��1��(��^$bE�Ud�{�c��G=	�)<%���+���D��t�X�W����>�~�����c������c�U[ӹ�O뉘f��ۜ]о�G��w3�u�#��գ�˙# ��4��`�H����i8�� L�#C�
l;C�f�1�O�X�C7@o�Wt��|��;��ݝ��m}��i�����C�V;z=S�߭��7M��0�u��\����h� IC�D���l,�iF56bF�Ѥi�\��d������u���\R�v�2G$�k�����#)�E�#�o������r'��x���^!{�Xs�6�+�^�!"[�ct4C,NZO�D��d��Ԇ��;�,	-�N
.���zp�S��#�~���Wv��Z���ye���ϟ74N���γ%E��֗p�{��p���3�&� ,cT'b���F���Yԓ؜C�(&x�>8'����w!���>���a�5r�(\�S��_�hZ�3�j�g�$��e�l�d�*?^�(<��,����>��dسdp��jh)�2X�D�1z��ɀ�L�H��D�I�fKB`:B�G�O�
^Z�!@�]h��q��u1M��u��ǈ���Dv�l�)k�d���:	�l��P�%p�U�x���O�j)��T�AV�S/��@XA;�dgGk}v��k|X�0��84:#;ͷ\�ݬ��z�ߗ�w�G��s�r��O��*E�-���'v�U����@-��of~��&��@nd�����x�`�	XY' ��h�$3$�H �|��H&���DO�I�XN�-{�I�7#�3��_��jݱӿ����&T��v# &	MKs����GV�_�e�<N�_t�z��:��6;,8&g�U1(#Q�7G�mr
P��fI�L��b�(�X�&�"6�6$,�n!�e����Z�ez]���6����.�����^o�Ӛ�~[f�_V�JՏ����Ε�k��p0�CJ�l��H��w��e�a����/��E0Y��9KM��&�uf{�����C��_kV���~�c��p���5�~�s�?�l�2����}T�O�m��[�;��T�����d��� έM@S�����(��&2J���O\oô΃���Yk�ř�M${�Pe���G���6'A��1����s�����5���"@����N����C
�\p��� 6E�-�&p�l��xb����S��a�8�$t!|U�z{�L#?��B�p��>����9���":�a�xE��<�U��oZzkZ�17��d����cۭVA{���g���X�&���z���qr+E>���R�`V��l�����:a�a�&�:�UD�VB7�YA�jP�j�{��a��ta�k��?P��wK�M��(y���HI(%�!OĹ8g%��hʨ����1�X`�ʝ�KvXw���}�)�y�~��9z�:��F�}|xW�\y���P@.��m�/G��W+��o�Pe��Ɩ��������2�/Ω^���j��̀s��	b`�M6>�d�؍�0�Ԁw��@�C)�)�gyx~c8�1N�U�5�:�/�F��df=?��Q)�G�4֖��7s6���S9}&��������/~;��Zs���f�=��_ʶ�g��=}〉9R�?s��H1���',���%Z�ЅJC0Ect�s'͢��5�-���w$�S/����8%�y�JI������Pf��{ ��;;cu^8#Ό3G���"8t]e�`'�eH&�0��I[�Ȑ�|s#2��h�"c�{4��k�K��ۇ5b�s���m}��i����4��t4ޖh���1_h��G7M
���=?O�t�yh�A�x��o�H�y����ʡ�7p�3�O�<�!�j��4�D&�2܄�(ʹf%�s�"o�^���;�(Ȓ X���-^�u���Ul�I}va����5��Q�Fmc͎ؓ N�G��4��\��1TM�Z퍌9ڵ	�8�z5���B�����iA���,Ǡ�*�j�7�ګ��ϸ�#�ͅ�y'�qy�q�������RB(��� �eTAr�(��"OV���2d%B&��g�9������-����+��Ez�8߫8�s?+6ஒ�`��ݓan�F���O��H0�%�c9#�+���9��8d&���C���c1R� f$4r�=J�lD 
uX��������g�kG2�������%����K�⫙��n�q|٪b�U��)8�7����D�<�F��p2o�pN!�T�������s���)�(r�Z���C�ҙ�LT�]sNqi    �gב^e�U֗^=�J��4��Z�k��
A����?�eV�������pnN�-G�Jx�ǉ�1��m���e�Y�i"<��X����bb6j�����%�Y��L= ��uT�}/��,Xm�B��r+g��u�ր>kٷ�"-�xGLW�b�!M�ښ�`���*���Ɔ�L��-��Tሩ�AS��9��9�u"��m,{(���|���.�������諒����Wf�ߗM�Ip�M��ό�.&�9#�A�e[�h��M�!�		)���u�s��MX�N<�l�c���͜��r���3�,��zcN�by���a����������b?_���/����kϓ��k}��eWz/�P��1���j�dt{9e&R�r�����x1�9|́����0�H*��M���,%���aF�0e8w��*[�zG�s3�_c*�X_��F^Gd?�ٮ�X�4�"޿sk �T� '{��z�C����Si�����& j
����02;5�DP�Ӫ���Y0ĆYcR���GXouo5��Z�:�q��28�J��(^�l�O[K�&�52�:DSz 胚�6c��`�}��LR2�?��|V`�:O &ن�9\b�W>,a���8���-B�(Qd��Tg�վUp�A4Z�t���/rׄ�Z_�ݻ�N#���W��″%ޱŗs�݄�f��*{�om(B��2��>4o�v!��r�qpW���(%w[�9��(J}���g\o������y�V�̣ǭ�K�]���T*�''��i֌rߒ��>�ط6�/�&���NF�GUm�0�,�̔v���4��u���Y�"�ɨJ/w	z�댣*L���^n,F\���v_�j��$s��x��͸m��:�)���,G�F��R}_�� �!$yV,3.i�L-wf��Bf���&AT�>zAa��Q�C��{�s���')�st��i�D���A�d5j�_���z��Y�6r�1C��/4V!$�p�k��u(Er)��2�G01u0ʋ6Zs��(��r�1�{'_�_��Dm�Yƈ��36�V����a���Q��s�B-N�}
�FY�~bw����l�N�qJxt�	6��H��'�Y��>#�qD�=��ԇd���$��R� ��v�-s?���=d��\���B��a��}��WՍ/f��*z����	F�ۍ��=�ǚ����PB�JBP�C
I
�8P������2�Mq1'0�,f@Y�� ���Y�(de�����'7�����.������~�k}�����MȝQejT(Ch��Q�G=v�p�jp����m���`��K�C����hb�:��}�]�	��p��گ�7��RU�#Ue�˗xU���S%���$�����-���\%�^�=eSh��W��������̌!MT*�X.h��M �M�.Ԙ�Ah�����8��8[���I�.�����9 �'1�k��@������kDX9<\�6����\�϶O񏟮GW�^򻸘ܙ�H�Cϒu�X.\�D���+�u%���#T8�r�Y@4V�yE]L)u1J�^V��Y"�����{��Ҵ�׌=�I�?��d���>]�����8K������;�h4Ť%׿��[n���3`+`�Gg�G7`�.S
�D�5�B���<�S��J���bb�r�]0����H���D�v�H�	��ւW:2��>�i���j:[yo++z����$��+�.���9p.R. paԡ(��O�d���@���.��"���{���f���fA��_	�����m>/����ʖ:�)q_-צ�kޚ�c8��H�Qb�����48��e�X�g�{�%W����ڀ�*�C�$�RLj9�����b�(}�2ޯէ�Ko�aWj��/�*ݮ�g-�oU�M2�٬0��q��w��<�Ե I��^�d��YJ�
�9��z�V*�D�[Ub��(UrbR� &�"i	�!y(�֎��+${%���e=O����8V��Д���E� |Q���y�=$^I')z;��K�=�I��<xv'�IY�A�zlYF�܈���"GG=��@��+]_Օ��]���ӄH~��צ���bW|-b�x�QL�ƺB7鉛�cD���*ncD�A
ωW5�;�C@����y�)s7L� �-�u!;k�Ӥ��jf�6�~����p�Vy�}%�ȇdԂh}F�R{�D(����bnߑ�����4���9@4���h��(���&����D��
�Pr����j#Tf1#k0��Ӵ0g��A@sߏ�O�����R�a�Bzx/��C������[�����f�Npf%J^�k@�<�0¥��?�`-��m?iTq &H�W�)ޭ	6ۨ �d}(��Ay���1;���$Y�y�jC��|5�dl���-�� ���V�
��Ɂ���vD�+�΀���I�qbXy�	�G��p�O�fB=����|�i�(���v��`[��mw����ֺ���ٿk����r��"k��]�ߵ������zI�J{˰r5�d��C�EB�Ftp�D2тS'�U@0�g�Io8C���WP�S�'��_�h۷m�Jvr>m�5W�t$��Zqh�Z��Ǳu^d���F�v|�02���hd"��"���)���P ���&14;���pP�G��� �{`%H��bOf��z���:W� ���	I�t��C�}N��2*���O$�W����0��Qo<D��QK�QB��\r}3	��~nf��9��I�N^g�u�t�|;�|���.���Fg����ِ��q�UƖ[���"��hf�XAe��q)�1�ƛ�E�a"�cPD��8���K���K�h�}<�Fբ(��Z;��*ZدkI��~�g\�����
�R�]c ;���t���I�\KK<�F���zg�A��*&XM�E3�d�}_�Y��^K�￴V�M�޶����v����֎[}p�ͮ��"�6lD��ڙ�
"����:'�����4�$Z␥=���b1���bp3��\'X��@�0����G�	�|T)A�I��>J�����&!�4K�ĵ���3���f�8Qf&����������z�)y�xJ�/H�(�{CyG�YV��,�M3�"�M��1!}������^]5q��#���g��o䡺�_kw�W]����W�H1ɖn�ڼ����>iJa|��������^�!�HE:�t��s�ؔ<��)�IIY��a�p����,���!S2X�H	��-#:Ɉע�KpWz��l��K�B�Ͷ�J�?����%*Ari�*�5.�ʀ���Z1lOsu�6�����}�R����$2A��̨��8������ .'Ny�,�" C}"�I����r�����%] U���.�����Bi�募~���ӊ�E��o�ۅ�\\
S뭡�AX��A���0!�6 ��x���I���H͌��eZ�,����8y�(���J��i�uKϮu�u�H�M��N;%�/_"���,i��V������%y��T.s�_�?oܚ���Zʉs@��^�=��ː�8:�1P�Jt�s���<�� R�yC��;'��J��c�����y*�p¶/�a��uF�M���u�������/bZ龎G��)�^}�!�r?�3�/�E���o.�2$�G��� �T`���;!l�V������-� 		*��f�]�I�2хd� �_`�ů�Q����ZeA=��>:q�^98*�Um���r7k�������Jx�e����ՑQ���־/�;!��$���[�eĆYJ�wD� ��F@�2�茗^j�J�wD��*<�9u�dSK��Y��]�,{\� �Α��nFɾ�G���{�=���̍���P@:�ZyZ�yMO%��ҘX��ׁ�WM���2�
s�{�K���s�2D#2�ц3+7�v{x����AɁ͖����b^*M�X���
:�q���(#��qhd��Ƈ��K�K�f��\�'���u֩��I�񊕧t���L7�|̩P��[��F�+��I    c��r>�9+"|پ����R��Xg���`�TX��G �1�Q2�CTS�*{a�\9*�.�It�!���3�ɯ4�z��=�
�P�ݾ[����b֢�;Ky}�������N�݊*��5֐����eV��|�����_���	��y�0;�Ő�I0��w.���`�i2�08,!F�2�L��Ě/A��2r�c�NL��w��,<���$��g��;>��˃�O��OhƏQ��'������|���_������7�<����/�=��H��(�.U�*�� )��B�	�`Q��T P^,�{�<�Drl��`*=Ȱ띉��:1t��[r.�P0]3��<-]�n�Ok��P%�sk�P��kP�b �ǧ�<�6$*<�W� -��&[��֑���q��v*Q�P��J��;r�r����}l>�Lh"7����Q����[01f��Zf7���mh�o�>_x8�ea��`=`_'�06��n���9�f s���磅�N+��aΠ�	p�5�6Aؗ�E!�D�&������u�_�}��ar�V��Hr��{�Љs~�tۭ��B��V5>���%��U�jY������AmH�����c0iR����L1���s*��Vg��!���΀å�1��L ��+��)���x�3BݵΛ��:X�L�6����򋹣�I����/M;un����Vp�_��)���'s���q=B7ֿ�TC���E�� ���k����F�K�j$sH4i#�K �(��.`�]Nd$�����H���T� ���v}uu��Ww�:X�$iN��T�:RB������4w�O�=�|</���n�I��W��〒�Z�,���g�}Z���[�I3!p��`7�7��D����d�=|ML��R8K���֓.�)��/b1���s�����&�iڿ�Jؖ/�f����,/����v�>�=C���[Ei&�A��w��x���`�'>]����%��10Q�#�� ��1�I��Ao���|�:Xn��\�=)+��RY9���ʫW{�Uߦ��V��J�Sx�?��_�oD���̸i̒%  �Ԡf��$ṏ,�ko ���C������r�a˥6��xJ��v��G��ķep������E	�4D��2�ץ&�m}��i���}���"*�gF��9����M����vYK�oP����ޣ��/�����5�����;�a����ΐ������d�&�l�$��q
&c�2��8�q\�I��|��̇h� �T,��n��s�Rw���ԣ��-_�3�g�p7ӑ}����9w,�(��{(wQ���bc���${?�m�Ȭ~�l�G�t8��.N9!6pD��4�4X
�)�G������İ,�&'p���ZM���j)8��������^H~�sʎkU��>������cyh�����7�O��z!?�c��;�י������ʭ���V��}b�����C��Qe�S,)+�CIq2�d���t��LD�؍Ꙁ� >5pK��6<9RN���j�g�����4 ��`��l�Mi|�ߦX�/�Q�To�,���ሶ̻"�@OB�qo�H�ɣ�8샇@1�3�s�ͮ�Hѩv��_Ur7k=�!�a�Ru��v[���[��d�=%��B���[˛>��b��+�C#�!V_�/^��Arψ7:�$d'nr�^� �9
���]3	�;"7��Y*A\Ls>9��kM���F�U����E.!�!'"�U.�S���r#W;�����&7�@��Q�k��F���8�B�HXQ��h����!&�&�ēbL�I��d��U�}���xo�U��4�j0^��)1����#�Ŗ��"�f���g��Jo�ͩ��GY�����Pe�&0��,$À(�U~R,)@���='{<��(�HL�߁I���ڑv�����WJ�+�
h�Ey>�P��A]*�M�M��[�`㩥�z	�q_S\����"����`>9�p< ���v�UIz���T�{��'���jR-1E�������,(J�v�N��Z��%�i�Y�/!�0`l�FP�����]���]����ן����9�_��1�����)Ϝs�3� D�N&�h�SF�%���\�����E�Q,@�-)HI|;��kmĮ�e����Z�G����:����o*��G%��ɌB�$4�d���|����s왼u�H22[���*���@P%MT��� ��$��L��E��yʢ��|������=���u,�=�q�i:���曎�<Y���c��I�^?p�F��"��]>N,�,n�G
K��q�1�k�s�c�]D��T����!�c�����?Ja��Z5��ٕ�bW�rA�,�n�1;}=�c/���_�D�����x΀�%z�������j�`�z�	!o&���E*���8X{AXf��y�'M��;	t��a�`M�Q+���� /)Q�V��c�]�?��!�+�vK!�.]�/��A���\b�:A��L���V��#C��cƴ
"��U�@�{��<�؅z�4@��A�p��B&�Z��U� �����l��BmU���)�e���V���u9�|��Ȟ+�;!�:�yh�?l}��=
������o?�*�-;^��k�Fp��u^����8G,�8$x=�V���4�Y~=O�	��DE�\/���E������LQ0���A����8�uI���Z�HJtX��v�7/�ZC�X��~��rZ��ǭ5X��1SL�Ƹ����s,����� ������|ʒ�u�!�xՖF�y$2x�E�~Q��4~�1�k�E��?�_+�{��BqL����.l&x�
��6�٬`�լVU�JD~��G_�W7��3J�A�,��N8x]<58�D�I���!���_�J�7.Xf9�bȬ��0ܯ�������d�˗a(Q\�ѩ,�?�T�"�R���Ѡ֦����e�����Hl�SYf��1He���=a䄰��5��p[��2�,�����4XI!w��l[<4�H���͚�dO��ǥ�v_�+�ϩ��i�q�"^��P;M����~L��h(����C���*d�j1/�T��є}	O^�h��g�C&b��H.�.�Bo|��$%kɅ��m�uCҽ����XЬ�Z�eԖ��6ӝc�H����� Q��B&"��031N|������
���*�<����U�Xl��]��-ڠw�U�N���s��z�\Ž75�����(/��2w���hJs�ͩ��	HƑ~��0�&˖�ؕ���Ek ��o4�द>AkV�*˲���)Z�K�d%'Έdȝ��r&-I�T0�&?��p�=��^��`4���n`c7k�u�q��$dZ:���@�e�:��^����3c�
�0��JXHS #�/�p�'=����
?{g�����k��@��W�W�/k�SGd�]9MJ	��ʏ��@�%�=�rcə�yX��Mx�9Y���S�L*��}6G���҆%�:�6���!uV9�q�[�7���5~�l��_d�	�e_��F�/M���"*����o�c���x���2�L�8ܽF�T@�MIpXJ���J�"���9��M���"E���YÉ�1��,����Ta~����*����]�����i��y2�)�;���n#��Dtg�Fy��y/�!��
�INx�)�)gH���rH�N�[4��]���d���������`�'͚k�v%����4���E�Үj[AU�ѣN1<,[-z`�y;��q�u��)���*��1�N�e�8���,��HH�A��C�����C[�"M������vcG�|K��r^H�~)�q���ԍT��:�~�i��y�G��<$�)�M��H�n5�R!K	]b�E�C	�OZn�!��~hR)�rd4�s�y���d�GĹ�_���~�6�Z���0�����C	�-3Y�#��s��=[�$Fq�M3k��*k���
^Jx?(�$���7�;e#�,�ޕN�n!o    ZO3�M8u��l�6����˷p��!5��[�;��Q�5�^4�K���wh1�2��lr6�+�i�5{Cf �AE0���R��>��M��d�Q�=@��
�ϐO��Yf{�~�m��;\����ـ��ꄫ(��z*�R'\��?}��s�t=���x�����5c���Ft��-��t�I� ��KP�Yid�5	b (f	!Әc��F��J�8O��G����`�\!���yo�\����Y������H��j�V���R7iߕ+���JOA�H�<f �v
��1c�eHr \ʙ�T)�_��FE�c��#�V�Dg0<�خw7$���|˕޻�ڇ����YG�zE%z*�y�焐D�$]0��R<�UЉv	K�4�D�b
g��^��@.P��љ����hdF.�#�:aW��52��O[��s�}*P]��f8����j�#"�x�61�+��u�!2��D"#=���C�r��d�s6r� Ĳ��J���lB���s�x��3l-���X���T9��h%����Qe_���eTv�Q� (�ݞ�4�:�߶�����?��R>�����o=���2Ք6]2���>	��Qݒ��dID$Cv�������K�f�f��@11+Df�����z�g!�~�v_�B��=���	��V�����Pw��[1R�֊􊋬P�'��S\3��g���?�aC4&�#��!���d�	�eH�"��	����/J�g�o���42l9b;����]��Z��=�4N[W��-�63N-�p�|�:e4i�y��U�j��<�����n�ǈ�H#��z	�Ut��<���Z��RӬ��"y�C�t�\����Iْ�,8F����	@T_�٪M��ф�(k>-�R���4�}��x���>YZ����B�ؔ+O	s>��C,8?����w��Cޛq�L%�R��fat�\�/�ILH�����4�.��z��"�}��Z����ZEO���������|��urz �Xg[��Df>]#j�ߴ��螄E}6-eb�	C��C⌦d`B8��	�G�Z�$`��Da�%I��4�s�-��F��$"~]I��)�<g�6�Z�>��m�{C�������*{�ձjS��򍏶i�Ǳ���S;)^Q�ݶN̘�!���^Є��M%E�(����ȱ��2�x����G���Ao���n�66�X��˷DPŗ�\���,kS�Nv��W�sE�E�h���tŘ�iH�2��Ge�dT�㒉�����Ƞ^'�4�Xm(}`x�rhLN�a����@�ʕ�v�5�d�h�ī�^�����u�t��������Գ2��M��'������V�ef���h#�vI��!��r�`&� MrI.�I#�A�lR��$����!�ǲ/��Iy_�>ծ&k�Z���u\�ͧ���vϿ�P�������"x���Wkj�o�яW�x+G�NK����>�h�G�f��<*L��ZG�u�.�$!9�4X(d�Zh�T�z�%z��>�����'`D�p�]o�V���o��	�Q������|%��r?[bx.y����W��j%>�S�u������o�� U~��h��	Y���O�h��Q�dFC>�=�Gkmb��!��7�7Rѹ EFVu� �qyR�k;�Eԑ��q��1K���=)���ĤR��#��%�~�1~����f�nU���~�r��A&���yʽo8��F���
�o�pp��:�$�<=&%��@����&�#Qy�$�52甡":�����G�ᦐU�N��~����*�<��v߃���h���4�����Z�wUViE��[s �>���6�U��d��0�,%���%9Q����ix����!�M�n#d��f��D�a:�2�bx��o��x����G�mK�b�h8r�~�R'�ru�p�l���sӧlU����`I��=�(��]z�30�53:�%ǅ��MdHɓࣃ��:lN
�q�B	CL�3fT�F��z��BZ;l3��f��9�;�Չ�Q��m}v�O;g{�K4H�$���.��\|a?[���]xՋ�yԠ��*���S�>����d�̽Yg��8�E���;H޹H=j�3�G�EI|���@D��}�B���;����8<FU��X�_kÊ�z�+ʻż5*}�'3t��%��)ҼY�ًv��Շ��K{�k�I��f�d���I��2.��V
��4NX'B"~a�8Ki�R���+y�c����<4�ef9j���e�6B���.��Y5Qt���;.�U㦒���ǭ�V�-��V�Dμ��{xu�=گ�z`}9́��~����Viw[�u���HHn@i_�1g�[�)�[��r,!7E�C!1��{;`�����1������u�E��z(.-���(�ݕ�eÓ?�1?F@k��g�AI�!r�%�5<��\R��{���EH�V���A�c��2H����H����WC��ՐR�����$�#Tq�\��=BB�i.��M��>]�:_5Pˑ��_���GR�]�Yb4�g�������X�<�~ǌ��n@�����80b%O��u��l���YO΄���	u�ܜRq�L���Z����_J��J ��2Ү+��v��t<���Y0?��h��ɂ+��-� ,�Aɤ�6��B�����zр��Z�� _�0ap&��'9�~�I!��{:�b6��-!��#�v��[�Zam�|���|R6}^Gq�����I��5+�̌i��J�,8�b�����۷&fUX��zH $�C/�O��h���x�`��Ř���b̶v�1�˷�q-��V�C��u{�ԯ�F�eUI �u��u��C$`�Y�enNV���U�Y%�o���u	b� �UN{A���Q�Z��p�.����}��8�)ε����n��jo%=�V�\��U�j/.��1m)|k)��5~����~�`��=���+=��E� ��DJG���I0�,'9� 	�"��z�-$�H�'�$��a�J,j�/Ҷ��]]/#bOT��6?�J�s�}�����.�6�*�Gh�3���g�վ ��u���U���m-�
O�4C�Ӑ)Nd*�֓�쉚�1�����Q�$gY�	�}!�N��H-���])��1%�%D��-R�
�Ư͞L��B��dV�ԯ��Auں���Jk������$���&��.U���Ǡ�X���7q#���@Mx`L>��
l0�'3�©��H����,��\�ɒ�(K���R��Q$BH�Ą��2�S�Z�Av��И�$0?�Ue�s���u��Y&�!�UN Q@e�v�����zr�Ka�]��U�^?��P��ݭ.�N���}?��΂��
m�3�]; ��!(a(�F���h�2./���9e��ϔRH�K��C�D��[fMs>X�h���>ۑ��s@8� =�_��C����->���Ã;����Li�$���`��.�F�9���:�m�L�0Ğ�_9I��ec�
�9g9��:C8(��QE��3�x��������<#�������@�:�xj��k����z�������5����m�ɫ�Bb+��l*�e���q��H�9��}���˖$<Y��p�*c�p�"c$<b	�����rl!KcVZɬS<)��3N�	�wc+�'�e�ޕ/�\g����g׫/� �aÿ���}u)�_I�u%����Q�9�
G)�{-�m� �G�q����d�XB�����"�A8R��h��ǦK�< 8=�����M���.Rn{7)7?b�?]M����B4�KD{�Í�h9�a��*cs���b$p;]2����k��7PYƤ�Ƣ֑OE���L��-ilP�� ����w�[7L���PZ�'��_������[7�ˋ�,��;���#����YT6�RK
b ���k��\Q�Y�XL���!�\Fd��*q�$Y)'�EMbdIIؑ5�&�&k�i#:�6�wOb����|ͯ_�c�����E:�ն�W���@�[C�G������L̄    �m6��1�F�3Ē,i�
�j�:T��o˥Ϩ���V�0H�%���C?K��k��|(-;`/k��'�8	\��|��K�����Ѥ��ĮJ�-@�}s�ck3��4����N�GX���)J\hp�ɒ�<&#��!:B� ,���&,籭;��_
/�$V�4�>���������֠L�$<n��v�b@7nV��6k�/��A�,��1'.��
!�\�B�C�q���MFp,zp~d[���aܗ�����@����g�\v�Ӻ(�+��ٶ�^��"?���V�w-��a��Tk����ʗ?��i�_"��A��C<4�]٤O�� gs��{T�RK��YC.��e�#�y+I���I�vs"�"���ܜ:�_��`�� �ƀ�`���QN[��p�hp��<��T����Y�7�`Pk����C�����F���2[
���_1*��`v#�����#{l��"��ϩ%�rx���<hӕ�8�i:Nk��}n<��>�T�{|�A�O�29P/�'u�{��7Z���!4M��IR�)V@5�'�fNȆ����xf	bh��%�e���؅���P����N��!�c14�.��[u��߬6:�Ѳ6��z8"�-?hN��T�7�h��-#b�H�nO����寧Q��֩�6t��fI��	%B�?G�WT�0
�\m�b)��{a���f�3p�~�h��pd�=
�jQ,y*V��ؒ�bE�|K��P<��ͅ�}Ty����Ɔ�^U�>���&��N�+��w��!�!R�<(9y�M�pMdA�!h��@E�4SgX�j��padIKH��MO4��Z�sq���Y,�6�D�T;��������o]���ʆO׃�]�z�O����;�0Vgm�+6���H Z6��B��)�K�3�ܔsVK��f�g���~��#E�G
"*}V���01�ڝ��&y�x�W&y��3��z{1��h-i���)ϋ��{�6���W�mb���X}.뭑��)�I�=�[M%��)Hԃ0�'�.Xd�(��}����89F+�`b��+P��w�/v*L�F叁:�y���n�>W�����8Į3b�6Y�7;�w��B+j����?��?�&�^5��Z�8�1P��~gg`º#�"�W"D�̛
�⒡:���9v
}�L�5��r�N00ufD����g��f����Ok��cp���v��|���@�\�kuK�y��/�c�J�#x�W` ���D���QP�c�8�by��U%W �"&����i�4/�;��$	� F�"��8x
�������[��nT���.6z�g���04���1�5�~tɯ�O�W���K�䖺�U�"���v��uv�ꎇ"��
w��IG�f�hlB��~�V҆�������GVb&)ݮ�O+��;��y~�6�����`�fv�r� p9Qɖ�T�F�Rt^-^r�4�hD�� R�y��$vQ��Y�N3Z�ڙ7m;�LA�v�9����{B[��_����
]Y�=�󢞹GUE��ߐ��Y}l»"�B -�Q8��Y��=�nZ���V�h�	���d ��J�u"68n�Ǚ�c<����pm̻2�iu�7I�pL@�Ο[}�I(}�}��r�l"w��V��|G�xu���Hُ������>��v�ͼr  MWpgM`ABl�#�q�i�R�$�@�GB4�y�����,Ȕ���@ґ,�A7�_�8�a7����_�s�DB6��6*:.h�?�ؾb�>^ǲ?ٚV=��$����վ�ZG.x�l<�~>"���]9�XER��-�("���d�w �����"����@�(	f!����'�w,�j�o<Y����^�\O�ݝ�l���B	��o��˲F�?���p�~�d%�c{`����J)�4��/w��m��rr�c1�|f:�@^v�����9� ���@JR ����C�o�J.�Q�ځ��Lx
R��ɐ^� 5 o��ژ�h:h0U�v�7TU*.�_����V}�Ӑ���������'4��Z=���,��装�.�ȸ��)w s�IZ�࣊�)�q�CF�5QZS%����g�\
A� �?J���=��Z��.��I}�Jߔ������F���c,=����>[I!~\5�/ؗ������HF����+�Ʊ��ፇ���Z	��qc �9ei!��ҹ � ^x���*��@�c�מwgk#'�:Y����H��|�8X+��uB��R��zJ
-��@�7�9�c �Ndȯْ�˂l=�6H>ْ'g��!q7^g9��h�L��o�و�-u��R�ó����{:�����Z'C�+���|]`-�n�V����л<q�6�Ǧ�τ57��)YP"�E�"��B���n��� ���Æf���>�3�q$��UeMb;
��Du��p
�)��ጁ��	��J+fy:���e��
OZPR�����5�r�)�gz�S��=%W$S� 	���9$=�[�&,$�d i�� ��	�gp�fidZP��FZ+~Ό�ݰFWy��:~q����>�k�Yy��a����j�W]�Uc��x�7�ȆS(������,�$K��@^D���٘L\p�%��a02�6��M�;p�"	Ȧ�ђ[x^q\�ҥ���Ն����s�ܯ��+��3��l�sqo�,-ӽ cm�n��kǲE8�L�Ǜ?�<��)(���'�[��'��)^����2ik�b$|q��H��BFT�W�a�����5���=�G=�5$�(�gu�V;�S�"ݪ8�s�vh����Ԛ^�"_��S�� o9����	��
�j����FCBijsɉvI�hHj����J��r!\�p;Cs³ڱ���.���.:���1���吂����9��18,}r��y���hs�q	�m���-�pd*��5�fc0��rZd���@\�z���XNR�i�с�uCK�R�>���S�ZE����v���׀������勆IR�����p��}�����5�;gx�N����l��&µW�H�!���#[(O`V�Rxd���Z?���1�C��re�r#7x��z���FV�'�������7�A�+m�2C4���D6���w�@�ETq�A��֑#���G�8�����(�[abm�=僦 �[�Y[ůV�U��f�޹���iT��Z�p�dD�=�?Y�b���(NA@)�@:,�z�RRY:c��$�6����Ƥ�!df=���FN�Fo����@]�:��D4}y^�����|]�9�[1 �j���){�c`3>&
b\13�k�ͨ�'�q�S���B��g[�|A��t�x(S␙Ș���Ȍ̖��޽�+x�Zu�ê?�m���� �^s�_�+_�l�#^������L�M�rȔ6��N����fŵ��Ș�^g�,2R(S�J�q����B@�Q��Y��6�L�ln��lHO%�~�ZeH�̇2K��-O$�p�2Q��
yy�Ru]�����K^T	r�?磋`ʉ�e`�){���̼��Kb�Sr�_�c�c/�1j�S�:�"sDn�� �U�S��@e煲��d+
58r��1J�vN@OkUy`���<8�oƐ�;�5��,��j�|ti��Ɲmi���d���ȫ9�\�_��PB��9��(O�g�9��,�$Y�wN���p�u}��Dy�{�r��k�������u�9}C椓4[�u���囤p���[r�E�^�l�O�o����AC�^��W ./@�=��=./�z3��� �rxe%�2Фy��"$�hʩ�pi���V�0�P�g��%<��m1]�7h&��'񛑤�i�]����
�"rƨcm5F�*~��4�v��jB}R��5W���.�����
jf��W�4�KK���	��{'!(.��eZ��%����\��<�\P8uWb-��'� �~�Ti2wU�̸�� �*Q�ӍU{o�Zp-95�c��C�oA�`�^rK{{C�M3Z�2�;��-\�1Y'pي�lf�{	�T2�C|�P^��.�����ۅ5��    .�=���kgm�g��>���w��4_,�z�Z�Еy���VZ��s�I�i�!\��.[��
Yƹ�ހ[�9�6<y�x!��E79��$��
s�p��@�� c��1#~3��L��u��;Ō4��^4������F[�W5��~�p{=&�z+�`�э�3��+g �2�k���L��B�	]r�����J����%E�Mt|�	 �N��dm���q�D��	wg���F��m*}s�߶{]�1�"���:h�X�����ҧ�<�ٜ �O�{���Y�{~jp�D�h�J<R�����:J�gmJZ�`(�{Di�)�!�|�	r��)�C�O�g$Ok���Bv5(}�~�A�!��d�(`��
�[�Ԕn�l$��|�[�Z���ފ�<;�,�����ӂ���8%ӑ��)�����R�R� G�*[%�	f,NSO��*Q��'��,�a����Xv1:B�u��TAǵ�2ʀO�����̑D@H��Ygl?itR����ʟ�2}Yy�N�q�Ӑ�23���M
� C�:o��![m�dHƤP�*B~�#����E��9���'c��Y,pUI��k�)��K�O#���q�>C���ɫEtS���^�g�~#�}��|Vn����5	���5��������3���������|�����M��\p�T�i�0!��X��Ō�HLd:+	Ƈ� ���Bw:(���j�21
�2:��RR����z�����dm<n3k��>vx@$�%���V����6�K?5����q��w�h�zv��F�6GI��	��șl(D�H��Ċxw����Ձ�h�G8��ɻ��bD�%�\�^���׆y�<���[�0�:��v��d�:�G,v�<���_o��~02��jJ�uo�o-�Kd�YJBc����#n���������5�ss ��e=(59�ZL��tgڪ�p��b�v������ �p���pQL����P�A*���em�~b�t�^���UӬb��ig|������_�������NE���K�g�Z,�f�;.cW&8�����o���A�|k#\]
.�jɩ��=	�Q�4(���Ɩ�;�Y&a<��xV�:x���R�=$e�3=C���g;Hʝh?�����-�~�bSV=�](�mz��T~_�􆖃��`�i_E5_z�=��Te�3��
��#�8�W�!����6GEJ!@�F��)��y�>���"E[�8�JѶ�w�X]�[�����<L�J�S���#U*��3�G�o�����P2/�f ����{�yz&[4.��l8M�y"�@D �G�j�mB��q��7��=�b倝�uo�{���M�m��n����|h7�֜fS5�pOJM���{32�Y1������H�*��$؄,�]l�4e�J g�bT�<�4�G����T�n��L1ү�!�!ňS���DG�����S/[�(伻i�>R'v\-몧�ݨ	>]�	��3��[�h2sp���i���Ǣu�e��2�ZHz���%
/0�!�>8{3��AY�c��0����a9/�[�A��j�2��F�^�
�G�@Za���$��(/��24����S�!,T�I�{z
0���r�r���J�k��_*I�h�d8"�H�P"�)DރpN�P�j9D�r�6Hk����N9���y��}'��ikYf����Q㢍`�R�Cl.1�_VG�S�Ͽ���ھW�+�jk����L�C������51�+���'�Xag�fj �V�(���Ȧb��tv�����+\F�x�iI�`u3����	:��NQ�;�3_�-����z��	�2Y��b\%���jct%���W��owX��M�Zx2�|�Ft�^'�Tp�"�ĸKF�n2���fH���)x��r��Qx�|���l�;	X�F�>\;��u�|K�)�cV��mk��{��!T��*X�VԈ���_�dT?�}�׾������8y5��>Bm�b�,SG��N�Ș�\((DwHPJ��,+P��Bl��!]/����葞֊���>{���qm�R�'� �eM�F�� _ՋL�PW���"�'�MR���)��e���$��۞8
al��Y9��'n�r3˜`I{m�iY� �G*a懧B�c���Z��(�G1��jz��=��t���Z˥�zn>/�Lr��p��'��Sa,{%���R(�(+0���1��3�����=	�@,���R�YZ�R6RD�3��|f��$}SQQ:�����k�gy�=�Ԁ�˷��Q"	�� ��q5����U���KV��RM�y���t3B(8��2~p�=)�lAb�92T0SAI�d��Kx���[�\L���E��$i��9��Z���-��u(�ͫC�������N�����;����J �(��TI��OA�
�|�)�����԰;��5*0���F=�a�US>�`��-��Wf,^x���$�KN|����L!�G.)���*�b��r#	��@�����D\�Q³��-�W녧E�Z��;�>X��S�w��lW��ҽ��El���+k�Y_�	�eL�G盦�tW�&��h9UױZ����8��DqހM��h�q�uP�$�c�-N��� ԓ&'kη���wr��tZ#em��4�Œ~����3i�l��o�����{Ye6B����[�\>	;���������%K<$lld�������#��Inq��8	�Y&*QAT&\D�Ď,ɉ =���;Y�p�G�;F�y`�'v�����(�߫8�E4��ǓEa��M�]�3��JJ��ik����S��-�#@��T�H�+&�R�w�{�c2D8�ý����
�^j����t}��t�F���|p�}g�K�og*\o懫h�:���+�&*�Ҭ��j����{`���/V9���ƕq�9<�XQ�� ?�é|�dX�r1������`��6jp�Dq'�������n�ϜΧ�F�;*��~�$����{j
O͙���x�Q#�s��%��VA�j}JYV{��/J��F�mqd�頊B����qDh�¾h�!$��R����0����TS���?F�u@pCR}��-?��;��j��X�w��i�w.�Oe��Q�D��)x�/��6KM�V>1�1l��y�kݵ��h7Ex'le�[�Js�S�!�J��!�E�ܲ��P�}F��|x��M�ԇ����5��A�0H�����k���O*���ެ�HC��z Z����g��i���#E=�/?�g���r� �"�wk!�����5�LWݵ��٣_��.|
(�+;#���aZ�2)��������<=�Y�4e��ف�`�AX`����/�J����4���Z�6�͸�n�m�#o����X9�[�������?VMyU�9�e��ZhF�W�w�O7=��][���Y��Wp�H�iJ�%�2���+�±��D���[MV&8�2
������sp�g� �`��΅&G�=�q���
�;�p���{�R�Q���	|V�o��#�[����O��x9��N�� %�f�s�&�-`����Y�y�,�"�H��
��s�PAyf�j;�F��޼�����gܛ���~��:+�EHwZ>��V��//�~�xl��U�[��3�z��s4�f���#����3��]H����pm���a�<�"8�#љd37ʉ���#;-�v�q�;<����f��������̘�ȹ�ЌZGG���//<�z���ywW����a�j�꘳����>��R
R*�U��5��C�)"<���d����y�|?�$C�`�նuO�%��G&:�Y<��y��L�鲷�����c�N���v7p�r�ÛF�r�>�[,��������U��]c�̯��	8�z6�0?2g�$�r��%��q�z��#$�e��A�z��H)%��+�4Ω���I�����n<��[fR$�E�h|�v��h��v?�~�٠��u2CU��3��i����~�͕��`�ZAPpQ��ΦQ����D&��e���D�S���K"��u;���5���8���    ��˷�g5��@�U���m���V^�����bw��/���Z��rQlګ�z�8%_���Z���'��1�i�4\�����4	°�?���F2�IL.���{R�g��q!�"U�F!� ��^�e�{>N`��Z}F �n�����Kq�	5ɪw��]y�r;�k�\�J����iF����N�;u��K!vO�Ÿ��)�9�N��l�g9�"����#��\>��hA�:��E�q�ӵQ�]�p��[�{����Pɏ�/ĉ��o"�=�5v�W$^�� 6�3�C�+��U�󴆺 Bpd�4yb}	�����h~�뱿�O���:�pH��<"C��X_dl�@�%MAh!�G�&4��,�
�����r`��xRk����X���|d��D�A����}��ee~|�,X'�c	��I\���#Ĝ��N(\�$Q�S�$#�P��Ib|�ca9��F�`���g�d8�3�9ms�tJ��9�k�_�铵S���u����rg�Z3��^��pj��j��1���eF�|bW��zw[U�I0q�����B��){� �c�$)*+�Gr�)�X�2ݣ�Do��3Ý�>ۡ��,�Q�(��+Y��ڬ���MUmkzN����M�1Rҙ�Km��_�U��a��g�Sd��tq�Q��B%����a�yH�i�ǖ��$;��Nk�6g��i�Βwj�"d�SB��o�0��z�m��Gf�#�;�-K�/�&��S����؊���Ჲ@�^��,��<�U�go�J�=�W%i���ZI֓��f�6f9?���r����,OG?��uD���}X�u��\� W��撞���yae9���g��r��݁(�M�R�Y!t2�I��%yIZ1���J"�$��\b.�(�a Bk�ޚ�©�����	�����M�mUB��gk?���l�&F��L(�iXW�h��J�sF����d8A�L-S��y"n�<����c��OTȴ��H���p�V��B�������KF��i�6j��.�G��~i���ú�J�U��ov@�큞F=Z����tnkʐY�c�'�<�%��J�L�p�� �E��	ق���!��塭����OT[CR��^ĕ�nk�L��0[���
��kJ�)C=0��(�R�^�뤷F�$�	�X�p/��C6$�{'bcʜ�CB��&g<�ެ�/֬p$��?Y�V`�Ck��5I�|q=�W��S�����^>/!�W�����<�anG��T�=����`�M���/)U%tRpޓ�JXxk�Lp4r��l���%����_���#{�u��@���D\�OVᦊ0��6���G_5�z�X�(�k�%�j=�k2�i)g�.>!�H1q���j�H�Ә*�Gp<8�?M4��9�$���EJ�g�Vi���E�f=��s�����zN��M@s&����}T[��}����C���6�?�7}�����0��ǟ�gc�-=�8>�I��Y��*�NV�Gu�<�A�ȣ�53�A{H���ؙ&;��Yf�����X!���D8Y���ď�+N�w[��՞M[�"��6�l�����_�w?9��4(�ތ%U���:�(���ix�����h3OÒR�@�����!yS�|;1�\�`���Q��ӓ��5ӷ��� �1������nz�+^�g��~<�������a�������5��Z��Rgl�K�}r$�َ.J�H�N�jo���5(5�g6��oNz��r�q��~!��� �)�[&������Wl��	��V�V+��)���~$V�	O�Ϧ,a����aLr��ȵ�F8��o	ۥD�Kv�p�E�I!FQ�����J��۸(��~rA�dY;u�N[��s�}�nͼˉ�������@JJ,2q��Bʁ8@�t	w9/Wd��K��*���� z4��=��Q�L�C�����q�0����8�ٔ�I�+��6�����\�}/r,&��2X%��Z�3���dx/�#|��ԇ�ɂ�T�	�g�06��B�PoT[���L4R��Vu���_�'�+�����נ��b�0�����+(&�Ԟb�yͅ8�c0���l�-H>�8�d�Z�aL�h=xd;jBgO��ƛ��v,6�5�V?�$�h���
;B��[�e�hu������v|QZD)q��$�M9��]P��ޟ:	e�܂�4�"�ME�#DކŤ�U��L�<p���8/3��97�t(w3�������o�������/+�T��i�Vkh����b�=y����S��.������Hb4�(���ה�������g����̋�	�Y����Ak��Q��&2�%�,��`�L�ա�h��i���˝��5DswQ�k��we8�Y�/�V�|�+o�Sw��4�cN��3�D �C�J����� 1��A&\4�E��O����(3�H���\t���x$�5b�
��w�[�{���yv��:��Y����{�;�v���J󸹔�]y?[7��']�ѻ�J�|��dew�y��.�r��$gNc�_���D�t� \�BP�侀�0t�>.<���mN�=n�/����n�d��y̮�cT�N������Q~^F������02e���h-<4���K=��S]ģOz��~hb� �z����Ly�^^�c����#�z�+��`AA6��`�g����k��bC�f�����i�N��@0zL�� ��WX�_ŋ>]��ڕ�����ڈ޽�Z�
L���ܔȫ�<��H�q�YHV�s-���b��(�U�B1���A��dD�SMu��x��@��p��i�֝��~�
n�3������o��!���o���7ل(V�|���i,�IO������@;�w+Vĉ;K�0D%,��RԌ	Ԫ��&U�$��v 1� P��u�F��`�͊���iD�r��Z%9k���nV�����im��k���N���:g�'~����>�)�fB��6��%�.iֆ$#dS�����ri�}��2�6љ�=s>$�4*6���v'��C�-ŧ�:�0nǜ�OI�|C��� rվ��mߖ:m���q��׍>D
�O�U?(n�����絃� -:g��YJ�e`lǲEa 8)4)9��[�`������|t(=���gӯ5⿱c�l�gs���u�y��������^a�L��c��S�OYg�ƯrW�<�P�g~:���!��㴉f)A@�	w�2,�D�![��j�(���ӰW��Φ�� %�,]f�����k��q�:Y��~/��K�_�)ax��/���+x{=*������b���O����uiQ��ɽ"Z'/1&�\;����gذ��[!+�2G�h,�2,�φ���!���<�%XQ�9x��� ��!�Xx��YD�FxZB�TSP���1S= �7��C��]���~�T��hJ��G�|� ��$Z�_҃&�P�u_vQƅ�H�1�3���ޏ��"���C��!3.tđ��  ,���E
Z���3HH��+��UȈİ6�����/� |Wn�ˊ��RMu���E�D��&G���)\��D�5�K)H��&f��Cq�O��d��"�(
9A&6Ye�+a��6����|�pOx��ڨ`�|;��]	H����@�"}>�^�]����7x[f�ףyZH��/|���)S��$D.��;y?X�*�V��Nrg��Be�S���̙��%���`~]��������z��k���q�d�hu`�3F����1hu9��E�W�{����Nn��t�d�f��+)d��RT�A�gI!/�(��,1��DC4:f�<�i
*0JG�qhw&X�=�?���qyP�g��<�'���o@?�z�Z?��%(SP�-ɷW+�;ՉȬ�:�9k���B2ᣘ���l��n4F�^Xi'����O89��X'nPs9%
�D�px��d���Q��m ����(��>{g�}��2=Ha�ފ�����.�[��[3�ڣPa$����p(ծ�VA������RN˖_�    ��MPtp4��֟�3_;/>�1�9�,i��	�p�)f���د$D6�	/�IDz�����OSAF)Jz.�A����>fHv�m}�㲼s�@f�Dw{��^���%�����y+_�!��u3*�,�x� ~��Tᅶ�e�ԓ�h42����$2�ʔ�D^ �"��j��̈���Ai�6� �1�� ���@���t%$t�o�ϊ�����%�²�Ľ���2�`�aMl4Śr	^q�'Yj���N:�$j?c�sk�cr=�z�{ÝB>�@�R�+	۬�mg�s�o�6�0㦟9���"��H���΁���u���5��l��x��w�|��Q1����i+��Γ�S���Tx��QC/���`vǕ��+H�T/d�a�� E�$����ژ�	�SaQf���=��~�)��\��ju���\g����3��\��E��Ǎ��HJ�k^�N�u�.�[#���΄q��CX��U%91V���๑4A����l��ϳ�R2�r�Y�P��?P��M�:��TI��O��-k���Ȩh�� O,��t�}].◣���=UX{����'�@&����Qٛ�#i��'"9)\v�;\^���8
�W1D�ڭ<g���C�3*�@�/�T�ժx�8��J_-�����mx��^�y��O<7!�B�e�S�Df�!�ҌS�#`�*�pZe)JK��-�"�Q��1v�,��R�MFu�ݬ�����/N['�ղvgYI�X��^s��:3��j���_T8�˵���>�Z�>�4oA�x��[��h��O�.S�i���W{6z!�j��d3�Ar�����S���<��T�>xC!�MI���������gc�ˎs�GfY�#ogk�m�u�|��5�����0���?�=�օ���٣��!�7km�U��۩�̔a�:�-���P��X�Lz���kG�C��$��KM��Ld(���#_����6�P{i���4�a$G�l����Q�8j���k;?7
:U<�����l��W������;�����wp��	�b�̙�'��^�w ��!��G4E��X�aLIdm=�
~��gp"z�^�08��hG&K��~����D���-1 �K���}���mC�?�x��N��wx���u��srN���.i�&F�/���D$�1p��=
D�W�8����6Ro ��E�b���)���L)!�_-l(�>��_ku�Q'�9��O[��pH�9�7U:� �����B6�rm��d�[��s�ͱb�~��S'n�O����lM��1�R�p���.��6��fgj���Q(J�C��͞�t9��ƞ�j�=����g�������kE���՚*�U�u����z�o��|Z9��&�s��Ŭ�:7�e�({�{�8<��P�n{��E�	���6AX�L��F�ZG�4u	aK#�vҎ�L�{Z�F�w[w&���*�UZ�����=��d֫( �V�2dͤ/�t��Ng�(M��s��$�Sc[�B�`��V�D��i�P�Rji88g�?�5��N�,
k7��p=�)�ZOi����p�2��/\w+ f�Za*o6�c{Y�ç��O�Q�����3�L.���Ht�2%��vQB����"i΃��G��"X�w�k)E�X�T �6�k�v�Pm�U���a��C���{٩�֪�G{����SO.�h	Q6��Y�knL�-�,A��Ld��<JH}gK��ۘ���l�F�(��22��ӈ�r�ܘ�$7���固����;/���Wª�[ʂ]��l/ˈ�#K_O%n?8�	t�|�w����[K�!`d/�g)�hC0*��C6��s�AD�<�:�Y��Y��y��?}%t�6��v['�7��������6XK�(���ڨr�� V�<���M>z�����tl���{���Tjς���6���3��L{Ȁ-��֜�tu�S\<}A�Q��H�x�Y2N���Į*^揻�Z�
��9�>m}v� ?���{^X�ds��ZM��)�T��-�n�ʭPf&�|�sj*Ʀ����.�[��aY��(�� �U�r���i��$��{�A��3*�IR�_�ڌ)��b���������['��b��1!�=JA��̅G��Z\��W���Ukn��=��y�x�Cl2�F�$b�k�@��a	�Bf� ܆��ᜣ�dIN��,�G����y)U��*5\^���2~]ρ�;�Hm�6�����w���`�i��e��"׋�ȥyA����G>WUUrBd|�0X���. EK8��D�Q�l��y�%�g�k���D��L��F�A)y��GQU�E������P����q��0ֻP6�?6���5;0��ʕ���#뚱u���j�"�f�j�`���X8�3x˜O)$��so �>���!��u����5Z���Kp\�QB��C�� dڳ�}�\n%ݦ��O�Ѷ�$�I8��{;��w�*M@��(��(���Xd���p��s����g�� �ـUP ��e*�1B�d|�v
�O['˷H�-�Q����M_t�*�Q���B3���Ш\:9rr81�2�͑&�3��� =�Nj�Yb�Ti�PI�@�}��^����dD7g�A�'��絪u}�2��>{��T���c;[��~�Vo]�R,me���3��z�)��(6��fI�CM4��r0J�Cjb��
n5B&�� 1yU����M����,���%��㧵�:f9�I�|%�����������J\��������G���,9�QrJ�8�$�@��4FI�*�YD�3A���l�"�3�!��6P�c�ta�eZ�e6K2�uɩ�ѯ���ut����i<��D�r�s�t�"�������@��1�n6�Pr"�r͖B��s2��fxa�QI0)俚Z���F9�'�+�./���-��s!�w1\�᾿-����*=�7՜�R8�����ZRhݟ؊S�ʍ�zV��[�{��C��9��d�C��`W���.�Ef>��u�1Ddׅ2�፴�Cx���_kv�9���v�C�UA��\�P#%����@�������N�W&�	-�	�⋏Iya�-c 2*��İ�"?���թ̝�\ip���DD"9�)3I�d�iG�y��l�:7�̶���$���وq1��@:ܫ�|���X�Y�T?�i�#�����&�Vr���kMŤ(Og<t��@��(0*��������m�$������$+��dM�l��>��kU=$X3�8��˷i'��p�����{��8�WkS�OMW��i>.�=�� �2�6_1&��	�F�B&�zb"��9@�!���C�c���0Cl�Ԏ3�q�qdL-�B�0#����f�3B�}��]%2�ev|4�!��S�����|U<{]_OB4poY;�2C'A�{Z����ǐ����I�n��ِ��4�Gn��ƺ`�[h���č���#���eӵQ)�����-=d�\�ύp�u�i�.k-��ccAA^��d��}���1�7��h*�8�:�(�^�D)�ę�����D
�%���DT ,{,\`X�cK���FV��F�����<���w�n���~SM�u��\�N+���[��#D���S_�	Q5�DQ��a�� ��\S$�23a����x���i�=d�!E��L�Rp��%�q��t��]_�pqm4�@Ξ���G�� 9��9�*�����SM8��0�����yB�Z S��k��P�1�ׄ��� q��"�h� �:��(�M1�$2RR�H�^Z��bhOKX�Ġ=A�lmЄ�N�o�YAH��zo���7+��eT���>�Ht�n�o��j���|�ǿ����f}^�%[����M��Hb-��m�G��Ebv�Y��Y)�܈��<� ���z�{��î�����SP�b�D��h��yq�{�ِ�=��)�����H�Sr�9�B���e�Y����l�K
^F�yt�e��p( y�0h����L�E��Ỗ��F��ޠ����D#��C���yn��� O  ܀����	���V>B��Bvǔ�pY�d}4�+D�82M����n3OH$�I���"[�_��~<���Խ_���!�]���z u��"iͤhҘP�2
Ԏ��f| }����[I��v�F�c�A��"����b�� �u��f��K
nB�č��d��a:���f��Ţ��S����S��N�o���h��S��Y=J�T�Z;��}��h��}���]Y|o�<�8��g3�:��^9&['�����k ҷ`��Kd�SE�l���H��8M���SǇ%��Q ;���Z=8#_�mݢ v�pT#�v5��+��l����g�a�GO�vts��Ձ��b�B�y�~��Ă��g�>V�X�#�_fp��BD~܃�)��@�`���S����;�kr��>h��5R��9h8m}��ew�
l���Y�ɯ����r7�x!���[g�}�0̉F�631�+��C,����!Pƨ��G"J�=$����� ���)��:r���0p���s2pZkA��9J��[����U������2$?퟊M���=U�.:	�mHB�4��׍���*���\L��'��<r�Jh���q1MJ���N�YH��^,�����p.�
��L�Sg�H9�?��Y�`3����ŝ$�
A��G +T���FO���[g{>kOu��c��8`���O���8�	���q ���P,g�%�$Z������	K��)c�$8�DT�I+�@<���v�>9���6�,��F��[��L��g�^����WD jh��b̓@'�l��ש/���tl|��ڳ����xd���d��(sZs���-�(IH�\��� �9%8Č�1�����YHo/Su����pN��N��>��
-�r�6
g@��#QH�iP���I7=�j���/�e^7�ZG���(=����x:n�".�6� ��8�[��,G���#W�:I K����Ddx'��*,�{D�2'S�6�����"�$���	�S�@N��~�&���y�K�@�,*��7'�i3m��	�����.DĢ�Ez�(a�L������L�Y�}� ,<�ThQ�7��3D�A�=�Dze�����/&���}$����Br�A����EG9à|�v�Wh,�`v@Rl��� ��V���>�-Y���y��u(DCg/�D�N}�8m�ᴆ@9ʐlٳHX^2�� �)0x������Ns��Pᢔ�iӅ�*��.����_;����3��l��ߢ�ڣE��B`v��_Wٙ��V������q�U-�1QA����L���1��'�D�BR�io��L����(�&P���7��V���S�����A=��:Y~��#�����V�i}#_�{�/����Ŀ-�e�څ�V���ta���7��k�f�k�!�h,�.�A��M�łg�-�(�dn�F&8
WR��o��A�S��cm�F����-���n@cL�_�L�?wo�%VC㗾�cդ���SX't��'�
�$�UN�H��A4Τf*KD�Q�`|�QAb�u��ͬg2'���w��.�_W�2��v��t�Ok����K?�$�򃾀R���{+����Ǜ�\�1�*'������/+���"�och��X�������kɍ䆡��Y�@��DN����0�E��d�E&��L��^HI��U���x&�4�.�mS�)��c۔���?Ѹ)֢�RK���w
�s����M�&��{2#f�;�<�����Y��޳�pWx�i l�)ĝB�{t����ڨ�������W��^g�������j�CG���b��˺>�O��1��Xp <�m����	���S������H=&F�}d!�D��6��h��z�}L��G��=-��� �qm�ȩ��M:����Z��}m�#����ߏ�{������� �>?!=�z˶W�[	eݤ�l��OYQ�lu
�
.XtD+�>Hl�6#R˒4%���e��D�`.]�T'��}�vsj�� ��.�nu��l'kUomT���yX���s4'i�Gc��$�軼������?��n<����-��r+�4������V���ݜc�����$�B�Q�P�q܋(�N%�X(!h��X�>���N��Y���E�� }�/m��c�^��0�����-ڂ�l/C�O�Đ*�^�v�o�|�?Ž��k��S�#m���H����_m���[�����ʹ0����lɦ�L���0����7�	^R�GĖ%��D �P"�y>�M�`%&�s��3��4��q�_�̙vf������J-X8o�k���n��ѡ��v �{����쳰[.�_�ne��I�0c���i�,"�N>1�t,
�"�Xs�x��D�ډLZ1%1�?�u�K��$O�g�V&DqeR�I�k��r��xx����ͤ���#(��B��ԁWu��<�O������!�����klk.�VJ��LZ�"@�A��u\�u�4���hyeAt���\����u�F>5��8���KB�qĥ?��~r����?����Gښ.�NW%ԇ����:�_ݴ��Ʀ��y�<e�8�*�^֝hn�ĜUΑ�8$E�̉��Hۉ�:��/s	�>:,:p�.[�P{4,Q�a�&���.�2g��G)��h��s�5Xz�L�a�h�6{~���&�ZS�m���/'F_�K��r�bA�o�V�5�8��;���������"O{"�ל�;��%0�b$��� ������Zs�i���`���`�/�WRN[ջ���
ʾ�F�m6_��I�Ԋ����%�!B���c*Ry�d6�KRy��d����OY��'�|�83�y����A��֬8��ãׁ�����9�1�6�|���X!y�B������v���82�nUY_o��uNك7�H�S#xgFtm
f%�Z	F��ay(9F�#&p!���(z���XE8b�xՙ�����ؐ4�ٶ#�e�,��Q v)��ΕS�N�IkUՇ�p��m��D�'od<\$�`,�@+���q�5-��[��23��Ӏ,�3�NX�$��J��`mI��T���v(��������'      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x�32 �?�W� bq"      �      x������ � �      �      x���]oɑ&|}�W��;�!�������`o�j����~����m��1�;�-Xm/v��P�4�I���2$-�����Uy�OdUe<%OC�t�S�*322"���~��_>�껯v�������~�����}���/WI���OO>}<������ާ��?ǟ>>[eI��]��]R<J�/��2��I���EZ����� ��U�ym��~�������է�w�#��S�U���S�ߚ??|���������ّ�+h��И7���י'E���������z�|�yR�Љ���?�����#ē�_�� >1����U~�xk�þy����:�c�x�C�:�w��f�upyw���Y�i��pK���|Փ��U^�ߪ�Z���<li�鵁>6��N��5���f���Ͷk�z����,�nOv���5:І���Y���sc�a�ު���lҮ;Sڠƀ��gܷ�>�ru7慜��=5���7d��St�I�����mٰ]��Yk6�YGzs��N/�ּ�c�Ş*�fk>�;���}�4�=�=顱��+bf>���ln�Cy\�5��w�G��dSzP��e�Y���d<B=cj,�y���g�����[;��O>�ex����|=5?�l�;�v� i�md螪���j�ԉ���
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
%�W�*�%�`LP���{���Y:��τ�;aK��		?(��(NӅa,�X�,�_yH��~��/�/�oد��!gז�Oߌ�)��m��8g��h�n]1t9�ekʚ$^0%R�#�&h��S1:�����V�Ӎ�{��>@ �E��%��țT�';n{#.R%+�+%� m _ˑ�a�uQ_y��      �   o  x�M�[v�:�s撎�&�r�?��D�]��"L�(Gq��}�O�|�o��u>�����2~�O��_}�
#�>��������ϝx��R1��S0�{*�=w��!�����N|�(����i�o]}�b�S�?0��|�t����Yo�>�H�Nլ�V���
O9��W����?����CgK
�|R=筇֖�z��S�MU=%m�r�1�-H|�����E�m�ɱ&O]���_M��
#\��ï&�x5��0�[*&41>`��TLhb<1�W���_0
G*&41�at���	M�pV&4�j�𕊑&������&�+<�H�H�I�H�(xkr��&���&��0mckb~����51����q�ԣ���U@o�������et��DX���;�`��(?�^��w��o�U:������b��o��?w��+���8de����>�ʌ��~`�)f>w:ƯV���8������ �;U��j
}��l����{�Bc�{��z�[�-(�W��G/�� ��~���S�-�9��)w�ܲ��?jT���[6PsZ���hu��E�V5iU��^aJ�֪Z+��{#��W+�=�[4�)�=w��FxOńV�'x3ޟ;M��b�:U����E�r�Z+�F�z���_��_�.��2��|R���H+���zie^�=,�I�H+�(x��he~ ��ke>z��]��2���W�e��o�갮�W��Ͽ�oje�ZM�F��i��x�ɛ�2�c\Z��U�V��pkլ��	ތ�V�W��������>S1���N�V¯V��UKZ5�2� �;U#��W ��J+�j졞��V�;P�h���� �w=��|��Z��UC+�H|������C��V�_.z���iխ�^aJ�~Zuke����V�Z�1.�zҪ[+�FxOńV�'x3Z_1>(f�bB+�F�LńV�8ńV¯V�z��je>Aj�~��x�je>A�!�H+�j졞�GZ��@q+��he~ �M��Z���Z����he~��V��o��0N��V��.��֍�հV[x�)Z�a��7�|X+��aKńV����S1���	ތ�V�W�K�������>S1���N1����,�Y�ie>A
w�FZ��@�Z�Wc�i>��|�[�o*�V�c���m?���7PuXu}o{��Ehi�v�����󖤉�����P��j&���:�+L��ZMke���ǧ���x�q=�fze1�������bZ+�F�П3�Z_0�a5Z�0�gZ����m�_/�+��%��R���,�/�3�>�T��2_����RZ�Wc�:i�H+�(x�V�� x��mo>z�m?�+�ɶ7��B|�R���ǔ��Ec��?	�����6�[������ϟ���+i���LS3+C%B�$��S+C$��%5���]����R��)��H)��R��N�N�H<14�}�J{i�;q�Ԓ��CJ�.�L-kI�j�����2Df��e��y��1TRm8�2]m��mYɖe[������Pq�{ʛ��n^#��^�-���v^7��Vrcٍ���?�b#L��Vh�E��	�z��-;k�������b?h��XsO���@�e=����'��'~�ޖ����X�z����ԉ��P��g��QP<UF$B���8
��%�((ql������� M)qƐ��7��Fj����!f��nG�ڑ��:���v;
S�XDoJ���5w�:�1�,�#�Ӝ2;C1�v�l�4�sO��I��I�9	4W�v2Ĭ��I�改�lei}�9U����|������F�AK'��#�0�x��_o�%�7�2�1Ӑ��SS�H`��c~��K��}�71~�q��ۏ���Ԏ�4��-9>
ҔC�FG��M�(�ߺ�Pq���( �*q0�D/���T��8�!��Q�ΐ��J9|�>����ީL��xE�J��2��x�����!��IZ��Lk������j-���^-Z���A�ʜh{ͼ{fjI��iJ���.\����δD��Zy�a��+++�k�Ȥ��ўF�2�N=����J��9�l3�!���{��j,P�,6��=��w8�=�;���}p�w4�V$r��Dm�;������������T��      �   +  x�ՔAj�0EיS�����m��r��!	7Y��]�vp����m�(�H�Ʋ�ƻ�f��_��t>~�b7�O�_���+�o��=�G�
Żp��^��D����������w�^�v�k2�4r�&tNߋw�LZr&d�i�L��9}/ޕ3n����FάG�XG�����'����:�* �ڥB�R����GaE�gӃx��}���c{�����"�����p�� �"�[��Y�幟��P�����xi �.[��zޡZe���?n~<S(��6�.kк�u�<Z(�-���`      �      x�͚�n7�ϫ�أsPEr��sTZr�ݢ���K��J8��S���aM��vc��6|�r�KiW˕f-	-�0�4%~3���#Č%�1/���H�s�n���յV
�uq�թVh��V�x�ձ.~��m�� 	�� ?��$|f�+���,Hp?�R����G���ϲ>g��w�=KG'V�iu��	N�z4?Ü�W��VwZM���VO�,iPrC�0���x�� �sя��3�y�W#�K}��<��&���gFwc�>iu���q�p'�|A]�ߵ*P��b����5�A��4���V��HKK�a�������_�L�4"ԇQ�|�P���Jg�����B��⤔��5��r�{S$EKI��h�D�	���	��N��>�����ެ�6��5�F���r4���簰�+��Yi���5��{�HkE���� �QpXG�'�fzW�����p��AN��B�tq�aD�D^�u�uB��s��6ڄ�$���s0S� b	��T[�4^��� Bf�J�;f�*+�³���	 ���{)� {��p����%�@øF��1��?MA������P��M��qi��� ܿ����b7��O"�"����o�Ǜh�G]$��=�r�@)N���v�8
���.�ݱ�(�1;g��QK��oKkQR���p&Q��cJAѥ��d}J�E�F��p���zb�-�u�Ă����n	�m�O�T��?=����RH��ߖ8ڝ�n{t�.�ltT6�m�O5-��a����M�ل��e,ټXZ�#R��yYA�??����:	�!��_�[(�J��VrD�h9��G'��Ƚ��1�#���O�Wql��Y��vX�8�j�P�ݴ��ZE�_����vB�i
JF��:�x�2%���do���O*�0�g#o`Q��c�on ��Iq���Y�u.o��ug�Vvg���p�����N�-����3s@�[�l!��m�r�mY,Q�rS���c�dَ,; �
JHB~��9�Y�u�}�C���Fh{����?����#��n#���7�'xr���ϟn~�%!���k��C�vD�h������[���8�D3`?0V���I@d��`ha�m����`$\g�0�u��gJ�ğ�0��"A�ڊ��������(]��Z]�}k�{[��?A�Q����g\�#��pV�7�׆%���0�u�ҟ��٫�b2��D��e\��\&�����4l�h���-1xK�w��z��p��%2 �1潟���lxN����o�-�E.�1=���ߢ.��4x�^aT�w>�v�e���A�e�0`�̩�[_Ҭ�}��]�9��d����Zf\��o�<��&����r���	q6�p9sd���ܩ��v�z�j)<@bv�����[U�EC��f�96���KM�W�׭�y?\��κ���4�k�Q�T�я}F��Q�␑}d6C�8�˖V�� �������ӝ�6�l	a����^��/�?
�      �      x������ � �      �      x������ � �             x������ � �         �   x�}�A�C1C��fd0��ݏ���c&m7�R�l��m�h��E@����~��ﶈ��6�3�@{/[�S�!��C�@4J@*��H��VBڝ�0���TQB�A�	xo(��v^��t̊�H��.B�T�]47/�l�:�mH��s���^��^&��1�F����H���������{��w�uu/������Dj�H�HM�H�HMރ�Dj���)�G����s��n)�n         C  x����n�0Ưӧ�	��%N^�{�=��&��	ҡ��B�¤�།���N���bn�4Em��;��߱�'��D�	�E�Tf�ܚ��̬���Z�^�qN�����5����f���3���N^��ŀdd��F�hk2�J��*3۞Z� �����M��]��+k����*�$g����o��m�����]j�A����ϥ�>Y�0|��ߧP�!Du!k� �atI�p>�]����?y�D���Оu����!@5�2�U1H�������3}Ei����A� �2�`���6X����=L�}A��훌R��5&�`�%����[�x�kD{;�3>B�GX�a��>V�J(�o�@8s�����CA��(;�I�7���&B���D���|
��Wӊ��騢��������/�$r>��Q�j��n}=lT�brZA	�@��ƿ�Q�<�1�@�X�M�z����4�;J���8��5���;�z��Ȓ�E�O߀k0z��;�W�nD�2Z��rQ�22P+�n�t�$�E05v���A��ay�dA,���;��N��(��٬����:�Vu��+�l�D_ �������ę����R����^���oĖ)H9��ꛯ{H̟J��m
X*%�ۤt
�g�؍e2@��j��<w�6I��s����w+3=ng���ѭEY��{���@�My��(3ؖ�g������'hO��D$�I�5�����l���F�q.{�q����<W���"N��EȼO�U�R}6R��!eW#^�
���/QB���:���_I60_��cZ\���S6
ԏ$�K�Ğ���d2�D�ۺ         B  x��[[o�~^��A �a�;�\��7׍� �4y�>���H��R��O�,���<����6���T��b{�o�%�9g����HJ�����]��̙s�ΙY/p�G/�hG?��V��A��~��E/���'O�������6���+�}O��(���6zO6�`�d~�����kx�G���FmǓ��LG�3�T$�o��(ͼ����,��ܹ�$<�s��W���2t����GN �/Y�>t� ���^N:��� l��s���]������n�l���h����;kkw>�[���+�3gmeuM}儡#	������ܺ1�y��|�|"I�d.�?$�sIw�v��H�4V<� �#`�������ޏaU[RV�ݚ������|��:�!%�.��=H<�e�Kr�؁!�lH��i��3cК�q�.Ƥk=������:��yN��}[��^b�tݻ�8]�t����SP��M�`����فqP�_$Ԛ�A���O����&��~��Aڜ��6C�ZB[Rj��Q+��U�U�Vvc����/�R�R�F��@�sJ(��~d�ݺ��~�n}u��"��L#� *ۀl�3�����0_��:��u�zZd���>�>�"[���ӉqW|RRk��z�sS��t��1,��F���_�y��zr�FX��߁�2��RyX�^�m������ry�v���[K�3�����Bcд��pV>"${���c��}Xy�s�ݗJ%�2 ������;���p�C�
0(u��д�3�囿��qӚ���ϱ�Q{F	yJ��E�<��Fg��£�7HGv���4��s��V�Ci��������g��k�X)�1�e�
~�]�1.���9aR�q�V1]�4�@�>1��S�}���{ʏX��!ŷB�a��m�2)�uC�t,E~�̎�3tk3�`??|�I@W�p�1�rb7k�4 �r ����6��<P�c��ܸ�%=�هd���@rR6�dFIF������Tj���	��G5M7͢.��m�zti@608�!�B"嬢7񭦋�DWT!<�zCv�}z'��(�ň~~��xz.k|ga�vD��:Qݽ&�#��w��֓��
���t�Z�KP�>L��A5���`�y�ai�iߟ�f���9y��8�0��F��	��U���K^�n�DN���T�H�	�����ā^A��~
9��c�ۂ3c7�T�Cl�G�Bg�]6J ȧ�	y���>��>�x��B���B�(W*�D.��X�\���&+p�:�ye#�����D�jB������:�N��c�M�)[�3r���b &Gdt�,�2��/8p�*�=�?S�A� a����KY�Y	sZMe��R�n|e�nS�4R�� �[6���j�+���7МƊp�YRq���]��&?e<�����[�L�8�׬G�I�`ܻ�ǎ���7Y'=�W7���ӓ��ҙ�:�0-i��I�e�$����Ӫ��
�jHP�s6\f�́���4�Y55r�;��U+�\H��2�ki�/y�	)�9DӰN&���CX����[D�ǃ�����zB0y*y���̀5c�O �{��E#�^gi>ۀ��,��)�O����9�m��)/ E�����ѱ����:d`�=�kג/��x��/iL��ٕ���{j����6>ӟ�f���y��sW���Θ�N��ůi�Ƈ�tUI�,y�t�!�P��S�����]L�~Fc���D��%n*'T3��K>�)Ꞃ?>��v��%*��h��4��!p�Li캓)��� f1�Px{��*�%~|�`�C�W���0	�r�!A��3M��-ؘ�SM��P@�½I �<����|x��K���z��e̢"�����(�.Z!���o����ݜ(�,}�)#h���p]�Q�O��7F,���!A�L�%Sc���
D���PI����RyD����abKc��3)�ϓ��r�E^c�s糕���_��v-����_���[@�ʀ܄F��������+�,�0r�:(�2�X�L��Ll�lf	����y�N�{���<��&����&7}$R,���B��2�b&�E���M�����k��h{,�1�kg��J\&��r��	���F`�����"����aT+<�Az�HҌ��tl�������+��ސ�6��6�{����"�(V�_'� vH2xk�!p\X�B��? _:>���T�t@͍�j�3��(��?�Y�ȂJwX��/����k�L����E���m�DO3�Ib�*�gewԇc�&	�\�f�M��[ �$���4��WO��.M�����YxdU���M^�G�O�Ρ���u��=�p%�,'����gB�>oq�8ef$K�C��z���f���/VW+MG�\i v
�laE��g��Ҳ����j�C����J��-��j�;�*�yqa����CV�[�A�R����++����T(o��b�������:�.<1y�Ӹ�:Lv;�k#�VV�Z3��u�呅UE�Y��ׅ�B@֖���?�3+)-mL���tg�3zO1h�v	�J��!O�	�JTE�"_U��!Pˢ�G�h�"KV6��.υ�C���rH/�̉ύ�js7�x/YrWY��-5��t3c�d�����lD�̹�fn!�<+�Z80Z�E���ԃT�$�VL�U�[�qi���~>n�F�@rp��I�#`�.U�S�Mm�N�@�ա��&͛}=@�&)�������� ��u}�84�^��ɰzS��	//��(�����*TRͅA3j�K�C�>y��(4Ǹ@��U�z�cR��1,tR]q��G䵬�Y������<��GJ��)�m�����%�?=�,>s<n'f�ڗN̚��g$f˖��*�'�쿳��m{�>0��q��*��m����{@��^ȱ*�h��k|��B:�� K�����RR� �%�f���%���9���A��<�.�yeٙY�_+�d1�7T�@���kn�s�Y���xnNp�s^�ݔ��M���Xr��w�H��KʺN�q���!j-�7(1�K�꿼����9Ki��/�9R���A�����e��s�y�uh֓�Ix��GT\y�%�>��"�bV�:���\Hm�RT&װ�C�r��M��l�c�扒<�yg�\0+��L��0=�_s��>��=�'�_{L�('/je��0��@u��tu�#�I�xI���"�k�R�%TQj���R����,*Wa��6��j��~�.���u��O�œo�Bj�A�I�	�
���*ׯݧ�d_�_R\
C�#?�S"� G%�\;G�}�R����z,           x����M1��o��
P��L�w�=��S �����)���(�,CE���9���q~;�䨗������\�!$=�������+�����x��h�)��J��C�?��$P[3��������S/��Ə՜z9ك�L^�;:[�jen85�ߣS͕�@�I^K�
&\M���Ŕ�E�k��a�X����s�����ŢI5ie���C�@��h����}�o����y��)ds��T�>}O���C��1J�"��I�q��;=?,��p�      
   �  x����nT1Eמ��ى��k���@| R'qUDg�R�~2�}H�ds|�s-+�#��6MPZJع
N)��l����'������p��������Z.1���p�4Q�Lt�:����F��g>�)���ܒ��(#*6J%Im�W,HG�j�̻q�>���oV�#�5Ks��:���r������oB	8��4t6F%ߧ#o�P\��F�[9�
��{�y�+�.�0���Ғm[�=zj��v���X�3�ȊA�;Iԙ��d�L���A3��^�O�JZkD��!���H��j�j�f�2R%y_��r�Ok޽����˛dk�<K���u�̾��s���:�$H�)!��}�{V��8^����z�q>����y���%�ɹcr"gCo�1��\�&�[��!l��B�x��@+d���T��������$��            x������ � �         P  x�͖��� ���}M���&���rX/}�E�����@m�(߀f��0`��k7�v���?�L�`7 6�:vR���Zcb�����z�Br��n�K�Èq�Z���s\3�q�,�w��T�������+��k?cg.zj̚�tW��8B���{@\,����.-E�;�V[��f"d�X��#o��A�Dh]��1z����k;"K��9�ހ�PG*�K��C�P�+QezgsQ�J�I1i�P_��z���@�;3O����T�P͛�5*Q���Qg�HL�S
ĝӹ�*L�2\a���Z����6k��         �   x���;
�0��zt�\��f�\"'p�"���"Ȉ5�c?A����f���c�%�D�X/�K)�՘�}�����`0Q�ȢPP~����QQ�-��EG���!�����cD��Z'T�d�BY��Te�jt��� �J�ک��h�1���2�            x������ � �            x�K��CF\��F(�=... �T     