PGDMP         (    
            z            da0gjethejddfh     14.4 (Ubuntu 14.4-1.pgdg20.04+1)    14.5 L               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16460425    da0gjethejddfh    DATABASE     c   CREATE DATABASE da0gjethejddfh WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.UTF-8';
    DROP DATABASE da0gjethejddfh;
                jmevqtlhoseuyc    false                       0    0    DATABASE da0gjethejddfh    ACL     A   REVOKE CONNECT,TEMPORARY ON DATABASE da0gjethejddfh FROM PUBLIC;
                   jmevqtlhoseuyc    false    4382                        0    0    da0gjethejddfh    DATABASE PROPERTIES     R   ALTER DATABASE da0gjethejddfh SET search_path TO '$user', 'public', 'heroku_ext';
                     jmevqtlhoseuyc    false                        2615    22868581 
   heroku_ext    SCHEMA        CREATE SCHEMA heroku_ext;
    DROP SCHEMA heroku_ext;
                postgres    false            !           0    0    SCHEMA heroku_ext    ACL     F   GRANT USAGE ON SCHEMA heroku_ext TO jmevqtlhoseuyc WITH GRANT OPTION;
                   postgres    false    5            "           0    0    SCHEMA public    ACL     �   REVOKE ALL ON SCHEMA public FROM postgres;
REVOKE ALL ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO jmevqtlhoseuyc;
GRANT ALL ON SCHEMA public TO PUBLIC;
                   jmevqtlhoseuyc    false    6            #           0    0    LANGUAGE plpgsql    ACL     1   GRANT ALL ON LANGUAGE plpgsql TO jmevqtlhoseuyc;
                   postgres    false    862            �            1259    35854241 
   categories    TABLE     �   CREATE TABLE public.categories (
    id_category integer NOT NULL,
    name_category character varying(50),
    image character varying(255)
);
    DROP TABLE public.categories;
       public         heap    jmevqtlhoseuyc    false            �            1259    35854244    categories_id_category_seq    SEQUENCE     �   CREATE SEQUENCE public.categories_id_category_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.categories_id_category_seq;
       public          jmevqtlhoseuyc    false    210            $           0    0    categories_id_category_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.categories_id_category_seq OWNED BY public.categories.id_category;
          public          jmevqtlhoseuyc    false    211            �            1259    35854245    comment    TABLE     �   CREATE TABLE public.comment (
    id_comment integer NOT NULL,
    text_comment character varying(200),
    id_user integer,
    id_recipe integer
);
    DROP TABLE public.comment;
       public         heap    jmevqtlhoseuyc    false            �            1259    35854248    comment_id_comment_seq    SEQUENCE     �   CREATE SEQUENCE public.comment_id_comment_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.comment_id_comment_seq;
       public          jmevqtlhoseuyc    false    212            %           0    0    comment_id_comment_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.comment_id_comment_seq OWNED BY public.comment.id_comment;
          public          jmevqtlhoseuyc    false    213            �            1259    35854249    like_recipe    TABLE     n   CREATE TABLE public.like_recipe (
    id_like integer NOT NULL,
    id_recipe integer,
    id_user integer
);
    DROP TABLE public.like_recipe;
       public         heap    jmevqtlhoseuyc    false            �            1259    35854252    likeRecipe_id_like_seq    SEQUENCE     �   CREATE SEQUENCE public."likeRecipe_id_like_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public."likeRecipe_id_like_seq";
       public          jmevqtlhoseuyc    false    214            &           0    0    likeRecipe_id_like_seq    SEQUENCE OWNED BY     T   ALTER SEQUENCE public."likeRecipe_id_like_seq" OWNED BY public.like_recipe.id_like;
          public          jmevqtlhoseuyc    false    215            �            1259    35854253    profile    TABLE     �   CREATE TABLE public.profile (
    id_profile integer NOT NULL,
    name character varying(100),
    phone character varying(50),
    user_image character varying(255),
    id_user integer
);
    DROP TABLE public.profile;
       public         heap    jmevqtlhoseuyc    false            �            1259    35854256    profile_id_profile_seq    SEQUENCE     �   CREATE SEQUENCE public.profile_id_profile_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.profile_id_profile_seq;
       public          jmevqtlhoseuyc    false    216            '           0    0    profile_id_profile_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.profile_id_profile_seq OWNED BY public.profile.id_profile;
          public          jmevqtlhoseuyc    false    217            �            1259    35854257    recipe    TABLE     �   CREATE TABLE public.recipe (
    id_recipe integer NOT NULL,
    recipe_name character varying(100),
    recipe_image character varying(255),
    ingredients text,
    id_user integer,
    id_category integer,
    taste character varying(50)
);
    DROP TABLE public.recipe;
       public         heap    jmevqtlhoseuyc    false            �            1259    35854262    recipe_id_recipe_seq    SEQUENCE     �   CREATE SEQUENCE public.recipe_id_recipe_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.recipe_id_recipe_seq;
       public          jmevqtlhoseuyc    false    218            (           0    0    recipe_id_recipe_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.recipe_id_recipe_seq OWNED BY public.recipe.id_recipe;
          public          jmevqtlhoseuyc    false    219            �            1259    35854263    save_recipe    TABLE     n   CREATE TABLE public.save_recipe (
    id_save integer NOT NULL,
    id_user integer,
    id_recipe integer
);
    DROP TABLE public.save_recipe;
       public         heap    jmevqtlhoseuyc    false            �            1259    35854266    save_recipe_id_save_seq    SEQUENCE     �   CREATE SEQUENCE public.save_recipe_id_save_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.save_recipe_id_save_seq;
       public          jmevqtlhoseuyc    false    220            )           0    0    save_recipe_id_save_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.save_recipe_id_save_seq OWNED BY public.save_recipe.id_save;
          public          jmevqtlhoseuyc    false    221            �            1259    35854267    users    TABLE     �   CREATE TABLE public.users (
    id_user integer NOT NULL,
    email character varying(255) NOT NULL,
    password text,
    role boolean DEFAULT false NOT NULL
);
    DROP TABLE public.users;
       public         heap    jmevqtlhoseuyc    false            �            1259    35854273    users_id_user_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_user_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.users_id_user_seq;
       public          jmevqtlhoseuyc    false    222            *           0    0    users_id_user_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.users_id_user_seq OWNED BY public.users.id_user;
          public          jmevqtlhoseuyc    false    223            �            1259    35854274    video    TABLE     �   CREATE TABLE public.video (
    id_video integer NOT NULL,
    video_name character varying(100),
    id_recipe integer,
    link character varying(255)
);
    DROP TABLE public.video;
       public         heap    jmevqtlhoseuyc    false            �            1259    35854277    video_id_video_seq    SEQUENCE     �   CREATE SEQUENCE public.video_id_video_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.video_id_video_seq;
       public          jmevqtlhoseuyc    false    224            +           0    0    video_id_video_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.video_id_video_seq OWNED BY public.video.id_video;
          public          jmevqtlhoseuyc    false    225            [           2604    35854278    categories id_category    DEFAULT     �   ALTER TABLE ONLY public.categories ALTER COLUMN id_category SET DEFAULT nextval('public.categories_id_category_seq'::regclass);
 E   ALTER TABLE public.categories ALTER COLUMN id_category DROP DEFAULT;
       public          jmevqtlhoseuyc    false    211    210            \           2604    35854279    comment id_comment    DEFAULT     x   ALTER TABLE ONLY public.comment ALTER COLUMN id_comment SET DEFAULT nextval('public.comment_id_comment_seq'::regclass);
 A   ALTER TABLE public.comment ALTER COLUMN id_comment DROP DEFAULT;
       public          jmevqtlhoseuyc    false    213    212            ]           2604    35854280    like_recipe id_like    DEFAULT     {   ALTER TABLE ONLY public.like_recipe ALTER COLUMN id_like SET DEFAULT nextval('public."likeRecipe_id_like_seq"'::regclass);
 B   ALTER TABLE public.like_recipe ALTER COLUMN id_like DROP DEFAULT;
       public          jmevqtlhoseuyc    false    215    214            ^           2604    35854281    profile id_profile    DEFAULT     x   ALTER TABLE ONLY public.profile ALTER COLUMN id_profile SET DEFAULT nextval('public.profile_id_profile_seq'::regclass);
 A   ALTER TABLE public.profile ALTER COLUMN id_profile DROP DEFAULT;
       public          jmevqtlhoseuyc    false    217    216            _           2604    35854282    recipe id_recipe    DEFAULT     t   ALTER TABLE ONLY public.recipe ALTER COLUMN id_recipe SET DEFAULT nextval('public.recipe_id_recipe_seq'::regclass);
 ?   ALTER TABLE public.recipe ALTER COLUMN id_recipe DROP DEFAULT;
       public          jmevqtlhoseuyc    false    219    218            `           2604    35854283    save_recipe id_save    DEFAULT     z   ALTER TABLE ONLY public.save_recipe ALTER COLUMN id_save SET DEFAULT nextval('public.save_recipe_id_save_seq'::regclass);
 B   ALTER TABLE public.save_recipe ALTER COLUMN id_save DROP DEFAULT;
       public          jmevqtlhoseuyc    false    221    220            b           2604    35854284    users id_user    DEFAULT     n   ALTER TABLE ONLY public.users ALTER COLUMN id_user SET DEFAULT nextval('public.users_id_user_seq'::regclass);
 <   ALTER TABLE public.users ALTER COLUMN id_user DROP DEFAULT;
       public          jmevqtlhoseuyc    false    223    222            c           2604    35854285    video id_video    DEFAULT     p   ALTER TABLE ONLY public.video ALTER COLUMN id_video SET DEFAULT nextval('public.video_id_video_seq'::regclass);
 =   ALTER TABLE public.video ALTER COLUMN id_video DROP DEFAULT;
       public          jmevqtlhoseuyc    false    225    224            	          0    35854241 
   categories 
   TABLE DATA           G   COPY public.categories (id_category, name_category, image) FROM stdin;
    public          jmevqtlhoseuyc    false    210   �W                 0    35854245    comment 
   TABLE DATA           O   COPY public.comment (id_comment, text_comment, id_user, id_recipe) FROM stdin;
    public          jmevqtlhoseuyc    false    212   hX                 0    35854249    like_recipe 
   TABLE DATA           B   COPY public.like_recipe (id_like, id_recipe, id_user) FROM stdin;
    public          jmevqtlhoseuyc    false    214   �X                 0    35854253    profile 
   TABLE DATA           O   COPY public.profile (id_profile, name, phone, user_image, id_user) FROM stdin;
    public          jmevqtlhoseuyc    false    216   @Y                 0    35854257    recipe 
   TABLE DATA           p   COPY public.recipe (id_recipe, recipe_name, recipe_image, ingredients, id_user, id_category, taste) FROM stdin;
    public          jmevqtlhoseuyc    false    218   )Z                 0    35854263    save_recipe 
   TABLE DATA           B   COPY public.save_recipe (id_save, id_user, id_recipe) FROM stdin;
    public          jmevqtlhoseuyc    false    220   �^                 0    35854267    users 
   TABLE DATA           ?   COPY public.users (id_user, email, password, role) FROM stdin;
    public          jmevqtlhoseuyc    false    222   )_                 0    35854274    video 
   TABLE DATA           F   COPY public.video (id_video, video_name, id_recipe, link) FROM stdin;
    public          jmevqtlhoseuyc    false    224   (a       ,           0    0    categories_id_category_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.categories_id_category_seq', 6, true);
          public          jmevqtlhoseuyc    false    211            -           0    0    comment_id_comment_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.comment_id_comment_seq', 38, true);
          public          jmevqtlhoseuyc    false    213            .           0    0    likeRecipe_id_like_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('public."likeRecipe_id_like_seq"', 65, true);
          public          jmevqtlhoseuyc    false    215            /           0    0    profile_id_profile_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.profile_id_profile_seq', 92, true);
          public          jmevqtlhoseuyc    false    217            0           0    0    recipe_id_recipe_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.recipe_id_recipe_seq', 62, true);
          public          jmevqtlhoseuyc    false    219            1           0    0    save_recipe_id_save_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.save_recipe_id_save_seq', 12, true);
          public          jmevqtlhoseuyc    false    221            2           0    0    users_id_user_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.users_id_user_seq', 104, true);
          public          jmevqtlhoseuyc    false    223            3           0    0    video_id_video_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.video_id_video_seq', 4, true);
          public          jmevqtlhoseuyc    false    225            e           2606    35854287    categories categories_pkey 
   CONSTRAINT     a   ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id_category);
 D   ALTER TABLE ONLY public.categories DROP CONSTRAINT categories_pkey;
       public            jmevqtlhoseuyc    false    210            g           2606    35854289    comment comment_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.comment
    ADD CONSTRAINT comment_pkey PRIMARY KEY (id_comment);
 >   ALTER TABLE ONLY public.comment DROP CONSTRAINT comment_pkey;
       public            jmevqtlhoseuyc    false    212            i           2606    35854291    like_recipe likeRecipe_pkey 
   CONSTRAINT     `   ALTER TABLE ONLY public.like_recipe
    ADD CONSTRAINT "likeRecipe_pkey" PRIMARY KEY (id_like);
 G   ALTER TABLE ONLY public.like_recipe DROP CONSTRAINT "likeRecipe_pkey";
       public            jmevqtlhoseuyc    false    214            k           2606    35854293    profile profile_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.profile
    ADD CONSTRAINT profile_pkey PRIMARY KEY (id_profile);
 >   ALTER TABLE ONLY public.profile DROP CONSTRAINT profile_pkey;
       public            jmevqtlhoseuyc    false    216            m           2606    35854295    recipe recipe_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.recipe
    ADD CONSTRAINT recipe_pkey PRIMARY KEY (id_recipe);
 <   ALTER TABLE ONLY public.recipe DROP CONSTRAINT recipe_pkey;
       public            jmevqtlhoseuyc    false    218            o           2606    35854297    save_recipe save_recipe_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.save_recipe
    ADD CONSTRAINT save_recipe_pkey PRIMARY KEY (id_save);
 F   ALTER TABLE ONLY public.save_recipe DROP CONSTRAINT save_recipe_pkey;
       public            jmevqtlhoseuyc    false    220            q           2606    35854299    users users_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id_user);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            jmevqtlhoseuyc    false    222            s           2606    35854301    video video_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.video
    ADD CONSTRAINT video_pkey PRIMARY KEY (id_video);
 :   ALTER TABLE ONLY public.video DROP CONSTRAINT video_pkey;
       public            jmevqtlhoseuyc    false    224            y           2606    35854302    recipe id_category    FK CONSTRAINT     �   ALTER TABLE ONLY public.recipe
    ADD CONSTRAINT id_category FOREIGN KEY (id_category) REFERENCES public.categories(id_category) ON UPDATE CASCADE NOT VALID;
 <   ALTER TABLE ONLY public.recipe DROP CONSTRAINT id_category;
       public          jmevqtlhoseuyc    false    210    218    4197            }           2606    35854307    video id_recipe    FK CONSTRAINT     �   ALTER TABLE ONLY public.video
    ADD CONSTRAINT id_recipe FOREIGN KEY (id_recipe) REFERENCES public.recipe(id_recipe) ON UPDATE CASCADE ON DELETE CASCADE;
 9   ALTER TABLE ONLY public.video DROP CONSTRAINT id_recipe;
       public          jmevqtlhoseuyc    false    4205    218    224            t           2606    35854312    comment id_recipe    FK CONSTRAINT     �   ALTER TABLE ONLY public.comment
    ADD CONSTRAINT id_recipe FOREIGN KEY (id_recipe) REFERENCES public.recipe(id_recipe) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 ;   ALTER TABLE ONLY public.comment DROP CONSTRAINT id_recipe;
       public          jmevqtlhoseuyc    false    4205    218    212            v           2606    35854317    like_recipe id_recipe    FK CONSTRAINT     �   ALTER TABLE ONLY public.like_recipe
    ADD CONSTRAINT id_recipe FOREIGN KEY (id_recipe) REFERENCES public.recipe(id_recipe) ON UPDATE CASCADE NOT VALID;
 ?   ALTER TABLE ONLY public.like_recipe DROP CONSTRAINT id_recipe;
       public          jmevqtlhoseuyc    false    218    214    4205            {           2606    35854322    save_recipe id_recipe    FK CONSTRAINT     �   ALTER TABLE ONLY public.save_recipe
    ADD CONSTRAINT id_recipe FOREIGN KEY (id_recipe) REFERENCES public.recipe(id_recipe) NOT VALID;
 ?   ALTER TABLE ONLY public.save_recipe DROP CONSTRAINT id_recipe;
       public          jmevqtlhoseuyc    false    218    4205    220            u           2606    35854327    comment id_user    FK CONSTRAINT     �   ALTER TABLE ONLY public.comment
    ADD CONSTRAINT id_user FOREIGN KEY (id_user) REFERENCES public.users(id_user) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 9   ALTER TABLE ONLY public.comment DROP CONSTRAINT id_user;
       public          jmevqtlhoseuyc    false    4209    212    222            z           2606    35854332    recipe id_user    FK CONSTRAINT     �   ALTER TABLE ONLY public.recipe
    ADD CONSTRAINT id_user FOREIGN KEY (id_user) REFERENCES public.users(id_user) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 8   ALTER TABLE ONLY public.recipe DROP CONSTRAINT id_user;
       public          jmevqtlhoseuyc    false    4209    218    222            x           2606    35854337    profile id_user    FK CONSTRAINT     �   ALTER TABLE ONLY public.profile
    ADD CONSTRAINT id_user FOREIGN KEY (id_user) REFERENCES public.users(id_user) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 9   ALTER TABLE ONLY public.profile DROP CONSTRAINT id_user;
       public          jmevqtlhoseuyc    false    4209    222    216            w           2606    35854342    like_recipe id_user    FK CONSTRAINT     �   ALTER TABLE ONLY public.like_recipe
    ADD CONSTRAINT id_user FOREIGN KEY (id_user) REFERENCES public.users(id_user) ON UPDATE CASCADE NOT VALID;
 =   ALTER TABLE ONLY public.like_recipe DROP CONSTRAINT id_user;
       public          jmevqtlhoseuyc    false    4209    222    214            |           2606    35854347    save_recipe id_user    FK CONSTRAINT     �   ALTER TABLE ONLY public.save_recipe
    ADD CONSTRAINT id_user FOREIGN KEY (id_user) REFERENCES public.users(id_user) NOT VALID;
 =   ALTER TABLE ONLY public.save_recipe DROP CONSTRAINT id_user;
       public          jmevqtlhoseuyc    false    222    4209    220            	   �   x���Qn� @�oXo����5m���mB�q�FW�D�88�����ȣ�T�2f|��t^��#h�G��a�=|�f.e#Zѵp�<�K�Y�{ڐ��`��f���Q�m�Y�BO����h�˼��Z��v؛��K�\���"��r����rK�u��E7oW��)j�Yd�H��a���%�F�f������'�G         m   x�36��M��,�Qp/-��PHI�S����M,ᴴ�45�26�t�L�ͫLT�*�LNUHJ�KO˚Xp����$�($'%�T��g'�U�r�s�g��9�\1z\\\ �a�         K   x����@��v1�p,���:�4��0G]����0`�J护���c���좊ޕ-����\���Lq�]~���         �   x���;N�0���s��H��o�KGc�N��Ď��ǐ\ C?��kfp o�߻s�y05�VHi�@���'J����k�儌17�L�{���ŏn�K�?'b- ����g�3hw��.�QZ	�bq�쨋n��Tڨ&J�����pٖ#�
RC\w@���Q����6�[�8mq�^],)'�~�����k�� q�%�#n���0�f_�������+�b         �  x��V�n�8=�_�Ӝ,���f�d'F�`.���Z����Oi�c;	�}PKbU�ޫ�+	|r�ؑ+؏�~��Uu�?��f�}��$k�J���"��\4�eyt˔�\�Z��)���hBO�16�JɘǊi'�:��5�V�81s!h&fی��*M�d�����I[�����J�#)�"��AX������1�\A叄�C��ۦs��| �L@��FL\ �,�J
�T��l3�e2ކ��q�yh��!�\1�Mjs�$M��vO��]�ً�Mڝ���M4=����������;���!� =��
{ҹt�I?~�ݼX`����I:�~p����ɚ�j��7a��]�1�p��H1�~��N����zo.1"�B�7����م�߯}�o�@=��|�O��X�:��+�8d�8}���Krq���O������h]�x|���ܞ`@�� �L����wB��;r��X��׻c�{������O{>��x��܂d����t�~�?v�<ֵX=*W������Y�{���pG��X�#���y=t�~P��>��l�C*��jB�S�s�3H�cf�Tt���Y�:?�z�s����\��#��׫��٘�t%V����XS���A�t�Indp�r菄
>��)]�|�1L/c��v�a�ՓZcQG�LY�Z�0e���4�\��BfZ��6�IRRl�o�Ƅ䝫��R�俦CD�ݕk��	�
^c3��#���3��&�/�"�T�$B����)ʥeJX|�r�q��0�(�b���� �S\Ȕ�i��ܶ7߷+�9/�s��j�51��$�������@)���K!9�R�Q����`9K얧�0��H
�<L݆Z0ghl�,Ir��b��r S���ܾ�v���z�2�"���Y�_�Ũ;,�J���sa4G0L&�IRsl.��6XE��s�͍V��,O���n�q�2���c�I�����%���%����Y1Ù�X�p4�1Sƴf��	�@�:�P�X+�>�HA-�rk�4%lwy�����kj,� ��R�W�,�Y���=3u���4�:T�Tn���"��Me�b�Й>޸��|�s���О殟�
�e�_Ia��6J��_�0���dX����#����[
�_G&jnݭ������Vf��!�\?��(E6��rrtt�?@tQt         /   x�3�440�4��2崴�4��2�f\@	���������� ��         �  x�m�˖c@ ��<G�IP.�QB���B2�l�� ���[/�/��_�8���ϭ��y}V��|��0�[f�Z��S��yT���/���qvo�P2��10�`KP̜�7"Ou��.AQ	؞Ӡ��{,*$�h<7��s��,�E�.�	7�D����EW�l��t��.n�<��}@�:�&�4
W^X�RK�+|Hp�Uߢ��̻x���%hd�v���8������2/r��_�J�f�Hp���v���;�0�Z�Hc������0�m~�seLqm�X�^׌��SH���]��J�w2hS�2�K$ڇ�A�f� �|�'�m�������m����\�9�J�+��2'��1��1�ZI�k��L�Ѓ�ۓO?�����dJ�p?$C���2�L����c� �:��6��I[�XX���qqN%$����f	����Ƙ��b��Z#RM�vȺ���i���f�� Pu�?�T��O��R�����?�7��            x�3�,�LI�7��-0��"�=... T��     