--
-- PostgreSQL database dump
--

-- Dumped from database version 11.5 (Debian 11.5-1.pgdg90+1)
-- Dumped by pg_dump version 12.2

-- Started on 2021-04-22 10:28:54

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


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 3110 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

--
-- TOC entry 196 (class 1259 OID 16385)
-- Name: api_guser; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api_guser (
    id integer NOT NULL,
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
-- TOC entry 197 (class 1259 OID 16391)
-- Name: api_guser_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api_guser_groups (
    id integer NOT NULL,
    guser_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.api_guser_groups OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 16394)
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
-- TOC entry 3111 (class 0 OID 0)
-- Dependencies: 198
-- Name: api_guser_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.api_guser_groups_id_seq OWNED BY public.api_guser_groups.id;


--
-- TOC entry 199 (class 1259 OID 16396)
-- Name: api_guser_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.api_guser_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_guser_id_seq OWNER TO postgres;

--
-- TOC entry 3112 (class 0 OID 0)
-- Dependencies: 199
-- Name: api_guser_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.api_guser_id_seq OWNED BY public.api_guser.id;


--
-- TOC entry 200 (class 1259 OID 16398)
-- Name: api_guser_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api_guser_user_permissions (
    id integer NOT NULL,
    guser_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.api_guser_user_permissions OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 16401)
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
-- TOC entry 3113 (class 0 OID 0)
-- Dependencies: 201
-- Name: api_guser_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.api_guser_user_permissions_id_seq OWNED BY public.api_guser_user_permissions.id;


--
-- TOC entry 202 (class 1259 OID 16403)
-- Name: api_household; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api_household (
    title character varying(50) NOT NULL,
    id uuid NOT NULL
);


ALTER TABLE public.api_household OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 16406)
-- Name: api_item; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api_item (
    id integer NOT NULL,
    title character varying(50) NOT NULL,
    quantity double precision NOT NULL,
    list_id integer NOT NULL,
    measurement_id integer NOT NULL
);


ALTER TABLE public.api_item OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 16409)
-- Name: api_item_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.api_item_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_item_id_seq OWNER TO postgres;

--
-- TOC entry 3114 (class 0 OID 0)
-- Dependencies: 204
-- Name: api_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.api_item_id_seq OWNED BY public.api_item.id;


--
-- TOC entry 205 (class 1259 OID 16411)
-- Name: api_list; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api_list (
    id integer NOT NULL,
    title character varying(50) NOT NULL,
    active boolean NOT NULL,
    household_id uuid NOT NULL,
    referenceable boolean NOT NULL
);


ALTER TABLE public.api_list OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 16414)
-- Name: api_list_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.api_list_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_list_id_seq OWNER TO postgres;

--
-- TOC entry 3115 (class 0 OID 0)
-- Dependencies: 206
-- Name: api_list_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.api_list_id_seq OWNED BY public.api_list.id;


--
-- TOC entry 207 (class 1259 OID 16416)
-- Name: api_listsection; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api_listsection (
    id integer NOT NULL,
    sort_order integer NOT NULL,
    recipe_id integer NOT NULL,
    list_id integer NOT NULL
);


ALTER TABLE public.api_listsection OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 16419)
-- Name: api_listsection_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.api_listsection_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_listsection_id_seq OWNER TO postgres;

--
-- TOC entry 3116 (class 0 OID 0)
-- Dependencies: 208
-- Name: api_listsection_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.api_listsection_id_seq OWNED BY public.api_listsection.id;


--
-- TOC entry 209 (class 1259 OID 16421)
-- Name: api_measurement; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api_measurement (
    id integer NOT NULL,
    title character varying(50) NOT NULL,
    conversion double precision NOT NULL,
    convertible boolean NOT NULL,
    is_fraction boolean NOT NULL,
    form integer NOT NULL,
    family_id integer
);


ALTER TABLE public.api_measurement OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 16424)
-- Name: api_measurement_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.api_measurement_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_measurement_id_seq OWNER TO postgres;

--
-- TOC entry 3117 (class 0 OID 0)
-- Dependencies: 210
-- Name: api_measurement_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.api_measurement_id_seq OWNED BY public.api_measurement.id;


--
-- TOC entry 211 (class 1259 OID 16426)
-- Name: api_measurementfamily; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api_measurementfamily (
    id integer NOT NULL,
    title character varying(60) NOT NULL
);


ALTER TABLE public.api_measurementfamily OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 16429)
-- Name: api_measurementfamily_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.api_measurementfamily_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_measurementfamily_id_seq OWNER TO postgres;

--
-- TOC entry 3118 (class 0 OID 0)
-- Dependencies: 212
-- Name: api_measurementfamily_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.api_measurementfamily_id_seq OWNED BY public.api_measurementfamily.id;


--
-- TOC entry 213 (class 1259 OID 16431)
-- Name: api_recipe; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api_recipe (
    id integer NOT NULL,
    title character varying(50) NOT NULL,
    instructions text NOT NULL,
    standard_serving integer NOT NULL,
    household_id uuid NOT NULL
);


ALTER TABLE public.api_recipe OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16437)
-- Name: api_recipe_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.api_recipe_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_recipe_id_seq OWNER TO postgres;

--
-- TOC entry 3119 (class 0 OID 0)
-- Dependencies: 214
-- Name: api_recipe_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.api_recipe_id_seq OWNED BY public.api_recipe.id;


--
-- TOC entry 215 (class 1259 OID 16439)
-- Name: api_symbol; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.api_symbol (
    id integer NOT NULL,
    title character varying(10) NOT NULL,
    measurement_id integer NOT NULL
);


ALTER TABLE public.api_symbol OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16442)
-- Name: api_symbol_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.api_symbol_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_symbol_id_seq OWNER TO postgres;

--
-- TOC entry 3120 (class 0 OID 0)
-- Dependencies: 216
-- Name: api_symbol_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.api_symbol_id_seq OWNED BY public.api_symbol.id;


