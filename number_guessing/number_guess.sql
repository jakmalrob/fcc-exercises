--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
    game_id integer NOT NULL,
    user_id integer,
    secret_number integer NOT NULL,
    guesses integer NOT NULL
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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 29, 9, 10);
INSERT INTO public.games VALUES (2, 29, 829, 830);
INSERT INTO public.games VALUES (3, 30, 486, 487);
INSERT INTO public.games VALUES (4, 30, 874, 875);
INSERT INTO public.games VALUES (5, 29, 575, 578);
INSERT INTO public.games VALUES (6, 29, 552, 553);
INSERT INTO public.games VALUES (7, 29, 914, 915);
INSERT INTO public.games VALUES (8, 31, 985, 986);
INSERT INTO public.games VALUES (9, 31, 143, 144);
INSERT INTO public.games VALUES (10, 32, 836, 837);
INSERT INTO public.games VALUES (11, 32, 972, 973);
INSERT INTO public.games VALUES (12, 31, 305, 308);
INSERT INTO public.games VALUES (13, 31, 213, 214);
INSERT INTO public.games VALUES (14, 31, 827, 828);
INSERT INTO public.games VALUES (15, 33, 654, 10);
INSERT INTO public.games VALUES (16, 34, 117, 118);
INSERT INTO public.games VALUES (17, 34, 342, 343);
INSERT INTO public.games VALUES (18, 35, 697, 698);
INSERT INTO public.games VALUES (19, 35, 997, 998);
INSERT INTO public.games VALUES (20, 34, 652, 655);
INSERT INTO public.games VALUES (21, 34, 932, 933);
INSERT INTO public.games VALUES (22, 34, 740, 741);
INSERT INTO public.games VALUES (23, 36, 1000, 1001);
INSERT INTO public.games VALUES (24, 36, 711, 712);
INSERT INTO public.games VALUES (25, 37, 809, 810);
INSERT INTO public.games VALUES (26, 37, 578, 579);
INSERT INTO public.games VALUES (27, 36, 681, 684);
INSERT INTO public.games VALUES (28, 36, 787, 788);
INSERT INTO public.games VALUES (29, 36, 66, 67);
INSERT INTO public.games VALUES (30, 38, 67, 68);
INSERT INTO public.games VALUES (31, 38, 479, 480);
INSERT INTO public.games VALUES (32, 39, 852, 853);
INSERT INTO public.games VALUES (33, 39, 932, 933);
INSERT INTO public.games VALUES (34, 38, 596, 599);
INSERT INTO public.games VALUES (35, 38, 424, 425);
INSERT INTO public.games VALUES (36, 38, 645, 646);
INSERT INTO public.games VALUES (37, 33, 715, 9);
INSERT INTO public.games VALUES (38, 40, 572, 573);
INSERT INTO public.games VALUES (39, 40, 320, 321);
INSERT INTO public.games VALUES (40, 41, 37, 38);
INSERT INTO public.games VALUES (41, 41, 325, 326);
INSERT INTO public.games VALUES (42, 40, 421, 424);
INSERT INTO public.games VALUES (43, 40, 593, 594);
INSERT INTO public.games VALUES (44, 40, 153, 154);
INSERT INTO public.games VALUES (45, 42, 666, 667);
INSERT INTO public.games VALUES (46, 42, 855, 856);
INSERT INTO public.games VALUES (47, 43, 332, 333);
INSERT INTO public.games VALUES (48, 43, 680, 681);
INSERT INTO public.games VALUES (49, 42, 200, 203);
INSERT INTO public.games VALUES (50, 42, 366, 367);
INSERT INTO public.games VALUES (51, 42, 240, 241);
INSERT INTO public.games VALUES (52, 44, 265, 266);
INSERT INTO public.games VALUES (53, 44, 755, 756);
INSERT INTO public.games VALUES (54, 45, 740, 741);
INSERT INTO public.games VALUES (55, 45, 317, 318);
INSERT INTO public.games VALUES (56, 44, 646, 649);
INSERT INTO public.games VALUES (57, 44, 919, 920);
INSERT INTO public.games VALUES (58, 44, 550, 551);
INSERT INTO public.games VALUES (59, 46, 348, 349);
INSERT INTO public.games VALUES (60, 46, 445, 446);
INSERT INTO public.games VALUES (61, 47, 380, 381);
INSERT INTO public.games VALUES (62, 47, 881, 882);
INSERT INTO public.games VALUES (63, 46, 116, 119);
INSERT INTO public.games VALUES (64, 46, 80, 81);
INSERT INTO public.games VALUES (65, 46, 780, 781);
INSERT INTO public.games VALUES (66, 48, 716, 717);
INSERT INTO public.games VALUES (67, 48, 245, 246);
INSERT INTO public.games VALUES (68, 49, 90, 91);
INSERT INTO public.games VALUES (69, 49, 718, 719);
INSERT INTO public.games VALUES (70, 48, 978, 981);
INSERT INTO public.games VALUES (71, 48, 633, 634);
INSERT INTO public.games VALUES (72, 48, 742, 743);
INSERT INTO public.games VALUES (73, 50, 270, 271);
INSERT INTO public.games VALUES (74, 50, 434, 435);
INSERT INTO public.games VALUES (75, 51, 55, 56);
INSERT INTO public.games VALUES (76, 51, 268, 269);
INSERT INTO public.games VALUES (77, 50, 950, 953);
INSERT INTO public.games VALUES (78, 50, 501, 502);
INSERT INTO public.games VALUES (79, 50, 177, 178);
INSERT INTO public.games VALUES (80, 52, 300, 301);
INSERT INTO public.games VALUES (81, 52, 156, 157);
INSERT INTO public.games VALUES (82, 53, 973, 974);
INSERT INTO public.games VALUES (83, 53, 330, 331);
INSERT INTO public.games VALUES (84, 52, 313, 316);
INSERT INTO public.games VALUES (85, 52, 791, 792);
INSERT INTO public.games VALUES (86, 52, 903, 904);
INSERT INTO public.games VALUES (87, 54, 688, 689);
INSERT INTO public.games VALUES (88, 54, 203, 204);
INSERT INTO public.games VALUES (89, 55, 263, 264);
INSERT INTO public.games VALUES (90, 55, 690, 691);
INSERT INTO public.games VALUES (91, 54, 133, 136);
INSERT INTO public.games VALUES (92, 54, 843, 844);
INSERT INTO public.games VALUES (93, 54, 124, 125);
INSERT INTO public.games VALUES (94, 56, 838, 839);
INSERT INTO public.games VALUES (95, 56, 869, 870);
INSERT INTO public.games VALUES (96, 57, 875, 876);
INSERT INTO public.games VALUES (97, 57, 621, 622);
INSERT INTO public.games VALUES (98, 56, 43, 46);
INSERT INTO public.games VALUES (99, 56, 576, 577);
INSERT INTO public.games VALUES (100, 56, 886, 887);
INSERT INTO public.games VALUES (101, 58, 546, 547);
INSERT INTO public.games VALUES (102, 58, 852, 853);
INSERT INTO public.games VALUES (103, 59, 796, 797);
INSERT INTO public.games VALUES (104, 59, 557, 558);
INSERT INTO public.games VALUES (105, 58, 481, 484);
INSERT INTO public.games VALUES (106, 58, 132, 133);
INSERT INTO public.games VALUES (107, 58, 790, 791);
INSERT INTO public.games VALUES (108, 60, 809, 810);
INSERT INTO public.games VALUES (109, 60, 122, 123);
INSERT INTO public.games VALUES (110, 61, 587, 588);
INSERT INTO public.games VALUES (111, 61, 671, 672);
INSERT INTO public.games VALUES (112, 60, 372, 375);
INSERT INTO public.games VALUES (113, 60, 831, 832);
INSERT INTO public.games VALUES (114, 60, 214, 215);
INSERT INTO public.games VALUES (115, 62, 144, 145);
INSERT INTO public.games VALUES (116, 62, 482, 483);
INSERT INTO public.games VALUES (117, 63, 503, 504);
INSERT INTO public.games VALUES (118, 63, 901, 902);
INSERT INTO public.games VALUES (119, 62, 79, 82);
INSERT INTO public.games VALUES (120, 62, 793, 794);
INSERT INTO public.games VALUES (121, 62, 496, 497);
INSERT INTO public.games VALUES (122, 64, 864, 865);
INSERT INTO public.games VALUES (123, 64, 60, 61);
INSERT INTO public.games VALUES (124, 65, 315, 316);
INSERT INTO public.games VALUES (125, 65, 121, 122);
INSERT INTO public.games VALUES (126, 64, 220, 223);
INSERT INTO public.games VALUES (127, 64, 423, 424);
INSERT INTO public.games VALUES (128, 64, 812, 813);
INSERT INTO public.games VALUES (129, 66, 139, 140);
INSERT INTO public.games VALUES (130, 66, 396, 397);
INSERT INTO public.games VALUES (131, 67, 422, 423);
INSERT INTO public.games VALUES (132, 67, 959, 960);
INSERT INTO public.games VALUES (133, 66, 199, 202);
INSERT INTO public.games VALUES (134, 66, 806, 807);
INSERT INTO public.games VALUES (135, 66, 597, 598);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, '');
INSERT INTO public.users VALUES (29, 'user_1741821715811');
INSERT INTO public.users VALUES (30, 'user_1741821715810');
INSERT INTO public.users VALUES (31, 'user_1741821785072');
INSERT INTO public.users VALUES (32, 'user_1741821785071');
INSERT INTO public.users VALUES (33, 'test_user');
INSERT INTO public.users VALUES (34, 'user_1741822094021');
INSERT INTO public.users VALUES (35, 'user_1741822094020');
INSERT INTO public.users VALUES (36, 'user_1741822273066');
INSERT INTO public.users VALUES (37, 'user_1741822273065');
INSERT INTO public.users VALUES (38, 'user_1741822285192');
INSERT INTO public.users VALUES (39, 'user_1741822285191');
INSERT INTO public.users VALUES (40, 'user_1741822667841');
INSERT INTO public.users VALUES (41, 'user_1741822667840');
INSERT INTO public.users VALUES (42, 'user_1741822819105');
INSERT INTO public.users VALUES (43, 'user_1741822819104');
INSERT INTO public.users VALUES (44, 'user_1741822872761');
INSERT INTO public.users VALUES (45, 'user_1741822872760');
INSERT INTO public.users VALUES (46, 'user_1741823000037');
INSERT INTO public.users VALUES (47, 'user_1741823000036');
INSERT INTO public.users VALUES (48, 'user_1741823100525');
INSERT INTO public.users VALUES (49, 'user_1741823100524');
INSERT INTO public.users VALUES (50, 'user_1741823242082');
INSERT INTO public.users VALUES (51, 'user_1741823242081');
INSERT INTO public.users VALUES (52, 'user_1741823367453');
INSERT INTO public.users VALUES (53, 'user_1741823367452');
INSERT INTO public.users VALUES (54, 'user_1741823498897');
INSERT INTO public.users VALUES (55, 'user_1741823498896');
INSERT INTO public.users VALUES (56, 'user_1741823556222');
INSERT INTO public.users VALUES (57, 'user_1741823556221');
INSERT INTO public.users VALUES (58, 'user_1741823605916');
INSERT INTO public.users VALUES (59, 'user_1741823605915');
INSERT INTO public.users VALUES (60, 'user_1741823703443');
INSERT INTO public.users VALUES (61, 'user_1741823703442');
INSERT INTO public.users VALUES (62, 'user_1741823717807');
INSERT INTO public.users VALUES (63, 'user_1741823717806');
INSERT INTO public.users VALUES (64, 'user_1741823802003');
INSERT INTO public.users VALUES (65, 'user_1741823802002');
INSERT INTO public.users VALUES (66, 'user_1741823905846');
INSERT INTO public.users VALUES (67, 'user_1741823905845');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 135, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 67, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

