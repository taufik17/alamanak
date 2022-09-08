--
-- PostgreSQL database dump
--

-- Dumped from database version 14.4 (Ubuntu 14.4-1.pgdg20.04+1)
-- Dumped by pg_dump version 14.5

-- Started on 2022-09-08 10:37:44

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 5 (class 2615 OID 22868581)
-- Name: heroku_ext; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA heroku_ext;


ALTER SCHEMA heroku_ext OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 210 (class 1259 OID 35854241)
-- Name: categories; Type: TABLE; Schema: public; Owner: jmevqtlhoseuyc
--

CREATE TABLE public.categories (
    id_category integer NOT NULL,
    name_category character varying(50),
    image character varying(255)
);


ALTER TABLE public.categories OWNER TO jmevqtlhoseuyc;

--
-- TOC entry 211 (class 1259 OID 35854244)
-- Name: categories_id_category_seq; Type: SEQUENCE; Schema: public; Owner: jmevqtlhoseuyc
--

CREATE SEQUENCE public.categories_id_category_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_id_category_seq OWNER TO jmevqtlhoseuyc;

--
-- TOC entry 4385 (class 0 OID 0)
-- Dependencies: 211
-- Name: categories_id_category_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jmevqtlhoseuyc
--

ALTER SEQUENCE public.categories_id_category_seq OWNED BY public.categories.id_category;


--
-- TOC entry 212 (class 1259 OID 35854245)
-- Name: comment; Type: TABLE; Schema: public; Owner: jmevqtlhoseuyc
--

CREATE TABLE public.comment (
    id_comment integer NOT NULL,
    text_comment character varying(200),
    id_user integer,
    id_recipe integer
);


ALTER TABLE public.comment OWNER TO jmevqtlhoseuyc;

--
-- TOC entry 213 (class 1259 OID 35854248)
-- Name: comment_id_comment_seq; Type: SEQUENCE; Schema: public; Owner: jmevqtlhoseuyc
--

CREATE SEQUENCE public.comment_id_comment_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comment_id_comment_seq OWNER TO jmevqtlhoseuyc;

--
-- TOC entry 4386 (class 0 OID 0)
-- Dependencies: 213
-- Name: comment_id_comment_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jmevqtlhoseuyc
--

ALTER SEQUENCE public.comment_id_comment_seq OWNED BY public.comment.id_comment;


--
-- TOC entry 214 (class 1259 OID 35854249)
-- Name: like_recipe; Type: TABLE; Schema: public; Owner: jmevqtlhoseuyc
--

CREATE TABLE public.like_recipe (
    id_like integer NOT NULL,
    id_recipe integer,
    id_user integer
);


ALTER TABLE public.like_recipe OWNER TO jmevqtlhoseuyc;

--
-- TOC entry 215 (class 1259 OID 35854252)
-- Name: likeRecipe_id_like_seq; Type: SEQUENCE; Schema: public; Owner: jmevqtlhoseuyc
--

CREATE SEQUENCE public."likeRecipe_id_like_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."likeRecipe_id_like_seq" OWNER TO jmevqtlhoseuyc;

--
-- TOC entry 4387 (class 0 OID 0)
-- Dependencies: 215
-- Name: likeRecipe_id_like_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jmevqtlhoseuyc
--

ALTER SEQUENCE public."likeRecipe_id_like_seq" OWNED BY public.like_recipe.id_like;


--
-- TOC entry 216 (class 1259 OID 35854253)
-- Name: profile; Type: TABLE; Schema: public; Owner: jmevqtlhoseuyc
--

CREATE TABLE public.profile (
    id_profile integer NOT NULL,
    name character varying(100),
    phone character varying(50),
    user_image character varying(255),
    id_user integer
);


ALTER TABLE public.profile OWNER TO jmevqtlhoseuyc;

--
-- TOC entry 217 (class 1259 OID 35854256)
-- Name: profile_id_profile_seq; Type: SEQUENCE; Schema: public; Owner: jmevqtlhoseuyc
--

CREATE SEQUENCE public.profile_id_profile_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.profile_id_profile_seq OWNER TO jmevqtlhoseuyc;

--
-- TOC entry 4388 (class 0 OID 0)
-- Dependencies: 217
-- Name: profile_id_profile_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jmevqtlhoseuyc
--

ALTER SEQUENCE public.profile_id_profile_seq OWNED BY public.profile.id_profile;