--
-- TOC entry 217 (class 1259 OID 16444)
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16447)
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
-- TOC entry 3121 (class 0 OID 0)
-- Dependencies: 218
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- TOC entry 219 (class 1259 OID 16449)
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16452)
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
-- TOC entry 3122 (class 0 OID 0)
-- Dependencies: 220
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- TOC entry 221 (class 1259 OID 16454)
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
-- TOC entry 222 (class 1259 OID 16457)
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
-- TOC entry 3123 (class 0 OID 0)
-- Dependencies: 222
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- TOC entry 223 (class 1259 OID 16459)
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
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16466)
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
-- TOC entry 3124 (class 0 OID 0)
-- Dependencies: 224
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- TOC entry 225 (class 1259 OID 16468)
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16471)
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
-- TOC entry 3125 (class 0 OID 0)
-- Dependencies: 226
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- TOC entry 227 (class 1259 OID 16473)
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
-- TOC entry 228 (class 1259 OID 16479)
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
-- TOC entry 3126 (class 0 OID 0)
-- Dependencies: 228
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- TOC entry 229 (class 1259 OID 16481)
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- TOC entry 2843 (class 2604 OID 16487)
-- Name: api_guser id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_guser ALTER COLUMN id SET DEFAULT nextval('public.api_guser_id_seq'::regclass);


--
-- TOC entry 2844 (class 2604 OID 16488)
-- Name: api_guser_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_guser_groups ALTER COLUMN id SET DEFAULT nextval('public.api_guser_groups_id_seq'::regclass);


--
-- TOC entry 2845 (class 2604 OID 16489)
-- Name: api_guser_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_guser_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.api_guser_user_permissions_id_seq'::regclass);


--
-- TOC entry 2846 (class 2604 OID 16490)
-- Name: api_item id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_item ALTER COLUMN id SET DEFAULT nextval('public.api_item_id_seq'::regclass);


--
-- TOC entry 2847 (class 2604 OID 16491)
-- Name: api_list id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_list ALTER COLUMN id SET DEFAULT nextval('public.api_list_id_seq'::regclass);


--
-- TOC entry 2848 (class 2604 OID 16492)
-- Name: api_listsection id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_listsection ALTER COLUMN id SET DEFAULT nextval('public.api_listsection_id_seq'::regclass);


--
-- TOC entry 2849 (class 2604 OID 16493)
-- Name: api_measurement id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_measurement ALTER COLUMN id SET DEFAULT nextval('public.api_measurement_id_seq'::regclass);


--
-- TOC entry 2850 (class 2604 OID 16494)
-- Name: api_measurementfamily id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_measurementfamily ALTER COLUMN id SET DEFAULT nextval('public.api_measurementfamily_id_seq'::regclass);


--
-- TOC entry 2851 (class 2604 OID 16495)
-- Name: api_recipe id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_recipe ALTER COLUMN id SET DEFAULT nextval('public.api_recipe_id_seq'::regclass);


--
-- TOC entry 2852 (class 2604 OID 16496)
-- Name: api_symbol id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_symbol ALTER COLUMN id SET DEFAULT nextval('public.api_symbol_id_seq'::regclass);


--
-- TOC entry 2853 (class 2604 OID 16497)
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- TOC entry 2854 (class 2604 OID 16498)
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- TOC entry 2855 (class 2604 OID 16499)
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- TOC entry 2856 (class 2604 OID 16500)
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- TOC entry 2858 (class 2604 OID 16501)
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- TOC entry 2859 (class 2604 OID 16502)
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- TOC entry 3071 (class 0 OID 16385)
-- Dependencies: 196
-- Data for Name: api_guser; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.api_guser VALUES (1, 'pbkdf2_sha256$216000$U77Cvn2Gcpoa$TnGWTAoOcnIZN9Yh1X/2ZWq2lhJwvS4KqU1Z2R05xPI=', '2021-04-22 16:25:52.975166+00', true, '', '', true, true, '2021-04-20 20:59:00.771419+00', 'test@test.com', '5162747e-d6e1-4bfe-8fcf-c31740387231');


--
-- TOC entry 3072 (class 0 OID 16391)
-- Dependencies: 197
-- Data for Name: api_guser_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3075 (class 0 OID 16398)
-- Dependencies: 200
-- Data for Name: api_guser_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3077 (class 0 OID 16403)
-- Dependencies: 202
-- Data for Name: api_household; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.api_household VALUES ('The ''s Household', '5162747e-d6e1-4bfe-8fcf-c31740387231');


--
-- TOC entry 3078 (class 0 OID 16406)
-- Dependencies: 203
-- Data for Name: api_item; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3080 (class 0 OID 16411)
-- Dependencies: 205
-- Data for Name: api_list; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3082 (class 0 OID 16416)
-- Dependencies: 207
-- Data for Name: api_listsection; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3084 (class 0 OID 16421)
-- Dependencies: 209
-- Data for Name: api_measurement; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.api_measurement VALUES (4, 'Quart', 189271000, true, true, 0, 3);
INSERT INTO public.api_measurement VALUES (3, 'Gallon', 378541000, true, true, 0, 3);
INSERT INTO public.api_measurement VALUES (5, 'Pint', 47317600, true, true, 0, 3);
INSERT INTO public.api_measurement VALUES (6, 'Cup', 23658800, true, true, 0, 3);
INSERT INTO public.api_measurement VALUES (7, 'Fluid Ounce', 2957350, true, true, 0, 3);
INSERT INTO public.api_measurement VALUES (9, 'Teaspoon', 492892, true, true, 0, 3);
INSERT INTO public.api_measurement VALUES (10, 'Pinch', 23104.2999999999993, true, true, 0, 3);
INSERT INTO public.api_measurement VALUES (11, 'Fahrenheit', 212, true, false, 2, 3);
INSERT INTO public.api_measurement VALUES (12, 'Celsius', 100, true, false, 2, 1);
INSERT INTO public.api_measurement VALUES (13, 'Litre', 100000000, true, false, 0, 1);
INSERT INTO public.api_measurement VALUES (8, 'Tablespoon', 1478680, true, true, 0, 3);
INSERT INTO public.api_measurement VALUES (14, 'Millilitre', 100000, true, false, 0, 1);
INSERT INTO public.api_measurement VALUES (15, 'Ounce', 2957350, true, true, 1, 3);
INSERT INTO public.api_measurement VALUES (16, 'Gram', 100000, true, false, 1, 1);
INSERT INTO public.api_measurement VALUES (17, 'Kilograms', 100000000, true, false, 1, 1);
INSERT INTO public.api_measurement VALUES (18, 'Whole', 1, false, true, 0, 2);


