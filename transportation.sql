--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

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
-- Name: bikes; Type: TABLE; Schema: public; Owner: nmuta; Tablespace: 
--

CREATE TABLE bikes (
    id integer NOT NULL,
    name character varying(50)
);


ALTER TABLE bikes OWNER TO nmuta;

--
-- Name: bikes_id_seq; Type: SEQUENCE; Schema: public; Owner: nmuta
--

CREATE SEQUENCE bikes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE bikes_id_seq OWNER TO nmuta;

--
-- Name: bikes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nmuta
--

ALTER SEQUENCE bikes_id_seq OWNED BY bikes.id;


--
-- Name: riders; Type: TABLE; Schema: public; Owner: nmuta; Tablespace: 
--

CREATE TABLE riders (
    id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50),
    bicycle_id integer
);


ALTER TABLE riders OWNER TO nmuta;

--
-- Name: riders_id_seq; Type: SEQUENCE; Schema: public; Owner: nmuta
--

CREATE SEQUENCE riders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE riders_id_seq OWNER TO nmuta;

--
-- Name: riders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: nmuta
--

ALTER SEQUENCE riders_id_seq OWNED BY riders.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: nmuta
--

ALTER TABLE ONLY bikes ALTER COLUMN id SET DEFAULT nextval('bikes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: nmuta
--

ALTER TABLE ONLY riders ALTER COLUMN id SET DEFAULT nextval('riders_id_seq'::regclass);


--
-- Data for Name: bikes; Type: TABLE DATA; Schema: public; Owner: nmuta
--

COPY bikes (id, name) FROM stdin;
1	indigo
2	peach
3	sunset
4	peugeot
5	death wish
6	chainz
\.


--
-- Name: bikes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nmuta
--

SELECT pg_catalog.setval('bikes_id_seq', 6, true);


--
-- Data for Name: riders; Type: TABLE DATA; Schema: public; Owner: nmuta
--

COPY riders (id, first_name, last_name, bicycle_id) FROM stdin;
1	Has_bike	Jackson	4
2	No_bike	Smith	\N
4	Missing_bike	Anderson	256
5	Bikeless	James	\N
3	Like_bike	Michelson	5
\.


--
-- Name: riders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: nmuta
--

SELECT pg_catalog.setval('riders_id_seq', 5, true);


--
-- Name: public; Type: ACL; Schema: -; Owner: nmuta
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM nmuta;
GRANT ALL ON SCHEMA public TO nmuta;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

