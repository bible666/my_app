PGDMP     3        
            x            ocean_msa_policy    10.0    12.2     o           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            p           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            q           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            r           1262    123761    ocean_msa_policy    DATABASE     n   CREATE DATABASE ocean_msa_policy WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C' LC_CTYPE = 'C';
     DROP DATABASE ocean_msa_policy;
                postgres    false            �            1259    132337    dm_as400_olis_olploahd    TABLE     �  CREATE TABLE public.dm_as400_olis_olploahd (
    "LHPOL#" character(7) DEFAULT ' '::bpchar NOT NULL,
    lhtype character(2) DEFAULT ' '::bpchar NOT NULL,
    lhcmdt numeric(8,0) DEFAULT 0 NOT NULL,
    "LHLOA#" numeric(10,0) DEFAULT 0 NOT NULL,
    lhacdt numeric(8,0) DEFAULT 0 NOT NULL,
    "LHRCP#" numeric(10,0) DEFAULT 0 NOT NULL,
    lhamt numeric(14,2) DEFAULT 0 NOT NULL,
    lhamtc numeric(14,2) DEFAULT 0 NOT NULL,
    lhcmp numeric(14,2) DEFAULT 0 NOT NULL,
    lhrate numeric(4,2) DEFAULT 0 NOT NULL,
    lhtodt numeric(8,0) DEFAULT 0 NOT NULL,
    "LHSTS@" character(1) DEFAULT ' '::bpchar NOT NULL,
    lhcrdt numeric(8,0) DEFAULT 0 NOT NULL,
    lhcrtm numeric(6,0) DEFAULT 0 NOT NULL,
    lhcrus character(20) DEFAULT ' '::bpchar NOT NULL,
    lhcrpg character(10) DEFAULT ' '::bpchar NOT NULL,
    lhupdt numeric(8,0) DEFAULT 0 NOT NULL,
    lhuptm numeric(6,0) DEFAULT 0 NOT NULL,
    lhupus character(20) DEFAULT ' '::bpchar NOT NULL,
    lhuppg character(10) DEFAULT ' '::bpchar NOT NULL
);
 *   DROP TABLE public.dm_as400_olis_olploahd;
       public            postgres    false            �            1259    123793    dm_biz_payment_customer    TABLE     �  CREATE TABLE public.dm_biz_payment_customer (
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
 +   DROP TABLE public.dm_biz_payment_customer;
       public            postgres    false            �            1259    123786    dm_hermes_other_channel_payment    TABLE     #  CREATE TABLE public.dm_hermes_other_channel_payment (
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
 3   DROP TABLE public.dm_hermes_other_channel_payment;
       public            postgres    false            �            1259    123769    dm_hermes_req_bank_payment    TABLE     �  CREATE TABLE public.dm_hermes_req_bank_payment (
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
 .   DROP TABLE public.dm_hermes_req_bank_payment;
       public            postgres    false            �            1259    123762    dm_hermes_req_credit_payment    TABLE     �  CREATE TABLE public.dm_hermes_req_credit_payment (
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
 0   DROP TABLE public.dm_hermes_req_credit_payment;
       public            postgres    false            �            1259    132495    ms_policy_lists    TABLE     
  CREATE TABLE public.ms_policy_lists (
    policy_no character varying(25) NOT NULL,
    policy_type character varying(3),
    policy_year numeric(3,0),
    product_name character varying(200),
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
    payment_channel character varying(10),
    agent_code character varying(7),
    id_no character varying(30),
    first_name character varying(50),
    last_name character varying(50),
    birth_date timestamp without time zone,
    gender_code character varying(1),
    card_type character varying(1),
    title_code character varying(3),
    title_desc character varying(20),
    marital_status character varying(1),
    origin character varying(1),
    origin_desc character varying(30),
    nationality character varying(20),
    nationality_desc character varying(30),
    religion character varying(2),
    religion_desc character varying(30),
    occupation_desc character varying(100),
    education character varying(1),
    education_desc character varying(30),
    occupation_code character varying(4),
    phone1 character varying(20),
    ext1 character varying(6),
    phone2 character varying(20),
    ext2 character varying(6),
    mobile1 character varying(20),
    mobile2 character varying(20),
    email character varying(100),
    branch_no character varying(4),
    customer_province_name character varying(100),
    annual_income1 numeric(14,4),
    annual_income2 numeric(14,4),
    laser_code character varying(20),
    dopa_check_digit character varying(20),
    monthly_income numeric(14,4),
    cust_code character varying(10),
    policy_org character varying(7),
    created_date timestamp without time zone,
    age_at_comm_date numeric(3,0),
    rider_flag character varying(1),
    rc_status character varying(1),
    rc_pay_date timestamp without time zone,
    msapolicy_create_date timestamp without time zone DEFAULT now(),
    premium_ordinary numeric(16,4),
    tot_rider_premium_amount numeric(16,4),
    tot_rider_extra_premium numeric(16,4),
    apl_flag character varying(1)
);
 #   DROP TABLE public.ms_policy_lists;
       public            postgres    false            �            1259    132360    ms_policy_type_mapping    TABLE       CREATE TABLE public.ms_policy_type_mapping (
    policy_type character varying(1) NOT NULL,
    policy_status character varying(1) NOT NULL,
    apl_flag character varying(1) NOT NULL,
    description_agent_portal character varying(200),
    description_as400 character varying(200)
);
 *   DROP TABLE public.ms_policy_type_mapping;
       public            postgres    false            j          0    132337    dm_as400_olis_olploahd 
   TABLE DATA           �   COPY public.dm_as400_olis_olploahd ("LHPOL#", lhtype, lhcmdt, "LHLOA#", lhacdt, "LHRCP#", lhamt, lhamtc, lhcmp, lhrate, lhtodt, "LHSTS@", lhcrdt, lhcrtm, lhcrus, lhcrpg, lhupdt, lhuptm, lhupus, lhuppg) FROM stdin;
    public          postgres    false    200   oC       i          0    123793    dm_biz_payment_customer 
   TABLE DATA           H  COPY public.dm_biz_payment_customer (id, branch_code, deduct_date, bank_account, bank_account_name, policy_type, policy_no, bizpayment_channel, gen_giro, mode_payment, bank_date, upload_date, status_pay, gen_date, send_r_biz_payment, status_group, transaction_date, created_date, updated_date, value_hash, key_hash) FROM stdin;
    public          postgres    false    199   SP       h          0    123786    dm_hermes_other_channel_payment 
   TABLE DATA           �   COPY public.dm_hermes_other_channel_payment (policy_no, policy_type, payment_mode, is_premium_card, is_notice_letter, is_barcode_sms, register_date, created_date, updated_date, value_hash, key_hash, case_type) FROM stdin;
    public          postgres    false    198   pP       g          0    123769    dm_hermes_req_bank_payment 
   TABLE DATA           �   COPY public.dm_hermes_req_bank_payment (policy_no, policy_type, payment_mode, register_date, created_date, updated_date, value_hash, key_hash, payment_cut, account_name, account_no, type_deposit, status_code, first_cut_date, send_payment_cut) FROM stdin;
    public          postgres    false    197   �P       f          0    123762    dm_hermes_req_credit_payment 
   TABLE DATA             COPY public.dm_hermes_req_credit_payment (policy_no, policy_type, payment_mode, register_date, created_date, updated_date, value_hash, key_hash, status_code, first_cut_date, cut_type, card_issued_bank, card_type, card_name, card_number, card_expiry, send_payment_cut) FROM stdin;
    public          postgres    false    196   �P       l          0    132495    ms_policy_lists 
   TABLE DATA           �  COPY public.ms_policy_lists (policy_no, policy_type, policy_year, product_name, policy_status, commencement_date, maturity_date, lapse_date, next_paid_date, fully_paid_date, pay_from, pay_to, product_code, sum_assured, premium_amount, extra_premium, payment_mode, payment_term, payment_channel, agent_code, id_no, first_name, last_name, birth_date, gender_code, card_type, title_code, title_desc, marital_status, origin, origin_desc, nationality, nationality_desc, religion, religion_desc, occupation_desc, education, education_desc, occupation_code, phone1, ext1, phone2, ext2, mobile1, mobile2, email, branch_no, customer_province_name, annual_income1, annual_income2, laser_code, dopa_check_digit, monthly_income, cust_code, policy_org, created_date, age_at_comm_date, rider_flag, rc_status, rc_pay_date, msapolicy_create_date, premium_ordinary, tot_rider_premium_amount, tot_rider_extra_premium, apl_flag) FROM stdin;
    public          postgres    false    202   �P       k          0    132360    ms_policy_type_mapping 
   TABLE DATA           �   COPY public.ms_policy_type_mapping (policy_type, policy_status, apl_flag, description_agent_portal, description_as400) FROM stdin;
    public          postgres    false    201   ��       �           2606    123800 1   dm_biz_payment_customer biz_payment_customer_pkey 
   CONSTRAINT     o   ALTER TABLE ONLY public.dm_biz_payment_customer
    ADD CONSTRAINT biz_payment_customer_pkey PRIMARY KEY (id);
 [   ALTER TABLE ONLY public.dm_biz_payment_customer DROP CONSTRAINT biz_payment_customer_pkey;
       public            postgres    false    199            �           2606    132503 $   ms_policy_lists ms_policy_lists_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY public.ms_policy_lists
    ADD CONSTRAINT ms_policy_lists_pkey PRIMARY KEY (policy_no);
 N   ALTER TABLE ONLY public.ms_policy_lists DROP CONSTRAINT ms_policy_lists_pkey;
       public            postgres    false    202            �           2606    132364 2   ms_policy_type_mapping ms_policy_type_mapping_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public.ms_policy_type_mapping
    ADD CONSTRAINT ms_policy_type_mapping_pkey PRIMARY KEY (policy_type, policy_status, apl_flag);
 \   ALTER TABLE ONLY public.ms_policy_type_mapping DROP CONSTRAINT ms_policy_type_mapping_pkey;
       public            postgres    false    201    201    201            �           2606    123790 ?   dm_hermes_other_channel_payment pk_hermes_other_channel_payment 
   CONSTRAINT     �   ALTER TABLE ONLY public.dm_hermes_other_channel_payment
    ADD CONSTRAINT pk_hermes_other_channel_payment PRIMARY KEY (policy_no);
 i   ALTER TABLE ONLY public.dm_hermes_other_channel_payment DROP CONSTRAINT pk_hermes_other_channel_payment;
       public            postgres    false    198            �           2606    123773 5   dm_hermes_req_bank_payment pk_hermes_req_bank_payment 
   CONSTRAINT     z   ALTER TABLE ONLY public.dm_hermes_req_bank_payment
    ADD CONSTRAINT pk_hermes_req_bank_payment PRIMARY KEY (policy_no);
 _   ALTER TABLE ONLY public.dm_hermes_req_bank_payment DROP CONSTRAINT pk_hermes_req_bank_payment;
       public            postgres    false    197            �           2606    123766 9   dm_hermes_req_credit_payment pk_hermes_req_credit_payment 
   CONSTRAINT     ~   ALTER TABLE ONLY public.dm_hermes_req_credit_payment
    ADD CONSTRAINT pk_hermes_req_credit_payment PRIMARY KEY (policy_no);
 c   ALTER TABLE ONLY public.dm_hermes_req_credit_payment DROP CONSTRAINT pk_hermes_req_credit_payment;
       public            postgres    false    196            �           1259    123801 "   idx_biz_payment_customer_policy_no    INDEX     k   CREATE INDEX idx_biz_payment_customer_policy_no ON public.dm_biz_payment_customer USING btree (policy_no);
 6   DROP INDEX public.idx_biz_payment_customer_policy_no;
       public            postgres    false    199            �           1259    123791 (   idx_keyhash_hermes_other_channel_payment    INDEX     x   CREATE INDEX idx_keyhash_hermes_other_channel_payment ON public.dm_hermes_other_channel_payment USING btree (key_hash);
 <   DROP INDEX public.idx_keyhash_hermes_other_channel_payment;
       public            postgres    false    198            �           1259    123774 #   idx_keyhash_hermes_req_bank_payment    INDEX     n   CREATE INDEX idx_keyhash_hermes_req_bank_payment ON public.dm_hermes_req_bank_payment USING btree (key_hash);
 7   DROP INDEX public.idx_keyhash_hermes_req_bank_payment;
       public            postgres    false    197            �           1259    123767 %   idx_keyhash_hermes_req_credit_payment    INDEX     r   CREATE INDEX idx_keyhash_hermes_req_credit_payment ON public.dm_hermes_req_credit_payment USING btree (key_hash);
 9   DROP INDEX public.idx_keyhash_hermes_req_credit_payment;
       public            postgres    false    196            �           1259    123792 *   idx_valuehash_hermes_other_channel_payment    INDEX     |   CREATE INDEX idx_valuehash_hermes_other_channel_payment ON public.dm_hermes_other_channel_payment USING btree (value_hash);
 >   DROP INDEX public.idx_valuehash_hermes_other_channel_payment;
       public            postgres    false    198            �           1259    123775 %   idx_valuehash_hermes_req_bank_payment    INDEX     r   CREATE INDEX idx_valuehash_hermes_req_bank_payment ON public.dm_hermes_req_bank_payment USING btree (value_hash);
 9   DROP INDEX public.idx_valuehash_hermes_req_bank_payment;
       public            postgres    false    197            �           1259    123768 '   idx_valuehash_hermes_req_credit_payment    INDEX     v   CREATE INDEX idx_valuehash_hermes_req_credit_payment ON public.dm_hermes_req_credit_payment USING btree (value_hash);
 ;   DROP INDEX public.idx_valuehash_hermes_req_credit_payment;
       public            postgres    false    196            j   �  x���K���5u
��H��M�7�Ĭ}B����Q�,6�� ����U��v���7U�O]J!A������`L�p�`���:�`�����Y��=���_�@�l��|~�-�z����?������۟��W����������}}���Ȗ�A��rd�d����|��q�Wd9�����r���Q��n��L���9]��89+r�9srQ�r+�R����Hq�\Ky�Y�}ur11�>���N.&��gU��I�{�]�/G
V�W'W'
V�W'g�!UJ|H��	��BQ'�'�@ �t'��b�sFU�����C��d%�+E��$�*O&�V9�UV��:�9�UV׊�.Hf�����%��L.|���"���*����ȵ[�UV-9���*��\'��+�-_dU���rb��Ie_��w�@l����:�`�`������bO�*���r�@�*���r�H�*���r�D�*����É����?��Rܣ\X��28IƉKq�Z�k�/������x~[����[����]��~��F��[݅�e\���~|-).�>ߘX����'w7(_?b���Ɖ�GK�'�-���Ɖ��'Z�9bm?�M����I0��)�R�Tcً<�'|"��i�׽�'�� ����j��K	��w,��-��@ǉ�g���$8p��u�H�7�a�s���+�����N*��/��=4��>��Mt�h�Ip��I��Ѳ��D]�3,6�� >��9�DjQ3��03����3�����Aɳ�iq���������U��	�[2�N/��?4�ǰ�x6=NW�t�Tș���U�׉���ܥ�}ǧ����j�'��]HK8��8]�>�aˎ�B\�|:P���E��,>�N�1���q"��ű��0��<L��6N�Z�8���t��j�'�nS��\����҃t��j�'��BX�h���y��=o�����#�<L��7NFo�O��,U[�8��?IΣTm��D�Ň�-����=��6�Ϧ��۩�뤘����k�F��q�_\��4�>��3��]'B^_`i��ly�r���D�}�q��dy0\.Ct�H�7��k��r��2C׉���F�������]'R��&���N�;.�	�N�rI���<�w���b�/�ܫ5������oX���vQ�.�����"���j���5:��.-�
N��W��Z�it"��W��Ő�eY����l���t��A��(z���8���
K���=���V}>�q�j,�e�lC�$��tUYp�\�!�Ŝ��	��:��+Lr��ϝC���Jn�K:��$8��Tm��D�m��F����y��mt�(��f|��O�i���q"��%��呇��Eǉ�G�gO��,U��8Q�F���̗�(U{�8�r�g1��ܳ��F��T4����L�q��r�[]7�OE���IQ}W�i���p�J"����7�'R��!�t�����ܭ2'=�=�ܭ'=74��>����o��:z�+��N^Mp�G�L��3x^�l<ʂ�l [�$�J���9��p&�����'6Y�hO�7���d��F!�'y=W�d���I] �<�Z;���CBl7���Sq�7�����3N.&N���,Q8y-.��=Y�pr9�#k���rbO���V'/�5IZ�Ir\�Xn7��r�HŲ���������n���q2��e���dq����8S�
�:y��K�-�6jV�矩���c^R&?�P���x9[C�*�|��i�76��l�jK'C��ˆ&����!���m���άm��xO�/��^m�>����ٴr�mx�� �(�%c�ޡ��q2d���ܝ����Y�P��8�[��M�b����l�@��;N��p��̄��HD�Mk��vǉd�h��H�ķ��c��ۙu�厓!;����Dm��d��g�i'Q[�8�[�dӑ�7ج��}v����N2�MSRm��d�n��t6�$j�'Cv��Lf�I�	u���N2��V[�d�)�حp�t�6�$�d:N�ɦ�D�J�ɐ��$�ٴ���8�[�d{w')�����8�l���4�$�W�vu'Cv��l:���vu'Cv��Lg�N���d�nu��l�I�MYp2b7;�t6MIug�٭����;l����,8�[�d.;�I�=Zp2`�;�t6�'Q7j�ɐ��'�Φ�$��L:%��I��i'I*%����F>_bYr��fZH���:�[md�C����'̈Y�c�p��C�v�g>�δ�d��̭2�L{HV�X'}s��L7��U,�I��j �ͬ��e8際�c�X�i ��d8�[i8�L��:I����U<&�-+�Nz�v�n��C� �I�ܪ�ʹrd��Y�4���t3�Y�`^?�\��/�-!��ƶ�v�c�}��,f`n���}ò�QT+�`��}c�:ӾQT�I����ʹo��u�77�ƶ[K�c�}�������7��Y�(*�kn���f��E�`��͍�o�}�������7f�����r�Nz�f��߮�W�i�(*��Ain��f�7��9��Ain��fO�2q�7���ts�f��8�[}c�yw� �7��CN����l׍��־@�2q�%���tr�d��8�[e㗓�1�\�'Y� Nb~|��.�?�7&ތ�+���ЛD��)��:G��ț��c)Z� N8����O;�5w��~u$j�1���95̛M5gbV�N��|��P���:��	fk�Y� ��W=�����͖�U�I�l�05������l[g�x���~���ͤ��ȥY&�4�*���(G͎��
B+�P�]c���i�*m?ۅc���r��s��7��w������>�-�֙�P92���7��i� �� sP�[}c���P92���76�N:hf}T��Aan���f���rdJs+��i� �� sP�[}c�X� �� s���}c���P92���7��i� �� sP�[}c�q��f�7��A���vߘn�}C�z'}s�o�3�����S9�d�-�����b��T[�'�i�p*�LA���%dx��&&=�*�4�n��?�`���@��������璜(Ye ޕ�r�L�*�4�#JV	���yy�%;�|�q� �o%d�xc�ˑ-!�;���zd�dxk�έ�������zpq6l�U��iv������]� MS��Xeޚf�x�WK��b}xk�q.�r��Yf�t��f�}��}����8Rw��O�!t�@�ʜ=�*�|��_�n1i�i�P���ɐ���ɳO��Y�����۷o��/�       i      x������ � �      h      x������ � �      g      x������ � �      f      x������ � �      l      x���Ǒ&���)�S���������،Vf3����(jg��h!6ZmM5�uHv��D�Gde�2#��/�Y.Gیʪ�J�����S.�Tl�?6r����W�~��Ӈ��W�~�z���e��͇������ՓWW��}�:�pu /������;{��F������|@���_��i���Wv����J.e"��N&k�|D�GTl׸�P��y��g�����_�����Di6�!'d�����͇�K��k��z�?u?�^x�8���jC��������~��:�ς��h���>�'��o�7�	���b��{����m �'�\�p}_�dq����^������1����j�����p#�	?�������W߃�E�>@i�qc�� �Ϝ�M��9�g�7�����4@�����H����w�����)�����s��)<����x/]���7��&���To�5�N|E^�t#����gOGPw��&�������������޼��b���N�?��#6��_���oh�C�
�o
/ڟ��P�M�i{sN(��8!�0N�\r��?gp?Bl~�}D��Ə����R��2�?� ��j��J>��ܨݰ��HnC�6ޔ}�^�Ln�VApjIpN���>ٿ/�#���no�-����s'5�&Vj쮤F9cRZ���Nj��Ev�%���~��Ϩ�)ʆ89$f;[�Z:��P�6���V�8A�>:F��-l�װ���k����G9�P]���ׄ��hR�@�f��s�e�|��#�|��x�䯀|�6�g<�����x��{��*�&8���Ȝ�����)��Hit;á�7,܆=������-{��O�'���,���t3�"Tj��#�B��Ǆ��@7��?��S�1��3�i�B+H�Dތ*�1Xc�Ӕ_��,]�7C�FNNt���iD&r�������V �����fp�8�vQ"��VD�e����	�=H6�6/��9���ჴ~0߀���ep���W�{{�"]��pWC�&�[Z��N6%4���&����!�D���g��`�7��#���uډ�5�N����N�Npe�<Ω�*���2n���V��訦�⤣�ۋ�{�|�����:ZX���X	D��)[��韃�_���1��x��������:C3������� �`�M/I���V/Ԃ�0�yz*D��.1��V|/�~���M��A�|��BXs����ƶ������;1���	w� t��� ��K���=�����5�.�uj��Ҧ!gW��	
^UC�kp�ݬ	a�GADMA8<Lݠ R?d� �0� ��;[Li������i�,��
����bN!�*(�bm��5�
lǻ�y:s������c�������M��O$J�7V�3���f�;1����-�9�s��u���G��F�G�k���w�贃ANX������&��k
�"|�=���`v��?�E�K���i=,I=8��X�F׊�-|���E)�H�~�-�fl�8/}�ԊS�#��r��|R�w%�QhB-u5� �/���u@	Iu�@<�ȑ�k�q����w��Nu�����mrp������Kv��B�YĆ�n̥a1�k?�W�	�e���HJU53 �y�%��*�;���7!�^.���B�����(<3�O]=P�VK�c�=�V��!]�LW��;��D#<V
y�\)>.�ێ�pv�α������Up�	�+f��/��ؚ����J2Q��` m�TJm���Q`S���������r�3�҆�2�T�RO��Ƶ�{���;c`�56����?�OB��+*�lQf��6=N͹�&���P�DT4=b�)�#\����ae��ˢd���x�4����~W����[�"��R�\Ԩ>��"c�-�D�RWpBa���"�����0E���[H���e���ʸ�k�j��L��ֺ荺U��@o��m]o^���cuIc� ��Rc�F<���+[�Ec�&���!ӵ�/��]���Հ*V��/C���#�I���O�J6���1t�Ɵ�;�n�FY�;Ö<ۧX#�p�ا�1�z�}��7p�E�Pm�w�I�s����!I+��0"��zGM�[g�ᣪ�0}b�V�2L3g�����;9���t�$�Nu�6�üp5+��u��������l��������O��������@W�gSkT�������5ɗ���j�Lѹ��&�6
��!E��![��5�
��?ob[��s%i�_���`�\9Sn9�����W���pE���j�l~�ֈi[s���:�cW�{�j"h�V�>[�%נ�>D�Է�v��o_��)��(��:�G� >��g�p��N1KJ7�jڀϣK̺K���(f�r1�8�.��Z�#I�e�͟f��8M���~��O,��	FMi�;c�Y��_���{�lm�'�r���9Ϫ��ʠ�"�'1,����վuH1:V%����Q�uWӐ�Y�@$]�|ke�k��yNI*�7���4��s�ꍳ�o@��C�,du�\�˗p���\��*Ofs������I�C����Z�\���4��`nN���.ݺ`�~��yv4x�nN�b����-Η�ג_9�r�f�J}`Â��g��j��5Hל�L�-|1�ϛxhB# ӋӆG�^7�|�(;�����ϝ�s���}����&M Q?��}������R@nJ�)Œ�0k
Td
t��,_s�ek��y����N�x��LRt+cu����@�!��&�{|���`�|�D��ѡ|ذ��1�E�I�+vW��jDF��e�� B?��0�@�]�?^ ��p��XT�z� �"6`��Q�A/����^¯�#�ekQ��2l�*v���p�n������#�<䙊��+���Z^K�"n��r�|���"�&.�"�9B<�!7�}Ev0��\�UF=���[�"��WӘ�����y8�LA��lH���~��VT��Z������&�H%����o���p��V�:V�p̖EZ\�g�(���S�*0,�0���NX�v[�fU	�RR,���|N$E5��v���N�)4��k�����>ca�WK����oC���q?Cz�h�S%�!S��`Z�hr�$�`߃&~�+uV��
T����qgQ���+OY��W+v17��Cq�K����V�<��|���,
xH���L��Э�9A�d�~�ј��e��k��c��/м��e�B���|���ލu؂f1�k�0�=��tкp�I��Z%xAP�l���5�>����Q+Z�ʙ�~� ��`'ގ��R���!�eY�y�V/jgX�.�0��ab�B+�����=�=	��W���v�J� M�\�&З�h��J���+��!��\tr���v�^���+�ͼ���F3U0*B5��G1�Vt'צAC&�Mv5
kx]]���u�x7�B�%u>fk���z�5 ��?~Mz�t��(�X	{c;�r�2(
�q[����֐|�^�?��>�N}0�3ۆ/�
t�x�[��_��ɘ��g�����wI���O-�u�T?oƪp2�sa���x�ѐ|�b���4�ek5���$���ۑ��u���c��AM�Y��b��y�ej.�t�4�?��T9�ר*�hk��}��;M�&�_�ŐX���H<�D	ʠ�&<�0�~5��"�I��H�>�*�J ����镖;�V0=隋W23SZ+|1�ϛ1=K�N|a.�~�+plɵr8��~��e���j{�7H���bH�� ee�%2_��@TZ+|jD�UgE�y��K)?	?�o!��5J���i���q�Z��CJ\���_�|�Cm�*"�����v�H�Z��J���;�q�K��z���'�DE`�=Hŕ�E�*p�a��5*)%:ָ�)�slY�)Q����5k)�5��I�7���}��p����Yn��b��x���h6�Q|���Dc�LSp��b4�X��l��w�I�{� ����    ��z	oS؉�ôB�y��p�NA�]١��=�t%]Ct��-|^�;H��fB�K	�3o`�Ӕ�]w,V��|����I�&�eݾ%����U`��ˌy�T���PC����!����dg�j�kx]��[Lu
I�Ou���"��O E�~�H/�?�Έ�ÇF_q9�(����j�e{�O�WU,D�b�P��DM�S:�+k%�"�ϛ�;R^��9��?�p��M�V�0�'�m[�5Cs�▌�R��x�����(����� �!��x�e^�����-���ˤ�?
1C���ǗVM�l�D�.5Yj��Q�IKj�~����D�!e�l�)6>ζCߡ:�:˭=:A���lT����r�~F���p�JF8^x;̀��u��F%�Q����3)��:�����!Г��!��
�R��4�],��F��3�͈Q��-��۲��A�:l�uSNJ���%RӰF�W���9�FB�<Ws}�v� �����jA2J��v:�������rH� X5��@���J��Ac�Z��|���^)���r�����<\�<�_y<�Y\�{�_�ٖt���*(�:myJ&�CMSe���������e�2[{��KEa��hzP%M��X���s�̗�&���᷾y�����P��Ò�@�XE� F���� C呆Բ#�cm�qp:#� ����Ȗ�9	���R��+|^�;�{��QI��b�p�-DyT.��<�yN��
��Jds?묌1SE�:ks(l�r�ع8���k�O��8|�ŨYCDa�!�֜7��w����NtF'�*����3nc��2!v�@G?��c�f�������+[�5��M<���n�}q�ׁާW����gk~����Z�;��i:�D)U�*��(~�������jR5=�l@�Mu�YMY`����y�,e�E$��Z����;1�C�8���I�_l&lp/�~?���<��|f���B_�����G7-�����DGY�kw:2�rU�|6����
�W��޺���h������,�g�30_n�b���\uʉկ�w���G`�������6����↴ͅ��9�jUd�d�s��4���k�ܰ�sn��e��K�^�Zf��������$������b����^���)+�HF�	|�X�9�˫�K{�8��Ff{��x�MI�)��� ��lN���?,{��J~&~
5ߒ�l-�"yu��5���R̷ײd3���ƞˢ���N԰�����,�Q^s�#���yS���J���D5�f�'㘯J|rǼs�7-tZ/b<�B=��,ۀ�<��;��eٍ�=�.���Ĝ�*D�	('�3d���.j���s�X�v�ܿ<�[�N����2�%i3��-��: #���9qO�x:��\��0���(!kJ3���E6]�k�R��yz���4q4n�Ӧlˇ�Ijk+z��A��b�݁�k:3�\]/�B�S5S���]��TL���Lz˚���*)����!M��Q�d�L��T��<�8Tמ�*H�vK5��qHbx5sdÄ��!���\c���@<�I�|�Ҷ5^���w��N'>%�V���c�0���s��pZ�t�%�.�
m��QV�[paD�k�g�O����<�F��H�Ҽ��˻��lF�^V�<Q�6�2��$ɭ#�nF��q<��S�����o���f�M��c�U�EJ.)7���VM�����	2�ͪ��fUo&���$_���{뒗�,����i5�Y7�)GR���o��s���fᒉ�&a��x���KI����7.�6BڶV|o�;�{���R�T��0��#y���|��}4�=wIn���O���ƥH�i�{�F��E.�[Z+�w'�+�
�s'���	t�+��g��qG�N��H�^�ʩ��Tb����TD�TfE���t��vh�����7s�H����շ��>���>ρ?�y0�Pe&�y�[)�sE���zB�')P&>�[�P�<���cr�3^�«I��Wa�Z�>t����&���T��˺cv��Ѵ����B�����7�;֍[ԝ����η*��	[a��q[D`E�Q��w�d_;t���п1��(7�8�P�WI�ͪ��h���;O ������T�W�T�L��+��VαU{T`�X��,Iz�l-� ���T���6��9�L�,k
(�ۨ�6A�l� ��7���e�7�wkwY-�z����'�))�z�T�y�9�3t���N���@��E3\ �=
���K�5�fE�(X���lK�X�|9N>��ϟC����XL9�����.�2�
<�Y�`0HtbW�~
���!4d�6��!����ekC:|�
�`^�T���o��?!�vP�K�8w4�}�4��M��WH1Z�cS1���&��Tx�'��s�����郼�N�F�����D�����SU�O	�ê0�)�G���a��	�	l9Oȏ�o��?����o{��uO\��6?3���׎�W��jQ0_t���D��7�	��/�i��H�Ҭ����2?�����{t�?�����-kALժo1��#���s:�YƋVľ_	���w��i� �%"��	��R4��"`&Z��ݰ�k�oL^)�#�����ɭ�'R��6�X�WSYXS���� 2!o���(�B�{��Vq��N*"-�~�~�p]5h<�������X��t�J5&T[�TqzC&Y�7�?|q��c}�O�cr�����<ԅ5
�qy���{��7��$�XڟT$��#v����F����Ap6�ݳ0��a>B�:>[N�#H9��u�[G��8���P��5�#�u�ϋ�������ũ8�<G0��	x�!�=<�&;o��,k���WI�t�i�}O�5㈯�&����5�/���$���������9f���P��i:�t�v�ׁ��mMR+LO�r�b�mу�f��M�����G�.�e:AW�d,�%���|��(��bmk���ÿWN��d��\64c�j�Kmz�rw"��� ${������31����Ԭ�9'K���?q4V��3�Z7�d�<��8Yw���R���iܢx4X�Z�P���0gЖ	,�C��#�
�p;�:�^.w���b��h��T7z��a�N�����
�7�zþT���M�̚��t�UC<�Z��QEm;)r�|�c��n���8�V��^���Q��u�l{ףS��V��@j��M���l����D����cC��v1]��xgV���IȐ_N����%#�s[����������ߪd
�nFa�y�z>��>!*B���O<�*�Eȩ|��*�H�Z����Ԇi�(ߧ�R�r���gYk���b������0��Gn.��x����|��w�uY�ޏ�S��r�h���j �br�Eb��N�5�5�5�j����9�U:5P��8;v���z��&��v��F�`��N��J8D�ʎ��1�]Q� f}�P7���e����KǗ��q�~�ׁ�����q�īu8��=,N�t�86���7/qf�f���Z�A���;LZ �Ex�v�-�T;�g2Z�)����*A��)���Q����{�c��<��/3H�s����"f��q�6�@u�<�W &�P���^�t-Q SP SP�)/�f1�Ԭ?��GA�o>\�9�?^l&�P��2� ��~�
*&��~A�1U�j��>�"�yUy��(z�ekk(O|l��u�D8���>�B��l#o�
�V��g�1���م����ۙd<h,�pK������P��E<l��t�J,�}�t;����kq2Bc�� �3q�"����)a�R���¿��M�NU��8�� ���)-=��M�b{���0^G��B�dP1ۏ���#��8�1;� ��]FD�3����2v�Pa�>jC��3�"��Km�����Y�q� �f�h!sE�+:��b��s.ʣm�:��8��f�����m�|��L�7}�>m�k�B��FՁj�U���D�z����y�;_=.sl� ΒY��D�S�����    ���������<�+���1 7o�z� ���␂���$
����<�P�;�������f>���}��	�p����N�'���J�u+�����U��Qk���{y��7u� ʔ �1T��mV�)V(7`��Cu#n���-���S�  ��V�:W�pXeqNɜ��s:����G�a�W�t-6,�k,Ց,���b0�ኟc�v���Ⳅ�*G%+����ʫ�n�+��(xG@)�_ݰ<������>�k{���}�y5�;�����	�y�1��,P���g�n@p'�F����cq���u�ϫӈ��\*F�a�7�=
���WX�+�;�	��u���EE�b잪��?�\zŢ�V�Y59�
�	VHN�zrb�2^H`oګ�@s�*�M�A��Mx���/2
7����aհ��
V+��G��G:��0$�Ï|>��@����=�g��H���Z�/�m�i݀9��*�u?]���"�!�T��H7�{��2-�M<�fF��I�_�P8j׏�l?�|�=�?#�0�Z��ȁ��QO�ܸ�0_6c䰢�:t�~���iv	�S�->�&�J��n�ų��p�R�f sE��U����X�kn���]����q��eP���K�o�l˟��#єj(�Ly�4�9M1;+
��k������WJ�0^9�C[L�kx�X��ᵛ�����S`sP�k�Dm��I���%$���I_�	��K�܄��)ˁ�:�}���������[��9��`�NV�z���q�En�������g�7h�F�9��j:oZ{� fxh�'�v��>����NF�a������>�STS�W�˩A5�ݛi�@�����[]��E�'�&s���L�q|��ۑ53NF�&6���}
��}2�WH�FIl�ӵXIh��$YC%�I�/�6�ν�v�@�r
P�K�����Ǹ�&]9��������U�a����0�B��zP�*]K�"���1b+�F$����8T�G��5�ӑmkLR��T��U{cd���9�]�0���KZe���ĠoeL{/ ��J��@Z����
�~����4�f+��>�&�	�غN�!W����Vc	�i�e�)���XLM���`M�!6�`��������j@ԑj�Z�f8�YAG
�"䊧��>a�n�6�Tq� 5S��C��M���[M�>I��A#�v�zmƝ�j���d�F�Elnzg'���"���Eq�T�k����|-�6`���Ѡ�vj���:�&�Ћ��g��ͯ�sc��A�_kSFomO���h}h&JU��BV�412G�t-֑Ǔ����5K��ԇ`:������ן�+0���:%+�N5�lp���ZG�u��pZ ��u��܌D83�e�:3Ax���?�m�@�K����í|��yF{�<�T�`$��ȡZ�?�&&�؝ٜ��C ��m�|	lB;/�`�ě��x�z\��P�ܐ�}��@U�I����b�i��~oU[BC��Ax��h0��3k�lm���^q��4��>kP��dN8^���é�z�s!�������x����xzӱ_Q��K����z@��)��t�t�:���}j�P���+�ų�!��,:8�lgGk���8�r�TV<����O�pV�N���>�]v~��M`@C�^ᐈ"	��%�D!a�Xd��%S���C��Hr�{H~?�l`U$���Y+���%�˛����%�|�
&��t��f�c9n~�N	��8���+IX!	q��II�{G}���g I�v+�������l�����2����=���צ�O�.}��.A�O��^3�(���v?�VM�|-�h��&`��@�50�����փ��5���7!�x���]E�)P❛���=X�:F��`yg��7��-�C�����|���4�D�Y%+[��$���fy"�'+|6�1��C�(��_�� �4J5n��B�]��i�z��V�
���h'k�.d�l��c������[�}7U��0}�=�}�
CX�TYMs�٢��N����d�� F7�!]�U �Gek�3��e�����N�<�p�~�+���+�ė�PIa9؄��S��'VC|��hg����/nF�b"e4y��O�3��l�)F�s�7�سN� u~r��u�;���i�dCw���dG�sWO�F��+�����h�J�ݓJΞ�.�g��X���q������F ^o��I��@��Bޞ���T�^�Qr�l�8��V£}5���A��~��|���2��i��B���bK����k�eI������E|`��@��	r9-I�o|WL�|Q��p�+Aa�r�JoWB���3���D]��Wʟ௛���[�|{x�Q6�/a���M��!�U��~A�j���A9^�*Dzu�r�I��5'w��#`g¤�����
�E�
�^��(%5Ny�S�4-M�<���	�:|���������}>�wi�=?���� �a2¼�z;����͐��I+=Og.۱CN��>Qx���a"�Z�O�4�|-ӻ�,l��%�2G�^����ݿq	�4w��g��@Ga���^�!���02����f��-��^`��%��|2)(=�_
I'P�2��b^�^r�;-�U�b�����`�c����k�����5�.��1�pJ���gԷ��_��N'�*{�s�'ϴW�
ISΨ�t�a<RΫ�����<�*r���\U�d<}��	�usUm:�#]�KO5��Y�d�KZɺ�!M���	���j��W��۲x��t-Q��e��_��;��pc�-��0��?g�E�z�3P`���n��O����~�tر-BV�M���Fy٪�ڐ�;I{Z���:|����mi�~?�Q�g���Xt�>I��_�+b�=_��go�H�-�V$^�ڋ���'��<� �����1jȧ�Efa�'����#V����$�����RRs@��S�4xT��5
���P|o��V$�8f��yM�������ʷ��#��"�u̫FU�xAͿ��U�������������\��!?c��;�$k޶Vѻ�{���u�J�L�d74�'Kj��iB!�M2�����T�,1{N��d�����W|�>\׭ä�tmrTdW�>�f�.h&�c0Yr-Ü.�˞%%�W�af���
5Z�ٙDs���t*�N'A1=��ںh����·	Ma����2\^cC����0���Q&g�m�|&���b�d�z���>\���O�	��խ�A(�j\��<C't"�f���Y���dl
ב���F_3�N���a��[ʒ�j-i��I��� �E�{2�Ξ��Q�VMjZ�1C��7EϊtD�ם}�VN�qB�k�Q�e!�5�nf~�!C;e�q�N��l�,��t.�D>�n��}bA�Y��6w�XMQz_�N6G�Wp:�Yi�����1~OS9۞�(
Hp��f� Q!��п���7�}ʢ���������1���F���v)�1.��;��ze�aZj�*(+^9P+���=@�0�П�!%q����^;=f�Td���	?	���hf�C��{����~'o�Q�8l7吣r�U.E�u2]���5�����1x���;x	*q���q�MF��LA���hΕ#G�g⼲o���������� ����D���$B�_���e�5�|9�?`y����C���@�؇����� �ۗ<QEU�:͠zǎ�!,f�ut��t��5]X˾c|�0�;��VPR~�w�Hv�X߃�}Ƀ���q�C7C�n+�BS76|��I+Ϊ��X3��˥������� [�J�U�L9�]�<�)�`���8��I�t���*�cN���U��Ԫ*���K7.�#��i֐���ׯ���k���/具S����NΙ$�@��6}k�����h��|�k0=r?�Kh,�ޱ�a��Ykf���tS\0]�V�>�֜��t�\����DI��AմeM�[����(5Ы�c�ʟ�I�|�w��O    b��¡C�~��Nf媟!�Sc���Ǎ�&՘����j}�u+��Fv�}�W!Ƀ�0�3*����B��>֚��m^^�)�$��>/:Pi\G��&R,�q��T�e }�̑O��ك�$�{����C���{��+'u�Eϼ�QϨ��<�������[�PXʥ���oD����ѡm���u��K�M�:�����?�Fg�w��I�Cy��'��^2V���ϫZ_����M���#m}��#��D��H�~��:%h������� +�7$�4����<�qSIH�
U��c1&����P������R�j�^oJ ����j8�Q����xհ�YɦQ�)�-b��|C:03��=�S����VT����`�X��f���
P
��Q׎@8��{1"�� ���\���	Y�Nmm�7�j�u,��ne�{�V�P/��\"ӽA;��:�+xnķi=�2\{or�����M]Ȫ��7�2���1�=2c?<�S:���=�m�w�����\V#NA�x�V�1C��Ȉ�r��Ͽ��Y�}�[���w�X"l:]D��z��m_m@�'$������|,ФX��n�L���D�lE(��k͎q���A����cf�c���.����[�ޚI�7�1�B���T�dK�7fR��CP�\����:��ۭ�
��5�}�F}�w縥kT���[�|oT�Q7����mF�vp����b"�o�T����������>���kVG�<}�jƷ�:����k��ҵ�.�/����{S홞��e4r�Qe�9����'��.�/�܁)���W;{a�BՇ3�ah/	�RD���Щ?M��a7|���1%<<��7IK?,]��]�d����u��i�H$�Y�2>�n�s�@z|1NHB���ws�q�<�ꝵZ��i8�đ�#c����-NN6�7�t�Zi�i-z���c�V0Q��2%Tn/8�cb5���}4�\�����KQ�hf�daME��D��ݤ��m��(Vw�u޹+��b�n�]b��"�Jʏ�v4�U1��9W�|0ѽ��-�p�e?S�X:屷�EҵGaSz)�����ڴ�ɝ�OehX�ZFU���p^_����`�֠O�N;��|tD.�$�5l���𥄦;����à�L	�8s���i�T[u���7��JM�����kS�+�*��E��bk�M�w���Z4�`�v����Z	8HӉ����Ū��/�A�L3�m�$��3ʙ�=�ig��k4����+?1y����;1�������TN̪)����
���k�G���f^Xc�m�g ��w��NrU�����F|�_��p#�fk�1�_y(�<[��
�g�I�)�\�
�p�g�B�qc'*�pX�}���x�ۧ*�ʍ�!������u���^�׸(�T?oZ�r*'��)����=J�X����zO��`�N@_����J9!Q�5�V��(=h�Hv�l��Q��"j �j�Dv�.�&��a[���WL��fH�|CZ,���Z�#�w�o�}Qa�m��B�[ѱ#��>��1�?75��?��d�ъ�Hi�5s;�q�+r�N{@��Z��վj&ҵ���KY	�V�H�^������H�0P:�����X�4`=��:����_��Ai�32:W�=j:�O5����х��7�+z�g~B���OWQ/��zQ��l 腰�D�6�6���m[	�8�I�DZ��?"}�$���P;A��8A�>)��3	_�S2�2�ὥ�:���>ҿ�F6�^:·}5�4*���
F���8 *`�֫#*��2��);�=���@�t"�އ~����I�.��Ąek�B�6����Z�#�{'&���e�w�е�_�7��5&6�aK#	cܪ��S�G��W�xHf6�m�xH��L{TJ13�^v�L!��pI�lx4P�����	;ׯ�(�?�+�A�U���=�x3N���Z�����W�����jus��Sk�-���?����j�T7�ACB�ϲ�G�P2�T�<��p�W���&[� ����6j?Sc�s�*zD�Af�0F,��v�}|�kB�uu
mp�iNڃ�p!WS�G�1	Rݜ�l)���S�����i­䉤��P2�k�Ӿ[�Mba��e��ځ�UgY�w�p���l�[��5� J2^��q�h�H��q�2m��ѯ�QwT�(R/%^���+V����}�S�ֶ�,Оw���+N������[n�UݾL���y�|�se���jBfu!gk������w��N!��=g�-I3�zvh���mb�C��V���@�k��U=��V�Q9��Sc�;�@�HY@��t�6|��6&�^Md4]�!^�ޫH�FPJ�&#u�uEY �WE���D:��(���F�� ����G0�hN�����ߩI��
a�L��oB!a�
�rA���I'�]Cy"�Y�W��i�d
Ь/��J�{�Kq^����pO�⫩�?;A�4�&7� i
Q˧T;x�$�Ƭ�e L�,������F�����s��W�J�}A�%������Xs*��#�m�J��-�N��F% :�$�T�'`�e4��*�>P�6�Y�(����H�|��wBI���|Q��f�������8�׵9�֜��J���E�i���!xd�[P��(����@kZ�"�Es���6���ד	��h_}��GF�*���7��l�+�>kj��rۇV�q���,\.�B�#�W���mCT:��i��=����(pgc�
����^+̂�9��G+0�P���k�pM�u�HRs�x�SK�~��f����8�v���q�H�Q|�`��a�I�F=��!�CXPaZ��q-ED*k�P��)��ĤH��L
<��`�O���)�T^!��t�a��>E����%V���4 9W��~��oFr�Gr!J�/M)ڊeV�r�Za+�T!¤YC�4��}�3r������cO�>D[�)k���!^E�����4��"��b�?��j�%q���| �M�х�ԭ�p(��Ug��/S`�Hצ�_^�F����&¸�B�e�NF�)�Fl������q�L!}F�d3���ZE�YW\�� ��sJE{��9��#&��(�e̳�Q�}"�^꽪Q�/� ��L>�>��%M����*�8��r��,���u�vE#z�$M8R��[���)~!!�%�8<�1y����x��<>���P�?��'ġ}�6�
�s�A�	8%c")7���>NȜ�����|C�MIE^z4�{�\1��َ�1�m��_b-�jM�͎������u)R<�7�~@\A�6�T��X���#�ֵ�W�5�(��9�>|Q�>hwL%�O����Ki:2sڳ�!�Z]P\�B�.�����=p����q�&��o')^lp���:�۪͐��i^�U�����L��o�s �;ы
0�
�ҽ��M�>��W�K�
��y�3�%�kx����`�����&{������Q��Xg]��jX�%�PQ��;k<�xb{F�6�
�,\��ۮf3�X�ѓ:
�-�7�U?��B�`���#9CD��	w�1�A���_Y)3>̇�}Λ�`��Zv�,r.aH�KY:Ce�kr���ʒ%�C!�4��||�0���G�w�)���;�W �X2��}Tq��S!�o���H{`a�.���¾�.�R>T'�)��7�`3�p�8�H?�@Q�����T�Oᵰ|���+	�N�m`�����i�}vΛ�|���?*�/H�(1��Qa@;�̋})��y��,��nc�}��D�8d�^�ۀ���o�=A%�T��L����Á�j�C�^�.UY�D+
�-�EQ��+��S�6��³c#z`b�υ!��h� ?��6bY���$�P��q���ل��:�/ˮm�:��瓶��,)��H�-�qY��us5���*�R�]��I�,�e��hR=����5R�H����7��|�
���ij��p��Q����C��3D�MP~I��P�ֈ��ʅ?J�dJQ׊�G>�)�n�(�ך��7��    ������ �@�\M��bn~�NZ@^ex�lm����5J�&ǜ?xƓ�l�9�ka<5R�^��3��Qz�U�.ʿ}���R���/�j�?�4 r�p�8 G���@�!IL>S.Mٜ�X}-M0|���K߻�m6��;�P�����+���<xP̃P�C���g3�Z�8��6Q5j`��$a��LS*�L�D;��k�L�6��~���^��I_O�عJ �*F�4e}�V��KB��U��r�Qy(�=�8C>̛ekSً8[¤�6�?�Ƈ���^����C��ܓx�t@�6���������53!#a�WQ�79�,�`��� ��W�e�,"�$���Kk2+�;ڤ"��m����-�H��|�W!.8�!d��p���-��������fSف�d��i�Ay��x���T�s�)���f�h#�a�>�6�Ǡ.6�0���ä'���E���H:� �T]��N��~�Uo���s��<�<�<��{���Q�H�
�g�q��0M�w�M��D�v�l-�F*�]b�|�P��lwW8���1S1νvD�Pv0���S�(��8�oṣ0Ԧ6����Em�P���E����)؀A��~ʮ�Н�M� �P��Ջ`+���8�"0�lK�4]��/:&�t��JQmK�yb8%�>��}�&�-�,�ҕ�x�a嘏vLfY]�%]��%�%̻ �>���k��iHa<�u&��j��Ԫ�4k�Q���K����.	����I��((��秢6�Q�C��K.��5,Aek1j�.s��9	H|�8��0���|{S�)�1�wt��:0����i�w�Q����Zl�W�����9M �c	�U�?�5���bܛR�� �U�CB�t��@�}��u�s�H@���x����a~�7M[�b�p�ur�L�9B��6%\��{U��v3OzʛG�z]�3��]��1d�"�f^�*�gp�,���'T��ت����B�w�|'@U8v�G,�����K�8��
k1�16��r�r���4�>���G�Z�7P�@o��qf"A~���v�([+?��>j��M}�&��A섛�Z�]MC�4Td�2�L|	�%"�*6�O?{���E�&y]�3eJ�;λ�� ����Hκ�c��--���F��MҦ�1�&\-XK>be<��;�Uq�:N������Il�6����?���ߛ�&�N��G����fތɽ��C6�3�C����Ds�� B�:��Q�'�����(�k���bQ�f�<l��#=v]%�t�����s�`7�|s�,��j��I[Z��陠�-�6��`ݰ?��k�#8���X1�2�[��ӈ�[����D��y����N@��%%�ێ�at�_� �JQ�[a9?���wL;�d5���;����d5�uL����t����,��ծ�!BPA&��o�a�t��:��@���֠r��]���m��N�w�%I'�g�Z����g�i���x�s�M�5��f�h� �Ն�b/�$5�`��:��"������:����t�yrW��H懖�ĐA�$�W^��@��i2����cl>o+t�fՍwA�O���$;l<�_�|��U�C>�L: �cy瑝��t[�"��N�4��<�3�İ�{�R�/��|�ꪑ��dm*]Sx�R��Ed�����-�
y��!�=�J7�ǝ����މ��>�P�_|N����w��5%]�k�t��{
2������Jz������t>��P�
�٩��N�z"�[�TA0��q����٬�$���#��8D¥��_��׾?�Л�D�\ڙ�@!��]�R+V�SuF��}�o��(��9�<�1w��G��c��[LǦ��S��n��ZF#|�C�VCi�p����ۆ�l�
:��#պ��T�(i�Ꮶ�����l��d��E��	��	����F1�+B���JFMw8x�^�JBk<x�.�wJ ;�()��"��~\�M��L���!���G5i��]���W�7>���׿��'�]B��n��t��=��wbVTT!H.�А91��+3�X�6�U�Z��$f�Ġ:%�8������@�n~؎�tr����C��_Ez	:|�N��n�wL(w�?�V ��:�f7�u�b�@��
1�
����ߏ��ð��H�����rG�pq�aՄ4��d�.���VQ�h�G/�#8�����bV��@TM�j�	"kxa'�k߫�u�N�q�!u^�ّ�VD 6�ɭh:'�"�P|)�[�kT�t��{�s�f8#j*�cR��`��0���Ti��D�f�>b3\�%
������u=(I�#��[㭁Mxv�vt�8���=7�o21$[o����q�vEK������/`P,ZT�=�da�,�Ӹ��D��|����?�#�������b�1��P�&�н�F�Ưlm*�J���M9�Gc�{��G:��I�{�X�����'���C��s��,gUW�BOGQ���5��$�l-�vq_úN^�N"D��6s�(���nJtS�i��_�(�����m����榩!?�N��W���!����N���%[fH�C��nW� �U\o3HQ�B�O�R�B��>dz)+��&_���>��Cѹ��|�!n��)�]��p�_S.�i<]��^��՚YM�b/ ��yq�O��DB�i�ٝARW�9C�<Z��;ʘ+��������&���<�Ƥ�p�$똥���AqGM�Oۍp��9�ÆrL�r��)t��!@di�����K��'�	l�H���rԹ����	nS��냸wʙ�*n�:�#X�8���Z�a/��O!A�8"
��-k�۾��a��>��g�0wOu�'L�$������wۿ}��vT׻2�6�������;�Owpu߹V����(�a�Y����;>��q�3j���ãs�E��Iq�'��$�n�˵w�ݠdu�om�Hc:��}E���Jg"�v&�V��8L��غ�{������q��L���>����<�s�)8�O��$�1 �&��z�2��,���
�<]��z�Е�a���O�ui��5����>��n��T�<p��9ϊMa�F�6�ں�J/NGY���&P!b�L/�C1d�u�a^#���A��L��=�'1�;�.@㳵XbE��2�$��s�ۺL�^��������E��8�D/�˄�,�Ü���9���@��ёy"�^���h��|[�"�Ԅ>v�1�Ŀ}��b	�k�>]���E)�d�h߱��^!�*"�Q�n�մ�� *?B�U��*�sQVm@�]�������H�A7�{P00��硜7
��6c8�V{@j�]�˸����)�>7����4T �C��K{���{����;��I=�[ 潪�&�9�YUŜ�����5��~�=��'�b�E	�+�Do'���%�"&U�W��ٍP�Sy%kSy��+�}�ϡ����mzʳ_@��=#��������0��3\���Z��v��&�FZ�p�o�Z����]�}��L���(۴�D�7�o��lV'�B��X�w��x�d��	HNt@"GHv����u��ɨ�(����ɸ��Z��p
��'ߴ�$O��z[��{[�N|x9N�A���i�v��
]�ͫ]�@�>���v���'����q=�r�#�=+w!��:�0���1��Q ��
��fn�BA^�ns
gވB��	�E�C�6��n���M�!�ש`����l�4?�K�\���`�_
���<��:|o�`o�	�����Y}���ď�	�����6@&�4��oc�^?z�m��Y��I9�ٍHgk��Q�ՐU[w�t8��^�`����ƹ{�9$tx���>�>�?�U�YG�=���}���ꡰ��w�a��L����s_�Ab�}�H�+�}r�+	���O��v�'�h���q������UJ��k|�zG�+�i^E��P;�:H뺳P�νlm"�Z��ht9�`)�kH"�	���Y=�"�1Eb*��IA�}��[/��n���3�*4~]���vz:O&8�    ���ē��gG���7�u]�$���t���a�~앷n;���a@@�=~[߽��MyZ�=�y}l�\)�2�N}"�{�I�n�ݑ{R��<�=�A�!ߡ�����WUG*b���\;ȽX4�&k����Ҟ������f�/^	��ds��7Q̅��HI�Ɍ:�V����bZs���rg���E ��Q�O�>zO<(�W��v����߅�:\���N�S���������^�˦dkS��Z��.K� T���w, ���L�َ�4���!��fX��9&��u=���A��-��>GI���>W��ЪE�iZq�?;8����-�	+��Tΐl^�~3�E=0I��8��F	/Ոw�j�h�� ��+p�N������:s��Ni^�[�k�U�ڠ7�pZ�="�%��~�'!�}9��@G�����ֱC��|�c�zn�=A�Y�LR�����ar[1ekS)�
]�v��'A�X0x
��V*��10��,��PMM}�M�`�TFp)��퐫��g7=�	#?�� S���Q��gk�W+�i�
�7H�����u_ `�櫱BxR���l��m��\�4��@��ލ�{�`��8����H`��(�ӸQ���XU���wO�u�E�BJ��aV�����,���V�<>o%Tl����ek!u��X.�C�VU��I�0����@9}ww���ek� 4�2�S�f�h����OC<��hsOG���F�ƃ�6051k&���u�^'e�{9(\S)�t-�
������c����b9���*a�_k�����8p%i��
ħ:бN��o�%�ԣp�lQH��Q� t���C�	�xJ���Y�=��Wm�	�? �gȂx����e(���/�$���������#�N�7���\%�y��';д�oV����֏w�xmj�y�ޡ��I���7p�C������|�T;�
ݑ� ��u8ߺ���<t�o����ϐg�`��߹��a+9��k"k�a뤶{��ZR돁���"��μ����O:gs"�����|먲�PmAню!�+�$�#5[�E��^�&}�6�v�܊�n�P�����p���;4�h�k:��=Q����s�Q��F5�6p�������t���'�m3'hZ��힐��ۀ���M����9���!N&���ҋצ��W��k��?���C�qI��=��)N*�zW�y~['D"�Π�O�Kp߽��|���gkS�UHȻ��^��|�!��=���~�]�m9���Y�����t���;�/hv����<���>���$�݁�k	R������w� ��0��ALje0�Y������W���<�����O�!�ܗ���<��/���J�IC�Y����8z92w$?ꍮxv�=���"+�7]�ŗ��;X�I�ߢ���M�G�f&����`�s(Z�
<���l�dl�Ӓ����,l�"�ev)�y.]�kV���Ɯ�աJʪ�4K#�<��x��� }��cM�%aMJ�ٖ���̼6c���h�.��J�B����3D4hO��A��V�|B+�|B_�
_�9��Z���[>�t��iKn5�9 T#�Y�����TԵG���+G4&b?�X��z�k1�x${r�{�ư[�[բ�=�A�Ӧ� ��Z,����S�L��dܼ����ӛ�8消c����K�1u����Ur�ޣ}-Aw�F/��R�YA�Q饻U���PkD�1�:��_�"Ր�M�W��Օ�%kD{��]����3��`߼G�*����e*����VQ+�"���ݗ���� VU��pzN���|����-�j>~�7�ϙ�&��
Լc ��~�z]HQ�j�b�$
;�^��>��{�fu1Ӻ�OB�X�����:ʵR�b��OS��H՚"��G�<jR>�z:a���C�vw�ӕ�9C����7^.��*jD��d;��$��	�M�����v[S;�<{n���*�
������0+P��F��^Y�uh�"��u�$>�j�Y/U���EKz#EP�]x�@H2_���(��Ea�ڞ�9(q��n:�S��]bM��!�6gw�,����rh���\��)�$HL��
�VgN���u,^_�΋qюު�d�bt,O�oy�e�K��/����ŏHѠ����ƕ���)Nu��7e;y���bn��n�O(��UV�H�*C�nu;��fU23߇Ҝ�\oU��40�F�
P팕��� �
S(=�FsR �l3��*e����!�=�����|V��t����>���|?Q;s���b�ʏ�v3�|��+�;����ی�	w�s��5d/�����pŉ�e���\��9x�}���7��\s5��:�KQ��^~{!g
q��������ߠES��e��2�3���S�Yٻ}�]��ܟ෸Q������wL�$�$p}`��W�+9�+	ܘv��e���H��Ͷ1Ӌ���J��'�#�v����`�&��\/�\ޕD-��,j�c0��-�y�����l�ҿ������R��Rv���U�'j�E����򮵡Ǒ���\��n0�)����	����Au�1��rd��,�����ՕY��<k�ۃ:����y�Fi�}w���}'ؽ�L'��jIx�T�{�,�JN�:"�1[;�מ@{�,#FB�<��'��Gf+آ�ְC��?�>��S?�ֿ�In�I�%����r���7�Y����:�x)��R�^Y��|Gv���q�R4}m����0�����.����USmL�eG�Ӊp��$BW�W����M�'BMG����~�.���7�L�x�_�Xބ�/6H2��E�5��TUC��Y!^��:W��@:6d���ي��`�SDnI���Y�[)�)ZgsG�����P�$�����D�E���`�Mx��&G.����cQ'w0H���㍋��S�y 88�#�b�3]�Vk��u�3�IX��E�i$�NV����HǰA�(>�� �M��W�����'r�v2%;��x��$�����2���L[��𽓂'l����U�a���·�h�OX�&�6O���(�L��M#�f#z��u�I^BqN��}���?�����Eo~mݯ?����?mƩ?Q?
���;�f"��RX�WO���aO�@M��ifէ{�=t�,��~��v�&�r�^���-)W�∟����ۼ��"la�s�w��V����f��ނL�ME�9i��H��rrGJ�FhUf�M�}K�/nlIY0p{:����q�g�5gi.���O�p�J�Jҧ=�}!4�{��jM<=��gk�}�<���n6Jw$,CԌ.^�e{�˿2��l��.�ҔW�ip���|�lnQ�j�&+H��ᄐ�4[s"�����m�-5�������NF�U[��<�Q=�Z��T�m�xg��LuJg�A'�eN��m,��,{�6x��7}�֍ގM߆h6��o����>KG��[�tdc�aв
J)v����,�[�����Sض��gO���M�+T��[��^| �b�3A瑬=�+�1��o^�9f͐a�`�=���d��l�΍b9g�2*�O��b[�u�3�}�g���j\ŧ�<�;�� ���ɖ��ކ�"�}"V{��h�)�8^��X^��	�w�|�6�O�z��@v8�����LK�tox���P�D�΍:�Q�ϤHE.E*jR�_)
�^f����F��C�A ���{�'�����&���q���di��4�W0���Hn6�H���с9
 �#??�;����Ez��f�ZD�t�Hf�8�C!�]�[F��h.��%e!�5�f�'�$�p�{]\WAg�4^�B�r���O7l��c�{X�P�>ˍ}8 P��^�t0r�x�ޔL.E�'k@,��� d���.�I���e8/¾�Y��F@D)���jjN��r��h�;#�$�ʆ�3�tEG��"�]�8: (��b��75 ��0�Q�N7���H9�^���EP��[Jk䮀�Հy�8ޢ���X��tG�-�[h�\�c�t-�\���    ��ժc��A����;���}��$�~*/��#8v\�Р�<�m�V�Ҫ���$͕/�v�׭H�)�.�@C}�/�4u��mh����<����A��~BO� Dqf��xҗ��o�Q߂��d��Fy;���n;�6�N���{�z�ZӍ��>���K�qv���ق��}|A����b&۸�A��s�Y�2��AX�%���F���ͦ�S���	�ns.���#�&]�ˤ�M��6v����L{Ѝ�	Ln�>?GS���9��N�8�,_p�	���,���sG�lIʺ e]�r����T����[�O���l�"�������WN�8�q�_��J��6�$���v����#��"�oy�=��%pų���9�_q��%'�=�
óiw���K����C_�W�{+a�lG��-��ܖ��>�S�>q�e�JKkl�I��}����F�LLk�4'��X9�Q:f�AV�lz��(��rt{�h����\*b��"��!{M��\��}!���a|�l-a���Uw�Sy��× ѽiT���� �X=��,ԯ�vc���QМ�_�_��Y�=���l��Z,�ҥ�L�eDA�	
��,��̚�w��E��X:�/`�[�%��oEDT�Ұ"~N�; ��3[o�,k�z�<Z�z��d빽Z�k��]�#��<�O�o�+�}�.�����١�~�\-x�[��ͅy/����:P�.�?���������P�x����\N��axb�{V3���i�H��.�d9�֦£�W�5%����t˖�sH�l���GwLݽ�S	�H�A}h�7�%����Cx�g�$)�$�FIf��d-�d)�j�!iML˥L
����XO�,�l}�-��-`��-F�ؖ���ܡ݃3Yv�i;
E-{�I�r6YKD]�`C�9�0�~:�΂�ud���* �#e�������P1�WP���N��e��/�
0[���C~)�)��^�����H��\��)�t{Em�~�B���	#������t���}�Ǩd���&��<H�����>J��lm�j$�)�ٝ�֢y�"���أ��Ya"��m��p���x��ZQ����aB�*�����ȸ:�J��H�~o��\�x�u�^o`J�)΃�6�S�pTC;�i�'Pn�X�ƙe��GB�d�g�i���5�6v5����/��v��|N\F�,���"S����_�^��E�����ބ���X��T�-���ų�@p�z6G'}��}�r�F-1r/ٟB�\��Nك�X�}�*����Z�Z���d/ӶS���D�RJU�� ?C|�k�m��� r~���9f�����&�~u����w�p�D��q@J�>���%H��lm����Dn����o_�N
��uc�I�;Lݺ�␋˄ �|��^=a�M���
2^�
R^�#~;Π��w��yS�{Ƈ���0K�So�;u�37L̏j���d{�D5==���k���W��ڧ�\z<�rMs�a�x�/�昗�:�=�6yE��A����Ԧ`=f5��lm*�2H�m��Y��A�g�k�g�*<x���r��s�Fʾu�ctL�G�rl/�&G�i;��|��=ܧ>��C=��h#����6k���+$Gݬ%^L필�����ă���<
�8 �	%Ȧ|��q��hL�)nu�)i����K3��OvYK��Agk�cU�w�ۑ�m��+����Dn�����
�_&����X���y_���f%�6�q�v�Ĳ�2'y�H,A���a�QTL�g?�A����і��)v Y�։H��|ҟ�%��e!Y�B���E/�yF��ZG���θ�)�k0�g>4F��!I�OR��^�Eh��2�b�Q��w9m�c���K{��Y���_�
�a�;I�ej�24���5��$��{'E���Lf�C��!���@�t���Ma���"NW��#�x���J �S����O�_z���O�г|�������D+z�=��A�OL�=��3huK���f'm�_��|,טx����0/3_�uf�1t�<A�A=���F�`O���/6 ������2ÇڡAv��@�P3
�F�����:j�n�ܧ���������tK�������8$�=�T���h�t�: p+���x��A��`y�	<�������^zYɝ���LV��롆����N�����\
�u%ǗL}��JR�Z�f���t*�Ә*clH;������!���*���:��N�0A���b�B|�6~����x^X3Y!~`�|�=��ڐ��g�鴼����c?����߻Ɋ4�����7�h« Xee}VX�������T&�*?Y���_5�@�xt�T��P>����2���@��;�U��e��ܜ���,�i�A�;d!���!��������}0%s�y+62�z>�vb�{�\�ZZ��֦b����C;$�֓���q *���շ,%s�kᮅ�)^KNzG�G�J
�%T�F���T���
&9D�^�iL`���W�}@0y,��8W;u�߁t/	�D�gg�ﱴV��=��RJ�nm˖63�Ӵi/���"{�mB��kx�(T����z~f7k�䎈y�im��V���nO20�-T*NU�L��)g�;g��q�����p�k2�ʬ��)ס��j��b����=�&�lm*AUx%8� ������kp�^����_=��5� �� �{cpDP0Q��� P�];t-�����?";��6
V���p�Z�K���`�w�����>��g�MjD�=6��S��Y� Pz�\� sV<.5����M�&����@_�*��u Q�f�x\���-��D���b�MUljS�ĳ��N��B� cF�R������3 �`�L�B#�v:��l,�M��!�9<>�|43@�`�����z�6%�Ӵ����v��ӵ�M:})[�nd]��(=27�d.��`��6���;~�y0Vڻ�
gr�A#��X��aq��hW*&e%�J֦�2(�2����'sP߇*��
��I����� /=u�w`
�}��R��(�g�����c#�s��G�X��A���h	۬���]V��:m��
]՞H�l�+d
���KSZ O�f�w�R�e��WcP^{e��A��!dR�reNCZ�X�o�\<=<��W #qD5=�ݷ�G<Įw���z3pw���G��BU����V��ś"�x���ڣ�1�^��·�f��{y�MI>� �s-��R�$��K*%0|�� AI2�p�}YC�����fߙ�VtՕ¦��"��Q�(N)�c[��hF��sЬ>�Q}��0\M9��
>�5l�N���LM(��Q�S�T)�nt���+��c/���%o͊׹�I
랉����:�P����˕��%��i��J7[����piF�ו�^��N@;��l��"���v��o��G��oG��d�?Jc���9���A�/n
I��a �����?�Q�*�(LuDuV�$ڍK��(��-��¥xn˗��	����a�9���ҩ���d\���>����XeM��[5�n�*���L#�$]1��hU�
Y���Sy��:J�f��n���1oF�1��,H�qY��ML
h)��Jc�5�L�a/��Y���!	=�a�]�O���2EΣ��k�k�K�#^���%�P!�*�ѵT ��AY&d\q�OT��KK3�wRLr ����K:��xzN�=�/�~�qm��h������%|/��X5W5D8�:�N������i~���v$�4�S�^���Y~�����I|�289�o`�5����p�z\]�'������'�����	�1!��L9t������� ��;�_Na�5��X��D����Ɨ
��x5+5�L��E���gGp���;̀ya��S0I!)��.5kQ_e(���zb�e�xV�'�t�NQ�}�,��X��N"�j�&9�8�nK�8&���R�}�>mh`���"�Ҁ7�1+�j�#{�YN���I�:��ܯ�ڣ@�]�    ��N/b��S��z"�Pp���u1�̞x/��8���
sq�r��vDa��R�+8iD�h�yO�*g�-(H2=[{��٥�f���:��$٪�>�hQ�d8�x&�_���}�*��V����RW�Ϊ�]D��.gj/O�����Vi2u�}�3�
t3�ۗ$��&F#���j�4�+#p�4�5��������A��9�}�=e��u�wj]��J��vw^�:%�G�/+���(��L�6�Av)X�ڥ,qJ�Ke�dX&��K���/�e��E��Zn �̖:�������Fk1Ё�}���03HS�΂��9�f:�B�����FFE�i�G�6JW.-� �pu��6�ҌS�If?�{�F��&�y���8��YC��%~ɣ��޾pEQ�����p4�z��Q�u
�D+�=�'�(����٥n�����D΍�%5Z`���P��9�+?��3�2h�β��0j��N���Nҍ���?���8nQj���'P{{���^��7@����x��uWQG��0-5U��XW�ƪ���:"ͮgk�C"�B�Ҵ�{`QJ��Z�Ȝ�Q�W�����q�V���_`����|?_�3#��= %��q����ڂ�م/���:"Χ,{�٥`�k�fΧZ2b�"�X��l� `۩�s�R�Y(��R&�*^�LjV�7M�o�IX��.�l�|�͑�H0�Z����c�`��2�h��8ũJO�rk�Ҝ<�1��7y<i�:O&~
r~���C�y:'b�S�[���� H�d>/B����܆����<�-ьUgr���ʻ:��Qy\*�)����2�0�hý{���I_�~g��F�p�"HⳌ��������r���/�h�dά��>�B3�U�nC�RZ���������[��6/'����<0���t�[����@y�	����<"���q���R�+9��V�^�,m+�7}��v�%u�D� �?���m���Y/�ئ!�Y	t�G��:�j/x	E|�ٿ�@��v�
Sa$�S��\�-k��� 0�/��,�@����5�
��C��bB��A}�Z�L����T���q8��S�'M��gI���Τ�Մ�c�>j�!��:����� {a�������cJ>���K=H��8EQX#�|v).�t�݀�1�_{߶#瑤w]��܅a��̹[,F�C���f�#����c@졚h�l���]J�,�m�Q������X����L��2"#���C|oLޜA�Y�3Z�xX����=ݻ�hBLE�Z�V�=�Nˤ`�uA�Ǩ�����ҳ�wzI�����0�%(d��z��� ��7?�����Z��8��)4�n���a�&S�y����� ��Vkɏ�6�V�����G�&Ys�������(�+��D?玮��0�6e�(k2�����k��b+i��J4|Δ�~Y��s��F*ڍv;cN
"BЁx�R`��+���ha�t�ȁl����c-�/��ˁ�%�,g�Wk�����RL�����&/��S��Ӏ�_�iV�; ��Ȧ�p@Bt�ʍ��8H@B6��J��DV#`��|�`��Z�քԊn2jD��g���	�������+�L�.�T�� ���A1t�\��N|˰3�����e~�D���jgF� P^z�%�����N�l������r�긊f��"-$#\o�kR!�+D:K@erPj��a@1SG���^�q,{�d�j���Ŵ����6�F�$s���8K�{��`�lo[>a���~ e�0���:���sN�&�z�^i��Hp�t�?"��>�ܮj-<)�_���ʺ3"gf�C'6ƹ��2Lo~Q�%/�)��M�.���wC�6��;�nE�����n,��ܞnPj�D�U�������9�0W�f�=�Dqe	e��F�C(��0p&Ex$�4VI��nMI:���9�W�2P}^��x
Lp;�A�g�!� ������K#�){b=ZN��u��7[]q��])&�Uk'���&V��[E�+]����r��)���J/�^��&\I=lʏ���g�^�uu*BH94Ӱ��в�{'��7�<���&߻0��T�W��\w�qIjMKOm�C��ڐejCK�4i��§��iB�[K��ЄH�0���#��4� �ǰ�&(�� ; �H��2M9x�A��l*�����뱀[���^e!�R��rvY��~M��
�t��Tl��뛪�SL�r��g�ߥ���O��M^]Q����_��R�1hnQ���PAL�Й�E�9��Ĺ���
QY��B$[K������~��r ����o�.���5���axIy�ᑙ%zf8��q�D�Y���hK��R��#�����ע�˭�xgkI#ў9�+���y�2���d���PH{ٗ5��L̛��oM��x]�����"=т)Ԋ�~���K�ZKE#��m��:��J5W������V"�TFt�m��h���O���!���P����6����$�2����_���eʸz`���/A��sH=1�[���M�5_��"Zw�}��p��$�O�}�yRs�w���1�P�^�n��0T ���
�6��0�9�]aoU\aśwe��Y=����9���ݼݖ��nw�g��(�%�Le��٨S��R�Es]m���+ak�Zw�_�}k��0�^�����S=�w!o�Uwn�@���q\ ��.3|�E�Zz��Ȳ:_�EU���fǭ9��Iylsb�o�����#��:�T<h�=	��J�w�4���!���ox�7��5�*����h=+�ZԄ2=�3l;[sS#� ���q�$}HK�B��x~��ިr�ŶG�q�w^�)�۷g�<Go�#~t|�q2�׺(?R&>�P��M��[��wg���%�|�E���˴���עҏ�l����;P�������������FH���w7�A��`�������"�Z=�d���0h9�n~\,ΉY5��!w�j��s\� (E�{��ef`v8V.g�>�fl��Y�W;���n�kmK�C�����j���⏭�`�=�����¥�8�g�c�wס��!��ë�7����n0�)<���<썖�����K���c�e�FA���aM��O��^��$�ֽ�pHM�f�PK4��oV9�Uk�!����N���c�f�8��TF~j��P˻	P4��! � ��᪹Ǎ��0e6B\)�Dw�%�Lo�2��}�V�Q�G��l-}�E�#I4~�D c�y�@e�]���#8�j����SŻ����m��Z�jh�ւ�[icbc�:T�2*t��!��>����J _�]���@�:����;�	��X�%q}e����D��/�7��Ʃݦ����:�x�H.��l�A�=y���p<G��7�Mj�ΰ�&�S ����a�DeƘ4j�~�Z�1v�ز���W�pCC4D̽�=�bO�YM_�{��x�C���]�8�r��u9���V�/A�-���TH,1;3U�ْiJ��c�5�1�3E��y^�g�;��O�l���G(I`��U�O�\���Ro���}�ͤ�ܚ�q���� ���-<-�R����
Û�&]���v0ib�MG��ͪl�ݿ``|>�!}�A��R�7 �C���È���k�-!��k��hH��@�v���V`��mM��sW�fj�c�%f�ȵ� /@/�s�Pf�o������^�5gLHI6�.Ƨ�.�>	�J���J��0�Z�����J�D�X��d^�HD�v�&�#������8�< �b�'4?g��:K7��l���|_3PC���[�Ɓ'�����`
(�l�e����J�lm�d3������^A�ٕ���K��=�k�G�B��Y\�r��6Z06�5����]��a��M���7������VV�%[�Ro,`ƨ�3�4�oba
ʊ̏���8��|t�}11�i��ĸ��}��2`, d�����LU��2�*m������A�<�B+�%�C��?̨%��O��M'���d�vi�)���N��Z��)��Ux�����ܔo*����\���|$    G�} W���`*@��}����t�6~�Rm���	�K[!Mg�����S1������JW�P��^�?n��j=`��,'
�8�6�R�T��`�{;��>��s�7EU�/��zv�K���8:��f��N�)�w���#۔�I�h���I%sV�����~���`d�ѹ�x)5�n+z[��T�	-���Y � ����<_gN3Kg��Bg\t%c����j�s��/����0����F�.d�Kl[W����3օϠ��(�v���d��@��u��������5Z�(��Б$�-��,_����ob]��Q!EW�}�}� �ؤ<�����1I�М�%��L�� �	�I��bDzUZIXٝ�sjJ��˄��oG#t�w��鲘n��Uy�]�9�cx+�$	�te6�j����֎�T�NW��C����|�$C0+/��7��'��w�߅�'�c�ۇ�u�&�
���h��@%�9���%��Vc�|�lR�"#�N�U[YiF��e6�1�C�-��R������2�)7��t<���p����1
�w�f��Z*G#�E�,t>���ˬ֢ԫ���ٛ��Be�YOB�dn���^B���0����I�FaE���r�/�`.4���Am$�y�ޮ,y����A�L�i�;j�[K����h5��F�C�1���R���s��y��z���ؾ}��*�`�Mu%7;Y��՚EX<�5�^j��-#Z�R��Y��
0�8a
�fH�%�S�����tč��E���Z2_��=�?H5p�Z�L���1����Z�pQ�M�+���;�Г���<Ōʏ19w���9"L1`nK���4��@�҄m������!S��jale8H�C�4��cok��0>�Ki�k����@��%��2��=�H�9F���mZ�D�I���K�KF)�Ć�%�L�.z����E����o���=N�%�G�G�֍���vh�X>l�I��� E��j��C����4r��Z���t~�&���'�J2�R��a����}��l*����Z)�[�!�)5ԍ�ؠ���L�`���rO*�H7�f����e�Q7��c��r��Z�����Ӏ����`��m���'�C�����ڎ�̷�=�'!��x�܁���Lm�y��#-��h�ɞ�U�t�����-�+wd��x��Y��"���1����C�HM�
ğs��5T�	��|-��j+��))ov�?8+���ٛ����[o6x���l��f3m�ɔ7�*{ڳ%���C3����w��7;�T>`G�a:�iHi��2/��<9���W�Q�;�(��Z����"�����!�'�^t	FIU[QR�\FI�DR\LH
s�U�͜7ཝo����"x�;�A`?PJ��y!��� 2KPm-�$���<��5S�K�&
�����ħs
Q"�� �4j��˷F��˫�~�a�c�y�a��!��0�
o
����8ec�.�/M��pTVNʬ�p嚗B�����Hfm�\l�Tٛ����Ҏm���o����'NX��)�1�X#eb2
����]�c#֑�.�=ۯ![����_����!�� �����{>���׉�x;��}N��U6����S����5�O5EDK���*��%""l����Y�;���{�h_0QO�	�r�|+����<����r�+�P��}�����R�q���â�	Y�)!gg�H�e5�<1_tS���h5���"��H���	L���b�/��9�B�b�	?�q�I�����yЀw�B^rO�r������8��I'5;۽���� �������� ��Zep���e�Df�)�f\���8�@ov�� ���"w����}���<�h,�Ȟ�v����$�iM�c�+�����a����dN9]��X�W>;�D��Ne.RGI)5.so�~����< §�^�,<�SBF{h���qɌ.�G�~�D^�,L\��m��{V~�gS�Vz�{��F0�|���Wk�.[5�l����+��?�c�S�ŏh�����F�	���b3?�_WT�u�S� ���<9�n��9GR~m����5���oh1_'��n��!�LW����)C�A�m.:1�uV��A��kx��0�ښ\7�7]��CW(N��@���}㖓��l3���&����^Eʹ��?$ۛ'����J��2
�6�U�Zg[u;�ZmM�-�zϑ������ݾ7އ�<>Ѱ<{��`Z�n�Gϋ`��A���*��M-�?QmMedJ-S�\�&F�"�&�lx)����e'7��g��HL&~���-�s��pm���e��ɽ�gbFn5�N����ĨK�o���(��B�G�yO�j��Nb-����^��4�K3�PMg��Zm�,�pS�ɩ�#\w�?�C��n�Æ��{�h;YWt��1��
�X��~��L�̾g����S�W��{]BHҺ��t�mP�5��"K"�ʗ7�[�Ghw�T[;�k�wI:�{�5RW�K=�rv��i��qH�ž>d��,a��&��6�_>C�ILJ#jq}���v����� �^�2�e��S.�'�SOJO��i����"��w�����9C��{��J����k�u5�2'&�6�%B!���5/��V[���!���;��*o�$�O����s���J�9s�N��D��a.nE��G@o�1��;��-�|; /�9I�(~J�iϓ���`�R����R�~,R����/C��~U0������hc�m�iʇ0f�C�i�L>T��)�*v�D>�rB�r�} �y#Rf�|�5��]�:U�����i ho�<4�RR�7^98�d�֥��D��oQ*�����\L9�)J)�oQ�<)��-Z�o�Qp�ѭ>Ǥ�0��h�J)�4s��f��z�������^'b��t�������y�d���2Ѳf	�N�b0V����Y��QE�׭.(�F9д�L��p/��@J���{i��3����;�3��j�/����gT����������"X�&qKDz����JIC��wҔ����it���=����T%�z����ۀ�i�"�0i�r�7�!<8��;���U��Kũ�"��S!��.H�Ws�L�d#C�Ca
eg��[����&	�lO�,߳�ހ��O����"���=܆��F��Q�$���y���ٸl�Zu}GՀm��������� ���]�ssp�g��K7����׉�Y)t&W�.����x��iȤ�G��_��h�g��g�>�˺E(�~u����&b(c(iҐjs�-�����]d����U�yl�/���-N	D$��̖:����DonT���P�D��럝�Yi��H)>Y'tҾ�E�+�kU�[m�,oy�=J�)L�SM���9�֑����z�R.��]����o43��	\��V���US�ѿ�U�r�����'C �_���j?������,k����SP�tl�o­Zt�ܙU�'sc�Vp��oj�d�iY.�Z��Z������&�x�e�0H��0������?������eü�^��tBcw��M�Uy�jkgy�Ю�-�J; 9.���:��^��z��N0Y�K�.�M`l@J��FJ)���3;��5�F��AH�8���`�X��?U�\m=�W��bT%���ڛ.��z��a�a��پ��b�r'��Q���R��p҅�C퇯��XA@W�A:F�qI^F|`��uWG����.�k�	.F\��ֿ����]7�A_��Zi9^����Uv�Q��X����Lo���E٦$k@*^�.U[��EٺDH����ä�Y:��/B�t�bT��Qh9�iI*s�M��}%x�����u�W���.:��Z����?��?]$~�~�5+���X�	u��v�A���\��jܓMbz{]LRƺ�����qi�s�K��I��ӬP�Ȣ��[ɱa����"7&�����
�LO=��Rr!k���C�@���x�]M&��.�����
V[�0u	�a�+a�,���α�i��J~�;�ɴFMՓ�T���Q6 �  ��#bΦ%�5���		�(�j��SP��(�|�6����%��$��7�x�Γ�f~��)�%H��UT�
��ɒ}u �ս!Q|Z�N^�<��e�v}�3�u#�nXgT7	���t�dٶ:�Dx��o�u��������<��g ��</�)m��֮���ӳ}y��/Bs��LH��5����m��wo��]U�gH;�c�e:�[+^�$1ʔ�o�v�J쿟���Q$rv��R?�%��?B'�/�
����qC7�!Fw���d{Bf,�N7���>`A"�:B�/B�;dV(����F޻��	�Eo�g��R��ئ�K�d��,c��iD������=2+�5u�M��OCG�'���h���h�`ZmM�G�\�*���>䁙� x���D��屾 ��e�����ȝ;kU���Y^Y�L��]d��pi�3�o�`��d�v�1�y���R�T���x����cdЌ���Ia8+e�Y�r�����
��S~������%��{�)6�5 �;Ǥ)j���y�j!r{F���#n�≧%�	$�ס�P���8v��wGk���U���-�s�(|H�B�Nj�/��?��Z��C&�֏��FQ1?�v�4�{Τ�)��ӳ��Z���w���%��pG%Ɣ�?��C+���ě\[/0��[�݆��|}i9��i���Yw�F��
+�ݷ(��|N�!�j���i�=��'l���!WLJݽ�.���q����-�ȫ 'S�5kU��@��d��h�\�V:K�Fv��ҋ���N���0�VL;��"�����Q�����jb���o<+��f/C��$xz�v����u����a<��hg 	%�(��=�kA�[�VZ�Lo���[;��[�Le�=�9*���z�@�f?�M/�v�4��a��5|\_�-Eu�Q_G�.�Ʌ(�bZH�ؾ�LL��ٻ@o"V���R�|H-�Mhc��fFn��e8��O���<�y���;)נJg�H9��qO���t�}3�p�T��-����H�4D�~$
���
Q�s�k��O�pb5ݭ��M���|�*��ƒ�*��f��G��zr�w|[�M�%��l'�����Z"��ג��nȽ����Ӡ9<���;c��Ae��^C�h�OH�|���1�'Ϧ�u�x�i�x�cd[�v7ʢQ���~���ѬN0*�����%{����ʂ�n�H��Q��)XL0*ԍ��{tAV��W!Ɉ{&T�1�@^Y�;v92Ā�_|&��� Vh�������E=��X�%���V\����g�� �1�C��:h�mx��W�5�<[�\��P����d�up��M�(�u�/�T?=׫:֠@���d�X��a��CX�jkb��ƍ��x�����L���_��d\U��Dtd@�lN7�t<��>Nf��!�]Ӎ5kU���M/ǳZEJ��Qmf���䋜������u8�1�s����ؓO=���vm���w�t������WB��,�A�x��\!�9�*Ӎ��u^�E&��Б"u`��IL�'�֬����U����n�]e���X�B��e�Ζ�}���-K�H���t����a��xZ_�S�©�&&��z��~�
7�T�?�h����|Y�g렱X�'/4,G�^BSl<&�я�UE������Wk��T����X��(.廈������=`(�d�R8�f�$�1��n!Ql��I���2M��J���	=q�#h�U$ϕ�4����'v[*E��.�v�캤�̾5�p�������Y�9�i�փ[�F@d?�fc�)�f�&Lx�Q��o#^&�ɞG�u�$*1���0]�<�|����G�Tnd� �xCj�ښ(K휦���Ѝ�n�1)��r��?����Z�������߮�Ajb��t
�<½��㸦�����^san��Xo=�b�{�5U-�R�߇�A�`u���&��e�����ǔ���: Rw�g��X�%��'�Hj�́)ԦZ#�Ueh�Am���*�̱�����Lf��^��߅�Ƿ����ϰ�"aK�`rn���D�Tw��|��X�|zy��>�W�H�Ex�'3=Ϫ��:���[ݪ^-y��իAE�:�#f�s�	\I��:�nP��Wncj���j%�>�Z���~2V��/#� �ފje���K�
[����qpI���1#�FJM�M���;���ƹ�t�VYs�yp3̝�y݁M��j7mU�M�^o�zUU��ߛ���/��ǲ&~E�ȃ��s��,5�S��m�İm:%H�D����}�R�qr�����
�_������N�T�	|������H��3�(���0r��gW�$�TK���C0WӃ\���_����jq@v�C�{k%�H����:��x
�d|�)��\�W��\T>q���[1݁JȢ'&�ye���HA����Qq�ǵJF����ߢ�H�߄h%�h	�;�!Ю~�sa�c�R����_������0�� #�;��L��d_��?����_�	��i�\�#��l'����y�~���:�AE�6�~�~N�(*6�E��hCD-AP��h	����L��ex؞�e���c�wRS~����Ӭ+��H�I$����o�߇[~�i��/��:In�Pt6Ä��� "�%�~������Gse=A��C	r�&��iS�IE������������)D�D.��a�����m�H��^�&���l-��`��8y��H���LAh�`�/|8�D��Rm�A�Xq��|�(�&W��Zt1c�����g�^�]��S_jd��5�r<oϷ�IT�ty{p���h���]x�T���,S'��N4��'fϽY�Aԏ���H{��ق�"��ɵdM���������%2�Fj�o��r&�j-ʌ5&+���nlx�O�|��QQ�(��^�;�w�\PA�.�X�҂���*J�7�̻R��d��_���C���dh�Yw���/��>�X�B�kʇ%�b\�����&
Qk��Zo#�J�Eu�w��9
�:�7��g�os�_� �gb��wG7Ӿ��B�N�q3�X��Z'����Q�q��<��$�QH��FU���x��K>jӁQ7u��b��Il��3�T�Sm��9yr����E�Q�2����I����G�h�<D�Ң�� �=	���YE�����.p�������`g�ʢ�\z�e�k=�G �B��rCkK�J�=CH���ۺ�����"Z�h��l��������a��4f����ڝ�Y�I��$���	������.����)�T�"K�-��"r8��Tani��
�� =�)Y>;%��Ǐ����#�g!��xZf�Gk]����/��ȹ�5��\��Z���qݶ�j̿#/�| �*�Z��S�7���v��|�����'{�����0o�3;y/+ג��o����n�h���%��T샔Y�����?:�}�Վ}&�1{t��?ġ��� mO��;R-3�CE�c@�u�s��ӫG��W��g��Ҫ��~����HC��'⋏.i��a3��"���2�\��uG<����ܷ2�Eן�Z����W��T
��� #ڃ�}���!p|�����32lԋ|-~�ت�5x��5�5-��b0�B����S�p�t�����΅'*����� Q�5f�n�w�,km$5D0��?M�
~B��z&�1�!C"�e5Q楂�(�����[�AF�{]��r_��kR�u�j-��VҠ�6�}�w+�Mf0���H�m�b-��L1+u�A�7I
��Y���
�}�@S☱��� �5��C����`�X��
��9��_�!�)tF����D��*9�\@�yŇ�
	��
��\y�NO��?5t�T�A� I����~��_�_}Sރ      k   �   x���t���|������v�|������`��;6>�1���&0w!��c�ciI�BpiQQj^Jj�'�����v�y�c����������`ǔ;V���陗�_������IP3��H�5|4a:�<�=... �/��     