--
-- TOC entry 3086 (class 0 OID 16426)
-- Dependencies: 211
-- Data for Name: api_measurementfamily; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.api_measurementfamily VALUES (1, 'Metric');
INSERT INTO public.api_measurementfamily VALUES (2, 'General');
INSERT INTO public.api_measurementfamily VALUES (3, 'US');


--
-- TOC entry 3088 (class 0 OID 16431)
-- Dependencies: 213
-- Data for Name: api_recipe; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3090 (class 0 OID 16439)
-- Dependencies: 215
-- Data for Name: api_symbol; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.api_symbol VALUES (3, 'gal.', 3);
INSERT INTO public.api_symbol VALUES (4, 'qt.', 4);
INSERT INTO public.api_symbol VALUES (5, 'pt.', 5);
INSERT INTO public.api_symbol VALUES (6, 'C', 6);
INSERT INTO public.api_symbol VALUES (7, 'fl.oz.', 7);
INSERT INTO public.api_symbol VALUES (8, 'tbsp.', 8);
INSERT INTO public.api_symbol VALUES (9, 'T.', 8);
INSERT INTO public.api_symbol VALUES (10, 'tsp.', 9);
INSERT INTO public.api_symbol VALUES (11, 't.', 9);
INSERT INTO public.api_symbol VALUES (12, 'pn.', 10);
INSERT INTO public.api_symbol VALUES (13, '°F', 11);
INSERT INTO public.api_symbol VALUES (14, '°C', 12);
INSERT INTO public.api_symbol VALUES (15, 'L', 13);
INSERT INTO public.api_symbol VALUES (16, 'l', 13);
INSERT INTO public.api_symbol VALUES (17, 'Tbsp.', 8);
INSERT INTO public.api_symbol VALUES (18, 'ml', 14);
INSERT INTO public.api_symbol VALUES (19, 'mL', 14);
INSERT INTO public.api_symbol VALUES (20, 'oz', 15);
INSERT INTO public.api_symbol VALUES (21, 'g', 16);
INSERT INTO public.api_symbol VALUES (22, 'kg', 17);
INSERT INTO public.api_symbol VALUES (23, '', 18);


--
-- TOC entry 3092 (class 0 OID 16444)
-- Dependencies: 217
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3094 (class 0 OID 16449)
-- Dependencies: 219
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 3096 (class 0 OID 16454)
-- Dependencies: 221
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.auth_permission VALUES (1, 'Can add log entry', 1, 'add_logentry');
INSERT INTO public.auth_permission VALUES (2, 'Can change log entry', 1, 'change_logentry');
INSERT INTO public.auth_permission VALUES (3, 'Can delete log entry', 1, 'delete_logentry');
INSERT INTO public.auth_permission VALUES (4, 'Can view log entry', 1, 'view_logentry');
INSERT INTO public.auth_permission VALUES (5, 'Can add permission', 2, 'add_permission');
INSERT INTO public.auth_permission VALUES (6, 'Can change permission', 2, 'change_permission');
INSERT INTO public.auth_permission VALUES (7, 'Can delete permission', 2, 'delete_permission');
INSERT INTO public.auth_permission VALUES (8, 'Can view permission', 2, 'view_permission');
INSERT INTO public.auth_permission VALUES (9, 'Can add group', 3, 'add_group');
INSERT INTO public.auth_permission VALUES (10, 'Can change group', 3, 'change_group');
INSERT INTO public.auth_permission VALUES (11, 'Can delete group', 3, 'delete_group');
INSERT INTO public.auth_permission VALUES (12, 'Can view group', 3, 'view_group');
INSERT INTO public.auth_permission VALUES (13, 'Can add content type', 4, 'add_contenttype');
INSERT INTO public.auth_permission VALUES (14, 'Can change content type', 4, 'change_contenttype');
INSERT INTO public.auth_permission VALUES (15, 'Can delete content type', 4, 'delete_contenttype');
INSERT INTO public.auth_permission VALUES (16, 'Can view content type', 4, 'view_contenttype');
INSERT INTO public.auth_permission VALUES (17, 'Can add session', 5, 'add_session');
INSERT INTO public.auth_permission VALUES (18, 'Can change session', 5, 'change_session');
INSERT INTO public.auth_permission VALUES (19, 'Can delete session', 5, 'delete_session');
INSERT INTO public.auth_permission VALUES (20, 'Can view session', 5, 'view_session');
INSERT INTO public.auth_permission VALUES (21, 'Can add user', 6, 'add_guser');
INSERT INTO public.auth_permission VALUES (22, 'Can change user', 6, 'change_guser');
INSERT INTO public.auth_permission VALUES (23, 'Can delete user', 6, 'delete_guser');
INSERT INTO public.auth_permission VALUES (24, 'Can view user', 6, 'view_guser');
INSERT INTO public.auth_permission VALUES (25, 'Can add Household', 7, 'add_household');
INSERT INTO public.auth_permission VALUES (26, 'Can change Household', 7, 'change_household');
INSERT INTO public.auth_permission VALUES (27, 'Can delete Household', 7, 'delete_household');
INSERT INTO public.auth_permission VALUES (28, 'Can view Household', 7, 'view_household');
INSERT INTO public.auth_permission VALUES (29, 'Can add Measurement', 8, 'add_measurement');
INSERT INTO public.auth_permission VALUES (30, 'Can change Measurement', 8, 'change_measurement');
INSERT INTO public.auth_permission VALUES (31, 'Can delete Measurement', 8, 'delete_measurement');
INSERT INTO public.auth_permission VALUES (32, 'Can view Measurement', 8, 'view_measurement');
INSERT INTO public.auth_permission VALUES (33, 'Can add Recipe', 9, 'add_recipe');
INSERT INTO public.auth_permission VALUES (34, 'Can change Recipe', 9, 'change_recipe');
INSERT INTO public.auth_permission VALUES (35, 'Can delete Recipe', 9, 'delete_recipe');
INSERT INTO public.auth_permission VALUES (36, 'Can view Recipe', 9, 'view_recipe');
INSERT INTO public.auth_permission VALUES (37, 'Can add ListSection', 10, 'add_listsection');
INSERT INTO public.auth_permission VALUES (38, 'Can change ListSection', 10, 'change_listsection');
INSERT INTO public.auth_permission VALUES (39, 'Can delete ListSection', 10, 'delete_listsection');
INSERT INTO public.auth_permission VALUES (40, 'Can view ListSection', 10, 'view_listsection');
INSERT INTO public.auth_permission VALUES (41, 'Can add List', 11, 'add_list');
INSERT INTO public.auth_permission VALUES (42, 'Can change List', 11, 'change_list');
INSERT INTO public.auth_permission VALUES (43, 'Can delete List', 11, 'delete_list');
INSERT INTO public.auth_permission VALUES (44, 'Can view List', 11, 'view_list');
INSERT INTO public.auth_permission VALUES (45, 'Can add Item', 12, 'add_item');
INSERT INTO public.auth_permission VALUES (46, 'Can change Item', 12, 'change_item');
INSERT INTO public.auth_permission VALUES (47, 'Can delete Item', 12, 'delete_item');
INSERT INTO public.auth_permission VALUES (48, 'Can view Item', 12, 'view_item');
INSERT INTO public.auth_permission VALUES (49, 'Can add symbol', 13, 'add_symbol');
INSERT INTO public.auth_permission VALUES (50, 'Can change symbol', 13, 'change_symbol');
INSERT INTO public.auth_permission VALUES (51, 'Can delete symbol', 13, 'delete_symbol');
INSERT INTO public.auth_permission VALUES (52, 'Can view symbol', 13, 'view_symbol');
INSERT INTO public.auth_permission VALUES (53, 'Can add measurement family', 14, 'add_measurementfamily');
INSERT INTO public.auth_permission VALUES (54, 'Can change measurement family', 14, 'change_measurementfamily');
INSERT INTO public.auth_permission VALUES (55, 'Can delete measurement family', 14, 'delete_measurementfamily');
INSERT INTO public.auth_permission VALUES (56, 'Can view measurement family', 14, 'view_measurementfamily');


