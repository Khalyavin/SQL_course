PGDMP     2                     {         	   northwind    15.1    15.1      (           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            )           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            *           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            +           1262    18129 	   northwind    DATABASE     }   CREATE DATABASE northwind WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Russian_Russia.1251';
    DROP DATABASE northwind;
                postgres    false            �            1259    18378 
   categories    TABLE     �   CREATE TABLE public.categories (
    category_id smallint NOT NULL,
    category_name character varying(15) NOT NULL,
    description text,
    picture bytea
);
    DROP TABLE public.categories;
       public         heap    postgres    false            �            1259    18383 	   customers    TABLE     �  CREATE TABLE public.customers (
    customer_id bpchar NOT NULL,
    company_name character varying(40) NOT NULL,
    contact_name character varying(30),
    contact_title character varying(30),
    address character varying(60),
    city character varying(15),
    region character varying(15),
    postal_code character varying(10),
    country character varying(15),
    phone character varying(24),
    fax character varying(24)
);
    DROP TABLE public.customers;
       public         heap    postgres    false            �            1259    18388 	   employees    TABLE     s  CREATE TABLE public.employees (
    employee_id smallint NOT NULL,
    last_name character varying(20) NOT NULL,
    first_name character varying(10) NOT NULL,
    title character varying(30),
    title_of_courtesy character varying(25),
    birth_date date,
    hire_date date,
    address character varying(60),
    city character varying(15),
    region character varying(15),
    postal_code character varying(10),
    country character varying(15),
    home_phone character varying(24),
    extension character varying(4),
    photo bytea,
    notes text,
    reports_to smallint,
    photo_path character varying(255)
);
    DROP TABLE public.employees;
       public         heap    postgres    false            �            1259    18393    order_details    TABLE     �   CREATE TABLE public.order_details (
    order_id smallint NOT NULL,
    product_id smallint NOT NULL,
    unit_price real NOT NULL,
    quantity smallint NOT NULL,
    discount real NOT NULL
);
 !   DROP TABLE public.order_details;
       public         heap    postgres    false            �            1259    18396    orders    TABLE     �  CREATE TABLE public.orders (
    order_id smallint NOT NULL,
    customer_id bpchar,
    employee_id smallint,
    order_date date,
    required_date date,
    shipped_date date,
    ship_via smallint,
    freight real,
    ship_name character varying(40),
    ship_address character varying(60),
    ship_city character varying(15),
    ship_region character varying(15),
    ship_postal_code character varying(10),
    ship_country character varying(15)
);
    DROP TABLE public.orders;
       public         heap    postgres    false            �            1259    18401    products    TABLE     I  CREATE TABLE public.products (
    product_id smallint NOT NULL,
    product_name character varying(40) NOT NULL,
    category_id smallint,
    quantity_per_unit character varying(20),
    unit_price real,
    units_in_stock smallint,
    units_on_order smallint,
    reorder_level smallint,
    discontinued integer NOT NULL
);
    DROP TABLE public.products;
       public         heap    postgres    false            �            1259    18404    shippers    TABLE     �   CREATE TABLE public.shippers (
    shipper_id smallint NOT NULL,
    company_name character varying(40) NOT NULL,
    phone character varying(24)
);
    DROP TABLE public.shippers;
       public         heap    postgres    false                      0    18378 
   categories 
   TABLE DATA           V   COPY public.categories (category_id, category_name, description, picture) FROM stdin;
    public          postgres    false    214   <,                  0    18383 	   customers 
   TABLE DATA           �   COPY public.customers (customer_id, company_name, contact_name, contact_title, address, city, region, postal_code, country, phone, fax) FROM stdin;
    public          postgres    false    215   B-       !          0    18388 	   employees 
   TABLE DATA           �   COPY public.employees (employee_id, last_name, first_name, title, title_of_courtesy, birth_date, hire_date, address, city, region, postal_code, country, home_phone, extension, photo, notes, reports_to, photo_path) FROM stdin;
    public          postgres    false    216   oD       "          0    18393    order_details 
   TABLE DATA           ]   COPY public.order_details (order_id, product_id, unit_price, quantity, discount) FROM stdin;
    public          postgres    false    217   CK       #          0    18396    orders 
   TABLE DATA           �   COPY public.orders (order_id, customer_id, employee_id, order_date, required_date, shipped_date, ship_via, freight, ship_name, ship_address, ship_city, ship_region, ship_postal_code, ship_country) FROM stdin;
    public          postgres    false    218   "s       $          0    18401    products 
   TABLE DATA           �   COPY public.products (product_id, product_name, category_id, quantity_per_unit, unit_price, units_in_stock, units_on_order, reorder_level, discontinued) FROM stdin;
    public          postgres    false    219   ��       %          0    18404    shippers 
   TABLE DATA           C   COPY public.shippers (shipper_id, company_name, phone) FROM stdin;
    public          postgres    false    220   ��       }           2606    18408    categories pk_categories 
   CONSTRAINT     _   ALTER TABLE ONLY public.categories
    ADD CONSTRAINT pk_categories PRIMARY KEY (category_id);
 B   ALTER TABLE ONLY public.categories DROP CONSTRAINT pk_categories;
       public            postgres    false    214                       2606    18410    customers pk_customers 
   CONSTRAINT     ]   ALTER TABLE ONLY public.customers
    ADD CONSTRAINT pk_customers PRIMARY KEY (customer_id);
 @   ALTER TABLE ONLY public.customers DROP CONSTRAINT pk_customers;
       public            postgres    false    215            �           2606    18412    employees pk_employees 
   CONSTRAINT     ]   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT pk_employees PRIMARY KEY (employee_id);
 @   ALTER TABLE ONLY public.employees DROP CONSTRAINT pk_employees;
       public            postgres    false    216            �           2606    18414    order_details pk_order_details 
   CONSTRAINT     n   ALTER TABLE ONLY public.order_details
    ADD CONSTRAINT pk_order_details PRIMARY KEY (order_id, product_id);
 H   ALTER TABLE ONLY public.order_details DROP CONSTRAINT pk_order_details;
       public            postgres    false    217    217            �           2606    18416    orders pk_orders 
   CONSTRAINT     T   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT pk_orders PRIMARY KEY (order_id);
 :   ALTER TABLE ONLY public.orders DROP CONSTRAINT pk_orders;
       public            postgres    false    218            �           2606    18418    products pk_products 
   CONSTRAINT     Z   ALTER TABLE ONLY public.products
    ADD CONSTRAINT pk_products PRIMARY KEY (product_id);
 >   ALTER TABLE ONLY public.products DROP CONSTRAINT pk_products;
       public            postgres    false    219            �           2606    18420    shippers pk_shippers 
   CONSTRAINT     Z   ALTER TABLE ONLY public.shippers
    ADD CONSTRAINT pk_shippers PRIMARY KEY (shipper_id);
 >   ALTER TABLE ONLY public.shippers DROP CONSTRAINT pk_shippers;
       public            postgres    false    220            �           2606    18451     employees fk_employees_employees    FK CONSTRAINT     �   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT fk_employees_employees FOREIGN KEY (reports_to) REFERENCES public.employees(employee_id);
 J   ALTER TABLE ONLY public.employees DROP CONSTRAINT fk_employees_employees;
       public          postgres    false    216    3201    216            �           2606    18441 %   order_details fk_order_details_orders    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_details
    ADD CONSTRAINT fk_order_details_orders FOREIGN KEY (order_id) REFERENCES public.orders(order_id);
 O   ALTER TABLE ONLY public.order_details DROP CONSTRAINT fk_order_details_orders;
       public          postgres    false    217    3205    218            �           2606    18436 '   order_details fk_order_details_products    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_details
    ADD CONSTRAINT fk_order_details_products FOREIGN KEY (product_id) REFERENCES public.products(product_id);
 Q   ALTER TABLE ONLY public.order_details DROP CONSTRAINT fk_order_details_products;
       public          postgres    false    217    219    3207            �           2606    18421    orders fk_orders_customers    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk_orders_customers FOREIGN KEY (customer_id) REFERENCES public.customers(customer_id);
 D   ALTER TABLE ONLY public.orders DROP CONSTRAINT fk_orders_customers;
       public          postgres    false    218    3199    215            �           2606    18426    orders fk_orders_employees    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk_orders_employees FOREIGN KEY (employee_id) REFERENCES public.employees(employee_id);
 D   ALTER TABLE ONLY public.orders DROP CONSTRAINT fk_orders_employees;
       public          postgres    false    216    218    3201            �           2606    18431    orders fk_orders_shippers    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk_orders_shippers FOREIGN KEY (ship_via) REFERENCES public.shippers(shipper_id);
 C   ALTER TABLE ONLY public.orders DROP CONSTRAINT fk_orders_shippers;
       public          postgres    false    220    3209    218            �           2606    18446    products fk_products_categories    FK CONSTRAINT     �   ALTER TABLE ONLY public.products
    ADD CONSTRAINT fk_products_categories FOREIGN KEY (category_id) REFERENCES public.categories(category_id);
 I   ALTER TABLE ONLY public.products DROP CONSTRAINT fk_products_categories;
       public          postgres    false    3197    219    214               �   x�5P;n�0��S� E��;�:0�5#=%B� 崹}i9]D�|?ꉶ�B��]���YZ�C �)`{�X��[���6�������(u�|�r�2��/���N'����lN1W��E+����RUHYb6�S=U��^��h^�d?;Kѝ,�=�}	Ǥ����w{'��������*���\6C��"7|{��*�A�#��h� s\�?�S�f��I;p��/����	�u�l��|���             x��Zˎ"I�]_aRK��RB���t�<���Ro�/w�D������Lw�T�QI�h�j��9��Hr�KU�Y���ڹ�{̓�]�ǂ�S*W�+�\��0�%�4<�W2��LD2�S�Oe&�\��A��B�����m�5e�1��醡��^�;?3����Z��_Ǝmٵ`̧,���ŏa%����C���?�h��+l�˔��h���$��0/���ט��O_>�˄�wZ�fk0>��C���[n�v�r�:1]���xsy�	&��>?2=�"��⼒��<��~۲�ֲ�~Y��9Ҥ�W<�H�MҘ�7�Nd�+���m�놆_��A�|�S��x�(�?:����g��^�s]ϫL��j���~FG��`<�Y,����{�ڤ8�>����S��]�W�ȓT�iq����2��<��aV�m��fOr%c���^�nZܱ_��Zs<`�(h+R�­�e��2��&�7�w�� *�+8��72��"�Ԝ:0�y��]��a��x4�qxOf�U��� ����0��]z��:}IC ���\��3E�V�=ksb�{���R�~t���`��-�"]������a"^J�yGk�v��+c��zm�<����ޅ+` �E@�n~�%�d���|��� >��=����pE6�`7��w~y�8�/S_�ã NHb.��wl 
