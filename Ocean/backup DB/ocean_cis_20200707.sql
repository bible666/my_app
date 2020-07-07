PGDMP              
            x         	   ocean_cis    10.0    12.2     8           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            9           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            :           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            ;           1262    132283 	   ocean_cis    DATABASE     g   CREATE DATABASE ocean_cis WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C' LC_CTYPE = 'C';
    DROP DATABASE ocean_cis;
                postgres    false            �            1259    132329    cis_address    TABLE     �  CREATE TABLE public.cis_address (
    id numeric(15,0) NOT NULL,
    customer_id character varying(25) NOT NULL,
    address_type character varying(3) NOT NULL,
    address character varying(255) NOT NULL,
    house_no character varying(50),
    building character varying(100),
    village character varying(20),
    alley character varying(100),
    road character varying(100),
    subdistrict character varying(100),
    district character varying(100) NOT NULL,
    province character varying(100) NOT NULL,
    post_code character varying(5) NOT NULL,
    district_code character varying(3),
    province_code character varying(3),
    create_date timestamp without time zone NOT NULL,
    create_by character varying(255) NOT NULL,
    update_date timestamp without time zone,
    update_by character varying(255),
    source_data character varying(50) NOT NULL,
    subdistrict_code character varying(3)
);
    DROP TABLE public.cis_address;
       public            postgres    false            �            1259    132295    cis_customer    TABLE     p  CREATE TABLE public.cis_customer (
    customer_id character varying(25) NOT NULL,
    title_code numeric(15,0) NOT NULL,
    title character varying(255) NOT NULL,
    name character varying(100) NOT NULL,
    surname character varying(100),
    title_code_en numeric(15,0),
    title_en character varying(25),
    name_en character varying(100),
    surname_en character varying(100),
    birth_date date NOT NULL,
    sex character varying(3) NOT NULL,
    nationality character varying(3),
    origin character varying(3),
    religion character varying(3),
    marital_code character varying(3),
    customer_status character varying(1) NOT NULL,
    create_date timestamp with time zone NOT NULL,
    create_by character varying(255) NOT NULL,
    update_date timestamp with time zone,
    update_by character varying(255),
    source_data character varying(50) NOT NULL
);
     DROP TABLE public.cis_customer;
       public            postgres    false            �            1259    132284    cis_policy_link    TABLE     E  CREATE TABLE public.cis_policy_link (
    policy_no character varying(25) NOT NULL,
    customer_id character varying(25) NOT NULL,
    customer_role character varying(3) NOT NULL,
    policy_type character varying(3) NOT NULL,
    create_date timestamp without time zone NOT NULL,
    create_by character varying(255) NOT NULL,
    update_date timestamp without time zone,
    update_by character varying(255),
    source_data character varying(50) NOT NULL,
    branch_code character varying(25),
    branch_name character varying(255),
    policy_status character varying(1)
);
 #   DROP TABLE public.cis_policy_link;
       public            postgres    false            5          0    132329    cis_address 
   TABLE DATA             COPY public.cis_address (id, customer_id, address_type, address, house_no, building, village, alley, road, subdistrict, district, province, post_code, district_code, province_code, create_date, create_by, update_date, update_by, source_data, subdistrict_code) FROM stdin;
    public          postgres    false    198   !       4          0    132295    cis_customer 
   TABLE DATA             COPY public.cis_customer (customer_id, title_code, title, name, surname, title_code_en, title_en, name_en, surname_en, birth_date, sex, nationality, origin, religion, marital_code, customer_status, create_date, create_by, update_date, update_by, source_data) FROM stdin;
    public          postgres    false    197   >       3          0    132284    cis_policy_link 
   TABLE DATA           �   COPY public.cis_policy_link (policy_no, customer_id, customer_role, policy_type, create_date, create_by, update_date, update_by, source_data, branch_code, branch_name, policy_status) FROM stdin;
    public          postgres    false    196   |+       �           2606    132336    cis_address cis_address_pk 
   CONSTRAINT     X   ALTER TABLE ONLY public.cis_address
    ADD CONSTRAINT cis_address_pk PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.cis_address DROP CONSTRAINT cis_address_pk;
       public            postgres    false    198            �           2606    132302    cis_customer cis_customer_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.cis_customer
    ADD CONSTRAINT cis_customer_pkey PRIMARY KEY (customer_id);
 H   ALTER TABLE ONLY public.cis_customer DROP CONSTRAINT cis_customer_pkey;
       public            postgres    false    197            �           2606    132291 "   cis_policy_link cis_policy_link_pk 
   CONSTRAINT     �   ALTER TABLE ONLY public.cis_policy_link
    ADD CONSTRAINT cis_policy_link_pk PRIMARY KEY (policy_no, customer_id, customer_role);
 L   ALTER TABLE ONLY public.cis_policy_link DROP CONSTRAINT cis_policy_link_pk;
       public            postgres    false    196    196    196            5      x������ � �      4      x��]Ko#�>s�y���m#�ۇ8��#0�{�j�BHi�vS�%���bz������7�)����.nF�l |�[5]ϯ��$Γ������]O����z�^���z�~�]�o�G���v}��;ۮ𧾻�}�Y��Y�������O?���w�����ާ��{�K��O����$� �~�Ͼ��{���_�����_�����(z�XJƁ��J�ڮ�է���v��v}��ש.ҽ(ދ��T	�z�]/��C�}j��Ë�:ߋ��x�����<��7��L�? �y	r��v�-�=W�[=�"8�e�?qE��v=֯5=��z|��@�L���2<i/�L���}���n�u}
