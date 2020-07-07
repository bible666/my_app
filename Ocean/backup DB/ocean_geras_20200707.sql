PGDMP              
            x            ocean_geras    10.0    12.2     (           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            )           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            *           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            +           1262    125195    ocean_geras    DATABASE     i   CREATE DATABASE ocean_geras WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C' LC_CTYPE = 'C';
    DROP DATABASE ocean_geras;
                postgres    false            �            1259    125196    agpt_agent_income    TABLE     �
  CREATE TABLE public.agpt_agent_income (
    id character varying(10) NOT NULL,
    period character varying(10) NOT NULL,
    region character varying(50),
    branch_code character varying(4) NOT NULL,
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
    esb_created_date timestamp with time zone,
    esb_created_by character varying(20),
    _audit_filename character varying(255),
    _audit_filemod timestamp with time zone,
    _audit_filesize numeric(16,0),
    _audit_created timestamp with time zone,
    asst_manager_code_7 character varying(7),
    asst_manager_name character varying(100),
    position_level character varying(1)
);
 %   DROP TABLE public.agpt_agent_income;
       public            postgres    false            %          0    125196    agpt_agent_income 
   TABLE DATA           d  COPY public.agpt_agent_income (id, period, region, branch_code, branch_name, head_business_code_7, head_business_name, headmn_code_7, headmn_name, manager_code_7, manager_name, agent_code_7, agent_status, agent_name, "position", position_group, personal_id, occupation, occupation_group, education, education_group, agent_start_date, appointed_year_desc, agent_age, agent_age_duration, gender, working_age, position_date_current, position_age, license, license_expired_date, appointed_period, recruiter_code_7, recruiter_name, recruiter_position, manager_period_adjust, manager_adjust_desc, supervisor_period_adjust, supervisor_adjust_desc, premium_cream, premium_pa, premium_coffee, premium_total, premium_portfolio, new_case_ord_ind, new_case_pa, commission_first, commission_first_level, commission_next_year, premium_can_be, premium_target, persistency, appointed_agent_amount, keep_amount, ov_supervisor, ov_manager, csv_created_date, csv_created_by, esb_created_date, esb_created_by, _audit_filename, _audit_filemod, _audit_filesize, _audit_created, asst_manager_code_7, asst_manager_name, position_level) FROM stdin;
    public          postgres    false    196          �           2606    125203 (   agpt_agent_income agpt_agent_income_pkey 
   CONSTRAINT     {   ALTER TABLE ONLY public.agpt_agent_income
    ADD CONSTRAINT agpt_agent_income_pkey PRIMARY KEY (id, period, branch_code);
 R   ALTER TABLE ONLY public.agpt_agent_income DROP CONSTRAINT agpt_agent_income_pkey;
       public            postgres    false    196    196    196            %   ;  x��]K��>�~/9ٜ��w�-t�����0!�!�!��Y'Ȯ1�Dr��!م a�ʎ��f~J�C9�C_��Ӝ����������V	���H ������.�)���|<�������W��^!�|<��?��o����q���/�����|�&��p��D¨!�.�<��O>��y��ܥX�w�������U~����w��ڕ��7x�}�%��EwE��N���U��1���ؗ���^N�Y��q�bc|���vM2��?��X�����7��߻j����T��������ٯ���tw_g������@	�$~K�sۨ@׌b%C"�T��W�����?IH��+������;��Xw�O�J�XM32d0 s
p��~��g���q��>���B�~����}�����yfo� Ã�80��g��4��S�X�{D%�4S������d�i��"��\�^��F.��a���4��3;���	tf 씬�
&Fh�8�ĄIa, ]1d�M�sD��#��8�w%�$5��K�o��F��|��Sj���`� �)��	�o�3�3�SSL3�))�lʞ# 9	p��}V���| �T�eY�q����L,(�Ɉ1M�U��X����]!�tA:e���r>���6�M�����Y+ܙY�dTh5p�P��+�4eW�.#��d*�PJv<]Y�S�I�����Q��y�N�|���'~��׻ �V�#��� �S���))�M�U��y�Q�A�ZO���,���XH1{�R&USv�,��Y ��ʙ]�*,P����#�,|a�:ϵ�8nʮ��F��P��ݎ����HWm���7�����גK&�}��1��û	�PF�[�7��m��w���\�/�!�Y�װ���x���������0�W��>��M�z|�E޺:ba���_%s����
~{R[�G2��6��_��xt��_�����2��F����l������ڥ�{ �m�g�Z�5UI�oh!����`�!"e1���hӧ�&I&h�d��h>N4�����a�f��U;�,2}�cJh�d��h>N4c�b��@f�p`����OSK	˝l,������F���F@A_Hߠ�OJ	ܝL'��k�F�4�����"����B(��i��tp�b�r��@'�G�V��!�����9mG�e�D�k
h��,����Lk�[uj��y,��ԝ�#���kK���5A3�p
k��h^��Ax&��u3D"
4��DS���D4G4O�D́9X;8O�[0�v�]Ɍ	^�);��T3z�d&��#����P�vD�%̰-<e�)�^a��byu�r~�7�0Sɩ�7��(̤�a�m���Ͷ��7Q������1JLܶ��
���)�-��Ù�}EX%ۥ��# �{5\\!gG�em��+�;�<f5-�T o{�������;����?��Gn���`��� �t��=�崸
G������Y:��6��nr���^�ӷ��=��6��(ӆ���lY'����}sO����p���2x��!Q��r���")�;� ��,^�)L��W;s���V�8�`��'���~�*@&>_��/��6r��x���w��)*~����2�A�g���D�˽�2z>4@�7���z������I9�w����s���Y�,�uh���?s]��8�R{ù/
��qB��r�dTD���a���)���(�'{��6��/7@/ǡ^h��B� 5�\Ue�:�MZepjʚ���k�{�w��A�O�ԟ��g��[�����/6��^�A���d6�#M+���͖P�6=/��ϵRΎ4��Ke�:a�oh+�w�@l*�A����t��O��sÑ%��~�G��"��_��L�pj�_~'��<�� 6�!�?���~�s�����름Hxb�v��_�Ή�K?�!���~Ke�~���l����!�#N�������9������� ���S����=�w"6�$j���m���{����uE����`�+�{b�~oR--�UͲ�ބ}�l�����o��sއ��1��`ˏ��R���sR��S�\nx����4��cQ��;[QԊy���0�>!VY���+��YQ�e*��;�vY������eA�=xQDY�.�!��F�T�%�
��K��f"h��X�=��^w�bE���eA���`��1;���?hRM�0E M} B䦗L��(R����u�uwVD�z�q] 
�W[|��x]�mCl#�7�%����y����>�X;?0�	��,T�> DP��('a]@����qA�(�f?��@ e�UP�Z^��5>��Q6̏����L��xfp��Le! �d2���nʮ0>��E�o�����~�i=^gƨ��-l2��LkM���͉������������D��4.��r��)d 	ϔ�LNI?-l��G4J5eWHO#�#�H����$��E�e!_~�G�Kd<�5v���}az����囲'��������I�g��+�����+덓1��Gp\ۭ��nE|Ү��b|�=G��� N`zB7'���,���gd��]c�E|�9��7��h�`�~�A���PQ}�t���}Qı>㍕~͢k������Mn͡���U����p��
y�t���i�t��f�)!aÙ
�'$O���5rz����.�����d�C���k�}�������������Ww�����ַ�\�*��ӺVw�Bp�-������~�>z����S�     