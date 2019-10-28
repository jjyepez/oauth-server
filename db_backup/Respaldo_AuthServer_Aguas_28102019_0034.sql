--
-- PostgreSQL database dump
--

-- Dumped from database version 10.10 (Ubuntu 10.10-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.10 (Ubuntu 10.10-0ubuntu0.18.04.1)

-- Started on 2019-10-28 00:35:01 -05

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
-- TOC entry 2895 (class 1262 OID 16384)
-- Name: oauthsrv_db; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE oauthsrv_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE oauthsrv_db OWNER TO postgres;

\connect oauthsrv_db

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
-- TOC entry 1 (class 3079 OID 13004)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2897 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 199 (class 1259 OID 16425)
-- Name: access_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.access_tokens (
    id integer NOT NULL,
    user_id integer NOT NULL,
    access_token text
);


ALTER TABLE public.access_tokens OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 16423)
-- Name: access_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.access_tokens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.access_tokens_id_seq OWNER TO postgres;

--
-- TOC entry 2898 (class 0 OID 0)
-- Dependencies: 198
-- Name: access_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.access_tokens_id_seq OWNED BY public.access_tokens.id;


--
-- TOC entry 197 (class 1259 OID 16414)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username text NOT NULL,
    user_password text NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 16412)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 2899 (class 0 OID 0)
-- Dependencies: 196
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 2759 (class 2604 OID 16428)
-- Name: access_tokens id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.access_tokens ALTER COLUMN id SET DEFAULT nextval('public.access_tokens_id_seq'::regclass);


