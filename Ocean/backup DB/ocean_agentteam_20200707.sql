PGDMP         ;    	            x            ocean_agentteam    10.0    12.2     5           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            6           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            7           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            8           1262    133683    ocean_agentteam    DATABASE     m   CREATE DATABASE ocean_agentteam WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C' LC_CTYPE = 'C';
    DROP DATABASE ocean_agentteam;
                postgres    false            �            1259    133684    dm_as400_phpagmt6    TABLE     �   CREATE TABLE public.dm_as400_phpagmt6 (
    "AGENT#" numeric(7,0) NOT NULL,
    agphon character varying(30),
    agmail character varying(35)
);
 %   DROP TABLE public.dm_as400_phpagmt6;
       public            postgres    false            �            1259    133689    dm_as400_pspagmt1    TABLE     �   CREATE TABLE public.dm_as400_pspagmt1 (
    "AGENT#" numeric(7,0) NOT NULL,
    agtitl character varying(50),
    agname character varying(50),
    aglsnm character varying(50)
);
 %   DROP TABLE public.dm_as400_pspagmt1;
       public            postgres    false            �            1259    133694    dm_as400_pspagmt4    TABLE     �   CREATE TABLE public.dm_as400_pspagmt4 (
    "AGENT#" numeric(7,0) NOT NULL,
    "AGREL#" numeric(7,0),
    "AGORG#" numeric(7,0),
    "AGPOS@" character varying(2),
    agpodt numeric(6,0)
);
 %   DROP TABLE public.dm_as400_pspagmt4;
       public            postgres    false            0          0    133684    dm_as400_phpagmt6 
   TABLE DATA           E   COPY public.dm_as400_phpagmt6 ("AGENT#", agphon, agmail) FROM stdin;
    public          postgres    false    196   \       1          0    133689    dm_as400_pspagmt1 
   TABLE DATA           M   COPY public.dm_as400_pspagmt1 ("AGENT#", agtitl, agname, aglsnm) FROM stdin;
    public          postgres    false    197   q       2          0    133694    dm_as400_pspagmt4 
   TABLE DATA           [   COPY public.dm_as400_pspagmt4 ("AGENT#", "AGREL#", "AGORG#", "AGPOS@", agpodt) FROM stdin;
    public          postgres    false    198   \       �           2606    133688 (   dm_as400_phpagmt6 dm_as400_phpagmt6_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.dm_as400_phpagmt6
    ADD CONSTRAINT dm_as400_phpagmt6_pkey PRIMARY KEY ("AGENT#");
 R   ALTER TABLE ONLY public.dm_as400_phpagmt6 DROP CONSTRAINT dm_as400_phpagmt6_pkey;
       public            postgres    false    196            �           2606    133698 (   dm_as400_pspagmt4 dm_as400_pspagmt4_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.dm_as400_pspagmt4
    ADD CONSTRAINT dm_as400_pspagmt4_pkey PRIMARY KEY ("AGENT#");
 R   ALTER TABLE ONLY public.dm_as400_pspagmt4 DROP CONSTRAINT dm_as400_pspagmt4_pkey;
       public            postgres    false    198            �           2606    133693 )   dm_as400_pspagmt1 mdm_as400_pspagmt1_pkey 
   CONSTRAINT     m   ALTER TABLE ONLY public.dm_as400_pspagmt1
    ADD CONSTRAINT mdm_as400_pspagmt1_pkey PRIMARY KEY ("AGENT#");
 S   ALTER TABLE ONLY public.dm_as400_pspagmt1 DROP CONSTRAINT mdm_as400_pspagmt1_pkey;
       public            postgres    false    197            0     x�mU�n�8<�_���n��!�h�`�M22<��~�����0�j��ե�,O�Ɵԉh�x�dI��=�d�ؗ�t�hͳ=?7�K�>�8�T�:!��%��ٺ��	i+��<���Ɲ�A"�S;�.�M�5͂�G.ΜLd��^�4��F�-���m�m����u}����q���3�A�GR[n������~�O9i3S�^oe8�ugt�Ļ����?��~�5\�4ˤ�������������^o_$$c����QO��Ҿ �06����������ы��Ȏj�V:c�(��h1�pؕ���=�j�t���������>b3Z�Vd���1�9�~X��s��V%��S?�2��o���������]�3u+r߮��~�w���zQJ��)�$Ӊ���G/΋zqhm���>b����k%�#��6XzB�9�}�lC`�����nNr�W��:�O��a�]�p�IhA �p*'�tF�f�4����׌LK~,ۂ��	e�7�tU�rB���,�<��o���8>o��N�I?�^P��sbЉ:I��u��-4�L �F= (��M�8����yRkUf(Υ���z���t����.T��(��2��� 3GȮ ;6��l�(���e�
T4�Q`*���(�jHAq�,.��R��U>��;abǒ��Bj�ꂎ�ށ��.�ߥ�2�dbRbC�x|ҫRIK�3������\uh͌!/V� aǀX(�V����!��8�������?��e6      1   �   x��RK
�@]7��N���=�v�*�S��X�T��69��W����_f� ���\�K�p)|�n&�g���O�To-��YH��'5Ol�ӟO�UB΍l��������)Q �h��A�0�|��^����.�,rcg�8���_;�#�mx��m�R�q�
;�U�k�x`��\<��]P���-�\��?g���<*l�i|�~����Kr�u�%"�Iӓ      2   �  x��Y[��0
�v3G ����Sȏk'�����ˈ7�Z�(Z�Q|-2�Q�Q�,�j�G�W�FD�ҏ�EJ��Q+_(���ʧR���^�����oR�1�.�3x?U9�6KߧCS
Y|�o��>�a����Ԡ!���o����k�m
����(��st+��R�Q��¿G[���-��a�h-�~ZR~O����S*�B���a�R�W�ԍX5|5���7+U5v�ߩk:��#�4*�`P���4N���H�a�d�)�a�<Y�K��uD7-5����N���-��6d�[[�_�4ƣ	!���S�6ç��5me���D�)��=&�L D 2�[fhu�C�嚎Ӗ>p�Jm��GM0�0�W֑PS���13���u o�"��+m��H�*�O������X��I�CUl[�},����Yk����F-����Y�@��)�m,�����zda�0aB	mp#��pJz1E��mxU��:��1�!���q ��_ &�>E��p��v��2��)Vgn#�R|���bp��>e"MwAm5;l�E����|T�D-P�����nٱ"�&G���w����
������S"*K�_��+�vp;�=�)p�G��2�e�D�:N"�N1��DZ�ȏ�������|�-�Z� Ֆ#�,�G<N����W������2�e;�=ͳV���<���,E�S��%s��c���oQK"&�����uJ��s2MK֤���/"�Rt}ќ�g�>��*C��O�j�(�y�9����~c���a����d�q���|���i��8���Vr���b��*5%�сJ�f��.�z�,cocl%�&9�ZdPC$;G����cb���}׭�>\�O�q�ʕ�r��d���=���d��W�8��<n�)�g:Q�ˮ����+9mǌ�U��Η����q
f�HkC]����
5r����m�#'�޳�����D �(4��96�x	���'����äqo�ɂb���^�Fx2�dԳ�2�p�&b����������5e���j.�|�������z2�\�xѹ�F�u�.���AM!)xR�<%�ܳ�e&ۏ��v�����,HJ� i�b�7�9�8��LSɓ��lɤ��
x�$b��ȸ��J�~�b�?)9	�wo>���צ�~�fD`��cM{"��Ԣn�h^/hu[S�����gv���cD�����dg��Z���5��J��B���w��%s�9f���Z-W�و�KDkW����]�v��~��O_2�A9���܎
�|��Sx�����;�������͖Q^��������;A��2g6��'b��1��l�#���rg�@<7�5K�F0?��dN1�&`@�(�M�0��c�qy�|6<�V��]ٌ��U�B�My���ɊB���s�]��0�ָx�KY/�E-ѵ-�ps��O�co�y��(_2���@���>	w��4_�Wp:tO�=e�� �|!3�=�'?�|!�q���qˠV|(Z.=b�;&�{'7s��3@߲�'?miz�S��c{�7d0���!fڢ��8'a��3Ǯ�42�S�m���dm�񬗞U�9���0����e&�9�:\^�~�i��F��O�.u!���}"���=q���`�@��>_��N�1}�%b�Ķ�ˉ;��fW�ߏ �Z��y�x��;��̑�I��dJ�5��w=�~���w~Fn�nI6�[VyU� sŪ���\�mGb�m!C���D�w2Ȑ�~�ݗ
�y�s��#�:C3���5�GfN���g�����D��ް=�]k��/����(�����'{�����B�z�F}ɸ.`��68�FF�]��MGp�wg�q�*o���#z�𖁆�Z��3*�9�s��� "�i��N!'"�u����&-�4�rv�..c����[��ǖ�ԣ�p��u��^�6�l��+�0�o�@t�r�����L1s;���cS�[���Fʸ�^[zl���-�F�w� S/̺s+���1���?���%��.�ȵ�>2�^��)dļ;+Q�~㽧�t�4�(�z"nۏ#�KFꑚN����=��ɗ�!�7����[�f�ʀ�eTnK���U����-��~��E��f0ob����v��L	���isF����T��R��ϟ?����     