--
-- TOC entry 218 (class 1259 OID 35854257)
-- Name: recipe; Type: TABLE; Schema: public; Owner: jmevqtlhoseuyc
--

CREATE TABLE public.recipe (
    id_recipe integer NOT NULL,
    recipe_name character varying(100),
    recipe_image character varying(255),
    ingredients text,
    id_user integer,
    id_category integer,
    taste character varying(50)
);


ALTER TABLE public.recipe OWNER TO jmevqtlhoseuyc;

--
-- TOC entry 219 (class 1259 OID 35854262)
-- Name: recipe_id_recipe_seq; Type: SEQUENCE; Schema: public; Owner: jmevqtlhoseuyc
--

CREATE SEQUENCE public.recipe_id_recipe_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.recipe_id_recipe_seq OWNER TO jmevqtlhoseuyc;

--
-- TOC entry 4389 (class 0 OID 0)
-- Dependencies: 219
-- Name: recipe_id_recipe_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jmevqtlhoseuyc
--

ALTER SEQUENCE public.recipe_id_recipe_seq OWNED BY public.recipe.id_recipe;


--
-- TOC entry 220 (class 1259 OID 35854263)
-- Name: save_recipe; Type: TABLE; Schema: public; Owner: jmevqtlhoseuyc
--

CREATE TABLE public.save_recipe (
    id_save integer NOT NULL,
    id_user integer,
    id_recipe integer
);


ALTER TABLE public.save_recipe OWNER TO jmevqtlhoseuyc;

--
-- TOC entry 221 (class 1259 OID 35854266)
-- Name: save_recipe_id_save_seq; Type: SEQUENCE; Schema: public; Owner: jmevqtlhoseuyc
--

CREATE SEQUENCE public.save_recipe_id_save_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.save_recipe_id_save_seq OWNER TO jmevqtlhoseuyc;

--
-- TOC entry 4390 (class 0 OID 0)
-- Dependencies: 221
-- Name: save_recipe_id_save_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jmevqtlhoseuyc
--

ALTER SEQUENCE public.save_recipe_id_save_seq OWNED BY public.save_recipe.id_save;


--
-- TOC entry 222 (class 1259 OID 35854267)
-- Name: users; Type: TABLE; Schema: public; Owner: jmevqtlhoseuyc
--

CREATE TABLE public.users (
    id_user integer NOT NULL,
    email character varying(255) NOT NULL,
    password text,
    role boolean DEFAULT false NOT NULL
);


ALTER TABLE public.users OWNER TO jmevqtlhoseuyc;

--
-- TOC entry 223 (class 1259 OID 35854273)
-- Name: users_id_user_seq; Type: SEQUENCE; Schema: public; Owner: jmevqtlhoseuyc
--

CREATE SEQUENCE public.users_id_user_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_user_seq OWNER TO jmevqtlhoseuyc;

--
-- TOC entry 4391 (class 0 OID 0)
-- Dependencies: 223
-- Name: users_id_user_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jmevqtlhoseuyc
--

ALTER SEQUENCE public.users_id_user_seq OWNED BY public.users.id_user;


--
-- TOC entry 224 (class 1259 OID 35854274)
-- Name: video; Type: TABLE; Schema: public; Owner: jmevqtlhoseuyc
--

CREATE TABLE public.video (
    id_video integer NOT NULL,
    video_name character varying(100),
    id_recipe integer,
    link character varying(255)
);


ALTER TABLE public.video OWNER TO jmevqtlhoseuyc;

--
-- TOC entry 225 (class 1259 OID 35854277)
-- Name: video_id_video_seq; Type: SEQUENCE; Schema: public; Owner: jmevqtlhoseuyc
--

CREATE SEQUENCE public.video_id_video_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.video_id_video_seq OWNER TO jmevqtlhoseuyc;

--
-- TOC entry 4392 (class 0 OID 0)
-- Dependencies: 225
-- Name: video_id_video_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jmevqtlhoseuyc
--

ALTER SEQUENCE public.video_id_video_seq OWNED BY public.video.id_video;


--
-- TOC entry 4187 (class 2604 OID 35854278)
-- Name: categories id_category; Type: DEFAULT; Schema: public; Owner: jmevqtlhoseuyc
--

ALTER TABLE ONLY public.categories ALTER COLUMN id_category SET DEFAULT nextval('public.categories_id_category_seq'::regclass);


