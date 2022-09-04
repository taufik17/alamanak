PGDMP     8                    z            alamanak    14.5    14.5 F    ?           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            @           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            A           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            B           1262    16619    alamanak    DATABASE     l   CREATE DATABASE alamanak WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_United States.1252';
    DROP DATABASE alamanak;
                postgres    false            �            1259    16620 
   categories    TABLE     �   CREATE TABLE public.categories (
    id_category integer NOT NULL,
    name_category character varying(50),
    image character varying(255)
);
    DROP TABLE public.categories;
       public         heap    postgres    false            �            1259    16623    categories_id_category_seq    SEQUENCE     �   CREATE SEQUENCE public.categories_id_category_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.categories_id_category_seq;
       public          postgres    false    209            C           0    0    categories_id_category_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.categories_id_category_seq OWNED BY public.categories.id_category;
          public          postgres    false    210            �            1259    16624    comment    TABLE     �   CREATE TABLE public.comment (
    id_comment integer NOT NULL,
    text_comment character varying(200),
    id_user integer,
    id_recipe integer
);
    DROP TABLE public.comment;
       public         heap    postgres    false            �            1259    16627    comment_id_comment_seq    SEQUENCE     �   CREATE SEQUENCE public.comment_id_comment_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.comment_id_comment_seq;
       public          postgres    false    211            D           0    0    comment_id_comment_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.comment_id_comment_seq OWNED BY public.comment.id_comment;
          public          postgres    false    212            �            1259    16628    like_recipe    TABLE     n   CREATE TABLE public.like_recipe (
    id_like integer NOT NULL,
    id_recipe integer,
    id_user integer
);
    DROP TABLE public.like_recipe;
       public         heap    postgres    false            �            1259    16631    likeRecipe_id_like_seq    SEQUENCE     �   CREATE SEQUENCE public."likeRecipe_id_like_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public."likeRecipe_id_like_seq";
       public          postgres    false    213            E           0    0    likeRecipe_id_like_seq    SEQUENCE OWNED BY     T   ALTER SEQUENCE public."likeRecipe_id_like_seq" OWNED BY public.like_recipe.id_like;
          public          postgres    false    214            �            1259    16632    profile    TABLE     �   CREATE TABLE public.profile (
    id_profile integer NOT NULL,
    name character varying(100),
    phone character varying(50),
    user_image character varying(255),
    id_user integer
);
    DROP TABLE public.profile;
       public         heap    postgres    false            �            1259    16635    profile_id_profile_seq    SEQUENCE     �   CREATE SEQUENCE public.profile_id_profile_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.profile_id_profile_seq;
       public          postgres    false    215            F           0    0    profile_id_profile_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.profile_id_profile_seq OWNED BY public.profile.id_profile;
          public          postgres    false    216            �            1259    16636    recipe    TABLE     �   CREATE TABLE public.recipe (
    id_recipe integer NOT NULL,
    recipe_name character varying(100),
    recipe_image character varying(255),
    ingredients text,
    id_user integer,
    id_category integer,
    taste character varying(50)
);
    DROP TABLE public.recipe;
       public         heap    postgres    false            �            1259    16641    recipe_id_recipe_seq    SEQUENCE     �   CREATE SEQUENCE public.recipe_id_recipe_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.recipe_id_recipe_seq;
       public          postgres    false    217            G           0    0    recipe_id_recipe_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.recipe_id_recipe_seq OWNED BY public.recipe.id_recipe;
          public          postgres    false    218            �            1259    16642    save_recipe    TABLE     n   CREATE TABLE public.save_recipe (
    id_save integer NOT NULL,
    id_user integer,
    id_recipe integer
);
    DROP TABLE public.save_recipe;
       public         heap    postgres    false            �            1259    16645    save_recipe_id_save_seq    SEQUENCE     �   CREATE SEQUENCE public.save_recipe_id_save_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.save_recipe_id_save_seq;
       public          postgres    false    219            H           0    0    save_recipe_id_save_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.save_recipe_id_save_seq OWNED BY public.save_recipe.id_save;
          public          postgres    false    220            �            1259    16646    users    TABLE     �   CREATE TABLE public.users (
    id_user integer NOT NULL,
    email character varying(255) NOT NULL,
    password text,
    role boolean DEFAULT false NOT NULL
);
    DROP TABLE public.users;
       public         heap    postgres    false            �            1259    16652    users_id_user_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_user_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.users_id_user_seq;
       public          postgres    false    221            I           0    0    users_id_user_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.users_id_user_seq OWNED BY public.users.id_user;
          public          postgres    false    222            �            1259    16653    video    TABLE     {   CREATE TABLE public.video (
    id_video integer NOT NULL,
    video_name character varying(100),
    id_recipe integer
);
    DROP TABLE public.video;
       public         heap    postgres    false            �            1259    16656    video_id_video_seq    SEQUENCE     �   CREATE SEQUENCE public.video_id_video_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.video_id_video_seq;
       public          postgres    false    223            J           0    0    video_id_video_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.video_id_video_seq OWNED BY public.video.id_video;
          public          postgres    false    224                       2604    16657    categories id_category    DEFAULT     �   ALTER TABLE ONLY public.categories ALTER COLUMN id_category SET DEFAULT nextval('public.categories_id_category_seq'::regclass);
 E   ALTER TABLE public.categories ALTER COLUMN id_category DROP DEFAULT;
       public          postgres    false    210    209            �           2604    16658    comment id_comment    DEFAULT     x   ALTER TABLE ONLY public.comment ALTER COLUMN id_comment SET DEFAULT nextval('public.comment_id_comment_seq'::regclass);
 A   ALTER TABLE public.comment ALTER COLUMN id_comment DROP DEFAULT;
       public          postgres    false    212    211            �           2604    16659    like_recipe id_like    DEFAULT     {   ALTER TABLE ONLY public.like_recipe ALTER COLUMN id_like SET DEFAULT nextval('public."likeRecipe_id_like_seq"'::regclass);
 B   ALTER TABLE public.like_recipe ALTER COLUMN id_like DROP DEFAULT;
       public          postgres    false    214    213            �           2604    16660    profile id_profile    DEFAULT     x   ALTER TABLE ONLY public.profile ALTER COLUMN id_profile SET DEFAULT nextval('public.profile_id_profile_seq'::regclass);
 A   ALTER TABLE public.profile ALTER COLUMN id_profile DROP DEFAULT;
       public          postgres    false    216    215            �           2604    16661    recipe id_recipe    DEFAULT     t   ALTER TABLE ONLY public.recipe ALTER COLUMN id_recipe SET DEFAULT nextval('public.recipe_id_recipe_seq'::regclass);
 ?   ALTER TABLE public.recipe ALTER COLUMN id_recipe DROP DEFAULT;
       public          postgres    false    218    217            �           2604    16662    save_recipe id_save    DEFAULT     z   ALTER TABLE ONLY public.save_recipe ALTER COLUMN id_save SET DEFAULT nextval('public.save_recipe_id_save_seq'::regclass);
 B   ALTER TABLE public.save_recipe ALTER COLUMN id_save DROP DEFAULT;
       public          postgres    false    220    219            �           2604    16663    users id_user    DEFAULT     n   ALTER TABLE ONLY public.users ALTER COLUMN id_user SET DEFAULT nextval('public.users_id_user_seq'::regclass);
 <   ALTER TABLE public.users ALTER COLUMN id_user DROP DEFAULT;
       public          postgres    false    222    221            �           2604    16664    video id_video    DEFAULT     p   ALTER TABLE ONLY public.video ALTER COLUMN id_video SET DEFAULT nextval('public.video_id_video_seq'::regclass);
 =   ALTER TABLE public.video ALTER COLUMN id_video DROP DEFAULT;
       public          postgres    false    224    223            -          0    16620 
   categories 
   TABLE DATA           G   COPY public.categories (id_category, name_category, image) FROM stdin;
    public          postgres    false    209   P       /          0    16624    comment 
   TABLE DATA           O   COPY public.comment (id_comment, text_comment, id_user, id_recipe) FROM stdin;
    public          postgres    false    211   �P       1          0    16628    like_recipe 
   TABLE DATA           B   COPY public.like_recipe (id_like, id_recipe, id_user) FROM stdin;
    public          postgres    false    213   Q       3          0    16632    profile 
   TABLE DATA           O   COPY public.profile (id_profile, name, phone, user_image, id_user) FROM stdin;
    public          postgres    false    215   yQ       5          0    16636    recipe 
   TABLE DATA           p   COPY public.recipe (id_recipe, recipe_name, recipe_image, ingredients, id_user, id_category, taste) FROM stdin;
    public          postgres    false    217   bR       7          0    16642    save_recipe 
   TABLE DATA           B   COPY public.save_recipe (id_save, id_user, id_recipe) FROM stdin;
    public          postgres    false    219   �V       9          0    16646    users 
   TABLE DATA           ?   COPY public.users (id_user, email, password, role) FROM stdin;
    public          postgres    false    221   6W       ;          0    16653    video 
   TABLE DATA           @   COPY public.video (id_video, video_name, id_recipe) FROM stdin;
    public          postgres    false    223   5Y       K           0    0    categories_id_category_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.categories_id_category_seq', 6, true);
          public          postgres    false    210            L           0    0    comment_id_comment_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.comment_id_comment_seq', 37, true);
          public          postgres    false    212            M           0    0    likeRecipe_id_like_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public."likeRecipe_id_like_seq"', 64, true);
          public          postgres    false    214            N           0    0    profile_id_profile_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.profile_id_profile_seq', 92, true);
          public          postgres    false    216            O           0    0    recipe_id_recipe_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.recipe_id_recipe_seq', 55, true);
          public          postgres    false    218            P           0    0    save_recipe_id_save_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.save_recipe_id_save_seq', 10, true);
          public          postgres    false    220            Q           0    0    users_id_user_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.users_id_user_seq', 104, true);
          public          postgres    false    222            R           0    0    video_id_video_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.video_id_video_seq', 4, true);
          public          postgres    false    224            �           2606    16666    categories categories_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id_category);
 D   ALTER TABLE ONLY public.categories DROP CONSTRAINT categories_pkey;
       public            postgres    false    209            �           2606    16668    comment comment_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.comment
    ADD CONSTRAINT comment_pkey PRIMARY KEY (id_comment);
 >   ALTER TABLE ONLY public.comment DROP CONSTRAINT comment_pkey;
       public            postgres    false    211            �           2606    16670    like_recipe likeRecipe_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.like_recipe
    ADD CONSTRAINT "likeRecipe_pkey" PRIMARY KEY (id_like);
 G   ALTER TABLE ONLY public.like_recipe DROP CONSTRAINT "likeRecipe_pkey";
       public            postgres    false    213            �           2606    16672    profile profile_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.profile
    ADD CONSTRAINT profile_pkey PRIMARY KEY (id_profile);
 >   ALTER TABLE ONLY public.profile DROP CONSTRAINT profile_pkey;
       public            postgres    false    215            �           2606    16674    recipe recipe_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.recipe
    ADD CONSTRAINT recipe_pkey PRIMARY KEY (id_recipe);
 <   ALTER TABLE ONLY public.recipe DROP CONSTRAINT recipe_pkey;
       public            postgres    false    217            �           2606    16676    save_recipe save_recipe_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.save_recipe
    ADD CONSTRAINT save_recipe_pkey PRIMARY KEY (id_save);
 F   ALTER TABLE ONLY public.save_recipe DROP CONSTRAINT save_recipe_pkey;
       public            postgres    false    219            �           2606    16678    users users_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id_user);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    221            �           2606    16680    video video_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.video
    ADD CONSTRAINT video_pkey PRIMARY KEY (id_video);
 :   ALTER TABLE ONLY public.video DROP CONSTRAINT video_pkey;
       public            postgres    false    223            �           2606    16681    recipe id_category    FK CONSTRAINT     �   ALTER TABLE ONLY public.recipe
    ADD CONSTRAINT id_category FOREIGN KEY (id_category) REFERENCES public.categories(id_category) ON UPDATE CASCADE NOT VALID;
 <   ALTER TABLE ONLY public.recipe DROP CONSTRAINT id_category;
       public          postgres    false    209    217    3209            �           2606    16686    video id_recipe    FK CONSTRAINT     �   ALTER TABLE ONLY public.video
    ADD CONSTRAINT id_recipe FOREIGN KEY (id_recipe) REFERENCES public.recipe(id_recipe) ON UPDATE CASCADE ON DELETE CASCADE;
 9   ALTER TABLE ONLY public.video DROP CONSTRAINT id_recipe;
       public          postgres    false    3217    217    223            �           2606    16691    comment id_recipe    FK CONSTRAINT     �   ALTER TABLE ONLY public.comment
    ADD CONSTRAINT id_recipe FOREIGN KEY (id_recipe) REFERENCES public.recipe(id_recipe) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 ;   ALTER TABLE ONLY public.comment DROP CONSTRAINT id_recipe;
       public          postgres    false    3217    217    211            �           2606    16696    like_recipe id_recipe    FK CONSTRAINT     �   ALTER TABLE ONLY public.like_recipe
    ADD CONSTRAINT id_recipe FOREIGN KEY (id_recipe) REFERENCES public.recipe(id_recipe) ON UPDATE CASCADE NOT VALID;
 ?   ALTER TABLE ONLY public.like_recipe DROP CONSTRAINT id_recipe;
       public          postgres    false    217    213    3217            �           2606    16701    save_recipe id_recipe    FK CONSTRAINT     �   ALTER TABLE ONLY public.save_recipe
    ADD CONSTRAINT id_recipe FOREIGN KEY (id_recipe) REFERENCES public.recipe(id_recipe) NOT VALID;
 ?   ALTER TABLE ONLY public.save_recipe DROP CONSTRAINT id_recipe;
       public          postgres    false    217    3217    219            �           2606    16706    comment id_user    FK CONSTRAINT     �   ALTER TABLE ONLY public.comment
    ADD CONSTRAINT id_user FOREIGN KEY (id_user) REFERENCES public.users(id_user) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 9   ALTER TABLE ONLY public.comment DROP CONSTRAINT id_user;
       public          postgres    false    3221    211    221            �           2606    16711    recipe id_user    FK CONSTRAINT     �   ALTER TABLE ONLY public.recipe
    ADD CONSTRAINT id_user FOREIGN KEY (id_user) REFERENCES public.users(id_user) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 8   ALTER TABLE ONLY public.recipe DROP CONSTRAINT id_user;
       public          postgres    false    3221    217    221            �           2606    16716    profile id_user    FK CONSTRAINT     �   ALTER TABLE ONLY public.profile
    ADD CONSTRAINT id_user FOREIGN KEY (id_user) REFERENCES public.users(id_user) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 9   ALTER TABLE ONLY public.profile DROP CONSTRAINT id_user;
       public          postgres    false    3221    221    215            �           2606    16721    like_recipe id_user    FK CONSTRAINT     �   ALTER TABLE ONLY public.like_recipe
    ADD CONSTRAINT id_user FOREIGN KEY (id_user) REFERENCES public.users(id_user) ON UPDATE CASCADE NOT VALID;
 =   ALTER TABLE ONLY public.like_recipe DROP CONSTRAINT id_user;
       public          postgres    false    3221    221    213            �           2606    16726    save_recipe id_user    FK CONSTRAINT     �   ALTER TABLE ONLY public.save_recipe
    ADD CONSTRAINT id_user FOREIGN KEY (id_user) REFERENCES public.users(id_user) NOT VALID;
 =   ALTER TABLE ONLY public.save_recipe DROP CONSTRAINT id_user;
       public          postgres    false    221    3221    219            -   �   x���M� @��p�ߘ���S �B��DO����}�[��	<sꔚ�5����Ak���8$e�����Jz8�����
k]�z$�̍v�u�k8�`��4Z[k�'vp6�LO߼�=SB/̍����/R���~�      /   m   x�36��M��,�Qp/-��PHI�S����M,ᴴ�45�26�t�L�ͫLT�*�LNUHJ�KO˚Xp����$�($'%�T��g'�U�r�s�g��9�\1z\\\ �a�      1   K   x����@��v1�p,���:�4��0G]����0`�J护���c���좊ޕ-����\���Lq�]~���      3   �   x���;N�0���s��H��o�KGc�N��Ď��ǐ\ C?��kfp o�߻s�y05�VHi�@���'J����k�儌17�L�{���ŏn�K�?'b- ����g�3hw��.�QZ	�bq�쨋n��Tڨ&J�����pٖ#�
RC\w@���Q����6�[�8mq�^],)'�~�����k�� q�%�#n���0�f_�������+�b      5   �  x����n�8�����^�I��$�E�(��{S�����X�M�~G��MSMkزDg>��J���ԓ�N�v�WiZ�T�v_Y�Xk؄!�']�I'R�:���p5��ę�'o�>n��Cu\H���C[��~�r�Y%d��;Q���9�ѫB;`F��BR����,��0��u�V'��&��mhFh6J�i�1T��M�&DGD������-�I.�!�����V�r���2Nq̈́r\K�c��B(����@���]p���'
m]� �H2ro��I/���B��|V�MۇfC.��P��:��)��Z"6��Y�	'�ʭEn-�Q9*�	�K��F�`Y�,����@f���b��	��i�q���Y��K>x�IH�sڅ�����r��*��<*����f���ޭ�5�2Y��]�#���1���%��1�k\��ߎs@�>'E�N>6�ߝm�B54P�ө�Z��;xd�&���ek�'�9.C�,:��F%W0�C_ ��
s�ɹ�J+i�΄@�2��\ek*x�)֊�6(A!x͵���f/��V�����l�9M秩:;��'];����Ȯ�a�K�3lI�iX�a���ds�).��
�O#���.^��-�;Bã	W�lz�9��Vd���8���C����h��#F�ZZ2@�:��;nKh�k� ͬz���g1���#y臜c��������\�_���\�_���4=��:>��|�aK�	B�� _�L��C쟸�anX�����o6K�c�6E���ᛘO������f�!�f�0�Sͳ����y-+��L����y�t�o��B��f���-п�_���u���c�Q��M��%����������͵7b�}��A�c;B���d���j�F�C�(�{��]�"`_)���J���Y<�	y�؅�͍6B))�����f�2��R��)��2��T*�(ha�V���8d��q1Z�l��
�%~
�
���J�&��(˜�N1aժ�L�	���3*�0�ij,��Ư��~��*<9R$b����� H�(�*s<��ӐY%�c�w�8���8Ա�`�K��I�M�ޯ�u���~��"���ԕG#�'�M*��_�+�KK���R���S����s����d�X���*�      7   /   x�3�440�4��2崴�4��2�f\@	���������� ��      9   �  x�m�˖c@ ��<G�IP.�QB���B2�l�� ���[/�/��_�8���ϭ��y}V��|��0�[f�Z��S��yT���/���qvo�P2��10�`KP̜�7"Ou��.AQ	؞Ӡ��{,*$�h<7��s��,�E�.�	7�D����EW�l��t��.n�<��}@�:�&�4
W^X�RK�+|Hp�Uߢ��̻x���%hd�v���8������2/r��_�J�f�Hp���v���;�0�Z�Hc������0�m~�seLqm�X�^׌��SH���]��J�w2hS�2�K$ڇ�A�f� �|�'�m�������m����\�9�J�+��2'��1��1�ZI�k��L�Ѓ�ۓO?�����dJ�p?$C���2�L����c� �:��6��I[�XX���qqN%$����f	����Ƙ��b��Z#RM�vȺ���i���f�� Pu�?�T��O��R�����?�7��      ;      x�3�,�LI�7��-0������� B-     