--
-- TOC entry 2758 (class 2604 OID 16417)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 2889 (class 0 OID 16425)
-- Dependencies: 199
-- Data for Name: access_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.access_tokens (id, user_id, access_token) VALUES (3, 32, '90c1542014b9f2aec491b0ec1e66dc49651c04be');
INSERT INTO public.access_tokens (id, user_id, access_token) VALUES (4, 32, '6fed6aa2550ea75a719bd95dfe6b79dd8157e532');
INSERT INTO public.access_tokens (id, user_id, access_token) VALUES (5, 32, '2c6ab91cbfe92b3d66749855790474d86d9af651');
INSERT INTO public.access_tokens (id, user_id, access_token) VALUES (6, 32, '1179a42a6eb98de24a87002161ec43e2c6d4712c');
INSERT INTO public.access_tokens (id, user_id, access_token) VALUES (7, 32, 'f1b81485eae829aba63665bffbe350401641a9bf');
INSERT INTO public.access_tokens (id, user_id, access_token) VALUES (8, 32, 'e4ebd281f3f77db6f107e485a94169b6aeb222af');
INSERT INTO public.access_tokens (id, user_id, access_token) VALUES (9, 32, '269c10beb3547f42cf4b0d11f6ed59c29fbd9232');
INSERT INTO public.access_tokens (id, user_id, access_token) VALUES (10, 32, '3afbbba8d7fc3cdd88717a35b672759c92726999');
INSERT INTO public.access_tokens (id, user_id, access_token) VALUES (11, 32, '4d3e132a8275d5d06d4c665c48177eedf1fd8ecd');
INSERT INTO public.access_tokens (id, user_id, access_token) VALUES (12, 32, '926731c3160b3d7993e13bd952ebf54fba259e8a');
INSERT INTO public.access_tokens (id, user_id, access_token) VALUES (13, 32, '9affe93d19b24556caa1bf93ce7d987558385eb0');
INSERT INTO public.access_tokens (id, user_id, access_token) VALUES (14, 32, 'ef41ce146c3542e116d9d47c1c30611739528aa9');
INSERT INTO public.access_tokens (id, user_id, access_token) VALUES (15, 33, 'ad74ea44fe0beb3bd1987b4dcd33053f3cc7f714');
INSERT INTO public.access_tokens (id, user_id, access_token) VALUES (16, 33, '181d17e085f5b893fb906e1ddb1bec4f251f4822');
INSERT INTO public.access_tokens (id, user_id, access_token) VALUES (17, 33, '4e3019532b9ce1f95bae5fb24a3d67391dac0a73');
INSERT INTO public.access_tokens (id, user_id, access_token) VALUES (18, 34, 'fc5dfb9cdd78c92a113620f2be8a55ba9cd4bb93');
INSERT INTO public.access_tokens (id, user_id, access_token) VALUES (19, 34, 'f9871c3a7c97dd9ab04343f4add99a057d59aa74');
INSERT INTO public.access_tokens (id, user_id, access_token) VALUES (20, 34, '3ad301cd14165e43d20178400e52d8a30a1512a9');
INSERT INTO public.access_tokens (id, user_id, access_token) VALUES (21, 34, 'aa8a2f2fc3c7b79e10e2f2964061db2f719a65cc');
INSERT INTO public.access_tokens (id, user_id, access_token) VALUES (22, 34, 'ffb422f4327cf6ffba3938744928798429a908a7');
INSERT INTO public.access_tokens (id, user_id, access_token) VALUES (23, 34, 'a51898bd89f745854850233324b53630545abf19');
INSERT INTO public.access_tokens (id, user_id, access_token) VALUES (24, 32, '1a2443825f42ca66cacec5f9676bd5acb2a578c1');
INSERT INTO public.access_tokens (id, user_id, access_token) VALUES (25, 34, 'a41f1fd8dd907e4220b3c7e2ddd65d94c1cd7494');
INSERT INTO public.access_tokens (id, user_id, access_token) VALUES (26, 34, '10365d8c76d0e3c8f1a1429cb8389113991cc26d');
INSERT INTO public.access_tokens (id, user_id, access_token) VALUES (27, 34, 'ea62ecdfa7539218ebb1aecc728aac5218140d36');
INSERT INTO public.access_tokens (id, user_id, access_token) VALUES (28, 34, 'e67a41576d7098c7ecd2a64150230abe700ead78');
INSERT INTO public.access_tokens (id, user_id, access_token) VALUES (29, 34, 'f5af0cc7f6ed82049bc5afd3ab2c4a84e516c1bf');
INSERT INTO public.access_tokens (id, user_id, access_token) VALUES (30, 34, 'cf7a3d5f9f3bfbb9272cd511cc612870aabeaa70');
INSERT INTO public.access_tokens (id, user_id, access_token) VALUES (31, 32, 'c01fca15b947c70186f2944fe98346ff8934a6f6');
INSERT INTO public.access_tokens (id, user_id, access_token) VALUES (32, 32, '23d10dbda75d09374c6f8c28ae7460328f903b8b');
INSERT INTO public.access_tokens (id, user_id, access_token) VALUES (33, 32, '265eaf2b6d31139e2a416607ace9580463fe8bbc');
INSERT INTO public.access_tokens (id, user_id, access_token) VALUES (34, 32, 'bb79a8b3136c6cb25119aa08bd3315e34880a2b3');
INSERT INTO public.access_tokens (id, user_id, access_token) VALUES (35, 32, '23ad8a402d621532b35a0d003145068f36998a3e');
INSERT INTO public.access_tokens (id, user_id, access_token) VALUES (36, 32, '28c13ad08dc974b53851ab9a06dd88799fd46dc1');
INSERT INTO public.access_tokens (id, user_id, access_token) VALUES (37, 32, '804792c9582793234d95067c14ffbdef5ae60972');
INSERT INTO public.access_tokens (id, user_id, access_token) VALUES (38, 32, '3b80e559f3e4cadebda40f31e7b45a9feb2e594c');
INSERT INTO public.access_tokens (id, user_id, access_token) VALUES (39, 32, 'd04f451c16c8fd02d143f0b1c6325603eefde0ca');
INSERT INTO public.access_tokens (id, user_id, access_token) VALUES (40, 32, '41c33d55365be0aa6b71dcb08b1138b2d215f25e');
INSERT INTO public.access_tokens (id, user_id, access_token) VALUES (41, 32, '6e85ba803e5a457d253039eadf38c4118778d1af');
INSERT INTO public.access_tokens (id, user_id, access_token) VALUES (42, 32, '5bf14e49a6324ab3a69e668b6ee7df35ebad664f');
INSERT INTO public.access_tokens (id, user_id, access_token) VALUES (43, 32, '371664390239094c183b6e703605ec38beb70e07');
INSERT INTO public.access_tokens (id, user_id, access_token) VALUES (44, 32, '3b336fb99b4de95b7eff4a8fbd8d5d626b63fa0b');
INSERT INTO public.access_tokens (id, user_id, access_token) VALUES (45, 32, '9b1709ca1bec090a40f5aa6b1a5b269f1db6295e');
INSERT INTO public.access_tokens (id, user_id, access_token) VALUES (46, 32, '27e073cf7f99eedbd6fe38ee932e8550d03beba9');
INSERT INTO public.access_tokens (id, user_id, access_token) VALUES (47, 32, '154b3dd4f66a680de68e8a963ab0d616548e95e7');
INSERT INTO public.access_tokens (id, user_id, access_token) VALUES (48, 32, '6ea853ffcb350edd44ba4b96657c3b3712f6e650');
INSERT INTO public.access_tokens (id, user_id, access_token) VALUES (49, 36, 'd66daf0188edf635b4ba7040fa14b8d67c21e3f1');
INSERT INTO public.access_tokens (id, user_id, access_token) VALUES (50, 34, '63d94c37aae09cd54fa485ea6c3fbd42380e09f8');
INSERT INTO public.access_tokens (id, user_id, access_token) VALUES (51, 32, '8ca37fdf04b997dc03436f7f8cac3faa1759deb9');
INSERT INTO public.access_tokens (id, user_id, access_token) VALUES (52, 32, '216540facb7588b511f20170e0b5ef5f44b8e4ff');
INSERT INTO public.access_tokens (id, user_id, access_token) VALUES (53, 34, '94765005ffc0831468727b6aeb89933e592a0ed7');
INSERT INTO public.access_tokens (id, user_id, access_token) VALUES (54, 32, 'ae95ef9e8699819cf09635775db92e276b67e6d8');
INSERT INTO public.access_tokens (id, user_id, access_token) VALUES (55, 32, 'b9332180bfa0bdf9e3a2d3a0bf62edec5d336771');
INSERT INTO public.access_tokens (id, user_id, access_token) VALUES (56, 32, 'b9083182c9848eb025068f192e422f57a056b19b');
INSERT INTO public.access_tokens (id, user_id, access_token) VALUES (57, 32, 'fa261fb5044d83984290d6c5c0f719c5c90f5484');
INSERT INTO public.access_tokens (id, user_id, access_token) VALUES (58, 32, 'ab93e3ba1bb0745fdadca92a5933a0bf00a27607');
INSERT INTO public.access_tokens (id, user_id, access_token) VALUES (59, 32, '894db946d74169235d669488967656ba78ded291');
INSERT INTO public.access_tokens (id, user_id, access_token) VALUES (60, 32, 'f8fd882f71416350026e9e25f4f5180ef2574ce6');
INSERT INTO public.access_tokens (id, user_id, access_token) VALUES (61, 35, 'a2ccda280a2fa7eebae8249cd5ad8ea0f3f9e487');
INSERT INTO public.access_tokens (id, user_id, access_token) VALUES (62, 32, 'ca13ae29397c30d67b539922cabdde78f439ec26');
INSERT INTO public.access_tokens (id, user_id, access_token) VALUES (63, 32, 'b5d56599c3291693281c82182472349bc5afb8e2');
INSERT INTO public.access_tokens (id, user_id, access_token) VALUES (64, 35, '6e3352ee94c7093bd105805da34446bfaa218ab9');
INSERT INTO public.access_tokens (id, user_id, access_token) VALUES (65, 32, 'fe03f70bf829e184bf24109e49703cc471c27a4e');
INSERT INTO public.access_tokens (id, user_id, access_token) VALUES (66, 32, '2095d965de679c6d060675f13b50dff18a2e6045');


