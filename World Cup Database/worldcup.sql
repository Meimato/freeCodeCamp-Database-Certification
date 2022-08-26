--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-0ubuntu0.20.04.1)

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

DROP DATABASE worldcup;
--
-- Name: worldcup; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE worldcup WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE worldcup OWNER TO freecodecamp;

\connect worldcup

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    year integer NOT NULL,
    round character varying(30) NOT NULL,
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL,
    winner_id integer NOT NULL,
    opponent_id integer NOT NULL,
    game_id integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: teams; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.teams (
    name character varying(30) NOT NULL,
    team_id integer NOT NULL
);


ALTER TABLE public.teams OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_team_id_seq OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (2018, 'Final', 4, 2, 968, 969, 161);
INSERT INTO public.games VALUES (2018, 'Third Place', 2, 0, 970, 971, 162);
INSERT INTO public.games VALUES (2018, 'Semi-Final', 2, 1, 969, 971, 163);
INSERT INTO public.games VALUES (2018, 'Semi-Final', 1, 0, 968, 970, 164);
INSERT INTO public.games VALUES (2018, 'Quarter-Final', 3, 2, 969, 977, 165);
INSERT INTO public.games VALUES (2018, 'Quarter-Final', 2, 0, 971, 979, 166);
INSERT INTO public.games VALUES (2018, 'Quarter-Final', 2, 1, 970, 981, 167);
INSERT INTO public.games VALUES (2018, 'Quarter-Final', 2, 0, 968, 983, 168);
INSERT INTO public.games VALUES (2018, 'Eighth-Final', 2, 1, 971, 985, 169);
INSERT INTO public.games VALUES (2018, 'Eighth-Final', 1, 0, 979, 987, 170);
INSERT INTO public.games VALUES (2018, 'Eighth-Final', 3, 2, 970, 989, 171);
INSERT INTO public.games VALUES (2018, 'Eighth-Final', 2, 0, 981, 991, 172);
INSERT INTO public.games VALUES (2018, 'Eighth-Final', 2, 1, 969, 993, 173);
INSERT INTO public.games VALUES (2018, 'Eighth-Final', 2, 1, 977, 995, 174);
INSERT INTO public.games VALUES (2018, 'Eighth-Final', 2, 1, 983, 997, 175);
INSERT INTO public.games VALUES (2018, 'Eighth-Final', 4, 3, 968, 999, 176);
INSERT INTO public.games VALUES (2014, 'Final', 1, 0, 1000, 999, 177);
INSERT INTO public.games VALUES (2014, 'Third Place', 3, 0, 1002, 981, 178);
INSERT INTO public.games VALUES (2014, 'Semi-Final', 1, 0, 999, 1002, 179);
INSERT INTO public.games VALUES (2014, 'Semi-Final', 7, 1, 1000, 981, 180);
INSERT INTO public.games VALUES (2014, 'Quarter-Final', 1, 0, 1002, 1009, 181);
INSERT INTO public.games VALUES (2014, 'Quarter-Final', 1, 0, 999, 970, 182);
INSERT INTO public.games VALUES (2014, 'Quarter-Final', 2, 1, 981, 985, 183);
INSERT INTO public.games VALUES (2014, 'Quarter-Final', 1, 0, 1000, 968, 184);
INSERT INTO public.games VALUES (2014, 'Eighth-Final', 2, 1, 981, 1017, 185);
INSERT INTO public.games VALUES (2014, 'Eighth-Final', 2, 0, 985, 983, 186);
INSERT INTO public.games VALUES (2014, 'Eighth-Final', 2, 0, 968, 1021, 187);
INSERT INTO public.games VALUES (2014, 'Eighth-Final', 2, 1, 1000, 1023, 188);
INSERT INTO public.games VALUES (2014, 'Eighth-Final', 2, 1, 1002, 991, 189);
INSERT INTO public.games VALUES (2014, 'Eighth-Final', 2, 1, 1009, 1027, 190);
INSERT INTO public.games VALUES (2014, 'Eighth-Final', 1, 0, 999, 987, 191);
INSERT INTO public.games VALUES (2014, 'Eighth-Final', 2, 1, 970, 1031, 192);


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.teams VALUES ('France', 968);
INSERT INTO public.teams VALUES ('Croatia', 969);
INSERT INTO public.teams VALUES ('Belgium', 970);
INSERT INTO public.teams VALUES ('England', 971);
INSERT INTO public.teams VALUES ('Russia', 977);
INSERT INTO public.teams VALUES ('Sweden', 979);
INSERT INTO public.teams VALUES ('Brazil', 981);
INSERT INTO public.teams VALUES ('Uruguay', 983);
INSERT INTO public.teams VALUES ('Colombia', 985);
INSERT INTO public.teams VALUES ('Switzerland', 987);
INSERT INTO public.teams VALUES ('Japan', 989);
INSERT INTO public.teams VALUES ('Mexico', 991);
INSERT INTO public.teams VALUES ('Denmark', 993);
INSERT INTO public.teams VALUES ('Spain', 995);
INSERT INTO public.teams VALUES ('Portugal', 997);
INSERT INTO public.teams VALUES ('Argentina', 999);
INSERT INTO public.teams VALUES ('Germany', 1000);
INSERT INTO public.teams VALUES ('Netherlands', 1002);
INSERT INTO public.teams VALUES ('Costa Rica', 1009);
INSERT INTO public.teams VALUES ('Chile', 1017);
INSERT INTO public.teams VALUES ('Nigeria', 1021);
INSERT INTO public.teams VALUES ('Algeria', 1023);
INSERT INTO public.teams VALUES ('Greece', 1027);
INSERT INTO public.teams VALUES ('United States', 1031);


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 192, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 1031, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: teams teams_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_name_key UNIQUE (name);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);


--
-- Name: games games_opponent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_opponent_id_fkey FOREIGN KEY (opponent_id) REFERENCES public.teams(team_id);


--
-- Name: games games_winner_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_winner_id_fkey FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);


--
-- PostgreSQL database dump complete
--

