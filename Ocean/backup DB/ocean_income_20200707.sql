PGDMP     1         
            x            ocean_income    10.0    12.2     <           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            =           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            >           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            ?           1262    125204    ocean_income    DATABASE     j   CREATE DATABASE ocean_income WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C' LC_CTYPE = 'C';
    DROP DATABASE ocean_income;
                postgres    false            �            1259    125211    kpi_employee    TABLE     �  CREATE TABLE public.kpi_employee (
    id bigint NOT NULL,
    reference_code character varying(255),
    sales_code character varying(255),
    full_name character varying(500),
    zone_code numeric(19,0),
    appointment_date timestamp with time zone,
    email character varying(255),
    tel_number character varying(50),
    created_by character varying(50),
    created_date timestamp with time zone,
    "position" integer,
    period character varying(10),
    co_main_manager_flag boolean
);
     DROP TABLE public.kpi_employee;
       public            postgres    false            �            1259    125219    kpi_employee_history    TABLE     Q  CREATE TABLE public.kpi_employee_history (
    id bigint NOT NULL,
    kpi_employee_id bigint NOT NULL,
    reference_code character varying(255),
    sales_code character varying(255),
    full_name character varying(500),
    zone_code numeric(19,0),
    appointment_date timestamp with time zone,
    email character varying(255),
    tel_number character varying(50),
    status character varying(1),
    created_by character varying(50),
    created_date timestamp with time zone,
    updated_by character varying(50),
    updated_date timestamp with time zone,
    "position" integer
);
 (   DROP TABLE public.kpi_employee_history;
       public            postgres    false            �            1259    125228    sales_team_structure    TABLE     �  CREATE TABLE public.sales_team_structure (
    id bigint NOT NULL,
    appointed_date timestamp with time zone,
    branch_code character varying(4),
    recruiter bigint,
    reference_code character varying(255),
    report_to bigint,
    sales_code character varying(255),
    "position" integer,
    period character varying(10),
    isactive boolean DEFAULT true,
    change_income_period character varying(4),
    system character varying(2),
    authority_id bigint,
    full_name character varying(255),
    appoint_day timestamp with time zone,
    created_date timestamp with time zone,
    fa character varying(2),
    paid_income character varying(1),
    report_to_manager bigint,
    level character varying(5)
);
 (   DROP TABLE public.sales_team_structure;
       public            postgres    false            7          0    125211    kpi_employee 
   TABLE DATA           �   COPY public.kpi_employee (id, reference_code, sales_code, full_name, zone_code, appointment_date, email, tel_number, created_by, created_date, "position", period, co_main_manager_flag) FROM stdin;
    public          postgres    false    196          8          0    125219    kpi_employee_history 
   TABLE DATA           �   COPY public.kpi_employee_history (id, kpi_employee_id, reference_code, sales_code, full_name, zone_code, appointment_date, email, tel_number, status, created_by, created_date, updated_by, updated_date, "position") FROM stdin;
    public          postgres    false    197   �+       9          0    125228    sales_team_structure 
   TABLE DATA             COPY public.sales_team_structure (id, appointed_date, branch_code, recruiter, reference_code, report_to, sales_code, "position", period, isactive, change_income_period, system, authority_id, full_name, appoint_day, created_date, fa, paid_income, report_to_manager, level) FROM stdin;
    public          postgres    false    198   7       �           2606    125226 .   kpi_employee_history kpi_employee_history_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.kpi_employee_history
    ADD CONSTRAINT kpi_employee_history_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.kpi_employee_history DROP CONSTRAINT kpi_employee_history_pkey;
       public            postgres    false    197            �           2606    125218    kpi_employee kpi_employee_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.kpi_employee
    ADD CONSTRAINT kpi_employee_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.kpi_employee DROP CONSTRAINT kpi_employee_pkey;
       public            postgres    false    196            �           2606    125236 .   sales_team_structure sales_team_structure_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.sales_team_structure
    ADD CONSTRAINT sales_team_structure_pkey PRIMARY KEY (id);
 X   ALTER TABLE ONLY public.sales_team_structure DROP CONSTRAINT sales_team_structure_pkey;
       public            postgres    false    198            �           1259    125237 $   idx_sales_team_structure_branch_code    INDEX     l   CREATE INDEX idx_sales_team_structure_branch_code ON public.sales_team_structure USING btree (branch_code);
 8   DROP INDEX public.idx_sales_team_structure_branch_code;
       public            postgres    false    198            �           1259    125238    idx_sales_team_structure_period    INDEX     b   CREATE INDEX idx_sales_team_structure_period ON public.sales_team_structure USING btree (period);
 3   DROP INDEX public.idx_sales_team_structure_period;
       public            postgres    false    198            �           1259    125239 '   idx_sales_team_structure_reference_code    INDEX     r   CREATE INDEX idx_sales_team_structure_reference_code ON public.sales_team_structure USING btree (reference_code);
 ;   DROP INDEX public.idx_sales_team_structure_reference_code;
       public            postgres    false    198            7      x��\MsG�=����wW�i#6�8s��l�/m
kB �� +��d����$��I���f8#�T�7�)��U��n�ٳ�`(@���|��&3�1�!3�ḧ́ei�Z^���W��jy�Z~�ח��a��~���/�W�W���j��[-/V���ݷ��������^�1���g��c����+>�cbyfE�m������o����`kL������G�J�6��M����,��F�D[Ƭր���^��^���������N����z��������l"5�ь�4�5\��`� 
,�\-Vw/V˟ɦ`�wI�����H[�p6����x}������l��_��V+�,�ǥ`x�:����?h�E�@���YZ!�$V�������*Vi3#WmXe���G�$�rk"�ά���wd��^�I��5�AbS���,6��|ss8폆�q-�/5�kt��X-�z�]tyU�\x{�g�'wfe<ƹ�O������<e�a��@�'��]EV��-n��;+�"|G�zQ��I��飯�8�V�0�gX��'�ƃ��a>�o�&�\�=J?
<���!R�2z�w}��prأ������r����BN�6x̣�fp0
���Z�#���{�Ww� ��u�ԅ_�G��'��n靗.J�&�+��M�l0��O��i�9̠�V��=Ox���ZB��Fd�A�Q�,�Fn�c�+'�;�Omy�f�C��Ȕ�X�hŸe�W��^��0�x�!1�Iɴ�ʲ�(�'�t8��S�kfR�Z���v�l�x!.!$�*�}rX���M�Gnr��}���0$��5&�Rp
�
�o��<�
`u�1{<&�=�^`�p��i���\v�6M@H��!�"|/�``�����v��'����2����5Qu��x�g��Q9�Li-��x糇-P�T�i��J� ���~ARȳ��[)Q���wx���T+UIV��������G�y��S��������s���n�͕�A�뎄��D:g��a��2,y��d�V��	J�"BW�r:E��~�/�Q`�*B/M�$@�5��9ى�`�V��Aƌd��b�F�A�ݸ.g|���P����4��N�v�����_��%�H���@t�w�7��7�c�C����)0�0ݩ�%�6M��ڶ�	�ˀ�月ŕN(0�L��'���3~���Qf�ܒ��T��&��D�D��Fn]I��#@'IW����r�~��|k2����]t �=ܪ�kx!�0�#�Y�>�
�����S���#�=��B�
����WF+����'�?�����ؕ�=���p������l��G�^��3u	����{�E��T�+/�wF;#`2�V)ݹJu��%R�������N���T�/<�{R���3A��	���j���pT9�T#��c�L���*S�@�y]�GZc��p�|G�����s�z@�:�_/(SQ-��F�6V������(�$�$��]�~� /	�#�{d�2�#΃ {^$˦\4�G_� ��a�ւl�T��H�ڠ���t�L�fs�"<t�C/x�����o���d���j�1�w����vUʁW܀�v~N���Um��y(E��J��6�c���5��j��1��O�{eSiL�&@�5��5�5�.��S��e�8�
 ��iV *LĶՆ1�/c�fњ�/����T 5�󙊼�W��H&��7�Oʶ�X�IW�Is�Or�|�t��8�H�����GTg�<�\��
~� ��2~�#��r����y�:	�s{߆��t�/�Gq�&��9D+9ŤjL�5��D���Uc��/�;_j��*t��<=! �Od�}����|��O��ոɄʔJ��5���WA�K���/��?{�$����3ڙek�曓�l�#)M#Sg�)���ըDc�8���cׂ�aG������QK��%�Â_�,jO�v��iDJ�.�uU̚*�^�}kQG9�?����Q?�p�J5*w���՚Yl�F�K�ʏ3���G�vHf�r���	I���<��	��<�TqA_����Pd��{�mH�%�m�mg���j���2��t�Z��|�Tj�ǿ/���#��F�ꁟF����\���s��14(��M�p���"h{$g����!1�������.�Қ��	Xrׁ��GL�jpm�awA
@+ʍ����`��eh��c�%u\��
Co��§3�q���F�u���T
P��#�_itre�]UZ��7���:�2Tw��>�$�I&��ʈ��O=�����ZS��MЁL��2��$����1�B�������^T�\�u��Q ��DqvE�>䎢xl���~=��B�T�^2)h�Gd��PV�.ST��ӒށP;�[,�X�7�Qu}�:S����U��Z�[���R�{$J�'����	�\!���K¹h؇����B���E������}��blУ��5�<
����C՟�C4b#�(F=�.�8��\C�B^RSu�f��y�`~�{�����V�ABǞ�̘�1V�k���৫���9�EgdUg���&y��������:��U�a���Z�d(x�Fc1��)�o�S�m�� ����� ���a�
8'���Z�٦Պ�xksl�q�&ETWN��A�b"5Y�
C?�x[���g�; ��m��M�|D�X��B,��H�k�V�c�סx��h�B�>��:����y�c T��4m%��c�eN�Q��^����uo	�)�2�O|��O� ��Fc  �I�^�#�������+?*�� ���װ�(_�L��Y&!#�KLH�Ȥ��(T���G=�T���|\�Q��tP>X���'q��Z�J���������0Y�h�$-���$k�.�����n�ֲLq�ymI��AZ��v���aG�����y`�Ɩ%��d0�o�F]@��/(HQ
@Ҹ�W%�~�e�-����SgM&�PC�{H����.Lն����vM��*���5�U\CI��2�P_Q�߯u�=p�\���{��B�W s��E�"T^չE���{X�?�i,��a�i<���gZw��ހ�U@\�a�
�R��T�>�y���y�s���h��6����(�A\r���[C�/,�\��x.o��>�aX<L�oX��kM�o��Y�
�v�TNf�	ī-�9X�!�꨷.���"��㏊d+�97ܪ�*$�{�7;�RQ�ݱ��"�]jP��*at�@i	��������@-�1!aQ�J���~���2�#��b��il�wm�I�<<��x]E���.<�I���P�Ů�9�N�'y��3�ټ��8d�A`O���o�{-�sf��NB����9E���R{h28�G Wv�Ok�j]�w�S�GjQ،GOSjQV=ͬ0��BN��×&����a�i�y7U��E]%�z�||���˞��0wZy�4M ݇�5D7�]�T&܈K{~������ka��V}dʕ�+B����1�,k|�m��u�]aP���������P����Vq�I��x<��7����}}��\% �盐[]�u���0��v��FI�ر{��J���,�o�L�lj�����JE�4��6ο�K���B_eQ��܄��Ci�U�=?{Fxc{s*�u��A�!��Y����Bm������]�
8���J�T��T׶�!op�����Fی��\M4<��&��"�HE���j�DՕ�D�z�1�㍞d~m}^�J��0q���/'�i�� X��e��:�4�e1�9ƽ�}��Y����1����1�9Bi�e�D�fg��@d�1cb]V�\��S'�}�Zݔ���fq��$df��^�l���`&��a���/����X�<��CnR�s��AC�(W�_�^�
�\���ց�CD{���5gF�Xm�Lm�I�."O鲈��f�u�t܅�X�����W�hӾ 3���ԙU�6}�6ŋ�{�/�x_T�Fq[vg���� �  �sI�K+��A����:7�I���s�ʾ�_�,�ѫe�/Ɠ��hwXW�)�Kʴ�qk�����@�E�Vv��
���{ u��j8űl��6k�|���C����l$�Ί���
�y靓�M��|�6���b�ݘ��d�{�5�����BZ�MC�~����������s�tg6�3��Ϣ3�Y�����!�5�5,f�1s�;���E)?_��~��N��l� �Pթ����׮�����C�:���_���~�L�b3N��ל�s @��R�h��YX�����]������`���alNk����� ąI��]>m��S�/'��p��.�5,���m�G�t/��vZ�!�|���&��ء<DFp=��E+=t�o�w��n�ij�q��M��9�IR�Z\��y}�#wg"�{�[�G4�,�'/�N��0���'��H�ғg@��Pܐ �ii���X1(�J]�>�M�P;/�bY�q~���b�q��w7k Jv������(����\SJ)Uk���:�����2�5,b.%�s����G��[B)o����A�^��ɉ	
�og�"�@&�%m.}��t����<�=�&��Rb��\3H^]�����)��ݨѰ0�Ks���I���M����}���Hw%K      8   V  x�͝������S07Ht�v�Fr��N�ĀJ0,A���� ��9���z>�O�j)�V�!��������~[�]������ƼQ)�6��4�^���������?��_�����|��_���?���������߁��~���/7��\�_}����A顔_�����сH?�1�<��c���'L�4��W_���W��z�7����y��_��7��M6��.O�p6-ތ�ϯJŏ��������׏T^����2��c������-�K��z�q��P�-N�������t���mD�'��EZe#����9�j�Q����o��pߨ���4�dE~��m�"X����7o�����o�|����-<��?}�5�\�=:���&�N�K�KC�%�&�Is�-� lz��|C��4>iJ��" Y ��wo���X�q)�X�Spj�iB���[鿒��v
'�T����G����[�;Ώ1�8)��i��������ͨ�7�%�h����6Y�cǪ���뭣7�Jo���+'��'7�\6g��W�XQ7����+'�:���R{���ʄ ���ߩ����WX'�`UV��{�u$[�Ŷj��^y��':"{����� ��n~����o���j�k׎��4�5��*DMŷ&��*2�ɒ�*�Cs_�א��j �.[�:��q4�t��u�c�G����jiD��\ɯw+�u�ۧ�/p�V�:t��TI"܀�u�Y�
���"�6*�ӑ({n������D���%a�u �폇P�KE�:JT|���d�|�H��L���< �䂈\���NLZ�#�~L��%Q[P��P�Gy1UE$J��M��%�#V% iY���8=aÀV�.$pW�݁W�Z�~e�؀�ei#G�a�re��!�-$�PᲺԵI�
b�"ZW�)}/��I��o�:Qف4k����RV�v���E*eQ��� a��
i�p��E�k���mm
e�V�,q��S@p�P+uq�+�lP�$�
O� wq@>���\���bO��1�e�	��Z]�h�:KN���߲HӴGX"]":��E'y��*�a��.3�W��������W��{��x��9K �(���P����@p���U#(Kպ8g	 du���ڢO�����
Bş�`�9x�����]A?v���������
�������A�#GՄ����z-��3g-������� X�)��5Z\��@9��DЖ^��@��W�Ҡ-]4����Y�ݠ-�iq��PrTԣ'�����d!��Oj���Y�4h�,j�ʮ�`@�z�G�	���� ��ڂ7Pë�.���	�NΥG�i��N@��⸥Q^��F��0'��G����6ߢX�:o�][�-�b�:ᩖ[�G���±���jm� ��֢��t��x�	mao[h���@�A-���Ki���w��i��"�:�g�N��%Z���6H5Y:��a�՞z�c�WP� R��_D#�P�1��z��@��EbS�|���>0ie8*���Q��<h�fE� �n���K���ʘV��uw��B������z�[������.�\��3볋��P���`�QU�)��a�5��F��c�1��ێ�� �q�ˢ:��y0���k�}��V���]�1��е$�z3{���tO�[w�Y���Zf�H���i����6:<������F�Ze6c=�5w/�#W;�ܲ2z
�V���v�9^��a0]cn��u�#�ڞ۫��� 	,���/�(�Vf�c�yc�\-�0r���x�%n�FY��lYb���Ʈ��y�5���7^ͮ�U�[��k�ݓ}�x�Q,� &���U�4�Ar>�K�\�e�x��ݰ����;^�i����ǫz����uv��`�:��Ľ*������*�����m���7���YJ���&�i �AB+�త����#��z�|���P�ɶO�V1�m��u�/�p��u9���(ez��cV��ځ]c�ʆ��?s��O+rYI�������:#�[8sA_(A��lw�a����c 7S
^�[����>��y���8r�`�cYcwHJg��3X�2%�'֜p	�8Y��va�:l�5��8����=���"���*!��u3Lġ��s��&V���PZ�v�}d�#o �Ai��v�Κ�k�����*J��5��j�Ҫ̞�p0k�_D�(\g�/<�u��3��v-���iԠ�F�[�e�Q?�X���uv��a��#+���{{�	�̯�
��g
�b���~�"7�ˑ#�D���W���>�fEp&(��;�ŭG�6�5N��ٝ�ǳ�1�U���'�9dߊ;8��w(���ݏg�v�lP�ʳ��ǲF'YV�j�Zuv����C��/}˅��?��D�'K
��'K��<�AlP��҇[7!����]HieϽ�k�=N1���y0k�\H����㍎g�QA���p�=��p�|�ta(m�v���ޏQ�a��6�znw� 5g�=����v�jr�� ��2{�Ѩ�$T-���*|��lFMe--��j�[�G͏#(p�@m�����*���٣8�F�u"i��>u�p��M��V��;�V�v�J���?@�c��چ�ɽO7�}�(ǳ��e�I����ޡV�v)���+Ƕ5\g7����*L���="�hT����O��u����Q���P+������kX
�j�Ħ���f,L�5y�8���s�g�ٕ����Q�G��%"G�Mи��=b͊e��X���`���ڟg���R�xT���aPǚ�j��)$�l����Yɠ�Ͳ:�<�c����M�84�_G�t����/^��}_�Y      9      x��]]r7�~�N�ϻ!�U����}#|�9��U,)z���I�j��0hS�]�oܼ���LdP�( dK�`t7!���D�g�:�w����P��OU����w��i'Ğ�E�W{��W���=��P��S{���������������~��~}p�޿__�������[��O����ݟWѯ���k���&)��!`�����WO,�w~��J�T����<x��N�t{NZi{�'���ܯ����_߯?z����[���7������w���y�?0h;�\d@;#���A;=��E���NWH�k�������%��t>k��:O��'�l��I!�Dgk=de���/<��@6������������z�'�Y����2�n�.������*���z��	�*�GK�e�U2a_�<wh�Ⱦ������.��_���Ew-X%`�W>�[���� �����m:�g�����>P�����?���^�k�7������"��?e9��S6��̋���#�K��	|���Ɣ6C@�N�Ym��BMܫr����v���Z�d�D>�O�p�֗-�6}hR$�PCE����Yy�E�����+d�K��;�!z~?4�JPv�ҍ��ja�
��n��_��҇p]G�?\ �_�2pM��D�q$��Oj��,r6I�K��C$����#BNb���E�&Ge_E�q#�6�ş�j���%|��)m䗰� �9�r�)���ك��-|�+���͸�HCꬸ�e�5��ϒ��U9��D�������d�pIV�[�����#c5)Vo�H�&V�� ?ٟYy��E\5����~�$���d/=��W����kz�$N�7�
���\$�;�� ,ش�l}��{<�ĺ� Z1��>A>�FzlB/�҅=5��]>��j�����y!~�f;�a�rΊ�^� W���6�̴$����� u%��Pָ�y�������>/��I�K��R�� ?��;�^��2
�#��s8�F=)j��ȬFsUK)��A���� �	�ş̓F�P���Z��h�I��bI���X���?����#w�`�J�����A��n�Vp7Ѽ	�	+=�Y���܂;����@��QN���}���E��Ob�>q��r��p^���7�e#���FvD��#_�{~�9A{j�	2�A���I�.�5Hf��v��(�!>C\��k��%ء�h��X�#��#���!��,ʦ�E{/�3lPkL9�w�j>�j!�ƟN��c��O��o �b���\��3.�z�����~���#�	<�5x���p_V������-3�?�O����M��n:�Y��]�a%�z�5�<�|W�u���*W�����q�'3s�W��R,t������?��=@j7Z�ʖQ;�<��*~�:k*�g��P�R0a��e�%�¡�Xٶ���+s:����s��8x�ӻ�)�\؏�'��/�-pɏ�8�Jq��*��q&�\�*�r��c6�j ��PG��QԱ��AC�f1�U8O2M=؞�D�3��"���o'�b
����:�J7�e��x���G	o��s����y��]��#��� dy�<>�ݥ��ˀW����	�om6��M���Ŗ�K�Y�	h3��V:9)����UJ�3����<7�[2�v o"!�;�Pn	H >�1R�����n{Bd9^BW���޻�������6����u��)i(o��l��� ���fV��r�z�dYJ� Zɐ}N1�Z}d�Ea��1I��=����S)kŃ����Hڿ�������P�R��/6�;�ЎD)S8��}��a>��yJ�ͤÖ3��q�C풇�53衾`���V݌�E���3�%��duHYϑ&o�����Z������BmR�̌50m�-��s �����- �0���a�`��6P�P��\�
��-qm��}D<^	D v�(K�r�z>�)�s���m���Cpƶ+���$zo��?�Q�y���yMBa��'�b��Fty)�|���.��n �0&*�rD�c���L�a�)V�9�'�����#<v/�-TnФ:fYna�r	!=rK�M�@s�[P	V`��3�Pz��CF6�>zs�d;�&39���"w
,��Ӧ�)��ꢨ��@�J�5n�5W!$8#n�ʒ	@���o�^��~�=A�Fh�W�=*KDPgxd0���O9膊�$�������iׅ�u�+[ Ҹ����r���C�j�3|qW���7�WS���#�Ń��`$@�'���e�s�إ]�".�H�NےԍC@����H��X:)�]���K��Zb�i���{�&�n��Q0�����_,�!�ԥ� '��
��@�c$ޫY���p�w?���L��8}!��F��9r�{>縉+�Te�Y�1�"��kz
�~7}��r��Ir1��F�U�.}C���(�A��+�e3��BD���4��A��ς�̜���J-J��ew-�5e+�݂|��j̺P^��#�v,mH��~�+f��=��#K��������ئ����}=�&{�5ψyς_t�%F�>�X��K:��`S�z����gM5ׇ����|A��`�r�a&a�>!�~���B��B�zBDc�f%D�!�w��tɷ�UfCg;�r�B�x�Q`s��0ʺ�����sw/B��p��<�_���p�"L�a�˲�a�ܬ҂��	���LϨAg&^a�uhF�y˵�k<(g��a;op(&�Bl��ü��d�+٭|�5�T��P2?[���k
��p��IS1��E=�G�Ϻ5������ �i� ���J�'���|��8w��vW�DP]"��)�*6��dwSwW�맪�lUT���'�ĺRU��C�9����P�"���&���z
�=��q�U5]Ee�{�C���A�FcW�E<Qayh~�E�m*{_�^1�rm�g��ZWA0=Ӂ�d���y��lMvjܾ㊒Wc!̷��/B&����u&�mE�#�$Ҭ���D�Z8
�C�ηD���6���w5v�ں�����^G�^=�ݐ3q��z��@�H\z���Y�����KwY?��f���)�=��U#^x�T�l��;��A�ʐl[g���4]W��o����`��5hK8��h�"�j((�Ss�a���s�eq�`�BYy�ҩ��m]��gA9�Sn�.<�6�j/����7]���1zS��uD�<ud�S�`��Cp��Z�۹��`!�?����)�XHUL��T3+�|�s�	��s�f���Ϫ���[�'�+\���� �S���멉
�␧`'r�KaEj�WK�]��5����С��9���@J�X��'��r�"w,g=���u%��$����X��DuU~Lu�����K�;���_�l#��m�'�ʝ4�ؑD]�	Eή�I�j���X�u�q̿Q
�����z�� Jv�`3��Y�74�Α1ƶƓq�9g��H#t;��;��i�%����`��x�\\.ܛ��+�z&�ID{⊬w���<�$;D��hB��E�/�f�Cm���>�P�sG�M�	uMsDh�1[����1}��ޱW=�Ԯ�,+�~�=:`�S��Ja
��hS�,n�K����x�m������w<�gf/��(��z�5�?�܇^S����8L��Z�=œ���7;� R&cG�%�3���e!�Lk:hFbU1Ǭ�I�Qa����t�GD���d��a�.��.J!�XHO�8�h�y��P�t�PPL&}��Z�p��i~�,}1�y�"u�"�t�h���Y�%}����b��3�KŚ(��d[�(@�i�������/��D�G8黲�A�)�]�B�:
��K�~���iOǸ��4�S�m��[(�k(��[�-�rki/�O������`�k�s~�;96��Xt�He�8��0.��>2�k����#����/���L�2�6��P�2ί��.��(>98	+��p�1u};�5j�=�*駼���=5r��NA���D���Y� <  ')��ýk�3ᕋY���-��^)��6Y�D�c���dR5����� ��ZP��y|΍9�&�d���H�1��O}��f����H�_B����>���BF�,3��p���R;�RLi�ܙdb�i����JN[UM᮪��r9N6�\E��
q�rj��쟥�W�ۧʥ�j#�(l)��io)���~z�����2�IuB�ri)�')(�}B�`3fF�*�%����I�1M������
N̡�iśC~��d+ ��<i%	#sf��8���Ip6L��LR(��)��O1�]:��'���݇F���Oj��.��c5�)w\m��ɲcS$;��
&�rQj؂L��\Ķ�rTU��l��
��߄�w���k�W5�,g�m8��M������D/���$�9��d�0��g��SNЎ�[�㪝
���^!-�m�U���&�}$����r?�Fuu5����89��|�'�7z^�r,�=�ݹBa�:z�ƶ��l���2y���^���f��:}���;šϥx\���lJ�ݪ.y�����0qEA-�@��#em�B�%���L��Az�iF���-���d���9�
[�#75��Ô����D��5�o�jm���d?�ldÚ�NZ�ma���N�FQV,�6�1��W<`h�%�K:q���h�Ff���ٚN5�4� G��5�����e��+���򠈐��
��b��-t/� ����]�M�;|[9�o�\11;8X���ջRq�1�ء��=B��@lڥ�
=���������-eG�(��$�e�G8�VAp�%���\p �n��A�X�����]�E�UL�'x7��As,$����iO8������O�?� �V)�XO<C-��Q�y���	����>��Vѱm���E�����\v&��5��>�	ŷ��.�A�9���AT}����%����?���f0k�@5$0���O�@)�\�����D� �nB.j�;)5Esَ9v��ԎP.ɝm�&$����,D�f1q$�QT�7^p� ި	��$*�]n;�	=--]U��uY-��%-x��q�a���&|Eqh�RS�>]
��Y�rЄ�Ҥ�t9�G����,X��O_�>g�D:9$�
����{6�@ R��Xh��!��2s"'MjWО�p�Vͭ&H�0U�嬉��a��~�x�����gc;Ls����p��Ԁ{)�$?�^���U0�	-�ѫc��@��Q3�c��,�?��0On�?IJVq�3�-�����[j^֖5�I+��s4q�% g���زO��<B�jH��KU/0�W&5�gɐ(�փ�^�.�nǯ�MS�8��t<�/�Z�)o����7��P��l�K
���sG|1�!�Gp���k��i��[kBٯ.������0��0zl?�Y���M� �l�[����o8����v���S�m,c��2Cy�ȧ�=�x�"����d�_3*�r��w��Ќؑ�k>�:l(&�}�$5�n
ާO[:SR�.���Df( �����lWFV��\�9��tiR�H妞h66��ܖb��M��>'偕����7н{���C(���ݢc��bW�����]O on�/���*�j��X�q�`�.�/�߬F#�CO�߫��ɖ)�Lr��u�2��6�0 �/�4�Ck�=Gk_|齛?�W�W� �p�j��y���{2���2��&6��]�2�Ss_?��$C��B���Z�wMɜ��3|���m��j���&�v���CG}ٮ/n��(��B��v����ǲ�����s{K�yܱ�v�Q(�3�=��++|y��m���K:r���VKv�v�[$�\0�w)��-[E0��S[�-�.���2%_�	�:�P�c^���W�{��`y��eH�:�,_��F����0�}T�7)��]��S�L�
B�Sƽm��Mh�ń.2u���k��Í�-L�\���7F7�3c����� Q�js���m��^�������Q��kW�cl� �N���,���\�u��F�]r� ��O�uܪ!J��4R�*lg�k���gD9=��d�$�/�I�<��)USe7�t.G�a����-�Õ�=�M��]WW�������|��Zi��˻��:�q�"qY��������no2�i4�FџMy:�C�,̄���P�ؙ$g���<�6���u�*7�WyեTi2��)���vW�f�
����#�eպP_Ō�6d�.�WݰOIZk2d.������
������jG�P�X�����%}u�ѳ����P�&����!�֋�Y/ޘ53]�!�Ӹ�G �P�|��_lh�[�%�8����F^h���M;�/�uF>8���%���wF}�/�F�x�k���BC,*
�iA��0�� ��)�%�����Rڻ���7`O9 �%�������H��m�����QA,ɽ~U_�e f��{�+]��	]��vg���/QJWn�;��pU�P��3�F�K���n~��܆����m��6�_b��Se/�v����76��28K�����5�}�as ���Gc3�[��P6�H��"	bg�~C��p[(��o%\���K����5�<tOCݞ�r/�	֤{\�=5{��`�N�
����9W�4�@�L��aM�հ�9W�������R�/6�l���)�Q�ZaMD���9ǘ�RK[׋�!�Ū/�Tu^U'�7O$J��o(�ذ&=��kF_Ys'�q��إ]u"	͍	�R�;<��.����'��1����R�����pIt���|0��q���"�ᚄ�ל�T�a���;ÚTj�{>���X��2��&�dM�mA�T��apu^ϖ'l�����qM��ל޶jO�uRd˞\͞`�U�v\��֎��{r�{2��������=��tO�k���fOV���?�"�j�~C�Bk�=\3�-���U|��C�d����[��I����{2u{�"�A�Vu��CA�5ɞ�ܒ�zNNh-䣁i]#��jM���H�r����[�f8L��,.�&��US�n�5{%�<�0�mN����UH��wX�c���R�6���Ã4$�o���!Ú��	��DWy����r����Ά{��P�|qM���>�4vk�9kTW�x{��gX�ZQ_�JhML-�����]S�J�(�jY��N�ZV�E�6�I�����pj��ꬵ��$��N���m
NbX�G��9�v��^w��^��<Ͱ�8�GT�К��hsj�8�����6\<̢� v{Q��kbޢ}��֎O�߿^�[����o������G�k��]I�Ln��k���6��'���vp�k5�ײɃr�<�J<Hk���c΃r�<�{�Sm���aؠ�}��j�F�g�l� eAC�5��@{�S����ZhM���酵L[�/3��Ir�s�{�%��y1X���d�����f3j��A��[���A�\����mD�)/r��q,b]���%�m�W�WKH{KU"KT���2U�[�!5�cyulz��Ǻ(IgT��͵Уy����.ۍ�F����oզn��*��+(?�}�E�P��6��x,U+�;�Emk���DU�6J�"UՎ�*���Ϥ�c]�Y3�����]Q5��O���ɓ'��u     