--
-- TOC entry 3098 (class 0 OID 16459)
-- Dependencies: 223
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.django_admin_log VALUES (1, '2021-04-21 22:32:30.361152+00', '1', 'Celsius', 1, '[{"added": {}}, {"added": {"name": "symbol", "object": "Symbol object (1)"}}]', 8, 1);
INSERT INTO public.django_admin_log VALUES (2, '2021-04-21 22:35:40.861731+00', '2', 'Fahrenheit', 1, '[{"added": {}}, {"added": {"name": "symbol", "object": "Symbol object (2)"}}]', 8, 1);
INSERT INTO public.django_admin_log VALUES (3, '2021-04-21 22:52:11.812224+00', '2', 'Fahrenheit', 3, '', 8, 1);
INSERT INTO public.django_admin_log VALUES (4, '2021-04-21 22:52:11.816917+00', '1', 'Celsius', 3, '', 8, 1);
INSERT INTO public.django_admin_log VALUES (5, '2021-04-21 23:06:23.938422+00', '1', 'MeasurementFamily object (1)', 1, '[{"added": {}}]', 14, 1);
INSERT INTO public.django_admin_log VALUES (6, '2021-04-21 23:13:49.547603+00', '2', 'MeasurementFamily object (2)', 1, '[{"added": {}}]', 14, 1);
INSERT INTO public.django_admin_log VALUES (7, '2021-04-21 23:15:01.830654+00', '3', 'MeasurementFamily object (3)', 1, '[{"added": {}}]', 14, 1);
INSERT INTO public.django_admin_log VALUES (8, '2021-04-21 23:16:08.426229+00', '3', 'Gallon', 1, '[{"added": {}}, {"added": {"name": "symbol", "object": "Symbol object (3)"}}]', 8, 1);
INSERT INTO public.django_admin_log VALUES (9, '2021-04-21 23:17:05.385254+00', '4', 'Quart', 1, '[{"added": {}}, {"added": {"name": "symbol", "object": "Symbol object (4)"}}]', 8, 1);
INSERT INTO public.django_admin_log VALUES (10, '2021-04-21 23:17:16.242221+00', '3', 'Gallon', 2, '[{"changed": {"fields": ["Family"]}}]', 8, 1);
INSERT INTO public.django_admin_log VALUES (11, '2021-04-21 23:17:49.961429+00', '5', 'Pint', 1, '[{"added": {}}, {"added": {"name": "symbol", "object": "Symbol object (5)"}}]', 8, 1);
INSERT INTO public.django_admin_log VALUES (12, '2021-04-21 23:18:18.696817+00', '6', 'Cup', 1, '[{"added": {}}, {"added": {"name": "symbol", "object": "Symbol object (6)"}}]', 8, 1);
INSERT INTO public.django_admin_log VALUES (13, '2021-04-21 23:18:59.423508+00', '7', 'Fluid Ounce', 1, '[{"added": {}}]', 8, 1);
INSERT INTO public.django_admin_log VALUES (14, '2021-04-21 23:19:27.887196+00', '7', 'Fluid Ounce', 2, '[{"added": {"name": "symbol", "object": "Symbol object (7)"}}]', 8, 1);
INSERT INTO public.django_admin_log VALUES (15, '2021-04-21 23:20:08.399585+00', '8', 'Tablespoon', 1, '[{"added": {}}, {"added": {"name": "symbol", "object": "Symbol object (8)"}}, {"added": {"name": "symbol", "object": "Symbol object (9)"}}]', 8, 1);
INSERT INTO public.django_admin_log VALUES (16, '2021-04-21 23:21:01.304714+00', '9', 'Teaspoon', 1, '[{"added": {}}, {"added": {"name": "symbol", "object": "Symbol object (10)"}}, {"added": {"name": "symbol", "object": "Symbol object (11)"}}]', 8, 1);
INSERT INTO public.django_admin_log VALUES (17, '2021-04-21 23:21:48.907766+00', '10', 'Pinch', 1, '[{"added": {}}, {"added": {"name": "symbol", "object": "Symbol object (12)"}}]', 8, 1);
INSERT INTO public.django_admin_log VALUES (18, '2021-04-21 23:24:54.488261+00', '11', 'Fahrenheit', 1, '[{"added": {}}, {"added": {"name": "symbol", "object": "Symbol object (13)"}}]', 8, 1);
INSERT INTO public.django_admin_log VALUES (19, '2021-04-21 23:25:13.502618+00', '12', 'Celsius', 1, '[{"added": {}}, {"added": {"name": "symbol", "object": "Symbol object (14)"}}]', 8, 1);
INSERT INTO public.django_admin_log VALUES (20, '2021-04-21 23:25:34.868122+00', '12', 'Celsius', 2, '[{"changed": {"fields": ["Family"]}}]', 8, 1);
INSERT INTO public.django_admin_log VALUES (21, '2021-04-21 23:27:54.2187+00', '13', 'Litre', 1, '[{"added": {}}, {"added": {"name": "symbol", "object": "Symbol object (15)"}}, {"added": {"name": "symbol", "object": "Symbol object (16)"}}]', 8, 1);
INSERT INTO public.django_admin_log VALUES (22, '2021-04-21 23:28:11.902345+00', '8', 'Tablespoon', 2, '[{"added": {"name": "symbol", "object": "Symbol object (17)"}}]', 8, 1);
INSERT INTO public.django_admin_log VALUES (23, '2021-04-21 23:29:08.965634+00', '14', 'Millilitre', 1, '[{"added": {}}, {"added": {"name": "symbol", "object": "Symbol object (18)"}}, {"added": {"name": "symbol", "object": "Symbol object (19)"}}]', 8, 1);
INSERT INTO public.django_admin_log VALUES (24, '2021-04-21 23:29:19.691479+00', '14', 'Millilitre', 2, '[{"changed": {"fields": ["Conversion"]}}]', 8, 1);
INSERT INTO public.django_admin_log VALUES (25, '2021-04-21 23:30:52.345001+00', '15', 'Ounce', 1, '[{"added": {}}, {"added": {"name": "symbol", "object": "Symbol object (20)"}}]', 8, 1);
INSERT INTO public.django_admin_log VALUES (26, '2021-04-21 23:31:59.477066+00', '16', 'Gram', 1, '[{"added": {}}, {"added": {"name": "symbol", "object": "Symbol object (21)"}}]', 8, 1);
INSERT INTO public.django_admin_log VALUES (27, '2021-04-21 23:33:30.129493+00', '17', 'Kilograms', 1, '[{"added": {}}, {"added": {"name": "symbol", "object": "Symbol object (22)"}}]', 8, 1);
INSERT INTO public.django_admin_log VALUES (28, '2021-04-22 16:26:20.62487+00', '18', 'Whole', 1, '[{"added": {}}]', 8, 1);


