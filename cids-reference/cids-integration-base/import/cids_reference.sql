SELECT UpdateGeometrySRID('public', 'geom', 'geo_field', 25832);
SELECT UpdateGeometrySRID('public', 'cs_cache', 'geometry', 25832);
--
-- PostgreSQL database dump
--

-- Dumped from database version 9.0.3
-- Dumped by pg_dump version 9.5.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;
SET row_security = off;

SET search_path = public, pg_catalog;

--
-- Name: sph_betreiber_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sph_betreiber_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sph_betreiber_seq OWNER TO postgres;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: sph_betreiber; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE sph_betreiber (
    zusatzinfo text,
    name text,
    id integer DEFAULT nextval('sph_betreiber_seq'::regclass) NOT NULL
);


ALTER TABLE sph_betreiber OWNER TO postgres;

--
-- Name: sph_kategorie_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sph_kategorie_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sph_kategorie_seq OWNER TO postgres;

--
-- Name: sph_kategorie; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE sph_kategorie (
    name text,
    id integer DEFAULT nextval('sph_kategorie_seq'::regclass) NOT NULL
);


ALTER TABLE sph_kategorie OWNER TO postgres;

--
-- Name: sph_spielhalle_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sph_spielhalle_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sph_spielhalle_seq OWNER TO postgres;

--
-- Name: sph_spielhalle; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE sph_spielhalle (
    verbandsnummer character(12),
    name text,
    hauptkategorie integer,
    typ integer,
    betreiber integer,
    alkohol_ausschank boolean,
    genehmigung_bis date,
    geometrie integer,
    letze_aenderung timestamp without time zone,
    kategorien integer,
    anzahl_sitzplaetze integer,
    id integer DEFAULT nextval('sph_spielhalle_seq'::regclass) NOT NULL
);


ALTER TABLE sph_spielhalle OWNER TO postgres;

--
-- Name: sph_spielhalle_kategorien_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sph_spielhalle_kategorien_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sph_spielhalle_kategorien_seq OWNER TO postgres;

--
-- Name: sph_spielhalle_kategorien; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE sph_spielhalle_kategorien (
    spielhalle_reference integer,
    kategorie integer,
    id integer DEFAULT nextval('sph_spielhalle_kategorien_seq'::regclass) NOT NULL
);


ALTER TABLE sph_spielhalle_kategorien OWNER TO postgres;

--
-- Name: sph_typ_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE sph_typ_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE sph_typ_seq OWNER TO postgres;

--
-- Name: sph_typ; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE sph_typ (
    name text,
    id integer DEFAULT nextval('sph_typ_seq'::regclass) NOT NULL
);


ALTER TABLE sph_typ OWNER TO postgres;

--
-- Data for Name: sph_betreiber; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO sph_betreiber VALUES ('GmbH', 'Betreibergesellschaft Lucky Button', 1);
INSERT INTO sph_betreiber VALUES ('AG', 'Betreibergesellschaft Washing Coins', 2);
INSERT INTO sph_betreiber VALUES ('Ltd.', 'Betreibergruppe Fast Money', 3);


--
-- Name: sph_betreiber_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sph_betreiber_seq', 3, true);


--
-- Data for Name: sph_kategorie; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO sph_kategorie VALUES ('Arcade', 1);
INSERT INTO sph_kategorie VALUES ('Lightgun', 2);
INSERT INTO sph_kategorie VALUES ('Münzschieber', 3);
INSERT INTO sph_kategorie VALUES ('einarmiger Bandit', 4);
INSERT INTO sph_kategorie VALUES ('3er Rolle', 5);
INSERT INTO sph_kategorie VALUES ('4er Rolle', 6);
INSERT INTO sph_kategorie VALUES ('Flipper', 7);
INSERT INTO sph_kategorie VALUES ('Roulette Automat', 8);
INSERT INTO sph_kategorie VALUES ('Blackjack Automat', 9);
INSERT INTO sph_kategorie VALUES ('Photoplay', 10);


--
-- Name: sph_kategorie_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sph_kategorie_seq', 10, true);