�{�E��ِn��)� G�fR,7�	XR&�Rż�i�e���0��e7,�2�al>�X�'�z;�"��ҡ�D�Q,d��0^&Q̂�����&�g�I<x3:��:g��w�Z�����Ѭj�_�*ܛ�f�#k�Ö$B	2�1\��{��)I��7�'��a�`��"��`�ep{4�����o����̋��q�~<��MD��K��,��3<�� �r֒i�	7M�5�~b]� 4]����0�[��v�����k��h�£�<M�2����f�\��(1��b- `}���A���r5��7�����L߸Np,f��Of �d_�
	�n��f��:�%�(�b��h�a����MM'�	�#� [i�m���<>{�F$�_�xv�&l"W��	�#�89���/8 ����"���s�'���(��f���Y8�T�N��c���Ѭ�(=%�j<v��Vpd��4y�o�[���G.�q����T>�����й3x�7àP�N}�ޞ�6k��/�"Ͷ�bj��Q(7)�QD�L��#��)d�64�B��~5}�*Ƕo^��0Dnm|Gt�	�8�"�q��X�E,���/d�
�
�+S:���eUx���� �"՝�>��u����'b�
�\�!�1�x`����{� �^9�����k'k��V��隵Δ��B�P�^ɈM�%J5+�]"��ج��8| �1O�r������u�2��ȩ��^ څQU���*A�c�J�c%h�j!�Ʀ�����+Ќ|�fh6����{�B�]o6�M��w8�p)xg�hĖ��p�#�A��C�N�4�nop8����"=
$.�y��L�m��-nY/S��Y�CƼ� \3�F�ݑ��DI���/�{^=g�C�Ƃ�,;}!��9���.	��+�2����N���K��i[�,7���g�m��� ����O[(&�EHTN>����R.yi��\r|:e��?F}������2"�������7����$��[���_B��<�~	Yχ"r]���-[W��gp�Rm T�A�x����<�a޶��&�������0 ��XS�g�6! �'PMD�
����͗CR�D��<i�9�9��9Aj���[����{�A��:Ɩ��&�+���b)"@�K��ȑ�̰U@$&t��B��Pu���Q�3np��AA(�2�l�Mk��l�Vݰ���Į��N����T| �O��8�%��*`	2A�2��qS�[D����E�鿄JcM�.%T�Z�@R�p�o���ܲ��L�ݏ���O(+��%�&;���	�����.�ϩ|�D��tF�ʅ��1��[:�j��Ш$S����t �mH��!�%	E)�9�Cj�X����H�� ����Y���]��WDg��N;̦R��-�|�$��Ne��	~��y������D�Ɵ�g}�)�8HmS滖f���w�f���3et<�2��A}z��X��q�ß��q�%����7d�pᓔ ���X���t��x4���̺���u9�ֺ(ƧTo!���4.�ri��н��MV�BNIT�1��6�t%��(� �p����%uj��2�7�Z�7F���xT@{��C��"���o�>��B�S��D1�|s��YR,"��~��M%@E��WdM6?�4�*�Z��Y��&���(�uF�-�-�u
��<'xto�GL���k���X�j����[I	�8�(��;�m�/j�5bB��3�7�q<תL�uԚƗ5��"DQ}�79��,�^;���e_���*n<�!�@�@�"`�
�5������J����Fh���֛�9�eJ��Q�+���B���<Q
[���%�������'���<��i#l26u�N>�*�����?B�qg�a����pA������D�/g��(2R5���/Ε�n�nE�*���fX-��@ m��z'�*��!j������$.x;V*�G�:E���(�� Q���*���6��q�]�:�A�ֱ!�d�$y�?M
@��*7Q&��>HP�!�#SB�TQ�WL;z�u���1�~�oR�`��3E�\nP�>�4hI*�s$̩��CV�)Ku(->[�����I��h�q��]Η5�u���A���},�����Ol�H(�`��� ��(����>��{F��ԩ>�c�P�:�%
��Q��+S�0��Nw8c�b�L匜6�bSo(�,�'�,S�喂�SN�����6�JOJͰl߳�c��0���w�~�G|���dĿ�i]e�\�{���gE���xm ���$}& K?���*� k��g}V�0�.ʐ3��'�����}�8�]!�f�~9���ơ@&		�uB�eN�M�	N|mښW�k�i�u�g�:q��2G�6��:U�K�x�;��`�#�+����e�Ħ��gJ�i$v�}�F�3��4�� @2{�AAj�ŀ�L�n;uݸL|�N0�:�,eM�'�V��{u����sq��ScD@U.�|
mA2R�J��I��թc9�ap�4������D⟆EB\߇�����8�4$��*9P�'�����Ima�Sz����6 �f���u,�7k�ኸ��I��e �I9�mS����o�M����ʹ�,/�٬�:N�)�<��N#���(�H���z�ag�s���H�R� �e����|e��?)j�v)2T)����/YW����y�.[?s*/��Ԯ���>Bݻ�Sq/�"^m�,gA$?SZB�'�W��eI]yn��2�C��4Kw�1T���e���Q��w�H��wI|M�_�J��s�6Aٿ/$��@���U2{t�>�����=e�Zm��#6F�NQ��]Nx�+�`��[Cݒ<XEB/^7�}�����g{6�)�z�O�GM��K���x�~�q����R�	�8�I��ƭ�� M�Ze����.���DB������K�Y���y��|��q�����?���m]��8Un�|�Q]x����&��
&��PT6�4׬ ��KǲLh�r�M �gP���<۟�Pk8�O_�r@Ҿ�T1�2i8�{� �q����=���(cS{�,$�͖�0��a4���uk�δ�b(t�%���_YH%�}A�(ݡ���|���U(���-j�����ʉu�+��Z�1���cQ��no3�'��W0\����2�n�o�M�"㥷�؎QqבY�L{�� >K�	��*�ƛ�������Hno�CR�3q��#�y�&�k;o���i3�������u��`@u�U��	��o�d��B��x�q�   7�B�����_Յ�a��c5�SdH gm��A�4�AD��&'Hے�@���l��{(<߶>=�N��#�l����L}�IR�.]<�>4���x.�2���_%ﴊX>�h�ĵ���[ae���^V1�`�격jv�G�I>�/������W�@� \ J���i���rQTN,e>oa)yc����gd���|f�Bq+o�oY��]>��R}
V�]��?6B��X�Y���L�2��j��=J�\�C���@�H���8���ɵ�$�2$&)$KL��s1��I��u�UKʨ��0�
ǥ7�c��
���RED����zS� b����p��L��J�b)��{n�n���|��1��*��=�*6�C(�7�lH�xࠛDo���P+G��)�qL�a|�롼�54��M��#0�tE���=+;y���gz#��G|;�p�Q��FDPo�<�B���_��a�Z�c֪3]�͂���Jd"~n���E�^R(�O��˔ԡ�72�Vl�w�����p����C�:��y8b��� ���-?vX<Ⱥ�GI~��&
�@�K�o��uV���'��q�5�eu��<���vi_h��_�u>vf���$vVv�2�%i�/�y}���u�)���x�`�?�6�F�7wЮ^��������f)�2�UN����0��	hq��(�9u���B����>.~Җ1���:/��@���	�r�tZmuER���6���g��,&t�}��j�W
$��Nl���p^��a���
��2�zS,k�S�~ ��/������nE�-7O2\˷.�4�T�~&�%U��g���\͋���"/S�6���a2��}z���]��@[Jj�eK�$$���1�b�y�YspD��Hq�{aY�8Զy��S]%P�_�D�ͻ�f��7te��~�t�>�|~Nn],�
� ?}4@����80�֢��׵�锴�����J�R�ɓ�0Y@n�z��%��6RNx<F����*�7�M56�3��ٖ�9gh{t�r�z�g���!��<�e|����?� x�n�Εevc˃�+Mmy��j��m�W��MWߺa�����6,O�tEj��j��RăxM~�Da�����˥����W�>~FN��.S]��_N���n�ҞQo�AF
��K�F%C���������R���~�l�yul�TvWf-��F﨩/V>/Ss&1���2:��������l�,���#e��5K?L�
~ԭS��g��`������]��1��및p�~Dr@R�����P/D�
��N��(Yc�(NJ7�"��Յ�<A�:�.\i&4�K�ּ�^.*��.˃Ė[���&z�rUP!DG��|.�݁��.��ztsj[ϩ�]�u�����&�e�D�8$3Q, W�d����?����w�b!�%�R�S��u�r9�4@��Ml�2�k���ݧ��0%���/6�,��#*�<��J �T"v�#��`G������t$��9�M��8y��.{�� >�2�nTp�_��I��*��b����"/��qd��H4܅���u��eX{�=�H�xM:���:ke�,��y��Mڰϲf"o��G|y��>+/]zG��(��ۃP��"�Z�E���"��E�����bj6��0�7e�uvi���R��2�t�{F�N��)���e ���EDw��F�y���,!~w���2���6�
Q���V%3��q�n�<���q�q<�!`�@�6�?��q�~X<gG�EYN=���C�.���Q�ߡI�'�� ��Sy��ʔ���ұ����MWf�?6j������      !   �  x��W�r�:]#_��Se1"E�������Z��7��$$bB* ����� iI�(שrYV@�q^݌ٕxֵ��h�[�ZZ~'�FZ�:�ԳdK�x��Fq2��q���h�l��OƮ�g����]l]ē[I�\-�Â�gq���;K�ӏ<˲�|��,K�9{|�Ůˮ�i��-�D�_,���]Q�Zov|mt�/�وR���G��UnG��y>����\�V�B7�Z:Y�{|�0��5w��MJ~)�:���\с�l���5�ZX��[�-~��<QG,a�s�}�$��E>}��;)��2�=5�	���kiآ-�|a�Q�� V����{�ٕ!p3 ���y.�N�|<���*'j� v�^�B" ��7����M�, N�F ���/�WI#M��e�+�-q��*���;ux]��S:�n����
(
6���"	�u����_F�E����(���F�����4���W�u�D�hw\)�k�i����(H�N����؀A�M��0;N����(�P��1,_
�"�x��7��?�������][:�T�$� ��_Vbx�2 ��
,��Z��ߩ�m��x�-�ՠ�`�����"[{Yy�M؍5�a��tr�tBʚ�{����<I�R[HC��E�\F�oe~�(5�l<����$�!�I�y��Sy噺X�Rn��hQ�FYgz�^h��n����Ϡ��cp��ح��8�,�7F4��Zk������MLD<TB����=��=�2�t{*~�ϱȼx�y���_DxbRv+a��'��6d�xj&�h<��?��:ai���Sw�l4�9�瞛�m�����|����r����V�ⵂ����-�)�8d)�}� �,����AN�l�N�В�; @h!i-==��-`Amڀ7�q��@z�&[:INFսb�u��*��Mſ��`��ap�,d�+*h�e+~Zvh`�}���C ?���)�,�s���kj%[�b>�v�~����8����%��������-;AB��Z�!a�A��ڑ�m
��ty�'$�4�?�@��������%��s��[
�)��\�s�i��bl=XM��8�9��%v������8����i� ������%{�(������W]QHk��^�rߤ|�9j`o3�T����������l���R�[Y����0wr(�K���d��;+12-�����^gח	���,�s�B2���65h�\�ꬕ����rq�e�[ݨS��||mG��C�Zk�" ����n$��ly�m^��ې��D�?!�C��]��� �����U#�)�=買F�Aq�~�움쁶߈���	�ǋA�����[t�n�ae�+<���X��).G?Ds�����Sn'>©����Fb �u�_@���J�T��=�w�c>_���e�K��φ8í44ѩ 45h��J�x_%���l-*D�>I�+3�&d�}�=����$Hij#�}�К��2������+�&z=p��U7���JP��@k�ҘS��82���Ѽ/`cv#�E�օ9�Wۥ�և�Ц���gq ��2K�d�7�8�x�G�ћ7,;n�q<��d���H�~,?���;�V �Q��������]�n��0t��ľ'�1��+]�x��F+�8nN	�$���(�XN�ז5<�������Ɗ,Ř�hZ9L�������z#^�Zr�c��O���� ��c��Ç���/      "      x�m�[���D��Sa�0�;�q\2S�u"��Y{�BH�\�OJ?�������6��g������5������g���>�[*k�OM?�w�E/a���75��~R�_4��|h�C��׵�wwUQ� ��o�&[sX��E�y��Eԟ�<~�����dm�X��oY�Ơ�C�'��b�Ї��ކ���9E:���h��ۤ�O��z�����T:j9j맾�����ۮ��nа����}0������4��.��Xi���F4��M6�N�5��.���.Oo���xl��.*����n���w���c�ۃ��orH��;���B�4��4�%æ�]��^{�hf��?V8�y�^1z{t��3_B'+G�3��EvI껥%Y=6����J�s��d����Q��������� ���4u}��w���
d�5�}��������(���;P{��#a����r9˓K��9>U���@lv����=z��z�R��[[���}#�\Ch� iR>)�K�U��M��z�4�&��O��iI@HǴW�#����A���r���as�2�d.,�����H�=Bo{����+��K�xO�
�,��H�*�?^�q)�1���"T�\e/�D�*��[5���/���+�k(�h��ߦ�KҐ/���'@��"�9�F$=�\�tS��N���_Z�iO���ݰ�=j���nS�g��&������������j������L�[o��	�3 m1|(Q���2M@��DsM�Flh�DuIQ'��u�D ��U9��'#ae Q�$9IB�w7�0�շ=�_��x�^-�g����?BQo�]�:�^�.�k��Y�}7ZZkN�m����w�;[��Vy��Dr���(kث#)�)���@�^r	�Vc���qP�����ԁ�������q!�XhA�����]�Y� l�#��]�.3"g����[֏�C�.t+/�&��*N��{%�~���%7���)��]�- >�UD����&�O�_$���HC�����F�+���t�"C����h?;1\g"#|� T8j��M�	˷�)��R��2x��F�Q
�;��A4��M��= UD''�*I�#�Q��ۤF�_�a\z��%K&�v�c�)��\GX#0,U�����Z UD'�.Yk|l�G3����S��K�yI����l��6Sc��k]Y˴5ȟ���s�����ݘ-���)#���j�iN��ͻ⎪�1d�� ]���0�`Es�>�1ϳ�Y�/�|��~*�k��`�ʇ~��h�s�5&W����F�b�6.lgF0�����x~�W�5�M�=8}oa-�|u�����4~ӶԳ�y���|A����Ƿ%hK�Z6��Xy�k=�ˀ�$�"��K�rïްr�7���d{:�̣��B(c�M'l,�W��\�)/��>uH�&Gԭa�U?�W�s����L�!đ"dN��Z)���{L��}d�;��w�K�غ�x�2hnޏ��%�����C���т>So><6��ms�ۂ������A1�ϠDB�}�<q�>��-vNj:�bo��������I�q,8@�-��B�����ɸj���q�^w���H^�AO^	�W�B�����#�A��I�zֲ��6����b�?.^���~�ƫ;8�겛��N���׺�����K���҅�WN��)�`"�yv@��f`	�+�/�v,��ⱅ=6���3+��B��O����}����)��~g	7P��US2�Ee��W�RSKn����m潦�8��mȀ�;e*��;�ǏǑp��T� cQ�J߾�Fp���ȁ�q`OL���}���L(N��U>F�R~!@�c����͛�>!߃>����B�l��k�_r������=F{@���h�����E�K��m=5�{8��`�8��H{r.w*w!mMMH��?x��z �]�a��qf�MOF�<���Gݶ��+�޼u��� ��º^~��Vâ��q��:SVc��V�r��xd?س�5�_�%G	ޙ5�Q�qs;��Щ��t�`�x�Y�����W�4G�ԞU[n�h���	]����K� q�������W5���@�;[P��l0Z�"���P�*a)�r��b�7U�����7��kCt��S^�M���r;l�Ѩ�z�?����S��G��gz��¦�� 4��2te[S�d�R��M�
mf2 tP3��C�~^�\m�~	�|�'<bH�k�!��zZ�Lr�"1VXM��k�xj7��E4��5�18p{d\���$�>������y��g����U��������m?㚌�h���"3��� �"�U��eq1����H���(xZ��*p$��\�]rhP�
����[m5F)z9P?�c�_BCy��;��U�6y����v���Ra-;S�)��Q% O8O%��y��Go>�a	�g���t�n�`�a�ض���@���V����MyD�S����9�M@�9�j�ׁFGG�7�U��L�j�8��a8���r�\�����K�xX���8A?߾0�狨zt��H���ȨF�/�W�3rNqڛ�;U��t�� 5W-q�O�_��+f�� �#$�jB\�S�Z�>�OFnu���I��������t���(���?�s���	)V�Ρ]DV���*tn�|7��x���=�* J�0+��qԘ�7���kzL�#�"e�<��4��|<_����d��T߽E��]gp .��� 7��)],>V:�c�Gπp��6��~m~�m�>�WC��4����h���}`W�[~�_�+p�L;c��Y
=��g���f����y��J�	��:{��W�h3[Q����Ztl�uor�����,JC�7BV;[�^�>�{O�r(p[�!, =�=�3E>�)�L�19r�}C��\�ʿ�P_�	�O����������mS�<��i6�!k��<���2�+�)��JBw�@���a�*a�rJ�����h@�^u�-�nD*��a���u��[}�BWc���7�\D��q��w6�-r9��L�lU��Y]g����Y�ﭬL�:�x�̩���h�?���areW��7�Y���ᙡ��W)��%
78:+���	|��1D�i��N�6NO[O��/yH�O�Ӽ��4�'�b �����ܻp�Z)�=N��#�A0W�$�bA)v�!=럣�jR?N�#w̥��@l��-b����7»��{��6��g3���E������:[��_ܞ��v&A��(��wv��}���=��_��jĂ�YG)#}�f�g�Xs�͍n�v��r�}��w�����s�v��J��Y�Z�63H�zWH�{l���g$�а���t����;څ�m��[1���@�>��wL�vA���v�뛹���axC��q�#e���޳օƞ���W��V0��z�%D�qt�lio(sG^H��1%�G��q�����p�-=7\���j�fԔVvf=2�����Y��Ě�!V���m�ZP�a�{�7����c��;FRU>���Bo����3͹��}6+)���Έ�G�0�RI-?����pU�琰G����8�E}/u��"��K�GD��[�l��;�A�(��ܸͲ�m⣟D*EtR�|]��MՂ:!�w��F��xڡ�T,��ʏ��ϥ)m���Ш~�A^�M���ǎ��Sg�E��/����E��<5p~�����em@8u�ټݲś'��h��P˖�����	���/A 8��xm����0GdKQ�B��}_~!���k�>E���a����v?Lh�uV��ut�OE;ʘ-�8��'g͖��Ѓ��cw�p���ֹ7��u4n��7H�Q��X�e<�'֑ީb֭' �T'��@Ӫ��<Lh�ܷ�MN�]�Z�8��rϨ��K�!cz��{It����n�1�~����|\�j���uk���B�U��0���"b��F)�����6�Fl`+v��f[gh��K�����ͱ��|5�r^
c�x�D��U�p��Bz�ȻK�	m����:���Z�ܽ	�ψ�iW䨴LM6db�N	3N���عv�����4    �A��p�������q>o:v.cخ[s�Y��M��*��-�Ϳؙ�u#��ѯ�$hN�,���M����i�_$�?��2݈�BG)a_k�%��(M�Q�s�`۠{{�dOh+7����t�7��9,Xh��v/i���̳^%A<��[�k&��1��������|I��v�P�ѳ9��(Bi��HQ%X�^eb�]w�,��_��&�ղ�$�������6+�{4rX���=j�'k��ɉ�|�4:)��@{R�X�d�?���*"�V$���cȈ��.���B���ϼ؟��5:^��@�`��v�]�cP?q�f�� 4������GHoƯ�'L�K�|�V�����X�`8)9�����%��"(�`�&�+����u�`$�������=Z�;��G=��7�0Ts|Fsr����/�I7�٥[x:��#|n˖��V:ff��(Y��2ZY����޵@y~;�g�3��;���"�w�U���"X-�KP���u�o���ްx ����Xz�M	�qY�d�:�p��5�f^>�(4�3�������ϣ��"�BY%��{�h�����Ch�ԉ:%x�<���K���A�B@�_Ɛal�;�m\���s8����ѵc8�4WvP�?�ȭɍP��K-�5<MHO樭�؊��J K��'%+����w�Ҋ�5�����2~d<��k�����r�U�L�$(:��9ME+@Un�U��n�|6��a�X3��&�^yl�J�������P���ʘ4<ljL9O�|g}�!��5���XL4�� �1't*z�Q>s�*�[JC���cǦ��`�q�e�t(��6=u�L��װov����s<�����n����vd�Ñ���(��͐uV�޵�@;����J�|^T���-��j��'@9��l;KD�_C�JQ���r7�j?��U��r�?yh ��]W����/���';.,�B}�T���)�v�0�Aߢ쫺�?��^��Q|x��R���nx4R����\�H*���W����ftGV���-,����˰ .�=��W�G:���I˖T>�T�yd������W!B�:7�W`y.���rW�7y�P#&DG����x��4�������:�A��R�(��w���|�io�h��H�xP��%W��uT��r >HBl����tJr�j�R��~3��hȰ���H�Rm�Qe 
�&��6kLZC���=�&�k-�#j�޺��Nu&�����1z�1e��I(ZsQ�)����-�'��W��Gfٗ?��V:5�Θ��i���Jo�#n��_P���������m���‮T�!�-Upj.$l}b���gK[	�ھ�ON��=++��^�xٹ�����о�:�����{��>�m�?�k�@�b� BG��O�e���ʏ����h�w��QoC���#8'�=F�7�Mƹx���2��\g_�{R����s���b�s/q�3�5���3A�Ɔ�ٙ\y���ۋ�HeU�Y�^`�3xGGCV'�B��3��W�\�>;��nsحRN����;Gs��D ���h$ ���	!'6��a��N_�`7�S0��-{[�óv"�DW1�0�+���O�3<]Em��
�*;�&(��{�啞�&p���<�島�ʌ��=��y�_#�w+�+�Ku8>M�l���{X'U�\z����τ7,�����{�HZ�������C��<�v<�:R�#YFHM�S��T��o�X����b�*��n��k��`��*Tu:�	^�4o�<�SK�F�๘>*SgB�y���:��0�����
�]( ��"���=
|��.�+�*9g����9�1T�:g/�E������*������H�>0y�]Ǵ�:���򙆡r��o4x��>V�#e����h"����+���R��F~j�^��\�>��a���]7`zs�=<�3�+�����tO����˟]y(A9�8��Ү�8cJ,�E�wܮ+#�	��v���t�c�6�$r�#D��e ��zd��<' �Q0J�
��kXq���1m�z1���^���f�d���I:1+��>��F��2ռ����3J�	�����c���p���?�T���2�r3��/���i�ڕ+�X���7���>�� �Yv�2d�( �qt_���Q���OFŔ���]�B�oB]V$xv=Y��l99'hvdģ2gH]�X�٢�sp�Ue������i��ʃXW�����n�{���%KAJ�[��3��'�tk{���[1*(kw������|����v�ԩ�i�j�a9��D��	(�V;�#�X�+*ꡲ�Ax?�r,�O�s����Q��
Y6��+�1��ZG\�W;�3�`Ox��Ɣ��Iݗ��.BSr[�=����J�v�v/_G�a�[=�䴤8k����~4�~�_�+���F��e�ū�_ã��>�>��=�.�o���E�������;�����K����8�s�P�U)�>a�"1�<����R�����3hw�qA	eϐ�l=�H��C�iD��Y���a 4v~oQ����c��{'�P��I_	�czn�ԛ'��{z���0���=[9�;:�\����P����W�)'Coo�ԉ�9%ox�&�h^�`E�ɸ\\a�����1ǁԏ�2s�4	K�s�c���ϵu������EOWR�����Wz���8�|��*�<pC[������Ac감�����e�:b��o���I0�	�-��>(�q1~�ղ��QD!BV­�8�+�~������&b
�B�!��3�>�	c�-�pFqv�}�����!0�ط[d�6��8�Щ�
�#ū����MȺ'����P�U����	Z	�柵d��%�a����y*�ai*�U������̞�r��m��}&R6�e�c��Lů�n��r/6�^��H� �x
~�)w��^�%7��5HG����0Ӹ�����Uc1��k�����><��|��C�ρx��v�͜��[����s��H��9s	��L����|�T+$ճ�o�@�{B7t~n���s����o(,�;W�7f����Dh����䯯k#����x��H��o���G�AVD��{��m�ی�CE�3���^f���Ж|Jkj�LE�tyD}�����'������9�Iv�g��?
�ޢӺ��D���YWY��U�y|.M�����V/�^��Wr���z�x[�����c%И#t`�����'܁ J�k���6*I��e���!�6/n�B��2C�G�V�%Wum�2"tZq��g��g5ˈ��J�rR��5��fp�����;7�{���V�!e��Sgs�(5l��.���x�~����R�e$���X#qR�� �gKQ��I�ԣ�`�6({��,��n�&D�5<����w���|R���*{��?��f�W���4�i����m|�\�̷o���2�_�P���BY�~PGͣF�G׭��s]������]vp'_Ξn��&�4���ѩQ�[{��ً_�����뢐��o�Rփ�/�k0α���9�=2m^a�����M�z&�]7���!u֗���al�dWy����*õ�r:v�;�J�/��	:�laɏ�/z�Or���L��~v�|�C3G��/s�*1�i��������V�!��}�|��侞����7�m��I���� ���]щ9�)��d>����o�X૔���Q��f��ʚ�$cQ���:��L��WŀۭA�_��"�f<e���L���h0����3�}��Ӑ��q���w����ŏP���q��롚+}�gpV�G*��^D���H��R=՜����c���k*���)�sxzWRS�Ok��$��>%��Pצ`��a�G��Ȋ��_���)�둑Õ��t��>�&K.*��VpQu���R�`�s�c�oje���	�Ĵi��+>������3�n=3��� "d�]�w*�}ٌ�֝� �� �  ��&>w�Ҭ4@w6���@����m|�V$&/��L_�)��{�?Þ���5ݴ�Sk���l׺�q�x�s�v� �I��([	���cF��t�R��@�R�����B֨&��`�r�FWη:4p� �\t�;�F��ૐ��t��!ec�o^�n1���ȥ�"���W���|\�+�˽d�p�Ҋ�u���ϋ���>
�,G�
?S�����ovd�;vS\��SCZJ���!dTQ��������D��
T+�	���8���1y9\1;ˢ��0��D�G��$����c3`��R��Ŀ"����#�za%��yU��Ю�x3v9� �ފ��T�@�͋r�_*����K�Me\/KH�f���{��x�vF쩢�O�7»t��^un�2W�?l��t����〗vy	�UyU�"Z���XՃ�\Ԗu���b��#�����U@��!�M�)ԅ�,��J� ���Li�J\h������r��[-��@[��J��G+�1OrѢ�8k��b��s�E�ޗ�E.��QR�'��9�?�{��'}R�ڙ�O)�������ߏ��',b���_q>=�Mo�ߺE_{�&G�^�).]ţ�6��oM�����I�:��%M��hH8q�.����Zy�K��\㛒��턴2�~��c0@a5�|r@֨���x=�������]��Qqp�� >��j��#Y��1�^,~2��zڏ:�����'��XC��ȸ�KI�T!e�`��s�����v�m����r������6��k�ל�yuK)D��<��d�~S_���5�!4��CE�U��-9:T���h��R��w~&�U���=QpwM�r���A�~k�c�M��O7�̏ͼ�¶�G����G{��#77�m.����VH&
6����'����K^rk��=\��`��N��0<��h~<dF8:C�Wmp��\k�#�ʨ5�nt��y��n�FA!;����([�#�	`�+ o�`�g�m����4�tQD�[�mt΄,����6�2�*�=�zH�����a�˷��������U};`ӳ�����Hxx�r�	��1�aLmX�Nz�n������]oAJ�ݼ(�I\��=���#h�_!�e�8/�Ϫl"�HH7�b~a��k�,~4�!ݶ9:��H�R��I��6�����ym�\�ύ���]��S�|j�|�p�/�-���>	?�k��1�j|��"Mm ���NRU����7-h����Ƿ�������x&9��$H�{4H��^0������rM5 �9���>޵��Et�<t�����9��ǫ������F��Z�0�w�2��$�	�mv�ɿ�kc�K��Dv�5���<CsQt;���h���w��@6�E7�.�'� ��nG�����Y���^���?�Ή�!���]U���U��r_� �K�5�@��V^|/�ѹ�ɝ����	��8���Z�8��u�ۨ�\_S��_Ӄ��F�t��9������O�A�͏reH=�Wٴ�`� �>�!��Rm7J�!�|]�>~�篔`�����W��s���ᚓ�q���z�t��C{�V`�	tT�mx$m�y��rL�<���LJ�`[Wh�;���]���opT������3Ӏ��d6&|��Jz�� ��ct'�nt}����/	mB�m�B�H|�����F��s���s����#~�x���0:�����f8.�z��0Zz���ʩ3��0/�!�_�x?��b$��!�j�>���#�q�,��*��U{�s��%�c���]3���7���"C���60�#|���Q�b0H�v�\KR�8���F�;��J��%\�%�����}���c�
�\̑�&5T���!�۰gxYW���Z��qZ��ո9}<��F^ԧIa��{{�����!�#�+1���������V��v      #      x���KoI�'~��,�})儿ݏ$EIl�&U���^Bd���T�&U������ ���j������򋭙y<�#�̮����JU�/����~�rQH���.O�f&!�g�{V��G����
��Lɉ�?0���j�����b��O�ٴZf&��M��U��wG�ߗ_�캚~Ze��23BE�bY�o����W7o2�!�Yt�+�>CL���.>����/S�[?�e]ͳ��tU�W��$��\<��>�.��^V�O��B�"{utyt���w���@�Lf�L��^��r9�O��Zeכ2�[�oʇ�X|�[�]O��ߗ�j�\d׿�
��~�͎��/��哷���{���L��Ұ˷�M9��*��y�Z/n?f����d��S�����/�9�ֆN��_#����\?�&�_�5���l>/��	 �~�Moa�ǋ�Nwy����m�˥1��}��U��q������}�n>���Y%gX�(5�)@��F�f����zsÄY�nɾ��RN���,>?[m�/ �S���S6��$OJ������ ���y���Z�����������,p�i�?U�
�'J�Jn�A>s�k���uv�.�����Cn@Z���
!����C�������Zvid��V(�$��]5�M�֋y~���b�.�˲��"���r��װ��]�������3e�^8���,9���$)����A��������Dx��	/�e�K����TM��g�؋��Y�^W��ϔ�n�y~����_β��~{?�/7 �Pͫ_6լ�/�����ͫL�h�L��D���K�9�]5�^O����ժ�m���'��ۣ��4�����	߀��N�$����;��������V~��]Ç*�И�r�r����C
Tد��.������{Q�o�W�"�z���5���b3�)�w3c& �W��4�*��l�(΋�~yڹZFa�!{��f$�p*p�	��ߟ>?��
<5��PTϫ���`�Q�J�����[��(r�[*�Y�%��x�6�sk�C��p�`���z�s^~�@��%a����K&�p��t�W��r���o�mS-���E������#�V�h�D�jh��5Px��T�o-���������ò�b ��:��b�1_���?>�%u�=�׏��C��[�x��ۏ�Hn�y�Q���\���Ɏϯ.�d�o]�!��2$}v<[�z���cY���q:[eR����U�z���{��7k�������%W$f߂;�~��i0٬9p�D�)��]�\OaY���Ǐ��ӏ�z��/r��m&xf/��FS�]]�[";����B�L~J?�c5�	��5��As��~3+׿�Z�{q{_����$w�g/��n�������R���Z�R��Џ���]��_W��������u#j����gy[���/2Qx��A���^��51|��`�M���5����=�-`����j���Y��\��}���IvS�}��˂ `��pE}���2i|����N�Jr�N�]:?��� �@an>���_��W�����
�L�&���Ϲ~�ۺ���1��1���5
�&��!0鑰!�B��p@��������2���W�"���?��f����-7 ���ˇ�V����l�����tA!T���N� �\���3@#���dG/��`��:���J;A�X~(�e:��A�ᚯ�g��n���>���7w���xN�҂�Uv�Z���Aj���u9�k�@A��~�1_���kA���&^���7ʜ�ף���I~�˺�-���4���u&ܹ������l��Ȕ 9U �Z��b��"r�U�6󻏋�:{U�����~�eJz���%܁?�~y�����S�ʃ��6����*�~������L���i���_�k���U�44�x�����7����HPU�*�U�:���A�P�'���N~JN��j���DprAl����j��+��yd��������yb�%P�'Ag��.�/�z�	���y�����=�U�-�w$����w�F$��d�5q$A�y(8�7Y�
(���z=�]�?�,2�H/Z��0��x�!p��?Y�,��T�"?/��q	�q��K�^���_������e�mBw�5AӋ���(�ej��O��vv^�L�WC4��5\*?\��`��c�a�y�CZ{t��P��{��+��&�F�ՖK`�Gw�[r�W���->�����w��M�����`޾����˗'�\e�3�V�u��D�>| ��
Ɣ�PdK0s�^�t��/�)\�%%��M��n�OȒcl�U�z)Q3�nxP�p�^����#_�p�7����9=���|�}��`�'Wg|�;(uo�aⲓŧ�_�Iq��M�}��ӷ��|W�`�pg�l��#�7ZI0��R����}�ca=&�2{{}��;��v!wDo�L�Ns����W�N�D1;�?��x4�>���rj��Vi�F.f�OD�Ë��11��6��G�OΥ�W�fN���k7��ɻ�v�$���G�����2��lmF��KQt�|��Y1Y�6V$��
.�͇qS�;���	�����˗W|GL�#����Pï6��/���3p�g�.��׵ �2��~q���y~�(�@[,?�?P��g˪�S!�j�]u��3g���al5�`3"��B��k ��7~=.P v�.�w���O�p�6���*G������gG���p��٬��  7��z�H.b:T>������aD�ݏ�T/h�q"�
������%׭�K��p躼\�y9����ۇ�}���N�9���w9趛�'�(�9�{�y�
�(U��w���Hwت	�1����tu���;Z��t�g����.�X�?���2��jU�3 �
�r:��߬A��o�h쳣�Y�R�zUp��_Ζ�]*�@�Yv�斣�Z���=��H�2�hD
�}�jh�p��f>`�\.V����I�� 5Evu�'��kV賣ˣ��Yr?w�KI��vG(7�Ϳ�����\.�;���{�E���ECR���
��7�Ӈ����b�{GH\���*eJ���l_(�U��H��W��gL�dw��]����ʏ�Жb�	��Տ?4X�w��f�a9�?��@��qu���2�-1o+5�����&�o��l"������6x��5y����U�F�vK���JSrinw��,4�@�e��MXLr	kQ%_;:.��@J4.����KGsz"���\ݳ��Yr�-��m�@�|�B!��G��^�U�����f��\�����\���
�y�/~�ߡ�go���ݛ�GR�p%����<��@q��7J�S#��j��Lц5F�jpK�3��	��ykLJ��硶��F�D�- *b�Čc$e���;S�)��Cb�
�B�^�G	�>��q��ÛSpv��6�H$�V� ����-V^ ߞ��og���b��5J2؈���9�p�f�����e�Be&~���3�c>v>� ��}~J��E�y_�(�}iP���5� ���i1P7G?�e�_�Ѥ�I
M�f�S��|6[��|�w`�~����	��S0Zg�3�\�3Q����=�TgR4����������s���'-��%HP�n�<�}6Ӝ��e	NЩ=Z��gTt��^Si|/إ���\p[X��$8����*P|/��>;�R��/7V�F�lԋ���1��}�ɫ��r��K>�e�{�O�O9n (H��|B��O���/�3�/A�]%�o�#L��D)��9�3p
�^vf�%��9>���o0PXtuy��*�e�VR��c�3��ϟ��\���)A[�*����b왻�rqz6q�b�&J�㒘������C��}AP�.������b1_/~-g�6���^����D��a-
A�-� :�!�CdHo�p�u�b7��K���x~�2�He�)ej��NKv�Lm����d�1Po��.ϲ��4GZ�}��2X���'��2?[��!���{ N����[���k�����`��EV���U
�KdƢ�����Px�D    �5_Z)SHvH��*�G&����#c0kǺ8��U���JQ���NP��#��n�.���@��Ë*����f
dp���b������l]�s�����}��<
���j�Ŋ&��GuFW�t_���0��$���(��R-h�	���>�u]P��[|�)R/V���QڤL�;���":�R�8�uuC�_N��lMVP���H�O�1]����Zu��&"{QR�50��aQ�E]-���.�����2��(�����]���#gn���n��d;[P�A����������,�\VZ�����x�`����S9�����V�*���f��zv�X.���������h�����W�>-h=��п�TRY{Ý���R0eG���G����ޜ��\��l���\ ������v1[������%��t5C]D���/�1�L�k��|�N!�c�Q�U�+������o�TX��HL��.�:P��n�b�1Q.?�[��Xޑu�s@*?�E�����\����_j��tq�#n? ��%��ĉn�q5aR�� �4��1��߆���G��$[�|����?�z�k�����]s���_��p�M���`�Vu�
x ����,�*��&ח���ۢ��2/U��l�tB��'E���U�<�L��+le`����F�5H��~Io����F���G'���v�W2�#6����������͚�c�����%�3����q��,�$fBxzt�ŗ[P�Ub�1x��������d1�W��)��2�k� /+�bLx�����w���|{u�w��`�K�&p�Gs�[��f��"[����vr]���Ḱ��Iqu��>:?}δv�T�:;B��&���rF`9��*f�?���8���2��������T�j�Q/���j�&He]��ы�َ`���\ߚ	����f�
[]���O��l�.���uy��|��pG�M�3D��K�Xd~�ٷ���_�6�9�����\Q��Y~�[8�H�2n@+�KU�؇��:F�14��Xvz����5"*�-��|�?l�
o"�����S��,(���r� ?���{�[%wĝ��0Lј�;\�z C¢��0��������
�պ����i���_�_��l�� ��\�\� l�@��R�\F����͢E���e5^DS�^˂��d�e�2�M�@3e'�5��j��$��,�/j:������t�\��i[GD�^y��N�c���0VDĹ�i�������5�虇Z�2�L���лPWS&B��y�<A�Dj�zJ��&1 ٳ5�c��&��.R]�}�D{�;[7	�9�^֖I'����1n4���v��U͋�\$��M��� M��"��^���b!!�`���7�Afο�`�=��x�����֑���s��"ʍ��a�X��K��K����_�N\P�)��_�@*@8A�f��X~��9(�*�����v�d.�\,.�A�U��J��`�?�p�A�+ޯ޾�`�Dv��ܘq,e�^/>={�@��F9��߮� "ȏg?j����${+_��B3����Z.-6#X�"������~E��DG큡�S���`��cD�o`�)��w#'�#
�N�'�Ec�8v�Q3���~p��3����WztgHD�F`!i�A�o���z���8�.fH��ڝ��A]e��aX�HrL)�]�L��RQ�x)��k�����}��>`����jb���M�N�v��qX}q���+�`v&���Uy��G*4�լ��)���͈��0�h�$��	��w�df�8�օ���=�#;BG���h�U�
Ս��q�
t��(�W��Q�v?�砦$.�<k3��D�*2��_�_�MY,�j���l���u�]n����t��\¯t .����� �|v]w�̛!=Yx*�F�5`�i%r<7P,����������K.о5����R�
���mq�،����r�Z=�JmNo�_��)��:�jBQ�8j����7��+!�,�Ưn�;�9Z��}�F);_ߕ��l�a���.�x����7��o�+���Qv���p*G�e,�t�Q|=�����v���'~�KT0�c9w����a��;p��xز.]J廑���+N�A�����S��60�,QS=՘�a{c$Cr����p��!-�c@���:H9z K�}��be�J��9Wv������p��p�}ZO�A�$���ւ�t[���1i�e�/�n%c�1/�:����i,3練��'1A����kj��M���W� x9fhN�X-uî�d�U��5��Y2���i~3�<9����!V���@�B)�/��\�~�_�g;���^�gI�$��9�.�A�bW'�a��Р@�~��dE�F�>s��U�:��v�ʄ���c�H�e̓U��|G&�FE�襏��e��K��]���J`�ʈ�=`1��4���i%PE]в����k�:#P��8=��d�2��K����23�p�E��*�h�b��]����$���E	�{
�Z�5&�r���#�;���E��h���\�T�Hw��V�����<Z�B�f����u
LP�ȀĐ�yrũ5�<�3}��L{a�+p�;��w�����V�6?V��K;�VpsrP���H�yLA���0���+g�jM�Z�ш�:v���\�U{Z��p��.��a�7x��=&_�M�m]���"2��-糍d�tQ��4�h��S�Q�N�:8̦��k�w�&�L4����GW#*[�E�EJ�F�E}��ժ6g>��m��
V�3g:I�=�N�X��68W�����ԞH]5PCjL�|��D%|5�P^��x5��3M�TQ�b"tܙ&>���W�:� �2���k�����9��=���%�C5���<:l��ּ$��\p���G�����[)�Qɏ��o�k�oi#z�9�dv�fd
�!��q�:)^�\�F2�k������6MA�ઠE�f&����@]3�4*��2tc�kp�Cketbbc�-U��2�K�wP��u�!Ѱ>em\�(��1�*������!�g�\$���|�q�ij����i�]���&�U	�����ZL��b��4ı���<�����h.����2Yt��b�����X�:��
<�E��],�F�oM����Q��䟀�\ �����sӂ���.�`����4x.qv���"�����F�q8%Y�>pA��G7k��Fe��u_��>� bHy�Fm��39*:H�ϖJ,�zmծ�$�|O�lU-Җf��������}p�� �U��S�d]���a�X�	B$�T�i��C#hDr3�6IE��A�1g�h�4�m|�0k�2^M���
]|VT�!���;Dr��"��;�z��+�؁ww��3�M|�z-��x�3�UP��$���%�o��E�t4_{���o�Ny��R��ep���8�F��k3J�F[����;Jig��Z?�k�&��5��"��?��u��Ji~�7t��?/����_�[/�ԙsp®�D����7��߁>(s�'ِ���͎��p%{۠�ohƍ���%Q{@���bI١��7�V�E�a���'���+��K�m��N�S7�T�o�弫��_�"+s���7�Ĳ���XN�e�2��������c��<��<$?
�<���b1mN�Uq&Է9u8�ȉ��O��h�KctZ�cג4f�t�̍�Gf�{FJn�f1��k�v�hF��A���c�qȳ�~���Y����_��n~4|멳Rc��y��p�	8�[������ T����"䧳O����P6p-q�P/r�Z���p�|��M��d��w�O����3����8,L�#�4NuO�\F��=��}#Mꈕ�w����P�"�zts�I��E����?É��1����w��E8�{r��}�T�?G�x��C��ViWЋ���K0XP>�c�2��Ǳ�����G*��ia}��w��r�
T��?@��?��D#����՘"���:&&@��z�����;���� �8�{S4I�0�!    +��$�6�p�}ងԱA�C:c���+���\�� o�#���}։�h�Lz�hp��Y4e��l�|lj �.v��4B�"���Q��!��𐠁������-^'�1��|fp����N��\"����|]O-�0�g=˴����.\`�Ft>4�Ĉd�_J�w�Y c2V���FE/�a� �
#���O�����~{�7u���?�D�y	������Y�g��:�
��']�_N�n��w.��1�o5�Dus�t��4�QxTc�T7p#����e��qכh~��c��2v��D�5p��Q-�rC;�)�4�f>�)c��
����s_p�v>�rvR-���"�y�{�\>s�Mٔ�[M���`o�� �tE��n�~�pQ���0�){��FI��_rpՖ�[�Fצd�$;MU�X�t�h~#[E�!S���Θ6�V��.����C.J���Qׅ��UbG��+�q�\��
%����]�d�)	��#8)1�q��c�bk���n��.���M�/�,�#\D����������>�?;�\��q�����,CL��yBǀ4�3^��d�&�:U@Eph�̀"���nZ�� �u[+q�b����~���W�J���7��ci�#,��4r照F�%.Fi�v���{�T�;��U�̾�$4��*����x����_^.��B�q�c,��myb71k$ݎ�����˘�a٩D�To�w<��S��GU-�K[�n�e�N���b邿���ۃ�xo�P~({LS]]g�I@S�s<R`X�rR.��k�ߔ����Gv$�6��w���h�\IM��̗Ǣ@�20���Ǡ}r	H�X��ڲoBԺ~:J��2Eo��I�<e0�Hi]��NK2I�j],Ē��uX�X8 ���pLO:�ۡ���SO����:���~�#Q�c�oܰ.�kߏ�R�s���!QN{pۘ��ʙ�{��V+&5�����i��I2<��`�m��7�N	#�<�L�cwW�c��PR~�<�1ͫ7;h����u�R�C8��u�T��bY`��� �1�h%�?� �K#qyG+q�MR��s�������wI�i2~a����s�����vF��[����ɍڮaL���^��T��@�8�?kFz\�	�+`��sf��/�=��A�#;������"YL���.)Gm��t�YK��Agn��m��o̚5c�����跈��0�=N���M�����y�T���ۑRu����6:���p��d��K�Ӌ}�T��P������h�*�=�{��3�Ϋ7��I5\�Zx�|	�0�+D���03�������X�����{	�\���]��~{�	L]���(��8��
��dx0٩^�"�M2M&��.-��4�!���k'8앛X,C��~�/��k�#Qi����F9p5��?��㱰��R�A��ZP�W�/_3��?N�s�{�p��� �1D��Z��\��٫���0�QM?�2%������:��(Yw��d�(��.2J�k�h��6��-�Z��y��hV%;�!;5{V���l���ۛ��e�o��ֱ]�ajhH����X"��o�1A��{�$���tu��N`�@ݚ�g�=��x�㫥̢3XE9�.xQ���>P�W��D��.�`��� 3yƾ�*9|��1B��GII�����A��a�>��axSObs\XvX�8dV�5k����C"4��l�X���Fs�c���.X�$����4�8�}���q������J>���d*L�>��8�}h24^�	����Z2�X�qL��[��8p�t2��+�5A��C�yκ	H��(E�&�^13#@�c���Z�͒�����ݸ.�C��d���w�3����R�m��[3��է�Jw�q<�E�lp�ip���GA]�R�����r�G�<qF�<�s���T�H|*��}�D��}�7٢������u��k,j챴�������"#u�F-_,����9����Cբ-To>����g_����)ۢ�� ����Q���d�:r��W��r�0^%�-�����s�K�� �����>q��#�Y�@\�6~�M�-�c���Q�00	h��=����.��ܥ�c����&��Nz�B��Z�UÝL���Aj�_�I�]�/V54�ѭh�a|��r��T�s�c�"����>XPP`0���������x�Lp����H�ZC�D;�-R����F�,2;b�~����c[�Dׂ�|wv~���n�t\�����t:]���u���Y��𪚭��4�A��ù�C���z�EJ��y4j(�`�"��J?
��F�B����#4�p$� B/���V�>��g�9/�J�XYԭ���d�l�&I���ZM-��8�E�'�@����X���IF�BG�}�5��3?g�
�XƐg�T��$���8?���I��݈��=�}�;[��Z��7���/�̾�o��#��o@{fo3�- ����X	z���˵��.p��$ �,�l7�
b�Ѡ�岺�Mο�������6l��2��z���N�>�.w�D궠���|Ʀ��2>�@���R�t=;�e�90*��=�`��LC��Sa�(s�/��48ڂ���P��7��!�P_ZF�hc��h%�ZX�U���12xL �(MpMG�𔬛��������:��g�\��m���Mx��ƹ�g/���D�ۡ��ō1WȂ4����I܃��Z�;Ϫ~c`!	E�xZ,�8 maU3@��#0��7'F� c��☟�/tq�Pw���:�9?V�^�����Vћ���,x��� ��A�+�3BS�բǝ������t�mؓ�uu�{��B�����ɂgtt���٩�K�P��~��7ˏ�	�l �ّ�E�+�h�"$�{�&=
��m�Y±rui55��V7�*]��4�o����^��o�(�����-��s�"(��4�ނ��@�ſ8 S��&���$Ba��ܬ�	t���4�
�o#dt9$�X&�6ZS����"�ށ;��X#z�P�t�}A���Ď�J��_��A�Т�i�c��e�����8t���1�s9�Nך�yyOEL�"�L��ܥź��#�3���Xc{=�Fp�(��P��И�q���0�K#���	M���#��ҋ��z"��ThM�\���������,�da�m$�&��c�ѕ"s�� t��	��q�񬡕uS�ڇ�)	�b��:��!HoM�'5+�s�k�)�/u:b0�0vJg��^'jj��4��N�8�����cv��n��$V�*��[pGҘ�c�M�sqHL SPd��%-J'ӱY�Ɣ��a���GQelDU8�k:pX�)&�/(RrE/2�N�5�U��BvM)2ش���Z@i���^/���}"�֮�]����Xv#���ny�!�6.Ӧ"�O�CSdN���AQ����Qs�[Q�L��ݥ�DQ�{�5E�2�5"��P�Ē�1jԭk��m��{�����X��:�%��b~�.����=5�t��ТD�zr�8�{�Q��A��Y�=��pp��Zp���͔k�rY���RO�zYӓ�QAI�}#J�WuqJ������t��6�7-��)�����6`�� X�8}�,��b{M*�������X��M]q���X�j.״���^�a��@Z�y��ו�����zt��^�;�VG{��i�$C��-rs��)��P%�SN+q��'�DZ�ψ���U�̼(�4c g�R�m��-���FfV�����݁Q�м.��!S	�����(�������`�"���P��1A=d_��)��=G��X/^��`�4�1P�
Jќn|9q���4�����K,�0��Ւk��$o�3��6BK'q@�o'���K�j���%��g�����h�B�Ț�8�	t�H�{��R&���,0�0�EqŶ&���N���J�҃4�+�y�/��J	߹�5d6�+t�O�3%�Nw��+L���[p�u�e�F�s\    �� �),~MBC�Dq p8뜆��m�ľӄ9)p���CX���:=>�R�Ԉ{�J���R]���C~r_��_��W�P-1���
���][�P��/�0�,R�>;������Q'���N���ͯ�He�B�O�}�M���Kq��]X�2_4�6�̊����p�,�G�C�胵&ܜ�5w���У/����p'TZ�8sj�et3����Uoo�n4�a�z�$('���*�mc�$���wp����9-<�B��K�/.����O���C�����V'|Z���{jj)}�
Z:��щf���wFP1��!(P�@��2�X��+�ǫ�pR��9c<�b�!v��:��;��d�9�:p=ԃ/��&r�C��K-]�(�@���d��[�i�v��\px���D�S�m�i|��e2gF���];�=�v�3��Z����h����hh�ƫ�p����N�o�E,���X5��,CMh�.t�Ƨ�i���b�N5�8.V�^�!!,7��r|��������>���ޚ�P8��Jl�cpĄ�A7hu�Bd�Yv�*�>�(��1��m�VR� �G�}EKk��Z�N���hmpsǰ��W��ͫ䁒��'cF��~8�<}��=���?0m�¼U9�],f+�U?�3Lv�PX>������
t���oF��p
,�ӓ�Xvj���yv�<�z��]�eʴd�D�F������L
���z�j(Mr�;�r������)zbi0��96���R���U��8.��u�{����O��P��H�:�#��bS�ς8�iZ�#�^׹��t|P��q�y�*��;L��y�4r�pgY���}eβ�����b���.}_�q8j�ݛCӃN�^�Xt!���hZ?()p0 ��T�<�&cK�ȲF�I�X74%F��&��D��䌨+�vĥe
�u�*���|s ��14�$��o
,���˿o�2;ߓa��-�3���@�b޸�pΘ�D��e�����b�7�#�ߜ�]3�!;u��N8�#�o>���_�͏+��+��7�+|��9i?�*���A���j�%�vU%{�����Gw�e��+�tn��i������8����|;[�]1��v���Ʉ�'�6�8+ҁȜ3K%�f�'X�;� /ge�IS��i����N�J��n�e�ݏJ�*���h��]g�?�?�M��?�5�D-+�!!I#�Z�~p�@�I�-=�p2=?a�m`h�������󽨱W��%�|��' �{�u6��C�K�B�+1���\�M�K7�W��!��<���y�ȉRĶ9�o���S��D�z�Ș�/�a>�k
�|r�S�h^.t�B&��)�ǟ#���L��J�����܅�9�!v�t�\3��y���MH��b���ӵZ�=�-�Mr���T��G���/n�dݯ����g�`zhk����q�%�����A���1ńH��Q�����|�~�_��ߍ�y��X���'� �?�@�!��
�����d��S�P��7�E:��%��0ՠ�͆�>�zY?n�'�}��b����Wi�}˵#��K�]�TY1�v�iۇL�vV���ڰ������ݟ��� �?=��m!���5
�9l����^.�{T���6�)�/[g���F��$U��3^�
G��H ��9OQYk*<>ȵ��?�vف�(�3��P��O�5�7��b��(~~(j�a� ���;N�&��$���F1�F�X���*d=�S<��l���r0����zˎ��ĉ¦*3��M��Xҏ�l��X��Ø!��r�>֜b�����`�jO�˝s�%YǶ�oV�\�����y�B���
8�u��0����f��0}W�V��vع���q#��ً��T-6���b�N�����
���`<�[;���c�8=�*��Cq�<����1hjN�sm��ɒ�?�}6����:C�#�;Z�����+�(��;�<��5���u���͔���Cۧ}��	K��T�d��~7k�F��1�IG�����]j�=��f"V(�#y[x��G5�F��#���ZD��~�K5�Q�W'<��إ��A2`��w��\H7[g��{���K>O����/G�\���}�,V���� ���y�퉲��y��kT�y���EtL���
�h���v(�����cN��m�����;E㟇�na�У��zb��)0ߎ/g�zf�U�#�&���{�j�Bm�&���8Ua'p�:8��" ��a�c��0�����z`a1�"�}=6Э+��aWc�M�W�H3�s9���@�G�#4��,>��O {8��R�݇F����J���/�D7m{��!+KO�~����Mp�����i����Hj�$��D]�"��&/-)��#h��E�~�� 8�,�d�m`�#O�p���%^���'p��ru��.�t�xٔN�N�Y1�h4���HN=�'{��ip"Vt����J�㑓$E��o�M�T�G�8_��>�C�
��������Ru�sZ*E���ڽ��)�=����|�S6u������KK�X�z���|r�GD�q�=,��x��|��S0�2���}>�p�����b��z��-J�ޏ��B�5�.�-��_�:g_�(%��}���b�oa�͢��N"eL� ����kY�L��A2�1�1f�y8���v��]��*u(�Ӻ.����4H����m��N0����'�Ĕ��	0�o��I~Zy6�+n���d����ВSh��'2��4z��'W����)�ˢ<������uu�����Џլ��G�hr�����g�Y��Q���~��$D�|=S��Л��)bQm��*^�X�ތ����l�qJ�-��o��`��~��ʴȚ�Ɓ#�fp&��y�;�^v���3
=����I)8����p�~��%����O��,G���+�E`s}0g�=�n�#+��5��q��p���{$n��.�����+��Ցi�����p�X����|J�$MU�9o��N7���
���*�rj��)0�ϋx
���D��'��}�:��dӫx�_oo2l�A�	5��K[�6z۔��mP�)1m+h�M/%�6yj�վ;<VG�[��o���V��'��Q�b�I�-����2�Wh������ _�Z�E{����Oa�6q�3rߑ'P��#�I�1�{��s	����e�C�@c�G+`�8����f|�9�����vE]�������ux���&1
a�(���z�Q �2��;Y��h��ŧ���yѷ#��Y�1u��U�CG\z��׶�&��2~��L�
�^��'ˉr#h,�%�q��5P�+ ��F���K?
G][{PF%.y ����+�z�Y|�f�~��E����>�����7��/�Ԑ��<q�	^)�ސܐu"tG�Zu?�f����A��E	Î3Հ	��X��>��K�XF�G���_q��ރKY�P�4Q�Y����S�>9N��[>��Yۖ3�@��F�+�.����s~�;p�*�IΗ�%�<R��Ŋ�����2F���l��?Q9)L��V�ż�d5p������@-|*�!u��C�u8dG������?)�8>
��`��P�b�8���VB�v��!>���(\+Hޗ�W`��ڗ��_OC�,(��e,�vSoc�A�OCbo
�6q�Znk��>4Ja[�C�~{|+���cjaXD�^Е�y=�����&��lA��M���gW'�G�L^%s$�c|�����W,d9Z��.��"?_ߕ��l�a����,����+��L�j�����?`�C����"��8�⛔�`�E�o��J�V���5b+��B�<�@S�%��|�N(����/����f�x��h:wT�(�#�
�R�q�ջa����uP�B V�.�[��o���Ѥ���͵Ж��4"i�����Ttgw��X;�0���p�c��N�Pj�V4&}�z�P4o��=�1���p�AEI~I�>�x�<� ���d�v�>(� q  ?�o7�������+*pZ�h�4�����>��[��i���A$�?47�E�~lE��7��F���yC/�s��>�9�Xs�Ζ��8�c�����*lD��8����p:����`����&�D�=�4M���M��[�#3�`G�'L�^	X�R�$aĲ&�k��[$�cf�x�q���� �w�:��,v%2V'���o��_ii@�(�f�h��Y"e1��h5H�癴Z��m��t=\���P���H��ݰ14�Q
e�]��X�	��f����������ū�*�?[�G�;J�؜x=2��%9bl.��'#</��jX�C ���5nf{�_��7 q��(�נ�I�;�6Ujb��Q�Dv�k�L�Ňd��`�ṧ�����#���Q��1��!(���6���\�(�w~�dP�w�?�K�/��1��9q�}��`�&����.;ra��R4�g��TP��QL�uׯ�b58�U=$�T�{"�>8+��U�'2�b���8��O�Rt���T?�Y������{ТBv�/ ������vuA�ϐ��8�ld��!/��|�J�K~2]ނc�ժ����\���A�P$zhQ��o���X���4DNock^ �<�"��r��q��<�i׮>�)E���:@������ʣPqx�[ѡ��sN㼗�D���|[�$��7Ì�����a��QG��ؿ9�_2��ɶ���4���d���c�	ѧT���@��H���.9����.�Z�\��:�F����U��0�n���No�X3F�@�3K;��TuZ�0Ⱥ�Mj�4�I���$���~��d0������i�#��������-��Ϸ9"+���������g�ǋ9[��{>�g0^1��ơ��_�g;2�)���$��m�`k���rv_n�*���i���{`��O9r��b��Orl���/����m>�qɺN��Dn�$Fc=M��%�M�ώA���}3PO8�v`�O���9�I�F�&4?'�>~{u�&�ܴ���Nb��,>���\���/kX���Ŝq$���!���R�@y>��)H}�F5�ruqq�D5������ï�[젚�0&%I@p�7���� =���o�wpE=�/p��"��y>g$�����.X)ңR`������s�{��]�*� /p�Tn��S;�A�8"���1�d���ݨ�!���iA牆�]h�u�)Ң��qh�k����6��"�d
�b綼U��B���2X{>�]u�.�{�dݾ �k`�\ ��&�>��� P��� u���k.J�!3�űK�/z�Њ�I�,IU��������"� SFc�z���Uodޣ�4~	߃ч��|�Z��ٔ�S!������^ʣh�G
���CdM~z|�Q����	���Ĵ�wt����2��;����}or�cpTUevu�S�(��ÿ徕ƎR,yo�wE�"%��b�">��@ⷫ� ��������a]�ChW����p��������uX=�I�c�a���2��>��qb����E����볓L�b��@
�m���-�i��[P�)�ZqR���+�	�#&@��5[������ع�O�WW�'�h{):�1&�T+~������_�\���.1��6��\�d#�xӶ���΅�"���%��� �k�(�X`]��� 4�'n2d�&��;�#3����@S�cZjZ�P ����i	���Ć�h�����}o0M]�,�`�#�6�T�H���G�L����ʃ� �eo��.�����MՒ,$�z���^��٪|_����{�����q��[����$�!2] _��������><F�p̫��1'��C����W�1�X*~xv�\Θ�ߑ�5I���^�}!ce�]��:����iiH�N�^OG�h^h##���S7ʐb5�Tu���#�N�˝J�J�Y~9��&����·��EcǷ$L5&��l�!C�i"���XE������/k�r�8L"]�3c �]G_7��=0T,�ܚ1��8�-;J�T����������"�!�t�Z�#2��W��&������$E���'��5�=R%�����۸	妌��q��AU7 ��H��:h�&7�i̖� 4S�0i���8S$���0	8�?O����v��?�}�s�>��&9��o7V�`��Y~�N��K*`}�fyl���1�tq{q|ʡyL��ӒIF%�K� ��q>����@sG�z���9%7 �
h���Ш9��������_{wQ��^�!�_��	w����&�(��`c����F3P��h�a��ҍ ȶ~{b�rSdz�V�#������$�E�&�ɠif ���{�(5�X����=�>x����r��o���\���&�Kx�}C����U�`1s&�Us9D�b�W�]p<&-$F#X�E�ڑO��ux5`��\ �8,Z����F-��J��h$����|c9	ڂ�|���+�5�ث�|Z��f����gG�`�&��+b
7k �pcִ��� �G�I��Ȅ�D����"�<ܹ�MO��h:�tI��������T�V�I�����)zU���y)��X�!Y��V�>)=YwQ�4�ke}tux--=T:
3�~A>	\�8���� L��^��Ȣ��%����������Q�m�"�Znp�W�6�ç�^j=�4��,��X}u��0.���~���.��dHE�ԯ��r}�ϰ��}F��*UQ�T
�z���%�7�\.���`��T�>f�PxI<��zj��Ƴ�#���dԷ+EQOA�1s�9��T㠅�ˇ�p+�\2�q�&�~��dV�����F{���1,��ϓ�j��(�ݼ�85Z%����/�`"��U9���Γ�}0R�X|�m���V��n���ġLݺ�#�,ʈd}���`َ9�ۘ�գ�f��PC��>j�Ra&X޾<pG��ۙm1��%(��vv@�\���
�Y�M��4&G���)b���'E@���'vW�7��<��� ����w\�Z|�	<�{ 1u<mGJ���ݰ0Z;�\?�o=�Û���5.�)�E[c�����?��?�?m���      $   �  x�uWMs�6=C�����/��hc�?3r�U[{�H��EZ~x��3�l�asO����ؾJ�L�.�2���ׯ_7#��H�"��ھ����ʪeќ�6�#M4N����Hp�]W+�\�(gɌ�Gcvnt�T�W�M�g���O���G�����&	�W���t�|��|�_)�Z��U�d�+2r�$��	����k�����wk�o����g�D4�Sf첑��I�޾�ʬUӼ�վQ�Ϗސ� Sk�~2E�`���]SI���F#�{E�sA��5�o�v�b�M=��ɜ�ڦ�|��D��d�.�B�`��fC�v�ۍ�Wv�����x2�lƫ��"gb1d
�}#��_+f���8�oq�{�Z �n$�'aߺ+�@� G�;+��7�UY~-��l;?	1�}<��C(��5����A
"�C�6J؃}���@8�E�S��8���(�dc���9^��H{
��3v/�k�,�+� =A�|��7W#���օ�7}^Q�."
�Ӧ�� ��R6F6���])����LLS����=(���ˍ-l-;�I�E�;�{ڊ��^��-�±ϥ.�t�?�ҨWp�F6;Y�RQf�I?vCZ�������V�5�9�1&�@��Թ�o;��+s�Rlպ9��x�@?-� )IB���=�ƄӞ��	UY�gx��ï�B���k��B�6�Y��T�B�p��>�o��~)�m�������Ζ���j�sYղm)����GGf-�`�4$;M����a6��1��H(
9[[U���*���z4�x�`�bt:gomAӫf�Ⱦ�EJ���Րg:ﲐ(x�9��@���Ъݧ�i;�3������}K�F��HT8��gwm�tO��(���:�ሓH�����bqi�ʚ�Ȕ?�ZK�.�u*>O	!Rv�5�F��l�`
�ֶ�0��z*tH2�1�[w�G�]E�D�ބ�d��^vņ���/&⋢1���:�j�
�;̿m4���6�`jYa��&�JFVx��wWN��Y���/Av�u$;BNC�Ў���P�W����8
��bJ?�Z�<n�F���Ϫ��0GTE����7�T� ���{ 
���Y�hPH'����E�)�4TM"�Yl����������Z�H�>��	9zo�,e�q�A�V`��[�W��n�[�p�F)D� �$�m�}�{��K���>���9��(��# ���~�~ܸ�f�~�>�J� ��KJg�e{�S"�?���^Uj8��YW@�I��%��[������4��q��	h�g� !1�S�?.JX䋮%f���-�x6D��,��4'�~[K}'��v��h�fi�x��yһ~?,5��=q0'���p9��Nq��]�گ^�/R���T���=(�q[��Ì��A+c1�����B�7�>��Q��dt��F�����~����[�T�cTx#Ab��FM���0���#��a��*��&� Q�>�g2l�����L����ݜ�@2Xٮu͎�*[�{0�]��d���x²�A!��(�,}�Dq�.�|��	J��;��F��{�����(��ޔ@9!���b`�������Va�Jg��)1w�:"�����������\Lc/X�E�~V�Vg��bSH��u~˥9.�Y���w;lR���`�����&��i7B;谫̇*��׶׭����x�� �'��v<��c��t���]��\C�� I��0�N�Wz���/�ٵ�+p���=U�	b�}�/V*��96<��ϯ��ք�W+��7n�f��!���kz�iKY�~��0�&Vw�r�w�?7l]ctN�B���m�v��ۿ�iSH�X��ϲQ5�Mw�����u �DI0�ic*��N6alE��<�V4�'O�U�GŇ��c� ����B�7�7ZP����F�Y�c��iʏ��N����A���Zoo���^�}���M���y��]i#kL=i���4p�j`)Z��/Ë��2B/(�4��N&��*��?      %   �   x�M��
�0F�{�"����j3
*���%��6XJH��-(��[�w8|b����J�K�)�D$]m5h���^4�{��W��Ρ����$�S��.��P�q�b�;�*�hY+%�1RU���m�j�����z��$�V��"~ �{+�     