--
-- TOC entry 3100 (class 0 OID 16468)
-- Dependencies: 225
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.django_content_type VALUES (1, 'admin', 'logentry');
INSERT INTO public.django_content_type VALUES (2, 'auth', 'permission');
INSERT INTO public.django_content_type VALUES (3, 'auth', 'group');
INSERT INTO public.django_content_type VALUES (4, 'contenttypes', 'contenttype');
INSERT INTO public.django_content_type VALUES (5, 'sessions', 'session');
INSERT INTO public.django_content_type VALUES (6, 'api', 'guser');
INSERT INTO public.django_content_type VALUES (7, 'api', 'household');
INSERT INTO public.django_content_type VALUES (8, 'api', 'measurement');
INSERT INTO public.django_content_type VALUES (9, 'api', 'recipe');
INSERT INTO public.django_content_type VALUES (10, 'api', 'listsection');
INSERT INTO public.django_content_type VALUES (11, 'api', 'list');
INSERT INTO public.django_content_type VALUES (12, 'api', 'item');
INSERT INTO public.django_content_type VALUES (13, 'api', 'symbol');
INSERT INTO public.django_content_type VALUES (14, 'api', 'measurementfamily');


--
-- TOC entry 3102 (class 0 OID 16473)
-- Dependencies: 227
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.django_migrations VALUES (1, 'contenttypes', '0001_initial', '2021-04-20 20:58:42.120517+00');
INSERT INTO public.django_migrations VALUES (2, 'contenttypes', '0002_remove_content_type_name', '2021-04-20 20:58:42.128685+00');
INSERT INTO public.django_migrations VALUES (3, 'auth', '0001_initial', '2021-04-20 20:58:42.184742+00');
INSERT INTO public.django_migrations VALUES (4, 'auth', '0002_alter_permission_name_max_length', '2021-04-20 20:58:42.214142+00');
INSERT INTO public.django_migrations VALUES (5, 'auth', '0003_alter_user_email_max_length', '2021-04-20 20:58:42.219503+00');
INSERT INTO public.django_migrations VALUES (6, 'auth', '0004_alter_user_username_opts', '2021-04-20 20:58:42.225475+00');
INSERT INTO public.django_migrations VALUES (7, 'auth', '0005_alter_user_last_login_null', '2021-04-20 20:58:42.231437+00');
INSERT INTO public.django_migrations VALUES (8, 'auth', '0006_require_contenttypes_0002', '2021-04-20 20:58:42.234098+00');
INSERT INTO public.django_migrations VALUES (9, 'auth', '0007_alter_validators_add_error_messages', '2021-04-20 20:58:42.2397+00');
INSERT INTO public.django_migrations VALUES (10, 'auth', '0008_alter_user_username_max_length', '2021-04-20 20:58:42.245465+00');
INSERT INTO public.django_migrations VALUES (11, 'auth', '0009_alter_user_last_name_max_length', '2021-04-20 20:58:42.251104+00');
INSERT INTO public.django_migrations VALUES (12, 'auth', '0010_alter_group_name_max_length', '2021-04-20 20:58:42.257291+00');
INSERT INTO public.django_migrations VALUES (13, 'auth', '0011_update_proxy_permissions', '2021-04-20 20:58:42.265351+00');
INSERT INTO public.django_migrations VALUES (14, 'auth', '0012_alter_user_first_name_max_length', '2021-04-20 20:58:42.27088+00');
INSERT INTO public.django_migrations VALUES (15, 'api', '0001_initial', '2021-04-20 20:58:42.303757+00');
INSERT INTO public.django_migrations VALUES (16, 'admin', '0001_initial', '2021-04-20 20:58:42.352228+00');
INSERT INTO public.django_migrations VALUES (17, 'admin', '0002_logentry_remove_auto_add', '2021-04-20 20:58:42.367685+00');
INSERT INTO public.django_migrations VALUES (18, 'admin', '0003_logentry_add_action_flag_choices', '2021-04-20 20:58:42.374556+00');
INSERT INTO public.django_migrations VALUES (19, 'api', '0002_household_item_list_listsection_measurement_recipe', '2021-04-20 20:58:42.417881+00');
INSERT INTO public.django_migrations VALUES (20, 'api', '0003_guser_household', '2021-04-20 20:58:42.456811+00');
INSERT INTO public.django_migrations VALUES (21, 'api', '0004_auto_20201030_2250', '2021-04-20 20:58:42.47505+00');
INSERT INTO public.django_migrations VALUES (22, 'api', '0005_auto_20201031_1659', '2021-04-20 20:58:42.517353+00');
INSERT INTO public.django_migrations VALUES (23, 'api', '0006_auto_20201031_1700', '2021-04-20 20:58:42.539225+00');
INSERT INTO public.django_migrations VALUES (24, 'api', '0007_list_referenceable', '2021-04-20 20:58:42.547182+00');
INSERT INTO public.django_migrations VALUES (25, 'sessions', '0001_initial', '2021-04-20 20:58:42.558331+00');
INSERT INTO public.django_migrations VALUES (26, 'api', '0008_measurement_form', '2021-04-21 22:34:15.961265+00');
INSERT INTO public.django_migrations VALUES (27, 'api', '0009_auto_20210421_2252', '2021-04-21 22:52:08.639788+00');


