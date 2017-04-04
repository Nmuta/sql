--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.2
-- Dumped by pg_dump version 9.6.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: cities; Type: TABLE; Schema: public; Owner: nmuta
--

CREATE TABLE cities (
    id integer NOT NULL,
    name text
);


ALTER TABLE cities OWNER TO nmuta;

--
-- Name: cities_id_seq; Type: SEQUENCE; Schema: public; Owner: nmuta
--

CREATE SEQUENCE cities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE cities_id_seq OWNER TO nmuta;

--
-- Name: cities_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nmuta
--

ALTER SEQUENCE cities_id_seq OWNED BY cities.id;


--
-- Name: professors; Type: TABLE; Schema: public; Owner: nmuta
--

CREATE TABLE professors (
    id integer NOT NULL,
    name text,
    age integer,
    city_id integer
);


ALTER TABLE professors OWNER TO nmuta;

--
-- Name: professor_id_seq; Type: SEQUENCE; Schema: public; Owner: nmuta
--

CREATE SEQUENCE professor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE professor_id_seq OWNER TO nmuta;

--
-- Name: professor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nmuta
--

ALTER SEQUENCE professor_id_seq OWNED BY professors.id;


--
-- Name: seminars; Type: TABLE; Schema: public; Owner: nmuta
--

CREATE TABLE seminars (
    id integer NOT NULL,
    name text,
    professor_id integer
);


ALTER TABLE seminars OWNER TO nmuta;

--
-- Name: seminars_id_seq; Type: SEQUENCE; Schema: public; Owner: nmuta
--

CREATE SEQUENCE seminars_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE seminars_id_seq OWNER TO nmuta;

--
-- Name: seminars_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nmuta
--

ALTER SEQUENCE seminars_id_seq OWNED BY seminars.id;


--
-- Name: cities id; Type: DEFAULT; Schema: public; Owner: nmuta
--

ALTER TABLE ONLY cities ALTER COLUMN id SET DEFAULT nextval('cities_id_seq'::regclass);


--
-- Name: professors id; Type: DEFAULT; Schema: public; Owner: nmuta
--

ALTER TABLE ONLY professors ALTER COLUMN id SET DEFAULT nextval('professor_id_seq'::regclass);


--
-- Name: seminars id; Type: DEFAULT; Schema: public; Owner: nmuta
--

ALTER TABLE ONLY seminars ALTER COLUMN id SET DEFAULT nextval('seminars_id_seq'::regclass);


--
-- Data for Name: cities; Type: TABLE DATA; Schema: public; Owner: nmuta
--

COPY cities (id, name) FROM stdin;
1	Santa Fe
2	Atlanta
3	Phoenix
4	Denver
5	Juno
\.


--
-- Name: cities_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nmuta
--

SELECT pg_catalog.setval('cities_id_seq', 5, true);


--
-- Name: professor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nmuta
--

SELECT pg_catalog.setval('professor_id_seq', 8, true);


--
-- Data for Name: professors; Type: TABLE DATA; Schema: public; Owner: nmuta
--

COPY professors (id, name, age, city_id) FROM stdin;
1	Dan	55	1
2	Ellen	38	5
3	Monica	60	2
4	Sam	78	3
5	Alex	38	5
6	Jibri	44	2
7	Jamila	44	2
8	Jackson	37	3
\.


--
-- Data for Name: seminars; Type: TABLE DATA; Schema: public; Owner: nmuta
--

COPY seminars (id, name, professor_id) FROM stdin;
1	 No SQL Databases	2
2	 Refactoring code	8
3	 Server Side Templating	9
5	 CSS	7
6	 Advanced Animation	6
7	 Forking on Github	5
8	 Github with teams	5
9	 AWS Essentials	4
10	 Python	4
11	 Ruby Expressions	2
12	 Adobe Animate	1
13	 Adobe Illustrator	1
14	 Adobe Photoshop	1
15	 Recursion	8
16	 Memory Management	8
17	 SOLID	7
\.


--
-- Name: seminars_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nmuta
--

SELECT pg_catalog.setval('seminars_id_seq', 2, true);


--
-- PostgreSQL database dump complete
--