--
-- TOC entry 4188 (class 2604 OID 35854279)
-- Name: comment id_comment; Type: DEFAULT; Schema: public; Owner: jmevqtlhoseuyc
--

ALTER TABLE ONLY public.comment ALTER COLUMN id_comment SET DEFAULT nextval('public.comment_id_comment_seq'::regclass);


--
-- TOC entry 4189 (class 2604 OID 35854280)
-- Name: like_recipe id_like; Type: DEFAULT; Schema: public; Owner: jmevqtlhoseuyc
--

ALTER TABLE ONLY public.like_recipe ALTER COLUMN id_like SET DEFAULT nextval('public."likeRecipe_id_like_seq"'::regclass);


--
-- TOC entry 4190 (class 2604 OID 35854281)
-- Name: profile id_profile; Type: DEFAULT; Schema: public; Owner: jmevqtlhoseuyc
--

ALTER TABLE ONLY public.profile ALTER COLUMN id_profile SET DEFAULT nextval('public.profile_id_profile_seq'::regclass);


--
-- TOC entry 4191 (class 2604 OID 35854282)
-- Name: recipe id_recipe; Type: DEFAULT; Schema: public; Owner: jmevqtlhoseuyc
--

ALTER TABLE ONLY public.recipe ALTER COLUMN id_recipe SET DEFAULT nextval('public.recipe_id_recipe_seq'::regclass);


--
-- TOC entry 4192 (class 2604 OID 35854283)
-- Name: save_recipe id_save; Type: DEFAULT; Schema: public; Owner: jmevqtlhoseuyc
--

ALTER TABLE ONLY public.save_recipe ALTER COLUMN id_save SET DEFAULT nextval('public.save_recipe_id_save_seq'::regclass);


--
-- TOC entry 4194 (class 2604 OID 35854284)
-- Name: users id_user; Type: DEFAULT; Schema: public; Owner: jmevqtlhoseuyc
--

ALTER TABLE ONLY public.users ALTER COLUMN id_user SET DEFAULT nextval('public.users_id_user_seq'::regclass);


--
-- TOC entry 4195 (class 2604 OID 35854285)
-- Name: video id_video; Type: DEFAULT; Schema: public; Owner: jmevqtlhoseuyc
--

ALTER TABLE ONLY public.video ALTER COLUMN id_video SET DEFAULT nextval('public.video_id_video_seq'::regclass);


--
-- TOC entry 4361 (class 0 OID 35854241)
-- Dependencies: 210
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: jmevqtlhoseuyc
--

COPY public.categories (id_category, name_category, image) FROM stdin;
1	Soup	https://res.cloudinary.com/alamanak/image/upload/v1662353858/1_wjjwrv.svg
2	Chicken	https://res.cloudinary.com/alamanak/image/upload/v1662355260/chicken_tkzskd.png
3	Seafood	https://res.cloudinary.com/alamanak/image/upload/v1662355188/seafood_yklldi.svg
4	Dessert	https://res.cloudinary.com/alamanak/image/upload/v1662355306/dessert_kstync.svg
5	Fastfood	https://res.cloudinary.com/alamanak/image/upload/v1662355274/fastfood_wrr3re.png
6	Appetizer	https://res.cloudinary.com/alamanak/image/upload/v1662355216/appetizer_vczmek.png
\.


--
-- TOC entry 4363 (class 0 OID 35854245)
-- Dependencies: 212
-- Data for Name: comment; Type: TABLE DATA; Schema: public; Owner: jmevqtlhoseuyc
--

COPY public.comment (id_comment, text_comment, id_user, id_recipe) FROM stdin;
34	Manis, Gurih dan nikmat	98	50
35	Ayamnya Juice banget	98	48
36	Mantap, caranya lengkap.	98	45
37	Oke	98	49
\.


--
-- TOC entry 4365 (class 0 OID 35854249)
-- Dependencies: 214
-- Data for Name: like_recipe; Type: TABLE DATA; Schema: public; Owner: jmevqtlhoseuyc
--

COPY public.like_recipe (id_like, id_recipe, id_user) FROM stdin;
1	45	98
3	49	100
6	46	97
7	45	97
10	45	100
24	49	97
52	48	99
53	44	99
55	49	99
59	46	104
60	47	99
62	49	98
\.