--
-- TOC entry 3104 (class 0 OID 16481)
-- Dependencies: 229
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.django_session VALUES ('qd6uu4tf1uojgfq5mapc1nz8k3iqv1it', '.eJxVjMsOwiAURP-FtSG84bp07zcQuBelaiAp7cr477ZJF7qcOWfmzWJalxrXUeY4ETszyU6_XU74LG0H9Ejt3jn2tsxT5rvCDzr4tVN5XQ7376CmUbc1EJInbTBoTwGtuCkDTmfrQXkFApQy3qLWFFzK3jot7BZlJjClSME-X8RLNsQ:1lZHvW:b_pOYZO3uuzp5Pb2kyUMdKiovm6PgwWvMNB-5rGIfQI', '2021-05-05 18:50:18.101651+00');
INSERT INTO public.django_session VALUES ('cejhwm8qrmsiyucqbk92b3x3a4jcje54', '.eJxVjMsOwiAURP-FtSG84bp07zcQuBelaiAp7cr477ZJF7qcOWfmzWJalxrXUeY4ETszyU6_XU74LG0H9Ejt3jn2tsxT5rvCDzr4tVN5XQ7376CmUbc1EJInbTBoTwGtuCkDTmfrQXkFApQy3qLWFFzK3jot7BZlJjClSME-X8RLNsQ:1lZc9I:pY7P-TYX2KfxTELZ7trgcKPGhCMLGDe6Y_qZBS3jSUI', '2021-05-06 16:25:52.981436+00');


--
-- TOC entry 3127 (class 0 OID 0)
-- Dependencies: 198
-- Name: api_guser_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_guser_groups_id_seq', 1, false);


--
-- TOC entry 3128 (class 0 OID 0)
-- Dependencies: 199
-- Name: api_guser_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_guser_id_seq', 1, true);


--
-- TOC entry 3129 (class 0 OID 0)
-- Dependencies: 201
-- Name: api_guser_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_guser_user_permissions_id_seq', 1, false);


--
-- TOC entry 3130 (class 0 OID 0)
-- Dependencies: 204
-- Name: api_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_item_id_seq', 1, false);


--
-- TOC entry 3131 (class 0 OID 0)
-- Dependencies: 206
-- Name: api_list_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_list_id_seq', 1, false);


--
-- TOC entry 3132 (class 0 OID 0)
-- Dependencies: 208
-- Name: api_listsection_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_listsection_id_seq', 1, false);


--
-- TOC entry 3133 (class 0 OID 0)
-- Dependencies: 210
-- Name: api_measurement_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_measurement_id_seq', 18, true);


--
-- TOC entry 3134 (class 0 OID 0)
-- Dependencies: 212
-- Name: api_measurementfamily_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_measurementfamily_id_seq', 3, true);


--
-- TOC entry 3135 (class 0 OID 0)
-- Dependencies: 214
-- Name: api_recipe_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_recipe_id_seq', 1, false);


--
-- TOC entry 3136 (class 0 OID 0)
-- Dependencies: 216
-- Name: api_symbol_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.api_symbol_id_seq', 22, true);