--
-- Data for Name: sph_spielhalle; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO sph_spielhalle VALUES ('iFhSveOnalTR', 'Spielhalle Leichtes Geld', NULL, 1, NULL, NULL, '2016-03-24', NULL, '2016-03-24 15:09:03.994305', 10, NULL, 10);
INSERT INTO sph_spielhalle VALUES ('qQYSFhBtnfEv', 'Magic Spielhalle', 1, 1, 1, true, '2017-03-24', 22, '2016-03-24 15:09:03.989801', 1, 56, 1);
INSERT INTO sph_spielhalle VALUES ('mZkQnrCTpJHB', 'Spiel-in Meyer', 1, 3, 2, false, '2018-03-24', 23, '2016-03-24 15:09:03.991593', 2, 45, 2);
INSERT INTO sph_spielhalle VALUES ('vgakjnhXCMoD', 'Glücks-Karl', 2, 2, 2, true, '2019-03-24', 24, '2016-03-24 15:09:03.992102', 3, 10, 3);
INSERT INTO sph_spielhalle VALUES ('wXcrPWpFZKei', 'Spielpalast', 3, 3, 2, NULL, '2016-03-24', 25, '2016-03-24 15:09:03.992411', 4, 12, 4);
INSERT INTO sph_spielhalle VALUES ('cNKZxLpIMXTr', 'Happy Winner Nowotny', 3, 2, 1, NULL, '2026-03-24', 26, '2016-03-24 15:09:03.992788', 5, 2, 5);
INSERT INTO sph_spielhalle VALUES ('LbYWmfzEdQHP', 'Joker House', 5, NULL, 1, NULL, '2015-03-24', 27, '2016-03-24 15:09:03.993098', 6, 23, 6);
INSERT INTO sph_spielhalle VALUES (NULL, 'Dark Room Lucky Punch', 6, 3, 1, true, '2012-03-24', 28, '2016-03-24 15:09:03.993409', 7, 54, 7);
INSERT INTO sph_spielhalle VALUES ('LbYWmfzEdQHP', 'Spielhalle Gewinner', 7, 1, 3, NULL, '2016-03-24', 29, '2016-03-24 15:09:03.993703', 8, 100, 8);
INSERT INTO sph_spielhalle VALUES (NULL, 'Glückshalle', 8, 3, 3, true, '2016-03-24', 30, '2016-03-24 15:09:03.994004', 9, 5, 9);


--
-- Data for Name: sph_spielhalle_kategorien; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO sph_spielhalle_kategorien VALUES (1, 1, 2);
INSERT INTO sph_spielhalle_kategorien VALUES (2, 1, 3);
INSERT INTO sph_spielhalle_kategorien VALUES (3, 2, 4);
INSERT INTO sph_spielhalle_kategorien VALUES (4, 3, 5);
INSERT INTO sph_spielhalle_kategorien VALUES (6, 5, 7);
INSERT INTO sph_spielhalle_kategorien VALUES (7, 6, 8);
INSERT INTO sph_spielhalle_kategorien VALUES (8, 7, 9);
INSERT INTO sph_spielhalle_kategorien VALUES (9, 8, 10);
INSERT INTO sph_spielhalle_kategorien VALUES (1, 2, 11);
INSERT INTO sph_spielhalle_kategorien VALUES (1, 3, 12);
INSERT INTO sph_spielhalle_kategorien VALUES (1, 4, 13);
INSERT INTO sph_spielhalle_kategorien VALUES (1, 5, 14);
INSERT INTO sph_spielhalle_kategorien VALUES (1, 7, 15);
INSERT INTO sph_spielhalle_kategorien VALUES (2, 5, 16);
INSERT INTO sph_spielhalle_kategorien VALUES (2, 8, 17);
INSERT INTO sph_spielhalle_kategorien VALUES (4, 5, 19);
INSERT INTO sph_spielhalle_kategorien VALUES (5, 4, 20);
INSERT INTO sph_spielhalle_kategorien VALUES (8, 4, 21);


--
-- Name: sph_spielhalle_kategorien_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sph_spielhalle_kategorien_seq', 21, true);


