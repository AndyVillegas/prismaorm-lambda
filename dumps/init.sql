CREATE TABLE public.costumers (
    id integer NOT NULL,
    first_name character varying(250),
    last_name character varying(250),
    age integer NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_DATE NOT NULL,
    updated_at timestamp without time zone,
    created_by integer NOT NULL,
    updated_by integer
);

ALTER TABLE public.costumers OWNER TO postgres;

ALTER TABLE public.costumers ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.costumer_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);

ALTER TABLE ONLY public.costumers
    ADD CONSTRAINT costumer_pkey PRIMARY KEY (id);