--
-- TOC entry 4367 (class 0 OID 35854253)
-- Dependencies: 216
-- Data for Name: profile; Type: TABLE DATA; Schema: public; Owner: jmevqtlhoseuyc
--

COPY public.profile (id_profile, name, phone, user_image, id_user) FROM stdin;
87	User Tiga	+6285159233917	http://localhost:8000/images/profile/default.svg	99
88	User Empat	+6285159233917	http://localhost:8000/images/profile/default.svg	100
89	User Lima	121645421	http://localhost:8000/images/profile/default.svg	101
90	User Enam	12345641	http://localhost:8000/images/profile/default.svg	102
91	tes	1231321	http://localhost:8000/images/profile/default.svg	103
92	nama tes	123456	http://localhost:8000/images/profile/default.svg	104
85	Taufik Agung Santoso	085159233917	http://localhost:8000/images/profile/taufik.png	97
84	admin	12345678	http://localhost:8000/images/profile/default.svg	96
86	User Dua	+6285159233917	http://localhost:8000/images/profile/default.svg	98
\.


--
-- TOC entry 4369 (class 0 OID 35854257)
-- Dependencies: 218
-- Data for Name: recipe; Type: TABLE DATA; Schema: public; Owner: jmevqtlhoseuyc
--

COPY public.recipe (id_recipe, recipe_name, recipe_image, ingredients, id_user, id_category, taste) FROM stdin;
44	Semur Tahu	https://res.cloudinary.com/alamanak/image/upload/v1662273744/1657612228410_0.08893766532361713_19e96298-f743-431e-a714-c0cfc06d0670__uqv7tj.png	satu lembar bayam segar	97	1	Gurih, Umami
45	Nasi Goreng	https://res.cloudinary.com/alamanak/image/upload/v1662273798/1659778583234_0.5192565471632229_315f153f-21eb-433d-8e52-aed61678b9d7__orhxyu.jpg	<h4><br>Bahan</h4><ul><li>1 potong paha ayam atas bawah rebus, suwir ayamnya</li><li>2 butir telur, kocok lepas</li><li>150 gram udang tanpa kulit&nbsp;&nbsp;</li><li>5 buah bakso sapi, potong-potong</li><li>5 buah bakso ikan, potong-potong</li><li>500 gram nasi putih&nbsp;</li><li>2 sendok makan <strong>KECAP MANIS BANGO</strong><br>&nbsp;</li><li>1 sendok teh garam&nbsp;</li><li>1/2 sendok teh gula pasir</li><li>1 batang daun bawang, diiris tipis&nbsp;</li><li>1 1/2 sendok makan bawang goreng untuk taburan&nbsp;</li><li>3 sendok makan minyak untuk menumis&nbsp;</li></ul><p>&nbsp;</p><p><strong>Bumbu Tumbuk Kasar:</strong></p><p>&nbsp;</p><ul><li>1 sendok teh terasi, bakar&nbsp;</li><li>3 buah cabai merah besar&nbsp;</li><li>3 buah cabai merah keriting&nbsp;</li><li>2 siung bawang putih&nbsp;</li><li>6 butir bawang merah&nbsp;</li></ul><p>&nbsp;</p><p><strong>Bahan Pelengkap:</strong></p><p>&nbsp;</p><ul><li>3 buah telur ceplok&nbsp;</li></ul>	97	5	Pedas
46	Risoles	https://res.cloudinary.com/alamanak/image/upload/v1662273817/1659798524339_0.5484331220989576_c69a076e-b1c4-4e90-ad72-0345c75ddfb5__l0diix.jpg	- Kentang\n- Wortel\n- Tepung	97	6	Crispy
47	Martabak Telur	https://res.cloudinary.com/alamanak/image/upload/v1662273840/1659798657815_0.35795160259164915_1d6c252b-b71e-4f7b-be98-a5d0c25c689b__qvpqzf.jpg	- Telur 3 Biji\n- Wortel\n- Tepung	97	6	Manis
48	Ayam Goreng Mentega	https://res.cloudinary.com/alamanak/image/upload/v1662273864/1659799057652_0.6478108698832921_9f2b881a-ad59-4a92-b40f-741e803980ac__dephok.jpg	- Dada Ayam\n- Bumbu Dapur	97	2	Asin, Manis
49	Udang Mentega	https://res.cloudinary.com/alamanak/image/upload/v1662273886/1659799295629_0.2248720861481468_b232ad7e-2848-4f60-b129-d9fd876804cd__g5mquu.jpg	- Udang\n- Bumbu Dapur	97	3	Asin, Gurih, Manis
50	Roti Panggang	https://res.cloudinary.com/alamanak/image/upload/v1662273998/1661821856471_0.7215030117711112_1a4ea485-d7da-4b0f-9592-0854090cd98c__lafgdb.jpg	-Roti kering	99	3	Manis
62	bismillah recipe	https://res.cloudinary.com/alamanak/image/upload/v1662429600/mrsiub5ffxlkcn4qm8h4.png	<h4>Deskripsi :</h4><p>des</p><h4>Bahan :</h4><p>bah</p><h4>Cara Memasak :</h4><p>cara</p>	98	6	manis 
56	Udang Mentega 3	https://res.cloudinary.com/alamanak/image/upload/v1662245838/ovev5csszth2y1lcjnyc.jpg	testing	100	3	Pedas
\.


