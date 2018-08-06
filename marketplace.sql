--
-- PostgreSQL database dump
--

-- Dumped from database version 10.4
-- Dumped by pg_dump version 10.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner:joe.shmo
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: joe.shmo
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: countries; Type: TABLE; Schema: public;
--

CREATE TABLE public.countries (
    id integer NOT NULL,
    iso_code text,
    country_name text
);



--
-- Name: countries_id_seq; Type: SEQUENCE; Schema: public;
--

CREATE SEQUENCE public.countries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



--
-- Name: countries_id_seq; Type: SEQUENCE OWNED BY; Schema: public;
--

ALTER SEQUENCE public.countries_id_seq OWNED BY public.countries.id;


--
-- Name: customers; Type: TABLE; Schema: public;
--

CREATE TABLE public.customers (
    id integer NOT NULL,
    firstname text NOT NULL,
    lastname text,
    country_id integer
);



--
-- Name: customers_id_seq; Type: SEQUENCE; Schema: public; Owner: joe.shmo
--

CREATE SEQUENCE public.customers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



--
-- Name: customers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: joe.shmo
--

ALTER SEQUENCE public.customers_id_seq OWNED BY public.customers.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: joe.shmo
--

CREATE TABLE public.orders (
    customer_id integer,
    product_id integer,
    order_date timestamp with time zone
);



--
-- Name: products; Type: TABLE; Schema: public; Owner: joe.shmo
--

CREATE TABLE public.products (
    id integer NOT NULL,
    name text,
    price money
);



--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: joe.shmo
--

CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;



--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: joe.shmo
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- Name: countries id; Type: DEFAULT; Schema: public; Owner: joe.shmo
--

ALTER TABLE ONLY public.countries ALTER COLUMN id SET DEFAULT nextval('public.countries_id_seq'::regclass);


--
-- Name: customers id; Type: DEFAULT; Schema: public; Owner: joe.shmo
--

ALTER TABLE ONLY public.customers ALTER COLUMN id SET DEFAULT nextval('public.customers_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: joe.shmo
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: joe.shmo
--

COPY public.countries (id, iso_code, country_name) FROM stdin;
2	USA	United States of America
3	CAN	Canada
5	MEX	Mexico
6	VEN	Venezuela
7	PER	Peru
\.


--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: joe.shmo
--

COPY public.customers (id, firstname, lastname, country_id) FROM stdin;
1	Fred 	Sanford	2
2	Enriqueta 	Alemán	7
3	Jake	Ontario	3
4	Lupita	Nyongo	5
5	Jack	Black	2
6	Consuela	Luz	7
7	Rico	Suave	7
8	Adeola	Cole	2
9	Michael	Jackson	2
10	Leonardo	DiCaprio	2
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: joe.shmo
--

COPY public.orders (customer_id, product_id, order_date) FROM stdin;
10	8	2016-06-22 20:10:25-06
10	2	2018-01-02 01:10:11-07
9	7	2017-05-12 11:11:14-06
8	1	2011-11-02 02:12:25-06
7	5	2017-04-04 00:19:19-06
5	6	2017-03-03 01:13:13-07
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: joe.shmo
--

COPY public.products (id, name, price) FROM stdin;
2	Wookie Toothpaste	$4.99
1	Chia Pet	$10.99
3	Hylian Trousers	$68.99
4	Rusty Hair Comb	$2.99
5	Dragon Egg	$24,650.00
7	Tesla Model S	$75,700.00
6	Tesla Model 3	$50,000.00
8	Tesla Model X	$80,700.00
\.


--
-- Name: countries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: joe.shmo
--

SELECT pg_catalog.setval('public.countries_id_seq', 7, true);


--
-- Name: customers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: joe.shmo
--

SELECT pg_catalog.setval('public.customers_id_seq', 10, true);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: joe.shmo
--

SELECT pg_catalog.setval('public.products_id_seq', 8, true);


--
-- Name: countries countries_country_code_key; Type: CONSTRAINT; Schema: public; Owner: joe.shmo
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_country_code_key UNIQUE (iso_code);


--
-- Name: countries countries_pkey; Type: CONSTRAINT; Schema: public; Owner: joe.shmo
--

ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (id);


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: joe.shmo
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: joe.shmo
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: customers customers_country_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: joe.shmo
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_country_id_fkey FOREIGN KEY (country_id) REFERENCES public.countries(id);


--
-- PostgreSQL database dump complete
--
