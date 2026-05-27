--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50),
    description text NOT NULL,
    has_life boolean,
    age_in_millions_of_years integer NOT NULL,
    distance_from numeric(22,4) NOT NULL,
    planet_types character varying(20)
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50),
    description text NOT NULL,
    has_life boolean,
    age_in_millions_of_years integer NOT NULL,
    distance_from numeric(22,4) NOT NULL,
    planet_id integer,
    planet_types character varying(20)
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(50),
    description text NOT NULL,
    has_life boolean,
    age_in_millions_of_years integer NOT NULL,
    distance_from numeric(22,4) NOT NULL,
    star_id integer,
    planet_types character varying(20)
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50),
    description text NOT NULL,
    has_life boolean,
    age_in_millions_of_years integer NOT NULL,
    distance_from numeric(22,4) NOT NULL,
    galaxy_id integer,
    planet_types character varying(20)
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: sun; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.sun (
    planet_types character varying(20),
    distance_from numeric(22,4) NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    name character varying(50) NOT NULL,
    sun_id integer NOT NULL
);


ALTER TABLE public.sun OWNER TO freecodecamp;

--
-- Name: sun_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.sun_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sun_id_seq OWNER TO freecodecamp;

--
-- Name: sun_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.sun_id_seq OWNED BY public.sun.sun_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: sun sun_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.sun ALTER COLUMN sun_id SET DEFAULT nextval('public.sun_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milk', 'None', false, 25, 25.5000, 'Normal');
INSERT INTO public.galaxy VALUES (3, 'Silk', 'None', false, 25, 25.5000, 'Anormal');
INSERT INTO public.galaxy VALUES (4, 'Kit', 'None', false, 25, 25.5000, 'Abnormal');
INSERT INTO public.galaxy VALUES (5, 'Pit', 'None', false, 25, 25.5000, 'Super');
INSERT INTO public.galaxy VALUES (6, 'Sit', 'None', false, 25, 25.5000, 'Uber');
INSERT INTO public.galaxy VALUES (7, 'Sit', 'None', false, 25, 25.5000, 'Ubxer');
INSERT INTO public.galaxy VALUES (8, 'Sit', 'None', false, 25, 25.5000, 'Ubxesr');
INSERT INTO public.galaxy VALUES (9, 'Sit', 'None', false, 25, 25.5000, 'Ubxeresr');
INSERT INTO public.galaxy VALUES (10, 'Sit', 'None', false, 25, 25.5000, 'Ubxereshr');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'N', 'None', false, 25, 25.5000, 1, 'N');
INSERT INTO public.moon VALUES (2, 'N', 'None', false, 25, 25.5000, 1, 'I');
INSERT INTO public.moon VALUES (3, 'N', 'None', false, 25, 25.5000, 1, 'L');
INSERT INTO public.moon VALUES (4, 'N', 'None', false, 25, 25.5000, 2, 'A');
INSERT INTO public.moon VALUES (5, 'N', 'None', false, 25, 25.5000, 2, 'F');
INSERT INTO public.moon VALUES (6, 'N', 'None', false, 25, 25.5000, 2, 'E');
INSERT INTO public.moon VALUES (7, 'N', 'None', false, 25, 25.5000, 2, 'R');
INSERT INTO public.moon VALUES (8, 'N', 'None', false, 25, 25.5000, 2, 'M');
INSERT INTO public.moon VALUES (9, 'N', 'None', false, 25, 25.5000, 2, 'U');
INSERT INTO public.moon VALUES (10, 'N', 'None', false, 25, 25.5000, 2, 'H');
INSERT INTO public.moon VALUES (11, 'N', 'None', false, 25, 25.5000, 2, 'D');
INSERT INTO public.moon VALUES (12, 'N', 'None', false, 25, 25.5000, 3, 'O');
INSERT INTO public.moon VALUES (13, 'N', 'None', false, 25, 25.5000, 3, 'V');
INSERT INTO public.moon VALUES (14, 'N', 'None', false, 25, 25.5000, 3, 'K');
INSERT INTO public.moon VALUES (15, 'N', 'None', false, 25, 25.5000, 3, 'C');
INSERT INTO public.moon VALUES (18, 'N', 'None', false, 25, 25.5000, 3, 'X');
INSERT INTO public.moon VALUES (19, 'N', 'None', false, 25, 25.5000, 3, 'Z');
INSERT INTO public.moon VALUES (20, 'N', 'None', false, 25, 25.5000, 3, 'B');
INSERT INTO public.moon VALUES (22, 'N', 'None', false, 25, 25.5000, 3, 'G');
INSERT INTO public.moon VALUES (23, 'N', 'None', false, 25, 25.5000, 3, 'T');
INSERT INTO public.moon VALUES (24, 'N', 'None', false, 25, 25.5000, 3, 'P');
INSERT INTO public.moon VALUES (25, 'N', 'None', false, 25, 25.5000, 3, 'S');
INSERT INTO public.moon VALUES (29, 'N', 'None', false, 25, 25.5000, 3, '1');
INSERT INTO public.moon VALUES (30, 'N', 'None', false, 25, 25.5000, 3, '2');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'N', 'None', false, 25, 25.5000, 1, 'N');
INSERT INTO public.planet VALUES (2, 'N', 'None', false, 25, 25.5000, 1, 'I');
INSERT INTO public.planet VALUES (3, 'N', 'None', false, 25, 25.5000, 1, 'L');
INSERT INTO public.planet VALUES (5, 'N', 'None', false, 25, 25.5000, 3, 'F');
INSERT INTO public.planet VALUES (6, 'N', 'None', false, 25, 25.5000, 4, 'A');
INSERT INTO public.planet VALUES (7, 'N', 'None', false, 25, 25.5000, 5, 'R');
INSERT INTO public.planet VALUES (8, 'N', 'None', false, 25, 25.5000, 3, '2');
INSERT INTO public.planet VALUES (9, 'N', 'None', false, 25, 25.5000, 3, '1');
INSERT INTO public.planet VALUES (10, 'N', 'None', false, 25, 25.5000, 3, '3');
INSERT INTO public.planet VALUES (11, 'N', 'None', false, 25, 25.5000, 3, '4');
INSERT INTO public.planet VALUES (12, 'N', 'None', false, 25, 25.5000, 3, '5');
INSERT INTO public.planet VALUES (13, 'N', 'None', false, 25, 25.5000, 3, '6');
INSERT INTO public.planet VALUES (14, 'N', 'None', false, 25, 25.5000, 3, '7');
INSERT INTO public.planet VALUES (15, 'N', 'None', false, 25, 25.5000, 3, '8');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'N', 'None', false, 25, 25.5000, 1, 'Uber');
INSERT INTO public.star VALUES (3, 'I', 'None', false, 25, 25.5000, 1, 'N');
INSERT INTO public.star VALUES (4, 'L', 'None', false, 25, 25.5000, 1, 'L');
INSERT INTO public.star VALUES (5, 'U', 'None', false, 25, 25.5000, 1, 'U');
INSERT INTO public.star VALUES (6, 'F', 'None', false, 25, 25.5000, 1, 'F');
INSERT INTO public.star VALUES (7, 'L', 'None', false, 25, 25.5000, 1, '1');
INSERT INTO public.star VALUES (8, 'L', 'None', false, 25, 25.5000, 1, '2');
INSERT INTO public.star VALUES (9, 'L', 'None', false, 25, 25.5000, 1, '3');
INSERT INTO public.star VALUES (10, 'L', 'None', false, 25, 25.5000, 1, '4');


--
-- Data for Name: sun; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.sun VALUES ('A', 22.5000, 26, 'Nil', 1);
INSERT INTO public.sun VALUES ('B', 22.5000, 26, 'Nil', 3);
INSERT INTO public.sun VALUES ('C', 22.5000, 26, 'Nil', 4);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 10, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 30, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 15, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 10, true);


--
-- Name: sun_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.sun_id_seq', 4, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy galaxy_planet_types_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_planet_types_key UNIQUE (planet_types);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: moon moon_planet_types_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_types_key UNIQUE (planet_types);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_types_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_types_key UNIQUE (planet_types);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_planet_types_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_planet_types_key UNIQUE (planet_types);


--
-- Name: sun sun_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.sun
    ADD CONSTRAINT sun_pkey PRIMARY KEY (sun_id);


--
-- Name: sun sun_planet_types_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.sun
    ADD CONSTRAINT sun_planet_types_key UNIQUE (planet_types);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

