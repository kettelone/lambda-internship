PGDMP     -                     {            postgres    13.7    14.2 >    r           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            s           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            t           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            u           1262    14301    postgres    DATABASE     ]   CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.UTF-8';
    DROP DATABASE postgres;
                postgres    false            v           0    0    DATABASE postgres    COMMENT     N   COMMENT ON DATABASE postgres IS 'default administrative connection database';
                   postgres    false    3957            w           0    0    SCHEMA public    ACL     �   REVOKE ALL ON SCHEMA public FROM rdsadmin;
REVOKE ALL ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;
                   postgres    false    3            �            1259    19115    Photo_People    TABLE     �   CREATE TABLE public."Photo_People" (
    "photoId" uuid NOT NULL,
    "personId" uuid NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
 "   DROP TABLE public."Photo_People";
       public         heap    postgres    false            �            1259    18985    albums    TABLE     C  CREATE TABLE public.albums (
    id uuid NOT NULL,
    name character varying(255) NOT NULL,
    location character varying(255) NOT NULL,
    date timestamp with time zone NOT NULL,
    "photographerId" uuid NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public.albums;
       public         heap    postgres    false            �            1259    19062    appUsers    TABLE     �  CREATE TABLE public."appUsers" (
    id uuid NOT NULL,
    name character varying(255),
    phone character varying(255),
    "countryCode" character varying(255),
    email character varying(255),
    "textMessagesNotification" boolean,
    "emailNotification" boolean,
    unsubscribe boolean,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public."appUsers";
       public         heap    postgres    false            �            1259    19052    people    TABLE     �   CREATE TABLE public.people (
    id uuid NOT NULL,
    phone character varying(255),
    name character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public.people;
       public         heap    postgres    false            �            1259    19034    photoMiniWaterMarks    TABLE     @  CREATE TABLE public."photoMiniWaterMarks" (
    id uuid NOT NULL,
    name character varying(255),
    "photoMiniWaterMarkUrl" character varying(255),
    "photographerId" uuid NOT NULL,
    "albumId" uuid NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
 )   DROP TABLE public."photoMiniWaterMarks";
       public         heap    postgres    false            �            1259    19016 
   photoMinis    TABLE     .  CREATE TABLE public."photoMinis" (
    id uuid NOT NULL,
    name character varying(255),
    "photoMiniUrl" character varying(255),
    "photographerId" uuid NOT NULL,
    "albumId" uuid NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
     DROP TABLE public."photoMinis";
       public         heap    postgres    false            �            1259    18974    photographers    TABLE     N  CREATE TABLE public.photographers (
    id uuid NOT NULL,
    index integer NOT NULL,
    login character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    email character varying(255),
    "fullName" character varying(255),
    "createdAt" timestamp with time zone,
    "updatedAt" timestamp with time zone
);
 !   DROP TABLE public.photographers;
       public         heap    postgres    false            �            1259    18972    photographers_index_seq    SEQUENCE     �   CREATE SEQUENCE public.photographers_index_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.photographers_index_seq;
       public          postgres    false    201            x           0    0    photographers_index_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.photographers_index_seq OWNED BY public.photographers.index;
          public          postgres    false    200            �            1259    18998    photos    TABLE     $  CREATE TABLE public.photos (
    id uuid NOT NULL,
    name character varying(255),
    "photoUrl" character varying(255),
    "photographerId" uuid NOT NULL,
    "albumId" uuid NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public.photos;
       public         heap    postgres    false            �            1259    19097    selfieMinis    TABLE       CREATE TABLE public."selfieMinis" (
    id uuid NOT NULL,
    name character varying(255),
    "selfieUrl" character varying(255),
    active boolean,
    "appUserId" uuid NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
 !   DROP TABLE public."selfieMinis";
       public         heap    postgres    false            �            1259    19084    selfies    TABLE       CREATE TABLE public.selfies (
    id uuid NOT NULL,
    name character varying(255),
    "selfieUrl" character varying(255),
    active boolean,
    "appUserId" uuid NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public.selfies;
       public         heap    postgres    false            �            1259    19110 
   userAlbums    TABLE       CREATE TABLE public."userAlbums" (
    id uuid NOT NULL,
    "userId" uuid,
    "userName" character varying(255),
    "albumId" uuid,
    "isPaid" boolean,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
     DROP TABLE public."userAlbums";
       public         heap    postgres    false            �            1259    19074    userOTPs    TABLE     �   CREATE TABLE public."userOTPs" (
    id uuid NOT NULL,
    phone character varying(255),
    otp character varying(255),
    "otpCreated" bigint,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);
    DROP TABLE public."userOTPs";
       public         heap    postgres    false            �           2604    18977    photographers index    DEFAULT     z   ALTER TABLE ONLY public.photographers ALTER COLUMN index SET DEFAULT nextval('public.photographers_index_seq'::regclass);
 B   ALTER TABLE public.photographers ALTER COLUMN index DROP DEFAULT;
       public          postgres    false    201    200    201            o          0    19115    Photo_People 
   TABLE DATA           Y   COPY public."Photo_People" ("photoId", "personId", "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    212   �S       e          0    18985    albums 
   TABLE DATA           f   COPY public.albums (id, name, location, date, "photographerId", "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    202   �^       j          0    19062    appUsers 
   TABLE DATA           �   COPY public."appUsers" (id, name, phone, "countryCode", email, "textMessagesNotification", "emailNotification", unsubscribe, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    207   �g       i          0    19052    people 
   TABLE DATA           K   COPY public.people (id, phone, name, "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    206   �j       h          0    19034    photoMiniWaterMarks 
   TABLE DATA           �   COPY public."photoMiniWaterMarks" (id, name, "photoMiniWaterMarkUrl", "photographerId", "albumId", "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    205   m       g          0    19016 
   photoMinis 
   TABLE DATA           w   COPY public."photoMinis" (id, name, "photoMiniUrl", "photographerId", "albumId", "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    204   1|       d          0    18974    photographers 
   TABLE DATA           p   COPY public.photographers (id, index, login, password, email, "fullName", "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    201   D�       f          0    18998    photos 
   TABLE DATA           m   COPY public.photos (id, name, "photoUrl", "photographerId", "albumId", "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    203   ��       m          0    19097    selfieMinis 
   TABLE DATA           m   COPY public."selfieMinis" (id, name, "selfieUrl", active, "appUserId", "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    210   T�       l          0    19084    selfies 
   TABLE DATA           g   COPY public.selfies (id, name, "selfieUrl", active, "appUserId", "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    209   ��       n          0    19110 
   userAlbums 
   TABLE DATA           o   COPY public."userAlbums" (id, "userId", "userName", "albumId", "isPaid", "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    211   Į       k          0    19074    userOTPs 
   TABLE DATA           \   COPY public."userOTPs" (id, phone, otp, "otpCreated", "createdAt", "updatedAt") FROM stdin;
    public          postgres    false    208   ݲ       y           0    0    photographers_index_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.photographers_index_seq', 3, true);
          public          postgres    false    200            �           2606    19119    Photo_People Photo_People_pkey 
   CONSTRAINT     s   ALTER TABLE ONLY public."Photo_People"
    ADD CONSTRAINT "Photo_People_pkey" PRIMARY KEY ("photoId", "personId");
 L   ALTER TABLE ONLY public."Photo_People" DROP CONSTRAINT "Photo_People_pkey";
       public            postgres    false    212    212            �           2606    18992    albums albums_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.albums
    ADD CONSTRAINT albums_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.albums DROP CONSTRAINT albums_pkey;
       public            postgres    false    202            �           2606    19073    appUsers appUsers_email_key 
   CONSTRAINT     [   ALTER TABLE ONLY public."appUsers"
    ADD CONSTRAINT "appUsers_email_key" UNIQUE (email);
 I   ALTER TABLE ONLY public."appUsers" DROP CONSTRAINT "appUsers_email_key";
       public            postgres    false    207            �           2606    19071    appUsers appUsers_phone_key 
   CONSTRAINT     [   ALTER TABLE ONLY public."appUsers"
    ADD CONSTRAINT "appUsers_phone_key" UNIQUE (phone);
 I   ALTER TABLE ONLY public."appUsers" DROP CONSTRAINT "appUsers_phone_key";
       public            postgres    false    207            �           2606    19069    appUsers appUsers_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."appUsers"
    ADD CONSTRAINT "appUsers_pkey" PRIMARY KEY (id);
 D   ALTER TABLE ONLY public."appUsers" DROP CONSTRAINT "appUsers_pkey";
       public            postgres    false    207            �           2606    19061    people people_phone_key 
   CONSTRAINT     S   ALTER TABLE ONLY public.people
    ADD CONSTRAINT people_phone_key UNIQUE (phone);
 A   ALTER TABLE ONLY public.people DROP CONSTRAINT people_phone_key;
       public            postgres    false    206            �           2606    19059    people people_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.people
    ADD CONSTRAINT people_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.people DROP CONSTRAINT people_pkey;
       public            postgres    false    206            �           2606    19041 ,   photoMiniWaterMarks photoMiniWaterMarks_pkey 
   CONSTRAINT     n   ALTER TABLE ONLY public."photoMiniWaterMarks"
    ADD CONSTRAINT "photoMiniWaterMarks_pkey" PRIMARY KEY (id);
 Z   ALTER TABLE ONLY public."photoMiniWaterMarks" DROP CONSTRAINT "photoMiniWaterMarks_pkey";
       public            postgres    false    205            �           2606    19023    photoMinis photoMinis_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."photoMinis"
    ADD CONSTRAINT "photoMinis_pkey" PRIMARY KEY (id);
 H   ALTER TABLE ONLY public."photoMinis" DROP CONSTRAINT "photoMinis_pkey";
       public            postgres    false    204            �           2606    18984 %   photographers photographers_login_key 
   CONSTRAINT     a   ALTER TABLE ONLY public.photographers
    ADD CONSTRAINT photographers_login_key UNIQUE (login);
 O   ALTER TABLE ONLY public.photographers DROP CONSTRAINT photographers_login_key;
       public            postgres    false    201            �           2606    18982     photographers photographers_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.photographers
    ADD CONSTRAINT photographers_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.photographers DROP CONSTRAINT photographers_pkey;
       public            postgres    false    201            �           2606    19005    photos photos_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.photos
    ADD CONSTRAINT photos_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.photos DROP CONSTRAINT photos_pkey;
       public            postgres    false    203            �           2606    19104    selfieMinis selfieMinis_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public."selfieMinis"
    ADD CONSTRAINT "selfieMinis_pkey" PRIMARY KEY (id);
 J   ALTER TABLE ONLY public."selfieMinis" DROP CONSTRAINT "selfieMinis_pkey";
       public            postgres    false    210            �           2606    19091    selfies selfies_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.selfies
    ADD CONSTRAINT selfies_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.selfies DROP CONSTRAINT selfies_pkey;
       public            postgres    false    209            �           2606    19114    userAlbums userAlbums_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public."userAlbums"
    ADD CONSTRAINT "userAlbums_pkey" PRIMARY KEY (id);
 H   ALTER TABLE ONLY public."userAlbums" DROP CONSTRAINT "userAlbums_pkey";
       public            postgres    false    211            �           2606    19083    userOTPs userOTPs_phone_key 
   CONSTRAINT     [   ALTER TABLE ONLY public."userOTPs"
    ADD CONSTRAINT "userOTPs_phone_key" UNIQUE (phone);
 I   ALTER TABLE ONLY public."userOTPs" DROP CONSTRAINT "userOTPs_phone_key";
       public            postgres    false    208            �           2606    19081    userOTPs userOTPs_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."userOTPs"
    ADD CONSTRAINT "userOTPs_pkey" PRIMARY KEY (id);
 D   ALTER TABLE ONLY public."userOTPs" DROP CONSTRAINT "userOTPs_pkey";
       public            postgres    false    208            �           2606    19125 '   Photo_People Photo_People_personId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Photo_People"
    ADD CONSTRAINT "Photo_People_personId_fkey" FOREIGN KEY ("personId") REFERENCES public.people(id) ON UPDATE CASCADE ON DELETE CASCADE;
 U   ALTER TABLE ONLY public."Photo_People" DROP CONSTRAINT "Photo_People_personId_fkey";
       public          postgres    false    212    3779    206            �           2606    19120 &   Photo_People Photo_People_photoId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."Photo_People"
    ADD CONSTRAINT "Photo_People_photoId_fkey" FOREIGN KEY ("photoId") REFERENCES public.photos(id) ON UPDATE CASCADE ON DELETE CASCADE;
 T   ALTER TABLE ONLY public."Photo_People" DROP CONSTRAINT "Photo_People_photoId_fkey";
       public          postgres    false    3771    203    212            �           2606    18993 !   albums albums_photographerId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.albums
    ADD CONSTRAINT "albums_photographerId_fkey" FOREIGN KEY ("photographerId") REFERENCES public.photographers(id) ON UPDATE CASCADE ON DELETE CASCADE;
 M   ALTER TABLE ONLY public.albums DROP CONSTRAINT "albums_photographerId_fkey";
       public          postgres    false    202    201    3767            �           2606    19047 4   photoMiniWaterMarks photoMiniWaterMarks_albumId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."photoMiniWaterMarks"
    ADD CONSTRAINT "photoMiniWaterMarks_albumId_fkey" FOREIGN KEY ("albumId") REFERENCES public.albums(id) ON UPDATE CASCADE ON DELETE CASCADE;
 b   ALTER TABLE ONLY public."photoMiniWaterMarks" DROP CONSTRAINT "photoMiniWaterMarks_albumId_fkey";
       public          postgres    false    205    202    3769            �           2606    19042 ;   photoMiniWaterMarks photoMiniWaterMarks_photographerId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."photoMiniWaterMarks"
    ADD CONSTRAINT "photoMiniWaterMarks_photographerId_fkey" FOREIGN KEY ("photographerId") REFERENCES public.photographers(id) ON UPDATE CASCADE ON DELETE CASCADE;
 i   ALTER TABLE ONLY public."photoMiniWaterMarks" DROP CONSTRAINT "photoMiniWaterMarks_photographerId_fkey";
       public          postgres    false    201    3767    205            �           2606    19029 "   photoMinis photoMinis_albumId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."photoMinis"
    ADD CONSTRAINT "photoMinis_albumId_fkey" FOREIGN KEY ("albumId") REFERENCES public.albums(id) ON UPDATE CASCADE ON DELETE CASCADE;
 P   ALTER TABLE ONLY public."photoMinis" DROP CONSTRAINT "photoMinis_albumId_fkey";
       public          postgres    false    3769    202    204            �           2606    19024 )   photoMinis photoMinis_photographerId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."photoMinis"
    ADD CONSTRAINT "photoMinis_photographerId_fkey" FOREIGN KEY ("photographerId") REFERENCES public.photographers(id) ON UPDATE CASCADE ON DELETE CASCADE;
 W   ALTER TABLE ONLY public."photoMinis" DROP CONSTRAINT "photoMinis_photographerId_fkey";
       public          postgres    false    201    3767    204            �           2606    19011    photos photos_albumId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.photos
    ADD CONSTRAINT "photos_albumId_fkey" FOREIGN KEY ("albumId") REFERENCES public.albums(id) ON UPDATE CASCADE ON DELETE CASCADE;
 F   ALTER TABLE ONLY public.photos DROP CONSTRAINT "photos_albumId_fkey";
       public          postgres    false    3769    203    202            �           2606    19006 !   photos photos_photographerId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.photos
    ADD CONSTRAINT "photos_photographerId_fkey" FOREIGN KEY ("photographerId") REFERENCES public.photographers(id) ON UPDATE CASCADE ON DELETE CASCADE;
 M   ALTER TABLE ONLY public.photos DROP CONSTRAINT "photos_photographerId_fkey";
       public          postgres    false    203    201    3767            �           2606    19105 &   selfieMinis selfieMinis_appUserId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public."selfieMinis"
    ADD CONSTRAINT "selfieMinis_appUserId_fkey" FOREIGN KEY ("appUserId") REFERENCES public."appUsers"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 T   ALTER TABLE ONLY public."selfieMinis" DROP CONSTRAINT "selfieMinis_appUserId_fkey";
       public          postgres    false    3785    210    207            �           2606    19092    selfies selfies_appUserId_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.selfies
    ADD CONSTRAINT "selfies_appUserId_fkey" FOREIGN KEY ("appUserId") REFERENCES public."appUsers"(id) ON UPDATE CASCADE ON DELETE CASCADE;
 J   ALTER TABLE ONLY public.selfies DROP CONSTRAINT "selfies_appUserId_fkey";
       public          postgres    false    207    209    3785            o   �
  x��ZIr9<��}e@,@��2���8�;�*96����r*=��RY���k��%��+��YC�SS�2>��B���Dً����9؜U�X�>(�}�?1�#�)݊�B���4kM2��^�����)�X��*�����!���
%��E��$�4��+��JO��/�#�'�R�a�����G/���w^Y�M~���G�O�I��51���x6O5�V�k���fL��!��2cF�SF�-�zS�c�Q��5�%~��|���ȭ�t�:�D�y�oź����s,������q!�Dk��f8�l�[B0BR����.F���ҏ���+QG�R}���%X�^��3��*����r��Y��K^�����
�1S�D��G:��rJa_e�_��WA��>�Z�</�+��)�7�tΦu.�2(xk�DHMJ`�0~�o���9������;Hǀ��B�͈}]���rP�6��!�Kb�?�.�\�v���b>���Rb���	L��N 	>Ζ�.��v�_o9���7���	����d ����轕����/[�I����v���=��P�|���T��Y�M�O�3��%T���k)�}lɗ��=��
vQ�@a7M?��/���M�����ݢ�ޘ_%O�H��kg�;�-i<�?@��I:�P���M+0<Ǒ��/�p-����Y� �^�#������m�Vg�	]�rj���:s^��Q\���G��JXh�����*�痳����������A���+|�-4DP�7�g��\/���!�7*|���`<I���x�?݃ޢ�e� 9�S���7�ʫ�����I�H%
a\S~��[��;@�������� H��@��>�c+ה��$��� 9�V5��U�.I�
1X1#���5��+�U�r#(j.��uB}����!0!�1ҵ��;�N���ش����/{����W�E2�Y�br�_�Y��E�U��|P4A��`�b�V�v� �?S��B�!RA�ۆ�e��Զp��lr���]�>����D����1�h�I����M�T�n|漎���fѵ����?�����[j,��%��_�3�=B.f��*R�G����Nc	�%��"��G�/h;���-�:��b� &Tc6.
�U?��*HѤ-�7��	թ;K��|vg�Qx��#���9>,���JXb
���>���~R��[|�?�����<�nП
�9Z�eQVj5 ������}���B_R��������ME�&o��c�+����� �7JF^;D@FC�!�XĲ�δ8�+����aq���	r��Ṱ��~�r�;�bo�ǟf��)?����Sh�`�Kx�*��t	|rI�M~��]�n2���{��̲�����B�xC=z�=��`
�+��sb�Dz�?B�׆q�	v�|�6��r�:��5������d=��󇓎�<�a���x��N�})�w�$�N��v������S֎(�\�@[������W���.�~�X��9�O�kA+R �6D='<��z��V���}��ӎ�����_ �k"��� ��w̘G��ɬdz �Ҧ����+b�*%k�O$�!/�T�+�r>G&OzF�S�X�x*!�	��f�?I��$7y�>_ ׭v6�n�}�'�,b���b���$�M.��=�|�@����m7	�����H1�rW���I���Sӊ�w+����? B�z��;�Ԃ-��GL]ӂH&ݙZ��"���[��>��]
�L:�?@.Xhȼ�6*�3���G�(�c���_�3{�������sZk�8;�W��3 ����z��G�8�*����IF_ ��l�0��o��U�ɦ��{�#�H���!���`��^����K��.i	�Dv��=,S��M�I�N2:�?@�t�a���!���}�vN$5�8����,��LN���9�9<���ϵ}�o�a	%T��	�>�&"�F����K��3��k��]!�!��le�vn��R���@�6��m��L����$1��|��9ˏ7����=d��b������Ԥ�=:��$�ď$�[z���
9,Y:k܆��_Q�Fv�F�H���l4y�M&����G��5�9li�(=��'�дd�dd��d�����
�ؚY�MG��C��Dt�琉��ȡ��	@z�
����r��6�(�"\�{��Ix�0�!?�?B�V��&�� -��o&(`^P��$~H^��M�B���7U�l�-J��H4�KN'�G�Y�X�0zㄾK���ۛ�D�/��\�}~�MFz����
9h�C-��'��	�L3���`̗����x��
���S����/�^��?��@�Q[�-�#�g�����?��f�x�嘆��}���68԰z~k�}��>;ƛ��3�U�9�8���#a��,�GE�����q$���9�_ȭ[¤���?HK����z�N���~����������Ց�{]�7�;�H�X���S���� {K���1� m�WB%N�0)��/�����D�c��"Ψ?��C��������K�? .O�+D�i�}�o�K�W̈́�w���E����ZxB�P���}�`�T��U���[�/Hx��W��#���;�%x.��=t_O�S���:���>������V�nm�����������=��K����G�W�5��l�����:l�ex�j1�"��V�^�����@�������D���D����N������9���i�      e   �  x��X�n�}���~���}�$/�g�1Fr� �R��1�V�I9���%Y�d>D4� D\����[>K��D묉���!�8���{ޜl7�պ�Z����4�ú9������<~{�}�߻㷆S�	�����9�x�Fi��pF�����q�k⊓1S�(Uw�e�ʎ�9�s�g����æ���-��|�$'A�@��)I�
��X���鲿�ח�kӼ��x����Ks��'��0���:*�J�){��t��\��c������If����=��ǂ',p�4ZEޜn�u���_wo����9��ߺ?|��S7����0N�9g��(�T���5�LQ愳�I.�ِ��%�R)3::��$�q��\�_w�*O����~���/�E	e�"x�ps��4��y?�YZ�4M<D�2�D�I�6�bS1!f��m��w\e���~��~u�������Iw�/�}�>dT�Z�O~�������ǽ@���br(R+��U4!̡�ݚZ�4��K��Pa����U�	Ƞ%kηWy�N����|�N���1ݶ��Ƨ~�z�}���ս]c?E �:Ev��\�#B�3�Lѽ���F�"�G�� q�y+(u��}X.��_�}s�裿^u�Q���Ow�o��kA�o}��vfMͽ����� ��z�Ne�T0,0���ê��ٰ��׎Y��Qs��z��_�e D��.�ڎ�9��ȣ��������h�+ԑi��$�'�r���Ex���i�(>��o`���h?M>.�S�l�� b訫HO����Y&����&H^�;,%����1��;old1�N"�S�nX��b �&�x��6�a���;[në�]��]M�w������sTH��hgi��2h�	�`���6m���2�)^.��9���}�7�}��%���"�]a�l��K���6�,��`I�tkj��>Y�1f8Uz���$�K12ټ_�Ny��/㰽\�M�A�}9?�������C�vƤ;4��6x������@"f���%��)�ht{5o�c�>�a�2�X�t��>��w!�q��̔8�>;K�zGԼ�(1EgA)!���lv\Ps��_�4�g?~�����C��������EG1�AR�7�E:�`�����W[2��e"pL����觝(�c\���W��ö�z���Y���m��a�(ǝ8 C����J��X)����YR��`A�%��������,��x���{���q�-o~|�/�5�Jk/.�N&ٟ�`iS.���U
�̈O�-��B�Z�8��a���b@'�<z����]0�j�k�Q�`4��քJd��V�`����Z%��2�@GH�1�����
$X���
ąq�1���`%���:�h����R�爮��L�g��oj-2%�I�V��.|J�(�h+�0�������Ż��t�@�"Y3�ȧ�����Ump4�A�()*8ǝȩ��㪇�F(��;Y_�e�~����)��{����"h�����8x�\�@�~����Ds�e+�N�ԼΛq�7'��us�g�=ú}S��� i��K�Q�$�"Z��
)���?�*�?���d�U��|�A�����zbjK��h�I��4�%��A��Ӝ�������
hS�Oi��7\{��-�[��ڧ��S�0	�����_$Xи+H�7	���x�헫�����x�:ʰ�c˝I�_�g��y�\� �L�c�f�iLP�&�xjΡ� �7��_�Ӑ� kȻ���0^��ʽ����[f�Q���g��m(�!h ���\o<��M.x��1ͦz��NV?�����@L����>U	X�Ib1y�`6�y"w����N����E�<����pYCF0s��3ƚ��|}���������Ha���sS�1H�RAA(�,	�B�Lpj��;ߺ���ǎGNw� ��q�G�ZJm���;c�����$
�S��@�}�Sylޝ�=v�2�1^�43��Z򹩍!�Pް�vS�6���AP����eخ*�_m��2O�>X������M<�'Q������a�� ��D4�98tU���	���`�!C�/~ԟ�
}s)g�����ld�{t�V=7��AH^� EE�����H��;7mN�M?�u׼��w��\����)�������$�K�FrC��̐ܨ��t�ϒ�mvy�� jJ<r��#������+-�So1dV��R	<]d�����w�v�/ߏ?\��K��GtLA�L�?3��ڶ�����      j   �  x�}����6���SL����2�m����,�	� A�}��wrw�f�#����G��rC��6`���VS2�}��׷Y�,	�P/_~>^�ϼ�3 B�+�FiK���O)���u��`��Y`��4Kf*�X�!V����6�U�}�>I�m��TS��AsW�;���藷���V��ķ��/��[�-������S��|�<j+�
���|��T`Τ,���r���_���o�U1�?��o݄VQy�K���L���v/���p`�^�C�e�����U��YX�^`7L��`�e��j���G�v��{��J4��~`5T~��8��,[�5��YZl7��� ãأ1XF�<9�vB>���ߎ��qu=�>H��]܇A�đ���mN��rA+f#ӯZk�$�؆�j���'iIl]fi�4�%Z[K�U{�ه����>�b�"���Y��,-c�!5�Z�D��v%�1D�(�Z�vO�m�c�8=����gi1��s�{��"��͑��b܃l����k��R�����2VI�C�"Q�@���8MQ"�c�m��r�2����}���e��c �����V0c�F*m|��m��z��-�`��;FD���Bt����@<�d�ZF�H�	=+rl�bĕcN���;�LZ��˲���h�      i   z  x�}�M��6��׫ȼ���^DW�&�,�	Un�"��J����C
ՓEN �jaP��1��9O�!}������� �At`9��4���-,��([�62���Ddg��Ǐ��'��mG�O�U�8F��Wh#&�8rJ��jR5�a�e�({�����Mڲ[��b�X�|B��Prd�nm��D����<��~��傺Iy7���6VgH���Z�Ӟ��TS#���½��ޥ��uf�TLYL�쭯G�����@����==�̝9?QWiSt<�N���On%��|�[ �)�о�ޤM�VC$h^T愬�`�P/�7
�M~;�x�������MZY7n�JOZY_�B4`�(�UL��:���Y�(���~h�K\��.��stf��j��P��&��r�|�b���?���t'��n���\#ܞ�:� 6�H����u���>QrP�ڕ�'�*m���4ֈ*�����vpUe����uG�Y)�;�]ڲ:�v�n���b�. �]L���Uy�;J���FwԻ�i����նeHy%�M�`2��9kE^(�/�\���ԛ��Y��U�RW�����Rb
���.|*n���U��u&�.�����?��m� �eT�      h     x��[˒9�<G|E���h� A0�e/|nώ�H��X��׏�4Rge�����^�J0�x���Pu�І�ч����ڂ󍲲�(�m��ɣ�Ke.�&W�K��R5/It������o_�~�r���Ͽ}��i���s�g������_���9ܟ�������ߏ/|��?痯���{�ק�?���￞wז^��,}���d���*�O�����%�2�R�.�Ů�Hn�ڨ��5�-�|��э�-�#+�����i�q��4`}����T�ͻ:B�U��o;�6�k��-פb9��[�U�B�λ{!z�T�)z?L���3�w\+�+�̮騾IH�խ$)dU��1 ]��HX�bY��w��+ѣ�Kx��w�k�2-�R�.�E�tNnrY�OҔ��BEJsq�3���\[ûBm^}�r%z�ݽ��ޛi_T���n��.�Q]��$�m4�[l2C�(DU�E�ƷT
�F(����B�λ{%z�����v�KI�W'o5���J���A�aз���=��-2��P����V�6b����N�'��"�$��|tu���J�ک���H��л3�C�h��4�^��a��u����L�%�O�*�wCk�^hL]�w��+�+�O�9z�M�_��G��Q�#y��ݚB��ym��a}���]E��j�-�0ە=���ע�O��f�C�t��Exr%wq�je���\�9�NzAI���Lu�u�����s�]��yw/D/�C2?E�i�
Z��:U�Bc�=#'�t���[#����1[>5G.Ӂy�NMڕu［W�GG�������XS� X��@�{ebyōSd�Q\��%9�h�x,�{��:�w��)�8	�o��}6zVW�\�i@f�"�>���)�0��i��A ;�;��!g&2+�TZ���X6{5�u�7����xaԝw�J���R�~��mGӉLM�*�����K�*s6�[��8� 4[Dh"�]M3W�dȔr!z�ݽ��?�ͲCO$v�{�s�p��(9r�<��G�B�Ϝ!R³�l����jbw��+��#Sy�w�^���������`�+m�!@d�[�ȐF(�u��8@[�(�q�z�B;��e�ś�Gz�1�L��mH.�=A��hehD���W�z�F��RӁ�$Oo�o8���>F��󥓩��N��bQ�qR�1B�{O�5�4ӡ�#D�QڞM�L�4���&�#��la��>'�cjUP��
���rY�^':�tv_�D��8��z�ݽ��S���l ��MxC��#g�r�3�QIN1�f������b+�xzH��(�x�TﴻWbG��gU�δGI�͎O��nM�%E�(}J����:JO1�f���*�ٕKH>a��:�w��)�
��j�LZ���ѻ��e�̏ %K|�/�L{K�O
T�i��Б�V'L��է��,1�u�� ���ŵט��:�N{{!v.�g<�δ{m�$B�qAgk�.�'���ؗz�6�(H�.��вV��R��=u���Wb��s쾛��h(k�k]�2�!��u�dYw%����SP9�"=�f�(R��yeܝ��Z�BzF��L{��lo���Cq�`�¼z��/݊P_Z:xi��ռi�d����^�]~�R�L;G*Xf�^�!����1(RNИ��s��<��Đ�k�漹�ժ"F��N{��)�Z��:�.��}�����'��<�����#�g�ݙ��KP��6w�	P���kCe�aY�y(�wF�M���G��B�Ҽr.p���#���δS��������6誮�aj<3X��\P���
Ҡ%�|R�
R�^ɐϻ{%ztx~�m�L��]A�%o�B����c�!W���s��+�$!@�f}�Q}���6.=�8������9z�M{�ue����ަ��UZBHP�,1�M#3UB�v~��� ��T ��,t�9�Yo��s5�6aH	xX�@dg�hN  e#��q�;Ӟ�w���A~c[ Ѽo�������"ȡ�3�$w���Z�Z����؝��Z�4<�w���}�������X��[�=���&��%���-�̫.�&�V���ݝB���09��-�оū����,��#Dz|Hy�1�L;��d��J��d����9{��,�6V�-��B.��`�ص�5��R���/=�>��z�G* �O&��h׈�f�2F}ٕ���͇#�3�;�P��U�co�Тީ�I��Tm�H]��j��n��{I��.EDo����S��K�u"�F�%@l���Z��T���'Ȱ'��{Ӯ�*_wLa�YBX�6�@��o1�!m҄��R�x��X�<]9=���1=��{Ӿ��U]Z6����*.��Xa�Ӧ2}��Z�] AnD��7d��_9�?���g��{�>�_9��TZ!("�nBG���>��0��^G���u��"z\��LN�N{��<XV�ƨ+��Ĩ��I}�2:D�R��v�5�rU1�+mB�n���lǏ�����O�X+xҚ�L;������3떻�4�L<\�Y��U�@?����Na���c��VX6:��ۜ���%3���|�zc9�G��޴�A3׎>Tч��Ru}Q-3Bf�߀/J"�*��C�W
F3'�X�?���><��?N����f�6�\��!����x�.������i��ڰ�ӃD��\���N�,� =�F�yŪ����
vfǣ!��5s�0�
��e�5.�k��:��U��̆�[�@A[xU������R�{��Q���9j������-HB�{5��{N�J4�,�ڕ�z�۹4O�禺(��@��*w�~T4J��މ�n�o���EɃi��
�lw��<��Z����A���n����H��ew�]k�9�v51�rv����D ��!�1�L;DG��N�%shZF��ࡧF��q޼ V��@X�($��!1��j:>���|��k���o7���{�m	eMоTuHP��ʍ�D�}�iG�HkֆZK�	4i=r�O:����Eaw��)�VC-� nE|�E~�=i�~�zp��������>\��`�����\-��Z�&��ݩ���&�d)X�b���2������2_��yw�B/���"�#z������:��fm(�%��6Ϣz��E�g���j�u� ×���+��u�w�2���6�xY�!�}��Q��K�#���kDEB�ou0ypZ�}��$��+1�%����[�h�p�ݹ����^ȫ`���}%�O��n�`]�!�Q����`����\B��q��㙡�0o��=*��=�Z����owhlv�I"�3��]8<=��%؁�|���X�L{V��cW^��t6����<f\v�&�<i�+���P��_��N{{A��os��|dzwL�B��]Ŏ[�C������Aa�Ka�ZY̖�Ѯ�(�8�u��8�����nA}(xL{1��z7R;�b�R��|kF� 7�=A� ��> �*����T�<�<���о�R,�P�������[�~��wE;O�\�z�M{��5�LI�}�s ��
�Q{��5�
����S@���mP=C�x�{��8��5���%:b|�_���T���	��]���ƱtĤn�Q'�e�g2�tmvH:E�׬�B�N{{M��7�/W��_�]�-l��j���Z#J �ψvȖ!�L)l	D쪚���<k�]�����D����-% t�g�C�i�5k_��`�E4��ѣ�C<AV��dK���y����=��t2��4��{��˰˷��p�����ϱ�����      g     x��[ˎ�<W}�|3��G���o�%��m�,��lY�=3-����i���d���P�\�̕�ꨚ8��]b���Zm�#ue�eLG�ى��rn&�u�n�<�������/����˧����?}�����������;��K����_Ǘ�.�����O��_��ڧ�|܉M�i���4<9�$-N�P�����Y���ύ�a39�]�jA)&��E��O?�p���㟽��eO,���]N/�;KK�^C�U��-P�ztF>�c�tV��j�L�>��q'W"&����尿�1B��aU�He�ǫ���xi�E��'q�%��#;��;	6$�֛�Әwr-f�a�ʹ�E���i�q6#0��i�5%��"!Z��svD����BI%�T�L�1;��j��ǘ-��{\ R�,�R��g2W�Y�X�ldeDj(4Z�1�oi%�(5�^�i̎;��D7����L; �HrU�8��;˱�a��([�m�V�]��m"�L#�E5�u�Әwr�R��DeF�F婞�T�X�h������{�7�W��ɴ�*�Up]
3�"��D}��:e+%�2V�B0֜�Z����K��i̎;��W���e���h�hL�� V%�:��Fc�N<XX�L�%6��4�wS�j5�a��q'W"�7/�5d�M��:�BD��a�q��ohd*A�1h�L��W;f�pm-�>�4fǝ\���rͯ1�n��4�}T��z��Z�.��b���97��JÁޮ�A�J����UZV�|5;��Z̪�a�ʹ��������H ��CFM( %�-eJ�Rq�#:KF0&dq1,�Y��9� ;��b)� N̮MtJ��iJ@LF��I����n�_#��i�h��Pê`�QF�]�%��Llu�b5d�.b��4�:��W���t�wr-f�:1�[��I� ��P�,ܲ��yk��q@v*Z�T�Y�m��F츓+��Kb��e�4�9��]����@�7�����='S[�p �N��j']��rj�4bǝ\�X�Q��!�n�!xA�SC���(:���FC���7J#��(��P�X_���xK���f:��2�������|2�����ј�@龢�⧘�J��|n-Θ�2u53r\��Ѽ����4�g�a'�0�$\�N\Q O9!���s1	��G`"��ˎ�d�C�^v�<W���u@�ܘ�qG�;%�$�wꥦ?`jv�ɵ�q|56{2���Ӌk����h�!%�K��ѯ��-tp��P�q@&�Y�J��d&*����찓1K�㫦�d�;:Ҕ
?�HC����!S�(�3�������PW���F�N"	(o�b�Yfv��!�D��8���5@��O�r.USzK�ǊPz%3�L;z�bPW��wg#7WS�3r�~ة��dB+��E44Nޅ��)r8M:��aW"&�@�hƓi�L�	�j�G��#�����B�j��BfEPO���\�'B f��Zn%M��>�E,ʫ�ϓi")���e�h�(�2�A�鈝G�L�1��W���&Z����Y��\��;��ZĨ� +����g�݄��*�L[#G�s��l����f���~f����*-�X��c8��a�"�_��'ӞDc�}8�{$�t��iШ���T�WC��0���c�O�f�S�}����C�����Ǯ�@�6 k���m���
�)w_nT^��'Ӿ*|���&���$nhΤh�7,�[ꌺ\�3aMd��+'Th��8�ʏ;�3�����?�����Fbw�Z��"/(i&��V6S��פ�:a�kX@��z��wr-f%�b�O����u5�%�"8�V�5.Q�%m���u��A'�u�����F�������q'b�����w�>L,���h�uJ!oQ�
(QߘR
�m�qM<i�w4���e����G}«�i<kB�C���ނ+i<NiK��=*���+��d�M������\�2�Z(�on�nDa¿R�-�U��`#�n�"k94_�i����J�B�ɴ�&~�Z{�ˁ��R�������:��6����nZ��Fc���H��|�<��f�- ��`i�ώ�'���&������?�vAM�f��e�)B`Ş`[}	9�q듐�����-�u��f�	
����ߣNa�S��';<��.���Cl���YC1	��ٓi/b��]+3:� f9�9F�n:йP�QO@�W#�L�eJ�u��rǝ�K�ʮ�oc^�5)8U�����c$��&��I�i7/�H$ E�B�T��O
�m��{����^i�_�냜N%���wr%ft��}6�U�3s;	����?�%��������ex�ɬ��L��Zѡ�W��b��ϲ�;���/�ٳi�ُ� �k�;��UrI�q�YR��'>��]���сE4����5�����+��V�Ut���+@G���VQ�� ����F[Wtʒ�ņz����R�iU��|�c�ք(��"�E[[��4����"���[m� FS�*ZBk]��bS!㭣��E찏C�e?�w�͌i�#��$�,L5���
~�.E����ޚ�d�����k��W��ኂĐB0Ÿ��Ҳ.ʑ.&=гyn�ה�N�9�؟���;��tC�(I�\���ix7�\ [�4�;|b��|����i�z��ƺ�D��l��T��U�Q7��<cU�fR�u���\���j>��ߑ;��r4��i�٘"M�0K��MZ���+�-���i�8��
��t���v��j�
��������ք�=�O���a��4�"�V@mW@��S[�H����=Ǜ����;�cW� �T��A@q0���S}ѱ�՜
{H�u��aǀ�!.Z�H�����K
`I鑂�}v�3�T[���Ӻ:5��]��F}�DmK����xֲn%�mB�˺�l�o��u�y�qb���#��C��5��@l<"W����Us!�TBY��s3�c$Wz���eP<�Ayd�F��:�� ;��f�(Wt97��c��Ԝ�ԏ^x�o�䟼�S]|�����i�~�fd��XϺ��&}~+��c	At~<$P6��+Y�sJ�1;��*�rZܕ+��ٴ/�ZȜo��i��qt�d�(�&P���C�u@·1���3��,fǝ\��c�_kx�ٓi_�̰�#	��H�u+�����y�iO����e�n�Rn�y�kD�
���vJ�vr��q�Lp���-9���;�Z�Q+o�	�(wZ�U�c�ִ+��Vh4�C�/k:)a��C>��rcue丈zpL�n�
�u Q����}\�xD॑һc��]��[\��G�j�ko�h��Y�Z�l,�d������^��&�T�i^v��=�>t8#�n�ߎi?�����m"�Vޛ�g�!JP-L�Hb:ו��v��C7]
Z���9Ok��>.��X(B�J}�سi��Р��6��y�5���Ptk�լl��rV�H��A�	@�h(e����?�;���`[E���0FE�5V-����`h*Q�������w�~\L\6��u�4�L�,��1���e�U��o�4�͂*����;����Q�D�r����bO��p�ok{�1�H�|t���=Ɛ{ظ������#)�f]���pw���+�Q�T2�C� �>"�lڅKA0���5l,��"�,X��v��V*�rW���	�){`�P*�����qA��O>�s�G��;���[�����^jx%��� �u<b�-�zeе�"��Y׷�n��G)�R���a�!VW��w� L�_n�����,<      d   \  x�}�KO�@����Wt���}ƫ��J�`(��f<�8�ر!�__X A�X��ѣ�{M���y�=�p+�����K[P; >��3x�E���t�LS�9[o�qJo��,��!Y��j�{	����m�gY�M�}�J1!�7�0���X-%x�cc��\x�s�r�"ne����QT�M���e<;z����I;��Ɏ�dݘ�p�-�ο���\������m^��T(H4E�
?��2e4���S����Z�v�
�
%4P�P�;O���;�z�<j��jXh�Yˇ�}�\�w����_��M���;���0s�<�;Aʈ�H�PI}�����a�;ǃv      f      x��]Ͳ37n]w?��)j@� I=K6��$��bO�*O���X�J7�՞����>C�ا	��S̵b'54Ӫ����4E�Ǳ�&������!�4�Ho��T���~������_~����?����q�Ϗ?�������~�����u��������?��������?w�V��w�t|ry|2Vue��'�B$�\�+��Hz�bW�7Fm���5�-P�A���>܃�r��F������V���0��ز�����O����P�\u����� W|��W���Xw~%V�)���7�.��EE��".6�.�N��_UK��u���Fp-R����5�N���V�j>��q�c%�-VӮ��$�݈���b��7�y��be����Cx�@c W9�U�Z|~^w~1V��ʹâ�hsU�ȥ�9�P���H���#��S� �x���J�i$:��q�WbUnH8��ʹ7Z93#5!_���M��F���,�*>��$����]m���YN��y����CXij1�%Ώ����R(5��{[_��[)��Փi_�d�:�x."�J�s��>���X}QOpPm��1�<�V��j���XOcu���X��y�d�I�����sƼ�ͻ�D�H�k�*b�ц��g��b4�	�j��f;�ۏ;�����aڋ�Q|�(ѥ+$�B��B9�i-�9�\��C`[����1{���i�v��ί�*��o��7ι��JZ�픂�\4˘QC�ek~uI a3&�+�|���5a����|w~-V���~3���h��^���5�_�>%���X"k��*Ԗ&�;W�J�`;)�qNAu��!�Xԃ�e�j_$T��T�22�~��_�p��"��.s6�k �V8%�b���B��ܲ��%&�������l��S6*0�OϪ��/�*����0�1���`���@��!k K��?X��:�a�l��Hi-6ud�*3U�G�\Ncu���X����ôC�?rdŐ�K"�� ��Q6�̭6cwS���r9P�QW,��q��ίĊ�Q�O��_�\Ձ��%T����R���r�"C+�B����"a|��k�R��y�s���X�-�71��	U0BY�@7ŔB@"_	�ģ�VR�������TQ� �#��ꘘ�9��1x��!�V,Y�4�V #�m)�׼�/�xn�+ �$_x�D�L�t`2Zr3��
,�!H=�g�-g������E}�<U�>F���^w~-V(��a�aڃ"���]-1.�6�e��(���=rsI��c+����8YU�Mϯ�v~%V�&�._=�v�=�b��-z��*iⅆV�u��R�ćj��2[	�g�:ˮ�>�T	]��@���HM��I웈�����z7��L�"΀�9�V$[� ����_\47�%E�C�L�$	T���u�4�"u���H鍃�G�7�z����td՘�*�6�rjI� 6 U	@�J+�%=3
���k<A<��A�#%�%|���r��������Bz@�d:7�@Y	��(!@��ހI��Q�����kq�o�͓��z��$a2 !(�m�
]��"^�h[Qpv(gȖJ2�Erpڸ��t��}1R�~���m.B�V�Fu9fP��|a��qj�C�l�`��\�����V�SOW���!ժ���쒭�D� ��V�o�5yN�/x���ӻ,�d�s��Ǆ��jdW#Q�GDcm�� ��	�B2'\.i�g����q�Wb�7���=����QUd�jK�~�k@�}.�H�5�jq�w!ۇFE�%���/���<S?��b��]R2�!�*�AB�b���ږD�O�Gȩ0y�L�f8��"|A��C=����{ǝ_���۵�'�>H��5�T'
��d��&e�1�l92��M���@�\ �
$���9�>��>�Ԙ��T��I&ಣ{�<+roUY��t|o�z2휥���غfUe�R$`HZ+~�fQL��~?���P̳��i���)�w�UO��Ζe1?cR��?

a��$S��M!���bA�6H()0�C��[=_�;?��G��|`<QR�l�"�'�%$�A⽁�w�NR>d*nb�E�U��+N�E���D��.$<B�7���,�-����	<��R�C
�1�I<Ќ��mZǈ����W<���[��dڣ�`�i �2UQ� xb�03�:�h��H�����I䀉�
�w��;?�U�������x,���5e�B��k����t'+��g��W�E�rP��"�l���;��!�[?�� A�϶�Z��_�:��J�ޤ�'��S�,EU�)(@�p��Q�= 84��e��51����f�>8��C���W��;�)���0�H���:/�>3;�*�ṟ!!>rqIA�k�����T�@�?���J� M��+��Ϧ�L-�%�� OxT��r`Z��$c���p�=�;�[�e�ٴc��
��۪��^%�8�aCqE�9ZC�-�{��h;�k�$s+��Y����|�z�RO�=7x趜��m�rA/C���JZf��6�P?"��
�iFWk�ͯ�s�W?���r�����?YlW+��EaM������"
c�\!_1�?3�cӇ���l߫c���Q}�Ih�1Bu+�Fy��Zx�R<��	�t�|ǜ}�Qφ���z�����^.^�%$�>0|0�mz�#k;������>���'�igQ:��J�&�w�r�2�� �$�@a�P(���� wo$/q�ٴǡ!�R=�u�<d�CY�*��ym�)cT�3b��.���h��$����CH�Ŵ�m��I�*�NgC%�Þ��:�P�|��7@=Yv0��b	��f�����8�) ��AƖ�ݤ�=�G�eT���v~F�},��H�B�X���ofL��:����I��p�t���5A}1�+9�8��և�9��K+E�8O����5��Ś;�Sk�9�}̌�/�4;8���8��o)�H=���9�ڌ|�B���y@4�6���W\^	�cy@�BA�;�������yG}_��)Y�I��Ϳ���,r�ԶGl}��h�v�E�N:dNv:���CIc����"m����l?��T���j�(I��W��jӊ�����e&��; ��=&��^>Ϫ�g_�C���]�ģ-�i��)��4����S a!�l��摙Ocu��UX	�ߠ�_�z6��6^�M�Jy���
!�c�^ꀪY[pu�����na�4��C%-��� J�bu��eX=�b ��`�dک����~d;��@-�Qg��I�nu�'��A�R���>����bXK̷?����];?��2���g�i�:���aM�Ů� ���9� ǿb�ٴ���h!�(�䬹)#����5�%䞫�)��4TZl�ƣѣ��
�^#>����|��pK_�eo$!��Ƥ�\E�ti�U=R���SR���(*�=�/��z�5�r~7��c+ĵ�2&9�nS4d��!���0�(����li%X���ɾ��TQ�8E0㉗@bX���x�����"aL�R�F�`;DTA��Ԉ?=���)<���� �d�gan��|�
0�U �xoY�ҶL��Bn��?&~)S]��j��`s���}%Rz�/'�^L�Жo�Njy�5��ZS�;S���)~�*|P~
��0"d�_3v�?��k�
��!�a�C���.��r*a�������%[B��yrY
E��V}�C�TH��f9�����)&���>$��F.?N�Ac�[l.s���Ɔ4�ɛKvV0��\�$�I���t�C��k�*�[�>L;'P�]��̪�#Ǧ�u�l�$��e]N֚=�P��O�G�l��k
�}_��pp�K����SϦ��8�mL&�)y�Y����(8�K��b��}l�#�4_� �j~�ӫT�}_�J��#�{���.O=�v`Q���[�����<���]�&6&�*br���M�^@��؛MR9�<���
)!x��.֋i;��tj�1ڹ6���G�(̿6����vt�%�>�v]��n�� �  g������N]�=��5
�������G>�B)�_���q���<���YM��r��H=�v�Ԑ��k���K��´GJ%��%����h�#�r�bM�>����Eg��H�}MN��l1X�E�|6�,���&�E�~e9g�C�3Z[�2o'7� [@Rg�٤̕���<����jN��cE_z�_L{Kv/��@Yw��#��-�����{�x�p�+��?"9ҀI�/���Y���.'aD��n=eHm��o-�UAbۖX!u�� �n��e�<J���W@�]�_�Փi��Qal���e�+�y��>E��g�����c9ŷP�l	~��X�8Ԛ�|V?��Z��wX}�vQ
k��h���@��@��h���-tm��C��̅W��\�2(Q�|�q��b����lړ'��T\B4ۆY���	��i� Y��6�R ȹBy��Z��k]!xA�O�{ԏ;�+�v^}�v�ߦ�e������\�Տ�<з��������9�g�2�fi���Xw~%V|��]|2���5�g�
�W��(����6M� :A�����U���(x�Z������/���������/�
/�o"!����Z�B2;^��5�J�6jN`�� �A⿣TVdem�i�|��eH=Z���n�i�Z`ŠR�m�vI�IK��%?�d���H��2;4�G�<}O�a��*�(&��K/�i��E�Κ[�]��ke;�?
�ѻ(�/�WZ��̶d����������!��N��}!�k�Kɹo�@oD��lN�'4`?9�������!5�@�ܾBHGFN�H�N���;J���6O?x���tS�4�^M{�->hR�����Uq-�e[[^�6o��˔�R��+�u�j[_57`�:�ә��c�g�Eͮ
��pYxAN�yF���~�#�2�~�-�մOV��[c^��[�+B��@]E�(�m�PcJ%��D$ Y-�4k��.W>��|��?�<��u�g���gӾ��V��_WEB�jfb�em��Z�}�&!���$�p�)t�����a߇fQ�a�Ne�!�4��F4�>��t���|��cI�>��Wӎ��5V�Ң�q�-�+ٚ25x̪�[���K�,o��b�#�~��@؟�:���خd�t�_��l���}QS�l�3o�4r�j%��VFm�hv�q����f�m���p�q~���𢡄oF���dٳ��{�c?	yʎ= �l�V�aWUm���a����$|�ɘ��ݥ8���w��5HEcAn>��P}6���8@"%�����Fls�5Ϟ6O�L�1K��#k����8�ӕN����a�� �5h�L'6�IcA ��A �� ��-��2�>��^ޭP�N3�͆�F��Y!,�1�%���erv��D^�(6�Q��������
r�8K&����3�F��4��qL��^�<�*aTskCV�(�:m�ޚ�cbL��(�~�W��c4L$�v�Q����|Z� <��	�x'0r���Ľ3�U@n)V���J���냂����1�	���1���P��g$�;��p+�=T������m�)Yf�ӎ�5;FVS֭r��t[z��LC��6�9��NH��7Tw~%R|#y��Ϧ���ެ�	�3N������|����m)7�+E��k�#���P��S���?p��q�c��X=L��M٧�R�h�cAW���`쨏B�o��b�x�];�����j�{ȧ��q�c�|��;Ӯ��<+���l�I�O�ORK7B��B'd�1�l�F�<�����Cw~-V^�wX}��4C����\v�P�>+��k	S��:o-�U��$p�T���Ԓ��p���a��b�[�>L��)90��k���vk~�i�:�m4��jw�زRW�+��O
-yz/���gJ�r�˼��l[C,{ Ց~a)	��w8���R�eV���^S�)��?�|���8�f�ֹn
�8:��d;"a��v١D�I����W������R���8�M��L�He�P;[�7@��Z�-�X�N�S��v�l�=�.�A��!�t'�Q��|�<��{T�8V�'�j�^\�]�ǽ�bWDqp#)�!�Y��t`��V���A)��WG;VYId����8��V�TQ�?�zu�c��ڭ��В���@����z~��ٴ��m���N��      m   �  x��W���6<{�"���HJ��ϒ%Qm�����K7@����&{�m����X�誣��� ���C*U�*��6ռ/hb��mQ<ټ,��y�����������ˏ� �{�v��_~�~y���~��?�'�\w{c�߽�O�}�{���6�m%��L�d2{<*C!����p�("���ә�.�����ɳ[R� �5�X	�Ѐ\�t�JJ��,]g(�qL.�B�]�d��_���>k�ѝ�:Ԛf@�:t�
4[)�#���x�tκ�7��Q�匸k+&m�f��B�m�%g���F�>F|�����K	1��	|��a�$1�0������f��1ẳ����	�9��P
��A���%�qZ[qj�V�CZ���	�\�*�Q�#0����'19o?�����*�(z�ɠ� +6M��\�G���2�x��`�Y�jV��#����ԭ�bWn�-�9D�V��0�\���rf�E����9�=a>0ɝuM�����
tR7��x�`�ěT�au����R�rf���d��G`r���`�ep��#L��N��/	�^�B9e��iB�J��ԓ���������9���U�zNU�������6�ͦM��J��Y@E���P*2��M�'�g�Z:�Dc��!���cY`L�r���Kj�Os����q���䃅WƼ�z "w��nέ�SF��4G�1yv	�g�7c�زg��6�m�ڨep�)_L�rv0�J�����i�YJ:�7��-�-u�=B7���nm���P\C7�34
*�V��0��gJ{+O��t�3S#�u���@/�`��[6��Ĕ9/���#n'�.���%��%| K�ns��E�̜��ġ�Hql�%������K;���oyR:-��S�]g����t��HK��c�l�5�����W����a�?"�����Ͳ�C��V�x��I�^���3��y���E�i��d�&��I�"�v��s	�u�f����P=�; Z	ns�<8�����/��{ۄ��x�����V	�W����+�����̲7�I�OK�:�r��"Ao�Jh���D��sK��4��iX,�89�j,�h�����u#��
�������"^h�(BM���؅i�?�SD�-�^������ƥ      l   �  x��Wɮ7<�|����&��-�h��zA���a?x�����5�Xd�[)�	�� ���bg`�,MW��[��m�ʬ �,7��R.4���g�e��z��p�������s��п�?��?��_�?\������c����O�ߞm<��S���i�C7�@��Ύh%"@�$�L�ԝ����S��!�qG�]J[�: [\^{�6�tCOs�����2Z-��Y 6-�ׅ©������_,�LI�Ăuϊ']e������`63�6��$��6u���`��LׄNnk�u,�,n��A,�,�IjCS�^�<"u���&�M�&�"��s	go�`ՙǪ-[�{��=���[/��qي
z���(c���.��{�7��t���vb����<�h�d*�*>�cD��J�����3�
M�,�kj��{��=��G��������1t���
��M)1UhA�.�%�5|s�#`�"����Lʶ�Z��?
���۩eVjLP�@-G׬�91�Ri��Ńhgz�g�P���Nz�ȫ����1K�$J��>hU��3Z�/\x	ʒu7��nΡ�U3��)f�l\B�1y�$�/ʕ��䇒�F�e��Kw��&�a�O��L�F�̛(�b~��Kw�ޣ��w̓�=��=�u���h� u��y�2�1�1�u�vP�߀�)r	Q�;��	�ʡ�K!y����p��gʊ�G��Mד���h	��_�<����NIr�k��z��\*�Ϋ��L�wI�����x�ԥ9��<��A�J�2U���s��4�VY��6�T��W���p���Y�,w�ps�k8�:u�)��s*��B�s��b1�C>(��=8��oC��K��N?��� �7R�Ɍ�mSk}q�G(T�&�I�yn�����C#������S-K0�qn�;E�h�\���|��vp�CH_ �M�V���F�#�*o�Dڸ���e}JƳ g=��h����KN�4�;��9�u#+#)MH-��pK1+?�����U:	 ��"�<tA��E�H�������b������i�+ql� -��Vf5q�
u;nN����:�-��=��p@�2��^|{��A���lo$z˓ {�|"�iQ�-�����r��H�ttk3l��Vz�������5[�����U��|������Wg�.������r���\      n   	  x���I��F���)�hp*��C�����?B�"��G`@�����H�IA�	;V�AЙ+t�3j��7}��f8A���k5�A��NTo���QA�RHY�eˡ���ۨq�7Ff �;�Y��0����t��,\:����O�^��j(y�sL�m�$�[�:��
�Z��X�"�]�l-�'B�: )F�5]ğI��$=���B�Q:TC�\	QkBP���R�\���I=d�,(�56�����딎o����أ��k�Z:�p�H�^@t7�]a]�k�ͻ��hNuThk2�sm�F�Ϥ~Y,�O��ҏ��)���N\��Qf�)��l"�fs�ZW�Լ\�j�yWZ�N�v��ܫ;��~o����ڌ�똸�I��,��*��~����c�p�J��5;��P��=��T�Q�{�A�V5MM�*I���ҧ�~
?T�M�JGw6lf��6���Z�{�:Z��OK���f�$��!�c,�[��ϮÞI�'3�W��
�er%�L1��6��"��}�(�=%n��l�9��*P�!Tٲ��\|����=�
�{��J�N�ǌ�i�N��7^wUb�L�����h���`^�˭�;߰��s��%Q}`�i�>��E9��'���Ȼb�z�Û}?�J���/#�L��BοHR[T�\5��?��ީ��g�G���,66�,�YSSB�Vv��k_E�פ�9����}^�	a�%�<WY�4G{���c��MI�$'׋T�k�Sh�����s��<-�Ϡ�iڍ�,<-R}�֋F���ΜX��"EL+��X|E��ϦP�Gǜ8��v�|�C��{�`-p�Ӗ�U����eՁ��9��j#�~q��k��Ĭ�C��7N=�����;�k�p�d�����t��D����z�����y]ٞ�v-�Z2��9q�eҹ.Ët�9�� �B���X	ndc�4���H��S�N��I?K��t<s�8^�Rʍ_�����F��t��HG�J�T��>�0��&����I�g�e�����qǿ��R�      k   >  x�}�K��8D��*2oȠ���D��/��8y7�yhœ��X��U�f�=edM,c��%�wDm�F�Y,�ƎD�eբLJF6Ĕs�g8���?�?���V�`J��$�d]Z��ѱ/:O�j��o3��/�aw��{���k.�W�|�-'<:�uTH�]�8��Y�RG��d	�pwgaɴ���[
�A�yG���t���#�*-1.L�LV&)�cO�B�%Dώ���ݢ�A���-�fTn��IjMꆉ3��zK��"}�2?��U�EfV�/���3�	B�=�<�,e�Є0!q+��:@��� ��k�p*..�0q���A��dO~��J7�1sEK+�INRݗ�Dsy�s�,m�|�+�!6+?n��h�,���ncj[T[�1C����a3-���h��~Tϛ��՟lDt�7��t����o��|�-�OZ���}�i�f���i����s(�t���ȹ=�a����C�{�#��q����mu�����N3�z��X�j^��kmZH]^p���"`>�����^�9�>J*��#�fk�(���k�3��Z[D�`~�M���rP��/��Un��ѧBj�=I�J�	�[?�� #�'�#^��mt�`�ψc���`;�*�?gi�u��ZM����h����
�#.8e�� ��;X��N�#7s�1�*��%�%��gr�9)!.��P�K���l�<sV�9��?/B<tϑd>Ä���ts+��4�z��*�pb�����1����LϯY��o��,��#hz�B��+���<D�s�Ė��~���A��"     