�e���G�I�b���ի砤J\n�=�W�#���{I�(Jxq��9&�X�k��-;� ���c8�%|r���1���^�>�2���XY��\_ S+�����D�\IpR&K@�%Py�L)�!n~6�1-N�U�?�D�;�1Xe@��?�o&`\���O�&qߕ'@~pKZ�E�]+
�Ï���-$x�1�*�ԁY*�Xr��+��YB-�s�vϕ��(>�$�^'�P]��_*1"���aJKV\�ݸ�2ə:_��0'�]Y�k�����7eFSya�~�r2��C.*�+-���~]��@ނ<�
`�Hpʁ�������!U����	����M��I�G�'?�'?�o��0@�������§� @�p���W~����G��}�cP�h����`��@�3�I��5<n���G3p�^.��g���~�y�[0@��j7����QM)h���� i��'�x��+�À)��耖�3����ќ�؀g�bv�d*�n���C��2�mW̘j9�#�� ��#���H" �YT�*#O^�2���*�(�+9�Ϛ��6y��$��M�	CP��b��	��dqxM�RF8�Q�먐5��O��9/j�Ze����v��Xڈ����އ����Ǡ�*D8�V�3��>@+ip���~J��6�[���3���[�?��7<9�"�9/\��<���HT 6��m�.��@�D��RL �5I�d@Aq��ϣh@S�� ;:�iN�J;G��JQԵ?�~HQ��-*��m�_$�ì\ȧ yX�yh��<������]GA|T�R��GEƋ1&���XZ8kʋ@��fg��\A�t����!���ʒl�`�J{�J�@3��*�,;�z��=�ʆsn79�
�v$5�С�5�����;rV��vp�8�kKD�4T�V˩,%� ��BMR�A+X�j�P�܀�6˼��Ǳv��	�'�(hA ̟��4����f�C��`9ݺ#��ʍ��9�2�9m��'Y?#�f
�Eb!wI�Э���IC��$�M��
���EQ�R�f��:���_��3<�%���¼}ff�j�bѕ��JF'L����)`%cH��I��|�F�W���x�38���ŸWCQ����j�A]>{�L�h݀�:�!J]C�[��	�E��ʈ;a�E*�m�G���B� ����l�v������4�����
J��~�I�5V�/�M mj�ʄ�v�Z}��P&�?9}&� 2��I�>�8��B�KXk��i�G��ȆC�9�b-�q�%x���@��^"X�%�0���M�(V^�H%�v�^���Oz}��w�7GԘ�TӾ�����U�˻iq-.�<���s2������S�w{pm��B��3�X6�H�E�5��[�L%���d��4x� 0ׁ�L�\R��QW�R�c�j�;��xH?�)B���q)�U>��J�!Qh} ��M��QĲ/�}S@Ř�Lܔf��g`Ze�:l���}�x�Dy������{PE��l��&�xG��1�+��^۲'=�̜�J:H�����¤Mh�t<�U�3�MH��!�����y{b�D������ĴR�_c�.�h�"̘��1UcL��l;�X�p]t@���3Ჭ�ViGT�?�q�z�6�Vkâ��4�\���`Ew���Ѱ/�UxS�kd6��&`zk���^���R�fm��V��J��2b��>�XQ��ȭ�.�Dª��*�8 t�R�ݰ������@��Fc��/��+_�貌��8ri釼$Iyn*|h@�֌J!Lr�M`)r_qd�zd�ѕkă��g��@�p���U�C�%�+*�������Avvb�`NA"0��B��_��ʂ%��P��L��.w�A�{�h�D��ѝfŋ*t�b�y�"����`���? �y�J�r w���d�n^.;�)�1+�$�s�:�]m>��9�;��j�
�/�A�Y�<�佺�ڹm6^A;>�K)�,D���>�cY� � R�.��y�&� 3��1(�Kt�2F���-+݂'��*B��Mh'cc����b�f�{P���(:�g����P��yD�S��qZ��#�Q��<�s+E��9�,��v-]�?C�I%;9A��@�´>I�Z�2�&�܏�.(a�cJ_���fD�/��R�@{�#H"?Ô�`��\�dL�ì�2Y�ԲL�5�R:?�M�6�^R��e`���x��d���ٙ�z��P���^���ܙT���=��0Z��˭��N�;x�i��PՆ9\ǉ�;Z��� ��W4$��_�Q,�K��������9�]�8$]tD��|w�?S}�K�=:|�3H�c�d�M�R�	������I3��՚������0|��xsD��qVFo�H:���Κc�x��/�';{��]�zSV'�������k�%�H	��+��o��ފӵnR��xbv���R���g\���V��G(�nh�ʜBA��N�V+cBs�����<�@�������I��հ�/ʯ�r*�9�Q���=��.��Ki�n�ee:h̒����-C��������V�f-l'����W�{��o]��S���(�������F�Y�bT^��H�f��6�(�*ߏb�h�{�v��������M�H���J�ܪ5|iJư@І��Ito=�Э{[- e��<1>��^��ڀ�~�D�KS�s��Gt�
SIN-��-��a,�ֵ�l�vg`9�2�Iӎ���(�Hh���t3�>Q���V��y'~��HK�:��,�½��5���C�ͤ�2�GqE��-�K�")/��,��T�0H�j@5���hO�ӱ3s7�9DZ`�k+���߾c�(pD��������h�(|7�͔^
�5�ƶʀ�>�k\A1ʆ�3nb���[DƮ�����7S7;�I�8�qMx�3�غ�6sߕ��p��PTM�ؘ�����3 ��m�S��#�\x
?Z����*�v�̎�V�97����(�����,`�bF�d��؞|��"_�侱j��RXk\�����J��B�ʻ@*p�����(���ġ!E8G�h<t����,�����縓��"�s�{H6��+<��Q	����B������\a/����x7�Ki#>v����Xl��S�(W=%� ��p1K���Ú�nq�?^�qTu���B(���Y��M2y��<�Z1��U�x���>����ej����o�F�V�eD����	i�^���^�B���hj#)!}k<��&�h]�㭔��@m����/���|�5~m����is�K���>�yᅘm�ʀ�����2ݧ6����8�+T���%�m�!���	��z5�3]Ԟ�u�$X:�*|N�ք�ưv��3q�EG|Y�"\��QUt����Z�fՆ���Y�fI�t�L�gt�Qm�ϴ���3��Q�Y��*݂�p�j�1 �Π.���f���#��3�h���꭫O���ʹ�k�8s��"�	�Ѯ0cb�͸���5�,i�>��	o$�#�;��#s	@`��ܲb)�v�Ф�t)wËy���ػlA�so,01+��*I�;�Z%\�G��u��v�X-� 0\7<ь��,Ms[��_Qc ��a��7 )  �5+���M^Jn�B���t9��>������Ղ?{���u�� g��Ɉ�Ӹ��K�
��{/���\R�s��{EN��r����.���	�lצ�b3�T`�K�!�甓w�ǬgA�xF��۞i%A��㢦�J[%�G��)I<�~�)Ur����v�G��=�$���[���C�.QK�ҧt_t5''�43 �����w^�Nx���yZ9CD����~
_{�B��h8.�*2 wM��0�Զ�C\�#�uQ�_�TD)�����j Sz���U����U׺'�;3Wށ��IrhT�!��2�o��)���Q��!`�Z�~�g�S��8�O�'v�޺�s*d,��J^�Qz=T��n�˭F./e��nr�h�����������:@�� ��7���@sBר/��d|��
M#�V0܀�� yH��s�~A��tIb��[;Z�@�����ݻ|JA��|z��0�ְ��Un���[�������&�r�H%��~���uq�Kc\ɝ��)�Ԍ��X!�EQԎs��l�	.�2�֧�����r��,�V�n�G�v��C��Mo�K��ƭVi��_@Fv��FCrW1j�+u[-tp��ԕ��/�^�x���U��Kgo�[��\���Ө3�AU�8�n�6M[# ն3������H,/���l�m�A�o��t�՜k�g�t����9���i}�$�=���\R��������ͥ�Щ[�Hл�t�aWc�T��s�V.	���s?���إܑ�x��U~�I��+ZL'����s^�Ix�ޔ�G�!Ӳ���%�ꪡ��y��OU���9�r$�c�u�wLwP��su��Ȼp�8sM�Q?Q�qu���<Q0͢��5�G���å�uP~Qv�b��4(�-P�<���d��3!T�o��wGv|����S{�%������cX����Z��*zͽ�����j��um3 ��`i=[40{t�3�'>*%p��C�
�i� ��BJ��St	�Nc����؉Sm�LS�:�M�`�MXᴈ��eĠ�Fd�x�ѣG��9o      3      x��][�\�q~��|t6�{W�ۚ��L"�� +�;$y5��	`2$EX�jA�bLGZ��쿙����3]sZsv(K�bD�k���UUSۨ��3���$���������(������N�N�+5{��?��_��|��_���/�h^�:�F��rq�x�\<^��f������ŗ��Og�`���Q����H����H4�HHZ!#O��>�K���#:�lYA��,sp�֪(|E�9�ZY���r�X.���/�xf�	Jc�>)�?;saDk�1z��6ra]��-f�q�%`m�z�5<��Ц�;�
P��O}��p�L<�?�5smBr!߅J�j�VK��~�����.No/������r�|��5cvc��K�����pl�i2����<�`��aQ|9�>GMԶ܉w6*'胷Z٤!E��$�?�ܜk���d�m
�}2�Qm�h�k��9�^�1��=�ǂ?�uv���]�Sʹ�L�,`_�qf�4����!�`NN?ƣ�:U���7J��)nAGr��X��N);HTC>TPVA�[���9������13ro�x��@?� �� ���A�I�yϞr��"_��+�)�Z�R�V9�8�-C�!㌚|�oX2��f�A���ҡ;�H"�I
��CM�,	��'���;��`�p=毷���tYP�7�G�y�K�x���MC�%�H���'EIȇ�m����ܫ�l���NG���i��B��4�x���|��:��E����ٸoG��h�����Mr��3�CL�K^�C1�4x����:b��&seR��T4��`��A��'�SsoB�z�#�b<�J4��|�Jp|!����<�T�;Ai)���hӰ"j���|�c�P>��@����6M�:�:�kx�:%���A���o:~�6EL����=R��w�<�,/߫�����?Y)}Q���oҐ�N5��U3It��x���e�b
�#FA
:8h��~t��	?��~�0�V6L�Z��ӂ�����M�\e}�d��#(�i�O)��;Ư#����)�K�l(��B�b������r�cέ���y�b�%�L�@�*'�y�����23���<�Ϸ��_Y.����C�U],��]��Ig�[�����>K�~^J
��X�A���UGiئ�NRW5�D�H**�FX���)E�}��������>��������?�!9����b�}(�cr�αf�k��
���Z!IL�/�5J\�Oj~B����t��m������a�{ʖHi�U�@������L�Z4א3,����1x1b���4۪:�q*��kWU��rWę�=c�i�A�p&�l��x_\<���b��HӦٚ�`bѳ`���PL��"͖�"KեZg1Y�,�#��i��V�P=jpƷ�(�p[Ͷ���
�s�p���y�־Ðw���H �YC��5��k���,&_���Ӂ�U"kI�f퍈%�S�Fmɜ�d��M7ZH��ؼN�;��g?�w����.�)%X��r�,(3.(�?�6��G���`8�R+��G�5%�,d<�'��J(��l)�u�$t*�t��&Mp^ǂ��Y��K�;��w�����rq[��<3ZM6���ϗ�cK9-�<�NԡA����VNΒtGAЦ!�@�;����f�ϯ�.D��z1Լ�7�z!�PP n[�N�M'�G3�',DL�����VB�mGqݦ����T�d��%;����<Z���T����MCw����UO1fx���J��� e����6I��p�;p����f��!/h.�m���I���4�{l�/�P�������x��`�q��h:ep��`�3��>X��@`xц�,sC��O�X
�v�K��8�M3
���6	�˵.jo�~|�Qеi���2vV��7�c�,���,Vl�6�@�u&�2�Fo�'����}�M�=��̰Զ�-�j!B霁��B��F�a���H]��I�eY1n��U��6�J��t�6�(6}8��^��@t�鶣�>d�d���F�b����l�*yoRT�X��읎XN��p����4t�tѠ�ݪ&t��#ᩥ=�t
%t���IІ�(}�q�g!�km����p����&�4�b�0Ԯ14sS�-T��V�x{J�!g�>�a)��i3(��{��(�û�zh�9�Ӟ�&��%�������"o�k.)�Ƃ�l��4-	 ū/�b,�5U��It��<�5���W����T=��0�Av��{I+0�
I�S0VҦi]��� (:���@�:�*�b�$�R[�t�6(p���N*�d�>sXć?�TN{-�k��`I4��Q�'r��[���~;���&KE���_����e"�Ԫ#ǻ�;i�DS9g1�k������n�9���g�0�I����^��1%��)z��8�˪�"X��&=�uD� �����#�=�X�MBO$�vR��U�5�>R֓ ���'p<�d�.��1&9Wc~�kZ���
��A�Q�Q#ri�e�gv�j΅N�Sܪ=i���E4����������9;�/�B��rv��A�JeF��;�Q�Jb���w_�N��Â�O�I츧���I��`z1c��te����
*���uV�Бy�i��Q�P�D�*�o��<�e׳v�\p!J!�udIm����V��x����It�jp�X���Q�I4[s��v^���7��}�z������xo7{�W�6���Z:�f��iw���u|K˴�]�Gw�bdA�Z.~�#��L�6�fYť����"%���annyT��S*�~��`�Dӿ�iHo���H���,�MC� \� J��4�Gۚ�`���Þ�#���dKf< �zY�몐a���b�X�����&��x|Q[����ުbLX�h#�fm�~T�f�7����W�]O�v�5��٦D��"Q�K�p�82$���3���a�@�b�Q��nV`_{���3_M�nj��aX)�F��S;*_����< ��+���a��iS��E�Bf���1CT9�o${�{�<f��n����r:�B���\.ah�#��u��r�*:M��u0:��J����4�F�\��>ex�,�8��=�TNN��G�k�4�V.���O�<	���F�*>�坱�YN�k��#�W,𽰝��ͨ�̯a]�U��>�\h�cmJ��g�̾a#}�_�?�`���X_[�VD�n���2ɳE���s��4G)5����4�9�ԭ�`"�S뚦�9��hȩ�X��B�z��π�V�g�7��k��>#�}�K�M�q���b1&���'Mmv �H
d4�V��U�o� |0=h �+���~���x'�l ���ᇽ 4f��혿j��W=��~N� V�T�gh�w�yLID�nw�J����CQƕ�;��h�NXc�]�S�Qhp�4'�N�*ta%q���2��7��EG,���ʹwj��������h�-���%E+��W���F�x�IW��Z�6��Q+��1CL��.���a��U���&�/�(���L[bJ����@��WW.��������J4&Y#j�$�n�޸)�'��:���e�#|�{<@)�T�O�6ټg�&)JR�qm��&�o�.a�Y�c��iĶ{&wh��KH�4;��9�_������U�P�7�I�)����n�_��l_�Z����W�5��,@��[��x3��
Ƞ^E�I������M��1����Jئ5�Q�	+a.�X6�T�<�׎s��7M��`@7oq�v�l�)�l"$]@L�d�;Z��.�T+P�Z�j`������b�M0�F����q�=K�e酸�$6&�B:k =E��CS$�(LS�a
Ҧ��M��E ��Dѵ��v=�n����5_��W��q�8U��
�s�(KAC�4��D�0�Ʀ���xJ�h�c��?z��=���P-�_���P-k
��ςn.q�q�c���Qu�X4?���q�I�ɋ���'��Z�ks�z��H�_�~�g7������h-��5;)S�.��j/���| �  �ءҺ�Tf�bSi���f �_T2�댊��^���9�㚖�$�M���]��FrN�[.U����r�_�P��DPJ!�JS�qż��:���:x��Or`�z
 ��9�ٵ�����;
��@��c}af�9X�ʎ��M�	��I0��COO>K����>R��hk�`��j���7>�/�K9=`���7����1�����<�G
��U�D�ZKU����S�8�lō4 $��Q-�hFa�����`-���)��ج���0�����(�<K�U���1����s��U�2�����B�ާ�NA;�x��ޝ�8^2'OzR��s[^r����ڦ�y����'7˅Do����q~V��\ߜԜ�u�� ��Cy'���ۧ'h
�$=t�$%Z;|	�h]���Q~}�d����D��+�0gJ�ׇ��	�<<��޴-��o��f���Fˀ�do��A|z��n���]w���r��g�t}���L�N��Ӻ�W�������0�x=�k#ƣ$=�Y<��W��#���Qև�h/D[�,ܸ�uB��n��u}�����&��p #�k+���+�-�=�BJ�ٴ]]��x���mu��ox��đ3�o�C����s+��Ե��H�vu`��e��:��*�濴ϥ���f.;Ah�Gt����KG�R�:R�6�����e����GʟC*P�ɊNx҈P����L}�?��`���@��H3s��]�ml˂��X�&�lݛ�7*gQ���M���^�F�	��:~'<w�1X�f,=��F�	��U��	�Z��6d7mCn ��ʣ����������0֭�[��(?��p-���:�d�浱W��<9����Y��"'��l����W��Ô$���A(�+\�(ɷ_���?������5     