--
-- TOC entry 4371 (class 0 OID 35854263)
-- Dependencies: 220
-- Data for Name: save_recipe; Type: TABLE DATA; Schema: public; Owner: jmevqtlhoseuyc
--

COPY public.save_recipe (id_save, id_user, id_recipe) FROM stdin;
2	100	48
5	99	49
6	99	46
8	104	49
10	98	49
\.


--
-- TOC entry 4373 (class 0 OID 35854267)
-- Dependencies: 222
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: jmevqtlhoseuyc
--

COPY public.users (id_user, email, password, role) FROM stdin;
96	admin@gmail.com	$2b$15$5K4gfKjLFkquoAmBKMEO0uSzgyhQ6NtNJ3uk3nQH3BiHBZaAL5EKi	t
97	user@gmail.com	$2b$15$GBzUjm8sNydUryWDs9E.7OH76vnol3hB71os8fdVaz8fXcx5JO6vy	f
98	user2@gmail.com	$2b$15$PELNEeV/N5ISqfXPpOle/O2tU/9I3Fb6xv8c78zG.znAHwVlAB06m	f
99	user3@gmail.com	$2b$15$TZYvL/8H.VFG1KSqBab6IujgCQsUFkijisfDpSCrxyjHkKgJGCZ8O	f
100	user4@gmail.com	$2b$15$es6FLaM5AvqF4eWzJ5/sKuxe0iXyiEvdsiZ0Qa9/wcf27yTV/kTvq	f
101	user5@gmail.com	$2b$15$UqdQmJZVsA.eDV3G9xyPj.KiyIxIPp8V2nMDfN7NEQ1u8LS46kfOu	f
102	user6@gmail.com	$2b$15$GUhsvbNvvUrqAHClj4L4FOU83qPeVQB3Pt.oSb2c5m5pRxKUEUp6u	f
103	tes@gmail.com	$2b$15$C2Zi3nBIqgQ5.Q4dUb6rS.7JVBpzKR2L4vk5Bkenk2sjWdAeANBSq	f
104	emailtes@gmail.com	$2b$15$2Jvbncjx9mr5CHp9/pZFreLXsnROqMs3ry2jHB5FILtWwFC6tTPh.	f
\.


--
-- TOC entry 4375 (class 0 OID 35854274)
-- Dependencies: 224
-- Data for Name: video; Type: TABLE DATA; Schema: public; Owner: jmevqtlhoseuyc
--

COPY public.video (id_video, video_name, id_recipe, link) FROM stdin;
4	video4.mp4	\N	\N
\.


--
-- TOC entry 4393 (class 0 OID 0)
-- Dependencies: 211
-- Name: categories_id_category_seq; Type: SEQUENCE SET; Schema: public; Owner: jmevqtlhoseuyc
--

SELECT pg_catalog.setval('public.categories_id_category_seq', 6, true);


--
-- TOC entry 4394 (class 0 OID 0)
-- Dependencies: 213
-- Name: comment_id_comment_seq; Type: SEQUENCE SET; Schema: public; Owner: jmevqtlhoseuyc
--

SELECT pg_catalog.setval('public.comment_id_comment_seq', 38, true);


--
-- TOC entry 4395 (class 0 OID 0)
-- Dependencies: 215
-- Name: likeRecipe_id_like_seq; Type: SEQUENCE SET; Schema: public; Owner: jmevqtlhoseuyc
--