--
-- Name: sph_spielhalle_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sph_spielhalle_seq', 10, true);


--
-- Data for Name: sph_typ; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO sph_typ VALUES ('Spielhalle', 1);
INSERT INTO sph_typ VALUES ('Wettbüro', 2);
INSERT INTO sph_typ VALUES ('Spielhalle mit Mehrfachkonzession', 3);


--
-- Name: sph_typ_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('sph_typ_seq', 3, true);


--
-- Name: sph_betreiber_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sph_betreiber
    ADD CONSTRAINT sph_betreiber_pkey PRIMARY KEY (id);


--
-- Name: sph_kategorie_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sph_kategorie
    ADD CONSTRAINT sph_kategorie_pkey PRIMARY KEY (id);


--
-- Name: sph_spielhalle_kategorien_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sph_spielhalle_kategorien
    ADD CONSTRAINT sph_spielhalle_kategorien_pkey PRIMARY KEY (id);


--
-- Name: sph_spielhalle_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sph_spielhalle
    ADD CONSTRAINT sph_spielhalle_pkey PRIMARY KEY (id);


--
-- Name: sph_typ_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sph_typ
    ADD CONSTRAINT sph_typ_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 9.0.3
-- Dumped by pg_dump version 9.5.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;
SET row_security = off;

SET search_path = public, pg_catalog;

--
-- Data for Name: cs_config_attr_key; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO cs_config_attr_key VALUES (1, 'csa://bandwidthTest', 'default');
INSERT INTO cs_config_attr_key VALUES (2, 'csa://downloadFile', 'default');
INSERT INTO cs_config_attr_key VALUES (3, 'csa://httpTunnelAction', 'default');
INSERT INTO cs_config_attr_key VALUES (4, 'csa://passwordSwitcherAdminAction', 'default');
INSERT INTO cs_config_attr_key VALUES (5, 'csa://testAction', 'default');
INSERT INTO cs_config_attr_key VALUES (6, 'csa://webDavTunnelAction', 'default');


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 9.0.3
-- Dumped by pg_dump version 9.5.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;
SET row_security = off;

SET search_path = public, pg_catalog;

--
-- Data for Name: cs_all_attr_mapping; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: cs_all_attr_mapping_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cs_all_attr_mapping_sequence', 1, false);


