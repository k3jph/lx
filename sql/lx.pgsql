--
-- PostgreSQL database dump
--

SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

--
-- Name: beta; Type: SCHEMA; Schema: -; Owner: lx
--

CREATE SCHEMA beta;


ALTER SCHEMA beta OWNER TO lx;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pgsql
--

COMMENT ON SCHEMA public IS 'Standard public schema';


SET search_path = beta, pg_catalog;

--
-- Name: links_id_seq; Type: SEQUENCE; Schema: beta; Owner: lx
--

CREATE SEQUENCE links_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    MINVALUE 262145
    CACHE 1;


ALTER TABLE beta.links_id_seq OWNER TO lx;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: links; Type: TABLE; Schema: beta; Owner: lx; Tablespace: 
--

CREATE TABLE links (
    title character varying(1024),
    user_id bigint NOT NULL,
    "timestamp" timestamp with time zone DEFAULT now(),
    id bigint DEFAULT nextval('links_id_seq'::regclass) NOT NULL,
    url character varying(4096) NOT NULL
);


ALTER TABLE beta.links OWNER TO lx;

--
-- Name: logs; Type: TABLE; Schema: beta; Owner: lx; Tablespace: 
--

CREATE TABLE logs (
    id bigint NOT NULL,
    link_id bigint DEFAULT 0 NOT NULL,
    "timestamp" timestamp with time zone DEFAULT now(),
    referrer character varying(4096),
    address inet DEFAULT '0.0.0.0'::inet NOT NULL
);


ALTER TABLE beta.logs OWNER TO lx;

--
-- Name: logs_id_seq; Type: SEQUENCE; Schema: beta; Owner: lx
--

CREATE SEQUENCE logs_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE beta.logs_id_seq OWNER TO lx;

--
-- Name: logs_id_seq; Type: SEQUENCE OWNED BY; Schema: beta; Owner: lx
--

ALTER SEQUENCE logs_id_seq OWNED BY logs.id;


--
-- Name: stars; Type: TABLE; Schema: beta; Owner: lx; Tablespace: 
--

CREATE TABLE stars (
    id bigint NOT NULL,
    link_id bigint NOT NULL,
    user_id bigint NOT NULL,
    starred boolean DEFAULT false NOT NULL
);


ALTER TABLE beta.stars OWNER TO lx;

--
-- Name: stars_id_seq; Type: SEQUENCE; Schema: beta; Owner: lx
--

CREATE SEQUENCE stars_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE beta.stars_id_seq OWNER TO lx;

--
-- Name: stars_id_seq; Type: SEQUENCE OWNED BY; Schema: beta; Owner: lx
--

ALTER SEQUENCE stars_id_seq OWNED BY stars.id;


--
-- Name: users; Type: TABLE; Schema: beta; Owner: lx; Tablespace: 
--

CREATE TABLE users (
    username character varying(255) NOT NULL,
    "password" character varying(40) NOT NULL,
    confirmed character varying(1) DEFAULT '0'::character varying NOT NULL,
    confirm_code character varying(40) NOT NULL,
    id bigint NOT NULL
);


ALTER TABLE beta.users OWNER TO lx;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: beta; Owner: lx
--

CREATE SEQUENCE users_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE beta.users_id_seq OWNER TO lx;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: beta; Owner: lx
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: beta; Owner: lx
--