SELECT pg_catalog.setval('public."likeRecipe_id_like_seq"', 65, true);


--
-- TOC entry 4396 (class 0 OID 0)
-- Dependencies: 217
-- Name: profile_id_profile_seq; Type: SEQUENCE SET; Schema: public; Owner: jmevqtlhoseuyc
--

SELECT pg_catalog.setval('public.profile_id_profile_seq', 92, true);


--
-- TOC entry 4397 (class 0 OID 0)
-- Dependencies: 219
-- Name: recipe_id_recipe_seq; Type: SEQUENCE SET; Schema: public; Owner: jmevqtlhoseuyc
--

SELECT pg_catalog.setval('public.recipe_id_recipe_seq', 62, true);


--
-- TOC entry 4398 (class 0 OID 0)
-- Dependencies: 221
-- Name: save_recipe_id_save_seq; Type: SEQUENCE SET; Schema: public; Owner: jmevqtlhoseuyc
--

SELECT pg_catalog.setval('public.save_recipe_id_save_seq', 12, true);


--
-- TOC entry 4399 (class 0 OID 0)
-- Dependencies: 223
-- Name: users_id_user_seq; Type: SEQUENCE SET; Schema: public; Owner: jmevqtlhoseuyc
--

SELECT pg_catalog.setval('public.users_id_user_seq', 104, true);


--
-- TOC entry 4400 (class 0 OID 0)
-- Dependencies: 225
-- Name: video_id_video_seq; Type: SEQUENCE SET; Schema: public; Owner: jmevqtlhoseuyc
--

SELECT pg_catalog.setval('public.video_id_video_seq', 4, true);


--
-- TOC entry 4197 (class 2606 OID 35854287)
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: jmevqtlhoseuyc
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id_category);


--
-- TOC entry 4199 (class 2606 OID 35854289)
-- Name: comment comment_pkey; Type: CONSTRAINT; Schema: public; Owner: jmevqtlhoseuyc
--

ALTER TABLE ONLY public.comment
    ADD CONSTRAINT comment_pkey PRIMARY KEY (id_comment);


--
-- TOC entry 4201 (class 2606 OID 35854291)
-- Name: like_recipe likeRecipe_pkey; Type: CONSTRAINT; Schema: public; Owner: jmevqtlhoseuyc
--

ALTER TABLE ONLY public.like_recipe
    ADD CONSTRAINT "likeRecipe_pkey" PRIMARY KEY (id_like);


--
-- TOC entry 4203 (class 2606 OID 35854293)
-- Name: profile profile_pkey; Type: CONSTRAINT; Schema: public; Owner: jmevqtlhoseuyc
--

ALTER TABLE ONLY public.profile
    ADD CONSTRAINT profile_pkey PRIMARY KEY (id_profile);


--
-- TOC entry 4205 (class 2606 OID 35854295)
-- Name: recipe recipe_pkey; Type: CONSTRAINT; Schema: public; Owner: jmevqtlhoseuyc
--

ALTER TABLE ONLY public.recipe
    ADD CONSTRAINT recipe_pkey PRIMARY KEY (id_recipe);


--
-- TOC entry 4207 (class 2606 OID 35854297)
-- Name: save_recipe save_recipe_pkey; Type: CONSTRAINT; Schema: public; Owner: jmevqtlhoseuyc
--

ALTER TABLE ONLY public.save_recipe
    ADD CONSTRAINT save_recipe_pkey PRIMARY KEY (id_save);


--
-- TOC entry 4209 (class 2606 OID 35854299)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: jmevqtlhoseuyc
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id_user);


--
-- TOC entry 4211 (class 2606 OID 35854301)
-- Name: video video_pkey; Type: CONSTRAINT; Schema: public; Owner: jmevqtlhoseuyc
--

ALTER TABLE ONLY public.video
    ADD CONSTRAINT video_pkey PRIMARY KEY (id_video);


--
-- TOC entry 4217 (class 2606 OID 35854302)
-- Name: recipe id_category; Type: FK CONSTRAINT; Schema: public; Owner: jmevqtlhoseuyc
--

ALTER TABLE ONLY public.recipe
    ADD CONSTRAINT id_category FOREIGN KEY (id_category) REFERENCES public.categories(id_category) ON UPDATE CASCADE NOT VALID;


