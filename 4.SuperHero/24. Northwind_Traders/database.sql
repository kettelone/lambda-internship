PGDMP         (                 {            northwind_traders_db    14.2    14.2 E    Q           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            R           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            S           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            T           1262    29361    northwind_traders_db    DATABASE     x   CREATE DATABASE northwind_traders_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.1252';
 $   DROP DATABASE northwind_traders_db;
                postgres    false            �            1259    30081 
   categories    TABLE     �   CREATE TABLE public.categories (
    id integer NOT NULL,
    "categoryName" character varying(255) NOT NULL,
    description character varying(255) NOT NULL
);
    DROP TABLE public.categories;
       public         heap    postgres    false            �            1259    30080    categories_id_seq    SEQUENCE     �   CREATE SEQUENCE public.categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.categories_id_seq;
       public          postgres    false    212            U           0    0    categories_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;
          public          postgres    false    211            �            1259    30108 	   customers    TABLE     �  CREATE TABLE public.customers (
    id character varying(255) NOT NULL,
    "companyName" character varying(255),
    "contactName" character varying(255),
    "contactTitle" character varying(255),
    address character varying(255),
    city character varying(255),
    region character varying(255),
    "postalCode" character varying(255),
    country character varying(255),
    phone character varying(255),
    fax character varying(255)
);
    DROP TABLE public.customers;
       public         heap    postgres    false            �            1259    30257    dbqueris    TABLE     �   CREATE TABLE public.dbqueris (
    id uuid NOT NULL,
    date timestamp with time zone DEFAULT '2023-01-07 18:04:28.173+04'::timestamp with time zone NOT NULL,
    "queryTime" double precision NOT NULL,
    "queryBody" text NOT NULL
);
    DROP TABLE public.dbqueris;
       public         heap    postgres    false            �            1259    30172    employeeTerritory    TABLE     s   CREATE TABLE public."employeeTerritory" (
    "employeeId" integer NOT NULL,
    "territoryId" integer NOT NULL
);
 '   DROP TABLE public."employeeTerritory";
       public         heap    postgres    false            �            1259    30116 	   employees    TABLE     J  CREATE TABLE public.employees (
    id integer NOT NULL,
    "lastName" character varying(255),
    "firstName" character varying(255),
    title character varying(255),
    "titleOfCourtesy" character varying(255),
    "birthDate" timestamp with time zone,
    "hireDate" timestamp with time zone,
    address character varying(255),
    city character varying(255),
    region character varying(255),
    "postalCode" character varying(255),
    country character varying(255),
    "homePhone" character varying(255),
    extension integer,
    "reportsTo" integer,
    notes text
);
    DROP TABLE public.employees;
       public         heap    postgres    false            �            1259    30115    employees_id_seq    SEQUENCE     �   CREATE SEQUENCE public.employees_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.employees_id_seq;
       public          postgres    false    217            V           0    0    employees_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.employees_id_seq OWNED BY public.employees.id;
          public          postgres    false    216            �            1259    30237    orderDetails    TABLE     �   CREATE TABLE public."orderDetails" (
    "orderId" integer NOT NULL,
    "productId" integer NOT NULL,
    "unitPrice" double precision,
    quantity integer,
    discount double precision
);
 "   DROP TABLE public."orderDetails";
       public         heap    postgres    false            �            1259    30125    orders    TABLE     +  CREATE TABLE public.orders (
    id integer NOT NULL,
    "orderDate" timestamp with time zone,
    "requiredDate" timestamp with time zone,
    "shippedDate" timestamp with time zone,
    "shipVia" integer,
    freight double precision,
    "shipName" character varying(255),
    "shipAddress" character varying(255),
    "shipCity" character varying(255),
    "shipRegion" character varying(255),
    "shipPostalCode" character varying(255),
    "shipCountry" character varying(255),
    "customerId" character varying(255),
    "employeeId" integer
);
    DROP TABLE public.orders;
       public         heap    postgres    false            �            1259    30124    orders_id_seq    SEQUENCE     �   CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.orders_id_seq;
       public          postgres    false    219            W           0    0    orders_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;
          public          postgres    false    218            �            1259    30090    products    TABLE     V  CREATE TABLE public.products (
    id integer NOT NULL,
    "productName" character varying(255),
    "quantityPerUnit" character varying(255),
    "unitPrice" double precision,
    "unitsInStock" integer,
    "unitsOnOrder" integer,
    "reorderLevel" integer,
    discontinued integer,
    "supplierId" integer,
    "categoryId" integer
);
    DROP TABLE public.products;
       public         heap    postgres    false            �            1259    30089    products_id_seq    SEQUENCE     �   CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.products_id_seq;
       public          postgres    false    214            X           0    0    products_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;
          public          postgres    false    213            �            1259    30150    regions    TABLE     i   CREATE TABLE public.regions (
    id integer NOT NULL,
    "regionDescription" character varying(255)
);
    DROP TABLE public.regions;
       public         heap    postgres    false            �            1259    30165    shippers    TABLE     �   CREATE TABLE public.shippers (
    id integer NOT NULL,
    "companyName" character varying(255),
    phone character varying(255)
);
    DROP TABLE public.shippers;
       public         heap    postgres    false            �            1259    30072 	   suppliers    TABLE     �  CREATE TABLE public.suppliers (
    id integer NOT NULL,
    "companyName" character varying(255),
    "contactName" character varying(255),
    "contactTitle" character varying(255),
    address character varying(255),
    city character varying(255),
    region character varying(255),
    "postalCode" character varying(255),
    country character varying(255),
    phone character varying(255),
    fax character varying(255),
    "homePage" character varying(255)
);
    DROP TABLE public.suppliers;
       public         heap    postgres    false            �            1259    30071    suppliers_id_seq    SEQUENCE     �   CREATE SEQUENCE public.suppliers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.suppliers_id_seq;
       public          postgres    false    210            Y           0    0    suppliers_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.suppliers_id_seq OWNED BY public.suppliers.id;
          public          postgres    false    209            �            1259    30155    territories    TABLE     �   CREATE TABLE public.territories (
    id integer NOT NULL,
    "territoryDescription" character varying(255),
    "regionId" integer
);
    DROP TABLE public.territories;
       public         heap    postgres    false            �           2604    30084    categories id    DEFAULT     n   ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);
 <   ALTER TABLE public.categories ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    212    211    212            �           2604    30119    employees id    DEFAULT     l   ALTER TABLE ONLY public.employees ALTER COLUMN id SET DEFAULT nextval('public.employees_id_seq'::regclass);
 ;   ALTER TABLE public.employees ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    216    217    217            �           2604    30128 	   orders id    DEFAULT     f   ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);
 8   ALTER TABLE public.orders ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    219    219            �           2604    30093    products id    DEFAULT     j   ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);
 :   ALTER TABLE public.products ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    214    213    214            �           2604    30075    suppliers id    DEFAULT     l   ALTER TABLE ONLY public.suppliers ALTER COLUMN id SET DEFAULT nextval('public.suppliers_id_seq'::regclass);
 ;   ALTER TABLE public.suppliers ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    209    210    210            A          0    30081 
   categories 
   TABLE DATA           E   COPY public.categories (id, "categoryName", description) FROM stdin;
    public          postgres    false    212   �X       D          0    30108 	   customers 
   TABLE DATA           �   COPY public.customers (id, "companyName", "contactName", "contactTitle", address, city, region, "postalCode", country, phone, fax) FROM stdin;
    public          postgres    false    215   �Y       N          0    30257    dbqueris 
   TABLE DATA           F   COPY public.dbqueris (id, date, "queryTime", "queryBody") FROM stdin;
    public          postgres    false    225   �p       L          0    30172    employeeTerritory 
   TABLE DATA           J   COPY public."employeeTerritory" ("employeeId", "territoryId") FROM stdin;
    public          postgres    false    223   t       F          0    30116 	   employees 
   TABLE DATA           �   COPY public.employees (id, "lastName", "firstName", title, "titleOfCourtesy", "birthDate", "hireDate", address, city, region, "postalCode", country, "homePhone", extension, "reportsTo", notes) FROM stdin;
    public          postgres    false    217   �t       M          0    30237    orderDetails 
   TABLE DATA           a   COPY public."orderDetails" ("orderId", "productId", "unitPrice", quantity, discount) FROM stdin;
    public          postgres    false    224   �x       H          0    30125    orders 
   TABLE DATA           �   COPY public.orders (id, "orderDate", "requiredDate", "shippedDate", "shipVia", freight, "shipName", "shipAddress", "shipCity", "shipRegion", "shipPostalCode", "shipCountry", "customerId", "employeeId") FROM stdin;
    public          postgres    false    219   ��       C          0    30090    products 
   TABLE DATA           �   COPY public.products (id, "productName", "quantityPerUnit", "unitPrice", "unitsInStock", "unitsOnOrder", "reorderLevel", discontinued, "supplierId", "categoryId") FROM stdin;
    public          postgres    false    214   g�       I          0    30150    regions 
   TABLE DATA           :   COPY public.regions (id, "regionDescription") FROM stdin;
    public          postgres    false    220   ��       K          0    30165    shippers 
   TABLE DATA           <   COPY public.shippers (id, "companyName", phone) FROM stdin;
    public          postgres    false    222   ��       ?          0    30072 	   suppliers 
   TABLE DATA           �   COPY public.suppliers (id, "companyName", "contactName", "contactTitle", address, city, region, "postalCode", country, phone, fax, "homePage") FROM stdin;
    public          postgres    false    210   f�       J          0    30155    territories 
   TABLE DATA           M   COPY public.territories (id, "territoryDescription", "regionId") FROM stdin;
    public          postgres    false    221   1      Z           0    0    categories_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.categories_id_seq', 1, false);
          public          postgres    false    211            [           0    0    employees_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.employees_id_seq', 1, false);
          public          postgres    false    216            \           0    0    orders_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.orders_id_seq', 1, false);
          public          postgres    false    218            ]           0    0    products_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.products_id_seq', 1, false);
          public          postgres    false    213            ^           0    0    suppliers_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.suppliers_id_seq', 1, false);
          public          postgres    false    209            �           2606    30088    categories categories_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.categories DROP CONSTRAINT categories_pkey;
       public            postgres    false    212            �           2606    30114    customers customers_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.customers DROP CONSTRAINT customers_pkey;
       public            postgres    false    215            �           2606    30264    dbqueris dbqueris_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.dbqueris
    ADD CONSTRAINT dbqueris_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.dbqueris DROP CONSTRAINT dbqueris_pkey;
       public            postgres    false    225            �           2606    30176 (   employeeTerritory employeeTerritory_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY public."employeeTerritory"
    ADD CONSTRAINT "employeeTerritory_pkey" PRIMARY KEY ("employeeId", "territoryId");
 V   ALTER TABLE ONLY public."employeeTerritory" DROP CONSTRAINT "employeeTerritory_pkey";
       public            postgres    false    223    223            �           2606    30123    employees employees_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.employees DROP CONSTRAINT employees_pkey;
       public            postgres    false    217            �           2606    30241    orderDetails orderDetails_pkey 
   CONSTRAINT     t   ALTER TABLE ONLY public."orderDetails"
    ADD CONSTRAINT "orderDetails_pkey" PRIMARY KEY ("orderId", "productId");
 L   ALTER TABLE ONLY public."orderDetails" DROP CONSTRAINT "orderDetails_pkey";
       public            postgres    false    224    224            �           2606    30132    orders orders_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey;
       public            postgres    false    219            �           2606    30097    products products_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.products DROP CONSTRAINT products_pkey;
       public            postgres    false    214            �           2606    30154    regions regions_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.regions
    ADD CONSTRAINT regions_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.regions DROP CONSTRAINT regions_pkey;
       public            postgres    false    220            �           2606    30171    shippers shippers_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.shippers
    ADD CONSTRAINT shippers_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.shippers DROP CONSTRAINT shippers_pkey;
       public            postgres    false    222            �           2606    30079    suppliers suppliers_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.suppliers
    ADD CONSTRAINT suppliers_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.suppliers DROP CONSTRAINT suppliers_pkey;
       public            postgres    false    210            �           2606    30159    territories territories_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.territories
    ADD CONSTRAINT territories_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.territories DROP CONSTRAINT territories_pkey;
       public            postgres    false    221            �           2606    30177 3   employeeTerritory employeeTerritory_employeeId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."employeeTerritory"
    ADD CONSTRAINT "employeeTerritory_employeeId_fkey" FOREIGN KEY ("employeeId") REFERENCES public.employees(id) ON UPDATE CASCADE ON DELETE CASCADE;
 a   ALTER TABLE ONLY public."employeeTerritory" DROP CONSTRAINT "employeeTerritory_employeeId_fkey";
       public          postgres    false    217    3227    223            �           2606    30182 4   employeeTerritory employeeTerritory_territoryId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."employeeTerritory"
    ADD CONSTRAINT "employeeTerritory_territoryId_fkey" FOREIGN KEY ("territoryId") REFERENCES public.territories(id) ON UPDATE CASCADE ON DELETE CASCADE;
 b   ALTER TABLE ONLY public."employeeTerritory" DROP CONSTRAINT "employeeTerritory_territoryId_fkey";
       public          postgres    false    3233    223    221            �           2606    30242 &   orderDetails orderDetails_orderId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."orderDetails"
    ADD CONSTRAINT "orderDetails_orderId_fkey" FOREIGN KEY ("orderId") REFERENCES public.orders(id) ON UPDATE CASCADE ON DELETE CASCADE;
 T   ALTER TABLE ONLY public."orderDetails" DROP CONSTRAINT "orderDetails_orderId_fkey";
       public          postgres    false    3229    224    219            �           2606    30247 (   orderDetails orderDetails_productId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."orderDetails"
    ADD CONSTRAINT "orderDetails_productId_fkey" FOREIGN KEY ("productId") REFERENCES public.products(id) ON UPDATE CASCADE ON DELETE CASCADE;
 V   ALTER TABLE ONLY public."orderDetails" DROP CONSTRAINT "orderDetails_productId_fkey";
       public          postgres    false    214    3223    224            �           2606    30133    orders orders_customerId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT "orders_customerId_fkey" FOREIGN KEY ("customerId") REFERENCES public.customers(id) ON UPDATE CASCADE ON DELETE SET NULL;
 I   ALTER TABLE ONLY public.orders DROP CONSTRAINT "orders_customerId_fkey";
       public          postgres    false    215    219    3225            �           2606    30138    orders orders_employeeId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT "orders_employeeId_fkey" FOREIGN KEY ("employeeId") REFERENCES public.employees(id) ON UPDATE CASCADE ON DELETE SET NULL;
 I   ALTER TABLE ONLY public.orders DROP CONSTRAINT "orders_employeeId_fkey";
       public          postgres    false    217    219    3227            �           2606    30103 !   products products_categoryId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.products
    ADD CONSTRAINT "products_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES public.categories(id) ON UPDATE CASCADE ON DELETE SET NULL;
 M   ALTER TABLE ONLY public.products DROP CONSTRAINT "products_categoryId_fkey";
       public          postgres    false    3221    214    212            �           2606    30098 !   products products_supplierId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.products
    ADD CONSTRAINT "products_supplierId_fkey" FOREIGN KEY ("supplierId") REFERENCES public.suppliers(id) ON UPDATE CASCADE ON DELETE SET NULL;
 M   ALTER TABLE ONLY public.products DROP CONSTRAINT "products_supplierId_fkey";
       public          postgres    false    3219    210    214            �           2606    30160 %   territories territories_regionId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.territories
    ADD CONSTRAINT "territories_regionId_fkey" FOREIGN KEY ("regionId") REFERENCES public.regions(id) ON UPDATE CASCADE ON DELETE SET NULL;
 Q   ALTER TABLE ONLY public.territories DROP CONSTRAINT "territories_regionId_fkey";
       public          postgres    false    220    221    3231            A   �   x�%��j1���S�	��sv!��B����qc��E�S��U��3����g�|�i�rOj�~;?�Ԫ�j���I�&�s�K`�p~�Jk/�:�p�u�'����Xӱ��t <�gڙ��	9:m��BY�8v��b���S�ίt{��D�m�ۚOHM�0�7�Crkze���>?��3�9N      D      x��Z�nI�]�"��n�d���L>$�|6IY]���0��d&+��}�Laj���bP@/��؜IR)��iæ3�Tƍ�{��7�.�ϩ\f���s�n�,�l �P� ^�4cSɌO�.���s��{�Fs�J>���]֔i���C���[�nE��4S�k�k��~�vlˮ�`6aA,�,-~�(��N��L2���2�����c,S엢���G���8�üX���bn��~		o7nd��a��{��ܶ����e`�ʠ�h���$>HR'|&~,dz�U���ɐ��{�a�Wg6_�l����Ղ��~Ƃ4)�%�ג�%i�f�d+2~'���u�놆��^�|�c���x�(�?:��cv�c�uW/�s]ϫ��j���vJ;��0yƳX����w��N��!\~�)�X!��0ƏR�'���b��?�d̹��E$��AFL��a��Q.e�4����M�;���[k��{����"%o�(܈\fX.�"a� I����$P�� ��e�%#�Ԝg:�T�,G;_����G�1&��d�\f��@˜��ݤǯ���4x+̥(�PTl$���N� ���w�XHދ�_!�yR�+e��i&�d��p��n7L�rmԚ�~�͚�ߢp� ��p	`��K�7?��i��b�}�?� @����{�i��9�p7�	�{��yl	��硯s���� NHb.v�w�/
�k��y��i"���Sx��ͤX��`R&�Rż�i�y���0��e7,�r�c��l���<���I����X'
b.�5��"�b,���6�,������~�`�1k��̸���b-ܿ콣Y�h�U�7���'�|�%I�&�اpx�e��$���@��a��	�HEV	�N���p�2uCW1�
Z�{��ȋ�y���~܋��E����4��2<��?@��%�4�n�&k`!� �]j4]��}�^L�{��v�ۗ���Z�ᬅG�y��E4-B!��<[Qnb���Z@��
�!�� ��T�P��k�g�a?�7.�Ykݍ�SO��g��G�a_��09 Jމb��`�^����MM'�	�ҏ [i�m���>��F �[xv�&l,�X~��#9�8���/�#����"�c�>p
'��(���c��Hhu��F��F��o�-gN�e�A��.A��~����&��u�a��!��2�8h��G�>UI�O:w���fꗡ�#�ۓ��f�T |�yT�/�v�GL��<
��*�?�(��\qd�@=Em��9�5,���pXym������$�v��D��P�-�(b��yZ��ώ�L6�0��q.a�
�!�-�«��p���t��o�L���<�T��"� ����� 3m�#�������&wn^:Y3|�24M׬u&������RFl�0�@�Q9�9�z`�����Ç@M�P.��P0	�nZ�}�rj7�����aDT�"�E�L����P	Z�[��I!�(=�8#_���M��}�Vp��N���>��+\��^ ���:\���F�`�P�>I��+��	%��H��s^&.�z��|�[��1k7Ș�� �k�WH�[�v�(	S����]Vϫ��{H�0�Ȳ�WB��	�Y���l�/y�i��Y�vɈވ���d�柏?��I9����KP���d�Z�D����ϋ�,�g���%ǧ]�7f��I0�)C62F�ʈ����/�0t)�q�8��[����C��<�~Yχ"r]�;_[��&��<�AL9��P������b������U��$y�����5����W�55�iR;�X$�O����)$�Hd��ȓ�!�C���ƺ���d]�[���/�X����d7�_S,D�p	?9���
�Ąn@vU�ë������:�|���!�2Q��XD���̦m��Vv�6�w�����8x"G���6a�e�� ��#��+�0�yD��[�]T�K�<��BB��
��O�f����-n������=��ۄ�bY�J��;� �� �x�OoR���W.A�OHf$ \�T�bjnKǞ\&/%$*�T��vt?�cJD6y���Ēp��Ҝ� �Jp-{��2R�`5�u�����9�s���y�s�i�I'���4�O�I��I����n���i���7ŀk@b�$O;�m�|��Lv}ok�I+�:S���F��~?�ON��2<.��c��!��d�~��^6x�1>I��!6܌�o�xOg�0�O�$4���Y7|[� ���j�	�[�k�%�K�\'*r��8%�%e��_U}Lp;������#%��8�8gN�ןG�î�u�A��s���`O�rhuwH�ǟ������m)$<�8�2�7�_�&�<�9X�w^ݴ��T�C�d��O`xV�Պ�NU7Q�\@I��~x�bwE�J!V����nwi>�N�pM2�V�Q�v��0��JʟD��m݁oCTx9P�
4����Veh���l�m=F<���0\�s #YP�v�,@���Da�&n<�1YC�@�"`��5����l7�Jc>����R�F�Zw�f��)�3C�
��;�W�i�M^M���,.�ZP�9
KH�'����q�'��-��G�����R���	<�C!�u��;�=W��(U;^C#��p��K�b.#US�J� a��T���V��­Oh�l���������ZQe�64-v�@�~#Q��m�J���]�H��%w�*U�^%U�ZÆ���;��vC�a� �[Bl�� %�[��IR ���XW�9�2���~�J��R���*�2��7\��OL�|MS��6�a�ZӞ"].�(jH�$���)f���"�^U�:����'��ŞL�}2o����V�ey�*�|�]��x����	e<�q)�G�bE�\R��gT�b�(u�9�'{j[�8G���w���1��s7���\1q�rFN�\����7� Y�b����rK��� ���@ӎf^���fX��Y�k�L�MɄ�]F���!����.���@W�D<�)��i¼�/�?ka�H�'��ھ�B���\��O���B�
9�m�?E��kU����
a7����^��w��2IHG�-�r2,"O���k�ּ*_c#LS�C>[��k���ڌ>�T�.���np�s�\	)ui-���r �(���B�u�w�i�6,�^�dv�7��Ԫƀ�L�n;u�8|�N0;c*,eM�ǪT��{�����sv��ScD@T.�|mA*R�J��J��աc9�Ap�4������D⟄EB[߆����q^	R��b���R�&!}R[Xl��F��,�M��(//�:L�N�x�"��|��}A�|R��5���)w�z��!6du3-��3a6뺎]hJ$�b��k$q4�ɓC�6�L����R*b�¿��~r��,S�'EM�-Ef�J�"���cA-���?r�e^���O\���z9�k��䶇�P�lT�ʬ���$�Y�/��P����|6�N���؂�w�pU�k�zC>�^&��h2��!�8� �D��p�ė,�&U��N��c����v���E�d��r}���#�Js�6�ڨ�	�l���<�#Ȼ���ϗ����S��ʹ9�
�n�j��K�'��g{6�)�z�OwGMeعU��k�o?��(Z�D��_��Xh�� s|�L�p��&ax�Z@e��Y�C!�RA�k�����<�f6���(�C�����,��Dd��*��?�蠎;N'Qr�����	b(*[t�kV�`��cY&�e9� ����SE�c��_�1�ǯe5 i]y�GMi8�>'������;a��(	cSw��#�͖�0��a4���uk�Τ�b�s����_ YH�mA�(ݢ������p�G
*Tٚ�������x�Pg��:���ֈ�Cd�(�tZ����js�.�V�YDy\��'���D����slǨ���˕YO��.=�	���)���԰�z�H���CB���8�w��g^�������\eZD��;�1uw�P�v�lhb
��7�A*���!��T|���+U /  �az~�q�7U�e�FeD�İ�3d�k�d��`��?����؋h�\e� I[��_!�㿡��>pe�뾧��i[^��K���V���:	*vG����s�.���x�p�W�A;�"��"Z����
'��t���������N_�b�M�Q���"�_!���xubp��9b�܏�F��h�0+�D���)�Y��9&�ņ0?!?���#��Ry�d}͉���A��Spb4/�T��p �ê�ty��~e���&�[���Z�@�$��>Amq(��K�UI]eD�S蕘8�bX��ꢫ|iT$�mp���[�k��
&@�BD����!��S7�zߙ�����B��ܸ�7Q��ڛ1��VL�Ɋ55J�M�P8�K�ם�[H��ڔG8&�0>�m_���̗�h����f�+LF��w�l��'����m��pwJѸ�>땀���t����e��������۬UG�V���-�%�C��DE�L��PD�)3�	�CMo�ݍ�P�nE%��a�Ql�ǅ�r$��(��.��{��\���`ƽ��z��#jR��$�$�VZGU5->�ª7X3	QSw��C��Pnh�ޅ櫳�i�SgJ�Q��Tbee;)cw��{�/7��P�.�Q��l�'��ְ����իGU6���`�,e_��J)����Ӆg�"�̏��2��z/�K��|���7m��������6�Yná�N����
�<��vBg��ŘN��wU��8��6��B_H��p��^��^�� �q�;�!��O �� �Ͽ����F�q�X?�p%_�|�Q����
�$9{��yHZ�}5�"�rP�<۰k���N(v��-�<~���ԗ�DI�g9�b��P�"�f���Ho�;aY�8Գy.~h�S#��o��k��N��fk:.YA�I:t�>�$��P�~��? ��t��Q���B�tJ��������j�'_0e���E��Dn�H9��=b��ޤ���`�lTݧ�,�9Aۣ�����<�6��g�6�ӝ<� �9�{t�u*+�+K��X)j�SghT��N��J&7l:���?_ێoc����Hl�}}:=�x���/�(�_��r����	ي���w��Iоc�{����~>�f��t������(c(Qu��/ٳ���-%g_�'�ƫ�ƆN%we�a]eX����X����Y��ԧ����Pd|(VOo�9�0o�O��OG,�0�(�Q�N��X��v+CCw�ڧ���>	�9��9e����\��"�[�ʢdKQ����=e�3�yb
E���5���f��Yw����/��{���鮄:��/߼�ۚuԛJE�-�H`�ņ ��D�^5O��oTW�Oe�p �3����V�s*�.�vf�2z=ND�$�2�Hp�l�W�i�_#0�?����w�|.�$�W�Un�u�r��4�غM��|���a�Go�A�^z��W���r��T~ʨ���B�^�T�4��@�*����Z��0��ڴ����`2�c�n�̝L7�!�Kx/�6�"��~��y#�QAS����0V��=��Z��?_�:�~�=P�-^�p.%�*�N�9��^��t.7(����TK b=�t�ǕזΝ(�P�pׅ�X��"���Y��,#��9�����l^G����&���L6�-�* ����U`B�/�Xw�?�1���lCl�2�sR'M�k��'�M�)o#N�#YoTv4��+��aq�CY\��=�����ބ�/~�%�~���u>d��pq8�����M�<
�x��� U9�=:%G5�{�t,��jjՕQ�ύZ����G�J      N   "  x��MoG����X�)�!g8�Q�C�h�~�)�K/��Hؑ+�@��C��\����a��v�|��!'>Ƚ4=:PE�Z�R��9��\�P�.,In0��.\�����>�{��i}������������_�b��M�Ͷ��e�Ŷ�����v�w�׏�_���a9�}����x����|Ǜֶ}�;���������[o>�?7�}��ݴ�Go7O��Ϸק�~�з�|~���x��ػU�Ow���w����/����ϫ�ձ�9|����
y��uI(%WdUra%gO�!r��`��L�nPL� A9C� ��3Հ��g�h0ӒҒ�`��L�^ ��.C(�V#3$���S������y�L�$�(�1*�ܬ�}m@�\*vj��`Ξy���F�L4���Є��yV�0Q��j�!p. b0�-ɍ���ʼfk1���|;�J�i�aT����B���)���hm��,�lz���i~�>b"���#�1H���6�C��y!L�!�bYH*��*E��[m�����I3��>B�@�$˙���-b���?�8�|�9�gm���2��D���Jnu�F�,NV�0�qș�B��C����ҜI\mtg�����f� !Sja�Xf�� �T�6v�Ŕim.EdƑ8����4��I��ud��P� �rf
�*�.^����i~�3�r�6�[$��h�).d��S�zԳ���y��ȱ�`o0�g��y�(EV��]��^z���YTwlm�A/�����y;y!�o���?E�e      L   �   x�%��D!�33�l������J����+X�{��!u��|�%�1��QR�ݑ��רq��2�AWg>NR]:E]4�\O͑öo�8�����s[	س���u�G�}jY�/|�O~��t{����c��w�ֳw��j=�z	VC��"K�?�V�[��u�~���9P�=�      F   �  x��UMS�8=+���P[I�3��ffX��T�e.�ck���,C��oK��T%��ȝ���{�'����솫z�*.q�5n�,��	�jX��H�y̓��o��+Hh���t��i����vP>�.��. *Y��Z��dEF��Jv�SH�t^�i��d���]4cM ��j96��YI�`;��NK��`ct�6��Pd�{E�� ���,X T���Z�[�����X����*�s)鴧�����hܡ;��ӛ��?�.��r1���QJ4�T��g���n�F���q��sH�$�{X���\�߱;N���]���%yľݰ��I��b��)Tˮ�B����l����X�,�`������S�`��<J��	Z�G��$�X�)��@ǽ�4�D�S�a/k�������$���$��O�:����P��b#j7[�[�{Wv�u-�
��-��?՚�<S�NWā<M|t-\-?BEԟ��k�wV�ϙ:����݌��p�-f	�Eҭ~d+nZn��x%�w������$���v�M�	ޚ�د�R���K�lIR� �R���J1t M8�����Z�F𷢤��g�+X��9祲GCR(��`��G2��H8j�u��{�|�ԉ@��VM�"_���83Y��r#�~B�FZ�����F?M>�XO��Xw��b�%�=�+/�!���4⿒�0;�N�7Ė�K!%��9����5��f'Y8ќ�I�|� x4�����6*��)4�7�5[�j�q��J�}(ߛo_j��&��>Ή(�\v��ߎe�ϗK�YF�k��O)�G�Q�d2yx+�H'7��^�G�q�eY̒('0��V��0�)m(�֚�~�J���Y&��I.Ў��hZ�(/.i���?��f�0T=�8�=�C+?�3�C�d�I�J��KEu{@L�9K�.M�Ov�����=�t��Վ�Un\�}P���ԣ��gqJ������[�}[�f����X�      M      x�m�[���D��Sa�0�;�q\2S�u"��Y{�BH�\�OJ?�������6��g������5������g���>�[*k�OM?�w�E/a���75��~R�_4��|h�C��׵�wwUQ� ��o�&[sX��E�y��Eԟ�<~�����dm�X��oY�Ơ�C�'��b�Ї��ކ���9E:���h��ۤ�O��z�����T:j9j맾�����ۮ��nа����}0������4��.��Xi���F4��M6�N�5��.���.Oo���xl��.*����n���w���c�ۃ��orH��;���B�4��4�%æ�]��^{�hf��?V8�y�^1z{t��3_B'+G�3��EvI껥%Y=6����J�s��d����Q��������� ���4u}��w���
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
�\̑�&5T���!�۰gxYW���Z��qZ��ո9}<��F^ԧIa��{{�����!�#�+1���������V��v      H      x��}Ks�H���+`6f{�"�@��|Hb��!Y�t�^ %f+��ɇ������1���j�>�������c��@��LʬZ]��R~�������l$�"�K�^��i�_���f��^*:>6{"���*R2Q6z7�.�j����l���/�d\�#]��U�V�do��C���.���"��g�"M�W�rzSE�ώ�#�;�:݉��A����H�$���~_}������/�j��Ƌj�XΓ������\@�e�5��j~_N�F��WQ��t��e��-����XF�N��ޔ�r>����ZD��2������~�s]�gxl?��j<�E�?F��t�gM���o�I�ft6��2'��k}e"Q���rU�'�
.v/���O���]�*>���Ws�����)�Z^��_7wyp})�%7��n\�]�֡i�]�>��z�n~��o���g�	H��6��sZ�K����r>��1b���S��j�q����~��<\��beg���RO �M�	v�����h����j��2),�����bU}��
�>/I����M�T�����[5��������ŕ�L8YF�H]��I{f��Dn�@�b�WT���et�,�����c�A���K������1��ル���`�8��-�n�:)���D��d<���M���ϳ�������>OA��b8�K8��m�� ��̞�U}��NN��Wi8�i ��s�")D���dty|~&��\D q�j^���o ��K��Nf`�f��j����{JGW�4>��ˇ�('��ÿ�܍�ө�ѻjZ}[U���b���X��[KZ�&*K�TGs��1(�m5�ގ�7w�Ţ���5޶ME�V ��2:�<�z	��q���u
 @i�J$��j�����И�w�Og7K8��2��5/�� jZޖqQ
\ů�����UBN����Ϣ����wf��Y�n���0��ݑ�IZD����"~����-����n~δ�;΋�����L,��Ƌ�__�]=����+*Iu������������`���7�4NK|�'�-�r�(�?�ttx�F(9�ov����"�,�Kpc��S:1�7:���_#iA�O����y�&V�������4�J���(�]��Z��X�^ÓݮD	��I����{�?P�G8j��W�ɧxvs�����~���>U������r�l�՞�2thW�T(���Oޞ;��k�:��f�T�r/m�?��ğ�׼B���x��d�C�yR�T���ï��]-AY?�V��FL�a��'�g�$tG!����؈wwR' ����r�����9*��(��j�B(E�2�j<%��~ty����ܰ:_�T��hC�dj����~��_��W�?'��bR.�ř"�{sWM�H�T7����謶���V�Hۮ*�Q�^_�_�#큫\�+���"���:u�D7�F��"OVޔ���U$R+y$��.�:Xp7��#��$� ����&38��XH�\��õ��Z�9�WItU�-�k�
+@)�6�s����I7��hC���/T� �)`�+��	Ƴ�B���S|	1A�_�9��x'q��'���ϱnx�W8���!�@��强89�t��H����fF�%~������S�/�2]�Z�%߀]7�Ҏ��]-g���r��n�|��U�}��V���[�mU��8�?s&�숒 Q�j�� �pQ�;.��e
6���A�'H�ʏ�o���
8�t����x5/� ��OV��/H���Ӏ���Gu?C�2C���r�5:��� �|q7c�RֺU�l�*�\},���l��L�ѷeuS���"��I�����OΌ��6w�E�����X>V�� U������b���N��6&/�	����痯�:/i,'��'1G�S����K� �E���ç���>[}Y|y� ���o6:�0��8zQh�X��b�������
�jh�q|4I9���~zP��
�	%ASj�S�y5�IN�.�T/��������M�{��;�/|�c1\sjt�VlG:���h�jRd�%�K��k��ݏ'���i���o����n��[�H��չ�\�������ð7���¡$^C�(�l�p��VB�%p�'8�|�K4��~��� f�R����^a��޳����E�%�����r>bs�S��	�W\9awDE�ph�8tZ@�)�;ٍ���
.� ��
���9Tr6g��Fԭ-b�_	�A���0�Q���-�E������{~;�G��������`�h��r
J!�S���"�C���њo[�I}���6?�L�i�?��D��T���7L���O1'�K�s�bC�>Kn�������t�-8�i 2J�>E)ё��-��B8P~���U��.1��5>��|��N *u����觷����ѻ� �"e����"�+��~���I��݅���)Z���-p�*�*1ݼ�	I�)	$�ɱ����-D_|YK5�$�"vY�����N/x��D���k��p<o���T�x��W��4.��Ld��UWӨ����pe��N�@
/� aC�K�mGdUp�ߊ�3��<`�EZ[h���آ����p���"g�?iwT���(M@��-p�c8���s\�}�Wd�p�%),'h��2ܾ�&(r� �}��~����@�8�;�[�s�����D�_��嬼c:���O�����r'o~:{�Nc�b�A!D��{oo�KxeT����Av�w���9�$�/�K�)��l��e:�?W�{�4��ⷫ�h�N	���L�*. ��r�\~,�K�e�~7������q/�JN�d�?.Z��D����*U�I��_oj�?��!c8 	������>�$F��] �C>��!�cZ`�p�����1�#LC��$�g���;�jNlO:HL�F��|r����W�7pZ�j���Z�L=����%������b4zZe�t�'���ג�q&]��u�/�4��y�9�V4��J�yAJ1�lZ- Q|���EF��R�r>[ܬ ��m]�u��=��
#EA'���bm-,'�;<���uX�3BQ�����a��r^ݢ�����gT2�(m�JP����f���)�7|��|E-{�����Z/6�+`C��G�=��Ra]f
��x��`2D�+� ���]�?"��Z����x�eޗ_�>�����<�_�9�w��b0���v1��0t��������f]���`<��ژ�|I����b]��a+�?���9e�S���ҦY�:��"U��Y����8� ���p��Gg��2Y"B��&5':��c�oR �;^�\�[N?F���W���l� ���/K8BT��_@��W����=�rtq�Dl.~��������9}�sz�`d(���)E��p�:�b3��Xm�6����|GN�����1�-���_g�͗v+'s�^� ��=�������`�-z
���oך��]X����c�*�,�M�?�r����6�K�,� 6y�Ŷ��n�E|3y���+!�/���ן�4�]�'��^/� P\߫�h!P&E����Z,1��?�������Մ�]�
~m�a��KY����Gg��K�A��r�!�"���R�{��rS�aА�ƺ��i�����ad���F�FTM���X���{)մy��"�+����S5I���'��Y#h���bL!c,8����O�\�7qf�)��??9^G��l�?{���ʇ�����5&&l7��L^���2�/o��]�����|�����y�#���}�	�
~�&����x�aFa�ȍ&�fz����x}xO�mP���و(��*�!Hj�:�T���m�OoQ��>�*%v�����̩ k1��ϟ�����3ǌA9�
�#ք8�M���lt�L���x5��Dz��ON)�z�}�¢L��e絚C��Φ��ï k��¤�M�F��g�U����%�%wb��k�n��8(�0]r�jG8%�l�l'�,�$��]S��K	.ؗ��	�A�z��    *�C#bO��x4��_��p�2>^���w���l-�-��(�/D�`�}l��{c�..�ώ�w*�'�u��A)tU�rG���&�,�C�:`kWk`�x��^'y�h���R�$��-��u�y��G��,q�L���6d2O�������"�0�a|W���?'�j��z;�PM��/S'���a5�֥����|��|�1����I;�Pg��#����w�O�;~�9X��:`���vN��Z�Z*,<Q��i�v�ǲ;���& �
l��h�r!1t��A�K�R�DD,2ÊN}dL���*��b���lfTdr>���B�v�K&k����Wi7��u@��8=�&�K�VpG� cy�}�&�
�����xIv���ϕB0d�����1����*d�G�EyS���s�-+��p��	���'��ѱ��խ�τ�!p@�P{�#����t� ��x)3ln~�P�Աns�܎��w�k2OQ�.�77��,^Mo���n"=^L��S���[��Щ���������GG�mS��lbj��ʞQ�5�k5ҧ�n|4(t4���ԖwU�f6�����>ů��}��3˟g�[�fp嘏�����C�stpn����\������J�d5 �K��Ĉ0��!�x��H��T�O�����/���۲�Y�gz��ZI���0����d�y{	(���#���@�dh�nz_@�Rp{�~B0����e���Q����� *�x���Ir��ݶP"1������/:/�f�{\��r���c]��"O����R�,rŉJ�a��4�J�o�p^b`�a�ZRd����ߗ�E5G��xT����|�?�����6�j h`9];�lNy8*]���l:�n�c�l������W<��������{���U��kV���T�HY�h4���3�g�u�$��o{��,1����r�����H�>?[_d�JK}^�����|h�.'(F��H��Ӈ��/�?LJWA�,'���]R5:Xڛ
4�t
[�\5�����y��l��N��|����~W��s5�\k����ˏ���#������nE�V�y���w�W��)�Y��anٯ9O���"����\p�]C}Ѽh���Uս;=l u�!�~m�i4�-���#j��R�8g2u�sg��T�I���lA��?��
-շ�������0��������D¶^(l��d�����̹�۹3�u��+D2����m2�&�	�+�Tض�~6Y|�,�T~��V�$~5�����AAރo�V�B���+��+���G�{՛�`\P� z�*�Ggv0�:[Vk��<@t0^¿��K���8�)� ���&��R!���tOn����;ca��۬���i���)dw�&<���0��:Lv�-�i��.D[�t�eC������5��`�+)����M����8?`g8}�$�A��-+���[�LR��I�J�N�sd��v¾Ȱ��!![l�g�H��RGqh@�4���m��m ��6A���]��u���;���= �*�a��,�͹K�AR�� N�+¤�l]ȘT�lG.��tx9]>����@k��z��T~��1X�*�G�e�e�:��%:��)�FWR�^���>cָ�%��~�Y�����z
&�d�?[.g�{�3t�ͻ������� k�9�?���؞f���?��>u��H9I��1I�v�<3�Y��l���	ś��1^�� �PH�R\�����L�|Pz���P��7�_����C�3I�
��<�O���v85+�5�n����͒�;��t*��	~��!]�}�������T�.X��xs�r��	Z�D\�ظ?3�v�bU[`���q*\p��]1�Xks�f֐�e�S���t�&X����n3ה�QG���l2י��80���x@F��g�^N�]�ڒ۠����P�o�$ۚeيīN� ^��=s]�L���`�qr���^SSXa�*�|�Q�i�(�l>)A���} ��e���/e|��\�៲���Q����Z��-9'l�|Vj�*h��D�"�g��2
�d6�8ew�vK2��+^�T�:#X1TqQ���ܕ����W�ar�rZ��-���t�(������Zw��i6�道V!��<�����r����%j���L����$~*[~���zQ���/�P�to���)H�h<w�����.��2:?8���L����a3�ī�L���C'z��m�.!8�!��O��Yk3'�k���z���	�JT��&� I�d�B�nq⡵ۄ$� ��(Bs7� �t:^�^�!9wY;���O&F3�K��+��TS���{N����:�h�	:�DlRүP���;�L9븃yx�U�A�^ܑI���x��(�	��_n�}g
��U��2.t��Tލ��s2J������1C@��j^3`�]N2��ߙ�`x����� L.o� �ğ���g��VU����?�XЅ����m��>����ܑ�a��~�$�\|%�+5kj|��xݾ(�+��d�
w��qw�'?.'r���¨�
?%�I�:@�s6�n�լAx t>��T'p�<C��P�t�c�2�9��\����F[ݻfG��XL�?�D_(�(���?�dJ��}��I�Ao���{ݚǸU�A4q��H�0;Je�WX��0i��:����X`y5�MƷ岺���&8e���Oդ��i(��?�m^��I���S�'4���I�|�]Lu�Uؤ�cl��۝���[�R�F�ቲ,]�Gql�s�+'�o�t'TpRӠbB�v�D��N�� "Y�}_�����'ZzN!˚�]�f��2��!���3ɩV��I���Y?��(V��3	?��z:(�!M�v�PX�^�NAX�8(�4�V`OV�ૠ�r���囋9#�az�U�Yfz��l�����e�3g���w&W��*s��w�K
�47�-  y2�Hy��ۑe��`�e��3;H�	k�B�딕��q�^L��i��6�a����i���11����|�!�����f���#yk_��ʃХ���w$Tx���	���.Ts��}��|��R���!�U��ހa��?�I� #�*���>���N��Ҟڲ�U�b��7��X�(O�]p6���8��eJ�I�����)�M����9�Cp�\��Ե�<��k�ȼ�=��ǝ�!��G95�� ��䊓�ƴ0/.^�aF3��)�&x;�xXx~�^���,ל�5(�@�79Kw���9�˹Kj�<-�A�\��k��q�� ۴2{�������.���Y�6�t����q��|Q�d��?�5�MW!t�ؙ����$�CUsZ=l�	�}!�K@-�o�GG��HNH<O�@��оr�X��FF<^��Z8�.��o'X;�/�l����_fL�+�Yu��2r�)����)���g�Lzd\�ƫ��MNTM_�ވU���>Ȍ���������:kG�c⤶���RJ8���nGg�$�w^���L��ݥ�}���������Y�]Y�[�G$�E�'巯��������L����R:����|^�A�sY��+т')�6������2����Q0��&#�0|��p��ш������1�8-М���*���@�p���+��9g������ޜ�P���7qbiz���X�&l��m��&�,c���(ip�35w��2�7���"�\��4xO�Xq����*D_��oG���Br��P�vyk.[o)'��ǝ�b.� ؈H��Ŏ,�_o�q�C�tL�9�pk�ʽTvҜ���wX9bxs�Z@p7�]�M�=��S]�;�e^�I��}�^��/�d��������]&Os�����L�"kȝ>�0HN���3�dw�Ͳ�Vc�6�� ���|��(8�נ�v�^pE���K �nZ����r���7��6`E�nz����
O���Op@q|UU���j6��`Jwj���N�͓D��f�Zd�A�(    _�S���CB����H�ѽL�GTź��boܦ�O�����]I(a�k�"*�f�n�OgGs�R??���ng����t6�g�a"���T�����8pH�{k��D��\���YO�VqA�
ֶ� �ݠgSh�k sG� RN�hL��Mwˍ��տ��l�}y���x��G-$�-�n;��a�!H�0I�P����y7��c<���t������3��nz�+#c��3�ɞ����̰0tC��e�%�����E��H��݇�g%�@�����3Z���Ug���X��.�_�Ot�r1e������zobq�G�Z��_^_�osc�;?��b��i�U��R��է�홼{-h���a�Z��?�!1���S�{k���d ����n���7�Նg�j�xB��A5�����^>�]Z������]����i|�	�3M7��L�Dsg��綇=�ݑ�a1y9�e81*L;Q����I�xø I��C+E���L���F�k�v�V'N�'/������G'K�զ����`*|�}=��b1�P�f��57��Q2އ������
Īr�Op��חG���--؟�>'&�%Vsl�?u	����+p�
���|���E�ZI�|�?W��,���*����Y�M�4��Ȼ��s�T��t�+	y�a�و�1Տ�� *����!9'�^��p�q��⾣A�8O���҈� 5�Z�?�P^ݝ���@��a�X��tD����e��ǐY
��*玣��==�#�������Z�Ky<�5��<,�<��8��DI�-�^(IENfH���T�}A�;�lq	���mN�S�R�j<O����A��I�2��O�OSC�3��rAP=��|���qw��t�gM3
���lt�B�lc�;YDΥ鼢9�bfbx~��<S�-�a1!����ػ�ݞ���f�%ݎ�M�q�S!P���?>���-0.��ެ�3
M�|���6	A8U����x��)0y2FJ��D�O��������U60���'pۇQ��$���E��X5�L����Ս����L��Y����ቿ0�}���_���yw��#�6���Qi��8s|����2:�}|	J�U����ꤏ��t���sZl�d�Ȼ�`K4�/�_��d]R�i��� ��껕.��ӊ��=�z鎬����fG���uT�g�x�s��9�P� ��v��xL�_���k��ư��TQ$v�<Swuf;�)u�*E��)P�B4�i�f�.��SoR>��"�t�y��;{�����]���A�ִ_3i�}�~t��cy��Ć�쁨0�LKf<H��j&�a�|�7VL��#�HҚ�j�i��zo�y��(tۈ;�t�p�B/�
õ�?�7��3òo�����peAN1rV�j��D���~��Ζ�5�M_p^�Bk�A�)�e�k��Iw��7:�Rl
"��b���J޵M
P=(�0){k;�I�1]��.K�g�.|�T�s(@�r|��;G�*_}RL��u���q��n�(�^lݮ�ەi�ĆM�S�hX���{�V&ɱ�~<�[@�R��U��.Ƴ)���|�^w���i�D�M�+ ���L��eI��}ܲ����{�{-z]-�?���M�h$����o�.�6�������:�7љai��zR,DT���l�f�xd4�(��ܘ�8�Ϊ'�E���`E2(��Ĭ�,C��5{}����e	�0���Ww��`����hs�VX^�������8�L�����j]Ra7ޠ3b��J�����`Q�}�yk��T���$��Й�����l
�.P!�æXUcc�u��l��/���|A]���.�	����Th�Bn.!��4I3	Ý�էؚ4R%��A�K�Xv���mv����wֻd�"���nڠja9q�G�۞TD�m��j�xu��2!ǉ��6��<��X���7G�AS�t��̤9,�#��(���$��433)۝��]�pPT�.R]�`6��h @l �.4k�k\L���S�﹝�lC�1��9�ɛ�� �`$D����0�7 *�e�C��,Y��#a�7���h�������T�e��b����Ң<MYԭ��U�x�^b)aF8�.��n+���w�c��-t&6,���^��e	��$���-�i;�Yt�Cg��
n�p4�2�J�Ԭ��8�-��
�M�����Y���u�-ʋ֋${�yN�MO���9G?D5!��&qՙ��ۋ G�6��3�a9j�o��R��U|�qr�U��չ�4�������_|�$Or���X�ۄɇ?�����Hً��u߮�<%���>A&E��м�)>{��M����?��n��$�_�ן�~)�2!�o�/d=p7���Ky���ѕ}�b�:s�C�A��K@`�=��XK���tR"���NR���g��3�9f��lN�4��[���*J���x��-� �V�O����׿�&����g�@��ڎON]R!9g�4O
T�;�V!�
N�L_`^����$�r��>.�_��8'��"v�M�1�w)�a{�*��!K0dΛ^d&�Qtg=�ҏ}C!�~�B4M����zzp	<��d��KfEw��è��b��K��ʛe&RpYL�#�083>HmY.Y�߅��ҋ,����byC�c��Hk���߾M��U�����W�ɢ��H�Tzo|stP�f-D���{9�L%E4�����O�����\Ϋ[���k|�Ojt��|9)�-q�/W7ㇿO���7z�y�]_�9礪����<-���7��,6����S
��r�ݜCS��	*����/Z�,B���kh� �ROљb*�����Jbx��\	VkXL�ߎNSlE�(����A$ʆ��)��s&?�j�^yr
Jۑx�!�)��w'���tL��#��2Kjr���S�dR���A,�0�"W&�
t�6E��r沁���&Y��C�ɵ��b/pU��4�B�ʳ��C9ڡPsh��a�q
�̢�NO����q�7[��^�=j��s�bPב����L{1Ώ���h�3�`����?.��a�R7.�psd��*��z�f��Y�T;2L�()d��m�Y�V���Qޡ	I�vu�;�9+A���~���YZA�
�h�B��Q��,pU�;E�ڴ�Emsb�%R��$+��D9dX��f!CH�u�}O��I�@�㦤 U���LE��6^�)M򀼽i�~.0�-ؠūK�Oh���ZVN��D��1�����5.�̀T�{�6����O��4l��������ɢB�&�.Qp�y���׾�q!w���2�Itc:N����}1o��Sp��&��ZM�w�&��M��q�_H�����L�u��ܝDD��o�`�gxT�W��M��s!y��8��k�8�8e��ܝ�D� >�7BP���Ldu�G�ü"P��x��9A��;J�a�/l5�Xp�X�P�,F��9�����I
���j;���&i��K�0�uH��e+ �dC�����m�CW���o�HNI��:����	�k`^:$��[�4H�m�?=��)��ꊾȼp>K԰�)������ b2�^&)U�#3�>�5��(�1&�^��y^�|�x4}TgΊ]ξC��ԥ�<#w��bo�Ƃ�0��"v�؋�ϫ;��tOJ��>����r��W��&ŋ�A���q{&BQ��`�����¯Q1ih�rVb�f��ew��/4��!;�rZ�|ݎ���,���2ED���d�`/�ĭm���]w0�嘧�JDi7��+;���]�wl&��� �/�i+����	Q"�8���� ����$XM����\G�(��-!Z�ݱiΊn�d]a��9L!s{6gϡ>5&�o��"O���1w��'nEA�\¿]���c���#�Ð�=D��]h���`��YVw+3i;�Ҹ������6�5[&DgT��,Y�b�����nX� ���پ��Q.p�{����K�U�*�9�.V��8D���Jf�ȶ#l��ۙUX,�t�Dy�&e&+�R�    +��R���A�úS�Iz!���q����Z��U�GƤ��J\�S)^�N����4���F{�4����=9�,�Bi������ga���4���dY�d?׉9<��������F2��j�}�&��!
6lj�i�0zb�M�X]�mC3��%-5t�;���B�/sw@��Ф���`���,�������X�|Rr=��ꖐ���X��~�wn�:�Ʋ��V�'y8(�S����c|pW�J[�?V̱0�}�u=6N��p6�.��k�,v�bt�k4��pm��ٷ)g6l�����a"��wc ��QB���'���h�T����Y���.������`�+},��K�j���o�����(!��a�b�*:�,���PDn0��GmD�Q��ZfC7�KԬ�n�j�f&�ȁ����r�j�g������ �n2�Gj�!���1������;A�5���a�����.����ȅi�2�腫��hA�a&���l<|2���������`խ>=�u�J8h�!#�vD����d���4rc�;��`�Λ#(�(�cd��|�ti�9����Ԝ�<���;��@���{���C���j	gP\����dwb���ղ� ZV϶QC���Q��Ɵ��]���K�e�q�%�i� u�1��OM�c�ʌ�����)��g���=�?���+��M1�{S�>/�á@*BJ�pH�シ�7�n��ی��K|��&���������)y�`ڄ��d ;��J�c�xɆ����A4к��Z4�d �F��s����#[�ΔR�J�� ;6��X�RNnf��S-_�	� �b��do��C��'1���E��;xw|vt��Yˉ����7�&֫��޸Yu�.p(�HDR;�E22��F`p	��)uk`WG�k`E_`ޢS�S΂ّl� :Ӌ,��X�UfI�4�a�Nݼ
��8��c&���OL8c��F'�ϖ������os~R�׋�|���k����N��UlO�� �__���Wq�� �6ŞM��N�E�����] �?/ѿ���p�Y˰�õ#0��0(%��=rL0��~��X���a|�]��ɛ�!R�!�J��6ֿ3�-�/�7"�)���@���I�O.0����F���0`X�3E��N5!)ׂ���P:3�^|��_)����.t�Z����RY g�����W���.�_�$?�pt�a>��M�~�����xsg��W�T�]�Q�\�۳R@ņ>ܸ��N�B�����CvBk��(�D6$U����S����K���ͯW���Ɨ%��~
����"9Op\_���O��)z����6]'Ǘ.)�MOD^ۨEw<t?�і5�5�'E���	�6=a�a��Ő�k���ۂ����ޑ��XA�P�s�<�%����&yx��{���[--B,�q��6_��uf��3S�8R�`���yħ��f ����Ȉԍ���:l̦��o��ĻD�������C�P��8	M]	�������v��$����_���ï�����I�8l|=���Xj�Ԗs��2vV"G�����O������4��p"P���A��ݢ/�vp��)�oPK`L�
O�qUmr���B� �0��/56��t� N/@���DPb��t�l��nW�13�'��'e+T��qz��&ۂd+;lvf9��E0����p�	M�HL�V4�^�L�Y���w�Q�?��(�#�^
�6�z�q�d91mN��5��?���7�x>2�q{����(Hu�M���F@�2�0����d�� 7{��p֏*��g�������)�{��O ����?΢�+!�/�3+�%�+�Q<zk>�sVpn�9<Ƽ*tE>dݮ��'�?Q�J���
�ߏqDne<!~T��x9��R���F�?9Odgx����J*�9��X�\�@��I��2|����}azi�D��<�::�y<dA��NIN�b/J�x=wa�uy6��\4��F'�Or������5�4�כ)h�zТ�g����sͨ:��w�Ɩ�����Sm�	u�b:w���u��8[���	\����$0�`���횎0��;�<Ș�J>U�u*z>-nMs��8;��6&>��,��b߂���0zï���-:v7�{B���p,Jޏ���-6>����w2�����ߵm�ݵ�ޫ V
��5A-?LV��.�{_N�g)�QY뮖i�)�?��ࢰ����u��W�J÷����*��eGZ�"���6��٧M�0'��-���/pVWpc73t���n���̓��� -���񬮎����>rL�ʄDmQ$�����7�}^!o��ŵ=�y	q̈́��iy;�Ѵ8�ǭ�����6�χ֝�����!������#B��ɩ�==eVA�;��B֭ ��'* (a9a�}1��S�O)Y�RI�rN�dOJ1S���Pd�*�X ��c'q�)��W�� ���X�2�\���MMO\��'�1��	���� 1A��̣1�����a���<!YH�Dwi]/�p|�+�
��Һ�`&��*&1�up�eg�X,{���y	A;j4!T,������8>W��5��m/f�@�M5����~��8�,���!���3�yPo��edI\���u��������<�3������>FC��f/Q��Ls�f���5��&��i_����`����5K����F׎U��UؑM��/����"��do����z����l�e�"���z�����?��D"�_�u_\_��]�������#S�FE��Q�{=5�c��^~��� �r��$bR�=юZk&O�d1��Z�ix#W�^���lǄ�8��;t6�^ם��}k���@�P1Snr%od�[��(�[~'��Jw�|ZR�u����=�G9�ߌ7&Ʊ����_�7�6/qsF=%�y��U��O��b�`�>N&ZjB#]1��Š�Ӕ���R�r
�(g��wt־�E:��Q�?DY#���w0� A=~�#�t�#l�;�4�e�LB�ꑧ趺�A��j����*���.���6tXe9�i�=)��ht�}�V}�� ����EԂ�f�v��;��~ ��gċ�,9�l�<:\��ț�������Ē3Hj�3�m!![�)�z�غS��
tor>�Fw�?�Ԙ���JaE�wbBo/ґBb�����6�9�h)�P��7Y��z�'�����=ތ������sBe�#h�0C��fB�R��MƷ`�n��O��/Н}�&���1�h#8��y��UO�q~r����q�Y�cǢ'�Z��Q�'����0�L��҂S�洘L���<O���%�V[-w�d�E�,��pph����t�ԝQ��斑V%�Op�_|UU�͘��ͱ�i�f§�t��]0����?��fyzg��a��=A/.L�H�P���&�\]�7O��'�Nsv�y����𛔬6=z�%a-&s��N�-g�lO{��I�`� ¿�ͧ`���`��f�'p_�zl��j>���&�uî��	��/�'�E_�^�z��03bm����s�P��,���Auk��eVdXBjʒ��v`���yW&T,P�)@��o���M�x�߭.ҝ�g`}ꑺ$}���6��12�G+��l"6E�M�s֎���d�=���_��.l�񲟊��AZM���r��9�n�%]EA��o��y����9k;���Ԥ=Ay[| |��V�� ��.�����I &9t�(�]#{b�0�B�zF��N=y��g��Xx{	
�yAWӉc��G�.�}}~x^_�#�e���C���Y�E���x�e�x�yh�t/P��7$e�Sw^9{5&�Uߤ�2q����2�/$oš/Rg,��b��^~��Q��Ma��&z�׶�.0L8����Tj`�ɕ��7��lr$�-���'>I��6��Q���x����'���PL�������Fi����t_l��@��.�N���Yl �  6�H	�MA�Zkza똯"�:�u9����|�������Fy�aR��e9Y=�o�
��n��lZ��:L��G'G�zrk�/m >)�L[f���/ܹa@)l�����r�D\��'>����	�-�C��1tŎ|H��ոӄʿ8l26�cuL�1��P�-���dn;@2�x=F;��
g9�8�e�6[辈�Z�\�z���EΉG��ֶۋ@�
�%'�/��;N�R�i��~����Ԅ��c�������W��-'�F�f�,o�$:�~L��pu�|b��`k��VmZ�b��vQ����ZI�^���<9T�}�ǋ4�{��N��B6�	�'XU��1��ޚg�E��55^��z?�K�N��͝�Ƨt��L��ݸ�#��SE�v<�!�g<юa�;d��y���K�Ԕ� ����z��p��:�ŉ���yt�n�jV�l��	�e�D�I)D���ڰꎮ��/(Pn���j|�"�{r����h�?����p��7��>4R$S!d߻k��)�\I���\��Y6 ^�7���&+�",B2"B�A���Z��)vכ���dgr��Z����c�D�k�BO�3�/g��R C�i���o8.�Cmu�<?=��Z�l4����lU4M����S�"y�.��G��`P�#T:�O�'{�����f@f��f��X$L��}���B4]��>����F����"6��=*�p ���A�Q��uOx�:�h���P�Q��M������J��YM'���y��
\D�=�8�5��7��L�w��8�2h��Ch{!��nRT��gm���b8��]A&��������6�h�ktG��vxl��#PI>|1�%w��N���Be�:���&�����)��+����k�L��5�J�����P�/6o���4�'*���Af/�������t�Ec�C֞[Qv;��{���ځ�L�Ȋ���9��?�"�l�:s��{�ή��PC�D��e�/�v~.K���$"��dOD��4�9�Ӥu��"�C�m���V�
�W�j�D?�5>�o ��TD�X�Q������;g�2���H�yݻIp����T���˸�M�IR����,��򾨼K4�6g����22��3��(�������;t�$���/����p�u@)'ۮS�V|Oz9E��_���i�dg>�s�Ԡe�p�O�T�^�:�Fe�Af�ZmGŦ+�:I�����X9o��I�[�+^v�
%���I�y|�L]�9��Ü���\�jZ'ߩy�.Y��)�]d9՘��nu#�hm��=�=�|%QP]��٨�a�i�W��;E���0A�����y���.�O��pw��_`wV�˞}7n4ffO�)r�R;��^��@�˛rrW��*~5_��S�����v|c�`>[���$V@�ǋ3�g"7�Z.V��_�ty��\Q�;��yO�~޳4�<H��;��j����0����y/d]�l�8��n�yo���b��WX�)W��n�"uV�QX�����9�p)En8�nl�aiW�����=����7w�Y�A����� ��~�ͭ���F	��OA]�^�/��K�������E/ �0�X%)���?�:��)c��EU	��'����p�=������&�yp~z���&�kk*,�H�縳3���F��9�C����;t�I���Py�/4�/�gT_��(����Ɍ�G��<�u�(�dSP�q�d�ޅ�t�ռ@���NK����Sߜp�~a��s����>)E�$���Q��=1y�nlK�vg�^��J�������¦��7B�i�F"@�M�͊�|�ĺ�Ba;]���ʾ��u�ϫ�s�V������[��.�)�#���c\��+���ihG]au_D�"��^S��0ۼ'Bo��&��#K�̉�l�ּ���7J�x�J��s0�N�bsJ�o1�z]��of��8�ӡG������ڞ��n�\�t��km
[�=1z�6�ݲK��t_3�s�{}��	�\�sW�������D���^4���FԶn���&.����,>���R��nKZy����K���N��.0��M��,�.������X�h�n��h�����Xa�v������=�=q�s����c���ך)v���{�SFF����Lޠi�fг�5o%�j;	�bׁ2
��p����@�V�,�s�5�n*�F�e/��O����$���9L�/&��dSm�0"�Q�Ne������.��W�8��m�5���O4}i�أ��Hv�(#�]iG�Un{��Y�s�D��]d�8e������/��@S�g�JT�e8	ّ��̿L%�9����7բ���j�O�f��h�
��E����N�X�ǯNF�W����c4�"M�3!��.��z>�֢����G��ۡR$E�	�{���{q�ŁA'B���JDF�������lG<2�Q!��,����"���C�K���_�#w����6��͛�Wo�˦�����y��+�{�^�Z%�%j� �a��&�L����&�{�Y�����
��Y��J��3���Q���Ȼ�X���9͕8{ǔ) �!�
�v)z���J`�b�+��R���1g�!�YIڥڎ�Mz4B��9���I֌�Hz��dX|8(�K:'u_D�0U���/���o�>|Z��11w,�YMV�Hє7�}ty]k]�K�u(�=���~7�����(�*��Φ��7�Xe�o:��AͰ�5\���p��`z��s+h���8��}�y�P
l
>���/�v���=���zdӻcB&��U}XE1���,@$�"j�'�-3���H��ț��8���F�T(d6�A�-���N���'�)��QIQ��ہi��-Z)Z���']�]��Zd�-�K��>LV�߶�/'�j�w��mY�Z���n^���1��5`���.T%�7|8�=!y����Kr@�x&<�#^0b%dY��M��%|N��&@�N&����4GH�����gr$.����	YpK�!S}Ϭ�H
W��]�	,�)�wp��|�	��3��W�mJ,y����8F����q���T5�vu��xb#�	W�_-W�%X�%]�Mol�����[g�3�}W���o�[���AA����B�t̐��`��t���'�.y�	P�@�Zd��#�������ˎ�0�4�L�gb"G#�c�<��ɴ�SnhWd��b N��a����!K���h��6��g.|��r����L,�L㖉B~��u'x�.�\�{&3���-$�	Ps�̳�g�q��l���=���.�_�S�T���1��0����{��?"�����5�����\��J'í��vy�1������B�s#m�S��5�¼
{���f�&�S�����C��|��=!/W�G����گ"V$F�y�V#d�~���)f�� �L@�f�i�������xt4�Û �?r/M�,Sl�$�:�Πi�*rWk���rΆ
L�n�4�3Ѱ�$tGh�8�T�A˔]���\�*5>��y�,�,)���^��K>(�Y�{��uo�b���V�L	���y��]�K��őTW��χ1N�0���?'K�D����}�@���Z&��u�Wǧ���������c����� Pw�f�d���z�������k�����w�|W      C   F  x�uW�rܸ]�_�ݬ��	���(#ű%+neR��͆�0�@�Y��LMʋ�>�����r.@�[�$�z���=� f�;eX����;���UU��%+�ğ��#AGm�D�/x,����o4ήX��tɄ'�5��[�~n���.��&,��D�~�ol���T���Zu�xN\���O��L&l�?��k��a�q��<�$�1/9Z��&c׭�۽�����v������V�vq�(��nI`���ٲѰ���m��)��Z���4��+b�l����K�ZNuE�Q�n]��>;�Eʈf�@���j��	���1���wn������
�\�j��ʙX��,���m=�*\-��%��$��pyʊ(��_�9�a�*�1^�k�$��$tZ�4��x�F�r�+��+~��ޑ��7Q%+�D�u��9�� ����#e�`Rv��
rv�H����E}��Հ���C@��|r!����S��{T,s�8q�He���[Β�ӘR���Q���]�;�=���R�V����{Si�F6�3'�IN	�ؽV��k~�s�kT���Lߝ,�x0�D���Ȥ�X]��t[������U��m�y��􊘀>�]��n]:K㓆��i:��	��K����W0{g�_�Zo���64�p/�i�VLF"a����|��<2��W�SxR����J���kכr�u"%u�T�D�Ҋ�D:�n�K�o��/�n�Tq��mL�ߪQ]G9�,'�z�c*�%x�r����}�[FȜ��4���Ϭ�s�.w����k�[LGh���b���k��x|�:�(B�u��U!���j�Y.��lJZ`*������L���]���?m�3H�0:5tT����P�K�q����h�?�n���0�by^6!�j����s����/Ț���X7�܌�� Z�:C$�ݨ�T�XD�7�5f�sb Ǽ��a60��i� ���fM���P�֪�נ�r��4��[.�Y<g�њ�l�k��gt�wԈ�����,com�*lG�4'~�x`bڧg$9m�G��z���0e�9��-�8���4���F=��$��<Ѡ��F>�WPx+Z�m����Q��f9�+K~ t�-�&��f����2�[l�o�^!����I1.)�jF�
��1��*kƭ��������F��>ou{�=�W�L�b^��Ҳ�:8�n�����`\�]|�u`�i���ӄ��2J���v��=<�<�y*�>ͨP�XcAD��7`����#�0��V~m�ՅD�d]�ѕ�4�:l�� 	��dLel}Е���?��>�J8��(�G���ڳ�T����#��.��(H�v�4UF,rI�L�,���PO�Q�0��	��}�� �Ϫ���M�u����o<�3Zޙ��c����~8�J���@`��Nr�zȿ0!�,I��Ld��ߤ'`���J�o���;/S�m11o"�I(�n�$@��7����� �c�tR�����o�܁݌_���v��DN̰S�+a÷�[g��^`��ì�����Q.9���!�+ݸ?Z�s��ɬ`?�V��<Q ��U�;�V�WX��G��E��ʷ�\�hnP�,iP�y{`i��q��z}��;��z�e�i��E�S��s;�F܁o8�f��Y._):Qx^O��H�v&�\�`�΅�׫E�o'Q���ue�E7��-�K5�oZǳ*��������s��e��CS[�01oչ���%Ʃ������3
=�Be�A_��>߆�@2?E���Re2=����"�b} ���TB(��1C/6cS�:g��P�?P�>����!��B�b�`ZlYe���Q��;[m�����<a~�g^�M���z�n�A�mU��ʆ��dT4aQ��=}��7A������Xox���q��?O.�U����OP����t���6x(X�=��:�t�&	�'�ٶ�&TM���:A���*���SF�k̃���s��g"�%�Q�_H5���vc�b,��j�{^�!�P�FյjL}|9����ɢ�.�y�:�����U�������Pekw��ˌ�Ք��F��"�����z      I   .   x�3�tM,.I-��2�O����9��J2@�&����f� s(�      K   [   x�3�.HMM�Tp�((J-.��050�T055յ�06�2���,IMQHL�NLOE�76���2�tKMI-J�Q��,(��KG6�hB� �yQ      ?   �  x��W�R�L]7O�UT�
+�����@L���p5)6m��;��=�-�y�T�d1��jv~�9-p��GQ���}Ͻ眫�?(+
:��Ei���JY��R��e��)3BN��l�KqN�sm��zd�d�$�='Ǉ�GG��)y��>M����ݼ=�	�9����LzȾԒ�JL�֐єW_�~�g�\�k�+�B
c5�
G�.<�W4��(�ދ{$�� %�F=���6v���w{>�{'�vw"2�L�sFOp�g艚sc9+����Y����z��.-�b�&�wJ����HOJ��c���=�����#DA�!I�dkEq�G5[)�Q3$j�?��
z�&�pr� �݆<�dt�gb�ĭ<���Ru���%����`���-j���	i+��`���e�ސ�Z�53{H�*)nW���t�ؒ��Qt�B��?��y�=~��hL.����􌭵`�D��d�`�3��g4��$���|W�\��z1�j�_*���z�n��V�YM.�1�_'� t�i�4KSw�)
}�$�SNo��Jz#����N�]������{o.
����^��oYQpcJ�|k�|��[,��y��7��ݝ�\�e���-��=s���p�W���,�ȃb* ��%H��y5V���\��
F"?�H�vxWX6���Fq���&Y�� 4/�,�$LQk6g�����Y_m�0��8'�a+�[S�݀�t�D��ڈ�m����>=��oŌ���GI{}2d��&�K����)�+��H�����`��m7�DqB�h�{^rI��*�YJ�	
���]s�>�{�L
�soε(���ÏG=4(���#�_)Eo�ђ��� ���'����du�ڶ�C���QTȿM����ߤ��@��h����{�q��||B�������9�������-���믜&��5���u�%d����*@��<���9xH.��>��C>�.s�&Z������j���;�s��^�(eW���e�=�W���5�wP��]������(�:L7w�	�$qw�N��l���2=r��\�y�ƞ��8��\U���,�d��m�q�4O��t���S���ܤk\fӹ�s� 9��P��0��l+�8Q�,��E��l=g��p1 ����^��
b
��:�AUN��q@ӄ\��Q2g&>yoY�£�i׏��e�%�}wqu�޷�$&3�􌣫��Nb�����(_a�	�_rT]7�K�*i���잹��a'O"��纤/&wJY���ޅr�׫
���`�L������u�{$�}�vhf���\k~+GP)NC���$W$O?h�4�7Ι�ѓ���]�͌����Am���3�.��qQ����5T���r�ͥbϑU�l��y�=AQ�H�=��6�m�;=~�_Ԋ�/�j����,F(�0�W��?��sU�߸�����e�U�N�?�J���_�I�Ds�Cp��yY�����~Y�͙�f:��
%�?2����K���+5�#�$�A�ܸ�{�L+���u��#��#�p�����%ל��e�d�`X g=�A��{�A�tB ����f�AO��5s�sG̛�M�"���n�L$��'�F:��r@�ٍ����5�I�;��$ؾ�"e���y3 Õ��WFT%9��e��./��J�L��fh4e{�ф�<�r�8��8�͇ i"��3�@
s��/�0V	>#GB��.�������z�4o��"���n�)Yӓ9~��Ϩ0DU�� �dn �~s��g3LR+7�rz��l�$�Fy˺�/�1+`v�5��^,8��޶�T�`�tA1�%�b��I�	���J�:�vH��]�#f �(��R4�hlz\�*K���o�I�\�䢪�hUJ�"���=���:��>��,���4���\h���خ��0��b{��x���t��GǄ��5̻~�v�z�)�hv�����"���c^���#�*C4/�7�翼;u��2��m���z �R��7'�π��8�A5�Ѳp�x�m2�z7��n7�i�6'Iɱ)��(k r�����%�1os�࿪^x@5`8���a
|�� �Ob�%^�:a�Yf�.����s��}}��g@�+�6�S�^��4;*�S��s�(�Ү�g��}��4�t�;k_���{����A*:Pu��k�⬉�'��5\���ɊB�%��!�t��^�0�D���I������?e4�J      J   7  x�M��n�0Eף�)��H-c'Nuk����"m�8E�M��C�����y���~*���Z2Xyw��4R³�|����p*�f%{X��;��lC*�Ϡgvo��4T"���c�F�a��L#^˙Hgz�!.t�1�b΁J�+1Fjxra��9c��o���Ǣ��_s�4l}��ky�T�`cC�P�
z%��!Z���,5�{�eMcg3��W>(˜FhE�=Ӑi�k��-��F���L��u<PFEcK��C�6�Ys�:�ۛMɞ+���{� �Uˎix�㥆+&���xӿ��V��;���Ukh��\��U�[�Wc��G� ��[�坖��8��/��.�����B�U�\����R�E��!%o/�l�c\����MOS��O ���a�'$�����wI��
����h�*�&'�S	��a��G�n>S�z�Wg1[��K�T��qE{D�¯Y���~�R&g��hz��Q7��DUFζt )����T�M�i�P��[�L=�ˁni�Zr���vAt���ߕV��v����݈�͚S���R�~i������     