--
-- TOC entry 3137 (class 0 OID 0)
-- Dependencies: 218
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- TOC entry 3138 (class 0 OID 0)
-- Dependencies: 220
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- TOC entry 3139 (class 0 OID 0)
-- Dependencies: 222
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 56, true);


--
-- TOC entry 3140 (class 0 OID 0)
-- Dependencies: 224
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 28, true);


--
-- TOC entry 3141 (class 0 OID 0)
-- Dependencies: 226
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 14, true);


--
-- TOC entry 3142 (class 0 OID 0)
-- Dependencies: 228
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 27, true);


--
-- TOC entry 2862 (class 2606 OID 16504)
-- Name: api_guser api_guser_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_guser
    ADD CONSTRAINT api_guser_email_key UNIQUE (email);


--
-- TOC entry 2869 (class 2606 OID 16506)
-- Name: api_guser_groups api_guser_groups_guser_id_group_id_3aedc252_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_guser_groups
    ADD CONSTRAINT api_guser_groups_guser_id_group_id_3aedc252_uniq UNIQUE (guser_id, group_id);


--
-- TOC entry 2871 (class 2606 OID 16508)
-- Name: api_guser_groups api_guser_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_guser_groups
    ADD CONSTRAINT api_guser_groups_pkey PRIMARY KEY (id);


--
-- TOC entry 2865 (class 2606 OID 16510)
-- Name: api_guser api_guser_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_guser
    ADD CONSTRAINT api_guser_pkey PRIMARY KEY (id);


--
-- TOC entry 2874 (class 2606 OID 16512)
-- Name: api_guser_user_permissions api_guser_user_permissions_guser_id_permission_id_4389b78a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_guser_user_permissions
    ADD CONSTRAINT api_guser_user_permissions_guser_id_permission_id_4389b78a_uniq UNIQUE (guser_id, permission_id);


--
-- TOC entry 2877 (class 2606 OID 16514)
-- Name: api_guser_user_permissions api_guser_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_guser_user_permissions
    ADD CONSTRAINT api_guser_user_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 2879 (class 2606 OID 16516)
-- Name: api_household api_household_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_household
    ADD CONSTRAINT api_household_pkey PRIMARY KEY (id);


--
-- TOC entry 2883 (class 2606 OID 16518)
-- Name: api_item api_item_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_item
    ADD CONSTRAINT api_item_pkey PRIMARY KEY (id);


--
-- TOC entry 2886 (class 2606 OID 16520)
-- Name: api_list api_list_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_list
    ADD CONSTRAINT api_list_pkey PRIMARY KEY (id);


--
-- TOC entry 2889 (class 2606 OID 16522)
-- Name: api_listsection api_listsection_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_listsection
    ADD CONSTRAINT api_listsection_pkey PRIMARY KEY (id);


--
-- TOC entry 2893 (class 2606 OID 16524)
-- Name: api_measurement api_measurement_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_measurement
    ADD CONSTRAINT api_measurement_pkey PRIMARY KEY (id);


--
-- TOC entry 2895 (class 2606 OID 16526)
-- Name: api_measurementfamily api_measurementfamily_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_measurementfamily
    ADD CONSTRAINT api_measurementfamily_pkey PRIMARY KEY (id);


--
-- TOC entry 2898 (class 2606 OID 16528)
-- Name: api_recipe api_recipe_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_recipe
    ADD CONSTRAINT api_recipe_pkey PRIMARY KEY (id);


--
-- TOC entry 2901 (class 2606 OID 16530)
-- Name: api_symbol api_symbol_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_symbol
    ADD CONSTRAINT api_symbol_pkey PRIMARY KEY (id);


--
-- TOC entry 2904 (class 2606 OID 16532)
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- TOC entry 2909 (class 2606 OID 16534)
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- TOC entry 2912 (class 2606 OID 16536)
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- TOC entry 2906 (class 2606 OID 16538)
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- TOC entry 2915 (class 2606 OID 16540)
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- TOC entry 2917 (class 2606 OID 16542)
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- TOC entry 2920 (class 2606 OID 16544)
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- TOC entry 2923 (class 2606 OID 16546)
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- TOC entry 2925 (class 2606 OID 16548)
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- TOC entry 2927 (class 2606 OID 16550)
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 2930 (class 2606 OID 16552)
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- TOC entry 2860 (class 1259 OID 16553)
-- Name: api_guser_email_21d97ba8_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_guser_email_21d97ba8_like ON public.api_guser USING btree (email varchar_pattern_ops);


--
-- TOC entry 2866 (class 1259 OID 16554)
-- Name: api_guser_groups_group_id_692d4e9e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_guser_groups_group_id_692d4e9e ON public.api_guser_groups USING btree (group_id);


--
-- TOC entry 2867 (class 1259 OID 16555)
-- Name: api_guser_groups_guser_id_24b060b9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_guser_groups_guser_id_24b060b9 ON public.api_guser_groups USING btree (guser_id);


--
-- TOC entry 2863 (class 1259 OID 16556)
-- Name: api_guser_household_id_f11b4345; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_guser_household_id_f11b4345 ON public.api_guser USING btree (household_id);


--
-- TOC entry 2872 (class 1259 OID 16557)
-- Name: api_guser_user_permissions_guser_id_74471646; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_guser_user_permissions_guser_id_74471646 ON public.api_guser_user_permissions USING btree (guser_id);


--
-- TOC entry 2875 (class 1259 OID 16558)
-- Name: api_guser_user_permissions_permission_id_f6feac34; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_guser_user_permissions_permission_id_f6feac34 ON public.api_guser_user_permissions USING btree (permission_id);


--
-- TOC entry 2880 (class 1259 OID 16559)
-- Name: api_item_list_id_1f8ead8d; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_item_list_id_1f8ead8d ON public.api_item USING btree (list_id);


--
-- TOC entry 2881 (class 1259 OID 16560)
-- Name: api_item_measurement_id_c2d47143; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_item_measurement_id_c2d47143 ON public.api_item USING btree (measurement_id);


