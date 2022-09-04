PGDMP         %                z            da0gjethejddfh     14.4 (Ubuntu 14.4-1.pgdg20.04+1)    14.5 /    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16460425    da0gjethejddfh    DATABASE     c   CREATE DATABASE da0gjethejddfh WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.UTF-8';
    DROP DATABASE da0gjethejddfh;
                jmevqtlhoseuyc    false            �           0    0    DATABASE da0gjethejddfh    ACL     A   REVOKE CONNECT,TEMPORARY ON DATABASE da0gjethejddfh FROM PUBLIC;
                   jmevqtlhoseuyc    false    4343            �           0    0    da0gjethejddfh    DATABASE PROPERTIES     R   ALTER DATABASE da0gjethejddfh SET search_path TO '$user', 'public', 'heroku_ext';
                     jmevqtlhoseuyc    false                        2615    22868581 
   heroku_ext    SCHEMA        CREATE SCHEMA heroku_ext;
    DROP SCHEMA heroku_ext;
                postgres    false            �           0    0    SCHEMA heroku_ext    ACL     F   GRANT USAGE ON SCHEMA heroku_ext TO jmevqtlhoseuyc WITH GRANT OPTION;
                   postgres    false    5            �           0    0    SCHEMA public    ACL     �   REVOKE ALL ON SCHEMA public FROM postgres;