--
-- TOC entry 4221 (class 2606 OID 35854307)
-- Name: video id_recipe; Type: FK CONSTRAINT; Schema: public; Owner: jmevqtlhoseuyc
--

ALTER TABLE ONLY public.video
    ADD CONSTRAINT id_recipe FOREIGN KEY (id_recipe) REFERENCES public.recipe(id_recipe) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 4212 (class 2606 OID 35854312)
-- Name: comment id_recipe; Type: FK CONSTRAINT; Schema: public; Owner: jmevqtlhoseuyc
--

ALTER TABLE ONLY public.comment
    ADD CONSTRAINT id_recipe FOREIGN KEY (id_recipe) REFERENCES public.recipe(id_recipe) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 4214 (class 2606 OID 35854317)
-- Name: like_recipe id_recipe; Type: FK CONSTRAINT; Schema: public; Owner: jmevqtlhoseuyc
--

ALTER TABLE ONLY public.like_recipe
    ADD CONSTRAINT id_recipe FOREIGN KEY (id_recipe) REFERENCES public.recipe(id_recipe) ON UPDATE CASCADE NOT VALID;


--
-- TOC entry 4219 (class 2606 OID 35854322)
-- Name: save_recipe id_recipe; Type: FK CONSTRAINT; Schema: public; Owner: jmevqtlhoseuyc
--

ALTER TABLE ONLY public.save_recipe
    ADD CONSTRAINT id_recipe FOREIGN KEY (id_recipe) REFERENCES public.recipe(id_recipe) NOT VALID;


--
-- TOC entry 4213 (class 2606 OID 35854327)
-- Name: comment id_user; Type: FK CONSTRAINT; Schema: public; Owner: jmevqtlhoseuyc
--

ALTER TABLE ONLY public.comment
    ADD CONSTRAINT id_user FOREIGN KEY (id_user) REFERENCES public.users(id_user) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 4218 (class 2606 OID 35854332)
-- Name: recipe id_user; Type: FK CONSTRAINT; Schema: public; Owner: jmevqtlhoseuyc
--

ALTER TABLE ONLY public.recipe
    ADD CONSTRAINT id_user FOREIGN KEY (id_user) REFERENCES public.users(id_user) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 4216 (class 2606 OID 35854337)
-- Name: profile id_user; Type: FK CONSTRAINT; Schema: public; Owner: jmevqtlhoseuyc
--

ALTER TABLE ONLY public.profile
    ADD CONSTRAINT id_user FOREIGN KEY (id_user) REFERENCES public.users(id_user) ON UPDATE CASCADE ON DELETE CASCADE NOT VALID;


--
-- TOC entry 4215 (class 2606 OID 35854342)
-- Name: like_recipe id_user; Type: FK CONSTRAINT; Schema: public; Owner: jmevqtlhoseuyc
--

ALTER TABLE ONLY public.like_recipe
    ADD CONSTRAINT id_user FOREIGN KEY (id_user) REFERENCES public.users(id_user) ON UPDATE CASCADE NOT VALID;


--
-- TOC entry 4220 (class 2606 OID 35854347)
-- Name: save_recipe id_user; Type: FK CONSTRAINT; Schema: public; Owner: jmevqtlhoseuyc
--

ALTER TABLE ONLY public.save_recipe
    ADD CONSTRAINT id_user FOREIGN KEY (id_user) REFERENCES public.users(id_user) NOT VALID;


--
-- TOC entry 4382 (class 0 OID 0)
-- Dependencies: 5
-- Name: SCHEMA heroku_ext; Type: ACL; Schema: -; Owner: postgres
--

GRANT USAGE ON SCHEMA heroku_ext TO jmevqtlhoseuyc WITH GRANT OPTION;


--
-- TOC entry 4383 (class 0 OID 0)
-- Dependencies: 6
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: jmevqtlhoseuyc
--

REVOKE ALL ON SCHEMA public FROM postgres;
REVOKE ALL ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO jmevqtlhoseuyc;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- TOC entry 4384 (class 0 OID 0)
-- Dependencies: 862
-- Name: LANGUAGE plpgsql; Type: ACL; Schema: -; Owner: postgres
--

GRANT ALL ON LANGUAGE plpgsql TO jmevqtlhoseuyc;


-- Completed on 2022-09-08 10:38:27

--
-- PostgreSQL database dump complete
--