--
-- Data for Name: cs_attr; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO cs_attr VALUES (1, 1, 2, 'ID', 'ID', false, false, NULL, NULL, true, false, false, NULL, NULL, NULL, NULL, false, NULL, NULL, 0, NULL, NULL, false);
INSERT INTO cs_attr VALUES (2, 1, 1, 'GEO_STRING', 'GEO_FIELD', false, false, NULL, NULL, true, false, false, NULL, NULL, NULL, NULL, true, NULL, NULL, 1, NULL, NULL, false);
INSERT INTO cs_attr VALUES (3, 3, 2, 'ID', 'ID', false, false, NULL, NULL, true, false, false, NULL, NULL, NULL, NULL, false, NULL, NULL, 0, NULL, NULL, false);
INSERT INTO cs_attr VALUES (4, 3, 8, 'PROT_PREFIX', 'PROT_PREFIX', false, false, NULL, NULL, true, false, false, NULL, NULL, NULL, NULL, false, NULL, NULL, 1, NULL, NULL, false);
INSERT INTO cs_attr VALUES (5, 3, 9, 'PATH', 'PATH', false, false, NULL, NULL, true, false, false, NULL, NULL, NULL, NULL, false, NULL, NULL, 3, NULL, NULL, false);
INSERT INTO cs_attr VALUES (6, 3, 9, 'SERVER', 'SERVER', false, false, NULL, NULL, true, false, false, NULL, NULL, NULL, NULL, false, NULL, NULL, 2, NULL, NULL, false);
INSERT INTO cs_attr VALUES (7, 2, 2, 'ID', 'ID', false, false, NULL, NULL, true, false, false, NULL, NULL, NULL, NULL, false, NULL, NULL, 0, NULL, NULL, false);
INSERT INTO cs_attr VALUES (8, 2, 9, 'OBJECT_NAME', 'OBJECT_NAME', false, false, NULL, NULL, true, false, false, NULL, NULL, NULL, NULL, false, NULL, NULL, 2, NULL, NULL, false);
INSERT INTO cs_attr VALUES (9, 2, 17, 'URL_BASE_ID', 'URL_BASE_ID', true, false, 3, NULL, true, false, false, NULL, NULL, NULL, NULL, false, NULL, NULL, 1, NULL, NULL, false);
INSERT INTO cs_attr VALUES (10, 4, 2, 'id', 'ID', false, false, NULL, 'Primärschlüssel', false, false, false, NULL, NULL, NULL, NULL, false, NULL, NULL, 0, NULL, NULL, false);
INSERT INTO cs_attr VALUES (11, 4, 9, 'name', 'name', false, false, NULL, NULL, true, false, false, NULL, NULL, NULL, NULL, true, NULL, NULL, 1, NULL, NULL, false);
INSERT INTO cs_attr VALUES (12, 5, 2, 'id', 'ID', false, false, NULL, 'Primärschlüssel', false, false, false, NULL, NULL, NULL, NULL, false, NULL, NULL, 0, NULL, NULL, false);
INSERT INTO cs_attr VALUES (14, 6, 2, 'id', 'ID', false, false, NULL, 'Primärschlüssel', false, false, false, NULL, NULL, NULL, NULL, false, NULL, NULL, 0, NULL, NULL, false);
INSERT INTO cs_attr VALUES (15, 6, 21, 'kategorie', 'kategorie', true, false, 5, NULL, true, false, false, NULL, NULL, NULL, NULL, true, NULL, NULL, 1, NULL, NULL, false);
INSERT INTO cs_attr VALUES (16, 6, 2, 'spielhalle_reference', 'spielhalle_reference', false, false, NULL, NULL, true, false, false, NULL, NULL, NULL, NULL, true, NULL, NULL, 2, NULL, NULL, false);
INSERT INTO cs_attr VALUES (20, 7, 2, 'id', 'ID', false, false, NULL, 'Primärschlüssel', false, false, false, NULL, NULL, NULL, NULL, false, NULL, NULL, 0, NULL, NULL, false);
INSERT INTO cs_attr VALUES (23, 7, 13, 'genehmigung_bis', 'genehmigung_bis', false, false, NULL, NULL, true, false, false, NULL, NULL, NULL, NULL, true, NULL, NULL, 9, NULL, NULL, false);
INSERT INTO cs_attr VALUES (24, 7, 7, 'verbandsnummer', 'verbandsnummer', false, false, NULL, NULL, true, true, false, NULL, NULL, NULL, NULL, true, NULL, NULL, 8, 12, NULL, false);
INSERT INTO cs_attr VALUES (25, 7, 10, 'alkohol_ausschank', 'alkohol_ausschank', false, false, NULL, NULL, true, false, false, NULL, NULL, NULL, NULL, true, NULL, NULL, 7, NULL, NULL, false);
INSERT INTO cs_attr VALUES (26, 7, 2, 'anzahl_sitzplaetze', 'anzahl_sitzplaetze', false, false, NULL, NULL, true, false, false, NULL, NULL, NULL, NULL, true, NULL, NULL, 6, NULL, NULL, false);
INSERT INTO cs_attr VALUES (27, 7, 14, 'letze_aenderung', 'letze_aenderung', false, false, NULL, NULL, true, false, false, NULL, NULL, NULL, NULL, true, NULL, NULL, 10, NULL, NULL, false);
INSERT INTO cs_attr VALUES (17, 7, 21, 'hauptkategorie', 'hauptkategorie', true, false, 5, NULL, true, true, false, NULL, NULL, NULL, NULL, true, NULL, NULL, 4, NULL, NULL, false);
INSERT INTO cs_attr VALUES (18, 7, 20, 'typ', 'typ', true, false, 4, NULL, true, true, false, NULL, NULL, NULL, NULL, true, NULL, NULL, 3, NULL, NULL, false);
INSERT INTO cs_attr VALUES (19, 7, 19, 'geometrie', 'geometrie', true, false, 1, NULL, true, true, false, NULL, NULL, NULL, NULL, true, NULL, NULL, 1, NULL, NULL, false);
INSERT INTO cs_attr VALUES (21, 7, 22, 'kategorien', 'kategorien', true, false, 6, NULL, true, true, true, 'SPIELHALLE_reference', NULL, NULL, NULL, true, NULL, NULL, 5, NULL, NULL, false);
INSERT INTO cs_attr VALUES (22, 7, 9, 'name', 'name', false, false, NULL, NULL, true, true, false, NULL, NULL, NULL, NULL, true, NULL, NULL, 2, NULL, NULL, false);
INSERT INTO cs_attr VALUES (13, 5, 9, 'name', 'name', false, false, NULL, NULL, true, true, false, NULL, NULL, NULL, NULL, true, NULL, NULL, 1, NULL, NULL, false);
INSERT INTO cs_attr VALUES (28, 7, 9, 'wgs84', 'wgs84', false, false, NULL, NULL, true, false, false, NULL, NULL, NULL, NULL, true, NULL, NULL, 11, NULL, NULL, true);
INSERT INTO cs_attr VALUES (29, 8, 2, 'id', 'ID', false, false, NULL, 'Primärschlüssel', false, false, false, NULL, NULL, NULL, NULL, false, NULL, NULL, 0, NULL, NULL, false);
INSERT INTO cs_attr VALUES (30, 8, 9, 'name', 'name', false, false, NULL, NULL, true, true, false, NULL, NULL, NULL, NULL, true, NULL, NULL, 1, NULL, NULL, false);
INSERT INTO cs_attr VALUES (31, 8, 9, 'zusatzinfo', 'zusatzinfo', false, false, NULL, NULL, true, false, false, NULL, NULL, NULL, NULL, true, NULL, NULL, 2, NULL, NULL, false);
INSERT INTO cs_attr VALUES (32, 7, 24, 'betreiber', 'betreiber', true, false, 8, NULL, true, false, false, NULL, NULL, NULL, NULL, true, NULL, NULL, 12, NULL, NULL, false);
INSERT INTO cs_attr VALUES (33, 8, 23, 'spielhallen', 'spielhallen', true, false, -7, NULL, true, false, false, NULL, NULL, NULL, NULL, true, NULL, NULL, 3, NULL, NULL, false);