REVOKE ALL ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO jmevqtlhoseuyc;
GRANT ALL ON SCHEMA public TO PUBLIC;
                   jmevqtlhoseuyc    false    6            �           0    0    LANGUAGE plpgsql    ACL     1   GRANT ALL ON LANGUAGE plpgsql TO jmevqtlhoseuyc;
                   postgres    false    847            �            1259    18117936    comment    TABLE     �   CREATE TABLE public.comment (
    id_comment integer NOT NULL,
    text_comment character varying(200),
    id_user numeric,
    id_recipe numeric
);
    DROP TABLE public.comment;
       public         heap    jmevqtlhoseuyc    false            �            1259    18117935    comment_id_comment_seq    SEQUENCE     �   CREATE SEQUENCE public.comment_id_comment_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.comment_id_comment_seq;
       public          jmevqtlhoseuyc    false    215            �           0    0    comment_id_comment_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.comment_id_comment_seq OWNED BY public.comment.id_comment;
          public          jmevqtlhoseuyc    false    214            �            1259    18120367    profile    TABLE     �   CREATE TABLE public.profile (
    id_profile integer NOT NULL,
    name character varying(100),
    phone character varying(50),
    user_image character varying(255),
    id_user integer
);
    DROP TABLE public.profile;
       public         heap    jmevqtlhoseuyc    false            �            1259    18120366    profile_id_profile_seq    SEQUENCE     �   CREATE SEQUENCE public.profile_id_profile_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.profile_id_profile_seq;
       public          jmevqtlhoseuyc    false    217            �           0    0    profile_id_profile_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.profile_id_profile_seq OWNED BY public.profile.id_profile;
          public          jmevqtlhoseuyc    false    216            �            1259    17180694    recipe    TABLE     �   CREATE TABLE public.recipe (
    id_recipe integer NOT NULL,
    recipe_name character varying(255),
    recipe_image character varying(255),
    ingredients text,
    id_user integer
);
    DROP TABLE public.recipe;
       public         heap    jmevqtlhoseuyc    false            �            1259    17180693    recipe_id_recipe_seq    SEQUENCE     �   CREATE SEQUENCE public.recipe_id_recipe_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE public.recipe_id_recipe_seq;
       public          jmevqtlhoseuyc    false    213            �           0    0    recipe_id_recipe_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE public.recipe_id_recipe_seq OWNED BY public.recipe.id_recipe;
          public          jmevqtlhoseuyc    false    212            �            1259    17179601    users    TABLE     �   CREATE TABLE public.users (
    id_user integer NOT NULL,
    email character varying(255),
    password text,
    role boolean
);
    DROP TABLE public.users;
       public         heap    jmevqtlhoseuyc    false            �            1259    17179600    users_id_user_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_user_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.users_id_user_seq;
       public          jmevqtlhoseuyc    false    211                        0    0    users_id_user_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.users_id_user_seq OWNED BY public.users.id_user;
          public          jmevqtlhoseuyc    false    210            �            1259    18120650    video    TABLE     {   CREATE TABLE public.video (
    id_video integer NOT NULL,
    video_name character varying(255),
    id_recipe numeric
);
    DROP TABLE public.video;
       public         heap    jmevqtlhoseuyc    false            �            1259    18120649    video_id_video_seq    SEQUENCE     �   CREATE SEQUENCE public.video_id_video_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.video_id_video_seq;
       public          jmevqtlhoseuyc    false    219                       0    0    video_id_video_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.video_id_video_seq OWNED BY public.video.id_video;
          public          jmevqtlhoseuyc    false    218            N           2604    18117939    comment id_comment    DEFAULT     x   ALTER TABLE ONLY public.comment ALTER COLUMN id_comment SET DEFAULT nextval('public.comment_id_comment_seq'::regclass);
 A   ALTER TABLE public.comment ALTER COLUMN id_comment DROP DEFAULT;
       public          jmevqtlhoseuyc    false    215    214    215            O           2604    18120370    profile id_profile    DEFAULT     x   ALTER TABLE ONLY public.profile ALTER COLUMN id_profile SET DEFAULT nextval('public.profile_id_profile_seq'::regclass);
 A   ALTER TABLE public.profile ALTER COLUMN id_profile DROP DEFAULT;
       public          jmevqtlhoseuyc    false    216    217    217            M           2604    17180697    recipe id_recipe    DEFAULT     t   ALTER TABLE ONLY public.recipe ALTER COLUMN id_recipe SET DEFAULT nextval('public.recipe_id_recipe_seq'::regclass);
 ?   ALTER TABLE public.recipe ALTER COLUMN id_recipe DROP DEFAULT;
       public          jmevqtlhoseuyc    false    212    213    213            L           2604    17179604    users id_user    DEFAULT     n   ALTER TABLE ONLY public.users ALTER COLUMN id_user SET DEFAULT nextval('public.users_id_user_seq'::regclass);
 <   ALTER TABLE public.users ALTER COLUMN id_user DROP DEFAULT;
       public          jmevqtlhoseuyc    false    210    211    211            P           2604    18120653    video id_video    DEFAULT     p   ALTER TABLE ONLY public.video ALTER COLUMN id_video SET DEFAULT nextval('public.video_id_video_seq'::regclass);
 =   ALTER TABLE public.video ALTER COLUMN id_video DROP DEFAULT;
       public          jmevqtlhoseuyc    false    218    219    219            �          0    18117936    comment 
   TABLE DATA           O   COPY public.comment (id_comment, text_comment, id_user, id_recipe) FROM stdin;
    public          jmevqtlhoseuyc    false    215   �2       �          0    18120367    profile 
   TABLE DATA           O   COPY public.profile (id_profile, name, phone, user_image, id_user) FROM stdin;
    public          jmevqtlhoseuyc    false    217   �2       �          0    17180694    recipe 
   TABLE DATA           \   COPY public.recipe (id_recipe, recipe_name, recipe_image, ingredients, id_user) FROM stdin;
    public          jmevqtlhoseuyc    false    213   #3       �          0    17179601    users 
   TABLE DATA           ?   COPY public.users (id_user, email, password, role) FROM stdin;
    public          jmevqtlhoseuyc    false    211   04       �          0    18120650    video 
   TABLE DATA           @   COPY public.video (id_video, video_name, id_recipe) FROM stdin;
    public          jmevqtlhoseuyc    false    219   �4                  0    0    comment_id_comment_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.comment_id_comment_seq', 1, false);
          public          jmevqtlhoseuyc    false    214                       0    0    profile_id_profile_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.profile_id_profile_seq', 1, true);
          public          jmevqtlhoseuyc    false    216                       0    0    recipe_id_recipe_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.recipe_id_recipe_seq', 3, true);
          public          jmevqtlhoseuyc    false    212                       0    0    users_id_user_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.users_id_user_seq', 4, true);
          public          jmevqtlhoseuyc    false    210                       0    0    video_id_video_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.video_id_video_seq', 1, false);
          public          jmevqtlhoseuyc    false    218            V           2606    18117943    comment comment_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.comment
    ADD CONSTRAINT comment_pkey PRIMARY KEY (id_comment);
 >   ALTER TABLE ONLY public.comment DROP CONSTRAINT comment_pkey;
       public            jmevqtlhoseuyc    false    215            X           2606    18120372    profile profile_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.profile
    ADD CONSTRAINT profile_pkey PRIMARY KEY (id_profile);
 >   ALTER TABLE ONLY public.profile DROP CONSTRAINT profile_pkey;
       public            jmevqtlhoseuyc    false    217            T           2606    17180701    recipe recipe_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY public.recipe
    ADD CONSTRAINT recipe_pkey PRIMARY KEY (id_recipe);
 <   ALTER TABLE ONLY public.recipe DROP CONSTRAINT recipe_pkey;
       public            jmevqtlhoseuyc    false    213            R           2606    17179608    users users_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id_user);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            jmevqtlhoseuyc    false    211            Z           2606    18120657    video video_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.video
    ADD CONSTRAINT video_pkey PRIMARY KEY (id_video);
 :   ALTER TABLE ONLY public.video DROP CONSTRAINT video_pkey;
       public            jmevqtlhoseuyc    false    219            \           2606    18186871    profile id_user    FK CONSTRAINT     �   ALTER TABLE ONLY public.profile
    ADD CONSTRAINT id_user FOREIGN KEY (id_user) REFERENCES public.users(id_user) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;
 9   ALTER TABLE ONLY public.profile DROP CONSTRAINT id_user;
       public          jmevqtlhoseuyc    false    4178    211    217            [           2606    18189251    recipe id_user    FK CONSTRAINT     �   ALTER TABLE ONLY public.recipe
    ADD CONSTRAINT id_user FOREIGN KEY (id_user) REFERENCES public.users(id_user) ON UPDATE CASCADE ON DELETE SET NULL NOT VALID;
 8   ALTER TABLE ONLY public.recipe DROP CONSTRAINT id_user;
       public          jmevqtlhoseuyc    false    211    213    4178            �      x������ � �      �   1   x�3�-N-Rp�L,N�4426153��LIMK,�)��*H�4����� �Q
�      �   �   x���=r�0��N��vWZ�,�a�O�0���>*�4N�}�[=����9>���׵߆a٢,�v^7�Z�U���#�jcè{�jagY�aL6��O
bb�Q5M�)*�b2�~ޛS�W��u����K���w9l�_�Y=��*O���|l�/��>n��F���
#�Q�'�3<f@ǠY�D!@Q�|QȀ)Ĕ�w0h.�y���'��j�`*��s�9`��#���U%[��s���
B�&:(b�;�G߶�7F�=      �   ^   x�3�,-N-rH�M���K���T1JR14U�.�s�0���s����+�prvի0sIu���J2u��3*q�Hvw�p	�7�(/K������� �I�      �      x������ � �     