ALTER TABLE logs ALTER COLUMN id SET DEFAULT nextval('logs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: beta; Owner: lx
--

ALTER TABLE stars ALTER COLUMN id SET DEFAULT nextval('stars_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: beta; Owner: lx
--

ALTER TABLE users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Name: links_id_pkey; Type: CONSTRAINT; Schema: beta; Owner: lx; Tablespace: 
--

ALTER TABLE ONLY links
    ADD CONSTRAINT links_id_pkey PRIMARY KEY (id);


--
-- Name: logs_id_pkey; Type: CONSTRAINT; Schema: beta; Owner: lx; Tablespace: 
--

ALTER TABLE ONLY logs
    ADD CONSTRAINT logs_id_pkey PRIMARY KEY (id);


--
-- Name: stars_id_pkey; Type: CONSTRAINT; Schema: beta; Owner: lx; Tablespace: 
--

ALTER TABLE ONLY stars
    ADD CONSTRAINT stars_id_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: beta; Owner: lx; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: fki_links_user_id; Type: INDEX; Schema: beta; Owner: lx; Tablespace: 
--

CREATE INDEX fki_links_user_id ON links USING btree (user_id);


--
-- Name: fki_logs_link_id; Type: INDEX; Schema: beta; Owner: lx; Tablespace: 
--

CREATE INDEX fki_logs_link_id ON logs USING btree (link_id);


--
-- Name: fki_stars_link_id; Type: INDEX; Schema: beta; Owner: lx; Tablespace: 
--

CREATE INDEX fki_stars_link_id ON stars USING btree (link_id);


--
-- Name: fki_stars_user_id; Type: INDEX; Schema: beta; Owner: lx; Tablespace: 
--

CREATE INDEX fki_stars_user_id ON stars USING btree (user_id);


--
-- Name: users_password_hash; Type: INDEX; Schema: beta; Owner: lx; Tablespace: 
--

CREATE INDEX users_password_hash ON users USING hash ("password");


--
-- Name: users_username_hash; Type: INDEX; Schema: beta; Owner: lx; Tablespace: 
--

CREATE INDEX users_username_hash ON users USING hash (username);


--
-- Name: links_user_id; Type: FK CONSTRAINT; Schema: beta; Owner: lx
--

ALTER TABLE ONLY links
    ADD CONSTRAINT links_user_id FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: logs_link_id; Type: FK CONSTRAINT; Schema: beta; Owner: lx
--

ALTER TABLE ONLY logs
    ADD CONSTRAINT logs_link_id FOREIGN KEY (link_id) REFERENCES links(id);


--
-- Name: stars_link_id; Type: FK CONSTRAINT; Schema: beta; Owner: lx
--

ALTER TABLE ONLY stars
    ADD CONSTRAINT stars_link_id FOREIGN KEY (link_id) REFERENCES links(id);


--
-- Name: stars_user_id; Type: FK CONSTRAINT; Schema: beta; Owner: lx
--

ALTER TABLE ONLY stars
    ADD CONSTRAINT stars_user_id FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: beta; Type: ACL; Schema: -; Owner: lx
--

REVOKE ALL ON SCHEMA beta FROM PUBLIC;
REVOKE ALL ON SCHEMA beta FROM lx;
GRANT ALL ON SCHEMA beta TO lx;
GRANT USAGE ON SCHEMA beta TO web;


--
-- Name: public; Type: ACL; Schema: -; Owner: pgsql
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM pgsql;
GRANT ALL ON SCHEMA public TO pgsql;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- Name: links_id_seq; Type: ACL; Schema: beta; Owner: lx
--

REVOKE ALL ON SEQUENCE links_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE links_id_seq FROM lx;
GRANT ALL ON SEQUENCE links_id_seq TO lx;
GRANT SELECT,USAGE ON SEQUENCE links_id_seq TO web;


--
-- Name: links; Type: ACL; Schema: beta; Owner: lx
--

REVOKE ALL ON TABLE links FROM PUBLIC;
REVOKE ALL ON TABLE links FROM lx;
GRANT ALL ON TABLE links TO lx;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE links TO PUBLIC;
GRANT SELECT,INSERT ON TABLE links TO web;


--
-- Name: logs; Type: ACL; Schema: beta; Owner: lx
--

REVOKE ALL ON TABLE logs FROM PUBLIC;
REVOKE ALL ON TABLE logs FROM lx;
GRANT ALL ON TABLE logs TO lx;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE logs TO PUBLIC;
GRANT SELECT,INSERT ON TABLE logs TO web;


--
-- Name: logs_id_seq; Type: ACL; Schema: beta; Owner: lx
--

REVOKE ALL ON SEQUENCE logs_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE logs_id_seq FROM lx;
GRANT ALL ON SEQUENCE logs_id_seq TO lx;
GRANT SELECT,USAGE ON SEQUENCE logs_id_seq TO web;


--
-- Name: stars; Type: ACL; Schema: beta; Owner: lx
--

REVOKE ALL ON TABLE stars FROM PUBLIC;
REVOKE ALL ON TABLE stars FROM lx;
GRANT ALL ON TABLE stars TO lx;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE stars TO PUBLIC;
GRANT SELECT,INSERT ON TABLE stars TO web;


--
-- Name: stars_id_seq; Type: ACL; Schema: beta; Owner: lx
--

REVOKE ALL ON SEQUENCE stars_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE stars_id_seq FROM lx;
GRANT ALL ON SEQUENCE stars_id_seq TO lx;
GRANT SELECT,USAGE ON SEQUENCE stars_id_seq TO web;


--
-- Name: users; Type: ACL; Schema: beta; Owner: lx
--

REVOKE ALL ON TABLE users FROM PUBLIC;
REVOKE ALL ON TABLE users FROM lx;
GRANT ALL ON TABLE users TO lx;
GRANT SELECT,INSERT ON TABLE users TO web;


--
-- Name: users_id_seq; Type: ACL; Schema: beta; Owner: lx
--

REVOKE ALL ON SEQUENCE users_id_seq FROM PUBLIC;
REVOKE ALL ON SEQUENCE users_id_seq FROM lx;
GRANT ALL ON SEQUENCE users_id_seq TO lx;
GRANT SELECT,USAGE ON SEQUENCE users_id_seq TO web;


--
-- PostgreSQL database dump complete
--

