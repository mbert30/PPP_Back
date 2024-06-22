--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3 (Debian 16.3-1.pgdg120+1)
-- Dumped by pg_dump version 16.3

-- Started on 2024-06-22 02:23:29

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
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- TOC entry 3409 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 218 (class 1259 OID 82153)
-- Name: fournisseur; Type: TABLE; Schema: public; Owner: mbert30
--

CREATE TABLE public.fournisseur (
    id integer NOT NULL,
    nomentreprise character varying(50)
);


ALTER TABLE public.fournisseur OWNER TO mbert30;

--
-- TOC entry 217 (class 1259 OID 82152)
-- Name: fournisseur_id_seq; Type: SEQUENCE; Schema: public; Owner: mbert30
--

CREATE SEQUENCE public.fournisseur_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.fournisseur_id_seq OWNER TO mbert30;

--
-- TOC entry 3410 (class 0 OID 0)
-- Dependencies: 217
-- Name: fournisseur_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mbert30
--

ALTER SEQUENCE public.fournisseur_id_seq OWNED BY public.fournisseur.id;


--
-- TOC entry 226 (class 1259 OID 82186)
-- Name: gamme; Type: TABLE; Schema: public; Owner: mbert30
--

CREATE TABLE public.gamme (
    id integer NOT NULL,
    id_piece integer NOT NULL,
    id_operation integer NOT NULL
);


ALTER TABLE public.gamme OWNER TO mbert30;

--
-- TOC entry 225 (class 1259 OID 82185)
-- Name: gamme_id_seq; Type: SEQUENCE; Schema: public; Owner: mbert30
--

CREATE SEQUENCE public.gamme_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.gamme_id_seq OWNER TO mbert30;

--
-- TOC entry 3411 (class 0 OID 0)
-- Dependencies: 225
-- Name: gamme_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mbert30
--

ALTER SEQUENCE public.gamme_id_seq OWNED BY public.gamme.id;


--
-- TOC entry 222 (class 1259 OID 82172)
-- Name: listepiece; Type: TABLE; Schema: public; Owner: mbert30
--

CREATE TABLE public.listepiece (
    id integer NOT NULL,
    id_pieceprincipal integer NOT NULL,
    id_composant integer NOT NULL,
    qt integer NOT NULL
);


ALTER TABLE public.listepiece OWNER TO mbert30;

--
-- TOC entry 221 (class 1259 OID 82171)
-- Name: listepiece_id_seq; Type: SEQUENCE; Schema: public; Owner: mbert30
--

CREATE SEQUENCE public.listepiece_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.listepiece_id_seq OWNER TO mbert30;

--
-- TOC entry 3412 (class 0 OID 0)
-- Dependencies: 221
-- Name: listepiece_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mbert30
--

ALTER SEQUENCE public.listepiece_id_seq OWNED BY public.listepiece.id;


--
-- TOC entry 224 (class 1259 OID 82179)
-- Name: operation; Type: TABLE; Schema: public; Owner: mbert30
--

CREATE TABLE public.operation (
    id integer NOT NULL,
    designation character varying(50) NOT NULL,
    description character varying(100) NOT NULL,
    machine character varying(50) NOT NULL
);


ALTER TABLE public.operation OWNER TO mbert30;

--
-- TOC entry 223 (class 1259 OID 82178)
-- Name: operation_id_seq; Type: SEQUENCE; Schema: public; Owner: mbert30
--

CREATE SEQUENCE public.operation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.operation_id_seq OWNER TO mbert30;

--
-- TOC entry 3413 (class 0 OID 0)
-- Dependencies: 223
-- Name: operation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mbert30
--

ALTER SEQUENCE public.operation_id_seq OWNED BY public.operation.id;


--
-- TOC entry 220 (class 1259 OID 82160)
-- Name: piece; Type: TABLE; Schema: public; Owner: mbert30
--

CREATE TABLE public.piece (
    id integer NOT NULL,
    refpiece character varying(25) NOT NULL,
    designation character varying(50) NOT NULL,
    longueur double precision,
    largeur double precision,
    hauteur double precision,
    typepiece smallint NOT NULL,
    prix double precision,
    estvendable smallint NOT NULL,
    nbstock integer,
    id_fournisseur integer
);


ALTER TABLE public.piece OWNER TO mbert30;

--
-- TOC entry 219 (class 1259 OID 82159)
-- Name: piece_id_seq; Type: SEQUENCE; Schema: public; Owner: mbert30
--

CREATE SEQUENCE public.piece_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.piece_id_seq OWNER TO mbert30;

--
-- TOC entry 3414 (class 0 OID 0)
-- Dependencies: 219
-- Name: piece_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mbert30
--

