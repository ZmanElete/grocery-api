--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2 (Debian 14.2-1.pgdg110+1)
-- Dumped by pg_dump version 14.2 (Debian 14.2-1.pgdg110+1)

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: api_guser; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api_guser (
    id bigint NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    email character varying(254) NOT NULL,
    household_id uuid
);


ALTER TABLE public.api_guser OWNER TO postgres;

--
-- Name: api_guser_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api_guser_groups (
    id integer NOT NULL,
    guser_id bigint NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.api_guser_groups OWNER TO postgres;

--
-- Name: api_guser_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.api_guser_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_guser_groups_id_seq OWNER TO postgres;

--
-- Name: api_guser_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.api_guser_groups_id_seq OWNED BY public.api_guser_groups.id;


--
-- Name: api_guser_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.api_guser_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_guser_id_seq OWNER TO postgres;

--
-- Name: api_guser_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.api_guser_id_seq OWNED BY public.api_guser.id;


--
-- Name: api_guser_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api_guser_user_permissions (
    id integer NOT NULL,
    guser_id bigint NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.api_guser_user_permissions OWNER TO postgres;

--
-- Name: api_guser_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.api_guser_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_guser_user_permissions_id_seq OWNER TO postgres;

--
-- Name: api_guser_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.api_guser_user_permissions_id_seq OWNED BY public.api_guser_user_permissions.id;


--
-- Name: api_household; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api_household (
    title character varying(50) NOT NULL,
    id uuid NOT NULL
);


ALTER TABLE public.api_household OWNER TO postgres;

--
-- Name: api_item; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api_item (
    id bigint NOT NULL,
    title character varying(50) NOT NULL,
    quantity double precision NOT NULL,
    list_id bigint NOT NULL,
    measurement_id bigint NOT NULL,
    checked boolean NOT NULL
);


ALTER TABLE public.api_item OWNER TO postgres;

--
-- Name: api_item_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.api_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_item_id_seq OWNER TO postgres;

--
-- Name: api_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.api_item_id_seq OWNED BY public.api_item.id;


--
-- Name: api_list; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api_list (
    id bigint NOT NULL,
    title character varying(50) NOT NULL,
    active boolean NOT NULL,
    household_id uuid NOT NULL,
    referenceable boolean NOT NULL
);


ALTER TABLE public.api_list OWNER TO postgres;

--
-- Name: api_list_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.api_list_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_list_id_seq OWNER TO postgres;

--
-- Name: api_list_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.api_list_id_seq OWNED BY public.api_list.id;


--
-- Name: api_listsection; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api_listsection (
    id bigint NOT NULL,
    sort_order integer NOT NULL,
    recipe_id bigint NOT NULL,
    list_id bigint NOT NULL
);


ALTER TABLE public.api_listsection OWNER TO postgres;

--
-- Name: api_listsection_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.api_listsection_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_listsection_id_seq OWNER TO postgres;

--
-- Name: api_listsection_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.api_listsection_id_seq OWNED BY public.api_listsection.id;


--
-- Name: api_measurement; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api_measurement (
    id bigint NOT NULL,
    title character varying(50) NOT NULL,
    conversion double precision NOT NULL,
    convertible boolean NOT NULL,
    is_fraction boolean NOT NULL,
    form integer NOT NULL,
    family_id bigint
);


ALTER TABLE public.api_measurement OWNER TO postgres;

--
-- Name: api_measurement_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.api_measurement_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_measurement_id_seq OWNER TO postgres;

--
-- Name: api_measurement_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.api_measurement_id_seq OWNED BY public.api_measurement.id;


--
-- Name: api_measurementfamily; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api_measurementfamily (
    id bigint NOT NULL,
    title character varying(60) NOT NULL
);


ALTER TABLE public.api_measurementfamily OWNER TO postgres;

--
-- Name: api_measurementfamily_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.api_measurementfamily_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_measurementfamily_id_seq OWNER TO postgres;

--
-- Name: api_measurementfamily_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.api_measurementfamily_id_seq OWNED BY public.api_measurementfamily.id;


--
-- Name: api_recipe; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api_recipe (
    id bigint NOT NULL,
    title character varying(50) NOT NULL,
    instructions text NOT NULL,
    standard_serving integer NOT NULL,
    household_id uuid NOT NULL,
    list_id bigint NOT NULL
);


ALTER TABLE public.api_recipe OWNER TO postgres;

--
-- Name: api_recipe_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.api_recipe_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_recipe_id_seq OWNER TO postgres;

--
-- Name: api_recipe_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.api_recipe_id_seq OWNED BY public.api_recipe.id;


--
-- Name: api_symbol; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api_symbol (
    id bigint NOT NULL,
    title character varying(10) NOT NULL,
    measurement_id bigint NOT NULL
);


ALTER TABLE public.api_symbol OWNER TO postgres;

--
-- Name: api_symbol_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.api_symbol_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_symbol_id_seq OWNER TO postgres;

--
-- Name: api_symbol_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.api_symbol_id_seq OWNED BY public.api_symbol.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id bigint NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: api_guser id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_guser ALTER COLUMN id SET DEFAULT nextval('public.api_guser_id_seq'::regclass);


--
-- Name: api_guser_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_guser_groups ALTER COLUMN id SET DEFAULT nextval('public.api_guser_groups_id_seq'::regclass);


--
-- Name: api_guser_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_guser_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.api_guser_user_permissions_id_seq'::regclass);


--
-- Name: api_item id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_item ALTER COLUMN id SET DEFAULT nextval('public.api_item_id_seq'::regclass);


--
-- Name: api_list id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_list ALTER COLUMN id SET DEFAULT nextval('public.api_list_id_seq'::regclass);


--
-- Name: api_listsection id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_listsection ALTER COLUMN id SET DEFAULT nextval('public.api_listsection_id_seq'::regclass);


--
-- Name: api_measurement id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_measurement ALTER COLUMN id SET DEFAULT nextval('public.api_measurement_id_seq'::regclass);


--
-- Name: api_measurementfamily id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_measurementfamily ALTER COLUMN id SET DEFAULT nextval('public.api_measurementfamily_id_seq'::regclass);


--
-- Name: api_recipe id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_recipe ALTER COLUMN id SET DEFAULT nextval('public.api_recipe_id_seq'::regclass);


--
-- Name: api_symbol id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_symbol ALTER COLUMN id SET DEFAULT nextval('public.api_symbol_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Data for Name: api_guser; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.api_guser (id, password, last_login, is_superuser, first_name, last_name, is_staff, is_active, date_joined, email, household_id) FROM stdin;
1	pbkdf2_sha256$320000$QBhTt8ztV4iCrVrSjSsBjg$O7WATt/E6T1XwplT3OU6vcLO7e48kUXwgjYblRoVYTY=	2023-01-03 02:29:38.654124+00	t			t	t	2021-04-20 20:59:00.771419+00	test@test.com	5162747e-d6e1-4bfe-8fcf-c31740387231
\.


--
-- Data for Name: api_guser_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.api_guser_groups (id, guser_id, group_id) FROM stdin;
\.


--
-- Data for Name: api_guser_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.api_guser_user_permissions (id, guser_id, permission_id) FROM stdin;
\.


--
-- Data for Name: api_household; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.api_household (title, id) FROM stdin;
The 's Household	5162747e-d6e1-4bfe-8fcf-c31740387231
\.


--
-- Data for Name: api_item; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.api_item (id, title, quantity, list_id, measurement_id, checked) FROM stdin;
4	paperwork	1	4	18	t
3	paperwork	1	4	18	t
2	paperwork	1	3	18	t
5	paperwork	1	5	18	f
1	paperwork	1	2	18	t
6	Original Bushes Baked Beans	16	8	15	f
7	Tomato Soup	12	8	15	f
\.


--
-- Data for Name: api_list; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.api_list (id, title, active, household_id, referenceable) FROM stdin;
2	Costco	t	5162747e-d6e1-4bfe-8fcf-c31740387231	t
3	Costco	t	5162747e-d6e1-4bfe-8fcf-c31740387231	t
4	Costco	t	5162747e-d6e1-4bfe-8fcf-c31740387231	t
5	Costco	t	5162747e-d6e1-4bfe-8fcf-c31740387231	t
7	Stuff	t	5162747e-d6e1-4bfe-8fcf-c31740387231	t
6	Stuffz	t	5162747e-d6e1-4bfe-8fcf-c31740387231	t
8	Beans & Tortillas	t	5162747e-d6e1-4bfe-8fcf-c31740387231	t
\.


--
-- Data for Name: api_listsection; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.api_listsection (id, sort_order, recipe_id, list_id) FROM stdin;
\.


--
-- Data for Name: api_measurement; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.api_measurement (id, title, conversion, convertible, is_fraction, form, family_id) FROM stdin;
4	Quart	189271000	t	t	0	3
3	Gallon	378541000	t	t	0	3
5	Pint	47317600	t	t	0	3
6	Cup	23658800	t	t	0	3
7	Fluid Ounce	2957350	t	t	0	3
9	Teaspoon	492892	t	t	0	3
10	Pinch	23104.3	t	t	0	3
11	Fahrenheit	212	t	f	2	3
12	Celsius	100	t	f	2	1
13	Litre	100000000	t	f	0	1
8	Tablespoon	1478680	t	t	0	3
14	Millilitre	100000	t	f	0	1
15	Ounce	2957350	t	t	1	3
16	Gram	100000	t	f	1	1
17	Kilograms	100000000	t	f	1	1
18	Whole	1	f	t	0	2
19	Pound	47317600	t	t	1	3
\.


--
-- Data for Name: api_measurementfamily; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.api_measurementfamily (id, title) FROM stdin;
1	Metric
2	General
3	US
\.


--
-- Data for Name: api_recipe; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.api_recipe (id, title, instructions, standard_serving, household_id, list_id) FROM stdin;
\.


--
-- Data for Name: api_symbol; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.api_symbol (id, title, measurement_id) FROM stdin;
3	gal.	3
4	qt.	4
5	pt.	5
6	C	6
7	fl.oz.	7
8	tbsp.	8
9	T.	8
10	tsp.	9
11	t.	9
12	pn.	10
13	°F	11
14	°C	12
15	L	13
16	l	13
17	Tbsp.	8
18	ml	14
19	mL	14
20	oz	15
21	g	16
22	kg	17
23		18
24	lbs	19
25	lb	19
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add content type	4	add_contenttype
14	Can change content type	4	change_contenttype
15	Can delete content type	4	delete_contenttype
16	Can view content type	4	view_contenttype
17	Can add session	5	add_session
18	Can change session	5	change_sessionMeasurement
20	Can view session	5	view_session
21	Can add user	6	add_guser
22	Can change user	6	change_guser
23	Can delete user	6	delete_guser
24	Can view user	6	view_guser
25	Can add Household	7	add_household
26	Can change Household	7	change_household
27	Can delete Household	7	delete_household
28	Can view Household	7	view_household
29	Can add Measurement	8	add_measurement
30	Can change Measurement	8	change_measurement
31	Can delete Measurement	8	delete_measurement
32	Can view Measurement	8	view_measurement
33	Can add Recipe	9	add_recipe
34	Can change Recipe	9	change_recipe
35	Can delete Recipe	9	delete_recipe
36	Can view Recipe	9	view_recipe
37	Can add ListSection	10	add_listsection
38	Can change ListSection	10	change_listsection
39	Can delete ListSection	10	delete_listsection
40	Can view ListSection	10	view_listsection
41	Can add List	11	add_list
42	Can change List	11	change_list
43	Can delete List	11	delete_list
44	Can view List	11	view_list
45	Can add Item	12	add_item
46	Can change Item	12	change_item
47	Can delete Item	12	delete_item
48	Can view Item	12	view_item
49	Can add symbol	13	add_symbol
50	Can change symbol	13	change_symbol
51	Can delete symbol	13	delete_symbol
52	Can view symbol	13	view_symbol
53	Can add measurement family	14	add_measurementfamily
54	Can change measurement family	14	change_measurementfamily
55	Can delete measurement family	14	delete_measurementfamily
56	Can view measurement family	14	view_measurementfamily
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2021-04-21 22:32:30.361152+00	1	Celsius	1	[{"added": {}}, {"added": {"name": "symbol", "object": "Symbol object (1)"}}]	8	1
2	2021-04-21 22:35:40.861731+00	2	Fahrenheit	1	[{"added": {}}, {"added": {"name": "symbol", "object": "Symbol object (2)"}}]	8	1
3	2021-04-21 22:52:11.812224+00	2	Fahrenheit	3		8	1
4	2021-04-21 22:52:11.816917+00	1	Celsius	3		8	1
5	2021-04-21 23:06:23.938422+00	1	MeasurementFamily object (1)	1	[{"added": {}}]	14	1
6	2021-04-21 23:13:49.547603+00	2	MeasurementFamily object (2)	1	[{"added": {}}]	14	1
7	2021-04-21 23:15:01.830654+00	3	MeasurementFamily object (3)	1	[{"added": {}}]	14	1
8	2021-04-21 23:16:08.426229+00	3	Gallon	1	[{"added": {}}, {"added": {"name": "symbol", "object": "Symbol object (3)"}}]	8	1
9	2021-04-21 23:17:05.385254+00	4	Quart	1	[{"added": {}}, {"added": {"name": "symbol", "object": "Symbol object (4)"}}]	8	1
10	2021-04-21 23:17:16.242221+00	3	Gallon	2	[{"changed": {"fields": ["Family"]}}]	8	1
11	2021-04-21 23:17:49.961429+00	5	Pint	1	[{"added": {}}, {"added": {"name": "symbol", "object": "Symbol object (5)"}}]	8	1
12	2021-04-21 23:18:18.696817+00	6	Cup	1	[{"added": {}}, {"added": {"name": "symbol", "object": "Symbol object (6)"}}]	8	1
13	2021-04-21 23:18:59.423508+00	7	Fluid Ounce	1	[{"added": {}}]	8	1
14	2021-04-21 23:19:27.887196+00	7	Fluid Ounce	2	[{"added": {"name": "symbol", "object": "Symbol object (7)"}}]	8	1
15	2021-04-21 23:20:08.399585+00	8	Tablespoon	1	[{"added": {}}, {"added": {"name": "symbol", "object": "Symbol object (8)"}}, {"added": {"name": "symbol", "object": "Symbol object (9)"}}]	8	1
16	2021-04-21 23:21:01.304714+00	9	Teaspoon	1	[{"added": {}}, {"added": {"name": "symbol", "object": "Symbol object (10)"}}, {"added": {"name": "symbol", "object": "Symbol object (11)"}}]	8	1
17	2021-04-21 23:21:48.907766+00	10	Pinch	1	[{"added": {}}, {"added": {"name": "symbol", "object": "Symbol object (12)"}}]	8	1
18	2021-04-21 23:24:54.488261+00	11	Fahrenheit	1	[{"added": {}}, {"added": {"name": "symbol", "object": "Symbol object (13)"}}]	8	1
19	2021-04-21 23:25:13.502618+00	12	Celsius	1	[{"added": {}}, {"added": {"name": "symbol", "object": "Symbol object (14)"}}]	8	1
20	2021-04-21 23:25:34.868122+00	12	Celsius	2	[{"changed": {"fields": ["Family"]}}]	8	1
21	2021-04-21 23:27:54.2187+00	13	Litre	1	[{"added": {}}, {"added": {"name": "symbol", "object": "Symbol object (15)"}}, {"added": {"name": "symbol", "object": "Symbol object (16)"}}]	8	1
22	2021-04-21 23:28:11.902345+00	8	Tablespoon	2	[{"added": {"name": "symbol", "object": "Symbol object (17)"}}]	8	1
23	2021-04-21 23:29:08.965634+00	14	Millilitre	1	[{"added": {}}, {"added": {"name": "symbol", "object": "Symbol object (18)"}}, {"added": {"name": "symbol", "object": "Symbol object (19)"}}]	8	1
24	2021-04-21 23:29:19.691479+00	14	Millilitre	2	[{"changed": {"fields": ["Conversion"]}}]	8	1
25	2021-04-21 23:30:52.345001+00	15	Ounce	1	[{"added": {}}, {"added": {"name": "symbol", "object": "Symbol object (20)"}}]	8	1
26	2021-04-21 23:31:59.477066+00	16	Gram	1	[{"added": {}}, {"added": {"name": "symbol", "object": "Symbol object (21)"}}]	8	1
27	2021-04-21 23:33:30.129493+00	17	Kilograms	1	[{"added": {}}, {"added": {"name": "symbol", "object": "Symbol object (22)"}}]	8	1
28	2021-04-22 16:26:20.62487+00	18	Whole	1	[{"added": {}}]	8	1
29	2022-04-27 21:49:03.081969+00	1	1 - Costco	3		11	1
30	2023-01-03 03:09:09.40045+00	8	8 - Beans & Tortillas	1	[{"added": {}}, {"added": {"name": "Item", "object": "16.0 - Original Bushes Baked Beans"}}, {"added": {"name": "Item", "object": "12.0 - Tomato Soup"}}]	11	1
31	2023-01-03 03:12:14.406988+00	19	Pound	1	[{"added": {}}, {"added": {"name": "symbol", "object": "Symbol object (24)"}}, {"added": {"name": "symbol", "object": "Symbol object (25)"}}]	8	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	api	guser
7	api	household
8	api	measurement
9	api	recipe
10	api	listsection
11	api	list
12	api	item
13	api	symbol
14	api	measurementfamily
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2021-04-20 20:58:42.120517+00
2	contenttypes	0002_remove_content_type_name	2021-04-20 20:58:42.128685+00
3	auth	0001_initial	2021-04-20 20:58:42.184742+00
4	auth	0002_alter_permission_name_max_length	2021-04-20 20:58:42.214142+00
5	auth	0003_alter_user_email_max_length	2021-04-20 20:58:42.219503+00
6	auth	0004_alter_user_username_opts	2021-04-20 20:58:42.225475+00
7	auth	0005_alter_user_last_login_null	2021-04-20 20:58:42.231437+00
8	auth	0006_require_contenttypes_0002	2021-04-20 20:58:42.234098+00
9	auth	0007_alter_validators_add_error_messages	2021-04-20 20:58:42.2397+00
10	auth	0008_alter_user_username_max_length	2021-04-20 20:58:42.245465+00
11	auth	0009_alter_user_last_name_max_length	2021-04-20 20:58:42.251104+00
12	auth	0010_alter_group_name_max_length	2021-04-20 20:58:42.257291+00
13	auth	0011_update_proxy_permissions	2021-04-20 20:58:42.265351+00
14	auth	0012_alter_user_first_name_max_length	2021-04-20 20:58:42.27088+00
15	api	0001_initial	2021-04-20 20:58:42.303757+00
16	admin	0001_initial	2021-04-20 20:58:42.352228+00
17	admin	0002_logentry_remove_auto_add	2021-04-20 20:58:42.367685+00
18	admin	0003_logentry_add_action_flag_choices	2021-04-20 20:58:42.374556+00
19	api	0002_household_item_list_listsection_measurement_recipe	2021-04-20 20:58:42.417881+00
20	api	0003_guser_household	2021-04-20 20:58:42.456811+00
21	api	0004_auto_20201030_2250	2021-04-20 20:58:42.47505+00
22	api	0005_auto_20201031_1659	2021-04-20 20:58:42.517353+00
23	api	0006_auto_20201031_1700	2021-04-20 20:58:42.539225+00
24	api	0007_list_referenceable	2021-04-20 20:58:42.547182+00
25	sessions	0001_initial	2021-04-20 20:58:42.558331+00
26	api	0008_measurement_form	2021-04-21 22:34:15.961265+00
27	api	0009_auto_20210421_2252	2021-04-21 22:52:08.639788+00
28	api	0010_alter_guser_id_alter_item_id_alter_list_id_and_more	2022-04-27 19:29:31.352233+00
29	api	0011_item_checked	2022-04-27 21:08:32.722624+00
30	api	0012_recipe_list	2023-01-03 03:07:05.648323+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
qd6uu4tf1uojgfq5mapc1nz8k3iqv1it	.eJxVjMsOwiAURP-FtSG84bp07zcQuBelaiAp7cr477ZJF7qcOWfmzWJalxrXUeY4ETszyU6_XU74LG0H9Ejt3jn2tsxT5rvCDzr4tVN5XQ7376CmUbc1EJInbTBoTwGtuCkDTmfrQXkFApQy3qLWFFzK3jot7BZlJjClSME-X8RLNsQ:1lZHvW:b_pOYZO3uuzp5Pb2kyUMdKiovm6PgwWvMNB-5rGIfQI	2021-05-05 18:50:18.101651+00
cejhwm8qrmsiyucqbk92b3x3a4jcje54	.eJxVjMsOwiAURP-FtSG84bp07zcQuBelaiAp7cr477ZJF7qcOWfmzWJalxrXUeY4ETszyU6_XU74LG0H9Ejt3jn2tsxT5rvCDzr4tVN5XQ7376CmUbc1EJInbTBoTwGtuCkDTmfrQXkFApQy3qLWFFzK3jot7BZlJjClSME-X8RLNsQ:1lZc9I:pY7P-TYX2KfxTELZ7trgcKPGhCMLGDe6Y_qZBS3jSUI	2021-05-06 16:25:52.981436+00
rimibg67btauwfel11f9icbekvv71acg	.eJxVjMsOwiAQRf-FtSFMebt07zeQAQapGkhKuzL-uzbpQrf3nHNfLOC21rANWsKc2ZkBO_1uEdOD2g7yHdut89TbusyR7wo_6ODXnul5Ody_g4qjfmtjfEkFtQMUOQlfMiJon6NSJoEWYLS3pKcYvUzggYQErUhaNzlSVrH3B-g4N0Y:1njpAm:qWRl7Wcyf40qABMIMJ8YUnLI469yJBcD906G2q2t80c	2022-05-11 21:26:08.039411+00
4qy2qxmy8byl302z960wxsn0n55icsyn	.eJxVjMsOwiAQRf-FtSFMebt07zeQAQapGkhKuzL-uzbpQrf3nHNfLOC21rANWsKc2ZkBO_1uEdOD2g7yHdut89TbusyR7wo_6ODXnul5Ody_g4qjfmtjfEkFtQMUOQlfMiJon6NSJoEWYLS3pKcYvUzggYQErUhaNzlSVrH3B-g4N0Y:1pCX3a:YUwChUjlxUw6uoCXZP37Ij0D8UAmF9Ne75_eGmmU8Bs	2023-01-17 02:29:38.659997+00
\.


--
-- Name: api_guser_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_guser_groups_id_seq', 1, false);


--
-- Name: api_guser_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_guser_id_seq', 1, true);


--
-- Name: api_guser_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_guser_user_permissions_id_seq', 1, false);


--
-- Name: api_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_item_id_seq', 7, true);


--
-- Name: api_list_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_list_id_seq', 8, true);


--
-- Name: api_listsection_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_listsection_id_seq', 1, false);


--
-- Name: api_measurement_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_measurement_id_seq', 19, true);


--
-- Name: api_measurementfamily_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_measurementfamily_id_seq', 3, true);


--
-- Name: api_recipe_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_recipe_id_seq', 1, false);


--
-- Name: api_symbol_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_symbol_id_seq', 25, true);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 56, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 31, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 14, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 30, true);


--
-- Name: api_guser api_guser_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_guser
    ADD CONSTRAINT api_guser_email_key UNIQUE (email);


--
-- Name: api_guser_groups api_guser_groups_guser_id_group_id_3aedc252_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_guser_groups
    ADD CONSTRAINT api_guser_groups_guser_id_group_id_3aedc252_uniq UNIQUE (guser_id, group_id);


--
-- Name: api_guser_groups api_guser_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_guser_groups
    ADD CONSTRAINT api_guser_groups_pkey PRIMARY KEY (id);


--
-- Name: api_guser api_guser_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_guser
    ADD CONSTRAINT api_guser_pkey PRIMARY KEY (id);


--
-- Name: api_guser_user_permissions api_guser_user_permissions_guser_id_permission_id_4389b78a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_guser_user_permissions
    ADD CONSTRAINT api_guser_user_permissions_guser_id_permission_id_4389b78a_uniq UNIQUE (guser_id, permission_id);


--
-- Name: api_guser_user_permissions api_guser_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_guser_user_permissions
    ADD CONSTRAINT api_guser_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: api_household api_household_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_household
    ADD CONSTRAINT api_household_pkey PRIMARY KEY (id);


--
-- Name: api_item api_item_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_item
    ADD CONSTRAINT api_item_pkey PRIMARY KEY (id);


--
-- Name: api_list api_list_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_list
    ADD CONSTRAINT api_list_pkey PRIMARY KEY (id);


--
-- Name: api_listsection api_listsection_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_listsection
    ADD CONSTRAINT api_listsection_pkey PRIMARY KEY (id);


--
-- Name: api_measurement api_measurement_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_measurement
    ADD CONSTRAINT api_measurement_pkey PRIMARY KEY (id);


--
-- Name: api_measurementfamily api_measurementfamily_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_measurementfamily
    ADD CONSTRAINT api_measurementfamily_pkey PRIMARY KEY (id);


--
-- Name: api_recipe api_recipe_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_recipe
    ADD CONSTRAINT api_recipe_pkey PRIMARY KEY (id);


--
-- Name: api_symbol api_symbol_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_symbol
    ADD CONSTRAINT api_symbol_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: api_guser_email_21d97ba8_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_guser_email_21d97ba8_like ON public.api_guser USING btree (email varchar_pattern_ops);


--
-- Name: api_guser_groups_group_id_692d4e9e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_guser_groups_group_id_692d4e9e ON public.api_guser_groups USING btree (group_id);


--
-- Name: api_guser_groups_guser_id_24b060b9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_guser_groups_guser_id_24b060b9 ON public.api_guser_groups USING btree (guser_id);


--
-- Name: api_guser_household_id_f11b4345; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_guser_household_id_f11b4345 ON public.api_guser USING btree (household_id);


--
-- Name: api_guser_user_permissions_guser_id_74471646; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_guser_user_permissions_guser_id_74471646 ON public.api_guser_user_permissions USING btree (guser_id);


--
-- Name: api_guser_user_permissions_permission_id_f6feac34; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_guser_user_permissions_permission_id_f6feac34 ON public.api_guser_user_permissions USING btree (permission_id);


--
-- Name: api_item_list_id_1f8ead8d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_item_list_id_1f8ead8d ON public.api_item USING btree (list_id);


--
-- Name: api_item_measurement_id_c2d47143; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_item_measurement_id_c2d47143 ON public.api_item USING btree (measurement_id);


--
-- Name: api_list_household_id_8777048e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_list_household_id_8777048e ON public.api_list USING btree (household_id);


--
-- Name: api_listsection_list_id_651cac61; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_listsection_list_id_651cac61 ON public.api_listsection USING btree (list_id);


--
-- Name: api_listsection_recipe_id_b2391353; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_listsection_recipe_id_b2391353 ON public.api_listsection USING btree (recipe_id);


--
-- Name: api_measurement_family_id_935b58eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_measurement_family_id_935b58eb ON public.api_measurement USING btree (family_id);


--
-- Name: api_recipe_household_id_88220392; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_recipe_household_id_88220392 ON public.api_recipe USING btree (household_id);


--
-- Name: api_recipe_list_id_566ec8c9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_recipe_list_id_566ec8c9 ON public.api_recipe USING btree (list_id);


--
-- Name: api_symbol_measurement_id_fa43d51e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_symbol_measurement_id_fa43d51e ON public.api_symbol USING btree (measurement_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: api_guser_groups api_guser_groups_group_id_692d4e9e_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_guser_groups
    ADD CONSTRAINT api_guser_groups_group_id_692d4e9e_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_guser_groups api_guser_groups_guser_id_24b060b9_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_guser_groups
    ADD CONSTRAINT api_guser_groups_guser_id_24b060b9_fk FOREIGN KEY (guser_id) REFERENCES public.api_guser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_guser api_guser_household_id_f11b4345_fk_api_household_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_guser
    ADD CONSTRAINT api_guser_household_id_f11b4345_fk_api_household_id FOREIGN KEY (household_id) REFERENCES public.api_household(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_guser_user_permissions api_guser_user_permi_permission_id_f6feac34_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_guser_user_permissions
    ADD CONSTRAINT api_guser_user_permi_permission_id_f6feac34_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_guser_user_permissions api_guser_user_permissions_guser_id_74471646_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_guser_user_permissions
    ADD CONSTRAINT api_guser_user_permissions_guser_id_74471646_fk FOREIGN KEY (guser_id) REFERENCES public.api_guser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_item api_item_list_id_1f8ead8d_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_item
    ADD CONSTRAINT api_item_list_id_1f8ead8d_fk FOREIGN KEY (list_id) REFERENCES public.api_list(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_item api_item_measurement_id_c2d47143_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_item
    ADD CONSTRAINT api_item_measurement_id_c2d47143_fk FOREIGN KEY (measurement_id) REFERENCES public.api_measurement(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_list api_list_household_id_8777048e_fk_api_household_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_list
    ADD CONSTRAINT api_list_household_id_8777048e_fk_api_household_id FOREIGN KEY (household_id) REFERENCES public.api_household(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_listsection api_listsection_list_id_651cac61_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_listsection
    ADD CONSTRAINT api_listsection_list_id_651cac61_fk FOREIGN KEY (list_id) REFERENCES public.api_list(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_listsection api_listsection_recipe_id_b2391353_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_listsection
    ADD CONSTRAINT api_listsection_recipe_id_b2391353_fk FOREIGN KEY (recipe_id) REFERENCES public.api_recipe(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_measurement api_measurement_family_id_935b58eb_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_measurement
    ADD CONSTRAINT api_measurement_family_id_935b58eb_fk FOREIGN KEY (family_id) REFERENCES public.api_measurementfamily(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_recipe api_recipe_household_id_88220392_fk_api_household_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_recipe
    ADD CONSTRAINT api_recipe_household_id_88220392_fk_api_household_id FOREIGN KEY (household_id) REFERENCES public.api_household(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_recipe api_recipe_list_id_566ec8c9_fk_api_list_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_recipe
    ADD CONSTRAINT api_recipe_list_id_566ec8c9_fk_api_list_id FOREIGN KEY (list_id) REFERENCES public.api_list(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_symbol api_symbol_measurement_id_fa43d51e_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_symbol
    ADD CONSTRAINT api_symbol_measurement_id_fa43d51e_fk FOREIGN KEY (measurement_id) REFERENCES public.api_measurement(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk FOREIGN KEY (user_id) REFERENCES public.api_guser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