--
-- TOC entry 2887 (class 0 OID 16414)
-- Dependencies: 197
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.users (id, username, user_password) VALUES (32, 'admin', '670b14728ad9902aecba32e22fa4f6bd');
INSERT INTO public.users (id, username, user_password) VALUES (33, 'user', '670b14728ad9902aecba32e22fa4f6bd');
INSERT INTO public.users (id, username, user_password) VALUES (34, 'julio', 'e10adc3949ba59abbe56e057f20f883e');
INSERT INTO public.users (id, username, user_password) VALUES (35, 'adminX', '670b14728ad9902aecba32e22fa4f6bd');
INSERT INTO public.users (id, username, user_password) VALUES (36, 'adminNew', 'b59c67bf196a4758191e42f76670ceba');


--
-- TOC entry 2900 (class 0 OID 0)
-- Dependencies: 198
-- Name: access_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.access_tokens_id_seq', 66, true);


--
-- TOC entry 2901 (class 0 OID 0)
-- Dependencies: 196
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 36, true);


--
-- TOC entry 2763 (class 2606 OID 16433)
-- Name: access_tokens access_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.access_tokens
    ADD CONSTRAINT access_tokens_pkey PRIMARY KEY (id);


--
-- TOC entry 2761 (class 2606 OID 16422)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 2764 (class 2606 OID 16434)
-- Name: access_tokens access_tokens_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.access_tokens
    ADD CONSTRAINT access_tokens_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id);


-- Completed on 2019-10-28 00:35:11 -05

--
-- PostgreSQL database dump complete
--

