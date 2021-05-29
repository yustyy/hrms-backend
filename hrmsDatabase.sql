-- This script was generated by a beta version of the ERD tool in pgAdmin 4.
-- Please log an issue at https://redmine.postgresql.org/projects/pgadmin4/issues/new if you find any bugs, including reproduction steps.
BEGIN;


CREATE TABLE public.users
(
    id integer NOT NULL GENERATED BY DEFAULT AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    email character varying(100) NOT NULL,
    password_hash bit varying(500) NOT NULL,
    password_salt bit varying(500) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public.jobs
(
    id integer NOT NULL GENERATED BY DEFAULT AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    name character varying(50) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public.job_seekers
(
    user_id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    national_identity character varying(11) NOT NULL,
    birth_date date NOT NULL,
    PRIMARY KEY (user_id)
);

CREATE TABLE public.employers
(
    user_id integer NOT NULL,
    company_name character varying(100) NOT NULL,
    website character varying(100) NOT NULL,
    phone character varying(16) NOT NULL,
    PRIMARY KEY (user_id)
);

CREATE TABLE public.company_staffs
(
    user_id integer NOT NULL,
    first_name character varying(25) NOT NULL,
    last_name character varying(25) NOT NULL,
    PRIMARY KEY (user_id)
);

CREATE TABLE public.company_staff_verifications
(
    id integer NOT NULL GENERATED BY DEFAULT AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    employers_id integer NOT NULL,
    authorized_company_staff_id integer NOT NULL,
    is_approved boolean NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public.mernis_activations
(
    id integer NOT NULL GENERATED BY DEFAULT AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    user_id integer NOT NULL,
    is_approved boolean NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE public.email_activations
(
    id integer NOT NULL GENERATED BY DEFAULT AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 2147483647 CACHE 1 ),
    user_id integer NOT NULL,
    auth_token character varying(200) NOT NULL,
    is_approved boolean NOT NULL,
    PRIMARY KEY (id)
);

ALTER TABLE public.company_staffs
    ADD FOREIGN KEY (user_id)
    REFERENCES public.users (id)
    NOT VALID;


ALTER TABLE public.employers
    ADD FOREIGN KEY (user_id)
    REFERENCES public.users (id)
    NOT VALID;


ALTER TABLE public.job_seekers
    ADD FOREIGN KEY (user_id)
    REFERENCES public.users (id)
    NOT VALID;


ALTER TABLE public.company_staff_verifications
    ADD FOREIGN KEY (employers_id)
    REFERENCES public.employers (user_id)
    NOT VALID;


ALTER TABLE public.mernis_activations
    ADD FOREIGN KEY (user_id)
    REFERENCES public.job_seekers (user_id)
    NOT VALID;

END;