--
-- TOC entry 2884 (class 1259 OID 16561)
-- Name: api_list_household_id_8777048e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_list_household_id_8777048e ON public.api_list USING btree (household_id);


--
-- TOC entry 2887 (class 1259 OID 16562)
-- Name: api_listsection_list_id_651cac61; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_listsection_list_id_651cac61 ON public.api_listsection USING btree (list_id);


--
-- TOC entry 2890 (class 1259 OID 16563)
-- Name: api_listsection_recipe_id_b2391353; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_listsection_recipe_id_b2391353 ON public.api_listsection USING btree (recipe_id);


--
-- TOC entry 2891 (class 1259 OID 16564)
-- Name: api_measurement_family_id_935b58eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_measurement_family_id_935b58eb ON public.api_measurement USING btree (family_id);


--
-- TOC entry 2896 (class 1259 OID 16565)
-- Name: api_recipe_household_id_88220392; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_recipe_household_id_88220392 ON public.api_recipe USING btree (household_id);


--
-- TOC entry 2899 (class 1259 OID 16566)
-- Name: api_symbol_measurement_id_fa43d51e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX api_symbol_measurement_id_fa43d51e ON public.api_symbol USING btree (measurement_id);


--
-- TOC entry 2902 (class 1259 OID 16567)
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- TOC entry 2907 (class 1259 OID 16568)
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- TOC entry 2910 (class 1259 OID 16569)
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- TOC entry 2913 (class 1259 OID 16570)
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- TOC entry 2918 (class 1259 OID 16571)
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- TOC entry 2921 (class 1259 OID 16572)
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- TOC entry 2928 (class 1259 OID 16573)
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- TOC entry 2931 (class 1259 OID 16574)
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- TOC entry 2933 (class 2606 OID 16575)
-- Name: api_guser_groups api_guser_groups_group_id_692d4e9e_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_guser_groups
    ADD CONSTRAINT api_guser_groups_group_id_692d4e9e_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2934 (class 2606 OID 16580)
-- Name: api_guser_groups api_guser_groups_guser_id_24b060b9_fk_api_guser_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_guser_groups
    ADD CONSTRAINT api_guser_groups_guser_id_24b060b9_fk_api_guser_id FOREIGN KEY (guser_id) REFERENCES public.api_guser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2932 (class 2606 OID 16585)
-- Name: api_guser api_guser_household_id_f11b4345_fk_api_household_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_guser
    ADD CONSTRAINT api_guser_household_id_f11b4345_fk_api_household_id FOREIGN KEY (household_id) REFERENCES public.api_household(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2935 (class 2606 OID 16590)
-- Name: api_guser_user_permissions api_guser_user_permi_permission_id_f6feac34_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_guser_user_permissions
    ADD CONSTRAINT api_guser_user_permi_permission_id_f6feac34_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2936 (class 2606 OID 16595)
-- Name: api_guser_user_permissions api_guser_user_permissions_guser_id_74471646_fk_api_guser_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_guser_user_permissions
    ADD CONSTRAINT api_guser_user_permissions_guser_id_74471646_fk_api_guser_id FOREIGN KEY (guser_id) REFERENCES public.api_guser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2937 (class 2606 OID 16600)
-- Name: api_item api_item_list_id_1f8ead8d_fk_api_list_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_item
    ADD CONSTRAINT api_item_list_id_1f8ead8d_fk_api_list_id FOREIGN KEY (list_id) REFERENCES public.api_list(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2938 (class 2606 OID 16605)
-- Name: api_item api_item_measurement_id_c2d47143_fk_api_measurement_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_item
    ADD CONSTRAINT api_item_measurement_id_c2d47143_fk_api_measurement_id FOREIGN KEY (measurement_id) REFERENCES public.api_measurement(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2939 (class 2606 OID 16610)
-- Name: api_list api_list_household_id_8777048e_fk_api_household_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_list
    ADD CONSTRAINT api_list_household_id_8777048e_fk_api_household_id FOREIGN KEY (household_id) REFERENCES public.api_household(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2940 (class 2606 OID 16615)
-- Name: api_listsection api_listsection_list_id_651cac61_fk_api_list_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_listsection
    ADD CONSTRAINT api_listsection_list_id_651cac61_fk_api_list_id FOREIGN KEY (list_id) REFERENCES public.api_list(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2941 (class 2606 OID 16620)
-- Name: api_listsection api_listsection_recipe_id_b2391353_fk_api_recipe_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_listsection
    ADD CONSTRAINT api_listsection_recipe_id_b2391353_fk_api_recipe_id FOREIGN KEY (recipe_id) REFERENCES public.api_recipe(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2942 (class 2606 OID 16625)
-- Name: api_measurement api_measurement_family_id_935b58eb_fk_api_measurementfamily_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_measurement
    ADD CONSTRAINT api_measurement_family_id_935b58eb_fk_api_measurementfamily_id FOREIGN KEY (family_id) REFERENCES public.api_measurementfamily(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2943 (class 2606 OID 16630)
-- Name: api_recipe api_recipe_household_id_88220392_fk_api_household_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_recipe
    ADD CONSTRAINT api_recipe_household_id_88220392_fk_api_household_id FOREIGN KEY (household_id) REFERENCES public.api_household(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2944 (class 2606 OID 16635)
-- Name: api_symbol api_symbol_measurement_id_fa43d51e_fk_api_measurement_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.api_symbol
    ADD CONSTRAINT api_symbol_measurement_id_fa43d51e_fk_api_measurement_id FOREIGN KEY (measurement_id) REFERENCES public.api_measurement(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2945 (class 2606 OID 16640)
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2946 (class 2606 OID 16645)
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2947 (class 2606 OID 16650)
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2948 (class 2606 OID 16655)
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- TOC entry 2949 (class 2606 OID 16660)
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_api_guser_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_api_guser_id FOREIGN KEY (user_id) REFERENCES public.api_guser(id) DEFERRABLE INITIALLY DEFERRED;


-- Completed on 2021-04-22 10:28:54

--
-- PostgreSQL database dump complete
--