--
-- Data for Name: cs_attr_object; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: cs_attr_object_derived; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: cs_attr_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cs_attr_sequence', 33, true);


--
-- Data for Name: cs_attr_string; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: cs_cat_link; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: cs_cat_link_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cs_cat_link_sequence', 1, false);


--
-- Data for Name: cs_cat_node; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: cs_cat_node_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cs_cat_node_sequence', 1, false);


--
-- Data for Name: cs_class; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO cs_class VALUES (1, 'GEOM', 'Cids Geodatentyp', 1, 1, 'GEOM', 'ID', true, NULL, NULL, NULL, false, NULL, NULL);
INSERT INTO cs_class VALUES (2, 'URL', NULL, 2, 2, 'URL', 'ID', false, NULL, NULL, NULL, false, NULL, NULL);
INSERT INTO cs_class VALUES (3, 'URL_BASE', NULL, 2, 2, 'URL_BASE', 'ID', false, NULL, NULL, NULL, false, NULL, NULL);
INSERT INTO cs_class VALUES (4, 'SPH_TYP', 'Typ der Spielhalle', 2, 2, 'SPH_TYP', 'ID', false, NULL, NULL, NULL, false, NULL, NULL);
INSERT INTO cs_class VALUES (5, 'SPH_KATEGORIE', '', 2, 2, 'SPH_KATEGORIE', 'ID', false, NULL, NULL, NULL, false, NULL, NULL);
INSERT INTO cs_class VALUES (6, 'SPH_SPIELHALLE_KATEGORIEN', '', 2, 2, 'SPH_SPIELHALLE_KATEGORIEN', 'ID', false, NULL, NULL, NULL, true, NULL, NULL);
INSERT INTO cs_class VALUES (7, 'SPH_SPIELHALLE', '', 2, 2, 'SPH_SPIELHALLE', 'ID', true, NULL, NULL, NULL, false, NULL, NULL);
INSERT INTO cs_class VALUES (8, 'SPH_Betreiber', '', 2, 2, 'SPH_BETREIBER', 'ID', false, NULL, NULL, NULL, false, NULL, NULL);