ALTER SEQUENCE public.piece_id_seq OWNED BY public.piece.id;


--
-- TOC entry 216 (class 1259 OID 82144)
-- Name: utilisateur; Type: TABLE; Schema: public; Owner: mbert30
--

CREATE TABLE public.utilisateur (
    id integer NOT NULL,
    identifiant text NOT NULL,
    mdp text,
    datecreation date NOT NULL
);


ALTER TABLE public.utilisateur OWNER TO mbert30;

--
-- TOC entry 215 (class 1259 OID 82143)
-- Name: utilisateur_id_seq; Type: SEQUENCE; Schema: public; Owner: mbert30
--

CREATE SEQUENCE public.utilisateur_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.utilisateur_id_seq OWNER TO mbert30;

--
-- TOC entry 3415 (class 0 OID 0)
-- Dependencies: 215
-- Name: utilisateur_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: mbert30
--

ALTER SEQUENCE public.utilisateur_id_seq OWNED BY public.utilisateur.id;


--
-- TOC entry 3229 (class 2604 OID 82156)
-- Name: fournisseur id; Type: DEFAULT; Schema: public; Owner: mbert30
--

ALTER TABLE ONLY public.fournisseur ALTER COLUMN id SET DEFAULT nextval('public.fournisseur_id_seq'::regclass);


--
-- TOC entry 3233 (class 2604 OID 82189)
-- Name: gamme id; Type: DEFAULT; Schema: public; Owner: mbert30
--

ALTER TABLE ONLY public.gamme ALTER COLUMN id SET DEFAULT nextval('public.gamme_id_seq'::regclass);


--
-- TOC entry 3231 (class 2604 OID 82175)
-- Name: listepiece id; Type: DEFAULT; Schema: public; Owner: mbert30
--

ALTER TABLE ONLY public.listepiece ALTER COLUMN id SET DEFAULT nextval('public.listepiece_id_seq'::regclass);


--
-- TOC entry 3232 (class 2604 OID 82182)
-- Name: operation id; Type: DEFAULT; Schema: public; Owner: mbert30
--

ALTER TABLE ONLY public.operation ALTER COLUMN id SET DEFAULT nextval('public.operation_id_seq'::regclass);


--
-- TOC entry 3230 (class 2604 OID 82163)
-- Name: piece id; Type: DEFAULT; Schema: public; Owner: mbert30
--

ALTER TABLE ONLY public.piece ALTER COLUMN id SET DEFAULT nextval('public.piece_id_seq'::regclass);


--
-- TOC entry 3228 (class 2604 OID 82147)
-- Name: utilisateur id; Type: DEFAULT; Schema: public; Owner: mbert30
--

ALTER TABLE ONLY public.utilisateur ALTER COLUMN id SET DEFAULT nextval('public.utilisateur_id_seq'::regclass);


--
-- TOC entry 3395 (class 0 OID 82153)
-- Dependencies: 218
-- Data for Name: fournisseur; Type: TABLE DATA; Schema: public; Owner: mbert30
--

COPY public.fournisseur (id, nomentreprise) FROM stdin;
1	LeRoyMerlin
\.


--
-- TOC entry 3403 (class 0 OID 82186)
-- Dependencies: 226
-- Data for Name: gamme; Type: TABLE DATA; Schema: public; Owner: mbert30
--

COPY public.gamme (id, id_piece, id_operation) FROM stdin;
\.


--
-- TOC entry 3399 (class 0 OID 82172)
-- Dependencies: 222
-- Data for Name: listepiece; Type: TABLE DATA; Schema: public; Owner: mbert30
--

COPY public.listepiece (id, id_pieceprincipal, id_composant, qt) FROM stdin;
13	32	30	4
14	32	31	3
\.


--
-- TOC entry 3401 (class 0 OID 82179)
-- Dependencies: 224
-- Data for Name: operation; Type: TABLE DATA; Schema: public; Owner: mbert30
--

COPY public.operation (id, designation, description, machine) FROM stdin;
\.


--
-- TOC entry 3397 (class 0 OID 82160)
-- Dependencies: 220
-- Data for Name: piece; Type: TABLE DATA; Schema: public; Owner: mbert30
--

COPY public.piece (id, refpiece, designation, longueur, largeur, hauteur, typepiece, prix, estvendable, nbstock, id_fournisseur) FROM stdin;
30	Comp1	Composant 1	30	30	30	1	30	1	30	\N
31	Comp2	Composant 2	30	30	30	1	30	1	30	\N
32	Produit1	Produit 1	\N	\N	\N	2	\N	1	\N	\N
\.