--
-- Data for Name: cs_class_attr; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: cs_class_attr_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cs_class_attr_sequence', 1, false);


--
-- Name: cs_class_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cs_class_sequence', 8, true);


--
-- Data for Name: cs_config_attr_exempt; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: cs_config_attr_exempt_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cs_config_attr_exempt_sequence', 1, false);


--
-- Data for Name: cs_config_attr_jt; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO cs_config_attr_jt VALUES (1, NULL, 1, 1, 1, 1, 2);
INSERT INTO cs_config_attr_jt VALUES (2, NULL, 1, 1, 2, 1, 2);
INSERT INTO cs_config_attr_jt VALUES (3, NULL, 1, 1, 3, 1, 2);
INSERT INTO cs_config_attr_jt VALUES (4, NULL, 1, 1, 4, 1, 2);
INSERT INTO cs_config_attr_jt VALUES (5, NULL, 1, 1, 5, 1, 2);
INSERT INTO cs_config_attr_jt VALUES (6, NULL, 1, 1, 6, 1, 2);


--
-- Name: cs_config_attr_jt_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cs_config_attr_jt_sequence', 1, false);


--
-- Name: cs_config_attr_key_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cs_config_attr_key_sequence', 1, false);


--
-- Data for Name: cs_config_attr_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO cs_config_attr_type VALUES (1, 'C', 'regular configuration attribute, a simple string value');
INSERT INTO cs_config_attr_type VALUES (2, 'A', 'action tag configuration attribute, value of no relevance');
INSERT INTO cs_config_attr_type VALUES (3, 'X', 'XML configuration attribute, XML content wrapped by some root element');


--
-- Name: cs_config_attr_type_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cs_config_attr_type_sequence', 3, true);


--
-- Data for Name: cs_config_attr_value; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO cs_config_attr_value VALUES (1, 'true');


--
-- Name: cs_config_attr_value_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cs_config_attr_value_sequence', 1, false);


--
-- Data for Name: cs_domain; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO cs_domain VALUES (1, 'LOCAL');


--
-- Name: cs_domain_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cs_domain_sequence', 1, true);


--
-- Data for Name: cs_history; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: cs_icon; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO cs_icon VALUES (1, 'Georeferenz', 'georeferenz.gif');
INSERT INTO cs_icon VALUES (2, 'Erde', 'erde.gif');


--
-- Name: cs_icon_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cs_icon_sequence', 2, true);


--
-- Data for Name: cs_java_class; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: cs_java_class_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cs_java_class_sequence', 1, false);


--
-- Name: cs_locks_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cs_locks_seq', 2, true);


--
-- Data for Name: cs_method; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: cs_method_class_assoc; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: cs_method_class_assoc_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cs_method_class_assoc_sequence', 1, false);


--
-- Name: cs_method_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cs_method_sequence', 1, false);


--
-- Data for Name: cs_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO cs_permission VALUES (0, 'read', 'Leserecht');
INSERT INTO cs_permission VALUES (1, 'write', 'Schreibrecht');


--
-- Name: cs_permission_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cs_permission_sequence', 1, false);


--
-- Data for Name: cs_policy; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO cs_policy VALUES (0, 'STANDARD');
INSERT INTO cs_policy VALUES (1, 'WIKI');
INSERT INTO cs_policy VALUES (2, 'SECURE');


--
-- Data for Name: cs_policy_rule; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO cs_policy_rule VALUES (1, 0, 0, true);
INSERT INTO cs_policy_rule VALUES (2, 0, 1, false);
INSERT INTO cs_policy_rule VALUES (3, 1, 0, true);
INSERT INTO cs_policy_rule VALUES (4, 1, 1, true);
INSERT INTO cs_policy_rule VALUES (5, 2, 0, false);
INSERT INTO cs_policy_rule VALUES (6, 2, 1, false);


--
-- Name: cs_policy_rule_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cs_policy_rule_sequence', 1, false);


--
-- Name: cs_policy_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cs_policy_sequence', 1, false);


--
-- Data for Name: cs_query; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: cs_query_class_assoc; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: cs_query_class_assoc_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cs_query_class_assoc_sequence', 1, false);


--
-- Data for Name: cs_query_link; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: cs_query_link_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cs_query_link_sequence', 1, false);


--
-- Data for Name: cs_query_parameter; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: cs_query_parameter_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cs_query_parameter_sequence', 1, false);


--
-- Name: cs_query_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cs_query_sequence', 1, false);


--
-- Data for Name: cs_query_store; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: cs_query_store_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cs_query_store_sequence', 1, false);


--
-- Data for Name: cs_query_store_ug_assoc; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: cs_query_store_ug_assoc_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cs_query_store_ug_assoc_sequence', 1, false);


--
-- Data for Name: cs_query_ug_assoc; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: cs_query_ug_assoc_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cs_query_ug_assoc_sequence', 1, false);


--
-- Data for Name: cs_scheduled_serveractions; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: cs_scheduled_serveractions_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cs_scheduled_serveractions_sequence', 1, false);


--
-- Data for Name: cs_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO cs_type VALUES (1, 'cids_GEOMETRY', NULL, false, NULL, NULL, NULL);
INSERT INTO cs_type VALUES (2, 'INTEGER', NULL, false, NULL, NULL, NULL);
INSERT INTO cs_type VALUES (3, 'INT2', NULL, false, NULL, NULL, NULL);
INSERT INTO cs_type VALUES (4, 'INT4', NULL, false, NULL, NULL, NULL);
INSERT INTO cs_type VALUES (5, 'INT8', NULL, false, NULL, NULL, NULL);
INSERT INTO cs_type VALUES (6, 'NUMERIC', NULL, false, NULL, NULL, NULL);
INSERT INTO cs_type VALUES (7, 'CHAR', NULL, false, NULL, NULL, NULL);
INSERT INTO cs_type VALUES (8, 'VARCHAR', NULL, false, NULL, NULL, NULL);
INSERT INTO cs_type VALUES (9, 'TEXT', NULL, false, NULL, NULL, NULL);
INSERT INTO cs_type VALUES (10, 'BOOL', NULL, false, NULL, NULL, NULL);
INSERT INTO cs_type VALUES (11, 'FLOAT4', NULL, false, NULL, NULL, NULL);
INSERT INTO cs_type VALUES (12, 'FLOAT8', NULL, false, NULL, NULL, NULL);
INSERT INTO cs_type VALUES (13, 'DATE', NULL, false, NULL, NULL, NULL);
INSERT INTO cs_type VALUES (14, 'TIMESTAMP', NULL, false, NULL, NULL, NULL);
INSERT INTO cs_type VALUES (15, 'BPCHAR', NULL, false, NULL, NULL, NULL);
INSERT INTO cs_type VALUES (16, 'Extension Type', NULL, false, NULL, NULL, NULL);
INSERT INTO cs_type VALUES (17, 'URL_BASE', 3, true, NULL, NULL, NULL);
INSERT INTO cs_type VALUES (18, 'URL', 2, true, NULL, NULL, NULL);
INSERT INTO cs_type VALUES (19, 'GEOM', 1, true, NULL, NULL, NULL);
INSERT INTO cs_type VALUES (20, 'SPH_TYP', 4, true, NULL, NULL, NULL);
INSERT INTO cs_type VALUES (21, 'SPH_KATEGORIE', 5, true, NULL, NULL, NULL);
INSERT INTO cs_type VALUES (22, 'SPH_SPIELHALLE_KATEGORIEN', 6, true, NULL, NULL, NULL);
INSERT INTO cs_type VALUES (23, 'SPH_SPIELHALLE', 7, true, NULL, NULL, NULL);
INSERT INTO cs_type VALUES (24, 'SPH_Betreiber', 8, true, NULL, NULL, NULL);