--
-- TOC entry 3393 (class 0 OID 82144)
-- Dependencies: 216
-- Data for Name: utilisateur; Type: TABLE DATA; Schema: public; Owner: mbert30
--

COPY public.utilisateur (id, identifiant, mdp, datecreation) FROM stdin;
1	User1	$2b$10$1SxA22TI5qxdu2TpBDWKCeN34l92DLTqVs/TTBlshbjUdC.Df82w.	2024-06-20
\.


--
-- TOC entry 3416 (class 0 OID 0)
-- Dependencies: 217
-- Name: fournisseur_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mbert30
--

SELECT pg_catalog.setval('public.fournisseur_id_seq', 1, true);


--
-- TOC entry 3417 (class 0 OID 0)
-- Dependencies: 225
-- Name: gamme_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mbert30
--

SELECT pg_catalog.setval('public.gamme_id_seq', 1, false);


--
-- TOC entry 3418 (class 0 OID 0)
-- Dependencies: 221
-- Name: listepiece_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mbert30
--

SELECT pg_catalog.setval('public.listepiece_id_seq', 14, true);


--
-- TOC entry 3419 (class 0 OID 0)
-- Dependencies: 223
-- Name: operation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mbert30
--

SELECT pg_catalog.setval('public.operation_id_seq', 1, false);


--
-- TOC entry 3420 (class 0 OID 0)
-- Dependencies: 219
-- Name: piece_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mbert30
--

SELECT pg_catalog.setval('public.piece_id_seq', 33, true);


--
-- TOC entry 3421 (class 0 OID 0)
-- Dependencies: 215
-- Name: utilisateur_id_seq; Type: SEQUENCE SET; Schema: public; Owner: mbert30
--

SELECT pg_catalog.setval('public.utilisateur_id_seq', 1, true);


--
-- TOC entry 3237 (class 2606 OID 82158)
-- Name: fournisseur fournisseur_pkey; Type: CONSTRAINT; Schema: public; Owner: mbert30
--

ALTER TABLE ONLY public.fournisseur
    ADD CONSTRAINT fournisseur_pkey PRIMARY KEY (id);


--
-- TOC entry 3245 (class 2606 OID 82191)
-- Name: gamme gamme_pkey; Type: CONSTRAINT; Schema: public; Owner: mbert30
--

ALTER TABLE ONLY public.gamme
    ADD CONSTRAINT gamme_pkey PRIMARY KEY (id);


--
-- TOC entry 3241 (class 2606 OID 82177)
-- Name: listepiece listepiece_pkey; Type: CONSTRAINT; Schema: public; Owner: mbert30
--

ALTER TABLE ONLY public.listepiece
    ADD CONSTRAINT listepiece_pkey PRIMARY KEY (id);


--
-- TOC entry 3243 (class 2606 OID 82184)
-- Name: operation operation_pkey; Type: CONSTRAINT; Schema: public; Owner: mbert30
--

ALTER TABLE ONLY public.operation
    ADD CONSTRAINT operation_pkey PRIMARY KEY (id);


--
-- TOC entry 3239 (class 2606 OID 82165)
-- Name: piece piece_pkey; Type: CONSTRAINT; Schema: public; Owner: mbert30
--

ALTER TABLE ONLY public.piece
    ADD CONSTRAINT piece_pkey PRIMARY KEY (id);


--
-- TOC entry 3235 (class 2606 OID 82151)
-- Name: utilisateur utilisateur_pkey; Type: CONSTRAINT; Schema: public; Owner: mbert30
--

ALTER TABLE ONLY public.utilisateur
    ADD CONSTRAINT utilisateur_pkey PRIMARY KEY (id);


--
-- TOC entry 3247 (class 2606 OID 82197)
-- Name: gamme gamme_id_operation_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mbert30
--

ALTER TABLE ONLY public.gamme
    ADD CONSTRAINT gamme_id_operation_fkey FOREIGN KEY (id_operation) REFERENCES public.operation(id);


--
-- TOC entry 3248 (class 2606 OID 82192)
-- Name: gamme gamme_id_piece_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mbert30
--

ALTER TABLE ONLY public.gamme
    ADD CONSTRAINT gamme_id_piece_fkey FOREIGN KEY (id_piece) REFERENCES public.piece(id);


--
-- TOC entry 3246 (class 2606 OID 82166)
-- Name: piece piece_id_fournisseur_fkey; Type: FK CONSTRAINT; Schema: public; Owner: mbert30
--

ALTER TABLE ONLY public.piece
    ADD CONSTRAINT piece_id_fournisseur_fkey FOREIGN KEY (id_fournisseur) REFERENCES public.fournisseur(id);


-- Completed on 2024-06-22 02:23:29

--
-- PostgreSQL database dump complete
--