--
-- Name: cs_type_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cs_type_sequence', 24, true);


--
-- Data for Name: cs_ug; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO cs_ug VALUES (1, 'Administratoren', NULL, 1, 0);
INSERT INTO cs_ug VALUES (2, 'Gäste', NULL, 1, 1);


--
-- Data for Name: cs_ug_attr_perm; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: cs_ug_attr_perm_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cs_ug_attr_perm_sequence', 1, false);


--
-- Data for Name: cs_ug_cat_node_perm; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: cs_ug_cat_node_perm_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cs_ug_cat_node_perm_sequence', 1, false);


--
-- Data for Name: cs_ug_class_perm; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO cs_ug_class_perm VALUES (1, 1, 1, 1, NULL);
INSERT INTO cs_ug_class_perm VALUES (2, 1, 8, 1, NULL);
INSERT INTO cs_ug_class_perm VALUES (3, 1, 5, 1, NULL);
INSERT INTO cs_ug_class_perm VALUES (4, 1, 7, 1, NULL);
INSERT INTO cs_ug_class_perm VALUES (5, 1, 6, 1, NULL);
INSERT INTO cs_ug_class_perm VALUES (6, 1, 4, 1, NULL);
INSERT INTO cs_ug_class_perm VALUES (7, 1, 2, 1, NULL);
INSERT INTO cs_ug_class_perm VALUES (8, 1, 3, 1, NULL);


--
-- Name: cs_ug_class_perm_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cs_ug_class_perm_sequence', 1, false);


--
-- Data for Name: cs_ug_membership; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO cs_ug_membership VALUES (1, 1, NULL, 1);
INSERT INTO cs_ug_membership VALUES (2, 2, NULL, 2);


--
-- Name: cs_ug_membership_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cs_ug_membership_sequence', 2, true);


--
-- Data for Name: cs_ug_method_perm; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: cs_ug_method_perm_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cs_ug_method_perm_sequence', 1, false);


--
-- Name: cs_ug_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cs_ug_sequence', 2, true);


--
-- Data for Name: cs_usr; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO cs_usr VALUES (1, 'admin', '*****', '2016-03-24 10:58:45.391675', true, '9a64e84ab2813b8e4c5ffb324ef26230                                ', '7brg5tbj6HbebPAZ', NULL, NULL);
INSERT INTO cs_usr VALUES (2, 'gast', '*****', '2016-03-24 10:58:45.393509', false, '04ff7188b378698b663a3566e2565662                                ', '3HgMi39UwpzFdNUa', NULL, NULL);


--
-- Name: cs_usr_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('cs_usr_sequence', 2, true);


--
-- Data for Name: geom; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO geom VALUES (22, '0101000020E86400005D9C1C3785AA16415BFBCEBAB0AB5541');
INSERT INTO geom VALUES (23, '0101000020E8640000712A29FCEBE9164143115C83BEAC5541');
INSERT INTO geom VALUES (24, '0101000020E8640000A0E0FA9F2ED71641A0F0A34D91A75541');
INSERT INTO geom VALUES (25, '0101000020E8640000DA08D83DF6D71641FE3DDD1184A75541');
INSERT INTO geom VALUES (26, '0101000020E8640000B6E1F423BD9B16411711C11D12AA5541');
INSERT INTO geom VALUES (27, '0101000020E86400004BD0DB6B859B16416417545FD9A95541');
INSERT INTO geom VALUES (28, '0101000020E8640000058D0B5E9FD4164129C18F807DAC5541');
INSERT INTO geom VALUES (29, '0101000020E8640000D0EE9531CDA016417C9775FBD6AB5541');
INSERT INTO geom VALUES (30, '0101000020E8640000334CECB228B216413A93789F36AD5541');
INSERT INTO geom VALUES (31, '0101000020E8640000FB69DEE44FB2164175E65E9C37AD5541');


--
-- PostgreSQL database dump complete
--

SELECT recreate_cache();
SELECT reindex();
SELECT recreate_cache();
