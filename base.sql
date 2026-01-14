--
-- PostgreSQL database dump
--
-- Dumped from database version 16.11 (Ubuntu 16.11-0ubuntu0.24.04.1)
-- Dumped by pg_dump version 16.11 (Ubuntu 16.11-0ubuntu0.24.04.1)

CREATE DATABASE garritasfelices;
\c garritasfelices;

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
-- Name: aplicacion_dosis; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.aplicacion_dosis (
    id_aplicacion integer NOT NULL,
    id_medicamento integer,
    id_especie integer,
    id_via_administracion integer,
    dosis_recomendada text NOT NULL
);


ALTER TABLE public.aplicacion_dosis OWNER TO postgres;

--
-- Name: aplicacion_dosis_id_apli_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.aplicacion_dosis_id_apli_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.aplicacion_dosis_id_apli_seq OWNER TO postgres;

--
-- Name: aplicacion_dosis_id_apli_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.aplicacion_dosis_id_apli_seq OWNED BY public.aplicacion_dosis.id_aplicacion;


--
-- Name: cat_agentes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cat_agentes (
    id_agente integer NOT NULL,
    nombre_agente character varying(150) NOT NULL,
    tipo_agente character varying(50)
);


ALTER TABLE public.cat_agentes OWNER TO postgres;

--
-- Name: cat_agentes_id_agente_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cat_agentes_id_agente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cat_agentes_id_agente_seq OWNER TO postgres;

--
-- Name: cat_agentes_id_agente_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cat_agentes_id_agente_seq OWNED BY public.cat_agentes.id_agente;


--
-- Name: cat_asentamientos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cat_asentamientos (
    id_asenta integer NOT NULL,
    codigop_fk integer NOT NULL,
    id_tipo_asenta_fk integer,
    d_asenta character varying(100) NOT NULL
);


ALTER TABLE public.cat_asentamientos OWNER TO postgres;

--
-- Name: cat_categorias_med; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cat_categorias_med (
    id_cat_med integer NOT NULL,
    nombre_categoria character varying(100) NOT NULL,
    descripcion text,
    id_especie integer NOT NULL
);


ALTER TABLE public.cat_categorias_med OWNER TO postgres;

--
-- Name: cat_categorias_med_id_cat_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cat_categorias_med_id_cat_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cat_categorias_med_id_cat_seq OWNER TO postgres;

--
-- Name: cat_categorias_med_id_cat_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cat_categorias_med_id_cat_seq OWNED BY public.cat_categorias_med.id_cat_med;


--
-- Name: cat_compuestos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cat_compuestos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cat_compuestos_id_seq OWNER TO postgres;

--
-- Name: cat_compuestos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cat_compuestos (
    id_compuesto integer DEFAULT nextval('public.cat_compuestos_id_seq'::regclass) NOT NULL,
    nombre_compuesto character varying(255) NOT NULL,
    id_especie integer NOT NULL
);


ALTER TABLE public.cat_compuestos OWNER TO postgres;

--
-- Name: cat_cp_base; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cat_cp_base (
    codigop integer NOT NULL,
    id_mnpio_fk integer,
    id_estado_fk integer
);


ALTER TABLE public.cat_cp_base OWNER TO postgres;

--
-- Name: cat_especies; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cat_especies (
    id_especie integer NOT NULL,
    nombre_especie character varying(50) NOT NULL
);


ALTER TABLE public.cat_especies OWNER TO postgres;

--
-- Name: cat_especies_id_especie_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cat_especies_id_especie_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cat_especies_id_especie_seq OWNER TO postgres;

--
-- Name: cat_especies_id_especie_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cat_especies_id_especie_seq OWNED BY public.cat_especies.id_especie;


--
-- Name: cat_estados; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cat_estados (
    id_estado integer NOT NULL,
    d_estado character varying(100) NOT NULL
);


ALTER TABLE public.cat_estados OWNER TO postgres;

--
-- Name: cat_formas_farm_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cat_formas_farm_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cat_formas_farm_id_seq OWNER TO postgres;

--
-- Name: cat_formas_farmaceuticas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cat_formas_farmaceuticas (
    id_forma_farmaceutica integer DEFAULT nextval('public.cat_formas_farm_id_seq'::regclass) NOT NULL,
    nombre_forma character varying(100) NOT NULL,
    descripcion text,
    id_especie integer NOT NULL
);


ALTER TABLE public.cat_formas_farmaceuticas OWNER TO postgres;

--
-- Name: cat_importancia_vacuna; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cat_importancia_vacuna (
    id_importancia integer NOT NULL,
    descripcion character varying(50) NOT NULL
);


ALTER TABLE public.cat_importancia_vacuna OWNER TO postgres;

--
-- Name: cat_importancia_vacuna_id_importancia_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cat_importancia_vacuna_id_importancia_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cat_importancia_vacuna_id_importancia_seq OWNER TO postgres;

--
-- Name: cat_importancia_vacuna_id_importancia_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cat_importancia_vacuna_id_importancia_seq OWNED BY public.cat_importancia_vacuna.id_importancia;


--
-- Name: cat_interaccion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cat_interaccion (
    id_interaccion integer NOT NULL,
    nivel character varying(50) NOT NULL
);


ALTER TABLE public.cat_interaccion OWNER TO postgres;

--
-- Name: cat_interaccion_id_interaccion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cat_interaccion_id_interaccion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cat_interaccion_id_interaccion_seq OWNER TO postgres;

--
-- Name: cat_interaccion_id_interaccion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cat_interaccion_id_interaccion_seq OWNED BY public.cat_interaccion.id_interaccion;


--
-- Name: cat_laboratorios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cat_laboratorios (
    id_laboratorio integer NOT NULL,
    nombre_laboratorio character varying(100) NOT NULL,
    pais_origen character varying(100),
    telefono character varying(100),
    email character varying(100),
    sitio_web character varying(255),
    id_especie integer NOT NULL
);


ALTER TABLE public.cat_laboratorios OWNER TO postgres;

--
-- Name: cat_laboratorios_id_lab_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cat_laboratorios_id_lab_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cat_laboratorios_id_lab_seq OWNER TO postgres;

--
-- Name: cat_laboratorios_id_lab_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cat_laboratorios_id_lab_seq OWNED BY public.cat_laboratorios.id_laboratorio;


--
-- Name: cat_lugares; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cat_lugares (
    id_lugar integer NOT NULL,
    nombre_lugar character varying(100) NOT NULL
);


ALTER TABLE public.cat_lugares OWNER TO postgres;

--
-- Name: cat_lugares_id_lugar_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cat_lugares_id_lugar_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cat_lugares_id_lugar_seq OWNER TO postgres;

--
-- Name: cat_lugares_id_lugar_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cat_lugares_id_lugar_seq OWNED BY public.cat_lugares.id_lugar;


--
-- Name: cat_municipios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cat_municipios (
    id_mnpio integer NOT NULL,
    id_estado_fk integer NOT NULL,
    d_mnpio character varying(100) NOT NULL
);


ALTER TABLE public.cat_municipios OWNER TO postgres;

--
-- Name: cat_presentaciones_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cat_presentaciones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cat_presentaciones_id_seq OWNER TO postgres;

--
-- Name: cat_presentaciones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cat_presentaciones (
    id_presentacion integer DEFAULT nextval('public.cat_presentaciones_id_seq'::regclass) NOT NULL,
    nombre_presentacion character varying(100) NOT NULL,
    descripcion text,
    id_especie integer NOT NULL
);


ALTER TABLE public.cat_presentaciones OWNER TO postgres;

--
-- Name: cat_rasgos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cat_rasgos (
    id_rasgo integer NOT NULL,
    nombre_rasgo character varying(100) NOT NULL
);


ALTER TABLE public.cat_rasgos OWNER TO postgres;

--
-- Name: cat_rasgos_id_rasgo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cat_rasgos_id_rasgo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cat_rasgos_id_rasgo_seq OWNER TO postgres;

--
-- Name: cat_rasgos_id_rasgo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cat_rasgos_id_rasgo_seq OWNED BY public.cat_rasgos.id_rasgo;


--
-- Name: cat_servicios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cat_servicios (
    id_servicio integer NOT NULL,
    nombre_servicio character varying(100) NOT NULL,
    descripcion text,
    precio_base numeric(10,2)
);


ALTER TABLE public.cat_servicios OWNER TO postgres;

--
-- Name: cat_servicios_id_servicio_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cat_servicios_id_servicio_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cat_servicios_id_servicio_seq OWNER TO postgres;

--
-- Name: cat_servicios_id_servicio_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cat_servicios_id_servicio_seq OWNED BY public.cat_servicios.id_servicio;


--
-- Name: cat_sintomas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cat_sintomas (
    id_sintoma integer NOT NULL,
    descripcion text NOT NULL
);


ALTER TABLE public.cat_sintomas OWNER TO postgres;

--
-- Name: cat_sintomas_id_sintoma_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cat_sintomas_id_sintoma_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cat_sintomas_id_sintoma_seq OWNER TO postgres;

--
-- Name: cat_sintomas_id_sintoma_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cat_sintomas_id_sintoma_seq OWNED BY public.cat_sintomas.id_sintoma;


--
-- Name: cat_subtipos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cat_subtipos (
    id_subtipo integer NOT NULL,
    id_especie integer NOT NULL,
    nom_subtipo character varying(100) NOT NULL,
    nom_cientifico character varying(150),
    peso_min numeric(10,2),
    peso_max numeric(10,2),
    size_min numeric(10,2),
    size_max numeric(10,2),
    esp_vida_min integer,
    esp_vida_max integer,
    id_tamano integer,
    id_interaccion integer,
    descripcion text
);


ALTER TABLE public.cat_subtipos OWNER TO postgres;

--
-- Name: cat_subtipos_id_subtipo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cat_subtipos_id_subtipo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cat_subtipos_id_subtipo_seq OWNER TO postgres;

--
-- Name: cat_subtipos_id_subtipo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cat_subtipos_id_subtipo_seq OWNED BY public.cat_subtipos.id_subtipo;


--
-- Name: cat_tamano; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cat_tamano (
    id_tamano integer NOT NULL,
    nom_tamano character varying(50) NOT NULL
);


ALTER TABLE public.cat_tamano OWNER TO postgres;

--
-- Name: cat_tamano_id_tamano_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cat_tamano_id_tamano_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cat_tamano_id_tamano_seq OWNER TO postgres;

--
-- Name: cat_tamano_id_tamano_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cat_tamano_id_tamano_seq OWNED BY public.cat_tamano.id_tamano;


--
-- Name: cat_tipo_asentamiento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cat_tipo_asentamiento (
    id_tipo_asenta integer NOT NULL,
    d_tipo_asenta character varying(50) NOT NULL
);


ALTER TABLE public.cat_tipo_asentamiento OWNER TO postgres;

--
-- Name: cat_tipo_patologia; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cat_tipo_patologia (
    id_tipo integer NOT NULL,
    nombre_tipo character varying(100) NOT NULL
);


ALTER TABLE public.cat_tipo_patologia OWNER TO postgres;

--
-- Name: cat_tipo_patologia_id_tipo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cat_tipo_patologia_id_tipo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cat_tipo_patologia_id_tipo_seq OWNER TO postgres;

--
-- Name: cat_tipo_patologia_id_tipo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cat_tipo_patologia_id_tipo_seq OWNED BY public.cat_tipo_patologia.id_tipo;


--
-- Name: cat_tratamientos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cat_tratamientos (
    id_tratamiento integer NOT NULL,
    descripcion text NOT NULL,
    tipo_tratamiento character varying(50)
);


ALTER TABLE public.cat_tratamientos OWNER TO postgres;

--
-- Name: cat_tratamientos_id_tratamiento_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cat_tratamientos_id_tratamiento_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cat_tratamientos_id_tratamiento_seq OWNER TO postgres;

--
-- Name: cat_tratamientos_id_tratamiento_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cat_tratamientos_id_tratamiento_seq OWNED BY public.cat_tratamientos.id_tratamiento;


--
-- Name: cat_unidades_medida; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cat_unidades_medida (
    id_unidad_medida integer NOT NULL,
    nombre_unidad character varying(100) NOT NULL,
    id_especie integer NOT NULL,
    abreviatura character varying(50)
);


ALTER TABLE public.cat_unidades_medida OWNER TO postgres;

--
-- Name: cat_unidades_por_compuesto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cat_unidades_por_compuesto (
    id_compxu integer NOT NULL,
    compxu character varying(50) NOT NULL,
    id_especie integer NOT NULL
);


ALTER TABLE public.cat_unidades_por_compuesto OWNER TO postgres;

--
-- Name: cat_vias_admin_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cat_vias_admin_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cat_vias_admin_id_seq OWNER TO postgres;

--
-- Name: cat_vias_admin; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cat_vias_admin (
    id_via_administracion integer DEFAULT nextval('public.cat_vias_admin_id_seq'::regclass) NOT NULL,
    nombre_via character varying(100) NOT NULL,
    descripcion text,
    id_especie integer NOT NULL
);


ALTER TABLE public.cat_vias_admin OWNER TO postgres;

--
-- Name: cat_vias_transmision; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cat_vias_transmision (
    id_via integer NOT NULL,
    descripcion character varying(255) NOT NULL
);


ALTER TABLE public.cat_vias_transmision OWNER TO postgres;

--
-- Name: cat_vias_transmision_id_via_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cat_vias_transmision_id_via_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cat_vias_transmision_id_via_seq OWNER TO postgres;

--
-- Name: cat_vias_transmision_id_via_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cat_vias_transmision_id_via_seq OWNED BY public.cat_vias_transmision.id_via;


--
-- Name: catalogo_fabricantes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.catalogo_fabricantes (
    id_fabricante integer NOT NULL,
    nombre_fabricante character varying(100) NOT NULL
);


ALTER TABLE public.catalogo_fabricantes OWNER TO postgres;

--
-- Name: catalogo_paises; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.catalogo_paises (
    id_pais integer NOT NULL,
    nombre_pais character varying(100) NOT NULL,
    CONSTRAINT catalogo_paises_id_pais_check CHECK (((id_pais >= 0) AND (id_pais <= 999)))
);


ALTER TABLE public.catalogo_paises OWNER TO postgres;

--
-- Name: chip_identificacion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.chip_identificacion (
    id_chip_pk integer NOT NULL,
    num_chip character varying(50) NOT NULL,
    tipo_protocolo character varying(20) NOT NULL,
    id_pais integer,
    id_fabricante integer,
    id_mascota integer,
    datos_especificos jsonb
);


ALTER TABLE public.chip_identificacion OWNER TO postgres;

--
-- Name: chip_identificacion_id_chip_pk_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.chip_identificacion_id_chip_pk_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.chip_identificacion_id_chip_pk_seq OWNER TO postgres;

--
-- Name: chip_identificacion_id_chip_pk_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.chip_identificacion_id_chip_pk_seq OWNED BY public.chip_identificacion.id_chip_pk;


--
-- Name: chipavid; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.chipavid (
    id_animalavid bigint NOT NULL,
    header_avid smallint,
    codigo_rebano_avid smallint,
    id_animal_avid bigint,
    b_reservados_avid smallint,
    b_control_crc_avid smallint,
    b_stop_avid smallint,
    b_control_adicional_avid smallint,
    seguridad_avid smallint,
    id_mascota_fk integer,
    CONSTRAINT chipavid_b_control_adicional_avid_check CHECK (((b_control_adicional_avid >= 0) AND (b_control_adicional_avid <= 1))),
    CONSTRAINT chipavid_b_control_crc_avid_check CHECK ((b_control_crc_avid = 1)),
    CONSTRAINT chipavid_b_reservados_avid_check CHECK (((b_reservados_avid >= 0) AND (b_reservados_avid <= 63))),
    CONSTRAINT chipavid_b_stop_avid_check CHECK ((b_stop_avid = 1)),
    CONSTRAINT chipavid_codigo_rebano_avid_check CHECK (((codigo_rebano_avid >= 0) AND (codigo_rebano_avid <= 65535))),
    CONSTRAINT chipavid_header_avid_check CHECK ((header_avid = 0)),
    CONSTRAINT chipavid_id_animal_avid_check CHECK (((id_animal_avid >= 0) AND (id_animal_avid <= '274877906943'::bigint)))
);


ALTER TABLE public.chipavid OWNER TO postgres;

--
-- Name: chipicar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.chipicar (
    id_animalicar bigint NOT NULL,
    header_icar smallint,
    codigo_control_icar smallint,
    id_animal_icar bigint,
    b_reservados_icar smallint,
    b_control_crc_icar smallint,
    b_stop_icar smallint,
    b_control_val_icar smallint,
    id_mascota_fk integer,
    CONSTRAINT chipicar_b_control_crc_icar_check CHECK ((b_control_crc_icar = 1)),
    CONSTRAINT chipicar_b_control_val_icar_check CHECK (((b_control_val_icar >= 0) AND (b_control_val_icar <= 1))),
    CONSTRAINT chipicar_b_reservados_icar_check CHECK (((b_reservados_icar >= 0) AND (b_reservados_icar <= 63))),
    CONSTRAINT chipicar_b_stop_icar_check CHECK ((b_stop_icar = 1)),
    CONSTRAINT chipicar_codigo_control_icar_check CHECK (((codigo_control_icar >= 0) AND (codigo_control_icar <= 65535))),
    CONSTRAINT chipicar_header_icar_check CHECK ((header_icar = 0)),
    CONSTRAINT chipicar_id_animal_icar_check CHECK (((id_animal_icar >= 0) AND (id_animal_icar <= '274877906943'::bigint)))
);


ALTER TABLE public.chipicar OWNER TO postgres;

--
-- Name: chipiso; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.chipiso (
    id_chipiso bigint NOT NULL,
    bitheader smallint,
    pais_chipiso smallint,
    identificador_animal bigint,
    contador_etiquetado smallint,
    info_usuario smallint,
    futuro_uso smallint,
    id_pais_fk integer NOT NULL,
    id_mascota_fk integer,
    CONSTRAINT chipiso_bitheader_check CHECK ((bitheader = 1)),
    CONSTRAINT chipiso_contador_etiquetado_check CHECK (((contador_etiquetado >= 0) AND (contador_etiquetado <= 7))),
    CONSTRAINT chipiso_futuro_uso_check CHECK (((futuro_uso >= 0) AND (futuro_uso <= 7))),
    CONSTRAINT chipiso_identificador_animal_check CHECK (((identificador_animal >= 0) AND (identificador_animal <= '274877906943'::bigint))),
    CONSTRAINT chipiso_info_usuario_check CHECK (((info_usuario >= 0) AND (info_usuario <= 31))),
    CONSTRAINT chipiso_pais_chipiso_check CHECK (((pais_chipiso >= 0) AND (pais_chipiso <= 16383)))
);


ALTER TABLE public.chipiso OWNER TO postgres;

--
-- Name: domicilio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.domicilio (
    id_domicilio integer NOT NULL,
    nom_calle character varying(100) NOT NULL,
    num_calleint character varying(10),
    num_calleext character varying(10) NOT NULL,
    cp integer NOT NULL,
    id_asenta integer NOT NULL
);


ALTER TABLE public.domicilio OWNER TO postgres;

--
-- Name: domicilio_id_domicilio_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.domicilio_id_domicilio_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.domicilio_id_domicilio_seq OWNER TO postgres;

--
-- Name: domicilio_id_domicilio_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.domicilio_id_domicilio_seq OWNED BY public.domicilio.id_domicilio;


--
-- Name: ingrediente_activo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ingrediente_activo (
    id_presxmed integer NOT NULL,
    id_comp integer NOT NULL,
    cantidad numeric(10,2) NOT NULL,
    id_um integer,
    id_comxu integer,
    id_especie integer
);


ALTER TABLE public.ingrediente_activo OWNER TO postgres;

--
-- Name: instrucciones_manejo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.instrucciones_manejo (
    id_instruccion integer NOT NULL,
    id_comportamiento integer,
    instruccion text NOT NULL
);


ALTER TABLE public.instrucciones_manejo OWNER TO postgres;

--
-- Name: instrucciones_manejo_id_instruccion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.instrucciones_manejo_id_instruccion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.instrucciones_manejo_id_instruccion_seq OWNER TO postgres;

--
-- Name: instrucciones_manejo_id_instruccion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.instrucciones_manejo_id_instruccion_seq OWNED BY public.instrucciones_manejo.id_instruccion;


--
-- Name: mascota; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mascota (
    id_mascota integer NOT NULL,
    nombre_mascota character varying(100) NOT NULL,
    id_subtipo integer,
    edad_mascota integer,
    genero_mascota character varying(10),
    peso_mascota numeric(5,2),
    esterilizado boolean DEFAULT false,
    url_foto character varying(255),
    id_usuario_fk integer,
    edad integer,
    especie character varying(50),
    raza character varying(100),
    tamano character varying(50),
    ruac character varying(50),
    tiene_chip boolean DEFAULT false,
    foto character varying(255),
    id_especie integer
);


ALTER TABLE public.mascota OWNER TO postgres;

--
-- Name: mascota_id_mascota_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mascota_id_mascota_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.mascota_id_mascota_seq OWNER TO postgres;

--
-- Name: mascota_id_mascota_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mascota_id_mascota_seq OWNED BY public.mascota.id_mascota;


--
-- Name: medicamentos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.medicamentos (
    id_med integer NOT NULL,
    nombre_medicamento character varying(150) NOT NULL,
    id_lab integer,
    id_via_admin integer,
    id_cat_med integer,
    id_especie integer NOT NULL
);


ALTER TABLE public.medicamentos OWNER TO postgres;

--
-- Name: patologias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.patologias (
    id_patologia integer NOT NULL,
    nombre_patologia character varying(200) NOT NULL,
    es_alergia boolean DEFAULT false,
    gravedad_pronostico text,
    causa text,
    transmision text,
    sintomas text,
    tratamiento text,
    tipo character varying(100),
    clasificacion character varying(100),
    id_especie integer NOT NULL,
    id_tipo_patologia integer
);


ALTER TABLE public.patologias OWNER TO postgres;

--
-- Name: patologias_id_patologia_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.patologias_id_patologia_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.patologias_id_patologia_seq OWNER TO postgres;

--
-- Name: patologias_id_patologia_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.patologias_id_patologia_seq OWNED BY public.patologias.id_patologia;


--
-- Name: pres_med_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pres_med_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.pres_med_id_seq OWNER TO postgres;

--
-- Name: presentacion_medicamento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.presentacion_medicamento (
    id_presentacion_medicamento integer DEFAULT nextval('public.pres_med_id_seq'::regclass) NOT NULL,
    id_medicamento integer,
    id_presentacion integer,
    id_forma_farmaceutica integer,
    cantidad numeric(10,2) NOT NULL,
    id_unidad_medida integer,
    id_especie integer NOT NULL
);


ALTER TABLE public.presentacion_medicamento OWNER TO postgres;

--
-- Name: presentacion_medicamento_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.presentacion_medicamento_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.presentacion_medicamento_id_seq OWNER TO postgres;

--
-- Name: rel_especie_patologia; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rel_especie_patologia (
    id_especie integer NOT NULL,
    id_patologia integer NOT NULL
);


ALTER TABLE public.rel_especie_patologia OWNER TO postgres;

--
-- Name: rel_patologia_agente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rel_patologia_agente (
    id_patologia integer NOT NULL,
    id_agente integer NOT NULL
);


ALTER TABLE public.rel_patologia_agente OWNER TO postgres;

--
-- Name: rel_patologia_sintoma; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rel_patologia_sintoma (
    id_patologia integer NOT NULL,
    id_sintoma integer NOT NULL
);


ALTER TABLE public.rel_patologia_sintoma OWNER TO postgres;

--
-- Name: rel_patologia_transmision; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rel_patologia_transmision (
    id_patologia integer NOT NULL,
    id_via integer NOT NULL
);


ALTER TABLE public.rel_patologia_transmision OWNER TO postgres;

--
-- Name: rel_patologia_tratamiento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rel_patologia_tratamiento (
    id_patologia integer NOT NULL,
    id_tratamiento integer NOT NULL
);


ALTER TABLE public.rel_patologia_tratamiento OWNER TO postgres;

--
-- Name: rel_vacuna_especie; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rel_vacuna_especie (
    id_vacuna integer NOT NULL,
    id_especie integer NOT NULL
);


ALTER TABLE public.rel_vacuna_especie OWNER TO postgres;

--
-- Name: rel_vacuna_laboratorio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rel_vacuna_laboratorio (
    id_especie integer NOT NULL,
    id_vacuna integer NOT NULL,
    id_lab integer NOT NULL
);


ALTER TABLE public.rel_vacuna_laboratorio OWNER TO postgres;

--
-- Name: rel_vacuna_patologia; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rel_vacuna_patologia (
    id_vacuna integer NOT NULL,
    id_patologia integer NOT NULL,
    id_especie integer NOT NULL
);


ALTER TABLE public.rel_vacuna_patologia OWNER TO postgres;

--
-- Name: reservaciones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reservaciones (
    id_reservacion integer NOT NULL,
    id_usuario_fk integer,
    id_mascota_fk integer,
    id_servicio_fk integer,
    fecha_entrada date NOT NULL,
    hora_reservacion time without time zone,
    estado_reservacion character varying(20) DEFAULT 'Pendiente'::character varying,
    notas_especiales text,
    fecha_registro timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    fecha_salida date,
    tipo_habitacion character varying(50)
);


ALTER TABLE public.reservaciones OWNER TO postgres;

--
-- Name: reservaciones_id_reservacion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reservaciones_id_reservacion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.reservaciones_id_reservacion_seq OWNER TO postgres;

--
-- Name: reservaciones_id_reservacion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reservaciones_id_reservacion_seq OWNED BY public.reservaciones.id_reservacion;


--
-- Name: temperamento_especie; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.temperamento_especie (
    id_comportamiento integer NOT NULL,
    id_especie integer,
    id_rasgo integer
);


ALTER TABLE public.temperamento_especie OWNER TO postgres;

--
-- Name: temperamento_especie_id_comportamiento_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.temperamento_especie_id_comportamiento_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.temperamento_especie_id_comportamiento_seq OWNER TO postgres;

--
-- Name: temperamento_especie_id_comportamiento_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.temperamento_especie_id_comportamiento_seq OWNED BY public.temperamento_especie.id_comportamiento;


--
-- Name: usuarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuarios (
    id_usuario integer NOT NULL,
    nombre_usu character varying(100) NOT NULL,
    apellido_pa_usu character varying(100) NOT NULL,
    apellido_ma_usu character varying(100),
    email_usu character varying(100) NOT NULL,
    tel_usu character varying(15),
    passw_usu character varying(100) NOT NULL,
    fec_nac_usu date,
    id_domicilio_fk integer
);


ALTER TABLE public.usuarios OWNER TO postgres;

--
-- Name: usuarios_id_usuario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuarios_id_usuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.usuarios_id_usuario_seq OWNER TO postgres;

--
-- Name: usuarios_id_usuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuarios_id_usuario_seq OWNED BY public.usuarios.id_usuario;


--
-- Name: vacunas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vacunas (
    id_vacuna integer NOT NULL,
    nombre_vacuna character varying(255) NOT NULL,
    id_lab integer,
    importancia character varying(100),
    nota_aplicacion text,
    id_especie integer NOT NULL,
    tipo_vacuna character varying(100),
    cura text,
    nombre_lab_txt character varying(100)
);


ALTER TABLE public.vacunas OWNER TO postgres;

--
-- Name: vacunas_id_vacuna_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vacunas_id_vacuna_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vacunas_id_vacuna_seq OWNER TO postgres;

--
-- Name: vacunas_id_vacuna_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vacunas_id_vacuna_seq OWNED BY public.vacunas.id_vacuna;


--
-- Name: aplicacion_dosis id_aplicacion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aplicacion_dosis ALTER COLUMN id_aplicacion SET DEFAULT nextval('public.aplicacion_dosis_id_apli_seq'::regclass);


--
-- Name: cat_agentes id_agente; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cat_agentes ALTER COLUMN id_agente SET DEFAULT nextval('public.cat_agentes_id_agente_seq'::regclass);


--
-- Name: cat_categorias_med id_cat_med; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cat_categorias_med ALTER COLUMN id_cat_med SET DEFAULT nextval('public.cat_categorias_med_id_cat_seq'::regclass);


--
-- Name: cat_especies id_especie; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cat_especies ALTER COLUMN id_especie SET DEFAULT nextval('public.cat_especies_id_especie_seq'::regclass);


--
-- Name: cat_importancia_vacuna id_importancia; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cat_importancia_vacuna ALTER COLUMN id_importancia SET DEFAULT nextval('public.cat_importancia_vacuna_id_importancia_seq'::regclass);


--
-- Name: cat_interaccion id_interaccion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cat_interaccion ALTER COLUMN id_interaccion SET DEFAULT nextval('public.cat_interaccion_id_interaccion_seq'::regclass);


--
-- Name: cat_laboratorios id_laboratorio; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cat_laboratorios ALTER COLUMN id_laboratorio SET DEFAULT nextval('public.cat_laboratorios_id_lab_seq'::regclass);


--
-- Name: cat_lugares id_lugar; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cat_lugares ALTER COLUMN id_lugar SET DEFAULT nextval('public.cat_lugares_id_lugar_seq'::regclass);


--
-- Name: cat_rasgos id_rasgo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cat_rasgos ALTER COLUMN id_rasgo SET DEFAULT nextval('public.cat_rasgos_id_rasgo_seq'::regclass);


--
-- Name: cat_servicios id_servicio; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cat_servicios ALTER COLUMN id_servicio SET DEFAULT nextval('public.cat_servicios_id_servicio_seq'::regclass);


--
-- Name: cat_sintomas id_sintoma; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cat_sintomas ALTER COLUMN id_sintoma SET DEFAULT nextval('public.cat_sintomas_id_sintoma_seq'::regclass);


--
-- Name: cat_subtipos id_subtipo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cat_subtipos ALTER COLUMN id_subtipo SET DEFAULT nextval('public.cat_subtipos_id_subtipo_seq'::regclass);


--
-- Name: cat_tamano id_tamano; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cat_tamano ALTER COLUMN id_tamano SET DEFAULT nextval('public.cat_tamano_id_tamano_seq'::regclass);


--
-- Name: cat_tipo_patologia id_tipo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cat_tipo_patologia ALTER COLUMN id_tipo SET DEFAULT nextval('public.cat_tipo_patologia_id_tipo_seq'::regclass);


--
-- Name: cat_tratamientos id_tratamiento; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cat_tratamientos ALTER COLUMN id_tratamiento SET DEFAULT nextval('public.cat_tratamientos_id_tratamiento_seq'::regclass);


--
-- Name: cat_vias_transmision id_via; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cat_vias_transmision ALTER COLUMN id_via SET DEFAULT nextval('public.cat_vias_transmision_id_via_seq'::regclass);


--
-- Name: chip_identificacion id_chip_pk; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chip_identificacion ALTER COLUMN id_chip_pk SET DEFAULT nextval('public.chip_identificacion_id_chip_pk_seq'::regclass);


--
-- Name: domicilio id_domicilio; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.domicilio ALTER COLUMN id_domicilio SET DEFAULT nextval('public.domicilio_id_domicilio_seq'::regclass);


--
-- Name: instrucciones_manejo id_instruccion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instrucciones_manejo ALTER COLUMN id_instruccion SET DEFAULT nextval('public.instrucciones_manejo_id_instruccion_seq'::regclass);


--
-- Name: mascota id_mascota; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mascota ALTER COLUMN id_mascota SET DEFAULT nextval('public.mascota_id_mascota_seq'::regclass);


--
-- Name: patologias id_patologia; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patologias ALTER COLUMN id_patologia SET DEFAULT nextval('public.patologias_id_patologia_seq'::regclass);


--
-- Name: reservaciones id_reservacion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservaciones ALTER COLUMN id_reservacion SET DEFAULT nextval('public.reservaciones_id_reservacion_seq'::regclass);


--
-- Name: temperamento_especie id_comportamiento; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temperamento_especie ALTER COLUMN id_comportamiento SET DEFAULT nextval('public.temperamento_especie_id_comportamiento_seq'::regclass);


--
-- Name: usuarios id_usuario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios ALTER COLUMN id_usuario SET DEFAULT nextval('public.usuarios_id_usuario_seq'::regclass);


--
-- Name: vacunas id_vacuna; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vacunas ALTER COLUMN id_vacuna SET DEFAULT nextval('public.vacunas_id_vacuna_seq'::regclass);


--
-- Data for Name: aplicacion_dosis; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.aplicacion_dosis (id_aplicacion, id_medicamento, id_especie, id_via_administracion, dosis_recomendada) FROM stdin;
1	1	4	2	2.5mg/kg
2	1	4	3	5mg/kg
3	2	4	3	10mg/kg
4	2	4	4	15mg/kg
5	3	4	4	25mg/kg
6	3	4	5	50mg/kg
7	4	4	5	100mg/kg
8	4	4	6	Según peso
9	5	4	6	0.5mg/kg
10	5	4	7	1mg/kg
11	6	4	7	2.5mg/kg
12	6	4	8	5mg/kg
13	7	4	8	10mg/kg
14	7	4	9	15mg/kg
15	8	4	9	25mg/kg
16	8	4	10	50mg/kg
17	9	4	10	100mg/kg
18	9	4	11	Según peso
19	10	4	11	0.5mg/kg
20	10	4	12	1mg/kg
21	11	4	12	2.5mg/kg
22	11	4	1	5mg/kg
23	12	4	1	10mg/kg
24	12	4	2	15mg/kg
25	13	4	2	25mg/kg
26	13	4	3	50mg/kg
27	14	4	3	100mg/kg
28	14	4	4	Según peso
29	15	4	4	0.5mg/kg
30	15	4	5	1mg/kg
31	16	4	5	2.5mg/kg
32	16	4	6	5mg/kg
33	17	4	6	10mg/kg
34	17	4	7	15mg/kg
35	18	4	7	25mg/kg
36	18	4	8	50mg/kg
37	19	4	8	100mg/kg
38	19	4	9	Según peso
39	20	4	9	0.5mg/kg
40	20	4	10	1mg/kg
41	21	4	10	2.5mg/kg
42	21	4	11	5mg/kg
43	22	4	11	10mg/kg
44	22	4	12	15mg/kg
45	23	4	12	25mg/kg
46	23	4	1	50mg/kg
47	24	4	1	100mg/kg
48	24	4	2	Según peso
49	25	4	2	0.5mg/kg
50	25	4	3	1mg/kg
51	26	4	3	2.5mg/kg
52	26	4	4	5mg/kg
53	27	4	4	10mg/kg
54	27	4	5	15mg/kg
55	28	4	5	25mg/kg
56	28	4	6	50mg/kg
57	29	4	6	100mg/kg
58	29	4	7	Según peso
59	30	4	7	0.5mg/kg
60	30	4	8	1mg/kg
61	31	4	8	2.5mg/kg
62	31	4	9	5mg/kg
63	32	4	9	10mg/kg
64	32	4	10	15mg/kg
65	33	4	10	25mg/kg
66	33	4	11	50mg/kg
67	34	4	11	100mg/kg
68	34	4	12	Según peso
69	35	4	12	0.5mg/kg
70	35	4	1	1mg/kg
71	36	4	1	2.5mg/kg
72	36	4	2	5mg/kg
73	37	4	2	10mg/kg
74	37	4	3	15mg/kg
75	38	4	3	25mg/kg
76	38	4	4	50mg/kg
77	39	4	4	100mg/kg
78	39	4	5	Según peso
79	40	4	5	0.5mg/kg
80	40	4	6	1mg/kg
81	41	4	6	2.5mg/kg
82	41	4	7	5mg/kg
83	42	4	7	10mg/kg
84	42	4	8	15mg/kg
85	43	4	8	25mg/kg
86	43	4	9	50mg/kg
87	44	4	9	100mg/kg
88	44	4	10	Según peso
89	45	4	10	0.5mg/kg
90	45	4	11	1mg/kg
91	46	4	11	2.5mg/kg
92	46	4	12	5mg/kg
93	47	4	12	10mg/kg
94	47	4	1	15mg/kg
95	48	4	1	25mg/kg
96	48	4	2	50mg/kg
97	49	4	2	100mg/kg
98	49	4	3	Según peso
99	50	4	3	0.5mg/kg
100	50	4	4	1mg/kg
101	51	4	4	2.5mg/kg
102	51	4	5	5mg/kg
103	52	4	5	10mg/kg
104	52	4	6	15mg/kg
105	53	4	6	25mg/kg
106	53	4	7	50mg/kg
107	54	4	7	100mg/kg
108	54	4	8	Según peso
109	55	4	8	0.5mg/kg
110	55	4	9	1mg/kg
111	56	4	9	2.5mg/kg
112	56	4	10	5mg/kg
113	57	4	10	10mg/kg
114	57	4	11	15mg/kg
115	58	4	11	25mg/kg
116	58	4	12	50mg/kg
117	59	4	12	100mg/kg
118	59	4	1	Según peso
119	60	4	1	0.5mg/kg
120	60	4	2	1mg/kg
121	61	4	2	2.5mg/kg
122	61	4	3	5mg/kg
123	62	4	3	10mg/kg
124	62	4	4	15mg/kg
125	63	4	4	25mg/kg
126	63	4	5	50mg/kg
127	64	4	5	100mg/kg
128	64	4	6	Según peso
129	65	4	6	0.5mg/kg
130	65	4	7	1mg/kg
131	66	4	7	2.5mg/kg
132	66	4	8	5mg/kg
133	67	4	8	10mg/kg
134	67	4	9	15mg/kg
135	68	4	9	25mg/kg
136	68	4	10	50mg/kg
137	69	4	10	100mg/kg
138	69	4	11	Según peso
139	70	4	11	0.5mg/kg
140	70	4	12	1mg/kg
141	71	4	12	2.5mg/kg
142	71	4	1	5mg/kg
143	72	4	1	10mg/kg
144	72	4	2	15mg/kg
145	73	4	2	25mg/kg
146	73	4	3	50mg/kg
147	74	4	3	100mg/kg
148	74	4	4	Según peso
149	75	4	4	0.5mg/kg
150	75	4	5	1mg/kg
151	76	4	5	2.5mg/kg
152	76	4	6	5mg/kg
153	77	4	6	10mg/kg
154	77	4	7	15mg/kg
155	78	4	7	25mg/kg
156	78	4	8	50mg/kg
157	79	4	8	100mg/kg
158	79	4	9	Según peso
159	80	4	9	0.5mg/kg
160	80	4	10	1mg/kg
161	81	4	10	2.5mg/kg
162	81	4	11	5mg/kg
163	82	4	11	10mg/kg
164	82	4	12	15mg/kg
165	83	4	12	25mg/kg
166	83	4	1	50mg/kg
167	84	4	1	100mg/kg
168	84	4	2	Según peso
169	85	4	2	0.5mg/kg
170	85	4	3	1mg/kg
171	86	4	3	2.5mg/kg
172	86	4	4	5mg/kg
173	87	4	4	10mg/kg
174	87	4	5	15mg/kg
175	88	4	5	25mg/kg
176	88	4	6	50mg/kg
177	89	4	6	100mg/kg
178	89	4	7	Según peso
179	90	4	7	0.5mg/kg
180	90	4	8	1mg/kg
181	91	4	8	2.5mg/kg
182	91	4	9	5mg/kg
183	92	4	9	10mg/kg
184	92	4	10	15mg/kg
185	93	4	10	25mg/kg
186	93	4	11	50mg/kg
187	94	4	11	100mg/kg
188	94	4	12	Según peso
189	95	4	12	0.5mg/kg
190	95	4	1	1mg/kg
191	96	4	1	2.5mg/kg
192	96	4	2	5mg/kg
193	97	4	2	10mg/kg
194	97	4	3	15mg/kg
195	98	4	3	25mg/kg
196	98	4	4	50mg/kg
197	99	4	4	100mg/kg
198	99	4	5	Según peso
199	100	4	5	0.5mg/kg
200	100	4	6	1mg/kg
201	101	4	6	2.5mg/kg
202	101	4	7	5mg/kg
203	102	4	7	10mg/kg
204	102	4	8	15mg/kg
205	103	4	8	25mg/kg
206	103	4	9	50mg/kg
207	104	4	9	100mg/kg
208	104	4	10	Según peso
209	105	4	10	0.5mg/kg
210	105	4	11	1mg/kg
211	106	4	11	2.5mg/kg
212	106	4	12	5mg/kg
213	107	4	12	10mg/kg
214	107	4	1	15mg/kg
215	108	4	1	25mg/kg
216	108	4	2	50mg/kg
217	109	4	2	100mg/kg
218	109	4	3	Según peso
219	110	4	3	0.5mg/kg
220	110	4	4	1mg/kg
221	111	4	4	2.5mg/kg
222	111	4	5	5mg/kg
223	112	4	5	10mg/kg
224	112	4	6	15mg/kg
225	113	4	6	25mg/kg
226	113	4	7	50mg/kg
227	114	4	7	100mg/kg
228	114	4	8	Según peso
229	115	4	8	0.5mg/kg
230	115	4	9	1mg/kg
231	116	4	9	2.5mg/kg
232	116	4	10	5mg/kg
233	117	4	10	10mg/kg
234	117	4	11	15mg/kg
235	118	4	11	25mg/kg
236	118	4	12	50mg/kg
237	119	4	12	100mg/kg
238	119	4	1	Según peso
239	120	4	1	0.5mg/kg
240	120	4	2	1mg/kg
241	121	4	2	2.5mg/kg
242	121	4	3	5mg/kg
243	122	4	3	10mg/kg
244	122	4	4	15mg/kg
245	123	4	4	25mg/kg
246	123	4	5	50mg/kg
247	124	4	5	100mg/kg
248	124	4	6	Según peso
249	125	4	6	0.5mg/kg
250	125	4	7	1mg/kg
251	126	4	7	2.5mg/kg
252	126	4	8	5mg/kg
253	127	4	8	10mg/kg
254	127	4	9	15mg/kg
255	128	4	9	25mg/kg
256	128	4	10	50mg/kg
257	129	4	10	100mg/kg
258	129	4	11	Según peso
259	130	4	11	0.5mg/kg
260	130	4	12	1mg/kg
261	131	4	12	2.5mg/kg
262	131	4	1	5mg/kg
263	132	4	1	10mg/kg
264	132	4	2	15mg/kg
265	133	4	2	25mg/kg
266	133	4	3	50mg/kg
267	134	4	3	100mg/kg
268	134	4	4	Según peso
269	135	4	4	0.5mg/kg
270	135	4	5	1mg/kg
271	136	4	5	2.5mg/kg
272	136	4	6	5mg/kg
273	137	4	6	10mg/kg
274	137	4	7	15mg/kg
275	138	4	7	25mg/kg
276	138	4	8	50mg/kg
277	139	4	8	100mg/kg
278	139	4	9	Según peso
279	140	4	9	0.5mg/kg
280	140	4	10	1mg/kg
281	141	4	10	2.5mg/kg
282	141	4	11	5mg/kg
283	142	4	11	10mg/kg
284	142	4	12	15mg/kg
285	143	4	12	25mg/kg
286	143	4	1	50mg/kg
287	144	4	1	100mg/kg
288	144	4	2	Según peso
289	145	4	2	0.5mg/kg
290	145	4	3	1mg/kg
291	146	4	3	2.5mg/kg
292	146	4	4	5mg/kg
293	147	4	4	10mg/kg
294	147	4	5	15mg/kg
295	148	4	5	25mg/kg
296	148	4	6	50mg/kg
297	149	4	6	100mg/kg
298	149	4	7	Según peso
299	150	4	7	0.5mg/kg
300	150	4	8	1mg/kg
301	151	4	8	2.5mg/kg
302	151	4	9	5mg/kg
303	152	4	9	10mg/kg
304	152	4	10	15mg/kg
305	153	4	10	25mg/kg
306	153	4	11	50mg/kg
307	154	4	11	100mg/kg
308	154	4	12	Según peso
309	155	4	12	0.5mg/kg
310	155	4	1	1mg/kg
311	156	4	1	2.5mg/kg
312	156	4	2	5mg/kg
313	157	4	2	10mg/kg
314	157	4	3	15mg/kg
315	158	4	3	25mg/kg
316	158	4	4	50mg/kg
317	159	4	4	100mg/kg
318	159	4	5	Según peso
319	160	4	5	0.5mg/kg
320	160	4	6	1mg/kg
321	161	4	6	2.5mg/kg
322	161	4	7	5mg/kg
323	162	4	7	10mg/kg
324	162	4	8	15mg/kg
325	163	4	8	25mg/kg
326	163	4	9	50mg/kg
327	164	4	9	100mg/kg
328	164	4	10	Según peso
329	165	4	10	0.5mg/kg
330	165	4	11	1mg/kg
331	166	4	11	2.5mg/kg
332	166	4	12	5mg/kg
333	167	4	12	10mg/kg
334	167	4	1	15mg/kg
335	168	4	1	25mg/kg
336	168	4	2	50mg/kg
337	169	4	2	100mg/kg
338	169	4	3	Según peso
339	170	4	3	0.5mg/kg
340	170	4	4	1mg/kg
341	171	4	4	2.5mg/kg
342	171	4	5	5mg/kg
343	172	4	5	10mg/kg
344	172	4	6	15mg/kg
345	173	4	6	25mg/kg
346	173	4	7	50mg/kg
347	174	4	7	100mg/kg
348	174	4	8	Según peso
349	175	4	8	0.5mg/kg
350	175	4	9	1mg/kg
351	176	4	9	2.5mg/kg
352	176	4	10	5mg/kg
353	177	4	10	10mg/kg
354	177	4	11	15mg/kg
355	178	4	11	25mg/kg
356	178	4	12	50mg/kg
357	179	4	12	100mg/kg
358	179	4	1	Según peso
359	180	4	1	0.5mg/kg
360	180	4	2	1mg/kg
361	181	4	2	2.5mg/kg
362	181	4	3	5mg/kg
363	182	4	3	10mg/kg
364	182	4	4	15mg/kg
365	183	4	4	25mg/kg
366	183	4	5	50mg/kg
367	184	4	5	100mg/kg
368	184	4	6	Según peso
369	185	4	6	0.5mg/kg
370	185	4	7	1mg/kg
371	186	4	7	2.5mg/kg
372	186	4	8	5mg/kg
373	187	4	8	10mg/kg
374	187	4	9	15mg/kg
375	188	4	9	25mg/kg
376	188	4	10	50mg/kg
377	189	4	10	100mg/kg
378	189	4	11	Según peso
379	190	4	11	0.5mg/kg
380	190	4	12	1mg/kg
381	191	4	12	2.5mg/kg
382	191	4	1	5mg/kg
383	192	4	1	10mg/kg
384	192	4	2	15mg/kg
385	193	4	2	25mg/kg
386	193	4	3	50mg/kg
387	194	4	3	100mg/kg
388	194	4	4	Según peso
389	195	4	4	0.5mg/kg
390	195	4	5	1mg/kg
391	196	4	5	2.5mg/kg
392	196	4	6	5mg/kg
393	197	4	6	10mg/kg
394	197	4	7	15mg/kg
395	198	4	7	25mg/kg
396	198	4	8	50mg/kg
397	199	4	8	100mg/kg
398	199	4	9	Según peso
399	200	4	9	0.5mg/kg
400	200	4	10	1mg/kg
401	201	4	10	2.5mg/kg
402	201	4	11	5mg/kg
403	202	4	11	10mg/kg
404	202	4	12	15mg/kg
405	203	4	12	25mg/kg
406	203	4	1	50mg/kg
407	204	4	1	100mg/kg
408	204	4	2	Según peso
409	205	4	2	0.5mg/kg
410	205	4	3	1mg/kg
411	206	4	3	2.5mg/kg
412	206	4	4	5mg/kg
413	207	4	4	10mg/kg
414	207	4	5	15mg/kg
415	208	4	5	25mg/kg
416	208	4	6	50mg/kg
417	209	4	6	100mg/kg
418	209	4	7	Según peso
419	210	4	7	0.5mg/kg
420	210	4	8	1mg/kg
421	211	4	8	2.5mg/kg
422	211	4	9	5mg/kg
423	212	4	9	10mg/kg
424	212	4	10	15mg/kg
425	213	4	10	25mg/kg
426	213	4	11	50mg/kg
427	214	4	11	100mg/kg
428	214	4	12	Según peso
429	215	4	12	0.5mg/kg
430	215	4	1	1mg/kg
431	216	4	1	2.5mg/kg
432	216	4	2	5mg/kg
433	217	4	2	10mg/kg
434	217	4	3	15mg/kg
435	218	4	3	25mg/kg
436	218	4	4	50mg/kg
437	219	4	4	100mg/kg
438	219	4	5	Según peso
439	220	4	5	0.5mg/kg
440	220	4	6	1mg/kg
441	221	4	6	2.5mg/kg
442	221	4	7	5mg/kg
443	222	4	7	10mg/kg
444	222	4	8	15mg/kg
445	223	4	8	25mg/kg
446	223	4	9	50mg/kg
447	224	4	9	100mg/kg
448	224	4	10	Según peso
449	225	4	10	0.5mg/kg
450	225	4	11	1mg/kg
451	226	4	11	2.5mg/kg
452	226	4	12	5mg/kg
453	227	4	12	10mg/kg
454	227	4	1	15mg/kg
455	228	4	1	25mg/kg
456	228	4	2	50mg/kg
457	229	4	2	100mg/kg
458	229	4	3	Según peso
459	230	4	3	0.5mg/kg
460	230	4	4	1mg/kg
461	231	4	4	2.5mg/kg
462	231	4	5	5mg/kg
463	232	4	5	10mg/kg
464	232	4	6	15mg/kg
465	233	4	6	25mg/kg
466	233	4	7	50mg/kg
467	234	4	7	100mg/kg
468	234	4	8	Según peso
469	235	4	8	0.5mg/kg
470	235	4	9	1mg/kg
471	236	4	9	2.5mg/kg
472	236	4	10	5mg/kg
473	237	4	10	10mg/kg
474	237	4	11	15mg/kg
475	238	4	11	25mg/kg
476	238	4	12	50mg/kg
477	239	4	12	100mg/kg
478	239	4	1	Según peso
479	240	4	1	0.5mg/kg
480	240	4	2	1mg/kg
481	241	4	2	2.5mg/kg
482	241	4	3	5mg/kg
483	242	4	3	10mg/kg
484	242	4	4	15mg/kg
485	243	4	4	25mg/kg
486	243	4	5	50mg/kg
487	244	4	5	100mg/kg
488	244	4	6	Según peso
489	245	4	6	0.5mg/kg
490	245	4	7	1mg/kg
491	246	4	7	2.5mg/kg
492	246	4	8	5mg/kg
493	247	4	8	10mg/kg
494	247	4	9	15mg/kg
495	248	4	9	25mg/kg
496	248	4	10	50mg/kg
497	249	4	10	100mg/kg
498	249	4	11	Según peso
499	250	4	11	0.5mg/kg
500	250	4	12	1mg/kg
501	251	4	12	2.5mg/kg
502	251	4	1	5mg/kg
503	252	4	1	10mg/kg
504	252	4	2	15mg/kg
505	253	4	2	25mg/kg
506	253	4	3	50mg/kg
507	254	4	3	100mg/kg
508	254	4	4	Según peso
509	255	4	4	0.5mg/kg
510	255	4	5	1mg/kg
511	256	4	5	2.5mg/kg
512	256	4	6	5mg/kg
513	257	4	6	10mg/kg
514	257	4	7	15mg/kg
515	258	4	7	25mg/kg
516	258	4	8	50mg/kg
517	259	4	8	100mg/kg
518	259	4	9	Según peso
519	260	4	9	0.5mg/kg
520	260	4	10	1mg/kg
521	261	4	10	2.5mg/kg
522	261	4	11	5mg/kg
523	262	4	11	10mg/kg
524	262	4	12	15mg/kg
525	263	4	12	25mg/kg
526	263	4	1	50mg/kg
527	264	4	1	100mg/kg
528	264	4	2	Según peso
529	265	4	2	0.5mg/kg
530	265	4	3	1mg/kg
531	266	4	3	2.5mg/kg
532	266	4	4	5mg/kg
533	267	4	4	10mg/kg
534	267	4	5	15mg/kg
535	268	4	5	25mg/kg
536	268	4	6	50mg/kg
537	269	4	6	100mg/kg
538	269	4	7	Según peso
539	270	4	7	0.5mg/kg
540	270	4	8	1mg/kg
541	271	4	8	2.5mg/kg
542	271	4	9	5mg/kg
543	272	4	9	10mg/kg
544	272	4	10	15mg/kg
545	273	4	10	25mg/kg
546	273	4	11	50mg/kg
547	274	4	11	100mg/kg
548	274	4	12	Según peso
549	275	4	12	0.5mg/kg
550	275	4	1	1mg/kg
551	276	4	1	2.5mg/kg
552	276	4	2	5mg/kg
553	277	4	2	10mg/kg
554	277	4	3	15mg/kg
555	278	4	3	25mg/kg
556	278	4	4	50mg/kg
557	279	4	4	100mg/kg
558	279	4	5	Según peso
559	280	4	5	0.5mg/kg
560	280	4	6	1mg/kg
561	281	4	6	2.5mg/kg
562	281	4	7	5mg/kg
563	282	4	7	10mg/kg
564	282	4	8	15mg/kg
565	283	4	8	25mg/kg
566	283	4	9	50mg/kg
567	284	4	9	100mg/kg
568	284	4	10	Según peso
569	285	4	10	0.5mg/kg
570	285	4	11	1mg/kg
571	286	4	11	2.5mg/kg
572	286	4	12	5mg/kg
573	287	4	12	10mg/kg
574	287	4	1	15mg/kg
575	288	4	1	25mg/kg
576	288	4	2	50mg/kg
577	289	4	2	100mg/kg
578	289	4	3	Según peso
579	290	4	3	0.5mg/kg
580	290	4	4	1mg/kg
581	291	4	4	2.5mg/kg
582	291	4	5	5mg/kg
583	292	4	5	10mg/kg
584	292	4	6	15mg/kg
585	293	4	6	25mg/kg
586	293	4	7	50mg/kg
587	294	4	7	100mg/kg
588	294	4	8	Según peso
589	295	4	8	0.5mg/kg
590	295	4	9	1mg/kg
591	296	4	9	2.5mg/kg
592	296	4	10	5mg/kg
593	297	4	10	10mg/kg
594	297	4	11	15mg/kg
595	298	4	11	25mg/kg
596	298	4	12	50mg/kg
597	299	4	12	100mg/kg
598	299	4	1	Según peso
599	300	4	1	0.5mg/kg
600	300	4	2	1mg/kg
601	301	4	2	2.5mg/kg
602	301	4	3	5mg/kg
603	302	4	3	10mg/kg
604	302	4	4	15mg/kg
605	303	4	4	25mg/kg
606	303	4	5	50mg/kg
607	304	4	5	100mg/kg
608	304	4	6	Según peso
609	305	4	6	0.5mg/kg
610	305	4	7	1mg/kg
611	306	4	7	2.5mg/kg
612	306	4	8	5mg/kg
613	307	4	8	10mg/kg
614	307	4	9	15mg/kg
615	308	4	9	25mg/kg
616	308	4	10	50mg/kg
617	309	4	10	100mg/kg
618	309	4	11	Según peso
619	310	4	11	0.5mg/kg
620	310	4	12	1mg/kg
621	311	4	12	2.5mg/kg
622	311	4	1	5mg/kg
623	312	4	1	10mg/kg
624	312	4	2	15mg/kg
625	313	4	2	25mg/kg
626	313	4	3	50mg/kg
627	314	4	3	100mg/kg
628	314	4	4	Según peso
629	315	4	4	0.5mg/kg
630	315	4	5	1mg/kg
631	316	4	5	2.5mg/kg
632	316	4	6	5mg/kg
633	317	4	6	10mg/kg
634	317	4	7	15mg/kg
635	318	4	7	25mg/kg
636	318	4	8	50mg/kg
637	319	4	8	100mg/kg
638	319	4	9	Según peso
639	320	4	9	0.5mg/kg
640	320	4	10	1mg/kg
641	321	4	10	2.5mg/kg
642	321	4	11	5mg/kg
643	322	4	11	10mg/kg
644	322	4	12	15mg/kg
645	323	4	12	25mg/kg
646	323	4	1	50mg/kg
647	324	4	1	100mg/kg
648	324	4	2	Según peso
649	325	4	2	0.5mg/kg
650	325	4	3	1mg/kg
651	326	4	3	2.5mg/kg
652	326	4	4	5mg/kg
653	327	4	4	10mg/kg
654	327	4	5	15mg/kg
655	328	4	5	25mg/kg
656	328	4	6	50mg/kg
657	329	4	6	100mg/kg
658	329	4	7	Según peso
659	330	4	7	0.5mg/kg
660	330	4	8	1mg/kg
661	331	4	8	2.5mg/kg
662	331	4	9	5mg/kg
663	332	4	9	10mg/kg
664	332	4	10	15mg/kg
665	333	4	10	25mg/kg
666	333	4	11	50mg/kg
667	334	4	11	100mg/kg
668	334	4	12	Según peso
669	335	4	12	0.5mg/kg
670	335	4	1	1mg/kg
671	336	4	1	2.5mg/kg
672	336	4	2	5mg/kg
673	337	4	2	10mg/kg
674	337	4	3	15mg/kg
675	338	4	3	25mg/kg
676	338	4	4	50mg/kg
677	339	4	4	100mg/kg
678	339	4	5	Según peso
679	340	4	5	0.5mg/kg
680	340	4	6	1mg/kg
681	341	4	6	2.5mg/kg
682	341	4	7	5mg/kg
683	342	4	7	10mg/kg
684	342	4	8	15mg/kg
685	343	4	8	25mg/kg
686	343	4	9	50mg/kg
687	344	4	9	100mg/kg
688	344	4	10	Según peso
689	345	4	10	0.5mg/kg
690	345	4	11	1mg/kg
691	346	4	11	2.5mg/kg
692	346	4	12	5mg/kg
693	347	4	12	10mg/kg
694	347	4	1	15mg/kg
695	348	4	1	25mg/kg
696	348	4	2	50mg/kg
697	349	4	2	100mg/kg
698	349	4	3	Según peso
699	350	4	3	0.5mg/kg
700	350	4	4	1mg/kg
701	351	4	4	2.5mg/kg
702	351	4	5	5mg/kg
703	352	4	5	10mg/kg
704	352	4	6	15mg/kg
705	353	4	6	25mg/kg
706	353	4	7	50mg/kg
707	354	4	7	100mg/kg
708	354	4	8	Según peso
709	355	4	8	0.5mg/kg
710	355	4	9	1mg/kg
711	356	4	9	2.5mg/kg
712	356	4	10	5mg/kg
713	357	4	10	10mg/kg
714	357	4	11	15mg/kg
715	358	4	11	25mg/kg
716	358	4	12	50mg/kg
717	359	4	12	100mg/kg
718	359	4	1	Según peso
719	360	4	1	0.5mg/kg
720	360	4	2	1mg/kg
721	361	4	2	2.5mg/kg
722	361	4	3	5mg/kg
723	362	4	3	10mg/kg
724	362	4	4	15mg/kg
725	363	4	4	25mg/kg
726	363	4	5	50mg/kg
727	364	4	5	100mg/kg
728	364	4	6	Según peso
729	365	4	6	0.5mg/kg
730	365	4	7	1mg/kg
731	366	4	7	2.5mg/kg
732	366	4	8	5mg/kg
733	367	4	8	10mg/kg
734	367	4	9	15mg/kg
735	368	4	9	25mg/kg
736	368	4	10	50mg/kg
737	369	4	10	100mg/kg
738	369	4	11	Según peso
739	370	4	11	0.5mg/kg
740	370	4	12	1mg/kg
741	371	4	12	2.5mg/kg
742	371	4	1	5mg/kg
743	372	4	1	10mg/kg
744	372	4	2	15mg/kg
745	373	4	2	25mg/kg
746	373	4	3	50mg/kg
747	374	4	3	100mg/kg
748	374	4	4	Según peso
749	375	4	4	0.5mg/kg
750	375	4	5	1mg/kg
751	376	4	5	2.5mg/kg
752	376	4	6	5mg/kg
753	377	4	6	10mg/kg
754	377	4	7	15mg/kg
755	378	4	7	25mg/kg
756	378	4	8	50mg/kg
757	379	4	8	100mg/kg
758	379	4	9	Según peso
759	380	4	9	0.5mg/kg
760	380	4	10	1mg/kg
761	381	4	10	2.5mg/kg
762	381	4	11	5mg/kg
763	382	4	11	10mg/kg
764	382	4	12	15mg/kg
765	383	4	12	25mg/kg
766	383	4	1	50mg/kg
767	384	4	1	100mg/kg
768	384	4	2	Según peso
769	385	4	2	0.5mg/kg
770	385	4	3	1mg/kg
771	386	4	3	2.5mg/kg
772	386	4	4	5mg/kg
773	387	4	4	10mg/kg
774	387	4	5	15mg/kg
775	388	4	5	25mg/kg
776	388	4	6	50mg/kg
777	389	4	6	100mg/kg
778	389	4	7	Según peso
779	390	4	7	0.5mg/kg
780	390	4	8	1mg/kg
781	391	4	8	2.5mg/kg
782	391	4	9	5mg/kg
783	392	4	9	10mg/kg
784	392	4	10	15mg/kg
785	393	4	10	25mg/kg
786	393	4	11	50mg/kg
787	394	4	11	100mg/kg
788	394	4	12	Según peso
789	395	4	12	0.5mg/kg
790	395	4	1	1mg/kg
791	396	4	1	2.5mg/kg
792	396	4	2	5mg/kg
793	397	4	2	10mg/kg
794	397	4	3	15mg/kg
795	398	4	3	25mg/kg
796	398	4	4	50mg/kg
797	399	4	4	100mg/kg
798	399	4	5	Según peso
799	400	4	5	0.5mg/kg
800	400	4	6	1mg/kg
801	401	4	6	2.5mg/kg
802	401	4	7	5mg/kg
803	402	4	7	10mg/kg
804	402	4	8	15mg/kg
805	403	4	8	25mg/kg
806	403	4	9	50mg/kg
807	404	4	9	100mg/kg
808	404	4	10	Según peso
809	405	4	10	0.5mg/kg
810	405	4	11	1mg/kg
811	406	4	11	2.5mg/kg
812	406	4	12	5mg/kg
813	407	4	12	10mg/kg
814	407	4	1	15mg/kg
815	408	4	1	25mg/kg
816	408	4	2	50mg/kg
817	409	4	2	100mg/kg
818	409	4	3	Según peso
819	410	4	3	0.5mg/kg
820	410	4	4	1mg/kg
821	411	4	4	2.5mg/kg
822	411	4	5	5mg/kg
823	412	4	5	10mg/kg
824	412	4	6	15mg/kg
825	413	4	6	25mg/kg
826	413	4	7	50mg/kg
827	414	4	7	100mg/kg
828	414	4	8	Según peso
829	415	4	8	0.5mg/kg
830	415	4	9	1mg/kg
831	416	4	9	2.5mg/kg
832	416	4	10	5mg/kg
833	417	4	10	10mg/kg
834	417	4	11	15mg/kg
835	418	4	11	25mg/kg
836	418	4	12	50mg/kg
837	419	4	12	100mg/kg
838	419	4	1	Según peso
839	420	4	1	0.5mg/kg
840	420	4	2	1mg/kg
841	421	4	2	2.5mg/kg
842	421	4	3	5mg/kg
843	422	4	3	10mg/kg
844	422	4	4	15mg/kg
845	423	4	4	25mg/kg
846	423	4	5	50mg/kg
847	424	4	5	100mg/kg
848	424	4	6	Según peso
849	425	4	6	0.5mg/kg
850	425	4	7	1mg/kg
851	426	4	7	2.5mg/kg
852	426	4	8	5mg/kg
853	427	4	8	10mg/kg
854	427	4	9	15mg/kg
855	428	4	9	25mg/kg
856	428	4	10	50mg/kg
857	429	4	10	100mg/kg
858	429	4	11	Según peso
859	430	4	11	0.5mg/kg
860	430	4	12	1mg/kg
861	431	4	12	2.5mg/kg
862	431	4	1	5mg/kg
863	432	4	1	10mg/kg
864	432	4	2	15mg/kg
865	433	4	2	25mg/kg
866	433	4	3	50mg/kg
867	434	4	3	100mg/kg
868	434	4	4	Según peso
869	435	4	4	0.5mg/kg
870	435	4	5	1mg/kg
871	436	4	5	2.5mg/kg
872	436	4	6	5mg/kg
873	437	4	6	10mg/kg
874	437	4	7	15mg/kg
875	438	4	7	25mg/kg
876	438	4	8	50mg/kg
877	439	4	8	100mg/kg
878	439	4	9	Según peso
879	440	4	9	0.5mg/kg
880	440	4	10	1mg/kg
881	441	4	10	2.5mg/kg
882	441	4	11	5mg/kg
883	442	4	11	10mg/kg
884	442	4	12	15mg/kg
885	443	4	12	25mg/kg
886	443	4	1	50mg/kg
887	444	4	1	100mg/kg
888	444	4	2	Según peso
889	445	4	2	0.5mg/kg
890	445	4	3	1mg/kg
891	446	4	3	2.5mg/kg
892	446	4	4	5mg/kg
893	447	4	4	10mg/kg
894	447	4	5	15mg/kg
895	448	4	5	25mg/kg
896	448	4	6	50mg/kg
897	449	4	6	100mg/kg
898	449	4	7	Según peso
899	450	4	7	0.5mg/kg
900	450	4	8	1mg/kg
901	451	4	8	2.5mg/kg
902	451	4	9	5mg/kg
903	452	4	9	10mg/kg
904	452	4	10	15mg/kg
905	453	4	10	25mg/kg
906	453	4	11	50mg/kg
907	454	4	11	100mg/kg
908	454	4	12	Según peso
909	455	4	12	0.5mg/kg
910	455	4	1	1mg/kg
911	456	4	1	2.5mg/kg
912	456	4	2	5mg/kg
913	457	4	2	10mg/kg
914	457	4	3	15mg/kg
915	458	4	3	25mg/kg
916	458	4	4	50mg/kg
917	459	4	4	100mg/kg
918	459	4	5	Según peso
919	460	4	5	0.5mg/kg
920	460	4	6	1mg/kg
921	461	4	6	2.5mg/kg
922	461	4	7	5mg/kg
923	462	4	7	10mg/kg
924	462	4	8	15mg/kg
925	463	4	8	25mg/kg
926	463	4	9	50mg/kg
927	464	4	9	100mg/kg
928	464	4	10	Según peso
929	465	4	10	0.5mg/kg
930	465	4	11	1mg/kg
931	466	4	11	2.5mg/kg
932	466	4	12	5mg/kg
933	467	4	12	10mg/kg
934	467	4	1	15mg/kg
935	468	4	1	25mg/kg
936	468	4	2	50mg/kg
937	469	4	2	100mg/kg
938	469	4	3	Según peso
939	470	4	3	0.5mg/kg
940	470	4	4	1mg/kg
941	471	4	4	2.5mg/kg
942	471	4	5	5mg/kg
943	472	4	5	10mg/kg
944	472	4	6	15mg/kg
945	473	4	6	25mg/kg
946	473	4	7	50mg/kg
947	474	4	7	100mg/kg
948	474	4	8	Según peso
949	475	4	8	0.5mg/kg
950	475	4	9	1mg/kg
951	476	4	9	2.5mg/kg
952	476	4	10	5mg/kg
953	477	4	10	10mg/kg
954	477	4	11	15mg/kg
955	478	4	11	25mg/kg
956	478	4	12	50mg/kg
957	479	4	12	100mg/kg
958	479	4	1	Según peso
959	480	4	1	0.5mg/kg
960	480	4	2	1mg/kg
961	481	4	2	2.5mg/kg
962	481	4	3	5mg/kg
963	482	4	3	10mg/kg
964	482	4	4	15mg/kg
965	483	4	4	25mg/kg
966	483	4	5	50mg/kg
967	484	4	5	100mg/kg
968	484	4	6	Según peso
969	485	4	6	0.5mg/kg
970	485	4	7	1mg/kg
971	486	4	7	2.5mg/kg
972	486	4	8	5mg/kg
973	487	4	8	10mg/kg
974	487	4	9	15mg/kg
975	488	4	9	25mg/kg
976	488	4	10	50mg/kg
977	489	4	10	100mg/kg
978	489	4	11	Según peso
979	490	4	11	0.5mg/kg
980	490	4	12	1mg/kg
981	491	4	12	2.5mg/kg
982	491	4	1	5mg/kg
983	492	4	1	10mg/kg
984	492	4	2	15mg/kg
985	493	4	2	25mg/kg
986	493	4	3	50mg/kg
987	494	4	3	100mg/kg
988	494	4	4	Según peso
989	495	4	4	0.5mg/kg
990	495	4	5	1mg/kg
991	496	4	5	2.5mg/kg
992	496	4	6	5mg/kg
993	497	4	6	10mg/kg
994	497	4	7	15mg/kg
995	498	4	7	25mg/kg
996	498	4	8	50mg/kg
997	499	4	8	100mg/kg
998	499	4	9	Según peso
999	500	4	9	0.5mg/kg
1000	500	4	10	1mg/kg
1001	501	4	10	2.5mg/kg
1002	501	4	11	5mg/kg
1003	502	4	11	10mg/kg
1004	502	4	12	15mg/kg
1005	503	4	12	25mg/kg
1006	503	4	1	50mg/kg
1007	504	4	1	100mg/kg
1008	504	4	2	Según peso
1009	505	4	2	0.5mg/kg
1010	505	4	3	1mg/kg
1011	506	4	3	2.5mg/kg
1012	506	4	4	5mg/kg
1013	507	4	4	10mg/kg
1014	507	4	5	15mg/kg
1015	508	4	5	25mg/kg
1016	508	4	6	50mg/kg
1017	509	4	6	100mg/kg
1018	509	4	7	Según peso
1019	510	4	7	0.5mg/kg
1020	510	4	8	1mg/kg
1021	511	4	8	2.5mg/kg
1022	511	4	9	5mg/kg
1023	512	4	9	10mg/kg
1024	512	4	10	15mg/kg
1025	513	4	10	25mg/kg
1026	513	4	11	50mg/kg
1027	514	4	11	100mg/kg
1028	514	4	12	Según peso
1029	515	4	12	0.5mg/kg
1030	515	4	1	1mg/kg
1031	516	4	1	2.5mg/kg
1032	516	4	2	5mg/kg
1033	517	4	2	10mg/kg
1034	517	4	3	15mg/kg
1035	518	4	3	25mg/kg
1036	518	4	4	50mg/kg
1037	519	4	4	100mg/kg
1038	519	4	5	Según peso
1039	520	4	5	0.5mg/kg
1040	520	4	6	1mg/kg
1041	521	4	6	2.5mg/kg
1042	521	4	7	5mg/kg
1043	522	4	7	10mg/kg
1044	522	4	8	15mg/kg
1045	523	4	8	25mg/kg
1046	523	4	9	50mg/kg
1047	524	4	9	100mg/kg
1048	524	4	10	Según peso
1049	525	4	10	0.5mg/kg
1050	525	4	11	1mg/kg
1051	526	4	11	2.5mg/kg
1052	526	4	12	5mg/kg
1053	527	4	12	10mg/kg
1054	527	4	1	15mg/kg
1055	528	4	1	25mg/kg
1056	528	4	2	50mg/kg
1057	529	4	2	100mg/kg
1058	529	4	3	Según peso
1059	530	4	3	0.5mg/kg
1060	530	4	4	1mg/kg
1061	531	4	4	2.5mg/kg
1062	531	4	5	5mg/kg
1063	532	4	5	10mg/kg
1064	532	4	6	15mg/kg
1065	533	4	6	25mg/kg
1066	533	4	7	50mg/kg
1067	534	4	7	100mg/kg
1068	534	4	8	Según peso
1069	535	4	8	0.5mg/kg
1070	535	4	9	1mg/kg
1071	536	4	9	2.5mg/kg
1072	536	4	10	5mg/kg
1073	537	4	10	10mg/kg
1074	537	4	11	15mg/kg
1075	538	4	11	25mg/kg
1076	538	4	12	50mg/kg
1077	539	4	12	100mg/kg
1078	539	4	1	Según peso
1079	540	4	1	0.5mg/kg
1080	540	4	2	1mg/kg
1081	541	4	2	2.5mg/kg
1082	541	4	3	5mg/kg
1083	542	4	3	10mg/kg
1084	542	4	4	15mg/kg
1085	543	4	4	25mg/kg
1086	543	4	5	50mg/kg
1087	544	4	5	100mg/kg
1088	544	4	6	Según peso
1089	545	4	6	0.5mg/kg
1090	545	4	7	1mg/kg
1091	546	4	7	2.5mg/kg
1092	546	4	8	5mg/kg
1093	547	4	8	10mg/kg
1094	547	4	9	15mg/kg
1095	548	4	9	25mg/kg
1096	548	4	10	50mg/kg
1097	549	4	10	100mg/kg
1098	549	4	11	Según peso
1099	550	4	11	0.5mg/kg
1100	550	4	12	1mg/kg
1101	551	4	12	2.5mg/kg
1102	551	4	1	5mg/kg
1103	552	4	1	10mg/kg
1104	552	4	2	15mg/kg
1105	553	4	2	25mg/kg
1106	553	4	3	50mg/kg
1107	554	4	3	100mg/kg
1108	554	4	4	Según peso
1109	555	4	4	0.5mg/kg
1110	555	4	5	1mg/kg
1111	556	4	5	2.5mg/kg
1112	556	4	6	5mg/kg
1113	557	4	6	10mg/kg
1114	557	4	7	15mg/kg
1115	558	4	7	25mg/kg
1116	558	4	8	50mg/kg
1117	559	4	8	100mg/kg
1118	559	4	9	Según peso
1119	560	4	9	0.5mg/kg
1120	560	4	10	1mg/kg
1121	561	4	10	2.5mg/kg
1122	561	4	11	5mg/kg
1123	562	4	11	10mg/kg
1124	562	4	12	15mg/kg
1125	563	4	12	25mg/kg
1126	563	4	1	50mg/kg
1127	564	4	1	100mg/kg
1128	564	4	2	Según peso
1129	565	4	2	0.5mg/kg
1130	565	4	3	1mg/kg
1131	566	4	3	2.5mg/kg
1132	566	4	4	5mg/kg
1133	567	4	4	10mg/kg
1134	567	4	5	15mg/kg
1135	568	4	5	25mg/kg
1136	568	4	6	50mg/kg
1137	569	4	6	100mg/kg
1138	569	4	7	Según peso
1139	570	4	7	0.5mg/kg
1140	570	4	8	1mg/kg
1141	571	4	8	2.5mg/kg
1142	571	4	9	5mg/kg
1143	572	4	9	10mg/kg
1144	572	4	10	15mg/kg
1145	573	4	10	25mg/kg
1146	573	4	11	50mg/kg
1147	574	4	11	100mg/kg
1148	574	4	12	Según peso
1149	575	4	12	0.5mg/kg
1150	575	4	1	1mg/kg
1151	576	4	1	2.5mg/kg
1152	576	4	2	5mg/kg
1153	577	4	2	10mg/kg
1154	577	4	3	15mg/kg
1155	578	4	3	25mg/kg
1156	578	4	4	50mg/kg
1157	579	4	4	100mg/kg
1158	579	4	5	Según peso
1159	580	4	5	0.5mg/kg
1160	580	4	6	1mg/kg
1161	581	4	6	2.5mg/kg
1162	581	4	7	5mg/kg
1163	582	4	7	10mg/kg
1164	582	4	8	15mg/kg
1165	583	4	8	25mg/kg
1166	583	4	9	50mg/kg
1167	584	4	9	100mg/kg
1168	584	4	10	Según peso
1169	585	4	10	0.5mg/kg
1170	585	4	11	1mg/kg
1171	586	4	11	2.5mg/kg
1172	586	4	12	5mg/kg
1173	587	4	12	10mg/kg
1174	587	4	1	15mg/kg
1175	588	4	1	25mg/kg
1176	588	4	2	50mg/kg
1177	589	4	2	100mg/kg
1178	589	4	3	Según peso
1179	590	4	3	0.5mg/kg
1180	590	4	4	1mg/kg
1181	591	4	4	2.5mg/kg
1182	591	4	5	5mg/kg
1183	592	4	5	10mg/kg
1184	592	4	6	15mg/kg
1185	593	4	6	25mg/kg
1186	593	4	7	50mg/kg
1187	594	4	7	100mg/kg
1188	594	4	8	Según peso
1189	595	4	8	0.5mg/kg
1190	595	4	9	1mg/kg
1191	596	4	9	2.5mg/kg
1192	596	4	10	5mg/kg
1193	597	4	10	10mg/kg
1194	597	4	11	15mg/kg
1195	598	4	11	25mg/kg
1196	598	4	12	50mg/kg
1197	599	4	12	100mg/kg
1198	599	4	1	Según peso
1199	600	4	1	0.5mg/kg
1200	600	4	2	1mg/kg
1201	601	4	2	2.5mg/kg
1202	601	4	3	5mg/kg
1203	602	4	3	10mg/kg
1204	602	4	4	15mg/kg
1205	603	4	4	25mg/kg
1206	603	4	5	50mg/kg
1207	604	4	5	100mg/kg
1208	604	4	6	Según peso
1209	605	4	6	0.5mg/kg
1210	605	4	7	1mg/kg
1211	606	4	7	2.5mg/kg
1212	606	4	8	5mg/kg
1213	607	4	8	10mg/kg
1214	607	4	9	15mg/kg
1215	608	4	9	25mg/kg
1216	608	4	10	50mg/kg
1217	609	4	10	100mg/kg
1218	609	4	11	Según peso
1219	610	4	11	0.5mg/kg
1220	610	4	12	1mg/kg
1221	611	4	12	2.5mg/kg
1222	611	4	1	5mg/kg
1223	612	4	1	10mg/kg
1224	612	4	2	15mg/kg
1225	613	4	2	25mg/kg
1226	613	4	3	50mg/kg
1227	614	4	3	100mg/kg
1228	614	4	4	Según peso
1229	615	4	4	0.5mg/kg
1230	615	4	5	1mg/kg
1231	616	4	5	2.5mg/kg
1232	616	4	6	5mg/kg
1233	617	4	6	10mg/kg
1234	617	4	7	15mg/kg
1235	618	4	7	25mg/kg
1236	618	4	8	50mg/kg
1237	619	4	8	100mg/kg
1238	619	4	9	Según peso
1239	620	4	9	0.5mg/kg
1240	620	4	10	1mg/kg
1241	621	4	10	2.5mg/kg
1242	621	4	11	5mg/kg
1243	622	4	11	10mg/kg
1244	622	4	12	15mg/kg
1245	623	4	12	25mg/kg
1246	623	4	1	50mg/kg
1247	624	4	1	100mg/kg
1248	624	4	2	Según peso
1249	625	4	2	0.5mg/kg
1250	625	4	3	1mg/kg
1251	626	4	3	2.5mg/kg
1252	626	4	4	5mg/kg
1253	627	4	4	10mg/kg
1254	627	4	5	15mg/kg
1255	628	4	5	25mg/kg
1256	628	4	6	50mg/kg
1257	629	4	6	100mg/kg
1258	629	4	7	Según peso
1259	630	4	7	0.5mg/kg
1260	630	4	8	1mg/kg
1261	631	4	8	2.5mg/kg
1262	631	4	9	5mg/kg
1263	632	4	9	10mg/kg
1264	632	4	10	15mg/kg
1265	633	4	10	25mg/kg
1266	633	4	11	50mg/kg
1267	634	4	11	100mg/kg
1268	634	4	12	Según peso
1269	635	4	12	0.5mg/kg
1270	635	4	1	1mg/kg
1271	636	4	1	2.5mg/kg
1272	636	4	2	5mg/kg
1273	637	4	2	10mg/kg
1274	637	4	3	15mg/kg
1275	638	4	3	25mg/kg
1276	638	4	4	50mg/kg
1277	639	4	4	100mg/kg
1278	639	4	5	Según peso
1279	640	4	5	0.5mg/kg
1280	640	4	6	1mg/kg
1281	641	4	6	2.5mg/kg
1282	641	4	7	5mg/kg
1283	642	4	7	10mg/kg
1284	642	4	8	15mg/kg
1285	643	4	8	25mg/kg
1286	643	4	9	50mg/kg
1287	644	4	9	100mg/kg
1288	644	4	10	Según peso
1289	645	4	10	0.5mg/kg
1290	645	4	11	1mg/kg
1291	646	4	11	2.5mg/kg
1292	646	4	12	5mg/kg
1293	647	4	12	10mg/kg
1294	647	4	1	15mg/kg
1295	648	4	1	25mg/kg
1296	648	4	2	50mg/kg
1297	649	4	2	100mg/kg
1298	649	4	3	Según peso
1299	650	4	3	0.5mg/kg
1300	650	4	4	1mg/kg
1301	651	4	4	2.5mg/kg
1302	651	4	5	5mg/kg
1303	652	4	5	10mg/kg
1304	652	4	6	15mg/kg
1305	653	4	6	25mg/kg
1306	653	4	7	50mg/kg
1307	654	4	7	100mg/kg
1308	654	4	8	Según peso
1309	655	4	8	0.5mg/kg
1310	655	4	9	1mg/kg
1311	656	4	9	2.5mg/kg
1312	656	4	10	5mg/kg
1313	657	4	10	10mg/kg
1314	657	4	11	15mg/kg
1315	658	4	11	25mg/kg
1316	658	4	12	50mg/kg
1317	659	4	12	100mg/kg
1318	659	4	1	Según peso
1319	660	4	1	0.5mg/kg
1320	660	4	2	1mg/kg
1321	661	4	2	2.5mg/kg
1322	661	4	3	5mg/kg
1323	662	4	3	10mg/kg
1324	662	4	4	15mg/kg
1325	663	4	4	25mg/kg
1326	663	4	5	50mg/kg
1327	664	4	5	100mg/kg
1328	664	4	6	Según peso
1329	665	4	6	0.5mg/kg
1330	665	4	7	1mg/kg
1331	666	4	7	2.5mg/kg
1332	666	4	8	5mg/kg
1333	667	4	8	10mg/kg
1334	667	4	9	15mg/kg
1335	668	4	9	25mg/kg
1336	668	4	10	50mg/kg
1337	669	4	10	100mg/kg
1338	669	4	11	Según peso
1339	670	4	11	0.5mg/kg
1340	670	4	12	1mg/kg
1341	671	4	12	2.5mg/kg
1342	671	4	1	5mg/kg
1343	672	4	1	10mg/kg
1344	672	4	2	15mg/kg
1345	673	4	2	25mg/kg
1346	673	4	3	50mg/kg
1347	674	4	3	100mg/kg
1348	674	4	4	Según peso
1349	675	4	4	0.5mg/kg
1350	675	4	5	1mg/kg
1351	676	4	5	2.5mg/kg
1352	676	4	6	5mg/kg
1353	677	4	6	10mg/kg
1354	677	4	7	15mg/kg
1355	678	4	7	25mg/kg
1356	678	4	8	50mg/kg
1357	679	4	8	100mg/kg
1358	679	4	9	Según peso
1359	680	4	9	0.5mg/kg
1360	680	4	10	1mg/kg
1361	681	4	10	2.5mg/kg
1362	681	4	11	5mg/kg
1363	682	4	11	10mg/kg
1364	682	4	12	15mg/kg
1365	683	4	12	25mg/kg
1366	683	4	1	50mg/kg
1367	684	4	1	100mg/kg
1368	684	4	2	Según peso
1369	685	4	2	0.5mg/kg
1370	685	4	3	1mg/kg
1371	686	4	3	2.5mg/kg
1372	686	4	4	5mg/kg
1373	687	4	4	10mg/kg
1374	687	4	5	15mg/kg
1375	688	4	5	25mg/kg
1376	688	4	6	50mg/kg
1377	689	4	6	100mg/kg
1378	689	4	7	Según peso
1379	690	4	7	0.5mg/kg
1380	690	4	8	1mg/kg
1381	691	4	8	2.5mg/kg
1382	691	4	9	5mg/kg
1383	692	4	9	10mg/kg
1384	692	4	10	15mg/kg
1385	693	4	10	25mg/kg
1386	693	4	11	50mg/kg
1387	694	4	11	100mg/kg
1388	694	4	12	Según peso
1389	695	4	12	0.5mg/kg
1390	695	4	1	1mg/kg
1391	696	4	1	2.5mg/kg
1392	696	4	2	5mg/kg
1393	697	4	2	10mg/kg
1394	697	4	3	15mg/kg
1395	698	4	3	25mg/kg
1396	698	4	4	50mg/kg
1397	699	4	4	100mg/kg
1398	699	4	5	Según peso
1399	700	4	5	0.5mg/kg
1400	700	4	6	1mg/kg
\.


--
-- Data for Name: cat_agentes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cat_agentes (id_agente, nombre_agente, tipo_agente) FROM stdin;
\.


--
-- Data for Name: cat_asentamientos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cat_asentamientos (id_asenta, codigop_fk, id_tipo_asenta_fk, d_asenta) FROM stdin;
2717	7164	9	Graciano Sánchez
486	2980	9	Arenal
2275	14749	9	Chimilli
2623	3023	9	Narvarte Oriente
8456	50260	21	Villas Fontana
786	5320	9	El Yaqui
3528	55070	21	Jardines de Morelos Sección Bosques
3432	55020	2	El Calvario
6287	55067	9	El Hoyo del Tepetate
204	1460	9	Alfonso XIII
2	16210	9	Pueblo Santiago Tepalcatlalpan U.H. Res. Santiago
2263	14720	9	Belvedere Ajusco
2099	14250	9	Miguel Hidalgo 3A Sección
330	1810	9	Villa Verdún
123	1270	9	Golondrinas
482	2940	9	Porvenir
1285	8770	9	Los Picos de Iztacalco Sección 1A
5689	50245	31	Campo Real
914	6450	9	Atlampa
2313	15350	9	Ampliación Penitenciaria
1426	9440	9	San Andrés Tetepilco
97	1230	9	Los Gamitos
8363	50265	9	Guadalupe
8401	50255	9	Linda Vista
371	2070	9	Del Recreo
5659	55414	9	Lomas Verdes Tlaljuyaca
1552	9820	9	El Santuario
106	1250	9	Lomas de Nuevo México
2188	14420	9	Cumbres de Tepetongo
153	1296	9	Ampliación Jalalpa
3518	55067	9	Ciudad Cuauhtémoc Sección Tonatiuh
4930	55025	31	Galaxia Ecatepec
8345	50290	9	Tejocote
803	5500	9	Contadero
1867	11870	9	Tacubaya
1465	9640	9	Xalpa
94	1520	9	Ampliación Los Pirules
2011	12110	9	La Conchita
12	55415	9	Buenos Aires
6230	55410	9	El Ostor
240	50075	21	Las Torres
1580	9849	9	Ampliación Los Reyes
362	50230	28	San José Guadalupe Otzacatipan
5536	50285	9	Ojo de Agua
2503	16776	9	Santiaguito
2863	9630	9	San Miguel Teotongo Sección Torres
2745	1618	9	Ex-Hacienda de Tarango
4571	57310	9	Tamaulipas Sección Las Flores
2114	14300	9	Residencial Acoxpa
28	55070	9	Ampliación 19 de Septiembre
5552	50200	9	Barrio San Gabriel
697	4830	9	Los Cipreses
25	1090	2	La Otra Banda
2872	12950	2	La Lupita Xolco
886	6170	9	Hipódromo Condesa
1142	7630	9	San José de la Escalera
4958	55100	21	Primero de Mayo
665	4530	9	Insurgentes Cuicuilco
3744	55390	9	San Miguel Xalostoc
1959	13278	9	Villa Centroamericana
1227	7119	9	Ampliación Malacates
94	55090	21	El Potrero
3500	55064	9	Ciudad Cuauhtémoc Sección Nopalera I y II
3495	55050	31	Rinconada San Martín
8397	50254	9	El Frontón
2289	15010	9	Valentín Gómez Farias
2495	16720	9	Del Carmen
6240	55430	31	Junta de San Juan
391	2130	9	Tierra Nueva
2468	16429	9	Rancho Tejomulco
1721	10700	9	Héroes de Padierna
380	50209	1	Toluca (Licenciado Adolfo López Mateos)
2305	15300	9	20 de Noviembre
8338	50283	2	Los Cipreses
2386	16010	9	Las Peritas
799	5379	9	Lomas de San Pedro
375	50226	28	San Pedro Totoltepec
505	3230	9	Actipan
4807	55020	31	La Monera
2504	16780	9	Cerrillos Primera Sección
3605	55148	9	Villas de Aragón
787	5330	9	Lomas de Memetla
1383	9310	9	Leyes de Reforma 2a Sección
8340	50284	9	El Calvario
1540	9800	2	San Simón Culhuacán
323	1789	9	Miguel Hidalgo
8342	50290	2	Del Pozo
2460	16320	9	San Lucas Oriente
2237	14630	28	Chimalcoyoc
1991	13530	9	La Asunción
2340	15630	9	Caracol
2210	14449	9	El Mirador 3A Sección
2602	16780	9	El Sacrificio
238	1540	9	Balcones de Cehuayo
3769	55415	9	El Almarcigo Sur
1314	9030	9	Paseos de Churubusco
1514	9750	9	La Polvorilla
2409	16038	9	Ampliación San Marcos Norte
1932	13070	2	San Miguel
1417	9429	9	Purísima Atlazolpa
3785	55490	9	Faja de Oro
2195	14426	9	Tlaxcaltenco la Mesa
1304	9000	2	San Pedro
141	1280	9	La Joya
89	55415	9	Mexihuiloya
2157	14370	28	San Lorenzo Huipulco
561	3930	9	Merced Gómez
365	2050	28	Santa María Malinalco
4761	55010	12	Villa Esmeralda
2565	9500	9	Santa María Aztahuacán Ampliación
1696	10369	9	Ampliación Lomas de San Bernabé
1995	13549	9	Peña Alta
526	3520	9	Iztaccihuatl
2498	16739	9	San Isidro
2184	14409	9	Tecorral
6976	50260	9	El Pacífico
1695	10368	9	Ampliación Potrerillo
28	1090	28	Tizapan
3629	55210	9	La Popular
723	4929	9	Las Campanas
241	1540	9	Punta de Cehuaya
3658	55244	9	Paseos de Aragón
201	50020	9	3 Caminos
10	1030	9	Florida
8403	50255	9	Loma Bonita
224	50050	2	El Cóporo
1294	8910	2	Santa Cruz
25	55030	9	Chula Vista
4710	55023	21	Los Héroes Ecatepec Sección I
165	50010	9	Guadalupe
8347	50290	9	Tanamato
5542	50010	21	Galaxias de San Lorenzo
6286	55064	21	Vistas de Ecatepec (Sección A)
272	50110	9	Guadalupe San Buenaventura
3545	55087	9	Lomas de San Carlos Zona Comunal
6467	50210	21	Valle de la Hacienda
404	2310	9	Ferrería
863	6050	9	Centro (Área 5)
2187	14219	17	Parque Nacional Bosque del Pedregal
1023	7130	9	Compositores Mexicanos
906	6350	9	Buenavista
394	2160	28	Santo Domingo
5554	50200	9	Armando Neyra Chavez
6232	55418	9	Mexicalco II y IV
8418	50257	9	La Joya de Ignacio Esquivel
1776	11290	9	San Diego Ocoyoacac
8947	50228	21	Las Fuentes del Ordal
1024	7130	9	El Tepetatal
93	1276	9	El Pirul
1998	13550	9	Potrero del Llano
1	5790	9	Puerto Las Cruces
487	2980	9	Patrimonio Familiar
8465	50290	2	La Granja
3768	55415	9	El Almarcigo Norte
66	55050	21	La Pradera
1143	7640	9	Santiago Atepetlac
1799	11440	9	Reforma Pensil
2421	16060	9	El Mirador
9094	50010	21	Gran Morada
1732	10830	9	La Concepción
1889	12070	2	San Agustin
2350	15710	9	Industrial Puerto Aéreo
357	2010	9	San Rafael
87	1220	9	El Cuernito
1768	11250	9	10 de Abril
1042	7199	9	Del Carmen
1299	9000	2	La Asunción
1202	7920	9	El Olivo
1881	12000	2	San Mateo
1065	7268	9	Solidaridad Nacional
1407	9400	28	San Juanico Nextipac
2309	15320	9	Azteca
2096	14248	9	Cruz del Farol
3797	55516	9	Boca Barranca
4621	57800	9	Esperanza
6245	55429	9	La Cuesta Santa Clara
6974	50206	15	La Loma Cuexcontitlán
2158	14370	9	Villa Lázaro Cárdenas
6196	55010	9	El Manchon
118	1269	9	2a Sección Cañada
209	50280	9	Santiago Tlaxomulco Centro
706	4870	9	Espartaco
2287	15000	9	General Ignacio Zaragoza
6300	55066	9	México Nuevo
8339	50284	9	Los Pocitos
3730	55330	9	Ampliación San Francisco Xalostoc
1218	7979	9	San Juan de Aragón IV Sección
2101	14250	9	Miguel Hidalgo
1541	9800	2	Tula
160	50000	9	Toluca de Lerdo Centro
4810	55023	21	Los Héroes Ecatepec Sección IV
1029	7140	9	Forestal I
3714	55308	9	Benito Juárez Xalostoc Norte
237	50070	9	Meteoro
847	6010	9	Centro (Área 2)
3776	55420	37	Cerro Gordo
102	1239	9	La Huerta
3532	55070	21	Jardines de Morelos Sección Ríos
2395	16020	9	San Juan Tepepan
5556	50225	21	Geovillas Centenario
8967	57103	9	Polígono del Bordo de Xochiaca
258	50100	21	La Ribera II
2240	14640	9	Ejidos de San Pedro Mártir
8326	50280	9	El Tepetate
324	1790	9	Lomas de los Ángeles del Pueblo Tetelpan
5610	55295	9	Franja Valle de Guadalupe
46	1120	9	Hidalgo
18	55070	21	Colonial Ecatepec
3561	55104	9	Granjas Populares Guadalupe Tulpetlac
3499	55063	9	Ciudad Cuauhtémoc Sección Chiconautla 3000
1410	9410	28	Aculco
3671	55266	9	México Insurgente
2910	16614	2	Niños Héroes
8471	50294	31	Villas los Ángeles
394	50255	9	San Juan Tilapa Centro
3529	55070	21	Jardines de Morelos Sección Lagos
8394	50254	9	Tlala
4550	57139	9	Plazas de Aragón
353	2000	9	Centro de Azcapotzalco
1846	11619	17	Campo Militar 1
2901	16513	2	Del Puente
1777	11300	9	Verónica Anzures
5080	55120	21	Ciudad Azteca Sección Oriente
651	4440	9	Culhuacán CTM Sección V
2044	14049	9	Comuneros de Santa Úrsula
3556	55090	9	Obrera Jajalpa
5484	50210	21	Ex Hacienda San José
1063	7259	9	Ampliación Benito Juárez
166	50010	9	La Cruz Comalco
2907	16605	2	Los Reyes
2904	16514	2	Calpulco
4615	57730	9	Metropolitana Primera Sección
175	50200	28	San Cristóbal Huichochitlán
2491	16640	2	San Juan Minas
2510	16800	28	San Mateo Xalpa
2332	15530	9	Moctezuma 2a Sección
171	1376	9	Santa Fe
2622	3104	9	Del Valle Sur
2682	1376	9	Santa Fe Peña Blanca
5117	50210	21	Los Sauces III
1814	11490	9	Cuauhtémoc Pensil
323	50160	21	Villas de Santa Ana III
12	50210	21	Paseo Arboleda
1703	10500	9	Barrio San Francisco
1578	9840	28	Los Reyes Culhuacán
1571	9838	9	Plan de Iguala
2885	7144	9	Forestal II
1527	9780	9	Año de Juárez
3565	55100	21	Industrias Ecatepec
788	5330	9	Memetla
1056	7240	9	El Arbolillo
1220	7980	9	Narciso Bassols
1012	7089	9	Ampliación Gabriel Hernández
2301	15270	9	Morelos
709	4890	9	Los Olivos
3474	55040	2	San Juan Alcahuacan
6978	50295	9	San Carlos Autopan
3600	55139	9	Campiñas de Aragón
367	50206	28	San Diego Linares
3421	55000	31	Ecatepec Centro
469	2810	9	Ignacio Allende
4956	55100	9	Viviendas Venta de Carpio
2150	14357	9	Prado Coapa 3A Sección
1006	7069	9	Triunfo de La República
43	55050	9	El Salado
3634	55220	9	Jardines del Tepeyac
5543	50070	31	Fidel Velázquez
2046	14060	9	Peña Pobre
4616	57739	9	San Lorenzo
197	50020	21	Rinconada de la Mora
769	5220	9	Tepetongo
2811	4440	9	Culhuacán CTM Sección I
6977	50295	2	San Carlos
454	2719	9	Ampliación San Pedro Xalpa
2401	16030	9	Huichapan
4	14735	9	Lomas de Cuilotepec II Sección
2327	15470	9	Miguel Hidalgo
18	50280	28	San Marcos Yachihuacaltepec
7874	57718	9	Ampliación General José Vicente Villada Súper 44
283	1700	9	Ocotillos del Pueblo Tetelpan
282	1700	9	La Joyita del Pueblo Tetelpan
4623	57810	9	Izcalli Nezahualcóyotl
1071	7290	9	La Pastora
3682	55269	9	México Prehispánico II
1879	12000	2	Los Ángeles
338	50170	9	El Seminario 4a Sección
191	50020	21	Bosques de la Mora
2311	15339	9	Ampliación Venustiano Carranza
1200	7918	9	San Juan de Aragón VI Sección
2196	14427	9	San Juan Tepeximilpa
265	1610	9	Colinas de Tarango
6258	55129	9	Josefa Ortiz de Domínguez
1439	9520	9	El Edén
6219	55070	9	Sol II
447	2670	9	Cosmopolita
1586	9850	9	San Juan Xalpa
1524	9770	9	Puente Blanco
1951	13219	9	Ampliación Los Olivos
1019	7109	9	San Antonio
6	1020	9	Guadalupe Inn
5607	55118	9	Colonos de México (Alfredo Torres Martínez)
2342	15640	9	Arenal 4a Sección
5697	50228	21	Arboleda
1613	9870	28	San Andrés Tomatlán
1192	7889	9	Emiliano Zapata
1095	7360	9	San Pedro Zacatenco
2172	14389	9	Arenal de Guadalupe
6248	55548	9	Cantera Guadalupana
396	2200	9	Reynosa Tamaulipas
163	1310	9	San Gabriel
4917	55010	21	Barrio Nuevo Tultitlán
2008	13640	2	San Miguel
306	1750	9	Las Águilas 2o Parque
170	1340	9	Bejero del Pueblo Santa Fe
246	1550	9	Ampliación Tepeaca
5699	50226	21	Hacienda La Galia
4631	57820	9	La Perla
1148	7700	9	Nueva Industrial Vallejo
462	2760	9	Industrial San Antonio
1252	8220	2	San Pedro
955	6720	9	Doctores
1923	13010	9	Santa Cecilia
825	5730	9	Xalpa
8432	50228	10	Las Fuentes
3448	55030	2	Doce de Diciembre
8422	50258	9	El Chamizal
660	4500	9	Jardines del Pedregal de San Ángel
3763	55414	9	El Parque
6247	55530	31	El Gallito
6303	50228	31	Geovillas los Cedros
4642	57920	9	Santa Martha
3722	55320	37	Esfuerzo Nacional
2889	7755	9	Lindavista Vallejo II Sección
8359	50100	2	Tlanepantla
4607	57630	9	Romero
249	1560	9	Canutillo
1620	9880	9	El Vergel
3482	55050	9	Gustavo Baz Prada
6220	55070	21	Julia Marin
3428	55018	31	FOVISSSTE (José María Morelos y Pavón)
1896	12100	2	Xochitepec
6250	55308	9	Benito Juárez La Mesa
52	1130	9	Paraíso
8304	50295	2	Del Tejocote
1170	7800	9	Industrial
794	5360	9	Locaxco
3686	55270	9	Granjas Valle de Guadalupe Sección C
148	55094	21	Villas Jajalpa
2549	7164	9	Tlacaélel
3784	55459	9	América Santa Clara
2315	15370	9	Progresista
3791	55507	9	La Palma
3450	55030	21	Hogares Marla
377	50270	28	Tecaxic
1380	9300	9	Guadalupe del Moral
539	3650	9	Letrán Valle
305	50140	9	Valle Verde
590	4260	2	San Francisco Culhuacán Barrio de San Francisco
1785	11340	9	Santo Tomas
330	50170	9	Isidro Fabela 1a Sección
1547	9810	9	Granjas Esmeralda
1441	9530	9	Santa Martha Acatitla Sur
321	50160	21	Villas de Santa Ana I
222	1510	9	Garcimarrero
1794	11410	28	Tacuba
8384	50264	9	San Judas Tadeo
329	50170	9	Héroes del 5 de Mayo
473	2830	2	San Bernabé
5687	57138	9	Bosques de Viena
3519	55067	9	Ciudad Cuauhtémoc Sección Xochiquetzal
1072	7300	9	Lindavista Norte
3583	55125	31	Aldeas de Aragón I
8427	50258	9	Puxinco
2343	15650	9	Ampliación Caracol
3734	55340	9	Rustica Xalostoc
6265	55264	9	Fernando de Alba Nezahualpilli
256	50100	9	La Joya
586	4240	9	Hermosillo
226	1520	9	Ampliación Estado de Hidalgo
1946	13180	2	San Miguel
1714	10620	9	Potrerillo
1253	8230	2	San Francisco Xicaltongo
5539	50245	9	Jesús García Lovera "El Pilar"
1707	10580	9	Barranca Seca
2499	16740	9	Guadalupita
2718	7164	9	Prados de Cuautepec
2793	4510	17	Universidad Nacional Autónoma de México
3725	55330	9	5 de Septiembre
1557	9820	9	Santa Isabel Industrial
148	1290	9	Presidentes
3723	55320	9	Santa María Xalostoc
1179	7840	9	Guadalupe Tepeyac
86	1220	9	Cuevitas
8365	50265	9	La Loma
1966	13310	9	Zapotitla
1035	7170	9	Palmatitla
2846	1904	9	San Jerónimo Aculco
3692	55280	21	Valle de Aragón 3ra. Sección Oriente
7880	57000	9	Benito Juárez (La Aurora)
14	50226	9	Francisco I. Madero
463	2760	2	Santa Lucía
2083	14208	9	Colinas del Ajusco
2862	9630	9	San Miguel Teotongo Sección Rancho Bajo
2704	1500	9	Miguel Gaona Armenta
4563	57188	31	Ampliación Ciudad Lago Asa (Antonio Alzate)
3655	55242	9	Villas Cosmos
3433	55020	21	Boulevares la Nacional
899	6280	9	Felipe Pescador
563	4000	9	Villa Coyoacán
3733	55340	9	Benito Juárez Xalostoc
8335	50290	2	De Jesús 2da. Sección
1408	9400	9	El Sifón
777	5260	9	Jesús del Monte
8382	50264	2	San José
2209	14449	9	El Mirador 2A Sección
1007	7070	9	La Cruz
3422	55010	28	Guadalupe Victoria
4775	55118	9	Progreso de la Unión
1233	8000	9	Gabriel Ramos Millán Sección Bramadero
6260	55130	9	Vicente Coss Ramírez
2607	16810	9	Rosario Tlali
22	50254	21	Hacienda Vista Hermosa
2856	9630	9	San Miguel Teotongo Sección La Cruz
2873	12930	2	San Miguel
2412	16040	2	San Lorenzo
727	4940	9	Los Sauces
6298	55066	9	La Cerca
371	50220	28	San Mateo Otzacatipan
1647	9960	9	USCOVI
641	4380	28	La Candelaria
4581	57430	9	Porvenir
2408	16036	17	Mercado de Flores Plantas y Hortalizas
2772	11100	17	Bosque de Chapultepec III Sección
392	50250	28	San Felipe Tlalmimilolpan
632	4360	9	Copilco El Alto
2121	14310	9	Floresta Coyoacán
5696	50228	21	Arboleda IV
2262	14710	28	Santo Tomas Ajusco
1874	11950	9	Lomas Altas
1422	9438	9	Ampliación El Triunfo
88	55020	31	Misión de los 40
3619	55187	21	Profopec (Polígono III)
4545	57120	9	Campestre Guadalupana
1161	7750	9	Nueva Vallejo
2125	14325	9	Rinconada Coapa 2A Sección
8361	50115	9	Loma Bonita
133	55067	9	Ciudad Cuauhtémoc Sección Tepoztlaco
1929	13060	2	La Guadalupe
1738	10920	9	Las Huertas
2900	16513	2	Apatlaco
5636	55105	9	Ignacio L. Vallarta
15	50228	21	Crespa Town
5555	50245	21	La Arboleda II
981	6850	9	Asturias
4602	57600	9	Ampliación Romero Sección Las Fuentes
8426	50258	9	La Cruz
1432	9479	9	Ampliación Sinatel
3638	55235	31	Unidad Obrero CTM XIV
8455	50010	21	Villas Tepaltitlán
3766	55414	9	Tepetlac Texalpa
1673	10010	9	La Malinche
33	1109	9	La Conchita
1891	12100	2	Cruztitla
1215	7969	9	San Juan de Aragón I Sección
1399	9360	9	Ampliación San Miguel
567	4020	2	La Concepción
652	4450	9	El Centinela
261	1590	9	El Rincón
6301	55064	31	Joyas de Atlautenco
1277	8650	2	San Miguel
970	6780	9	Buenos Aires
3616	55330	9	Tolotzin V
8305	50295	9	San Mateo
1378	9290	9	Santa Cruz Meyehualco
6216	55055	9	El Sol de Ecatepec
1512	9750	9	Insurgentes
172	50010	21	Los Girasoles III
2911	16615	2	La Asunción
3537	55080	9	Francisco Villa
3443	55027	9	El Árbol
140	1280	9	Francisco Villa
3446	55029	9	Granjas Ecatepec 1a Sección
2356	15800	9	Jamaica
2378	15990	9	Álvaro Obregón
363	2040	9	San Sebastián
1933	13080	2	Los Reyes
518	3410	9	Postal
8441	50210	21	Villa Mane
2231	14608	9	Colinas del Bosque
2462	16340	9	Texmic
4565	57200	9	El Sol
1328	9089	9	Unidad Modelo
384	50285	2	La Palma Toltepec
2405	16034	2	18
2479	16530	2	Las Cruces
2446	16240	9	Tlaxopan
1339	9180	9	Ermita Zaragoza
536	3620	9	Periodista
1976	13420	9	Selene
1616	9870	28	Santa María Tomatlán
3516	55067	9	Ciudad Cuauhtémoc Sección Tizoc
1538	9800	9	San Antonio Culhuacán
3740	55360	9	El Salado
4614	57720	9	Atlacomulco
4758	55018	31	Ecatepec 2000
2216	14476	9	La Palma
2110	14270	9	Primavera
1067	7270	9	Residencial Acueducto de Guadalupe
1455	9609	9	Santiago Acahualtepec 2a. Ampliación
1926	13040	2	San Mateo
3713	55300	9	Piedra Grande
3430	55020	21	Boulevares de San Cristóbal
2443	16200	28	Santiago Tepalcatlalpan
2895	13360	2	Santa Ana Sur
240	1540	9	Llano Redondo
853	6030	9	Tabacalera
882	6100	9	Hipódromo
1052	7220	9	Castillo Grande
3710	55298	9	Ejercito del Trabajo III
736	5020	9	Loma del Padre
259	1588	9	Tarango
2145	14340	9	Vergel de Coyoacán
521	3430	9	Josefa Ortiz de Domínguez
3554	55090	9	Las Palmas Ecatepec
644	4390	9	Nueva Díaz Ordaz
2475	16500	28	Santa Cruz Acalpixca
1330	9099	28	Mexicaltzingo
4567	57210	9	Estado de México
896	6250	9	Ex-Hipódromo de Peralvillo
372	2070	2	Nextengo
8337	50283	2	La Pena
1637	9900	2	Guadalupe
2775	11000	9	Lomas de Chapultepec II Sección
306	50140	21	Villas Florencia
2843	1820	9	Ejido San Mateo
489	3000	9	Piedad Narvarte
7884	57185	9	Ampliación Ciudad Lago El Triangulo
259	50100	21	La Ribera III
6269	55238	9	Sagitario III
3595	55130	21	Plaza de Santa Clara
1054	7239	9	Zona Escolar Oriente
4789	55067	9	Coyometla
5548	50246	9	El Coecillo
2459	16310	9	La Cañada
2061	14100	9	Pedregal de San Nicolás 2A Sección
8377	50263	2	De la Cruz
2113	14300	9	Nueva Oriental Coapa
1775	11290	9	Huíchapan
2307	15309	9	5o Tramo 20 de Noviembre
2258	14657	9	Tlalmille
304	1740	9	San Clemente Norte
1345	9208	9	Chinampac de Juárez
4754	55029	9	San Francisco de Asís
891	6200	9	Morelos
348	50180	9	Lázaro Cárdenas
8323	50270	2	El Pedregal
1212	7960	9	Ex Escuela de Tiro
227	1520	9	Piru Santa Lucía
381	50295	28	San Cayetano Morelos
875	6080	9	Centro (Área 8)
2842	1740	9	San Clemente Sur
4560	57179	9	Prados de Aragón
102	55066	9	Pirules de Bayisco
4920	55027	9	La Huerta
385	50285	2	Palmillas
7892	50140	9	Terminal
3606	55149	9	Ignacio Allende
1548	9810	9	Los Cipreses
501	3200	9	Tlacoquemécatl
3452	55030	21	Ampliación Izcalli Ecatepec Tata Félix
5054	55244	9	Castillos de Aragón
2233	14610	9	Arenal Tepepan
3630	55210	21	Valle de Anáhuac Sección A
217	50040	2	La Teresona
2174	14390	9	Rinconada Las Hadas
1589	9850	9	Santa María del Monte
281	50120	9	Granjas
443	2630	2	Coltongo
1470	9660	9	Citlalli
1971	13360	9	La Conchita Zapotitlán
1172	7810	9	Estrella
213	1500	28	Santa Lucía
2858	9630	9	San Miguel Teotongo Sección Mercedes
26	1090	2	Loreto
2834	16530	2	Las Flores
127	1270	9	Lomas de Capula
1765	11230	9	Argentina Poniente
286	1700	9	Tecalcapa del Pueblo Tetelpan
103	55070	9	Plan de Arroyo
363	50205	9	Jicaltepec Cuexcontitlán
2365	15900	9	Jardín Balbuena
2175	14390	9	Narciso Mendoza
187	1407	9	Galeana
2273	14748	9	Mirador I
6979	50205	15	San Diego de los Padres Otzacatipan
3680	55269	21	Sauces I
6553	50233	37	Parque industrial Toluca 2000
1532	9800	28	Culhuacán
5688	50225	9	Nueva San Francisco
5690	50228	31	Geovillas de la Independencia
2302	15280	9	Penitenciaria
2880	14647	9	Rinconada El Mirador
1375	9260	9	Constitución de 1917
209	1480	9	Lomas de Plateros
302	50140	9	Santa María de las Rosas
16	1050	9	Ex-Hacienda de Guadalupe Chimalistac
8308	50285	9	Lázaro Cárdenas
34	1110	9	Belém de las Flores
3480	55050	21	Bosques de Ecatepec
2625	3303	9	Portales Norte
1652	9970	9	Valle de San Lorenzo
2322	15420	9	Ampliación Simón Bolívar
6205	55020	21	El Terremote
4598	57500	9	Central
3504	55066	9	Casas Reales
115	1260	9	Liberación Proletaria
1069	7279	9	Acueducto de Guadalupe
4960	55290	9	Solidaridad 90 (Mártires de Río Blanco)
8378	50263	2	La Virgen de Guadalupe
126	55020	31	Sergio Méndez Arceo
3681	55269	9	México Prehispánico I
6272	55069	9	La Garita
714	4909	9	Culhuacán CTM Sección VIII
138	1280	9	Arvide
8449	50245	21	Campo Real I
152	55414	9	Xochitenco
2870	12410	2	Chalmita
4918	55010	12	Rancho Victoria
4556	57171	17	Escuela Nacional de Estudios Profesionales Aragón
6199	55016	31	Tío Marin
3551	55090	21	El Jaguey
6982	50295	9	Sebastián Lerdo de Tejada
171	50010	21	Los Girasoles II
1691	10330	9	Las Cruces
9095	50285	12	Paseos San Martín
1181	7850	9	Bondojito
1157	7730	9	San Bartolo Atepehuacan
84	1219	9	Lomas de Santa Fe
3644	55238	9	Ejercito del Trabajo II
5070	50110	21	Real del Bosque
686	4730	9	Cantil del Pedregal
409	2360	9	Las Salinas
1570	9837	9	San Miguel 8va. Ampliación
4788	55060	21	La Guadalupana
325	50160	21	Villas de Santa Ana V
269	50100	9	San Mateo Oxtotitlán
1716	10640	9	La Carbonera
1674	10010	9	San Bartolo Ameyalco
809	5530	9	Abdías García Soto
4579	57420	9	Nezahualcóyotl Primera Sección
3505	55066	9	Las Brisas
6552	50223	37	Parque industrial Exportec I
1754	11100	17	Bosque de Chapultepec II Sección
221	1509	28	Santa Lucía Chantepec
1254	8240	2	Santiago Norte
4784	55074	21	Los Alcatraces
8442	50220	2	De Canaleja
3721	55320	9	El Nardo
225	1520	9	Estado de Hidalgo
8324	50210	2	La Magdalena Otzacatipan
4800	55080	9	Xochicuac II
4572	57310	9	Tamaulipas Sección Palmar
3718	55317	9	El Arbolito Xalostoc
8331	50294	2	De Pueblo Nuevo
1733	10840	2	Las Calles
1894	12100	2	Tenantitla
2809	4480	9	Culhuacán CTM Sección III
913	6430	9	Santa María Insurgentes
60	1140	9	José Maria Pino Suárez
2897	13315	9	Ampliación Zapotitla
2294	15210	9	Valle Gómez
287	50120	21	Tollocan INFONAVIT
3520	55068	15	Santo Tomás Chiconautla
8371	50265	9	San Pedro
6201	55016	31	Tía Joaquina
2269	14738	9	Bosques del Pedregal
3665	55249	31	Ecatepec Federación (Mártires de Río Blanco)
415	2420	9	Ex-Hacienda El Rosario
7844	50250	9	Rancho de Maya
2396	16020	28	Santa María Tepepan
8431	50258	9	Paraje el Ocote
484	2960	28	San Francisco Xocotitla
1373	9250	9	La Regadera
1481	9630	9	San Miguel Teotongo Sección Corrales
197	1420	2	Santa María Nonoalco
2074	14140	9	Fuentes del Pedregal
8407	50255	9	Santa María
300	1730	9	Puente Colorado
3748	55404	9	El Charco
4805	55020	9	Ex-Hacienda Jauregui
1085	7330	9	Santa María Ticomán
3564	55100	21	Río de Luz
1566	9830	9	Los Ángeles
789	5330	9	Ampliación Memetla
211	1490	9	La Cascada
1365	9230	9	Ejército de Oriente
5116	50210	21	Los Sauces II
570	4040	9	Parque San Andrés
8311	50295	15	Xicaltepec
540	3660	9	San Simón Ticumac
1250	8200	9	Viaducto Piedad
233	1539	9	Acuilotla
8416	50257	9	Benito Juárez
5110	50100	21	Ex-Hacienda San Jorge
1985	13508	2	San Agustín
8434	50228	21	Los Sabinos
2483	16609	2	La Candelaria
1930	13060	2	Santa Ana
638	4370	9	Ciudad Jardín
2593	13508	2	La Soledad
2776	11000	9	Lomas de Chapultepec III Sección
196	1420	9	Sacramento
5578	55080	9	Lomas de Atzolco
1497	9706	9	San José Buenavista
8417	50257	9	Tollocan
3614	55176	21	Profopec (Polígono V)
270	1620	9	Lomas de Tarango
1804	11460	9	Dos Lagos
1884	12000	9	Villa Milpa Alta Centro
6221	55070	21	Profopec (Polígonos VII)
6213	55064	21	La Venta (La Guadalupana)
2500	16749	9	Las Animas
2043	14040	9	Pueblo Quieto
6246	55530	31	Santa Clara
2909	16607	2	San Antonio
121	1270	9	La Presa
2908	16606	2	3 de Mayo
3550	55090	9	El Arbolito Jajalpa
2229	14600	9	Valle Escondido
2336	15620	1	México (Licenciado Benito Juárez)
1136	7560	9	Ampliación Providencia
7048	50250	9	La Cañada
1803	11450	9	Peralitos
1211	7960	9	Héroes de Cerro Prieto
3579	55119	9	Potrero Chico
1925	13030	2	San Juan
3746	55400	28	Santa María Tulpetlac
1681	10130	9	El Maestro
895	6240	9	Valle Gómez
1745	11000	9	Lomas de Chapultepec I Sección
5585	55416	31	Benito Juárez 2da. Sección
4929	55025	9	Los Sauces
3667	55260	9	Nueva Aragón
4932	55020	21	La Palma II
2111	14275	9	Paraje 38
1773	11280	9	Torre Blanca
8307	50285	15	San Marcos Yachihuacaltepec
2432	16090	2	San Pedro
6218	55070	9	Llanos de Morelos II
193	50020	9	Los Ángeles
3622	55190	9	Lázaro Cárdenas V Zona
680	4710	9	Olímpica
2049	14070	2	San Fernando
3775	55419	9	Tlatempa
6238	55400	31	Nieves
3525	55070	21	Jardines de Morelos Sección Flores
4801	55080	31	Lomas de Ecatepec
1502	9710	9	Los Ángeles Apanoaya
239	1540	9	Cehuaya
1675	10020	9	Cuauhtémoc
3597	55135	31	Laderas del Peñón
1190	7870	9	Vallejo
4645	57940	9	Loma Bonita
319	1780	9	Tizampampano del Pueblo Tetelpan
2527	16880	28	Santa Cecilia Tepetlapa
136	1279	9	Lomas de Becerra
15	55070	9	Carlos Salinas de Gortari
2902	16514	2	La Gallera
2123	14320	9	Vergel Coapa
2851	9630	9	San Miguel Teotongo Sección Avisadero
271	1630	9	Lomas de Puerta Grande
1021	7110	9	Lomas de Cuautepec
695	4810	9	Prados de Coyoacán
1672	10000	9	Lomas Quebradas
2516	16810	9	Santa Inés
252	50100	9	Bosques de San Mateo
277	50110	21	Villas de San Buenaventura
1797	11430	9	Pensil Norte
8413	50256	9	El Calvario
1844	11610	9	Manuel Ávila Camacho
1782	11320	9	Anáhuac I Sección
383	50295	28	Tlachaloya
244	50090	9	5 de Mayo
596	4300	9	Ajusco
8437	50227	21	Villas de Santa Mónica
4916	55010	31	Rancho Victoria II
1973	13410	9	López Portillo
207	50026	9	Carlos Hank González
1222	7990	9	C.T.M. Aragón
2431	16083	2	Caltongo
5528	50245	21	Villas Santa María (Galaxia)
577	4120	9	San Diego Churubusco
8333	50294	9	Tlachaloya
711	4899	9	El Parque de Coyoacán
36	55024	9	El Carmen
1573	9839	9	Ampliación Paraje San Juan
8268	50290	2	De Jesús 1da. Sección
5693	50246	21	Los Héroes III
2914	16813	2	El Calvario
1595	9859	9	Benito Juárez
9	1030	28	Axotla
2845	1259	9	La Mexicana 2a Ampliación
2480	16457	9	Lomas de Nativitas
3700	55290	9	Granjas Independencia Sección A
1213	7960	9	Fernando Casas Alemán
1117	7460	9	Granjas Modernas
1833	11580	17	Bosque de Chapultepec I Sección
224	1230	9	El Piru 2a Ampliación
5123	50214	21	Villas Santín
673	4640	9	El Reloj
717	4918	9	Cafetales
4933	55030	21	La Palma I
4952	55090	21	Bonito Ecatepec
1174	7820	9	Aragón Inguarán
4606	57620	9	México Segunda Sección
4808	55023	21	Los Héroes Ecatepec Sección III
82	1210	28	Santa Fe
1295	8920	9	Jardines Tecma
1491	9700	28	Santa Cruz Meyehualco
1550	9810	9	Progreso del Sur
780	5269	9	Amado Nervo
1196	7899	9	La Malinche
2840	9440	9	Zacahuitzco
229	1530	9	Corpus Christy
2636	1510	9	Los Cedros
464	2770	28	Santa Cruz Acayucan
1001	7050	9	Villa Gustavo A. Madero
3759	55410	9	Tecuescomac
8396	50254	2	El Mogote
372	50225	28	San Miguel Totoltepec
8374	50263	9	Los Pinos
459	2730	28	San Francisco Tetecala
3470	55040	21	Jardines de Ecatepec
3546	55000	2	La Cruz de San Cristóbal
1645	9940	9	Jardines de San Lorenzo Tezonco
1147	7680	9	Ampliación Guadalupe Proletaria
2831	4260	2	San Francisco Culhuacán Barrio de San Juan
2293	15200	9	Janitzio
6193	55010	9	Mathzi I
1048	7209	9	Guadalupe Victoria Cuautepec
3706	55296	9	Nicolás Bravo
3434	55020	9	Tierra Blanca
8392	50254	2	Del Panteón
350	50180	9	Moderna de la Cruz
732	5000	9	Cuajimalpa
4632	57830	9	Ampliación La Perla Reforma
8421	50258	9	Acuxtitla
379	50236	9	Arroyo Vista Hermosa
8446	50226	21	Sor Juana Inés de la Cruz
1418	9430	9	Apatlaco
2805	4470	9	Presidentes Ejidales 2a Sección
6987	50290	15	Bordo Nuevo
1598	9860	9	Casa Blanca
2149	14357	9	Prado Coapa 2A Sección
6980	50295	15	San José la Costa
1	50285	31	Las Bugambilias
1284	8760	9	INPI Picos
8262	50210	21	Hacienda del Valle II
253	50100	9	14 de Diciembre
8327	50280	9	El Calvario
3792	55508	9	Ampliación Coanalco
110	1260	9	Calzada Jalalpa
318	50168	21	La Machincuepa
527	3530	9	Villa de Cortés
2252	14650	28	San Pedro Mártir
1169	7790	9	Vallejo Poniente
405	2320	28	San Andrés de las Salinas
2839	9310	9	Leyes de Reforma 3a Sección
1189	7870	9	Guadalupe Insurgentes
1061	7250	9	Benito Juárez
147	1290	9	Piloto Adolfo López Mateos
5667	55418	9	El Callejón
5700	50040	9	Electricistas Locales
3632	55270	9	Emiliano Zapata 2a Secc
1164	7770	9	Ampliación Panamericana
801	5410	28	San Lorenzo Acopilco
1053	7230	9	Zona Escolar
164	1320	9	Carlos A. Madrazo
2681	1220	9	La Estrella
1135	7550	9	Providencia
451	2710	28	San Pedro Xalpa
177	50010	2	Tlacopa
89	1220	9	Mártires de Tacubaya
67	55074	9	La Purísima
6275	55067	31	La Fortaleza
456	2720	9	San Antonio
1838	11590	9	Anzures
8414	50257	9	La Joya
566	4010	2	Santa Catarina
311	1760	9	La Herradura del Pueblo Tetelpan
248	1560	9	Ave Real
349	50180	9	Ampliación Lázaro Cárdenas
2429	16080	2	San Diego
690	4739	9	El Caracol
275	1640	9	Herón Proal
150	55050	9	Vivienda del Taxista
6206	55020	21	Martell
3703	55294	31	Av. Central CROC
608	4320	9	Pedregal de San Francisco
3585	55127	21	Profopec IV (Polígono IV El Cegor)
8420	50257	9	Loma Bonita
2207	14440	9	Los Volcanes
1816	11500	9	Irrigación
7831	57205	9	Ciudad Jardín
1864	11850	9	San Miguel Chapultepec I Sección
2876	14000	9	Tlalpan
3781	55450	21	Jardines de Santa Clara
2795	8760	9	Los Picos de Iztacalco Sección 2A
267	50100	9	Rincón del Parque
3467	55040	21	Fuentes de San Cristóbal
2103	14260	9	Miguel Hidalgo 1A Sección
8369	50265	9	Sagrado Corazón de Jesús
56	1130	9	Real del Monte
2871	12910	2	La Lupita Teticpac
6555	50293	37	Parque industrial Toluca
198	1430	9	Colina del Sur
1149	7707	9	Siete Maravillas
2330	15510	9	Pensador Mexicano
2328	15500	9	Moctezuma 1a Sección
4600	57520	9	Porfirio Díaz
2078	14150	9	Lomas del Pedregal Framboyanes
3637	55234	9	La Glorieta
8429	50258	9	Guadalupe
6200	55016	31	Guadalupe Victoria
273	50110	21	Plazas de San Buenaventura
8415	50257	9	El Cruzado
1109	7440	9	Vasco de Quiroga
6231	55418	21	Villas Tulpetlac
1646	9960	9	Celoalliotli
1787	11360	9	Agricultura
8439	50220	21	Villas de San Mateo
746	5100	9	Lomas de Vista Hermosa
376	50245	28	Santa María Totoltepec
2883	7224	9	Ampliación Castillo Grande
612	4330	9	El Rosedal
3654	55240	9	Melchor Muzquiz
77	1180	9	8 de Agosto
6194	55010	9	El Diamante
8316	50200	9	San José Guadalupe
2079	14160	9	Popular Santa Teresa
530	3560	9	Albert
6983	50295	9	Tlachaloya 2a Sección Centro
2051	14080	9	Belisario Domínguez Sección XVI
4790	55067	9	Niños Héroes
1175	7820	9	Tres Estrellas
4543	57100	9	Valle de Aragón
309	1760	9	Atlamaya
2887	7144	9	La Lengüeta
283	50120	9	Morelos 2a Secc
752	5119	9	Campestre Palo Alto
3543	55085	9	Viveros Tulpetlac
2009	13700	28	San Nicolás Tetelco
1911	12600	28	San Jerónimo Miacatlán
2485	16620	2	San José
8775	55020	9	Tierra Blanca Segunda Sección (Ejido Ecatepec)
4582	57440	9	Las Palmas
7894	50070	9	Reforma y Ferrocarriles Nacionales
8402	50255	9	Paraje Tlalmimilolpan
5635	55430	12	Conjunto Ejecutivo
613	4330	28	Los Reyes
1731	10820	9	La Guadalupe
850	6020	9	Centro (Área 3)
2415	16050	9	Tierra Nueva
5546	50010	9	El Balcón
6262	55269	21	Sauces P.R.I.
1990	13530	9	Jaime Torres Bodet
6290	55068	9	Ignacio Pichardo Pagaza
1412	9410	9	Jardines de Churubusco
1737	10910	28	La Magdalena
1162	7760	9	Magdalena de las Salinas
388	50266	28	San Antonio Buenavista
2833	16035	9	Rinconada Coapa
1110	7450	9	DM Nacional
1108	7430	9	Del Obrero
3642	55236	9	Sagitario V
2624	3100	9	Insurgentes San Borja
6280	55067	21	Moneda de 100 Pesos
3604	55147	21	Los Álamos
2126	14326	9	Tenorios
3778	55429	31	Bellavista
1523	9769	9	El Triángulo
1155	7730	9	Churubusco Tepeyac
8290	50295	9	Cerrillo Piedras Blancas
2291	15100	9	Zona Centro
1467	9648	9	San Pablo
1997	13550	9	Jardines del Llano
559	3920	9	Insurgentes Mixcoac
4562	57185	9	Ampliación Ciudad Lago
3716	55310	28	San Pedro Xalostoc
930	6600	9	Juárez
38	55404	9	Ejido de Santa María Tulpetlac
3694	55280	21	Valle de Aragón 3ra. Sección Poniente
3566	55105	9	El Paraíso
810	5600	28	San Mateo Tlaltenango
2913	16616	2	Santa Cecilia
445	2650	9	Trabajadores de Hierro
4776	55118	9	Joyas de Ecatepec
2482	16600	28	San Gregorio Atlapulco
7053	50295	21	San Diego
7980	55080	9	San Carlos
1563	9830	9	El Molino
696	4815	9	Emiliano Zapata
5077	55029	21	Abel Martínez Montañez
423	2470	9	Ampliación Petrolera
3779	55430	9	José María Pino Suárez
2381	16000	2	San Juan
2219	14479	9	Viveros Coatectlán
1331	9100	9	Juan Escutia
42	55415	9	El Rosal
2706	10630	4	El Ocotal
2286	14900	28	Parres El Guarda
2771	11320	9	Anáhuac II Sección
280	50120	9	Federal (Adolfo López Mateos)
345	50180	9	Hermanos de la Vega
1013	7090	9	C.T.M. Atzacoalco
5611	55118	9	Juan de la Barrera
552	3820	9	8 de Agosto
3454	55030	2	La Mora
6270	55296	31	Las Flores de Aragón
336	50170	9	El Seminario 2a Sección
716	4910	9	Carmen Serdán
6274	55069	9	La Cerca
439	2530	9	Jardín Azpeitia
311	50150	9	Izcalli IPIEM
6268	55238	9	Felipe Ángeles (Antes Sagitario II)
1651	9969	9	Cananea
176	50010	28	San Lorenzo Tepaltitlán Centro
2604	16780	9	Cristo Rey
2090	14220	9	Lomas del Pedregal
726	4939	9	Culhuacán CTM Sección X
884	6140	9	Condesa
3481	55050	21	Residencial Fuentes de Ecatepec
1120	7480	9	San Pedro El Chico
1648	9960	9	El Molino Tezonco
6207	55020	21	Bursaab
385	2120	28	San Martín Xochinahuac
2773	11800	9	Escandón II Sección
1511	9740	9	Presidentes de México
1027	7140	9	Ampliación Arboledas
5538	50200	9	La Trinidad
8054	50250	21	La Loma Residencial
457	2720	28	San Bartolo Cahualtongo
3440	55025	21	San Benjamin
8470	50228	31	Fuentes de la Independencia
1302	9000	2	San Lucas
8454	50226	10	La Alameda
3487	55055	21	Jardines de los Báez 1a Sección
406	2330	2	Huautla de las Salinas
2112	14270	9	Verano
2214	14470	9	Plan de Ayala
3526	55070	21	Jardines de Morelos Sección Fuentes
8398	50254	2	El Mirador
5694	50246	21	Los Héroes II
2810	4440	9	Culhuacán CTM Sección II
143	55074	9	Uprovi
6	50264	2	La Soledad
8370	50265	9	Tierra Coloradas
1454	9608	9	Santiago Acahualtepec 1ra. Ampliación
3702	55290	9	Granjas Independencia Sección C
3503	55065	2	Santa Cruz Venta de Carpio
6554	50016	37	Parque industrial San Antonio
68	1160	9	Maria G. de García Ruiz
2316	15380	9	Escuela de Tiro
2850	9630	9	San Miguel Teotongo Sección Acorralado
3587	55129	21	La Florida (Ciudad Azteca)
2509	16799	9	Las Mesitas
1180	7840	9	7 de Noviembre
1011	7080	9	Gabriel Hernández
2355	15750	9	Ampliación Aviación Civil
1912	12700	28	San Francisco Tecoxpa
8325	50220	21	Villa Tulipanes
728	4950	9	El Mirador
587	4250	9	Paseos de Taxqueña
8332	50294	2	De Santa María
5576	55070	21	Villas del Sol
245	1550	9	Tepeaca
2814	4909	9	Culhuacán CTM Sección IX-B
3584	55126	21	Profopec (Polígono I)
2347	15680	9	Arenal 2a Sección
4	50230	21	Villa Toscana
783	5280	9	Adolfo López Mateos
519	3420	9	Miguel Alemán
1464	9640	9	Lomas de la Estancia
4547	57129	9	Ampliación Campestre Guadalupana
379	2100	9	El Rosario
377	2090	9	San Álvaro
72	55404	31	Ecatepec las Fuentes
353	50190	9	Benito Juárez
218	50040	9	Unión
2298	15240	9	Michoacana
8280	50227	21	Paseos de Toluca
3770	55416	9	Texalpa
8301	50295	9	Las Jaras San Nicolás
485	2970	9	Ampliación Del Gas
8267	50210	21	Bosques de Cantabria
1780	11310	9	Mariano Escobedo
1717	10640	9	Pueblo Nuevo Alto
4551	57140	9	Jardines de Guadalupe
18	1060	9	San Ángel Inn
3705	55295	9	Ampliación Pedro Ojeda Paullada
4564	57189	9	Ampliación Ciudad Lago Comunicaciones
1178	7839	9	Gertrudis Sánchez 2a Sección
1796	11420	9	Nextitla
1488	9700	9	Desarrollo Urbano Quetzalcóatl
3458	55037	2	El Capulín
838	6000	9	Centro (Área 1)
988	6900	9	Nonoalco Tlatelolco
400	2250	28	Santa Catarina
1903	12250	28	San Bartolomé Xicomulco
7820	57500	9	Agua Azul Grupo B Super 23
1865	11860	9	Observatorio
276	1645	9	Ponciano Arriaga
1139	7600	9	Progreso Nacional
63	1150	9	Cristo Rey
3572	55114	9	Tolotzin I
3497	55060	21	Venta de Carpio
366	50205	9	San Diego de los Padres Cuexcontitlán
2780	11000	9	Lomas de Chapultepec VII Sección
3800	55518	9	La Agüita
223	50040	9	Sor Juana Inés de la Cruz
5	55010	21	Laureles Residencial
1784	11330	9	Un Hogar Para Nosotros
6267	55238	9	Sagitario I
1182	7850	9	Faja de Oro
6259	55148	31	Alborada de Aragón
2639	1610	9	Profesor J. Arturo López Martínez
19	55020	9	La Monera
1125	7509	9	Pradera II Sección
8404	50255	9	Los Pajaritos
223	1510	9	La Araña
3447	55029	9	Granjas Ecatepec 2a Sección
1255	8300	9	Santa Anita
446	2660	9	Euzkadi
263	1600	9	Merced Gómez
2502	16770	9	San Felipe
1701	10380	9	Barros Sierra
5	14643	9	Tecoantitla Xolalpa
2403	16030	9	Potrero de San Bernardino
2236	14629	9	San Buenaventura
658	4489	9	Culhuacán CTM Sección VII
6295	55066	9	Campo Santo
194	50026	21	Los Frailes
2183	14408	9	Nuevo Renacimiento de Axalco
1193	7890	9	Cuchilla La Joya
325	1790	9	Lomas de San Ángel Inn
1419	9430	9	El Triunfo
3698	55290	21	Arboledas de Aragón
5695	50245	21	La Arboleda III
4596	57500	9	Agua Azul Grupo C Súper 4 y Súper 23
1869	11910	9	Lomas de Bezares
6283	55067	9	Ciudad Cuauhtémoc Sección Tepetzingo
2201	14430	2	El Truenito
1371	9240	9	Progresista
160	1299	9	1a Ampliación Presidentes
1682	10200	9	San Jerónimo Lídice
368	2060	9	Sindicato Mexicano de Electricistas
291	1708	9	El Encino del Pueblo Tetelpan
2200	14429	9	Santísima Trinidad
770	5230	9	El Ébano
50	55067	9	Ciudad Cuauhtémoc Sección Geo 2000
1980	13440	9	Zacatenco
2213	14460	9	Tlalpuente
2481	16550	9	Valle de Santa María
1335	9140	9	Santa Martha Acatitla Norte
1	1000	9	San Ángel
3708	55297	9	Héroes de Granaditas
1105	7420	9	El Coyol
1895	12100	2	Xaltipac
8381	50263	9	La Santísima Trinidad
183	50227	9	Misiones de Santa Esperanza
2107	14267	2	De Caramagüey
2466	16420	9	San Jerónimo
1963	13300	2	Santa Ana Centro
1431	9470	9	Sinatel
5120	50240	21	Prados de Tollocan
1556	9820	9	Ricardo Flores Magón
3492	55055	9	Ampliación Llano de los Báez Sección Izcalli
792	5348	9	Santa Fe Cuajimalpa
8261	50227	21	Rinconadas del Pilar
1288	8810	9	Reforma Iztaccíhuatl Norte
978	6820	9	Tránsito
3773	55418	9	Rufino Tamayo
4955	55100	21	Pro Revolución
2385	16010	9	Bosque Residencial del Sur
1199	7910	9	San Juan de Aragón VII Sección
6261	55130	31	Ciudad y Puerto
637	4370	9	Atlántida
2085	14210	9	Jardines en la Montaña
1118	7469	9	Constitución de la República
1137	7570	9	Villa de Aragón
2266	14734	9	El Zacatón
3581	55120	21	Ciudad Azteca Sección Poniente
370	50285	28	San Martín Toltepec
2878	14390	9	Villa Coapa
1858	11800	9	Escandón I Sección
284	50120	21	Residencial Colón
120	1270	9	El Tejocote
58	1139	9	Reacomodo Pino Suárez
19	1070	9	Chimalistac
2050	14070	9	San Pedro Apóstol
1257	8320	9	Fraccionamiento Coyuya
2841	1520	9	El Politoco
3	14456	9	Atocpa Sur
1129	7530	9	Campestre Aragón
1531	9790	28	San Lorenzo Tezonco
3562	55100	21	Jardines de Cerro Gordo
1308	9010	9	Real del Moral
285	1700	9	2a Del Moral del Pueblo Tetelpan
7882	57420	9	Nezahualcóyotl Tercera Sección
8322	50274	9	Pueblo Nuevo (Serratón)
2399	16029	9	Ampliación Tepepan
554	3840	9	Ampliación Nápoles
427	2490	2	San Mateo
3683	55270	9	El Chamizal
919	6500	9	Cuauhtémoc
2688	7183	9	6 de Junio
3787	55498	9	Héroes de la Independencia
8329	50294	2	De Jesús 3a. Sección
643	4390	9	Huayamilpas
1774	11289	9	Ampliación Torre Blanca
2815	4480	9	Culhuacán CTM Sección X-A
279	1650	9	Tlacuitlapa
1462	9638	9	Ampliación Emiliano Zapata
678	4700	9	Pedregal de Carrasco
344	1860	9	Lomas de La Era
731	4980	9	Ex-Hacienda Coapa
3	1863	9	Lomas del Capulín
3715	55310	9	Cuauhtémoc Xalostoc
6297	55066	9	Jaime Salvador
8399	50257	2	La Joya
2268	14737	9	Vistas del Pedregal
1393	9359	9	Eva Sámano de López Mateos
2580	13273	9	La Draga
5692	50245	21	Los Héroes I
1097	7369	9	Residencial Zacatenco
582	4210	9	Churubusco Country Club
8373	50265	9	Del Campo
2414	16050	2	San Marcos
1263	8500	9	Agrícola Oriental
431	2520	17	Estación Pantaco
633	4360	9	Copilco Universidad
13	50230	9	Francisco Villa
2892	13700	9	Tepantitlamilco
986	6890	9	Ampliación Asturias
3720	55320	9	El Cardonal Xalostoc
3783	55458	12	Conjunto Guanajuato
8312	50200	9	Natividad
3464	55040	21	Álamos de San Cristóbal
222	50040	9	Sector Popular
1376	9270	9	Colonial Iztapalapa
3577	55118	9	Alfredo del Mazo
374	50290	28	San Pablo Autopan
5670	55415	9	Ampliación Almarcigo
8291	50010	2	San Juan de la Cruz
1643	9920	9	José López Portillo
2052	14080	2	Del Niño Jesús
271	50110	9	Del Deporte
2808	4260	2	San Francisco Culhuacán Barrio de Santa Ana
4597	57500	9	Agua Azul Grupo A Super 4
2035	14020	9	Villa Olímpica
1535	9800	9	Estrella Culhuacán
1952	13220	9	La Nopalera
4959	55100	9	Patrimonio Social
1843	11600	9	Residencial Militar
4777	55067	21	Los Llanetes
4750	55018	21	Granja el Rosal
2325	15450	9	Damián Carmona
310	1760	9	Flor de María
4703	50060	9	Niños Héroes (Pensiones)
2334	15600	9	Arenal 1a Sección
3599	55138	21	Valle de Santiago
6251	55540	31	Real de Santa Clara
3451	55030	31	Izcalli Ecatepec
2508	16797	9	Nativitas
1591	9856	9	Ampliación Veracruzana
4588	57460	9	Juárez Pantitlán
2004	13610	2	Los Reyes
44	1120	9	Cove
3457	55036	9	La Panorámica
860	6040	9	Centro (Área 4)
4809	55023	21	Los Héroes Ecatepec Sección II
2060	14100	9	Pedregal de San Nicolás 1A Sección
274	50110	9	San Buenaventura
1905	12400	2	Centro
105	1250	9	Ladera
132	1230	9	El Piru Santa Fe
3466	55040	21	Casas Coloniales Morelos
239	50071	37	Toluca
8263	50225	21	Bordo de las Canastas
4643	57930	9	Manantiales
210	50290	21	La Vega
1822	11520	9	Granada
2807	4260	2	San Francisco Culhuacán Barrio de La Magdalena
6243	55510	9	El Pozo
3636	55230	9	La Media Luna
1269	8600	2	La Asunción
368	50235	28	San Francisco Totoltepec
5666	55416	9	La Virgen
332	50170	21	Las Haciendas
1856	11700	9	Bosque de las Lomas
6252	55540	31	Rinconada de Santa Clara
144	1285	9	El Rodeo
3765	55414	9	Nueva Rufino Tamayo
2256	14655	9	Valle Verde
3673	55267	9	Ciudad Amanecer
2884	7214	9	Ampliación Chalma de Guadalupe
2062	14100	9	Pedregal de San Nicolás 3A Sección
307	1750	9	Las Águilas 3er. Parque
997	7020	9	Tepeyac Insurgentes
3560	55095	37	Jajalpa
373	50230	28	San Nicolás Tolentino
364	50236	9	La Constitución Totoltepec
989	6920	9	San Simón Tolnáhuac
5095	50160	21	Villas de Santa Ana
6211	55074	9	Mexicanos Unidos II
2912	16617	2	San Sebastián
3623	55200	9	División del Norte
2472	16450	28	Santa María Nativitas
1262	8420	9	Cuchilla Agrícola Oriental
361	2020	9	Santo Tomás
3684	55220	9	Emiliano Zapata 1a Sección A
7983	55200	9	Granjas Valle de Guadalupe Sección B
1878	12000	2	La Luz
507	3300	9	Portales Sur
2621	3103	9	Del Valle Norte
8946	50210	21	Valle de San José
7	55080	31	Arboledas de San Carlos
2247	14647	9	Movimiento Organizado de Tlalpan
535	3610	9	Américas Unidas
393	50255	9	Santiago Tlacotepec
1698	10378	9	Atacaxco
2297	15230	9	Emilio Carranza
376	2080	9	Sector Naval
1611	9870	9	San Andrés Tomatlán
8419	50257	9	Apilulco
229	50050	2	Zopilocalco Norte
314	50150	9	Progreso
1195	7890	9	Nueva Tenochtitlán
7893	50060	2	Huitzila
1962	13280	9	Agrícola Metropolitana
2796	8760	9	Los Picos de Iztacalco Sección 1B
2877	14360	9	Magisterial Coapa
133	1278	9	Desarrollo Urbano
1034	7160	9	Loma La Palma
2501	16750	2	Calyequita
3563	55100	9	Los Reyes Ecatepec
1017	7100	9	San Miguel
186	50017	9	Rincón de San Lorenzo
2484	16610	28	San Luis Tlaxialtemalco
1316	9040	9	Central de Abasto
31	1100	9	Pólvora
8445	50214	21	Paseos Santín
7047	50250	9	La Curva
53	1130	9	Molino de Santo Domingo
2042	14040	9	Cantera Puente de Piedra
2855	9630	9	San Miguel Teotongo Sección Jardines
3426	55016	9	La Joya
1786	11350	9	Plutarco Elías Calles
1730	10810	9	San Francisco
170	50010	21	Los Girasoles
3574	55117	9	Josefa Ortiz de Domínguez Sagitario VII
4760	55029	9	Potrero de Rey
4576	57400	9	El Barco Tercera Sección
1429	9450	9	Banjidal
1183	7858	9	Ampliación Emiliano Zapata
3429	55014	21	Parque Residencial Coacalco
4641	57910	9	Constitución de 1857
257	50100	21	La Ribera I
98	1230	9	Tlapechico
1	11570	9	Chapultepec Morales
538	3640	9	Del Lago
8367	50265	9	La Palma
1793	11410	9	Legaria
1310	9020	9	Doctor Alfonso Ortiz Tirado
12	1040	9	Campestre
1723	10710	9	Santa Teresa
1449	9578	9	Ejército de Agua Prieta
645	4400	9	Educación
332	1820	9	Lomas Axomiatla
247	50150	2	San Sebastián
4619	57750	9	Metropolitana Tercera Sección
558	3910	9	Mixcoac
195	50020	9	Rancho la Mora
1041	7190	9	Valle de Madero
6289	55068	21	El Hoyo
2832	16010	9	San Bartolo El Chico
808	5520	9	La Venta
17	1060	9	Altavista
6208	55020	21	Plazas Ecatepec
1515	9750	9	Las Peñas
389	50255	9	El Refugio
735	5010	9	Zentlapatl
4636	57849	9	Reforma A Sección 1
657	4480	9	Culhuacán CTM Sección VI
242	50080	2	La Merced (Alameda)
980	6840	9	Esperanza
8366	50265	9	Cacalomacán Centro
525	3510	9	Moderna
3507	55066	28	Santa María Chiconautla
2520	16850	2	Chapultepec
797	5370	9	Las Tinajas
8336	50283	2	El Pozo Blanco
2379	16000	2	La Concepción Tlacoapa
785	5310	9	El Molinito
545	3740	9	Extremadura Insurgentes
236	50070	9	Independencia
1258	8400	9	Granjas México
66	1160	9	Bosque
448	2680	9	Potrero del Llano
327	1800	28	San Bartolo Ameyalco
230	50060	9	Doctores
8356	50010	2	Del Panteón
996	7010	9	Tepetates
407	2340	9	Santa Cruz de las Salinas
3812	55547	37	Santa Clara
8306	50295	2	San José Buenavista
1440	9520	28	San Sebastián Tecoloxtitla
1987	13510	9	La Lupita
6292	55068	21	El Mirador
263	50100	9	Nueva Oxtotitlán
8433	50228	21	Villa de San Andrés
327	50160	21	Villas de Santa Ana VII
1242	8040	9	Carlos Zapata Vela
2295	15220	9	Nicolás Bravo
2433	16090	9	Tablas de San Lorenzo
16	50210	21	Áurea
1486	9700	9	Carlos Hank González
2088	14220	9	Cuchilla de Padierna
1091	7350	2	Guadalupe Ticomán
2159	14376	9	Arboledas del Sur
3793	55509	9	La Presa
3669	55264	31	Prizo II
2299	15250	9	Ampliación Michoacana
1890	12080	28	San Agustin Ohtenco
1690	10320	9	El Tanque
6236	55400	31	Aldeas I
216	50040	2	La Retama
294	50130	9	Universidad
5081	55069	9	Los Pajaritos
8395	50254	2	La Venta
248	50090	2	Santa Clara
614	4330	2	Del Niño Jesús
2010	12110	9	Emiliano Zapata
995	7010	9	Santa Isabel Tola
534	3600	9	Vértiz Narvarte
1022	7119	9	Malacates
1798	11430	9	Ventura Pérez de Alva
1206	7940	9	Ex Ejido San Juan de Aragón Sector 33
356	2010	2	Los Reyes
1861	11820	9	América
1334	9130	28	San Lorenzo Xicotencatl
334	1840	9	Torres de Potrero
2425	16070	2	La Guadalupita
1639	9900	2	San Lorenzo
3666	55249	9	Poesía Mexicana
3609	55158	21	Profopec (Polígono II)
6296	55066	21	Los Ídolos
17	55030	12	Colinas de Ecatepec
2866	5410	9	1° de Mayo
669	4600	9	Pedregal de Santa Úrsula
531	3570	9	Portales Oriente
1119	7470	9	Ampliación San Juan de Aragón
1046	7207	9	Del Bosque
833	5780	9	Agua Bendita
8379	50263	2	San Isidro Labrador
562	3940	9	Crédito Constructor
6223	55050	9	Ex Rancho Jajalpa
2192	14420	9	Santa Úrsula Xitla
85	1220	9	Bonanza
392	2140	9	Santa Inés
3540	55080	21	Nuevo Laredo
1217	7970	9	San Juan de Aragón III Sección
1549	9810	9	Minerva
9526	50100	21	Lomas de San Mateo
5671	55407	31	Cuchilla Lázaro Cárdenas
578	4120	9	San Mateo
24	1089	9	Ermita Tizapan
1038	7187	9	Vista Hermosa
154	1296	9	Jalalpa Tepito
496	3100	9	Del Valle Centro
2319	15390	9	7 de Julio
32	55024	9	Ejidos de San Cristóbal
3794	55510	9	Tablas del Pozo
8346	50290	9	Alcaltunco
1501	9709	9	Lomas de Santa Cruz
2054	14090	9	La Joya
5836	55076	9	Las Américas
4965	55519	9	La Esperanza
1907	12400	2	San Miguel
3767	55414	9	La Nopalera 2a. Sección Tulpetlac
5	1010	9	Los Alpes
37	55119	9	El Dique
1321	9060	9	Sector Popular
1303	9000	2	San Pablo
1943	13120	2	Santiago
6299	55066	9	La Preciosa
3643	55237	21	Estrella de Oriente
243	50080	2	San Bernardino
347	1900	9	Jardines del Pedregal
2465	16410	9	Lomas de Tonalco
1983	13460	9	El Triángulo
2726	9705	9	Degollado - Mexicatlalli
3494	55056	21	Villas de Ecatepec
2245	14646	9	Valle de Tepepan
481	2930	9	Liberación
3531	55070	21	Jardines de Morelos Sección Playas
341	1857	9	Lomas de Chamontoya
3678	55268	9	Novela Mexicana II
3536	55080	21	El Bosque
2361	15840	9	Sevilla
4	55010	21	Camino Nacional
867	6060	9	Centro (Área 6)
2847	1849	9	Rancho del Carmen del Pueblo San Bartolo Ameyalco
774	5240	9	El Molino
2380	16000	2	San Antonio
3427	55017	9	El Tejocote
827	5750	9	La Pila
3660	55246	21	Petroquímica Ecatepec
2323	15430	9	Aquiles Serdán
4574	57400	9	El Barco Primera Sección
477	2870	9	San Salvador Xochimanca
74	1170	9	Abraham M. González
328	1807	9	Rancho San Francisco Pueblo San Bartolo Ameyalco
5531	50210	9	Santa Cruz Otzacatipan
1734	10840	2	Plazuela del Pedregal
1201	7919	9	Ex Ejido San Juan de Aragón Sector 32
488	2990	9	La Raza
2844	1650	9	El Ruedo
68	55405	9	La Purísima
915	6470	9	San Rafael
2071	14120	9	Rincón del Pedregal
8411	50256	9	Las Barranquitas
1883	12000	2	Santa Martha
1153	7720	9	Lindavista Vallejo I Sección
1355	9210	9	Tepalcates
994	7010	9	Rosas del Tepeyac
4786	55074	9	Los Pinos
461	2750	28	Santiago Ahuizotla
1505	9720	9	Francisco Villa
3657	55244	9	Parques de Aragón
2430	16080	2	San Esteban
6187	55029	9	Playa Golondrinas
7984	55016	9	Mesa de los Leones
4962	55404	9	El Chamizalito
69	55055	31	La Veleta
2048	14070	9	Rómulo Sánchez Mireles
8330	50294	2	De Santa Cruz
7819	57500	9	Agua Azul Grupo B Super 4
176	1389	9	Santa Fe Tlayapaca
1357	9220	9	Unidad Ejército Constitucionalista
672	4630	9	Adolfo Ruiz Cortínes
758	5129	9	Lomas del Chamizal
79	1200	9	Arturo Martínez
1278	8700	9	Juventino Rosas
219	50040	2	San Luis Obispo
2896	13360	2	Santiago Sur
1815	11490	9	Pensil Sur
4925	55020	9	10 de Abril
428	2500	9	Unidad Cuitláhuac
2881	14110	9	Ampliación Fuentes del Pedregal
3697	55289	12	Bugambilias de Aragón
124	1270	9	Golondrinas 1a Sección
7	50260	21	Atenea
2308	15310	9	Felipe Ángeles
3635	55220	9	Vicente Guerrero
20	50280	2	Los Uribe
231	50060	21	Lomas Altas
2778	11000	9	Lomas de Chapultepec V Sección
313	50150	12	Juan Beltrán
512	3320	9	Residencial Emperadores
3699	55290	9	Granjas Independencia
3782	55450	21	Prados de Santa Clara
2497	13093	9	San Sebastián
2029	14010	9	Parque del Pedregal
1919	13000	2	La Asunción
1461	9637	9	Campestre Potrero
1341	9200	9	Unidad Vicente Guerrero
4646	57950	9	Ampliación Las Águilas
2186	14410	9	Fuentes Brotantes
318	1780	9	Olivar de los Padres
4613	57719	9	Ampliación General José Vicente Villada Poniente
692	4800	9	Los Cedros
2331	15520	9	Peñón de los Baños
1621	9880	9	Granjas Estrella
676	4650	28	Santa Úrsula Coapa
172	1377	9	Jalalpa El Grande
8375	50263	2	San Juan Apóstol
730	4970	9	Haciendas de Coyoacán
4605	57620	9	México Primera Sección
8321	50270	2	Tlalnepantla
3780	55430	21	Jardines de Casa Nueva
1168	7790	9	Guadalupe Victoria
800	5400	9	El Tianguillo
4963	55404	9	El Charco II
421	2459	9	Tezozomoc
6210	55074	9	Los Cordeles
8302	50295	9	La Trinidad
1286	8800	2	Santiago Sur
19	50180	10	San Fermín Residencial
3799	55517	9	El Mirador
8318	50270	9	San Pablo
449	2700	28	San Miguel Amantla
2428	16080	2	San Cristóbal
2854	9630	9	San Miguel Teotongo Sección Iztlahuaca
6189	55029	9	Independencia
1138	7580	9	Ampliación Casas Alemán
1392	9350	9	Albarrada
2221	14490	28	San Miguel Xicalco
3704	55295	31	Licenciado Pedro Ojeda Paullada
1950	13219	9	Las Arboledas
6255	55118	31	Sosa Ecatepec
4782	55064	21	San Isidro Atlautenco
168	50010	9	La Magdalena
479	2910	9	Aldana
3559	55090	21	Río Piedras
8372	50265	9	El Chorrito
768	5219	9	Granjas Navidad
6264	55267	21	Sauces II
1949	13210	9	Los Olivos
2587	13545	9	Ampliación La Conchita
2867	5030	9	La Manzanita
2155	14370	9	Residencial Chimali
1051	7220	9	Castillo Chico
322	50160	21	Villas de Santa Ana II
1899	12200	2	Panchimalco
2806	4840	9	Ex-Ejido de San Pablo Tepetlapa
8358	50100	2	Tlayaca
1863	11840	9	Ampliación Daniel Garza
1633	9897	9	Carlos Jonguitud Barrios
4924	55020	31	Magisterial 2000
3473	55040	21	Renovación Jajalpa
1436	9510	28	Santa Martha Acatitla
751	5118	9	Granjas Palo Alto
117	1269	9	1a Sección Cañada
480	2920	9	Ampliación Cosmopolita
2261	14700	28	San Miguel Ajusco
108	1250	9	Tecolalco
753	5120	9	Bosques de las Lomas
402	2300	9	Industrial Vallejo
3538	55080	12	Jesús Sánchez
324	50160	21	Villas de Santa Ana IV
8386	50264	9	San Pablo
606	4320	9	Cuadrante de San Francisco
4792	55064	21	Vistas de Ecatepec (Sección B)
3573	55115	9	José María Morelos y Pavón Sagitario X
112	1260	9	La Mexicana
3612	55170	9	16 de Septiembre
6212	55074	9	Ejido de Atlautenco
261	50100	9	Miguel Hidalgo (Corralitos)
444	2640	9	Monte Alto
6195	55010	9	Las Piedras
2007	13630	2	San Agustín
1767	11240	9	Ignacio Manuel Altamirano
2515	16810	28	San Andrés Ahuayucan
1026	7140	9	Arboledas
70	57130	9	Las Antenas o Claustro de Sor Juana Inés de la C.
1694	10360	9	Huayatla
2836	16780	9	Cerrillos Tercera Sección
4578	57410	9	Maravillas
3659	55245	9	México Independiente
2358	15810	9	Merced Balbuena
2232	14609	9	Las Tórtolas
3523	55070	21	Jardines de Morelos Sección Cerros
2194	14426	9	Texcaltenco
269	1619	9	Rinconada de Tarango
2324	15440	9	1° de Mayo
4604	57610	9	Pavón Sección Silvia
3490	55055	31	Llano de los Báez
8458	50260	21	Alejandría
2869	5330	9	Ampliación el Yaqui
47	1120	9	Las Américas
125	1270	9	Golondrinas 2a Sección
1811	11480	9	Francisco I Madero
1806	11460	9	Lago Sur
291	50130	9	Cuauhtémoc
3668	55264	31	Prizo I
1855	11650	9	Reforma Social
6985	50295	9	Aviación Autopan
2467	16428	9	El Jazmín
1596	9860	9	Bellavista
3514	55067	9	Ciudad Cuauhtémoc Sección Quetzalcoatl
3552	55090	9	San José Jajalpa
4756	55029	9	Luis Donaldo Colosio
4629	57819	21	Parque Industrial Nezahualcóyotl
998	7040	28	Santiago Atzacoalco
1771	11260	9	San Joaquín
1735	10900	28	San Nicolás Totolapan
2695	14735	4	Lomas de Tepemecatl
2100	14250	9	Miguel Hidalgo 4A Sección
2494	16710	9	Quirino Mendoza
2874	12940	2	San José
622	4340	9	Copilco El Bajo
3469	55040	31	Hogares Mexicanos
164	50010	9	Club Jardín
5545	50010	9	El Tejocote
4609	57708	9	Evolución Poniente
1237	8010	9	Ex-Ejido de La Magdalena Mixiuhca
1970	13319	9	La Estación
255	50100	21	El Trigo
1322	9070	9	Granjas de San Antonio
1010	7070	9	Martín Carrera
2168	14386	9	Rancho los Colorines
2853	9630	9	San Miguel Teotongo Sección Guadalupe
2310	15330	9	Tres Mosqueteros
529	3550	9	Zacahuitzco
2407	16035	9	San Lorenzo La Cebada
2789	11930	9	Lomas de Reforma
6973	50235	2	Guadalupe Totoltepec
691	4800	9	Alianza Popular Revolucionaria
3711	55299	9	Ejercito del Trabajo I
1128	7520	9	25 de Julio
6293	55060	31	Privadas de Ecatepec
1131	7540	9	La Esmeralda
2782	11530	9	Polanco II Sección
2170	14388	9	Guadalupe
1296	8930	9	Campamento 2 de Octubre
766	5200	9	San José de los Cedros
1901	12200	2	Tula
36	1110	9	El Capulín
4923	55280	9	Nuevo Valle de Aragón
7981	55020	21	Residencial San Cristóbal
7822	57440	9	Martínez del Llano
5537	50210	9	Los Sauces IV
1219	7979	9	San Juan de Aragón V Sección
2360	15830	9	Artes Gráficas
2344	15660	9	Arenal 3a Sección
1300	9000	2	San Ignacio
3796	55515	9	Los Bordos
7885	57185	9	Cuchilla del Tesoro
2786	11850	9	San Miguel Chapultepec II Sección
1720	10660	9	El Ermitaño
1093	7359	2	San Rafael Ticomán
2354	15740	9	Aviación Civil
378	2099	9	Ángel Zimbrón
4555	57170	9	Bosques de Aragón
280	1650	9	Ampliación Tlacuitlapa
2402	16030	9	La Noria
1425	9440	9	El Retoño
3771	55417	9	Guadalupe Coatzochico
3621	55189	9	Novela Mexicana I
1772	11270	9	Argentina Antigua
2146	14340	9	Vergel del Sur
6197	55010	12	Bonito las Flores
11	50210	21	Fuentes de San José
114	1260	9	La Palmita
4759	55018	31	San Carlos
571	4100	9	Del Carmen
537	3630	9	Independencia
7055	50295	21	Galaxia Toluca
1251	8210	9	Nueva Santa Anita
465	2780	9	Plenitud
2376	15970	9	Aeronáutica Militar
1204	7930	9	Indeco
1961	9960	9	Allapetlalli
2272	14740	9	Lomas de Padierna Sur
1600	9860	9	Cerro de La Estrella
3651	55240	31	Alborada
5079	55506	9	Buenavista
8467	50265	9	Las Palomas
2861	9630	9	San Miguel Teotongo Sección Ranchito
181	50227	21	La Floresta
2471	16440	9	Año de Juárez
2736	9960	9	La Planta
206	1470	2	Alfalfar
6984	50290	2	Jicaltepec Autopan
6229	55410	9	Lomas de San Carlos Cantera
6263	55267	21	Sauces V
8270	50255	9	Cristo Rey
1906	12400	2	San Juan
2473	16459	9	Ampliación Nativitas
2349	15700	9	Federal
1937	13100	2	La Guadalupe
418	2440	9	Providencia
8380	50263	2	Del Espíritu Santo
2548	7164	9	Luis Donaldo Colosio
3593	55130	9	Olímpica 68 I
2353	15730	9	4 Árboles
677	4660	9	Joyas del Pedregal
1480	9696	9	Miravalles
483	2950	9	Del Gas
268	1619	9	La Martinica
304	50140	21	Valle Don Camilo
2176	14390	9	Residencial Villa Coapa
3570	55100	9	Francisco I. Madero
6282	55067	9	Tepetzingo el Chico
7842	50170	9	Ocho Cedros 2a Sección
3662	55247	31	CROC Aragón
2169	14387	9	Ex Hacienda San Juan de Dios
1702	10400	9	San Jerónimo Aculco
265	50100	9	Parques Nacionales
1882	12000	2	Santa Cruz
1160	7740	9	Valle del Tepeyac
2161	14377	9	Hacienda San Juan
399	2240	28	San Andrés
152	1296	9	Jalalpa Tepito 2a Ampliación
8489	50254	21	Balcones de San Felipe
3617	55236	9	Códice Mendocino I
1414	9410	9	San José Aculco
8144	55130	21	Nuevo Paseo San Agustín 3a B
715	4909	9	Culhuacán CTM Sección IX-A
2084	14209	9	Torres de Padierna
5698	50210	21	Los Sauces V
4915	55010	9	El Progreso de Guadalupe Victoria
1088	7340	9	San José Ticomán
5661	55330	9	Prados de Xalostoc
947	6700	9	Roma Norte
2041	14039	9	Ampliación Isidro Fabela
1141	7620	9	Santa Rosa
1100	7380	9	Tlacamaca
6254	55118	9	Ampliación Joyas de Ecatepec
1453	9600	28	Santiago Acahualtepec
1880	12920	2	San Marcos
293	50130	9	Francisco Murguía El Ranchito
894	6220	9	Peralvillo
8390	50253	9	Los Álamos
342	50180	9	Azteca
1003	7058	9	15 de Agosto
44	55066	2	Terremote
515	3340	9	General Pedro María Anaya
3485	55050	9	San Martín de Porres
4787	55055	9	Jubilados y Pensionados
8430	50258	9	Rancho Buenavista
898	6270	9	Maza
6188	55029	9	Golondrinas
2326	15460	9	Revolución
1036	7180	9	Cocoyotes
5608	55295	9	Ampliación Nicolás Bravo
4610	57709	9	Ampliación Evolución
1978	13430	9	Ampliación Selene
303	1740	9	La Peñita del Pueblo Tetelpan
8341	50284	9	Tenojo
8453	50245	31	Residencial la Joya
6244	55429	9	Tepetzicasco
7054	50295	21	Real de San Pablo
64	1150	9	Tolteca
4634	57840	9	Reforma
2886	7838	9	Gertrudis Sánchez 3a Sección
522	3440	9	Niños Héroes
1184	7859	9	Ampliación Mártires de Río Blanco
374	2080	9	Clavería
8360	50100	2	Atotonilco
1415	9420	9	Los Picos VI-B
3814	55549	9	Área Santa Cruz
320	50160	9	Santa Ana Tlapaltitlán
2784	11550	9	Polanco IV Sección
8315	50200	9	Santa Rosa
194	1410	9	Palmas
1862	11830	9	Daniel Garza
1988	13520	9	Francisco Villa
8357	50016	2	De la Crespa
2377	15980	9	24 de Abril
1382	9310	9	Leyes de Reforma 1a Sección
2259	14658	9	Mirador del Valle
3786	55490	9	Miguel Hidalgo
8391	50253	9	El Calvario
2063	14100	9	Pedregal de San Nicolás 4A Sección
1898	12200	2	Ocotitla
6249	55548	9	Dos de Octubre
1500	9708	9	Mixcoatl
3588	55130	21	Nuevo Paseo de San Agustín
6192	55010	9	Mathzi II
1008	7070	9	Dinamita
5668	55414	9	Margarita Maza de Juárez
297	1720	9	Lomas de Guadalupe
87	55074	9	Mexicanos Unidos I
1435	9500	28	Santa María Aztahuacán
1370	9239	9	Ejército de Oriente Zona Peñón
2669	10369	9	Tierra Unida
1565	9830	9	Lomas El Manto
1281	8730	9	Gabriel Ramos Millán
3677	55268	21	Sauces Coalición
2906	16604	2	San Andrés
369	2060	9	Un Hogar Para Cada Trabajador
7839	55118	9	Cuchilla de la Draga
1928	13050	9	La Habana
3542	55084	9	El Ranchito
1079	7320	2	La Purísima Ticomán
1188	7869	9	Belisario Domínguez
1216	7969	9	San Juan de Aragón II Sección
1368	9230	9	El Paraíso
1301	9000	2	San José
3739	55349	9	Urbana Ixhuatepec
2899	16443	2	Pocitos
2638	1548	9	Villa Progresista
270	50110	9	Cultural
2777	11000	9	Lomas de Chapultepec IV Sección
5109	50240	21	El Olimpo
2434	16090	2	Xaltocan
1568	9830	9	Paraje San Juan
1279	8710	9	Tlazintla
279	50120	9	Ciprés
640	4380	9	El Rosario
3598	55137	31	INDECO Santa Clara (Campiñas de Aragón)
1975	13419	9	Ampliación José López Portillo
2095	14240	9	Lomas Hidalgo
1957	13250	9	La Turba
1445	9570	9	Santa María Aztahuacán
1102	7410	9	Juan González Romero
2453	14654	9	Dolores Tlalli
2080	14200	9	Héroes de Padierna
7881	57420	9	Nezahualcóyotl Segunda Sección
6988	50290	15	El Cerro del Perico
430	2519	9	El Jagüey
4943	55067	9	Ciudad Cuauhtémoc Sección Tlaloc
3444	55028	9	Vista Hermosa
532	3580	9	Miravalle
7843	50250	21	Las Margaritas
991	7000	9	Aragón la Villa
3602	55140	21	Rinconada de Aragón
1893	12100	2	Tecaxtitla
2312	15340	9	Venustiano Carranza
328	50168	9	Santa María Zozoquilpan
5121	50010	2	San Angelín
2372	15960	9	Del Parque
3489	55055	21	Jardines de los Báez 3a Sección
333	50170	9	Ocho Cedros
315	1770	9	La Angostura
2351	15640	9	Arenal Puerto Aéreo
1986	13509	2	La Concepción
3513	55067	9	Ciudad Cuauhtémoc Sección Moctezuma
8405	50255	9	Santiago Tlacotepec Centro
286	50122	34	Zona Militar
2860	9630	9	San Miguel Teotongo Sección Puente
1194	7890	9	La Joya
1272	8620	2	Los Reyes
6227	55090	9	El Pocito
2321	15410	9	Simón Bolívar
1111	7455	9	Ferrocarrilera
542	3710	9	Ciudad de los Deportes
1789	11370	9	Tlaxpana
1728	10800	9	La Cruz
4752	55029	9	Ejidos de San Andrés
6294	55066	31	Portal Chiconautla
3756	55407	31	Talleres Gráficos
3420	55000	9	San Cristóbal Centro
3676	55268	31	Sauces VI
474	2840	9	Obrero Popular
7873	57700	9	Evolución Súper 43
820	5710	9	Las Maromas
829	5760	9	Las Lajas
4934	55050	21	Hacienda Santa María
655	4470	9	Presidentes Ejidales 1a Sección
1700	10379	9	Vista Hermosa
1075	7310	2	Candelaria Ticomán
1935	13099	2	San Andrés
1629	9890	9	Lomas Estrella
8319	50270	2	Buenavista
2167	14380	9	San Bartolo El Chico
1597	9860	9	Ampliación Bellavista
523	3500	9	Nativitas
2640	1630	9	Los Juristas
1329	9090	9	Héroes de Churubusco
335	50170	9	El Seminario 1a Sección
3502	55064	9	Ampliación San Isidro Atlautenco
6253	55490	31	Finca San Miguel
316	50150	21	Vértice
2426	16070	2	Santa Crucita
276	50110	9	Vicente Guerrero
8389	50253	9	Dos Ríos
228	50050	2	Zopilocalco Sur
391	50250	21	Las Palomas
8	50260	21	Miramonte
1291	8830	9	Militar Marte
664	4519	9	La Otra Banda
1156	7730	9	Montevideo
284	1700	9	San Agustín del Pueblo Tetelpan
1325	9080	9	Cacama
3795	55510	9	Tepeolulco
8314	50200	9	La Concepción
195	1419	9	Minas Cristo Rey
203	50020	21	Valle de Santiago Residencial
1039	7188	9	Tlalpexco
4794	55066	9	Zopilocalco
364	2050	9	Libertad
2190	14420	9	Mesa de los Hornos
1739	10926	4	Tierra Colorada
3813	55548	9	Área Zapotecas
5658	55418	9	Cuauhtémoc
2132	14330	9	Granjas Coapa
356	50190	9	Unidad Victoria
3580	55119	21	Valle de Ecatepec Estado de México CTM XIII
2163	14380	9	A.M.S.A
3727	55330	9	Jardines de Xalostoc
1958	13270	9	Del Mar
649	4420	9	Ex-Ejido de San Francisco Culhuacán
724	4930	9	Santa Cecilia
1506	9720	9	La Era
782	5270	9	Manzanastitla
288	50130	9	Altamirano
2182	14406	9	Divisadero
1638	9900	2	San Antonio
2683	1376	9	Santa Fe La Loma
2238	14630	9	Villa Tlalpan
202	1450	9	Hogar y Redención
3633	55220	21	Jardines de San Gabriel
300	50140	9	Nueva Santa María de las Rosas
173	50010	21	Los Girasoles IV
3789	55500	12	Conjunto Tepeyac Hidalgo
4601	57530	9	Modelo
3423	55010	9	Ampliación Guadalupe Victoria
5	50295	37	Parque Industrial San Cayetano
354	50190	9	Emiliano Zapata
107	1250	9	Margarita Maza de Juárez
3801	55519	28	San Andrés de la Cañada
5584	55416	31	Benito Juárez 1ra. Sección
528	3540	9	Del Carmen
266	50100	9	Protinbos
3527	55070	21	Jardines de Morelos Sección Islas
4640	57900	9	Las Águilas
3656	55243	21	Haciendas de Aragón
2444	16210	9	La Concha
5701	50170	9	Isidro Fabela 2a Sección
8473	50230	9	San Blas Otzacatipan
1931	13070	2	La Magdalena
294	1710	9	Las Águilas
1092	7350	2	San Juan y Guadalupe Ticomán
3488	55055	21	Jardines de los Báez 2a Sección
4928	55020	12	Bosques de San Javier
8376	50263	2	De Cristo Rey
748	5110	9	Cooperativa Palo Alto
188	1408	9	Olivar del Conde 2a Sección
9629	57700	9	Evolución
2098	14250	9	Miguel Hidalgo 2A Sección
2487	16629	2	La Guadalupana
1207	7950	28	San Juan de Aragón
6256	55125	31	Aldeas de Aragón II
8448	50226	9	San Antonio Abad
2857	9630	9	San Miguel Teotongo Sección Loma Alta
6	55018	21	El Capulín
316	1770	9	San José del Olivar
8388	50253	9	Jardines de San Pedro
470	2810	9	Victoria de las Democracias
8444	50214	21	Balcones Santín
1049	7210	9	Chalma de Guadalupe
2333	15540	9	Santa Cruz Aviación
2478	16520	2	La Planta
287	1700	28	Tetelpan
8362	50265	2	Del Panteón
1870	11920	9	Real de las Lomas
422	2460	9	La Preciosa
1910	12500	28	San Lorenzo Tlacoyucan
1146	7670	9	Guadalupe Proletaria
2813	4490	9	Culhuacán CTM Canal Nacional
4617	57740	9	Metropolitana Segunda Sección
227	50050	2	Santa Bárbara
4575	57400	9	El Barco Segunda Sección
982	6860	9	Vista Alegre
2785	11560	9	Polanco V Sección
1256	8310	9	La Cruz
2108	14268	2	La Lonja
90	1220	9	Zenón Delgado
6986	50295	2	Balbuena
1176	7830	9	Gertrudis Sánchez 1a Sección
42	1120	9	Acueducto
1080	7320	9	Residencial la Escalera
3557	55090	21	Jajalpa Olímpica
7872	57700	9	Evolución Súper 22
5549	50150	9	Comisión Federal de Electricidad
966	6760	9	Roma Sur
1388	9320	9	Sideral
33	55080	9	Xochicuac I
2919	16030	9	Ampliación La Noria
1809	11470	9	Deportivo Pensil
3	55010	21	Los Lirios
2519	16840	9	Santa Cruz Chavarrieta
193	1410	9	Barrio Norte
1758	11200	9	Lomas de Sotelo
5586	55416	31	Benito Juárez 3ra. Sección
6257	55100	31	Villa 1o de Mayo
2413	16050	9	Jardines del Sur
292	1708	9	El Mirador del Pueblo Tetelpan
2489	16629	2	San Juan
6237	55400	31	Aldeas II
2388	16010	9	Paseos del Sur
670	4610	9	Xotepingo
1280	8720	9	Gabriel Ramos Millán Sección Tlacotal
718	4919	9	Emiliano Zapata Fraccionamiento Popular
3802	55520	9	Carlos Hank González
1238	8020	9	Ampliación Gabriel Ramos Millán
6225	55050	9	Rancho Jajalpa
1203	7920	9	San Juan de Aragón
8364	50265	9	Sixto Noguez
1576	9839	9	San Juan Joya
2835	16780	9	Cerrillos Segunda Sección
1166	7780	9	Defensores de La República
546	3800	9	San Pedro de los Pinos
1492	9704	9	Degollado
3631	55218	9	Cuchilla A. Rosales
3615	55236	9	Códice Mendocino II
2783	11540	9	Polanco III Sección
277	1650	9	La Milagrosa
104	1250	9	El Árbol
3777	55425	9	Cerro Gordo
1942	13120	9	Ampliación Santa Catarina
1122	7500	9	La Pradera
1099	7380	9	Maximino Ávila Camacho
708	4890	9	Jardines de Coyoacán
5662	55330	9	La Laguna 21
339	50170	9	El Seminario 5a Sección
8408	50255	9	Guadalupe
493	3020	9	Narvarte Poniente
3701	55290	9	Granjas Independencia Sección B
8368	50265	9	La Capilla
315	50150	9	Salvador Sánchez Colín
2109	14269	2	La Fama
305	1750	9	Las Águilas 1a Sección
92	1230	9	Campo de Tiro los Gamitos
37	1110	9	Ampliación El Capulín
1444	9560	9	Paraje Zacatepec
1761	11210	28	San Lorenzo Tlaltenango
1693	10350	9	Lomas de San Bernabé
548	3810	9	Nápoles
3553	55090	31	Jajalpa
2335	15610	9	Cuchilla Pantitlán
8303	50295	9	Julián Escalante
2741	14620	9	Club de Golf México
8457	50260	21	Villas Santa Esther
2439	16100	28	Santa Cruz Xochitepec
2270	14739	9	2 de Octubre
5532	50265	9	San Miguel Zacango
3484	55050	9	Nuevo Díaz Ordaz
2470	16430	9	Xochipilli
740	5050	28	San Pablo Chimalpa
3663	55248	21	Fuentes de Aragón
14	1049	28	Tlacopac
5664	55509	9	Plan de Ayala
8423	50260	9	Capultitlán Centro
8344	50290	9	El Cerrito
671	4620	28	San Pablo Tepetlapa
2848	1650	9	Santa Lucía Chantepec
2864	1376	9	Santa Fe Centro Ciudad
2521	16860	9	Santa Cruz de Guadalupe
139	1280	9	El Pocito
2852	9630	9	San Miguel Teotongo Sección Capilla
167	50190	9	La Magdalena
3645	55238	21	Izcalli Santa Clara
362	2040	9	Del Maestro
3685	55270	9	Granjas Valle de Guadalupe Sección A
390	2129	9	Nueva España
3806	55530	9	El Gallito
2102	14260	2	El Capulín
1791	11400	9	Popotla
900	6300	9	Guerrero
1904	12300	28	San Salvador Cuauhtenco
1106	7420	9	Nueva Atzacoalco
299	1730	9	Lomas de las Águilas
8143	50270	2	Tepetongo
1413	9410	28	Magdalena Atlazolpa
7823	57440	9	Xochitenco
4755	55029	9	Laguna del Rey
1205	7939	9	Héroes de Chapultepec
255	1569	9	Reacomodo Valentín Gómez Farías
4751	55029	31	Ehécatl (Paseos de Ecatepec)
2774	11000	9	Lomas de Chapultepec VIII Sección
360	50280	28	Calixtlahuaca
3675	55267	9	Quinto Sol
6271	55284	9	Renacimiento Chico
1070	7280	9	Jorge Negrete
21	50205	9	Ejido de la Y Sección Siete A Revolución
1040	7189	9	Ahuehuetes
365	50200	28	San Andrés Cuexcontitlán
4584	57450	9	Volcanes
2600	16776	9	El Mirador
580	4200	9	Campestre Churubusco
1305	9000	2	Santa Bárbara
8328	50280	9	La Peña
1801	11450	9	Ahuehuetes Anáhuac
8425	50258	9	El Mostrante
1244	8100	9	Agrícola Pantitlán
251	1560	9	Canutillo 2a Sección
1101	7400	9	Salvador Díaz Mirón
2045	14050	9	Toriello Guerra
3601	55140	21	Jardines de Aragón
5587	55515	9	La Teja
59	1140	9	Bellavista
345	1870	9	Lomas de los Cedros
879	6090	9	Centro (Área 9)
103	1240	9	Pueblo Nuevo
5550	50235	9	El Cerrillo Vista Hermosa
1602	9860	9	El Rodeo
343	1859	9	Tlacoyaque
2115	14300	9	Residencial Miramontes
674	4980	9	Ex-Ejido de Santa Úrsula Coapa
2781	11510	9	Polanco I Sección
267	1618	9	Arcos Centenario
207	1470	9	Molino de Rosas
337	50170	9	El Seminario 3a Sección
1126	7510	9	San Felipe de Jesús
1159	7739	9	Planetario Lindavista
1542	9800	9	Valle de Luces
8297	50010	21	Hacienda San Agustín
2643	1539	9	Cooperativa Unión Olivos
2091	14230	9	Cultura Maya
67	1160	9	Isidro Fabela
6361	50227	21	Geovillas de San Mateo
1972	13400	28	San Francisco Tlaltenco
1508	9730	9	Reforma Política
4783	55074	9	Viento Nuevo
10	50228	10	La Perla
1167	7780	9	Héroe de Nacozari
412	2410	9	Prados del Rosario
1043	7200	9	Cuautepec de Madero
4552	57150	9	Vergel de Guadalupe
1033	7150	9	La Casilda
467	2800	9	Nueva Santa María
2274	14748	9	Mirador II
4620	57760	9	Ampliación General José Vicente Villada Súper 43
3731	55338	9	Melchor Ocampo
2359	15820	9	Lorenzo Boturini
5526	50070	21	Villas Fontana I
6235	55419	9	El Cortijo
646	4410	9	Petrolera Taxqueña
113	1260	9	Ampliación La Mexicana
2208	14449	9	El Mirador 1A Sección
984	6880	9	Algarin
250	1560	9	Canutillo 3a Sección
3479	55050	9	Aquiles Serdán
819	5700	9	Cruz Blanca
7050	50285	2	Zimbrones
6981	50250	15	Santa Juanita
2420	16059	9	Pueblo Santiago Tepalcatlalpan, U.H. Rinconada del Sur
168	1330	9	Paseo de las Lomas
476	2860	9	Tlatilco
7920	50010	21	Los Girasoles I
1482	9698	9	Miguel de La Madrid Hurtado
2687	7180	9	Ampliación Cocoyotes
3672	55266	9	México Revolucionario
1485	9700	9	Buenavista
2812	4480	9	Culhuacán CTM CROC
184	50017	21	Brisas
737	5030	9	San Pedro
659	4490	9	Culhuacán CTM Sección Piloto
3689	55280	9	Renacimiento de Aragón
2081	14200	9	Jardines del Ajusco
2205	14438	9	Pedregal de Santa Úrsula Xitla
5534	50265	21	Villas Santa Isabel
1813	11489	9	Ampliación Popo
1	55010	21	Bonito Arboledas
2868	5610	28	Santa Rosa Xochiac
45	57138	31	Emiliano Zapata
6226	55050	31	Pirules de Villancico 2a Sección
2	55010	21	Privada de Ecatepec
1601	9860	9	Parque Nacional Cerro de la Estrella
2747	1566	9	Hueytlale
6990	50255	9	El Durazno
2027	14000	9	Tlalpan Centro
1187	7860	9	Tablas de San Agustín
2798	2630	9	Coltongo
2427	16080	2	La Santísima
3510	55067	9	Ciudad Cuauhtémoc Sección Cuitlahuac
8461	50228	21	Arboleda V
95	55020	9	Panitzin
1710	10600	9	El Rosal
355	50190	9	Eva Sámano de López Mateos
7046	50240	21	Los Ahuehuetes
8310	50285	29	San Isidro
298	1729	9	Alcantarilla
8385	50264	9	Las Palmas
4549	57138	9	Canal de Sales
1947	13200	9	Miguel Hidalgo
6551	50223	37	Parque industrial Exportec II
5669	55418	9	Progreso Chico Tulpetlac
3729	55330	9	San Francisco Xalostoc
544	3730	9	San Juan
264	50100	21	Parque de San Mateo
1270	8610	2	Zapotla
911	6400	9	Santa María la Ribera
4568	57300	9	Tamaulipas
1433	9480	9	El Prado
1713	10610	9	El Toro
2064	14100	9	Pedregal de San Nicolás 5ª Sección
729	4960	9	Villa Quietud
7049	50255	9	Vista Hermosa
2303	15290	9	10 de Mayo
1945	13150	2	La Concepción
3741	55360	9	San José Xalostoc
1005	7060	9	Estanzuela
2490	16630	2	San Juan Moyotepec
4812	55060	21	Los Héroes Ecatepec Sección V
289	50130	9	Américas
1032	7150	9	Juventino Rosas
1534	9800	9	El Mirador
1352	9209	9	Renovación
506	3240	9	Acacias
1551	9819	9	Valle del Sur
1812	11480	9	Popo
1384	9319	9	Cuchilla del Moral
1718	10640	9	Pueblo Nuevo Bajo
6242	55518	9	Arboledas de Xalostoc
1934	13090	9	Quiahuatla
1098	7370	9	Capultitlan
4914	55010	31	Pozo de la Pila
278	1650	9	Palmas Axotitla
8349	50290	9	Chichipicas
3483	55050	31	Izcalli Jardines
2005	13625	2	Santa Cruz
8348	50290	9	Chupascliya
1562	9830	9	El Manto
8450	50245	21	Campo Real II
8459	50235	9	San Francisco
2882	14653	9	Heróico Colegio Militar
1320	9060	9	Escuadrón 201
2423	16070	2	Belén
410	2400	28	San Juan Tlihuaca
2411	16040	2	La Asunción
3496	55059	31	Pirules de Villancico 1a Sección
1293	8900	9	INFONAVIT Iztacalco
8438	50228	2	La Crespa
1588	9850	9	San Nicolás Tolentino
343	50180	21	Bosques de Colón
1594	9858	9	Paraje San Juan Cerro
3511	55067	9	Ciudad Cuauhtémoc Sección Embajada
312	50150	9	Izcalli Toluca
220	50040	2	San Miguel Apinahuizco
22	1080	9	Progreso Tizapan
2246	14647	9	Juventud Unida
1473	9680	9	Tenorios
1150	7708	9	Torres Lindavista
1	14410	9	Bosques de Tepeximilpa
1757	11200	9	Lomas Hermosa
2888	7300	9	Lindavista Sur
262	50100	9	Niños Héroes
1964	13300	2	Santiago Centro
1456	9620	9	Lomas de Zaragoza
2464	16400	28	San Lorenzo Atemoaya
2179	14400	28	San Andrés Totoltepec
1430	9460	9	Justo Sierra
282	50120	9	Morelos 1a Sección
9	50260	21	La Rivera
146	1289	9	Reacomodo El Cuernito
3693	55280	9	Ampliación Valle de Aragón Sección A
4781	55070	9	Llanos de Morelos I
1686	10300	28	San Bernabé Ocotepec
333	1830	28	Santa Rosa Xochiac
3603	55146	9	Tolotzin II
3530	55070	21	Jardines de Morelos Sección Montes
2891	13300	2	Santa Ana Poniente
509	3310	9	Santa Cruz Atoyac
2458	16300	28	San Lucas Xochimanca
3717	55316	9	Ampliación San Pedro Xalostoc
3589	55130	21	Nuevo Paseo de San Agustín 2a Secc
397	2230	28	Santa Bárbara
398	2240	2	San Andrés
4954	55100	21	Villas 1o de Agosto
1805	11460	9	Lago Norte
3695	55287	9	Fernando Alba Ixtlaxóchitl
603	4318	2	Oxtopulco Universidad
3732	55339	21	Villas de Guadalupe Xalostoc
4553	57158	9	Joyas de Aragón
584	4230	9	Prado Churubusco
337	1849	9	Rincón de la Bolsa
6284	55067	21	C.T.M. Guadalupana
7051	50285	9	2 de Marzo
156	1298	9	Ampliación Piloto Adolfo López Mateos
3774	55418	9	Ampliación Santa María Tulpetlac
163	50010	9	Celanese
3590	55130	21	Nuevo Paseo de San Agustín 3a Sección
1752	11040	9	Molino del Rey
974	6800	9	Obrera
6266	55264	31	Prizo III
569	4030	2	San Lucas
8452	50245	31	Las Bugambilias
8779	50233	37	Parque industrial Vesta
273	1630	9	Puerta Grande
5527	50070	21	Villas Fontana II
556	3900	9	San José Insurgentes
601	4310	9	Romero de Terreros
8355	50010	2	La Loma
178	50010	21	Universidad
2067	14108	9	Chichicaspatl
2036	14030	9	Isidro Fabela
4570	57300	9	Tamaulipas Sección Virgencitas
208	50290	9	Ejido Santa Cruz Atzcapotzaltongo
873	6070	9	Centro (Área 7)
1981	13450	9	Guadalupe Tlaltenco
466	2790	2	Santa Apolonia
8350	50290	9	Santa Cruz Atzcapotzaltongo
4961	55296	31	A.S.A.
295	1710	9	Ampliación Alpes
3449	55030	9	Tata Félix
8412	50256	9	El Canal
2364	15870	9	Aarón Sáenz
2278	14760	9	Héroes de 1910
1197	7900	9	Cuchilla del Tesoro
1808	11470	9	5 de Mayo
8466	50200	21	Paseos del Pilar
2093	14239	9	Los Encinos
719	4920	9	Los Girasoles
3738	55348	37	Parque Industrial Xalostoc
40	55066	21	El Potrero
5115	50210	21	Los Sauces I
2002	13600	2	San Bartolomé
6288	55066	21	Bosques de Santo Tomás
1528	9780	9	Lomas de San Lorenzo
184	1400	9	Preconcreto
2849	1550	9	Rinconada Las Cuevitas
8406	50255	9	El Mirador
1913	12800	28	San Juan Tepenahuac
8443	50210	21	Hacienda del Valle I
3624	55200	9	Emiliano Zapata 1a Sección
6209	55074	9	Ampliación 19 de Septiembre 1A Sección
2265	14730	9	Lomas de Cuilotepec
2106	14266	9	Zacayucan Peña Pobre
3478	55050	9	Adolfo Ruiz Cortines
2424	16070	2	El Rosario
6233	55418	9	Mexicalco III
491	3010	9	Atenor Salas
232	1538	9	Tepopotla
340	50170	9	Villa Hogar
4548	57130	9	Impulsora Popular Avícola
2296	15220	9	Popular Rastro
2879	14308	9	Ex Hacienda Coapa
5078	55025	9	Ampliación el Carmen
2241	14643	9	Fuentes de Tepepan
513	3330	9	Xoco
78	1180	9	San Pedro de los Pinos
17	50260	10	Victoria Residencial
3735	55340	9	Viveros de Xalostoc
8451	50245	31	Campo Real III
4599	57510	9	Agua Azul Sección Pirules
3568	55107	21	Industrias Tulpetlac
8317	50200	9	San Salvador
6239	55400	31	ISSEMYM
2530	16900	28	San Francisco Tlalnepantla
243	1549	9	Dos Ríos del Pueblo Santa Lucía
6234	55416	9	Progreso Tlajoyuca
3652	55240	9	La Florida
326	50160	21	Villas de Santa Ana VI
3661	55247	9	Ciudad Oriente
131	1275	9	Villa Solidaridad
4611	57710	9	General José Vicente Villada
389	2128	9	Nueva El Rosario
8472	50230	9	San Blas Totoltepec
636	4369	9	Pedregal de Santo Domingo
9641	50285	15	Almoloya de Juárez
5118	50260	21	Paseos del Valle
199	50020	28	Santiago Miltepec
2894	13300	2	Santiago Norte
983	6870	9	Paulino Navarro
3471	55040	21	La Propiedad
541	3700	9	Santa María Nonoalco
3809	55540	28	Santa Clara Coatitla
3737	55347	9	Ampliación San José Xalostoc
109	1259	9	Ampliación La Cebada
1369	9230	9	José María Morelos y Pavón
1982	13450	9	Ojo de Agua
1807	11460	9	Los Manzanos
1028	7140	9	Forestal
1443	9550	9	Monte Alban
2197	14427	9	Tepeximilpa la Paz
1016	7100	9	Cuautepec Barrio Alto
1536	9800	9	Fuego Nuevo
1764	11220	9	Periodista
1518	9760	9	Consejo Agrarista Mexicano
2153	14360	9	Magisterial
1037	7180	9	General Felipe Berriozabal
8436	50228	31	Geovillas de la Independencia II
4964	55518	9	La Lomita
6228	55090	31	Ecatepec 40 Casas
2363	15860	28	La Magdalena Mixiuhca
104	55074	9	Playas de San Juan
2779	11000	9	Lomas de Chapultepec VI Sección
533	3590	9	Ermita
3465	55040	21	Boulevares Impala
6285	55067	9	Tepopotla
1163	7770	9	Panamericana
653	4460	9	Avante
1477	9689	9	Barranca de Guadalupe
3626	55200	9	Gustavo Díaz Ordaz
69	1160	9	1a Victoria
8774	55508	9	Coanalco Buenavista
2222	14500	28	San Miguel Topilejo
1112	7456	9	LI Legislatura
1553	9820	9	Estrella del Sur
1416	9420	9	Nueva Rosita
43	1125	9	Ampliación Acueducto
5466	55236	9	Ampliación Códice Mendocino
3620	55188	9	México Colonial I
516	3400	9	Álamos
3460	55030	21	La Floresta
1398	9360	2	San Miguel
308	1759	9	Ampliación Las Águilas
2220	14480	28	La Magdalena Petlacalco
2890	7754	9	Lindavista Vallejo III Sección
425	2480	9	Petrolera
2362	15850	9	Magdalena Mixiuhca
1924	13020	9	San José
3586	55128	9	José Antonio Torres
2346	15670	9	Adolfo López Mateos
1800	11440	9	San Juanico
8286	50245	21	María Bonita
188	50010	21	Las Flores
1364	9230	9	Álvaro Obregón
7845	50280	21	Junta Local de Caminos
2087	14219	17	Six Flags (Reino Aventura)
1191	7880	9	Mártires de Río Blanco
1087	7340	2	La Laguna Ticomán
3772	55418	9	Mexicalco I
1144	7650	9	Ampliación Progreso Nacional
1241	8030	9	Gabriel Ramos Millán Sección Cuchilla
4559	57178	9	Las Armas
3613	55170	9	Sagitario IV
1860	11810	9	16 de Septiembre
1185	7860	9	La Joyita
3453	55030	2	La Curiela
1471	9670	9	Palmitas
8383	50264	2	San Felipe de Jesús
2320	15400	9	Romero Rubio
1877	12000	2	La Concepción
2905	16533	2	Ahualapa
3742	55369	9	Ampliación San Miguel Xalostoc
2203	14430	9	Tlalcoligia
1644	9930	9	El Rosario
2	14456	9	Atocpa
3628	55210	9	La Estrella
2859	9630	9	San Miguel Teotongo Sección Palmitas
1014	7090	9	C.T.M. El Risco
1377	9280	9	Jacarandas
393	2150	9	Pasteros
7895	50075	9	Científicos
1802	11450	9	Modelo Pensil
1031	7149	9	Parque Metropolitano
2120	14310	9	Belisario Domínguez
2893	13300	2	Santa Ana Norte
2792	4980	9	Viejo Ejido de Santa Úrsula Coapa
1640	9910	9	La Esperanza
725	4938	9	Campestre Coyoacán
3491	55055	9	Llano de los Báez
2206	14439	9	Pedregal de las Águilas
6198	55010	9	Mathzi III
301	50140	9	Nueva Santa María
2094	14240	9	Lomas de Padierna
3728	55330	9	Las Vegas Xalostoc
181	1400	9	Olivar del Conde 1a Sección
1955	13230	9	Granjas Cabrera
1103	7410	9	Villa Hermosa
27	55070	9	19 de Septiembre
3	50230	21	Las Misiones
2300	15260	9	Ampliación 20 de Noviembre
1992	13540	9	El Rosario
344	50180	9	Del Parque
5656	55530	9	San Jaco (El Gallito)
360	2020	2	San Marcos
8410	50256	9	Agua Bendita
4608	57700	9	Evolución Súper 24
1609	9870	9	12 de Diciembre
1823	11529	9	Ampliación Granada
1590	9856	9	Estado de Veracruz
2290	15020	9	Puebla
2147	14350	9	Prado Coapa 1A Sección
3522	55066	28	Santo Tomás Chiconautla
358	2010	2	Nuevo Barrio San Rafael
3534	55075	21	Jardines de Morelos 5a Sección
281	1650	9	2o Reacomodo Tlacuitlapa
3696	55288	9	Nezahualpilli
3743	55390	21	Altavilla
8428	50258	9	El Rosario
5533	50060	9	San Juan Buenavista
2903	16514	2	Tetitla
2898	13094	9	San Isidro
4561	57180	9	Ciudad Lago
76	1180	9	Carola
3501	55064	28	San Isidro Atlautenco
1897	12200	2	Nochtla
1560	9829	9	Ampliación El Santuario
1539	9800	2	San Antonio Culhuacán
4612	57718	9	Ampliación General José Vicente Villada Oriente
478	2900	9	Aguilera
543	3720	9	Nochebuena
3555	55090	21	Los Laureles
1770	11260	9	México Nuevo
5107	50240	9	El Carmen Totoltepec
3521	55069	9	La Preciosa
3618	55180	9	México Colonial II
3435	55024	9	Ejidal Emiliano Zapata
2260	14659	9	María Esther Zuno de Echeverría
6204	55016	31	Torres de Altavista
180	50016	31	Jardines de la Crespa
1607	9868	9	San Juan Estrella
1478	9690	9	Iztlahuacán
39	1110	9	Liberales de 1857
4622	57809	21	Rey Nezahualcóyotl
1292	8840	9	Reforma Iztaccíhuatl Sur
8393	50254	9	Loma Bonita
2134	14330	9	Rinconada Coapa 1A Sección
1994	13540	9	Tierra Blanca
1692	10340	9	Los Padres
1559	9828	9	Ampliación Ricardo Flores Magón
3524	55070	21	Jardines de Morelos Sección Elementos
1697	10370	9	Palmas
441	2600	9	Pro-Hogar
161	1299	9	2a Ampliación Presidentes
8468	50265	9	Sor Juana Inés de la Cruz
3441	55025	21	Santa Águeda
3611	55170	9	Central Michoacana
6191	55010	9	El Obraje (Diamante)
687	4730	9	Bosques de Tetlameya
6203	55016	31	Villas de la Joya
3567	55100	12	Tulpetlac
1265	8510	9	El Rodeo
\.


--
-- Data for Name: cat_categorias_med; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cat_categorias_med (id_cat_med, nombre_categoria, descripcion, id_especie) FROM stdin;
16	Urológico / Renal	Trata problemas del sistema urinario y riñones, como infecciones o cálculos.	1
17	Oftálmico	Trata enfermedades o infecciones de los ojos y estructuras oculares.	1
18	Otolaringológico (oído)	Trata infecciones, inflamaciones o problemas del oído y conducto auditivo.	1
19	Dermatológico (piel)	Trata afecciones de la piel como dermatitis, heridas, infecciones cutáneas.	1
20	Vacuna	Estimula el sistema inmune para crear defensas contra enfermedades específicas.	1
21	Reconstituyente / Fortificante	Recupera la fuerza y vitalidad después de enfermedad, cirugía o debilidad.	1
22	Sedante / Tranquilizante	Calma y reduce la ansiedad o agitación, produce relajación sin anestesia profunda.	1
23	Anticonvulsivo / Neurológico	Previene o controla convulsiones y trata trastornos del sistema nervioso.	1
24	Antiemético (contra vómito)	Previene o detiene las náuseas y el vómito.	1
25	Antidiarreico	Controla y detiene la diarrea, normaliza las heces.	1
26	Anticoagulante	Previene la formación de coágulos sanguíneos o disuelve coágulos existentes.	1
27	Rehidratante / Electrolito	Repone líquidos y minerales perdidos por deshidratación, diarrea o vómito.	1
28	Antiprotozoario	Elimina protozoarios parásitos como Giardia, Coccidia o Toxoplasma.	1
29	Endectocida (interno y externo)	Elimina parásitos internos y externos simultáneamente con un solo medicamento.	1
30	Hepatoprotector	Protege y ayuda a regenerar las células del hígado, mejora función hepática.	1
1	Antibiótico	Medicamentos para combatir infecciones bacterianas	4
2	Antiparasitario	Tratamiento contra parásitos internos y externos	4
3	Vitaminas y Suplementos	Complementos nutricionales esenciales	4
4	Antiinflamatorio	Reduce inflamación y dolor	4
5	Antifúngico	Tratamiento contra hongos	4
6	Analgésico	Control del dolor	4
7	Calcio y Minerales	Suplementos de calcio y minerales esenciales	4
8	Antiprotozoario	Tratamiento contra protozoarios	4
9	Corticoesteroide	Potente antiinflamatorio e inmunosupresor	4
10	Solución Hidratante	Fluidos para rehidratación	4
11	Antibiótico Tópico	Antibióticos de uso externo	4
12	Desparasitante Externo	Para ácaros y garrapatas	4
13	Probiótico	Flora intestinal beneficiosa	4
14	Enzimas Digestivas	Ayuda a la digestión	4
15	Inmunoestimulante	Refuerza el sistema inmune	4
\.


--
-- Data for Name: cat_compuestos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cat_compuestos (id_compuesto, nombre_compuesto, id_especie) FROM stdin;
70	Coumaphos	3
71	Ciclosporina	3
72	Azul de metileno	3
73	Clorfenvinfós	3
74	Crotamitón	3
75	Toltrazuril	3
76	Flumetrina	3
77	Enrofloxacina	3
78	Extracto herbal fortificante	3
79	Levamisol HCl	3
80	Benzocaína	3
81	Dexametasona fosfato	3
82	Permetrina	3
83	Amitraz	3
84	Teofilina	3
85	Calcio gluconato	3
86	Extracto Ginkgo biloba	3
87	Extracto Valeriana	3
88	Complejo multivitamínico adulto	3
89	Complejo multivitamínico cachorro	3
90	Complejo multivitamínico senior	3
91	Complejo digestivo probiótico	3
92	Extracto hepático protector	3
93	Aceite de pescado Omega 3	3
94	Complejo reproductivo vitamínico	3
95	Complejo dermatológico	3
96	Ketorolaco base	3
97	Progesterona	3
98	Prednisolona	3
99	Penicilina G	3
100	Oxitocina	3
101	Procain-estreptomicina	3
102	Progesterona	3
103	Cefalexina	3
104	Hierro dextrán	3
105	Hormona uterotónica	3
106	Virus atenuado parvovirus canino	3
107	Ranitidina	3
108	Virus atenuado moquillo/parvo	3
109	Virus atenuado moquillo/parvo/hepatitis	3
110	Virus atenuado C4/CV	3
111	Virus atenuado C7	3
112	Virus atenuado C6/CV	3
113	Virus atenuado C8	3
114	Virus atenuado C9	3
115	Bordetella bronchiseptica atenuada	3
116	Bromhexina	3
117	Ambroxol	3
118	Clenbuterol	3
119	Teofilina	3
120	Dextrometorfano	3
121	Extracto vegetal REUGOL	3
122	Oxitetraciclina	3
123	Permetrina	3
124	Base shampoo	3
125	Permetrina	3
126	Acondicionador	3
127	Aceite de jojoba	3
128	Aceite de visón	3
129	Aloe vera	3
130	Eucalipto	3
131	Germicida	3
132	Triclosán	3
133	Vitamina E	3
134	Zinc	3
135	Biotina	3
136	Aceite de coco	3
137	Vitamina B5	3
138	Colágeno	3
139	Keratina	3
140	Manzanilla	3
141	Romero	3
142	Menta	3
33	Tiamina	4
143	Árbol de té	3
144	Avena	3
145	Extracto de algas	3
146	Extracto de bambú	3
147	Lauril éter sulfato sódico	3
148	Dietanolamida de ácidos‑grasos de coco	3
149	Derivados de amina grasa	3
150	Pirenona 6‑30N	3
151	Acondicionadores	3
152	Sildenafil citrato	3
153	Sulfadiazina	3
154	Trimetoprim	3
155	Sulfametoxazol	3
156	Sulfadoxina	3
157	Flumetrina	3
158	Imidacloprid	3
159	Nimesulida	3
160	Piretrinas	3
161	Butóxido de piperonilo	3
162	Perfume	3
163	Agua	3
164	Alantoína	3
165	Cloruro de benzalconio	3
166	Jabón de coco neutro	3
167	Acíbar de zábila	3
168	Aceite de limón	3
169	Clorofila	3
170	Aceite esencial de cajeput	3
171	Surfactantes	3
172	Fragancia	3
173	Vitamina A	3
174	Vitamina D	3
175	Vitamina E	3
176	Acetonido de fluocinolona	3
177	Sulfato de neomicina	3
178	Propoxur	3
179	Ciclosporina A	3
180	Agentes saponificantes	3
181	Avena	3
182	Conservador	3
183	Extracto de avena	3
184	Colorante	3
185	Cefepime	3
186	Óxido de calcio	3
187	Óxido de hierro	3
188	Óxido de aluminio	3
189	Óxido de magnesio	3
190	Óxido de silicio	3
191	Febantel	3
192	Prazicuantel	3
193	Levotiroxina sódica	3
194	Sulfato de atropina	3
195	Nipagin	3
196	Nipasol	3
197	Bisulfito de sodio	3
198	Salicilato de metilo	3
199	Aceite de eucalipto	3
200	Aceite de trementina	3
201	Ácido fénico	3
202	Penicilina G benzatínica	3
203	Sulfatiazol	3
204	Sulfanilamida	3
205	Yodoclorohidroxiquinoleína	3
206	Alcanfor	3
207	Óxido de zinc	3
208	Allium sativum	3
209	Voriconazol	3
210	Terbinafina clorhidrato	3
211	Retinol (Vitamina A)	3
212	Colecalciferol (Vitamina D3)	3
213	Tocoferol (Vitamina E)	3
214	Fitomenadiona (Vitamina K)	3
215	Tiamina (Vitamina B1)	3
216	Riboflavina (Vitamina B2)	3
217	Niacina (Vitamina B3)	3
218	Piridoxina (Vitamina B6)	3
219	Cianocobalamina (Vitamina B12)	3
220	Ácido ascórbico (Vitamina C)	3
221	Biotina (Vitamina B7)	3
222	Ácido fólico (Vitamina B9)	3
223	Meloxicam	3
224	Carprofeno	3
225	Ketoprofeno	3
226	Butorfanol tartrato	3
227	Tramadol clorhidrato	3
228	Prednisolona fosfato sódico	3
229	Dexametasona	3
230	Gluconato de calcio	3
231	Oxitocina sintética	3
232	Lactulosa	3
233	Metoclopramida clorhidrato	3
234	Omeprazol	3
235	Ranitidina clorhidrato	3
236	Silimarina extracto	3
237	L-carnitina	3
238	Lactobacillus acidophilus	3
239	Bifidobacterium bifidum	3
240	Amilasa	3
241	Proteasa	3
242	Lipasa	3
1	Enrofloxacina	4
2	Amoxicilina	4
3	Ceftazidima	4
4	Gentamicina	4
5	Doxiciclina	4
6	Marbofloxacina	4
7	Azitromicina	4
8	Cefalexina	4
9	Cloranfenicol	4
10	Trimetoprima	4
11	Sulfametoxazol	4
12	Ciprofloxacina	4
13	Ampicilina	4
14	Tetraciclina	4
15	Neomicina	4
16	Claritromicina	4
17	Fenbendazol	4
18	Ivermectina	4
19	Praziquantel	4
20	Metronidazol	4
21	Albendazol	4
22	Pirantel	4
23	Levamisol	4
24	Mebendazol	4
25	Piperazina	4
26	Nitazoxanida	4
27	Tiabendazol	4
28	Oxfendazol	4
29	Vitamina A	4
30	Vitamina D3	4
31	Vitamina E	4
32	Vitamina K	4
34	Riboflavina	4
35	Niacina	4
36	Vitamina B6	4
37	Vitamina B12	4
38	Vitamina C	4
39	Biotina	4
40	Meloxicam	4
41	Carprofeno	4
42	Ketoprofeno	4
43	Flunixina	4
44	Piroxicam	4
45	Dexametasona	4
46	Prednisolona	4
47	Diclofenaco	4
48	Clotrimazol	4
49	Ketoconazol	4
50	Itraconazol	4
51	Fluconazol	4
52	Miconazol	4
53	Terbinafina	4
54	Nistatina	4
55	Gluconato de Calcio	4
56	Calcitriol	4
57	Oxitocina	4
58	Atropina	4
59	Butorfanol	4
60	Tramadol	4
61	Omeprazol	4
62	Ranitidina	4
63	Metoclopramida	4
64	Lactulosa	4
65	Silimarina	4
66	Ácido Ascórbico	4
67	Ácido Fólico	4
68	Pantotenato	4
69	Colecalciferol	4
\.


--
-- Data for Name: cat_cp_base; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cat_cp_base (codigop, id_mnpio_fk, id_estado_fk) FROM stdin;
1080	10	9
12410	9	9
50020	106	15
15420	17	9
5129	4	9
57760	58	15
12110	9	9
1219	10	9
15860	17	9
6010	15	9
1588	10	9
14427	12	9
7708	5	9
55187	33	15
4240	3	9
7950	5	9
57920	58	15
11240	16	9
11910	16	9
1278	10	9
4510	3	9
57103	58	15
2099	2	9
14310	12	9
8910	6	9
14275	12	9
4370	3	9
4519	3	9
3240	14	9
14710	12	9
1780	10	9
1320	10	9
55117	33	15
1510	10	9
1140	10	9
55018	33	15
15000	17	9
7239	5	9
12950	9	9
55238	33	15
14650	12	9
3650	14	9
55060	33	15
7670	5	9
15290	17	9
16616	13	9
7224	5	9
7570	5	9
10620	8	9
4890	3	9
13600	11	9
2930	2	9
55517	33	15
15680	17	9
1125	10	9
9099	7	9
55420	33	15
57730	58	15
57188	58	15
14266	12	9
55369	33	15
1285	10	9
9910	7	9
7320	5	9
57189	58	15
13210	11	9
2010	2	9
1470	10	9
14020	12	9
3510	14	9
2310	2	9
55120	33	15
55063	33	15
14738	12	9
50200	106	15
1490	10	9
50284	106	15
15370	17	9
14739	12	9
15850	17	9
11600	16	9
2630	2	9
55549	33	15
4300	3	9
55400	33	15
11480	16	9
50285	106	15
55415	33	15
50226	106	15
8920	6	9
55249	33	15
9960	7	9
8770	6	9
7187	5	9
13509	11	9
9209	7	9
14230	12	9
55425	33	15
50280	106	15
10630	8	9
50245	106	15
57140	58	15
3560	14	9
55094	33	15
13410	11	9
55299	33	15
13700	11	9
13450	11	9
10360	8	9
15410	17	9
9680	7	9
16797	13	9
9100	7	9
16800	13	9
16500	13	9
14653	12	9
9260	7	9
50258	106	15
16430	13	9
55338	33	15
14388	12	9
6350	15	9
57129	58	15
4640	3	9
6860	15	9
9770	7	9
55390	33	15
15440	17	9
13219	11	9
8220	6	9
1210	10	9
14609	12	9
16443	13	9
7510	5	9
6220	15	9
1289	10	9
55320	33	15
7739	5	9
55510	33	15
1650	10	9
13540	11	9
55076	33	15
50253	106	15
2459	2	9
9180	7	9
7040	5	9
4120	3	9
7330	5	9
1729	10	9
1279	10	9
7089	5	9
55023	33	15
55074	33	15
11320	16	9
7839	5	9
11650	16	9
55297	33	15
5270	4	9
16604	13	9
10710	8	9
1060	10	9
10400	8	9
16429	13	9
14410	12	9
7220	5	9
3200	14	9
9880	7	9
14150	12	9
6280	15	9
10300	8	9
14390	12	9
1100	10	9
9930	7	9
7790	5	9
4330	3	9
1863	10	9
1139	10	9
2950	2	9
2300	2	9
55414	33	15
55498	33	15
2240	2	9
16428	13	9
3940	14	9
2490	2	9
7290	5	9
11300	16	9
6600	15	9
16457	13	9
14400	12	9
9440	7	9
9660	7	9
9140	7	9
14120	12	9
55547	33	15
50140	106	15
6170	15	9
8500	6	9
55237	33	15
9040	7	9
3730	14	9
2750	2	9
55230	33	15
15870	17	9
16400	13	9
7350	5	9
50170	106	15
57810	58	15
14380	12	9
9270	7	9
57430	58	15
50266	106	15
13250	11	9
5000	4	9
55240	33	15
14647	12	9
14308	12	9
1750	10	9
50293	106	15
1759	10	9
13300	11	9
55017	33	15
9130	7	9
4939	3	9
7214	5	9
7500	5	9
13099	11	9
57300	58	15
55070	33	15
55339	33	15
55127	33	15
6050	15	9
7680	5	9
15250	17	9
13010	11	9
7420	5	9
6140	15	9
1550	10	9
14387	12	9
14269	12	9
1250	10	9
4950	3	9
55404	33	15
7960	5	9
9250	7	9
14749	12	9
55490	33	15
7890	5	9
14629	12	9
8800	6	9
7754	5	9
55064	33	15
6920	15	9
15670	17	9
1548	10	9
16840	13	9
16749	13	9
16739	13	9
13230	11	9
7259	5	9
1090	10	9
7880	5	9
9860	7	9
16615	13	9
16410	13	9
9090	7	9
1870	10	9
15450	17	9
11610	16	9
15010	17	9
7889	5	9
9838	7	9
9080	7	9
11280	16	9
14449	12	9
7230	5	9
5410	4	9
50050	106	15
9897	7	9
12070	9	9
1566	10	9
12600	9	9
57100	58	15
14470	12	9
13315	11	9
55520	33	15
3930	14	9
1089	10	9
15600	17	9
9870	7	9
16320	13	9
16600	13	9
2060	2	9
1620	10	9
14655	12	9
9280	7	9
50220	106	15
16059	13	9
15530	17	9
50230	106	15
1789	10	9
1904	10	9
57500	58	15
14640	12	9
7359	5	9
10580	8	9
6500	15	9
16036	13	9
8710	6	9
1130	10	9
7370	5	9
55459	33	15
12000	9	9
9750	7	9
13549	11	9
1010	10	9
5370	4	9
2810	2	9
55509	33	15
55147	33	15
1740	10	9
5100	4	9
5220	4	9
2360	2	9
6100	15	9
5780	4	9
55516	33	15
7149	5	9
2920	2	9
55146	33	15
55100	33	15
12500	9	9
7310	5	9
55148	33	15
55126	33	15
4480	3	9
7050	5	9
13510	11	9
14220	12	9
16100	13	9
14440	12	9
9790	7	9
9070	7	9
2410	2	9
55506	33	15
55000	33	15
11340	16	9
55119	33	15
2660	2	9
14659	12	9
57420	58	15
7969	5	9
9450	7	9
2070	2	9
16533	13	9
1700	10	9
57150	58	15
4410	3	9
3900	14	9
57410	58	15
7183	5	9
5120	4	9
13400	11	9
11270	16	9
15340	17	9
8810	6	9
55287	33	15
13530	11	9
2000	2	9
57740	58	15
5320	4	9
55267	33	15
55188	33	15
2980	2	9
7707	5	9
1810	10	9
11860	16	9
16030	13	9
55200	33	15
11529	16	9
9230	7	9
55140	33	15
50122	106	15
16310	13	9
11470	16	9
57120	58	15
16010	13	9
13040	11	9
3320	14	9
57520	58	15
9859	7	9
55059	33	15
55130	33	15
8760	6	9
7140	5	9
2770	2	9
13508	11	9
1610	10	9
14250	12	9
11510	16	9
7270	5	9
4200	3	9
1270	10	9
9608	7	9
2790	2	9
57930	58	15
12910	9	9
50017	106	15
1790	10	9
50150	106	15
2719	2	9
1109	10	9
55268	33	15
13625	11	9
57138	58	15
14439	12	9
10320	8	9
5240	4	9
57460	58	15
9010	7	9
16070	13	9
16038	13	9
55540	33	15
1860	10	9
55295	33	15
55405	33	15
50235	106	15
4489	3	9
9350	7	9
3660	14	9
55218	33	15
12080	9	9
3740	14	9
1645	10	9
55288	33	15
1180	10	9
5750	4	9
2600	2	9
11489	16	9
13310	11	9
1710	10	9
14376	12	9
57139	58	15
15300	17	9
9710	7	9
7380	5	9
57809	58	15
7990	5	9
50100	106	15
3104	14	9
9670	7	9
9819	7	9
8320	6	9
5790	4	9
3800	14	9
14479	12	9
7640	5	9
4020	3	9
11330	16	9
4490	3	9
55248	33	15
16090	13	9
9780	7	9
11430	16	9
9359	7	9
3303	14	9
4938	3	9
7760	5	9
1900	10	9
5280	4	9
11619	16	9
57708	58	15
55085	33	15
15960	17	9
8400	6	9
16813	13	9
9706	7	9
7780	5	9
55410	33	15
13120	11	9
1070	10	9
7069	5	9
1299	10	9
13430	11	9
16860	13	9
7280	5	9
55028	33	15
9856	7	9
7144	5	9
8650	6	9
14267	12	9
1050	10	9
9868	7	9
5269	4	9
7838	5	9
14300	12	9
7530	5	9
7400	5	9
57530	58	15
11200	16	9
1296	10	9
15630	17	9
11040	16	9
1600	10	9
50265	106	15
16040	13	9
6090	15	9
1760	10	9
11550	16	9
4010	3	9
2130	2	9
8620	6	9
9730	7	9
10800	8	9
6890	15	9
55300	33	15
4919	3	9
16710	13	9
1040	10	9
55360	33	15
16629	13	9
55294	33	15
14357	12	9
50225	106	15
7188	5	9
4800	3	9
55308	33	15
50180	106	15
8240	6	9
9430	7	9
6760	15	9
55269	33	15
13545	11	9
7200	5	9
9420	7	9
2020	2	9
55014	33	15
11400	16	9
15280	17	9
9578	7	9
7650	5	9
50209	106	15
6800	15	9
16609	13	9
15430	17	9
7440	5	9
5360	4	9
4600	3	9
57950	58	15
55234	33	15
3640	14	9
50240	106	15
1830	10	9
57840	58	15
57185	58	15
16607	13	9
15970	17	9
55137	33	15
14000	12	9
15320	17	9
1540	10	9
14210	12	9
9708	7	9
1400	10	9
11210	16	9
55128	33	15
11590	16	9
7858	5	9
16780	13	9
5379	4	9
55067	33	15
14420	12	9
14320	12	9
7189	5	9
3810	14	9
9689	7	9
10900	8	9
14654	12	9
15380	17	9
50120	106	15
16606	13	9
4470	3	9
55189	33	15
50115	106	15
5520	4	9
11460	16	9
9520	7	9
7540	5	9
55210	33	15
7369	5	9
3840	14	9
9839	7	9
9648	7	9
10130	8	9
1290	10	9
11560	16	9
1269	10	9
7720	5	9
2530	2	9
10600	8	9
15740	17	9
50040	106	15
57820	58	15
55065	33	15
13150	11	9
6030	15	9
12930	9	9
50295	106	15
14386	12	9
4840	3	9
9510	7	9
12700	9	9
9638	7	9
50264	106	15
57310	58	15
57710	58	15
55066	33	15
14735	12	9
55180	33	15
14268	12	9
10340	8	9
7180	5	9
7620	5	9
1807	10	9
5010	4	9
55104	33	15
13440	11	9
9620	7	9
57178	58	15
55290	33	15
9300	7	9
7209	5	9
14737	12	9
13070	11	9
11820	16	9
8420	6	9
4700	3	9
1770	10	9
2320	2	9
55069	33	15
11810	16	9
3700	14	9
5310	4	9
4910	3	9
4830	3	9
3300	14	9
15640	17	9
15260	17	9
1569	10	9
14030	12	9
9240	7	9
6870	15	9
4040	3	9
8210	6	9
57750	58	15
16459	13	9
1538	10	9
16450	13	9
2860	2	9
15400	17	9
9704	7	9
50283	106	15
16210	13	9
12250	9	9
7820	5	9
11950	16	9
50274	106	15
16605	13	9
10378	8	9
55029	33	15
2910	2	9
55316	33	15
50223	106	15
11570	16	9
1720	10	9
50246	106	15
1110	10	9
1520	10	9
57170	58	15
7268	5	9
16080	13	9
3440	14	9
2090	2	9
50000	106	15
11540	16	9
10330	8	9
4980	3	9
2940	2	9
1630	10	9
3500	14	9
10200	8	9
9830	7	9
7860	5	9
2080	2	9
14430	12	9
2250	2	9
16640	13	9
2050	2	9
57450	58	15
16770	13	9
15650	17	9
2650	2	9
10840	8	9
1857	10	9
1430	10	9
7020	5	9
1239	10	9
10660	8	9
55107	33	15
14070	12	9
9900	7	9
3330	14	9
5230	4	9
2128	2	9
14209	12	9
13060	11	9
55500	33	15
57205	58	15
55040	33	15
10910	8	9
7859	5	9
7770	5	9
7450	5	9
8040	6	9
15660	17	9
9239	7	9
50075	106	15
9319	7	9
6080	15	9
8100	6	9
55260	33	15
1618	10	9
16513	13	9
57610	58	15
15390	17	9
1389	10	9
9837	7	9
1030	10	9
57179	58	15
16530	13	9
14460	12	9
14239	12	9
9220	7	9
16035	13	9
50260	106	15
15020	17	9
9089	7	9
2200	2	9
1376	10	9
3400	14	9
7899	5	9
2150	2	9
14620	12	9
16850	13	9
15990	17	9
14050	12	9
57720	58	15
57900	58	15
7060	5	9
15230	17	9
10370	8	9
10010	8	9
14208	12	9
11370	16	9
3420	14	9
7150	5	9
16000	13	9
13270	11	9
55176	33	15
9810	7	9
55347	33	15
6900	15	9
55105	33	15
9360	7	9
8020	6	9
55264	33	15
7870	5	9
55450	33	15
55010	33	15
4815	3	9
5330	4	9
12300	9	9
1150	10	9
2970	2	9
3410	14	9
9640	7	9
2129	2	9
9310	7	9
4870	3	9
7730	5	9
2520	2	9
15310	17	9
10920	8	9
9600	7	9
5700	4	9
7580	5	9
50168	106	15
50205	106	15
8930	6	9
57739	58	15
1410	10	9
9890	7	9
2140	2	9
57709	58	15
7930	5	9
7810	5	9
3610	14	9
55135	33	15
14010	12	9
16720	13	9
9400	7	9
13360	11	9
15540	17	9
1377	10	9
16776	13	9
14426	12	9
15100	17	9
8600	6	9
55118	33	15
2730	2	9
7250	5	9
4390	3	9
1509	10	9
11420	16	9
15840	17	9
9705	7	9
7480	5	9
50294	106	15
50210	106	15
8200	6	9
7360	5	9
6200	15	9
14730	12	9
15309	17	9
5219	4	9
14643	12	9
9760	7	9
55330	33	15
14658	12	9
7740	5	9
9696	7	9
15520	17	9
13550	11	9
3600	14	9
55236	33	15
15830	17	9
16300	13	9
9530	7	9
57830	58	15
6020	15	9
12200	9	9
50250	106	15
7750	5	9
55242	33	15
1310	10	9
8840	6	9
14900	12	9
7340	5	9
55139	33	15
6070	15	9
9200	7	9
13630	11	9
9320	7	9
4620	3	9
55430	33	15
57210	58	15
6820	15	9
6250	15	9
57510	58	15
1280	10	9
11289	16	9
1730	10	9
57180	58	15
6000	15	9
11350	16	9
6400	15	9
16034	13	9
15700	17	9
2120	2	9
14260	12	9
8830	6	9
7210	5	9
13640	11	9
11310	16	9
3430	14	9
3100	14	9
57171	58	15
7455	5	9
2720	2	9
9740	7	9
7939	5	9
5400	4	9
11360	16	9
55050	33	15
11580	16	9
9000	7	9
6840	15	9
50110	106	15
2160	2	9
7560	5	9
3570	14	9
3023	14	9
1859	10	9
3580	14	9
9429	7	9
13520	11	9
57130	58	15
10368	8	9
3520	14	9
16240	13	9
7850	5	9
13319	11	9
55138	33	15
15350	17	9
4440	3	9
16900	13	9
55243	33	15
13278	11	9
16620	13	9
10926	8	9
55068	33	15
15220	17	9
9820	7	9
6430	15	9
13419	11	9
57849	58	15
15470	17	9
13610	11	9
8030	6	9
8730	6	9
5020	4	9
4650	3	9
5610	4	9
55284	33	15
4380	3	9
2710	2	9
4210	3	9
14646	12	9
9630	7	9
11250	16	9
3710	14	9
3720	14	9
2680	2	9
13080	11	9
9849	7	9
2340	2	9
57000	58	15
16200	13	9
55055	33	15
14100	12	9
9858	7	9
7800	5	9
12400	9	9
7160	5	9
1120	10	9
11830	16	9
7170	5	9
13273	11	9
9020	7	9
7109	5	9
2470	2	9
1240	10	9
14630	12	9
1450	10	9
14110	12	9
7300	5	9
4660	3	9
9460	7	9
10380	8	9
14377	12	9
11870	16	9
7830	5	9
1708	10	9
1849	10	9
55246	33	15
11440	16	9
10000	8	9
55190	33	15
15339	17	9
7090	5	9
4940	3	9
7920	5	9
15270	17	9
15980	17	9
50070	106	15
10830	8	9
15820	17	9
7469	5	9
1020	10	9
15500	17	9
6040	15	9
3920	14	9
57700	58	15
4930	3	9
57600	58	15
16550	13	9
3620	14	9
6240	15	9
15330	17	9
13220	11	9
7080	5	9
7058	5	9
4739	3	9
8900	6	9
16340	13	9
55340	33	15
1460	10	9
3340	14	9
13460	11	9
3230	14	9
12800	9	9
11800	16	9
55024	33	15
50233	106	15
50290	106	15
15460	17	9
13030	11	9
15240	17	9
50130	106	15
14350	12	9
7190	5	9
9920	7	9
5119	4	9
10500	8	9
16630	13	9
3310	14	9
55016	33	15
15510	17	9
6720	15	9
2230	2	9
11410	16	9
8700	6	9
57910	58	15
57819	58	15
2900	2	9
57630	58	15
13180	11	9
5600	4	9
6880	15	9
57719	58	15
9800	7	9
11920	16	9
11290	16	9
1170	10	9
2040	2	9
1298	10	9
13200	11	9
7470	5	9
16617	13	9
10610	8	9
14406	12	9
2700	2	9
9969	7	9
14330	12	9
55129	33	15
55084	33	15
55419	33	15
5118	4	9
7119	5	9
10810	8	9
11530	16	9
50016	106	15
7940	5	9
11100	16	9
1480	10	9
8230	6	9
1549	10	9
11700	16	9
4400	3	9
14060	12	9
15610	17	9
57440	58	15
8310	6	9
55280	33	15
55519	33	15
1000	10	9
7456	5	9
14360	12	9
9850	7	9
1049	10	9
55036	33	15
1160	10	9
16420	13	9
9828	7	9
1800	10	9
9609	7	9
2840	2	9
50206	106	15
4918	3	9
13000	11	9
55348	33	15
10700	8	9
12100	9	9
9769	7	9
16799	13	9
1260	10	9
50010	106	15
11850	16	9
11930	16	9
7970	5	9
7010	5	9
2480	2	9
50190	106	15
14140	12	9
9438	7	9
7900	5	9
14700	12	9
7100	5	9
4260	3	9
3910	14	9
2100	2	9
10350	8	9
9479	7	9
50256	106	15
5348	4	9
3103	14	9
9709	7	9
5530	4	9
9970	7	9
9690	7	9
50214	106	15
13094	11	9
14409	12	9
4340	3	9
7199	5	9
7520	5	9
14160	12	9
55090	33	15
16750	13	9
11260	16	9
5030	4	9
55027	33	15
2990	2	9
16020	13	9
55507	33	15
9698	7	9
50090	106	15
1340	10	9
55115	33	15
57400	58	15
4250	3	9
16050	13	9
55020	33	15
9720	7	9
57200	58	15
55244	33	15
2830	2	9
11840	16	9
11490	16	9
50071	106	15
11450	16	9
55515	33	15
2330	2	9
50026	106	15
14270	12	9
7410	5	9
1330	10	9
15200	17	9
9550	7	9
50270	106	15
8510	6	9
16440	13	9
14039	12	9
1220	10	9
14408	12	9
5730	4	9
14500	12	9
7910	5	9
6300	15	9
7980	5	9
55158	33	15
9208	7	9
9470	7	9
4500	3	9
2800	2	9
50227	106	15
55548	33	15
8300	6	9
1590	10	9
6850	15	9
11220	16	9
7279	5	9
9560	7	9
14049	12	9
7509	5	9
14480	12	9
1820	10	9
14734	12	9
14389	12	9
4030	3	9
55030	33	15
14610	12	9
4909	3	9
14760	12	9
6060	15	9
1419	10	9
1276	10	9
50236	106	15
1619	10	9
4970	3	9
13420	11	9
10369	8	9
14326	12	9
15810	17	9
9030	7	9
2400	2	9
55266	33	15
50263	106	15
3820	14	9
55289	33	15
15710	17	9
4460	3	9
55056	33	15
2460	2	9
6270	15	9
15620	17	9
14090	12	9
57718	58	15
55075	33	15
12940	9	9
13020	11	9
4630	3	9
14456	12	9
16083	13	9
55418	33	15
7700	5	9
14600	12	9
5710	4	9
57620	58	15
55407	33	15
14720	12	9
55025	33	15
3530	14	9
14740	12	9
5050	4	9
12920	9	9
4369	3	9
7755	5	9
7240	5	9
4730	3	9
55298	33	15
4530	3	9
55245	33	15
1530	10	9
3550	14	9
14248	12	9
9840	7	9
57158	58	15
4810	3	9
4920	3	9
4610	3	9
1230	10	9
1539	10	9
15730	17	9
8010	6	9
11520	16	9
14429	12	9
9210	7	9
55417	33	15
9570	7	9
4929	3	9
14748	12	9
10020	8	9
9060	7	9
1640	10	9
2960	2	9
13093	11	9
7550	5	9
6700	15	9
55416	33	15
15750	17	9
1408	10	9
14608	12	9
8720	6	9
50080	106	15
16614	13	9
7869	5	9
16740	13	9
14340	12	9
7207	5	9
4360	3	9
1275	10	9
15210	17	9
3630	14	9
1840	10	9
10820	8	9
7164	5	9
55125	33	15
7918	5	9
10640	8	9
14370	12	9
14438	12	9
3000	14	9
7460	5	9
3010	14	9
55458	33	15
13090	11	9
4320	3	9
14240	12	9
15800	17	9
13100	11	9
14200	12	9
4230	3	9
9637	7	9
4710	3	9
6450	15	9
50060	106	15
1420	10	9
55170	33	15
55317	33	15
9700	7	9
4420	3	9
9480	7	9
57940	58	15
6470	15	9
55095	33	15
2420	2	9
55220	33	15
50257	106	15
55247	33	15
2440	2	9
11230	16	9
55508	33	15
9500	7	9
55518	33	15
4000	3	9
55149	33	15
1560	10	9
55530	33	15
55080	33	15
4899	3	9
3540	14	9
11000	16	9
2670	2	9
7110	5	9
5200	4	9
14476	12	9
8000	6	9
5110	4	9
55310	33	15
4450	3	9
1259	10	9
7600	5	9
1200	10	9
50228	106	15
55114	33	15
57800	58	15
7979	5	9
55087	33	15
55037	33	15
16514	13	9
14325	12	9
14040	12	9
2780	2	9
5760	4	9
7919	5	9
7000	5	9
55270	33	15
4318	3	9
50160	106	15
9410	7	9
55349	33	15
3590	14	9
15900	17	9
9829	7	9
10379	8	9
4960	3	9
14657	12	9
14108	12	9
5500	4	9
7070	5	9
16610	13	9
14490	12	9
2760	2	9
7430	5	9
9290	7	9
7840	5	9
9940	7	9
8610	6	9
7630	5	9
2500	2	9
16880	13	9
1500	10	9
16060	13	9
6780	15	9
14219	12	9
1407	10	9
11500	16	9
2519	2	9
2870	2	9
4310	3	9
4100	3	9
55296	33	15
7130	5	9
50255	106	15
2640	2	9
55429	33	15
13050	11	9
3020	14	9
5260	4	9
13280	11	9
55235	33	15
16810	13	9
50254	106	15
16029	13	9
16520	13	9
14080	12	9
\.


--
-- Data for Name: cat_especies; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cat_especies (id_especie, nombre_especie) FROM stdin;
1	Perro
2	Gato
3	Ave
4	Reptil
\.


--
-- Data for Name: cat_estados; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cat_estados (id_estado, d_estado) FROM stdin;
15	México
9	Ciudad de México
\.


--
-- Data for Name: cat_formas_farmaceuticas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cat_formas_farmaceuticas (id_forma_farmaceutica, nombre_forma, descripcion, id_especie) FROM stdin;
13	Suspensión/Gel	Forma farmacéutica detectada en el catálogo de reptiles	4
484	Forma Técnica 484	Cargada automáticamente desde inventario	4
70	Forma Técnica 70	Cargada automáticamente desde inventario	4
376	Forma Técnica 376	Cargada automáticamente desde inventario	4
236	Forma Técnica 236	Cargada automáticamente desde inventario	4
458	Forma Técnica 458	Cargada automáticamente desde inventario	4
22	Forma Técnica 22	Cargada automáticamente desde inventario	4
432	Forma Técnica 432	Cargada automáticamente desde inventario	4
214	Forma Técnica 214	Cargada automáticamente desde inventario	4
665	Forma Técnica 665	Cargada automáticamente desde inventario	4
618	Forma Técnica 618	Cargada automáticamente desde inventario	4
431	Forma Técnica 431	Cargada automáticamente desde inventario	4
123	Forma Técnica 123	Cargada automáticamente desde inventario	4
616	Forma Técnica 616	Cargada automáticamente desde inventario	4
75	Forma Técnica 75	Cargada automáticamente desde inventario	4
345	Forma Técnica 345	Cargada automáticamente desde inventario	4
297	Forma Técnica 297	Cargada automáticamente desde inventario	4
438	Forma Técnica 438	Cargada automáticamente desde inventario	4
427	Forma Técnica 427	Cargada automáticamente desde inventario	4
223	Forma Técnica 223	Cargada automáticamente desde inventario	4
317	Forma Técnica 317	Cargada automáticamente desde inventario	4
192	Forma Técnica 192	Cargada automáticamente desde inventario	4
337	Forma Técnica 337	Cargada automáticamente desde inventario	4
651	Forma Técnica 651	Cargada automáticamente desde inventario	4
13	Polvo para reconstituir	Polvo que debe mezclarse con líquido antes de usar.	1
14	Polvo para inyección	Polvo estéril que se reconstituye para inyectar.	1
15	Spray	Aerosol o atomizador para aplicación tópica u oral.	1
16	Solución	Líquido homogéneo con el medicamento disuelto completamente.	1
17	Jabón	Producto de limpieza con propiedades medicinales.	1
18	Ungüento	Preparación semisólida y grasa para aplicación cutánea.	1
19	Concentrado emulsionable	Líquido concentrado que se diluye en agua formando emulsión.	1
20	Shampoo	Producto de limpieza para el pelaje con acción terapéutica.	1
21	Solucion Oleosa	Medicamento disuelto en aceite.	1
22	Solución dérmica	Líquido para aplicar específicamente en la piel.	1
23	Tabletas Palatables	Tabletas con sabor agradable para facilitar la administración.	1
24	Gel oral	Preparación gelatinosa para aplicar en la boca o encías.	1
25	Crayón	Barra sólida para marcar o aplicar directamente.	1
26	Solución oftálmica	Gotas para los ojos (duplicado del ID 9).	1
27	Solución oleosa inyectable	Medicamento en aceite para inyectar.	1
28	Tabletas orales	Tabletas formuladas específicamente para vía oral.	1
29	Suspensión ótica	Gotas con partículas en suspensión para los oídos.	1
30	Crema tópica	Emulsión semisólida para aplicar en la piel.	1
31	Solución concentrada	Líquido concentrado que debe diluirse antes de usar.	1
32	Tabletas masticables 	Tabletas diseñadas para ser masticadas, generalmente con sabor.	1
33	Collar	Dispositivo que se coloca en el cuello liberando medicamento gradualmente.	1
535	Forma Técnica 535	Cargada automáticamente desde inventario	4
282	Forma Técnica 282	Cargada automáticamente desde inventario	4
359	Forma Técnica 359	Cargada automáticamente desde inventario	4
342	Forma Técnica 342	Cargada automáticamente desde inventario	4
625	Forma Técnica 625	Cargada automáticamente desde inventario	4
594	Forma Técnica 594	Cargada automáticamente desde inventario	4
679	Forma Técnica 679	Cargada automáticamente desde inventario	4
439	Forma Técnica 439	Cargada automáticamente desde inventario	4
316	Forma Técnica 316	Cargada automáticamente desde inventario	4
452	Forma Técnica 452	Cargada automáticamente desde inventario	4
31	Forma Técnica 31	Cargada automáticamente desde inventario	4
682	Forma Técnica 682	Cargada automáticamente desde inventario	4
669	Forma Técnica 669	Cargada automáticamente desde inventario	4
332	Forma Técnica 332	Cargada automáticamente desde inventario	4
462	Forma Técnica 462	Cargada automáticamente desde inventario	4
128	Forma Técnica 128	Cargada automáticamente desde inventario	4
385	Forma Técnica 385	Cargada automáticamente desde inventario	4
131	Forma Técnica 131	Cargada automáticamente desde inventario	4
74	Forma Técnica 74	Cargada automáticamente desde inventario	4
528	Forma Técnica 528	Cargada automáticamente desde inventario	4
523	Forma Técnica 523	Cargada automáticamente desde inventario	4
534	Forma Técnica 534	Cargada automáticamente desde inventario	4
41	Forma Técnica 41	Cargada automáticamente desde inventario	4
502	Forma Técnica 502	Cargada automáticamente desde inventario	4
1	Inyectable	Solución estéril para administración parenteral	4
2	Suspensión Oral	Líquido para administración por vía oral	4
3	Tableta	Forma sólida oral	4
4	Polvo	Polvo para reconstituir o administrar directamente	4
5	Crema/Pomada	Aplicación tópica externa	4
6	Gotas	Solución en gotas para diversas vías	4
7	Cápsula	Medicamento encapsulado	4
8	Gel	Forma semisólida	4
9	Aerosol/Spray	Aplicación por aspersión	4
10	Solución	Solución líquida concentrada	4
11	Jarabe	Solución oral edulcorada	4
12	Pasta	Preparado semisólido oral	4
430	Forma Técnica 430	Cargada automáticamente desde inventario	4
399	Forma Técnica 399	Cargada automáticamente desde inventario	4
204	Forma Técnica 204	Cargada automáticamente desde inventario	4
393	Forma Técnica 393	Cargada automáticamente desde inventario	4
696	Forma Técnica 696	Cargada automáticamente desde inventario	4
577	Forma Técnica 577	Cargada automáticamente desde inventario	4
45	Forma Técnica 45	Cargada automáticamente desde inventario	4
401	Forma Técnica 401	Cargada automáticamente desde inventario	4
635	Forma Técnica 635	Cargada automáticamente desde inventario	4
164	Forma Técnica 164	Cargada automáticamente desde inventario	4
505	Forma Técnica 505	Cargada automáticamente desde inventario	4
138	Forma Técnica 138	Cargada automáticamente desde inventario	4
295	Forma Técnica 295	Cargada automáticamente desde inventario	4
360	Forma Técnica 360	Cargada automáticamente desde inventario	4
187	Forma Técnica 187	Cargada automáticamente desde inventario	4
121	Forma Técnica 121	Cargada automáticamente desde inventario	4
98	Forma Técnica 98	Cargada automáticamente desde inventario	4
661	Forma Técnica 661	Cargada automáticamente desde inventario	4
641	Forma Técnica 641	Cargada automáticamente desde inventario	4
389	Forma Técnica 389	Cargada automáticamente desde inventario	4
264	Forma Técnica 264	Cargada automáticamente desde inventario	4
186	Forma Técnica 186	Cargada automáticamente desde inventario	4
643	Forma Técnica 643	Cargada automáticamente desde inventario	4
398	Forma Técnica 398	Cargada automáticamente desde inventario	4
72	Forma Técnica 72	Cargada automáticamente desde inventario	4
146	Forma Técnica 146	Cargada automáticamente desde inventario	4
23	Forma Técnica 23	Cargada automáticamente desde inventario	4
352	Forma Técnica 352	Cargada automáticamente desde inventario	4
556	Forma Técnica 556	Cargada automáticamente desde inventario	4
519	Forma Técnica 519	Cargada automáticamente desde inventario	4
453	Forma Técnica 453	Cargada automáticamente desde inventario	4
509	Forma Técnica 509	Cargada automáticamente desde inventario	4
451	Forma Técnica 451	Cargada automáticamente desde inventario	4
388	Forma Técnica 388	Cargada automáticamente desde inventario	4
212	Forma Técnica 212	Cargada automáticamente desde inventario	4
156	Forma Técnica 156	Cargada automáticamente desde inventario	4
152	Forma Técnica 152	Cargada automáticamente desde inventario	4
110	Forma Técnica 110	Cargada automáticamente desde inventario	4
29	Forma Técnica 29	Cargada automáticamente desde inventario	4
525	Forma Técnica 525	Cargada automáticamente desde inventario	4
226	Forma Técnica 226	Cargada automáticamente desde inventario	4
327	Forma Técnica 327	Cargada automáticamente desde inventario	4
167	Forma Técnica 167	Cargada automáticamente desde inventario	4
166	Forma Técnica 166	Cargada automáticamente desde inventario	4
190	Forma Técnica 190	Cargada automáticamente desde inventario	4
570	Forma Técnica 570	Cargada automáticamente desde inventario	4
322	Forma Técnica 322	Cargada automáticamente desde inventario	4
170	Forma Técnica 170	Cargada automáticamente desde inventario	4
368	Forma Técnica 368	Cargada automáticamente desde inventario	4
412	Forma Técnica 412	Cargada automáticamente desde inventario	4
183	Forma Técnica 183	Cargada automáticamente desde inventario	4
25	Forma Técnica 25	Cargada automáticamente desde inventario	4
126	Forma Técnica 126	Cargada automáticamente desde inventario	4
109	Forma Técnica 109	Cargada automáticamente desde inventario	4
239	Forma Técnica 239	Cargada automáticamente desde inventario	4
530	Forma Técnica 530	Cargada automáticamente desde inventario	4
47	Forma Técnica 47	Cargada automáticamente desde inventario	4
510	Forma Técnica 510	Cargada automáticamente desde inventario	4
155	Forma Técnica 155	Cargada automáticamente desde inventario	4
649	Forma Técnica 649	Cargada automáticamente desde inventario	4
339	Forma Técnica 339	Cargada automáticamente desde inventario	4
667	Forma Técnica 667	Cargada automáticamente desde inventario	4
293	Forma Técnica 293	Cargada automáticamente desde inventario	4
234	Forma Técnica 234	Cargada automáticamente desde inventario	4
158	Forma Técnica 158	Cargada automáticamente desde inventario	4
415	Forma Técnica 415	Cargada automáticamente desde inventario	4
364	Forma Técnica 364	Cargada automáticamente desde inventario	4
151	Forma Técnica 151	Cargada automáticamente desde inventario	4
568	Forma Técnica 568	Cargada automáticamente desde inventario	4
676	Forma Técnica 676	Cargada automáticamente desde inventario	4
490	Forma Técnica 490	Cargada automáticamente desde inventario	4
256	Forma Técnica 256	Cargada automáticamente desde inventario	4
289	Forma Técnica 289	Cargada automáticamente desde inventario	4
611	Forma Técnica 611	Cargada automáticamente desde inventario	4
610	Forma Técnica 610	Cargada automáticamente desde inventario	4
319	Forma Técnica 319	Cargada automáticamente desde inventario	4
584	Forma Técnica 584	Cargada automáticamente desde inventario	4
153	Forma Técnica 153	Cargada automáticamente desde inventario	4
184	Forma Técnica 184	Cargada automáticamente desde inventario	4
30	Forma Técnica 30	Cargada automáticamente desde inventario	4
243	Forma Técnica 243	Cargada automáticamente desde inventario	4
369	Forma Técnica 369	Cargada automáticamente desde inventario	4
576	Forma Técnica 576	Cargada automáticamente desde inventario	4
69	Forma Técnica 69	Cargada automáticamente desde inventario	4
447	Forma Técnica 447	Cargada automáticamente desde inventario	4
227	Forma Técnica 227	Cargada automáticamente desde inventario	4
421	Forma Técnica 421	Cargada automáticamente desde inventario	4
270	Forma Técnica 270	Cargada automáticamente desde inventario	4
400	Forma Técnica 400	Cargada automáticamente desde inventario	4
423	Forma Técnica 423	Cargada automáticamente desde inventario	4
404	Forma Técnica 404	Cargada automáticamente desde inventario	4
176	Forma Técnica 176	Cargada automáticamente desde inventario	4
559	Forma Técnica 559	Cargada automáticamente desde inventario	4
200	Forma Técnica 200	Cargada automáticamente desde inventario	4
585	Forma Técnica 585	Cargada automáticamente desde inventario	4
230	Forma Técnica 230	Cargada automáticamente desde inventario	4
120	Forma Técnica 120	Cargada automáticamente desde inventario	4
592	Forma Técnica 592	Cargada automáticamente desde inventario	4
83	Forma Técnica 83	Cargada automáticamente desde inventario	4
675	Forma Técnica 675	Cargada automáticamente desde inventario	4
531	Forma Técnica 531	Cargada automáticamente desde inventario	4
633	Forma Técnica 633	Cargada automáticamente desde inventario	4
328	Forma Técnica 328	Cargada automáticamente desde inventario	4
582	Forma Técnica 582	Cargada automáticamente desde inventario	4
290	Forma Técnica 290	Cargada automáticamente desde inventario	4
262	Forma Técnica 262	Cargada automáticamente desde inventario	4
527	Forma Técnica 527	Cargada automáticamente desde inventario	4
113	Forma Técnica 113	Cargada automáticamente desde inventario	4
489	Forma Técnica 489	Cargada automáticamente desde inventario	4
567	Forma Técnica 567	Cargada automáticamente desde inventario	4
602	Forma Técnica 602	Cargada automáticamente desde inventario	4
237	Forma Técnica 237	Cargada automáticamente desde inventario	4
118	Forma Técnica 118	Cargada automáticamente desde inventario	4
599	Forma Técnica 599	Cargada automáticamente desde inventario	4
232	Forma Técnica 232	Cargada automáticamente desde inventario	4
182	Forma Técnica 182	Cargada automáticamente desde inventario	4
566	Forma Técnica 566	Cargada automáticamente desde inventario	4
478	Forma Técnica 478	Cargada automáticamente desde inventario	4
165	Forma Técnica 165	Cargada automáticamente desde inventario	4
275	Forma Técnica 275	Cargada automáticamente desde inventario	4
425	Forma Técnica 425	Cargada automáticamente desde inventario	4
419	Forma Técnica 419	Cargada automáticamente desde inventario	4
48	Forma Técnica 48	Cargada automáticamente desde inventario	4
637	Forma Técnica 637	Cargada automáticamente desde inventario	4
549	Forma Técnica 549	Cargada automáticamente desde inventario	4
240	Forma Técnica 240	Cargada automáticamente desde inventario	4
162	Forma Técnica 162	Cargada automáticamente desde inventario	4
433	Forma Técnica 433	Cargada automáticamente desde inventario	4
562	Forma Técnica 562	Cargada automáticamente desde inventario	4
341	Forma Técnica 341	Cargada automáticamente desde inventario	4
689	Forma Técnica 689	Cargada automáticamente desde inventario	4
670	Forma Técnica 670	Cargada automáticamente desde inventario	4
424	Forma Técnica 424	Cargada automáticamente desde inventario	4
35	Forma Técnica 35	Cargada automáticamente desde inventario	4
301	Forma Técnica 301	Cargada automáticamente desde inventario	4
558	Forma Técnica 558	Cargada automáticamente desde inventario	4
591	Forma Técnica 591	Cargada automáticamente desde inventario	4
307	Forma Técnica 307	Cargada automáticamente desde inventario	4
62	Forma Técnica 62	Cargada automáticamente desde inventario	4
380	Forma Técnica 380	Cargada automáticamente desde inventario	4
248	Forma Técnica 248	Cargada automáticamente desde inventario	4
499	Forma Técnica 499	Cargada automáticamente desde inventario	4
44	Forma Técnica 44	Cargada automáticamente desde inventario	4
331	Forma Técnica 331	Cargada automáticamente desde inventario	4
281	Forma Técnica 281	Cargada automáticamente desde inventario	4
33	Forma Técnica 33	Cargada automáticamente desde inventario	4
215	Forma Técnica 215	Cargada automáticamente desde inventario	4
348	Forma Técnica 348	Cargada automáticamente desde inventario	4
115	Forma Técnica 115	Cargada automáticamente desde inventario	4
690	Forma Técnica 690	Cargada automáticamente desde inventario	4
89	Forma Técnica 89	Cargada automáticamente desde inventario	4
189	Forma Técnica 189	Cargada automáticamente desde inventario	4
205	Forma Técnica 205	Cargada automáticamente desde inventario	4
220	Forma Técnica 220	Cargada automáticamente desde inventario	4
199	Forma Técnica 199	Cargada automáticamente desde inventario	4
46	Forma Técnica 46	Cargada automáticamente desde inventario	4
664	Forma Técnica 664	Cargada automáticamente desde inventario	4
563	Forma Técnica 563	Cargada automáticamente desde inventario	4
247	Forma Técnica 247	Cargada automáticamente desde inventario	4
150	Forma Técnica 150	Cargada automáticamente desde inventario	4
699	Forma Técnica 699	Cargada automáticamente desde inventario	4
259	Forma Técnica 259	Cargada automáticamente desde inventario	4
34	Forma Técnica 34	Cargada automáticamente desde inventario	4
263	Forma Técnica 263	Cargada automáticamente desde inventario	4
196	Forma Técnica 196	Cargada automáticamente desde inventario	4
417	Forma Técnica 417	Cargada automáticamente desde inventario	4
60	Forma Técnica 60	Cargada automáticamente desde inventario	4
652	Forma Técnica 652	Cargada automáticamente desde inventario	4
613	Forma Técnica 613	Cargada automáticamente desde inventario	4
381	Forma Técnica 381	Cargada automáticamente desde inventario	4
36	Forma Técnica 36	Cargada automáticamente desde inventario	4
79	Forma Técnica 79	Cargada automáticamente desde inventario	4
308	Forma Técnica 308	Cargada automáticamente desde inventario	4
420	Forma Técnica 420	Cargada automáticamente desde inventario	4
373	Forma Técnica 373	Cargada automáticamente desde inventario	4
309	Forma Técnica 309	Cargada automáticamente desde inventario	4
197	Forma Técnica 197	Cargada automáticamente desde inventario	4
672	Forma Técnica 672	Cargada automáticamente desde inventario	4
586	Forma Técnica 586	Cargada automáticamente desde inventario	4
448	Forma Técnica 448	Cargada automáticamente desde inventario	4
403	Forma Técnica 403	Cargada automáticamente desde inventario	4
674	Forma Técnica 674	Cargada automáticamente desde inventario	4
488	Forma Técnica 488	Cargada automáticamente desde inventario	4
303	Forma Técnica 303	Cargada automáticamente desde inventario	4
606	Forma Técnica 606	Cargada automáticamente desde inventario	4
629	Forma Técnica 629	Cargada automáticamente desde inventario	4
492	Forma Técnica 492	Cargada automáticamente desde inventario	4
371	Forma Técnica 371	Cargada automáticamente desde inventario	4
575	Forma Técnica 575	Cargada automáticamente desde inventario	4
95	Forma Técnica 95	Cargada automáticamente desde inventario	4
59	Forma Técnica 59	Cargada automáticamente desde inventario	4
680	Forma Técnica 680	Cargada automáticamente desde inventario	4
346	Forma Técnica 346	Cargada automáticamente desde inventario	4
93	Forma Técnica 93	Cargada automáticamente desde inventario	4
298	Forma Técnica 298	Cargada automáticamente desde inventario	4
112	Forma Técnica 112	Cargada automáticamente desde inventario	4
40	Forma Técnica 40	Cargada automáticamente desde inventario	4
185	Forma Técnica 185	Cargada automáticamente desde inventario	4
108	Forma Técnica 108	Cargada automáticamente desde inventario	4
654	Forma Técnica 654	Cargada automáticamente desde inventario	4
323	Forma Técnica 323	Cargada automáticamente desde inventario	4
203	Forma Técnica 203	Cargada automáticamente desde inventario	4
99	Forma Técnica 99	Cargada automáticamente desde inventario	4
595	Forma Técnica 595	Cargada automáticamente desde inventario	4
370	Forma Técnica 370	Cargada automáticamente desde inventario	4
334	Forma Técnica 334	Cargada automáticamente desde inventario	4
305	Forma Técnica 305	Cargada automáticamente desde inventario	4
249	Forma Técnica 249	Cargada automáticamente desde inventario	4
84	Forma Técnica 84	Cargada automáticamente desde inventario	4
365	Forma Técnica 365	Cargada automáticamente desde inventario	4
257	Forma Técnica 257	Cargada automáticamente desde inventario	4
605	Forma Técnica 605	Cargada automáticamente desde inventario	4
581	Forma Técnica 581	Cargada automáticamente desde inventario	4
224	Forma Técnica 224	Cargada automáticamente desde inventario	4
124	Forma Técnica 124	Cargada automáticamente desde inventario	4
553	Forma Técnica 553	Cargada automáticamente desde inventario	4
119	Forma Técnica 119	Cargada automáticamente desde inventario	4
474	Forma Técnica 474	Cargada automáticamente desde inventario	4
104	Forma Técnica 104	Cargada automáticamente desde inventario	4
524	Forma Técnica 524	Cargada automáticamente desde inventario	4
208	Forma Técnica 208	Cargada automáticamente desde inventario	4
472	Forma Técnica 472	Cargada automáticamente desde inventario	4
539	Forma Técnica 539	Cargada automáticamente desde inventario	4
333	Forma Técnica 333	Cargada automáticamente desde inventario	4
648	Forma Técnica 648	Cargada automáticamente desde inventario	4
693	Forma Técnica 693	Cargada automáticamente desde inventario	4
405	Forma Técnica 405	Cargada automáticamente desde inventario	4
91	Forma Técnica 91	Cargada automáticamente desde inventario	4
326	Forma Técnica 326	Cargada automáticamente desde inventario	4
621	Forma Técnica 621	Cargada automáticamente desde inventario	4
280	Forma Técnica 280	Cargada automáticamente desde inventario	4
244	Forma Técnica 244	Cargada automáticamente desde inventario	4
526	Forma Técnica 526	Cargada automáticamente desde inventario	4
141	Forma Técnica 141	Cargada automáticamente desde inventario	4
50	Forma Técnica 50	Cargada automáticamente desde inventario	4
144	Forma Técnica 144	Cargada automáticamente desde inventario	4
630	Forma Técnica 630	Cargada automáticamente desde inventario	4
590	Forma Técnica 590	Cargada automáticamente desde inventario	4
436	Forma Técnica 436	Cargada automáticamente desde inventario	4
206	Forma Técnica 206	Cargada automáticamente desde inventario	4
111	Forma Técnica 111	Cargada automáticamente desde inventario	4
628	Forma Técnica 628	Cargada automáticamente desde inventario	4
533	Forma Técnica 533	Cargada automáticamente desde inventario	4
482	Forma Técnica 482	Cargada automáticamente desde inventario	4
683	Forma Técnica 683	Cargada automáticamente desde inventario	4
460	Forma Técnica 460	Cargada automáticamente desde inventario	4
681	Forma Técnica 681	Cargada automáticamente desde inventario	4
573	Forma Técnica 573	Cargada automáticamente desde inventario	4
500	Forma Técnica 500	Cargada automáticamente desde inventario	4
78	Forma Técnica 78	Cargada automáticamente desde inventario	4
374	Forma Técnica 374	Cargada automáticamente desde inventario	4
285	Forma Técnica 285	Cargada automáticamente desde inventario	4
180	Forma Técnica 180	Cargada automáticamente desde inventario	4
557	Forma Técnica 557	Cargada automáticamente desde inventario	4
411	Forma Técnica 411	Cargada automáticamente desde inventario	4
241	Forma Técnica 241	Cargada automáticamente desde inventario	4
255	Forma Técnica 255	Cargada automáticamente desde inventario	4
61	Forma Técnica 61	Cargada automáticamente desde inventario	4
578	Forma Técnica 578	Cargada automáticamente desde inventario	4
101	Forma Técnica 101	Cargada automáticamente desde inventario	4
615	Forma Técnica 615	Cargada automáticamente desde inventario	4
358	Forma Técnica 358	Cargada automáticamente desde inventario	4
300	Forma Técnica 300	Cargada automáticamente desde inventario	4
96	Forma Técnica 96	Cargada automáticamente desde inventario	4
468	Forma Técnica 468	Cargada automáticamente desde inventario	4
632	Forma Técnica 632	Cargada automáticamente desde inventario	4
94	Forma Técnica 94	Cargada automáticamente desde inventario	4
639	Forma Técnica 639	Cargada automáticamente desde inventario	4
504	Forma Técnica 504	Cargada automáticamente desde inventario	4
218	Forma Técnica 218	Cargada automáticamente desde inventario	4
117	Forma Técnica 117	Cargada automáticamente desde inventario	4
278	Forma Técnica 278	Cargada automáticamente desde inventario	4
552	Forma Técnica 552	Cargada automáticamente desde inventario	4
375	Forma Técnica 375	Cargada automáticamente desde inventario	4
363	Forma Técnica 363	Cargada automáticamente desde inventario	4
80	Forma Técnica 80	Cargada automáticamente desde inventario	4
71	Forma Técnica 71	Cargada automáticamente desde inventario	4
467	Forma Técnica 467	Cargada automáticamente desde inventario	4
265	Forma Técnica 265	Cargada automáticamente desde inventario	4
292	Forma Técnica 292	Cargada automáticamente desde inventario	4
102	Forma Técnica 102	Cargada automáticamente desde inventario	4
614	Forma Técnica 614	Cargada automáticamente desde inventario	4
588	Forma Técnica 588	Cargada automáticamente desde inventario	4
15	Forma Técnica 15	Cargada automáticamente desde inventario	4
386	Forma Técnica 386	Cargada automáticamente desde inventario	4
418	Forma Técnica 418	Cargada automáticamente desde inventario	4
598	Forma Técnica 598	Cargada automáticamente desde inventario	4
463	Forma Técnica 463	Cargada automáticamente desde inventario	4
546	Forma Técnica 546	Cargada automáticamente desde inventario	4
498	Forma Técnica 498	Cargada automáticamente desde inventario	4
137	Forma Técnica 137	Cargada automáticamente desde inventario	4
454	Forma Técnica 454	Cargada automáticamente desde inventario	4
116	Forma Técnica 116	Cargada automáticamente desde inventario	4
258	Forma Técnica 258	Cargada automáticamente desde inventario	4
42	Forma Técnica 42	Cargada automáticamente desde inventario	4
688	Forma Técnica 688	Cargada automáticamente desde inventario	4
658	Forma Técnica 658	Cargada automáticamente desde inventario	4
645	Forma Técnica 645	Cargada automáticamente desde inventario	4
163	Forma Técnica 163	Cargada automáticamente desde inventario	4
414	Forma Técnica 414	Cargada automáticamente desde inventario	4
378	Forma Técnica 378	Cargada automáticamente desde inventario	4
245	Forma Técnica 245	Cargada automáticamente desde inventario	4
343	Forma Técnica 343	Cargada automáticamente desde inventario	4
318	Forma Técnica 318	Cargada automáticamente desde inventario	4
20	Forma Técnica 20	Cargada automáticamente desde inventario	4
634	Forma Técnica 634	Cargada automáticamente desde inventario	4
372	Forma Técnica 372	Cargada automáticamente desde inventario	4
238	Forma Técnica 238	Cargada automáticamente desde inventario	4
350	Forma Técnica 350	Cargada automáticamente desde inventario	4
14	Forma Técnica 14	Cargada automáticamente desde inventario	4
313	Forma Técnica 313	Cargada automáticamente desde inventario	4
367	Forma Técnica 367	Cargada automáticamente desde inventario	4
620	Forma Técnica 620	Cargada automáticamente desde inventario	4
181	Forma Técnica 181	Cargada automáticamente desde inventario	4
396	Forma Técnica 396	Cargada automáticamente desde inventario	4
691	Forma Técnica 691	Cargada automáticamente desde inventario	4
501	Forma Técnica 501	Cargada automáticamente desde inventario	4
314	Forma Técnica 314	Cargada automáticamente desde inventario	4
416	Forma Técnica 416	Cargada automáticamente desde inventario	4
443	Forma Técnica 443	Cargada automáticamente desde inventario	4
383	Forma Técnica 383	Cargada automáticamente desde inventario	4
560	Forma Técnica 560	Cargada automáticamente desde inventario	4
627	Forma Técnica 627	Cargada automáticamente desde inventario	4
149	Forma Técnica 149	Cargada automáticamente desde inventario	4
340	Forma Técnica 340	Cargada automáticamente desde inventario	4
353	Forma Técnica 353	Cargada automáticamente desde inventario	4
228	Forma Técnica 228	Cargada automáticamente desde inventario	4
408	Forma Técnica 408	Cargada automáticamente desde inventario	4
449	Forma Técnica 449	Cargada automáticamente desde inventario	4
88	Forma Técnica 88	Cargada automáticamente desde inventario	4
159	Forma Técnica 159	Cargada automáticamente desde inventario	4
387	Forma Técnica 387	Cargada automáticamente desde inventario	4
483	Forma Técnica 483	Cargada automáticamente desde inventario	4
58	Forma Técnica 58	Cargada automáticamente desde inventario	4
624	Forma Técnica 624	Cargada automáticamente desde inventario	4
428	Forma Técnica 428	Cargada automáticamente desde inventario	4
90	Forma Técnica 90	Cargada automáticamente desde inventario	4
684	Forma Técnica 684	Cargada automáticamente desde inventario	4
394	Forma Técnica 394	Cargada automáticamente desde inventario	4
39	Forma Técnica 39	Cargada automáticamente desde inventario	4
260	Forma Técnica 260	Cargada automáticamente desde inventario	4
217	Forma Técnica 217	Cargada automáticamente desde inventario	4
507	Forma Técnica 507	Cargada automáticamente desde inventario	4
100	Forma Técnica 100	Cargada automáticamente desde inventario	4
653	Forma Técnica 653	Cargada automáticamente desde inventario	4
177	Forma Técnica 177	Cargada automáticamente desde inventario	4
496	Forma Técnica 496	Cargada automáticamente desde inventario	4
572	Forma Técnica 572	Cargada automáticamente desde inventario	4
687	Forma Técnica 687	Cargada automáticamente desde inventario	4
268	Forma Técnica 268	Cargada automáticamente desde inventario	4
250	Forma Técnica 250	Cargada automáticamente desde inventario	4
134	Forma Técnica 134	Cargada automáticamente desde inventario	4
678	Forma Técnica 678	Cargada automáticamente desde inventario	4
442	Forma Técnica 442	Cargada automáticamente desde inventario	4
351	Forma Técnica 351	Cargada automáticamente desde inventario	4
481	Forma Técnica 481	Cargada automáticamente desde inventario	4
315	Forma Técnica 315	Cargada automáticamente desde inventario	4
603	Forma Técnica 603	Cargada automáticamente desde inventario	4
662	Forma Técnica 662	Cargada automáticamente desde inventario	4
379	Forma Técnica 379	Cargada automáticamente desde inventario	4
271	Forma Técnica 271	Cargada automáticamente desde inventario	4
304	Forma Técnica 304	Cargada automáticamente desde inventario	4
172	Forma Técnica 172	Cargada automáticamente desde inventario	4
520	Forma Técnica 520	Cargada automáticamente desde inventario	4
242	Forma Técnica 242	Cargada automáticamente desde inventario	4
161	Forma Técnica 161	Cargada automáticamente desde inventario	4
593	Forma Técnica 593	Cargada automáticamente desde inventario	4
310	Forma Técnica 310	Cargada automáticamente desde inventario	4
473	Forma Técnica 473	Cargada automáticamente desde inventario	4
642	Forma Técnica 642	Cargada automáticamente desde inventario	4
491	Forma Técnica 491	Cargada automáticamente desde inventario	4
63	Forma Técnica 63	Cargada automáticamente desde inventario	4
179	Forma Técnica 179	Cargada automáticamente desde inventario	4
64	Forma Técnica 64	Cargada automáticamente desde inventario	4
464	Forma Técnica 464	Cargada automáticamente desde inventario	4
619	Forma Técnica 619	Cargada automáticamente desde inventario	4
497	Forma Técnica 497	Cargada automáticamente desde inventario	4
122	Forma Técnica 122	Cargada automáticamente desde inventario	4
85	Forma Técnica 85	Cargada automáticamente desde inventario	4
107	Forma Técnica 107	Cargada automáticamente desde inventario	4
609	Forma Técnica 609	Cargada automáticamente desde inventario	4
508	Forma Técnica 508	Cargada automáticamente desde inventario	4
660	Forma Técnica 660	Cargada automáticamente desde inventario	4
444	Forma Técnica 444	Cargada automáticamente desde inventario	4
437	Forma Técnica 437	Cargada automáticamente desde inventario	4
32	Forma Técnica 32	Cargada automáticamente desde inventario	4
225	Forma Técnica 225	Cargada automáticamente desde inventario	4
511	Forma Técnica 511	Cargada automáticamente desde inventario	4
291	Forma Técnica 291	Cargada automáticamente desde inventario	4
540	Forma Técnica 540	Cargada automáticamente desde inventario	4
194	Forma Técnica 194	Cargada automáticamente desde inventario	4
542	Forma Técnica 542	Cargada automáticamente desde inventario	4
521	Forma Técnica 521	Cargada automáticamente desde inventario	4
288	Forma Técnica 288	Cargada automáticamente desde inventario	4
169	Forma Técnica 169	Cargada automáticamente desde inventario	4
160	Forma Técnica 160	Cargada automáticamente desde inventario	4
173	Forma Técnica 173	Cargada automáticamente desde inventario	4
457	Forma Técnica 457	Cargada automáticamente desde inventario	4
302	Forma Técnica 302	Cargada automáticamente desde inventario	4
495	Forma Técnica 495	Cargada automáticamente desde inventario	4
201	Forma Técnica 201	Cargada automáticamente desde inventario	4
604	Forma Técnica 604	Cargada automáticamente desde inventario	4
56	Forma Técnica 56	Cargada automáticamente desde inventario	4
66	Forma Técnica 66	Cargada automáticamente desde inventario	4
57	Forma Técnica 57	Cargada automáticamente desde inventario	4
631	Forma Técnica 631	Cargada automáticamente desde inventario	4
700	Forma Técnica 700	Cargada automáticamente desde inventario	4
16	Forma Técnica 16	Cargada automáticamente desde inventario	4
246	Forma Técnica 246	Cargada automáticamente desde inventario	4
81	Forma Técnica 81	Cargada automáticamente desde inventario	4
470	Forma Técnica 470	Cargada automáticamente desde inventario	4
168	Forma Técnica 168	Cargada automáticamente desde inventario	4
286	Forma Técnica 286	Cargada automáticamente desde inventario	4
548	Forma Técnica 548	Cargada automáticamente desde inventario	4
274	Forma Técnica 274	Cargada automáticamente desde inventario	4
668	Forma Técnica 668	Cargada automáticamente desde inventario	4
407	Forma Técnica 407	Cargada automáticamente desde inventario	4
193	Forma Técnica 193	Cargada automáticamente desde inventario	4
455	Forma Técnica 455	Cargada automáticamente desde inventario	4
174	Forma Técnica 174	Cargada automáticamente desde inventario	4
494	Forma Técnica 494	Cargada automáticamente desde inventario	4
97	Forma Técnica 97	Cargada automáticamente desde inventario	4
541	Forma Técnica 541	Cargada automáticamente desde inventario	4
698	Forma Técnica 698	Cargada automáticamente desde inventario	4
513	Forma Técnica 513	Cargada automáticamente desde inventario	4
76	Forma Técnica 76	Cargada automáticamente desde inventario	4
356	Forma Técnica 356	Cargada automáticamente desde inventario	4
252	Forma Técnica 252	Cargada automáticamente desde inventario	4
461	Forma Técnica 461	Cargada automáticamente desde inventario	4
311	Forma Técnica 311	Cargada automáticamente desde inventario	4
296	Forma Técnica 296	Cargada automáticamente desde inventario	4
145	Forma Técnica 145	Cargada automáticamente desde inventario	4
402	Forma Técnica 402	Cargada automáticamente desde inventario	4
608	Forma Técnica 608	Cargada automáticamente desde inventario	4
221	Forma Técnica 221	Cargada automáticamente desde inventario	4
87	Forma Técnica 87	Cargada automáticamente desde inventario	4
26	Forma Técnica 26	Cargada automáticamente desde inventario	4
697	Forma Técnica 697	Cargada automáticamente desde inventario	4
266	Forma Técnica 266	Cargada automáticamente desde inventario	4
446	Forma Técnica 446	Cargada automáticamente desde inventario	4
106	Forma Técnica 106	Cargada automáticamente desde inventario	4
191	Forma Técnica 191	Cargada automáticamente desde inventario	4
657	Forma Técnica 657	Cargada automáticamente desde inventario	4
77	Forma Técnica 77	Cargada automáticamente desde inventario	4
480	Forma Técnica 480	Cargada automáticamente desde inventario	4
564	Forma Técnica 564	Cargada automáticamente desde inventario	4
276	Forma Técnica 276	Cargada automáticamente desde inventario	4
622	Forma Técnica 622	Cargada automáticamente desde inventario	4
551	Forma Técnica 551	Cargada automáticamente desde inventario	4
330	Forma Técnica 330	Cargada automáticamente desde inventario	4
601	Forma Técnica 601	Cargada automáticamente desde inventario	4
561	Forma Técnica 561	Cargada automáticamente desde inventario	4
54	Forma Técnica 54	Cargada automáticamente desde inventario	4
132	Forma Técnica 132	Cargada automáticamente desde inventario	4
284	Forma Técnica 284	Cargada automáticamente desde inventario	4
435	Forma Técnica 435	Cargada automáticamente desde inventario	4
294	Forma Técnica 294	Cargada automáticamente desde inventario	4
623	Forma Técnica 623	Cargada automáticamente desde inventario	4
597	Forma Técnica 597	Cargada automáticamente desde inventario	4
666	Forma Técnica 666	Cargada automáticamente desde inventario	4
195	Forma Técnica 195	Cargada automáticamente desde inventario	4
171	Forma Técnica 171	Cargada automáticamente desde inventario	4
17	Forma Técnica 17	Cargada automáticamente desde inventario	4
456	Forma Técnica 456	Cargada automáticamente desde inventario	4
406	Forma Técnica 406	Cargada automáticamente desde inventario	4
19	Forma Técnica 19	Cargada automáticamente desde inventario	4
486	Forma Técnica 486	Cargada automáticamente desde inventario	4
392	Forma Técnica 392	Cargada automáticamente desde inventario	4
547	Forma Técnica 547	Cargada automáticamente desde inventario	4
515	Forma Técnica 515	Cargada automáticamente desde inventario	4
646	Forma Técnica 646	Cargada automáticamente desde inventario	4
475	Forma Técnica 475	Cargada automáticamente desde inventario	4
357	Forma Técnica 357	Cargada automáticamente desde inventario	4
219	Forma Técnica 219	Cargada automáticamente desde inventario	4
644	Forma Técnica 644	Cargada automáticamente desde inventario	4
469	Forma Técnica 469	Cargada automáticamente desde inventario	4
216	Forma Técnica 216	Cargada automáticamente desde inventario	4
397	Forma Técnica 397	Cargada automáticamente desde inventario	4
253	Forma Técnica 253	Cargada automáticamente desde inventario	4
207	Forma Técnica 207	Cargada automáticamente desde inventario	4
139	Forma Técnica 139	Cargada automáticamente desde inventario	4
607	Forma Técnica 607	Cargada automáticamente desde inventario	4
459	Forma Técnica 459	Cargada automáticamente desde inventario	4
487	Forma Técnica 487	Cargada automáticamente desde inventario	4
493	Forma Técnica 493	Cargada automáticamente desde inventario	4
147	Forma Técnica 147	Cargada automáticamente desde inventario	4
434	Forma Técnica 434	Cargada automáticamente desde inventario	4
210	Forma Técnica 210	Cargada automáticamente desde inventario	4
355	Forma Técnica 355	Cargada automáticamente desde inventario	4
325	Forma Técnica 325	Cargada automáticamente desde inventario	4
640	Forma Técnica 640	Cargada automáticamente desde inventario	4
512	Forma Técnica 512	Cargada automáticamente desde inventario	4
86	Forma Técnica 86	Cargada automáticamente desde inventario	4
52	Forma Técnica 52	Cargada automáticamente desde inventario	4
254	Forma Técnica 254	Cargada automáticamente desde inventario	4
233	Forma Técnica 233	Cargada automáticamente desde inventario	4
73	Forma Técnica 73	Cargada automáticamente desde inventario	4
471	Forma Técnica 471	Cargada automáticamente desde inventario	4
154	Forma Técnica 154	Cargada automáticamente desde inventario	4
479	Forma Técnica 479	Cargada automáticamente desde inventario	4
440	Forma Técnica 440	Cargada automáticamente desde inventario	4
142	Forma Técnica 142	Cargada automáticamente desde inventario	4
251	Forma Técnica 251	Cargada automáticamente desde inventario	4
554	Forma Técnica 554	Cargada automáticamente desde inventario	4
299	Forma Técnica 299	Cargada automáticamente desde inventario	4
175	Forma Técnica 175	Cargada automáticamente desde inventario	4
694	Forma Técnica 694	Cargada automáticamente desde inventario	4
178	Forma Técnica 178	Cargada automáticamente desde inventario	4
536	Forma Técnica 536	Cargada automáticamente desde inventario	4
198	Forma Técnica 198	Cargada automáticamente desde inventario	4
580	Forma Técnica 580	Cargada automáticamente desde inventario	4
410	Forma Técnica 410	Cargada automáticamente desde inventario	4
133	Forma Técnica 133	Cargada automáticamente desde inventario	4
391	Forma Técnica 391	Cargada automáticamente desde inventario	4
82	Forma Técnica 82	Cargada automáticamente desde inventario	4
324	Forma Técnica 324	Cargada automáticamente desde inventario	4
43	Forma Técnica 43	Cargada automáticamente desde inventario	4
188	Forma Técnica 188	Cargada automáticamente desde inventario	4
312	Forma Técnica 312	Cargada automáticamente desde inventario	4
673	Forma Técnica 673	Cargada automáticamente desde inventario	4
211	Forma Técnica 211	Cargada automáticamente desde inventario	4
695	Forma Técnica 695	Cargada automáticamente desde inventario	4
638	Forma Técnica 638	Cargada automáticamente desde inventario	4
135	Forma Técnica 135	Cargada automáticamente desde inventario	4
647	Forma Técnica 647	Cargada automáticamente desde inventario	4
37	Forma Técnica 37	Cargada automáticamente desde inventario	4
650	Forma Técnica 650	Cargada automáticamente desde inventario	4
429	Forma Técnica 429	Cargada automáticamente desde inventario	4
538	Forma Técnica 538	Cargada automáticamente desde inventario	4
213	Forma Técnica 213	Cargada automáticamente desde inventario	4
587	Forma Técnica 587	Cargada automáticamente desde inventario	4
21	Forma Técnica 21	Cargada automáticamente desde inventario	4
27	Forma Técnica 27	Cargada automáticamente desde inventario	4
517	Forma Técnica 517	Cargada automáticamente desde inventario	4
395	Forma Técnica 395	Cargada automáticamente desde inventario	4
441	Forma Técnica 441	Cargada automáticamente desde inventario	4
671	Forma Técnica 671	Cargada automáticamente desde inventario	4
202	Forma Técnica 202	Cargada automáticamente desde inventario	4
655	Forma Técnica 655	Cargada automáticamente desde inventario	4
485	Forma Técnica 485	Cargada automáticamente desde inventario	4
532	Forma Técnica 532	Cargada automáticamente desde inventario	4
273	Forma Técnica 273	Cargada automáticamente desde inventario	4
114	Forma Técnica 114	Cargada automáticamente desde inventario	4
157	Forma Técnica 157	Cargada automáticamente desde inventario	4
283	Forma Técnica 283	Cargada automáticamente desde inventario	4
555	Forma Técnica 555	Cargada automáticamente desde inventario	4
49	Forma Técnica 49	Cargada automáticamente desde inventario	4
344	Forma Técnica 344	Cargada automáticamente desde inventario	4
529	Forma Técnica 529	Cargada automáticamente desde inventario	4
571	Forma Técnica 571	Cargada automáticamente desde inventario	4
129	Forma Técnica 129	Cargada automáticamente desde inventario	4
338	Forma Técnica 338	Cargada automáticamente desde inventario	4
222	Forma Técnica 222	Cargada automáticamente desde inventario	4
279	Forma Técnica 279	Cargada automáticamente desde inventario	4
465	Forma Técnica 465	Cargada automáticamente desde inventario	4
24	Forma Técnica 24	Cargada automáticamente desde inventario	4
636	Forma Técnica 636	Cargada automáticamente desde inventario	4
514	Forma Técnica 514	Cargada automáticamente desde inventario	4
466	Forma Técnica 466	Cargada automáticamente desde inventario	4
18	Forma Técnica 18	Cargada automáticamente desde inventario	4
550	Forma Técnica 550	Cargada automáticamente desde inventario	4
92	Forma Técnica 92	Cargada automáticamente desde inventario	4
569	Forma Técnica 569	Cargada automáticamente desde inventario	4
503	Forma Técnica 503	Cargada automáticamente desde inventario	4
579	Forma Técnica 579	Cargada automáticamente desde inventario	4
626	Forma Técnica 626	Cargada automáticamente desde inventario	4
426	Forma Técnica 426	Cargada automáticamente desde inventario	4
55	Forma Técnica 55	Cargada automáticamente desde inventario	4
476	Forma Técnica 476	Cargada automáticamente desde inventario	4
335	Forma Técnica 335	Cargada automáticamente desde inventario	4
686	Forma Técnica 686	Cargada automáticamente desde inventario	4
544	Forma Técnica 544	Cargada automáticamente desde inventario	4
103	Forma Técnica 103	Cargada automáticamente desde inventario	4
409	Forma Técnica 409	Cargada automáticamente desde inventario	4
306	Forma Técnica 306	Cargada automáticamente desde inventario	4
261	Forma Técnica 261	Cargada automáticamente desde inventario	4
51	Forma Técnica 51	Cargada automáticamente desde inventario	4
596	Forma Técnica 596	Cargada automáticamente desde inventario	4
692	Forma Técnica 692	Cargada automáticamente desde inventario	4
612	Forma Técnica 612	Cargada automáticamente desde inventario	4
617	Forma Técnica 617	Cargada automáticamente desde inventario	4
68	Forma Técnica 68	Cargada automáticamente desde inventario	4
450	Forma Técnica 450	Cargada automáticamente desde inventario	4
267	Forma Técnica 267	Cargada automáticamente desde inventario	4
377	Forma Técnica 377	Cargada automáticamente desde inventario	4
349	Forma Técnica 349	Cargada automáticamente desde inventario	4
38	Forma Técnica 38	Cargada automáticamente desde inventario	4
574	Forma Técnica 574	Cargada automáticamente desde inventario	4
272	Forma Técnica 272	Cargada automáticamente desde inventario	4
127	Forma Técnica 127	Cargada automáticamente desde inventario	4
361	Forma Técnica 361	Cargada automáticamente desde inventario	4
67	Forma Técnica 67	Cargada automáticamente desde inventario	4
125	Forma Técnica 125	Cargada automáticamente desde inventario	4
28	Forma Técnica 28	Cargada automáticamente desde inventario	4
413	Forma Técnica 413	Cargada automáticamente desde inventario	4
583	Forma Técnica 583	Cargada automáticamente desde inventario	4
589	Forma Técnica 589	Cargada automáticamente desde inventario	4
366	Forma Técnica 366	Cargada automáticamente desde inventario	4
354	Forma Técnica 354	Cargada automáticamente desde inventario	4
320	Forma Técnica 320	Cargada automáticamente desde inventario	4
229	Forma Técnica 229	Cargada automáticamente desde inventario	4
235	Forma Técnica 235	Cargada automáticamente desde inventario	4
677	Forma Técnica 677	Cargada automáticamente desde inventario	4
347	Forma Técnica 347	Cargada automáticamente desde inventario	4
543	Forma Técnica 543	Cargada automáticamente desde inventario	4
209	Forma Técnica 209	Cargada automáticamente desde inventario	4
321	Forma Técnica 321	Cargada automáticamente desde inventario	4
445	Forma Técnica 445	Cargada automáticamente desde inventario	4
390	Forma Técnica 390	Cargada automáticamente desde inventario	4
516	Forma Técnica 516	Cargada automáticamente desde inventario	4
659	Forma Técnica 659	Cargada automáticamente desde inventario	4
477	Forma Técnica 477	Cargada automáticamente desde inventario	4
422	Forma Técnica 422	Cargada automáticamente desde inventario	4
140	Forma Técnica 140	Cargada automáticamente desde inventario	4
384	Forma Técnica 384	Cargada automáticamente desde inventario	4
136	Forma Técnica 136	Cargada automáticamente desde inventario	4
506	Forma Técnica 506	Cargada automáticamente desde inventario	4
130	Forma Técnica 130	Cargada automáticamente desde inventario	4
362	Forma Técnica 362	Cargada automáticamente desde inventario	4
231	Forma Técnica 231	Cargada automáticamente desde inventario	4
277	Forma Técnica 277	Cargada automáticamente desde inventario	4
656	Forma Técnica 656	Cargada automáticamente desde inventario	4
600	Forma Técnica 600	Cargada automáticamente desde inventario	4
105	Forma Técnica 105	Cargada automáticamente desde inventario	4
329	Forma Técnica 329	Cargada automáticamente desde inventario	4
382	Forma Técnica 382	Cargada automáticamente desde inventario	4
53	Forma Técnica 53	Cargada automáticamente desde inventario	4
545	Forma Técnica 545	Cargada automáticamente desde inventario	4
336	Forma Técnica 336	Cargada automáticamente desde inventario	4
143	Forma Técnica 143	Cargada automáticamente desde inventario	4
663	Forma Técnica 663	Cargada automáticamente desde inventario	4
287	Forma Técnica 287	Cargada automáticamente desde inventario	4
65	Forma Técnica 65	Cargada automáticamente desde inventario	4
565	Forma Técnica 565	Cargada automáticamente desde inventario	4
537	Forma Técnica 537	Cargada automáticamente desde inventario	4
522	Forma Técnica 522	Cargada automáticamente desde inventario	4
148	Forma Técnica 148	Cargada automáticamente desde inventario	4
685	Forma Técnica 685	Cargada automáticamente desde inventario	4
518	Forma Técnica 518	Cargada automáticamente desde inventario	4
269	Forma Técnica 269	Cargada automáticamente desde inventario	4
\.


--
-- Data for Name: cat_importancia_vacuna; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cat_importancia_vacuna (id_importancia, descripcion) FROM stdin;
1	ESENCIAL
2	NO ESENCIAL
\.


--
-- Data for Name: cat_interaccion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cat_interaccion (id_interaccion, nivel) FROM stdin;
1	Alto
2	Bajo
3	Bajo/Medio
4	Medio
5	Medio/Alto
6	Muy Alto
\.


--
-- Data for Name: cat_laboratorios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cat_laboratorios (id_laboratorio, nombre_laboratorio, pais_origen, telefono, email, sitio_web, id_especie) FROM stdin;
26	GENOPHARM	México	N/D	N/D	N/D	1
27	BOEHRINGER	Alemania (1885)	(33) 3668-8000	N/D	https://www.boehringer-ingelheim.com/mx	1
1	Zoetis	Estados Unidos	+1-888-963-8471	contacto@zoetis.com	www.zoetis.com	4
2	Vetoquinol	Francia	+33-2-33-38-33-00	info@vetoquinol.com	www.vetoquinol.com	4
3	ReptiVet	Alemania	+49-30-1234567	contacto@reptivet.de	www.reptivet.com	4
4	ExoticPharma	Reino Unido	+44-20-7123-4567	info@exoticpharma.co.uk	www.exoticpharma.com	4
5	HerpMed	Estados Unidos	+1-305-555-0123	support@herpmed.com	www.herpmed.com	4
6	Boehringer Ingelheim	Alemania	+49-6132-770	info@boehringer.com	www.boehringer-ingelheim.com	4
7	Elanco	Estados Unidos	+1-317-276-2000	contact@elanco.com	www.elanco.com	4
8	Bayer Animal Health	Alemania	+49-214-30-1	info@bayer.com	www.bayer.com	4
9	Merial	Francia	+33-4-72-72-30-00	contacto@merial.com	www.merial.com	4
10	Virbac	Francia	+33-4-92-08-73-00	info@virbac.com	www.virbac.com	4
11	Ceva Salud Animal	Francia	+33-5-45-90-40-00	ceva@ceva.com	www.ceva.com	4
12	Dechra	Reino Unido	+44-1606-810700	info@dechra.com	www.dechra.com	4
13	Pfizer Animal Health	Estados Unidos	+1-212-733-2323	contact@pfizer.com	www.pfizer.com	4
14	Norbrook	Irlanda	+353-42-966-6222	info@norbrook.com	www.norbrook.com	4
15	Agrolabo	Italia	+39-011-63-03-456	info@agrolabo.com	www.agrolabo.com	4
16	Dopharma	Países Bajos	+31-88-126-2600	info@dopharma.com	www.dopharma.com	4
17	Ultravet	México	+52-33-3134-2000	contacto@ultravet.mx	www.ultravet.mx	4
18	Labyes	España	+34-91-661-8100	info@labyes.com	www.labyes.com	4
19	Alfasan	Países Bajos	+31-348-543-800	info@alfasan.com	www.alfasan.com	4
20	Vencofarma	España	+34-91-661-9900	venco@vencofarma.es	www.vencofarma.es	4
21	Kyron	Sudáfrica	+27-11-707-8188	info@kyronlab.co.za	www.kyronlab.co.za	4
22	Vetpharma	Argentina	+54-11-4756-8900	info@vetpharma.com.ar	www.vetpharma.com.ar	4
23	ReptileRelief	Australia	+61-2-9999-8888	contact@reptilerelief.com.au	www.reptilerelief.com.au	4
24	ExoVet Pro	Canadá	+1-416-555-7890	info@exovetpro.ca	www.exovetpro.ca	4
25	HerpCare Labs	Estados Unidos	+1-954-555-3456	support@herpcare.com	www.herpcare.com	4
\.


--
-- Data for Name: cat_lugares; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cat_lugares (id_lugar, nombre_lugar) FROM stdin;
1	Hoteles
2	Clínica
\.


--
-- Data for Name: cat_municipios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cat_municipios (id_mnpio, id_estado_fk, d_mnpio) FROM stdin;
16	9	Miguel Hidalgo
2	9	Azcapotzalco
33	15	Ecatepec de Morelos
106	15	Toluca
9	9	Milpa Alta
3	9	Coyoacán
12	9	Tlalpan
6	9	Iztacalco
7	9	Iztapalapa
15	9	Cuauhtémoc
8	9	La Magdalena Contreras
58	15	Nezahualcóyotl
14	9	Benito Juárez
10	9	Álvaro Obregón
4	9	Cuajimalpa de Morelos
5	9	Gustavo A. Madero
13	9	Xochimilco
17	9	Venustiano Carranza
11	9	Tláhuac
\.


--
-- Data for Name: cat_presentaciones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cat_presentaciones (id_presentacion, nombre_presentacion, descripcion, id_especie) FROM stdin;
1	Frasco	Envase de vidrio o plástico con tapa, usado comúnmente para líquidos, jarabes, suspensiones o tabletas	4
2	caja 	Empaque de cartón que contiene el medicamento, generalmente con blísters, sobres o viales individuales	4
3	Pipeta	Aplicador dosificador que permite administrar medicamento líquido de forma precisa, común en antiparasitarios tópicos	4
4	Barra	Formato sólido alargado, típico para desparasitantes masticables o suplementos en forma de snack	4
5	Frasco con atomizador	Envase con sistema de aspersión o spray, ideal para aplicaciones tópicas o tratamientos dermatológicos	4
\.


--
-- Data for Name: cat_rasgos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cat_rasgos (id_rasgo, nombre_rasgo) FROM stdin;
1	Sociable
2	Tímido
3	Sociabilidad hacia extraños vs familiares
4	Agresividad
5	Comportamientos relacionados con separación
6	Miedoso / Ansioso
7	Persistencia / Tenacidad
8	Dependencia ambiental
9	Persecución / Instinto de presa
10	Tolerancia / Sensibilidad al tacto
11	Reservado / Distante / Independiente
12	Docilidad / Amistoso
13	Vigilancia / Alerta
14	Reactividad al ruido y movimiento
15	Sensibilidad al tacto
16	Dominancia / Territorialidad
17	Apego al dueño / Búsqueda de atención
18	Capacidad de entrenamiento / Obediencia
19	Tolerancia al tacto
20	Curiosidad / Exploración
21	Sociabilidad / Amistoso
22	Agresividad (mordida o coletazo)
23	Ruido / Sensibilidad auditiva
24	Dominancia / Seguridad
25	Excitabilidad / Alta Energía
26	Inactividad / Baja energía
27	Agresividad (picoteo)
28	Inseguridad / Inestabilidad emocional
29	Miedoso / Ansioso (defensivo)
30	Impaciencia / Baja tolerancia
\.


--
-- Data for Name: cat_servicios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cat_servicios (id_servicio, nombre_servicio, descripcion, precio_base) FROM stdin;
1	Guardería	\N	200.00
2	Entrenamiento	\N	350.00
3	Veterinaria	\N	500.00
4	Estética	\N	250.00
5	Paseo	\N	100.00
\.


--
-- Data for Name: cat_sintomas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cat_sintomas (id_sintoma, descripcion) FROM stdin;
\.


--
-- Data for Name: cat_subtipos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cat_subtipos (id_subtipo, id_especie, nom_subtipo, nom_cientifico, peso_min, peso_max, size_min, size_max, esp_vida_min, esp_vida_max, id_tamano, id_interaccion, descripcion) FROM stdin;
1	1	Bichon Bolones	\N	2.00	4.00	\N	\N	12	14	11	\N	Perro de compañía, dócil, pelaje rizado blanco; requiere cepillado frecuente.
2	1	Bichon Maltes	\N	3.00	4.00	\N	\N	12	15	11	\N	Muy afectuoso, pelaje largo blanco; ideal como perro de compañía.
3	1	Chihuahua Pelo Corto	\N	1.00	3.00	\N	\N	14	16	8	\N	Vigilante y vivaz
4	1	Chihuahua Pelo Largo	\N	1.00	3.00	\N	\N	14	16	8	\N	Similar al de pelo corto, con manto largo y sedoso.
5	1	Crestado Chino	\N	2.00	6.00	\N	\N	13	15	11	\N	Variedades con y sin pelo; sensible al frío, muy apegado a su familia.
6	1	Pequeño Ruso	\N	1.00	3.00	\N	\N	12	14	8	\N	‘Russian Toy’; ligero y activo, ideal para espacios reducidos.
7	1	Petit Brabancon	\N	3.00	6.00	\N	\N	12	15	11	\N	Variedad de los grifones; expresivo, leal y buen perro de apartamento.
8	1	Pomerania	\N	2.00	3.00	\N	\N	12	16	11	\N	Espitz diminuto, alerta y vocal; pelaje abundante que requiere cepillado.
9	1	Silky Terrier Australiano	\N	3.00	5.00	\N	\N	12	15	11	\N	Terrier elegante de manto sedoso
10	1	Spaniel continental enano	\N	3.00	5.00	\N	\N	13	15	11	\N	Papillon/Falene; sociable e inteligente, fácil de entrenar.
11	1	Spaniel Japones	\N	2.00	5.00	\N	\N	10	14	11	\N	‘Japanese Chin’; tranquilo, cariñoso y algo independiente.
12	1	Terrier ingles miniatura	\N	2.00	4.00	\N	\N	12	14	11	\N	Elegante y ágil
13	1	Yorkshire Terrier	\N	2.00	3.00	\N	\N	12	14	11	\N	Terrier compacto, valiente; pelaje largo que necesita mantenimiento.
14	1	Affenpinscher	\N	3.00	6.00	\N	\N	12	14	11	\N	Carácter vivaz y seguro
15	1	Basset leonado de Bretana	\N	16.00	18.00	\N	\N	12	14	4	\N	Sabueso robusto, gran olfato; necesita caminatas diarias.
16	1	Bedlington terrier	\N	8.00	10.00	\N	\N	12	14	4	\N	Aspecto de ‘cordero’; activo, atlético y buen compañero familiar.
17	1	Bichon Frise	\N	3.00	6.00	\N	\N	12	15	11	\N	Alegre y sociable
18	1	Bichon habanero	\N	4.00	8.00	\N	\N	13	15	11	\N	Juguetón y adaptable
19	1	Border terrier	\N	5.00	7.00	\N	\N	12	15	11	\N	Trabajador y resistente
20	1	Boston Terrier	\N	7.00	11.00	\N	\N	11	13	13	\N	Sociable y amistoso; hocico corto, sensible al calor.
21	1	Braco de Auvernia	\N	22.00	27.00	\N	\N	12	14	6	\N	Braco francés de caza
22	1	Bull terrier	\N	22.00	38.00	\N	\N	10	14	4	\N	Fuerte y leal
23	1	Cairn Terrier	\N	6.00	8.00	\N	\N	12	15	11	\N	Terrier rústico y curioso
24	1	Carlino	\N	6.00	8.00	\N	\N	12	15	11	\N	‘Pug’
25	1	Cavalier King Charles	\N	6.00	9.00	\N	\N	9	15	11	\N	Dulce y apegado
26	1	Coton de Tulear	\N	3.00	6.00	\N	\N	14	16	11	\N	Manto algodonoso
27	1	Dandie Dinmont Terrier	\N	8.00	11.00	\N	\N	12	14	13	\N	Terrier bajo y robusto
28	1	Fox terrier de pelo duro	\N	7.00	9.00	\N	\N	12	15	13	\N	Enérgico y cazador
29	1	Fox Terrier de Pelo Liso	\N	7.00	9.00	\N	\N	12	15	13	\N	Similar al de pelo duro
30	1	Grifon Belga	\N	3.00	6.00	\N	\N	12	15	11	\N	Sensible y leal
31	1	Grifon de Bruselas	\N	3.00	6.00	\N	\N	12	15	11	\N	Carácter divertido y expresivo
32	1	Italian Greyhound	\N	3.00	5.00	\N	\N	12	15	11	\N	Galgo mini; delicado con frío, muy cariñoso y veloz.
33	1	Jack Russell Terrier	\N	6.00	8.00	\N	\N	12	15	11	\N	Altísima energía e inteligencia
34	1	Jagd Terrier	\N	7.00	10.00	\N	\N	12	15	13	\N	Terrier de caza alemán; activo, valiente y enfocado.
35	1	Japanese Spitz	\N	5.00	10.00	\N	\N	10	14	13	\N	Spitz blanco de buen carácter
36	1	King Charles spaniel	\N	3.00	7.00	\N	\N	10	14	11	\N	‘English Toy Spaniel’; afectuoso y calmado, ideal para interior.
37	1	Lakeland Terrier	\N	7.00	8.00	\N	\N	12	15	13	\N	Terrier británico; independiente, necesita ejercicio regular.
38	1	Lhasa Apso	\N	5.00	8.00	\N	\N	12	15	11	\N	Vigilante y reservado con extraños
39	1	Lundehund noruego	\N	6.00	7.00	\N	\N	12	15	11	\N	Raza nórdica muy flexible; dedos extra, ágil y curioso.
40	1	Miniature Pinscher	\N	4.00	6.00	\N	\N	12	16	11	\N	‘Pinscher mini’; alerta, vivaz y seguro de sí.
41	1	Mudi	\N	8.00	13.00	\N	\N	12	14	4	\N	Pastor húngaro versátil
42	1	Parson Russell Terrier	\N	6.00	8.00	\N	\N	12	15	13	\N	Similar al Jack Russell
43	1	Pastor de los Pirineos	\N	8.00	15.00	\N	\N	12	15	4	\N	Pastor ágil y trabajador
44	1	Pastor de los Pirineos de Cara Rasa	\N	8.00	15.00	\N	\N	12	15	4	\N	Variedad de pelo liso; leal, rápido y enérgico.
45	1	Pastor de Shetland	\N	6.00	12.00	\N	\N	12	14	4	\N	Inteligente y sensible
46	1	Pekines	\N	3.00	6.00	\N	\N	12	15	11	\N	Leal y algo independiente; hocico corto, evitar calor excesivo.
47	1	Pequeño perro leon	\N	4.00	8.00	\N	\N	12	14	11	\N	‘Löwchen’; alegre y sociable, manto largo y abundante.
48	1	Perro de Granja Danes y Sueco	\N	7.00	12.00	\N	\N	12	15	13	\N	Perro polivalente de granja
49	1	Podenco portugues	\N	6.00	20.00	\N	\N	12	14	13	\N	Tres tallas; cazador veloz y resistente, muy atento.
50	1	Pumi	\N	8.00	15.00	\N	\N	12	14	4	\N	Pastor húngaro rizado
51	1	Ratonero Holandes	\N	6.00	9.00	\N	\N	12	14	11	\N	Terrier/ratonero activo
52	1	Schipperke	\N	4.00	8.00	\N	\N	13	15	11	\N	Spitz belga sin cola; vigilante, curioso y agil.
53	1	Schnauzer Miniatura	\N	5.00	9.00	\N	\N	12	14	13	\N	Alerta y leal; manto duro, requiere cepillado y stripping.
54	1	Shiba Inu	\N	7.00	11.00	\N	\N	12	13	4	\N	Independiente y limpio
55	1	Shih tzu	\N	4.00	7.00	\N	\N	9	16	11	\N	Cariñoso y familiar; pelaje largo, requiere mantenimiento.
56	1	Skye terrier	\N	16.00	18.00	\N	\N	12	14	4	\N	Terrier alargado y bajo
57	1	Spaniel tibetano	\N	4.00	7.00	\N	\N	12	15	11	\N	Perro de compania atento
58	1	Teckel	\N	4.00	12.00	\N	\N	12	16	11	\N	‘Dachshund’; vivaz, instinto de caza; cuidar espalda.
59	1	Terrier Australiano	\N	5.00	7.00	\N	\N	12	15	11	\N	Valiente y alerta
60	1	Terrier Brasileno	\N	7.00	10.00	\N	\N	12	14	13	\N	‘Terrier Brasileiro’; agil, sociable y jugueton.
61	1	Terrier checo	\N	6.00	10.00	\N	\N	12	15	13	\N	‘Cesky Terrier’; tranquilo, adaptable y cazador.
62	1	Terrier de Manchester	\N	5.00	10.00	\N	\N	12	16	13	\N	Elegante y agil
63	1	Terrier de Norfolk	\N	5.00	6.00	\N	\N	12	15	11	\N	Pequeño terrier amistoso y trabajador.
64	1	Terrier de Norwich	\N	5.00	6.00	\N	\N	12	15	11	\N	Robusto, sociable y curioso.
65	1	Terrier de Sealyham	\N	8.00	10.00	\N	\N	12	14	13	\N	Terrier fuerte y bajo
66	1	Terrier Escocés (Scottish Terrier)	\N	8.00	10.00	\N	\N	12	15	11	\N	‘Scottie’; independiente, valiente; manto duro.
67	1	Terrier Japonés (Nihon Teria)	\N	4.00	5.00	\N	\N	12	14	11	\N	Pequeño terrier de compania, activo y afectuoso.
68	1	Vallhund Sueco	\N	9.00	14.00	\N	\N	12	14	13	\N	Perro vikingo tipo ‘corgi’ nordico
69	1	Volpino Italiano	\N	4.00	6.00	\N	\N	12	15	11	\N	Spitz italiano; vivaz, buen vigilante casero.
70	1	Welsh Terrier	\N	9.00	10.00	\N	\N	12	15	13	\N	Terrier equilibrado
71	1	West Highland White Terrier (Westie)	\N	7.00	10.00	\N	\N	12	15	11	\N	‘Westie’
72	1	Whippet	\N	9.00	18.00	\N	\N	12	15	4	\N	Galgo mediano, muy rapido; tranquilo en casa.
73	1	Shar Pei	\N	18.00	25.00	\N	\N	8	12	4	\N	Piel arrugada
74	1	Airedale Terrier	\N	18.00	29.00	\N	\N	10	13	6	\N	‘Rey de los terriers’
75	1	Alaskan Malamute	\N	34.00	45.00	\N	\N	10	12	2	\N	Tiron de trineo; fuerte, requiere mucho ejercicio.
76	1	American Cocker Spaniel	\N	11.00	13.00	\N	\N	12	15	13	\N	Spaniel de caza estadounidense, más pequeño que el inglés. Cabeza redondeada, orejas largas y pelaje sedoso, abundante y en variedad de colores. Alegre, sociable y cariñoso.
77	1	American Staffordshire Terrier	\N	13.00	32.00	\N	\N	12	14	4	\N	Perro musculoso y compacto, de hocico ancho y fuerte mandíbula. Pelaje corto y brillante en múltiples colores. Valiente, leal y protector.
78	1	Ariegeois	\N	28.00	30.00	\N	\N	12	13	6	\N	Sabueso francés ágil y ligero. Pelaje corto, blanco con manchas negras y a veces marcas fuego. Orejas largas y caídas. Buen rastreador, dócil y sociable.
79	1	Australian Stumpy Tail Cattle Dog	\N	16.00	23.00	\N	\N	12	15	4	\N	Perro pastor australiano de cuerpo robusto. Cola naturalmente corta (stumpy). Pelaje corto y denso, moteado azul o rojo. Muy activo, trabajador y enérgico.
80	1	Barbet	\N	16.00	25.00	\N	\N	12	14	4	\N	Perro de agua francés, de cuerpo compacto y musculoso. Pelaje rizado y lanoso, en negro, marrón, gris o blanco. Excelente nadador y perro de compañía.
81	1	Basenji	\N	9.00	11.00	\N	\N	12	14	13	\N	Perro africano conocido como “el perro que no ladra”. Cuerpo ágil y elegante, orejas erguidas y cola enroscada. Pelaje corto y fino en varios colores. Independiente, inteligente y curioso.
82	1	Basset Artesiano de Normandía	\N	15.00	20.00	\N	\N	12	14	4	\N	Basset francés de cuerpo alargado y patas cortas. Pelaje corto y denso, tricolor (blanco, negro y fuego) o bicolor (limón y blanco). Alegre, resistente y buen cazador.
83	1	Basset Azul de Gascuña	\N	16.00	18.00	\N	\N	11	13	4	\N	Perro francés de orejas largas y cuerpo alargado. Pelaje corto, moteado azul con manchas negras y marcas fuego. Buen rastreador, sociable y amistoso.
84	1	Beagle	\N	9.00	15.00	\N	\N	12	15	4	\N	Sabueso británico compacto y musculoso. Pelaje corto y denso, tricolor (negro, blanco y fuego) o bicolor. Alegre, sociable y con gran olfato.
85	1	Beagle-Harrier	\N	19.00	21.00	\N	\N	12	14	4	\N	Raza francesa, mezcla entre Beagle y Harrier. Cuerpo robusto y atlético. Pelaje corto, tricolor típico de los sabuesos. Buen cazador, activo y equilibrado.
86	1	Bearded Collie	\N	18.00	27.00	\N	\N	12	14	6	\N	Perro pastor escocés, ágil y trabajador. Pelaje largo, abundante y desgreñado, en gris, negro, azul o marrón con blanco. Alegre, vivaz y muy sociable.
87	1	Belgian Shepherd Dog (Pastor Belga, todas variedades)	\N	20.00	30.00	\N	\N	12	14	6	\N	Perro pastor belga, con cuatro variedades (Malinois, Groenendael, Tervueren y Laekenois). Cuerpo atlético y elegante, pelaje variable según variedad. Muy inteligente, obediente y protector.
88	1	Boyero de Appenzell	\N	22.00	32.00	\N	\N	12	14	4	\N	Boyero suizo de tamaño intermedio. Pelaje corto, denso y tricolor (negro, blanco y fuego). Cuerpo compacto y ágil. Enérgico, trabajador y vigilante.
89	1	Boyero de Entlebuch	\N	20.00	30.00	\N	\N	11	13	4	\N	El más pequeño de los boyeros suizos. Cuerpo alargado, pelaje corto y tricolor. Activo, inteligente y excelente perro de trabajo.
90	1	Boyero de las Ardenas	\N	28.00	35.00	\N	\N	11	13	6	\N	Perro pastor belga rústico y poco común. Pelaje áspero y denso, generalmente en tonos grises o leonados. Fuerte, enérgico y protector.
91	1	Braco de Ariège	\N	25.00	30.00	\N	\N	12	14	6	\N	Perro de muestra francés, robusto y elegante. Pelaje corto y fino, blanco moteado con manchas naranjas o castañas. Cabeza alargada y orejas largas. Noble, enérgico y obediente.
92	1	Braco de Saint Germain	\N	18.00	27.00	\N	\N	12	14	6	\N	Braco francés, de cuerpo armonioso y fuerte. Pelaje corto y fino, blanco con manchas naranjas. Reconocido por su elegancia. Sereno, equilibrado y buen cazador.
93	1	Braco del Borbonesado	\N	20.00	30.00	\N	\N	12	14	6	\N	Antigua raza francesa de muestra. Cuerpo atlético y musculoso. Pelaje corto, blanco con manchas castañas o naranjas. Muy resistente y trabajador.
94	1	Braco Francés Tipo Pirineos	\N	18.00	25.00	\N	\N	12	14	4	\N	Variedad ligera y ágil del braco francés. Pelaje corto, blanco con manchas marrones. De constitución más pequeña que otros bracos. Muy activo y obediente.
95	1	Braco Húngaro de Pelo Corto (Vizsla)	\N	20.00	30.00	\N	\N	12	14	4	\N	Perro de caza húngaro elegante y atlético. Pelaje corto y rojizo dorado. Ojos y nariz en tonos avellana. Leal, cariñoso y enérgico.
96	1	Briquet Griffon Vendeano	\N	20.00	25.00	\N	\N	12	14	4	\N	Sabueso francés de caza. Cuerpo fuerte y ágil, pelaje duro y desordenado, en colores blanco con negro, naranja o leonado. Resistente, alegre y valiente.
97	1	Buhund Noruego	\N	14.00	18.00	\N	\N	12	15	4	\N	Perro pastor nórdico, de cuerpo compacto y ágil. Pelaje doble y espeso, de color trigo o negro. Orejas erguidas y cola enroscada. Muy trabajador, fiel y enérgico.
98	1	Bulldog Francés	\N	8.00	14.00	\N	\N	10	12	11	\N	Perro compacto y musculoso, con orejas grandes en forma de murciélago. Pelaje corto, liso y brillante en varios colores (atigrado, blanco, crema). Sociable y juguetón.
99	1	Bulldog Inglés	\N	18.00	23.00	\N	\N	8	10	4	\N	Perro británico, bajo y robusto. Cabeza grande con arrugas, hocico chato. Pelaje corto en varios colores (blanco, leonado, atigrado). Cariñoso y tranquilo.
100	1	Caniche (Poodle)	\N	4.00	30.00	\N	\N	12	15	14	\N	Perro elegante y atlético, de pelo rizado y denso, en varios colores (blanco, negro, gris, marrón, albaricoque). Inteligente, sociable y muy activo.
101	1	Cazador de Alces Noruego (Elkhound Noruego)	\N	20.00	30.00	\N	\N	12	14	4	\N	Perro de caza nórdico, robusto y musculoso. Pelaje espeso y doble, gris con tonos negros. Orejas erectas y cola enroscada. Valiente, leal y enérgico.
102	1	Chow Chow	\N	20.00	30.00	\N	\N	9	12	4	\N	Perro robusto y compacto, famoso por su lengua azulada. Pelaje abundante y esponjoso, en colores rojo, crema, negro o azul. Digno, independiente y protector.
103	1	Cirneco del Etna	\N	8.00	12.00	\N	\N	12	14	4	\N	Galgo siciliano de caza, esbelto y ágil. Pelaje corto y fino, color arena o rojo. Orejas grandes y puntiagudas. Muy rápido, resistente y afectuoso.
104	1	Cocker ingles	\N	12.00	15.00	\N	\N	12	15	4	\N	Perro compacto, orejas largas y peludas, pelaje sedoso, cola generalmente recortada
105	1	Collie de Pelo Corto	\N	22.00	34.00	\N	\N	8	12	6	\N	Cuerpo atlético, cabeza refinada, pelaje relativamente corto en comparación con el collie de pelo largo
106	1	Collie de pelo largo	\N	22.00	34.00	\N	\N	8	12	6	\N	Pelaje largo y abundante, cola peluda, melena abundante en el cuello, estructura elegante
107	1	Dachsbracke de los Alpes	\N	15.00	18.00	\N	\N	12	14	2	\N	Cuerpo alargado, patas cortas, pelo denso corto, orejas colgantes, aspecto robusto para trabajo de caza
108	1	Drever	\N	14.00	16.00	\N	\N	12	14	2	\N	Cuerpo largo, patas cortas, pelaje corto, orejas colgantes, cola larga, puede tener varios colores con marcas blancas 
109	1	Doberman	\N	27.00	47.00	\N	\N	10	12	2	\N	Apariencia elegante y potente, cuerpo atlético, orejas a menudo recortadas (aunque en muchos países prohibido), pelaje corto y brillante, cabeza alargada
110	1	Eurasier	\N	18.00	32.00	\N	\N	12	14	6	\N	Es un perro compacto, bien equilibrado, pelo abundante, orejas erguidas moderadas, cola poblada que se curvan sobre la espalda. Su aspecto combina rasgos de Spitz y perros tipo “nórdico”.
111	1	Field spaniel	\N	16.00	25.00	\N	\N	10	14	2	\N	Cuerpo de proporciones moderadas, orejas largas colgantes, pelaje sedoso algo ondulado, cabeza noble y expresiva, pelaje generalmente en colores sólidos o con marcas ligeras.
112	1	Foxhound Americano	\N	29.00	36.00	\N	\N	10	13	2	\N	Es un sabueso atlético: cuerpo fuerte pero elegante, musculado, patas largas, orejas largas colgantes, pelaje corto y denso, colores variados (tricolor, bicolor, moteado).
113	1	Gascon Saintongeois	\N	28.00	36.00	\N	\N	10	12	2	\N	Sabueso elegante, orejas largas y delgadas, cuerpo esbelto pero resistente, pelaje corto con colores blancos con manchas grises, negras o fuego, aspecto armonioso.
115	1	Grifon azul de Gascuna	\N	23.00	28.00	\N	\N	10	12	4	\N	Sabueso de aspecto clásico, pelaje áspero (grifón) que puede dar un tono “azulado” por mezcla de pelos claros y oscuros, orejas colgantes, constitución atlética.
116	1	Grifon de muestra de pelo duro	\N	25.00	30.00	\N	\N	10	13	4	\N	Perro de muestra usado en caza, pelaje duro, aspecto rústico, orejas colgantes generalmente, musculatura marcada, buena resistencia al clima.
117	1	Grifon de muestra eslovaco de pelo duro	\N	23.00	28.00	\N	\N	12	14	4	\N	Raza de muestra eslovaca, pelo áspero, cuerpo bien proporcionado, orejas colgantes moderadas, buen físico de caza en terreno variado.
118	1	Grifon leonado de Bretana	\N	20.00	30.00	\N	\N	12	14	4	\N	Pelaje leonado (fauve), áspero, cuerpo bien equilibrado para caza, orejas colgantes, expresión vivaz, compacto y resistente.
119	1	Grifon nivernais	\N	22.00	28.00	\N	\N	10	12	6	\N	Tipo de sabueso francés, pelaje áspero, constitución robusta, orejas largas colgantes, alto olfato, usado en caza mayor tradicional.
120	1	Harrier	\N	20.00	30.00	\N	\N	12	15	4	\N	Sabueso de tamaño medio, cuerpo atlético, patas largas, orejas caídas, pelaje corto tricolor (blanco, negro y fuego). Se parece a un Beagle más grande.
121	1	Hokkaido	\N	15.00	30.00	\N	\N	12	15	4	\N	Perro japonés robusto, de constitución fuerte, pelaje doble y espeso, orejas triangulares erguidas, cola enroscada. Resistente al clima frío.
122	1	Jindo Coreano	\N	14.00	28.00	\N	\N	12	15	4	\N	De tamaño medio, cuerpo musculoso y proporcionado, orejas erguidas, cola enroscada sobre la espalda, pelaje denso (colores blanco, crema, rojo o atigrado). Aspecto similar a un Spitz.
123	1	Kai	\N	11.00	18.00	\N	\N	12	15	4	\N	Perro japonés raro y antiguo, mediano, pelaje corto o semilargo con patrón atigrado característico (brindle), orejas erguidas, cola curvada. Atlético y ágil.
124	1	Kelpie Australiano	\N	11.00	20.00	\N	\N	10	13	4	\N	Pastor mediano, muy musculoso y ligero, pelaje corto y duro en colores negro, rojo o marrón, orejas erguidas, mirada vivaz. Destaca por su energía.
125	1	Kerry Blue Terrier	\N	15.00	17.00	\N	\N	13	15	4	\N	Perro compacto y musculoso, pelaje ondulado de textura suave y sedosa, color azul-grisáceo característico, orejas en forma de “V” caídas hacia delante.
126	1	Kishu	\N	14.00	27.00	\N	\N	12	15	4	\N	Raza japonesa, cuerpo fuerte y equilibrado, pelaje corto y denso, orejas triangulares erguidas, cola enroscada sobre la espalda. Colores comunes: blanco, rojo, sésamo.
127	1	Kooikerhondje	\N	9.00	18.00	\N	\N	12	15	13	\N	Spaniel holandés de proporciones casi cuadradas, pelaje semilargo blanco con manchas anaranjadas, orejas con “pendientes” negros en la punta, expresión vivaz.
128	1	Kromfohrlander	\N	9.00	16.00	\N	\N	13	15	4	\N	Perro de tamaño medio, existen variedades de pelo liso y pelo áspero (este con barba característica), color blanco con manchas marrones, orejas semicaídas.
129	1	Lagotto romagnolo	\N	11.00	18.00	\N	\N	15	17	4	\N	Raza italiana robusta, pelaje rizado y lanoso (parecido al de un caniche), hocico con barba, orejas medianas caídas, colores variados: blanco, marrón, crema o combinados.
130	1	Laika del este siberiano	\N	18.00	30.00	\N	\N	12	15	6	\N	Perro de tipo Spitz de Rusia, robusto, pelaje doble muy denso, orejas triangulares erguidas, cola enroscada. Colores variados: negro, gris, blanco, rojo. Criado para caza mayor y trabajo en clima extremo.
131	1	Laika del Oeste Siberiano	\N	16.00	25.00	\N	\N	12	14	4	\N	Similar a otros laikas, de constitución fuerte, pelaje espeso y resistente al frío, orejas erguidas, cola enroscada sobre la espalda. Muy usado como perro de caza en Siberia.
132	1	Laika ruso-europeo	\N	20.00	23.00	\N	\N	12	14	4	\N	Perro tipo Spitz de tamaño medio, pelaje abundante bicolor (blanco y negro), orejas erguidas, cola enroscada. Físicamente similar al husky pero más compacto.
133	1	Nova Scotia Duck Tolling Retriever	\N	17.00	23.00	\N	\N	12	14	4	\N	Retriever más pequeño de la familia, cuerpo compacto y musculoso, pelaje doble de longitud media, rojo o naranja con marcas blancas, orejas caídas medianas, expresión vivaz.
134	1	Pastor australiano	\N	18.00	29.00	\N	\N	12	15	4	\N	Raza muy activa, cuerpo ágil y musculoso, pelaje medio-largo y denso, colores: merlé azul, rojo, negro o tricolor, orejas triangulares caídas. Cola puede ser corta natural.
135	1	Pastor Bergamasco	\N	26.00	38.00	\N	\N	12	15	2	\N	Perro italiano de pastoreo, muy robusto, con pelaje largo que forma mechones o cordones (similar a rastas), capa protectora contra el clima, orejas colgantes, expresión noble.
136	1	Pastor catalan	\N	17.00	25.00	\N	\N	12	14	4	\N	Perro de pastoreo español, cuerpo fuerte y ágil, pelaje largo y abundante, liso u ondulado, colores variados (arena, gris, negro), orejas caídas.
137	1	Pastor Croata	\N	13.00	20.00	\N	\N	12	14	4	\N	Raza de Croacia, cuerpo ligero y ágil, pelaje rizado o ondulado de color negro, orejas medianas caídas, mirada vivaz. Excelente perro de trabajo.
138	1	Pastor de Karst	\N	30.00	42.00	\N	\N	11	13	2	\N	Raza eslovena, de constitución poderosa, pelaje largo y denso de color gris, expresión seria, orejas caídas, cola tupida. Utilizado como perro guardián y de pastoreo.
139	1	Pastor de Picardia	\N	23.00	32.00	\N	\N	12	14	6	\N	Raza francesa, aspecto rústico, pelaje duro y desgreñado, orejas grandes erguidas, cuerpo atlético, expresión alerta y simpática.
140	1	Pastor Islandes	\N	9.00	15.00	\N	\N	12	14	13	\N	Perro de pastoreo originario de Islandia, tipo Spitz, cuerpo compacto, pelaje doble abundante (corto o largo), orejas erguidas, cola enroscada. Colores variados con marcas blancas.
141	1	Pastor Lapon	\N	15.00	24.00	\N	\N	12	15	4	\N	Raza nórdica de Finlandia, cuerpo fuerte pero ágil, pelaje largo y denso, orejas erguidas o semi-erguidas, cola peluda curvada. Colores variados.
142	1	Pastor polaco de las llanuras	\N	14.00	23.00	\N	\N	12	14	4	\N	Perro de pastoreo robusto, cuerpo cuadrado, pelaje largo y denso que cubre los ojos, expresión vivaz, orejas medianas colgantes.
143	1	Pastor Portugues	\N	17.00	27.00	\N	\N	12	14	4	\N	Perro de pastoreo de Portugal, cuerpo fuerte y rústico, pelaje largo, áspero y desgreñado, orejas triangulares caídas, expresión alerta.
144	1	Pequeño Basset Grifon Vendeano	\N	15.00	20.00	\N	\N	12	14	13	\N	Perro francés de caza, cuerpo alargado, patas cortas, pelaje áspero y desordenado, orejas largas colgantes, expresión alegre.
145	1	Pequeño munsterlander	\N	15.00	25.00	\N	\N	12	14	4	\N	Perro de caza versátil, cuerpo atlético y ágil, pelaje semilargo, liso o ligeramente ondulado, de color marrón y blanco moteado o con parches, orejas caídas.
146	1	Pequeño Sabueso Azul de Gascuna	\N	18.00	20.00	\N	\N	12	14	4	\N	Sabueso francés, elegante, de cuerpo alargado, pelaje corto azulado (mezcla de pelos blancos y negros), orejas largas y finas colgantes.
147	1	Pequeño Sabueso Suizo	\N	8.00	15.00	\N	\N	12	14	13	\N	Sabueso compacto, cuerpo alargado, patas relativamente cortas, pelaje corto y fino, puede presentarse en variantes de color (blanco-naranja, tricolor, negro-fuego).
148	1	Perdiguero aleman	\N	18.00	25.00	\N	\N	12	14	4	\N	Perro de caza alemán, cuerpo musculoso, pelaje largo, ondulado y espeso, generalmente marrón sólido o marrón con marcas blancas. Orejas largas colgantes.
149	1	Perdiguero frison	\N	18.00	25.00	\N	\N	13	14	4	\N	Raza rara de los Países Bajos, cuerpo fuerte y proporcionado, pelaje semilargo liso (blanco con manchas negras o marrones), orejas caídas con flecos.
150	1	Perdiguero portugues	\N	16.00	27.00	\N	\N	12	14	4	\N	Perro de muestra portugués, cuerpo proporcionado y musculoso, pelaje corto y denso de color leonado o amarillento, orejas largas y caídas, expresión noble.
151	1	Perro de agua americano	\N	11.00	20.00	\N	\N	12	15	4	\N	Spaniel de caza, pelaje rizado u ondulado, marrón sólido (chocolate, hígado), orejas largas con pelo rizado, cuerpo atlético y compacto.
152	1	Perro de agua espanol	\N	14.00	22.00	\N	\N	10	14	4	\N	Raza española de trabajo, pelaje rizado y lanoso (similar a un caniche), colores variados (blanco, marrón, negro o bicolor), orejas medianas colgantes, cuerpo robusto.
153	1	Perro de agua irlandes	\N	20.00	30.00	\N	\N	10	12	6	\N	Spaniel de pelaje rizado y denso de color hígado oscuro, cuerpo fuerte, cola característica en forma de “rata” (casi sin pelo), orejas largas y cubiertas de rizos.
154	1	Perro de Agua Portugues	\N	16.00	27.00	\N	\N	11	13	4	\N	Perro robusto, pelaje rizado u ondulado, colores negro, blanco o marrón, orejas caídas, muy utilizado históricamente en barcos de pesca.
155	1	Perro de Canaan	\N	18.00	25.00	\N	\N	112	15	4	\N	Raza israelí de constitución robusta, pelaje doble corto y áspero, orejas triangulares erguidas, cola enroscada sobre la espalda, expresión alerta. Colores variados: blanco, crema, negro, bicolor.
156	1	Perro de Caza Polaco	\N	20.00	26.00	\N	\N	12	14	4	\N	Perro de caza polaco, cuerpo musculoso y ágil, pelaje corto y denso de color negro y fuego, orejas medianas colgantes, aspecto elegante y fuerte.
157	1	Perro de Osos de Carelia	\N	20.00	28.00	\N	\N	10	13	4	\N	Raza finlandesa de caza mayor, cuerpo fuerte y compacto, pelaje negro con marcas blancas, orejas triangulares erguidas, cola curvada. Valiente y enérgico.
158	1	Perro de Taiwan	\N	12.00	18.00	\N	\N	12	15	4	\N	Perro nativo de Taiwán, cuerpo ligero y atlético, pelaje corto y fino, orejas erguidas, cola curvada. Colores comunes: negro, atigrado, marrón.
159	1	Perro Finlandes de Laponia	\N	15.00	24.00	\N	\N	12	14	4	\N	Raza nórdica de pastoreo, cuerpo robusto, pelaje largo y denso resistente al frío, orejas triangulares erguidas o semicaídas, cola tupida y curvada sobre la espalda.
160	1	Perro sin Pelo Mexicano (Xoloitzcuintle)	\N	4.00	25.00	\N	\N	12	14	14	\N	Raza prehispánica mexicana, cuerpo esbelto y elegante, sin pelo (aunque existe variedad con pelo corto), piel oscura o en tonos grises/rojizos, orejas grandes y erguidas.
161	1	Perro Sueco de Laponia (Swedish Lapphund)	\N	19.00	21.00	\N	\N	12	14	4	\N	Raza nórdica de pastoreo, cuerpo compacto, pelaje largo y abundante, orejas erguidas, cola peluda curvada. Suele ser negro con marcas blancas.
162	1	Perro Tailandés con Cresta (Thai Ridgeback)	\N	16.00	34.00	\N	\N	12	13	6	\N	Raza tailandesa atlética, pelaje corto con una cresta de pelo que crece en dirección opuesta a lo largo de la espalda, orejas erguidas, cola recta, colores sólidos (azul, negro, rojo, crema).
163	1	Pinscher Alemán (Deutscher Pinscher)	\N	14.00	20.00	\N	\N	12	14	4	\N	Perro elegante y musculoso, pelaje corto y brillante, orejas erguidas o semicaídas, colores negro y fuego o marrón rojizo. Similar al Doberman pero más pequeño.
164	1	Pinscher Austriaco (Austrian Pinscher)	\N	12.00	18.00	\N	\N	12	14	4	\N	Cuerpo robusto y compacto, pelaje corto y denso, color amarillo-trigo o rojo con marcas blancas, orejas semierguidas o en forma de botón, expresión vivaz.
165	1	Podenco Ibicenco (Ibizan Hound)	\N	20.00	29.00	\N	\N	12	14	6	\N	Perro de caza esbelto y atlético, patas largas, orejas muy grandes y erguidas, pelaje corto o duro (según variedad), colores blanco, rojo o combinados. Muy ágil y veloz.
166	1	Porcelaine	\N	25.00	28.00	\N	\N	12	13	4	\N	Sabueso francés elegante, cuerpo fino y musculoso, pelaje corto, blanco con motas anaranjadas, orejas largas y delgadas caídas. Aspecto refinado.
197	1	Setter Inglés	\N	20.00	36.00	\N	\N	11	15	6	\N	Perro elegante de caza, cuerpo atlético, pelaje largo, sedoso y con flecos, de color blanco con manchas o moteado (belton). Orejas largas colgantes.
167	1	Puli	\N	10.00	15.00	\N	\N	12	16	4	\N	Pastor húngaro de aspecto inconfundible: pelaje largo en forma de cordones o rastas, cuerpo compacto, orejas colgantes, expresión vivaz. Suele ser negro, aunque hay variantes blancas y grises.
168	1	Sabueso Austriaco Negro y Fuego (Brandlbracke)	\N	15.00	22.00	\N	\N	12	14	4	\N	Sabueso de caza, cuerpo fuerte, pelaje corto negro con marcas color fuego, orejas largas caídas, expresión alerta. Muy resistente.
169	1	Sabueso Bosnio de Pelo Duro (Barak)	\N	16.00	24.00	\N	\N	12	14	4	\N	Cuerpo robusto, pelaje áspero y duro (tipo alambre), de colores marrón, gris o trigo con combinaciones, orejas medianas caídas, expresión rústica.
170	1	Sabueso de Halden (Haldenstøver)	\N	18.00	25.00	\N	\N	12	14	4	\N	Raza noruega de caza, cuerpo robusto y alargado, pelaje corto tricolor (negro, blanco y fuego), orejas largas caídas, expresión noble. Similar al sabueso americano.
171	1	Sabueso de Hannover (Hannoverscher Schweisshund)	\N	30.00	40.00	\N	\N	10	14	2	\N	Sabueso alemán especializado en rastreo de sangre, cuerpo fuerte y musculoso, pelaje corto y denso de color rojo cervato, orejas largas y pesadas.
172	1	Sabueso de Hygen (Hygenhund)	\N	20.00	25.00	\N	\N	10	13	4	\N	Perro de caza noruego, cuerpo compacto, pelaje corto en tonos rojo, marrón o tricolor, orejas largas colgantes, muy resistente y trabajador.
173	1	Sabueso de Istria de Pelo Corto	\N	14.00	20.00	\N	\N	12	14	4	\N	Sabueso croata, cuerpo elegante y ágil, pelaje corto y blanco con marcas naranjas, orejas largas caídas, expresión refinada.
174	1	Sabueso de Istria de Pelo Duro	\N	16.00	24.00	\N	\N	12	14	4	\N	Variante croata de pelo áspero, cuerpo fuerte, pelaje duro blanco con marcas anaranjadas, orejas largas colgantes, aspecto rústico y resistente.
175	1	Sabueso de Montaña de Montenegro (Crnogorski Planinski Goni?)	\N	20.00	25.00	\N	\N	12	14	4	\N	Sabueso balcánico, cuerpo robusto y ágil, pelaje corto negro con marcas fuego, orejas largas colgantes, expresión seria. Criado para caza en terrenos montañosos.
176	1	Sabueso de Posavatz (Posavac Hound)	\N	16.00	20.00	\N	\N	12	14	4	\N	Raza croata, cuerpo alargado y fuerte, pelaje corto y denso color rojo-trigo con marcas blancas, orejas largas caídas. Muy apreciado en caza menor.
177	1	Sabueso de Sangre de Baviera (Bayerischer Gebirgsschweißhund)	\N	20.00	30.00	\N	\N	10	14	4	\N	Sabueso alemán especializado en rastreo de piezas heridas, cuerpo musculoso, pelaje corto rojizo, orejas largas pesadas, expresión noble.
178	1	Sabueso de Schiller (Schillerstövare)	\N	18.00	25.00	\N	\N	12	14	4	\N	Sabueso sueco, cuerpo estilizado, pelaje corto tricolor (negro con fuego y pecho blanco), orejas caídas, expresión alerta y elegante.
179	1	Sabueso de Småland (Smålandsstövare)	\N	15.00	18.00	\N	\N	12	14	4	\N	Raza sueca de caza, cuerpo compacto, pelaje corto negro con marcas fuego, orejas caídas. Es el más pequeño de los sabuesos suecos.
180	1	Sabueso de Westfalia (Westfälische Dachsbracke)	\N	14.00	16.00	\N	\N	12	14	13	\N	Raza alemana tipo sabueso con cuerpo alargado y patas cortas, pelaje corto tricolor (blanco, negro y fuego), orejas largas caídas, expresión vivaz.
181	1	Sabueso del Tirol (Tiroler Bracke)	\N	15.00	27.00	\N	\N	12	141	4	\N	Perro austríaco de caza, cuerpo fuerte y ágil, pelaje corto y denso, colores negro-fuego o rojo cervato, orejas largas caídas, muy resistente en montaña.
182	1	Sabueso Eslovaco (Slovenský Kopov)	\N	16.00	20.00	\N	\N	12	13	4	\N	Raza nacional de Eslovaquia, sabueso de caza de color negro con marcas fuego, cuerpo ágil y musculoso, orejas medianas caídas. Valiente y buen rastreador.
183	1	Sabueso Español (Sabueso Español)	\N	20.00	25.00	\N	\N	10	12	4	\N	Raza ibérica de caza mayor, cuerpo robusto y fuerte, pelaje corto blanco con manchas marrones o naranjas, orejas largas y colgantes. Excelente olfato.
184	1	Sabueso Estirio de Pelo Duro (Steirische Rauhhaarbracke)	\N	15.00	18.00	\N	\N	10	14	4	\N	Sabueso austríaco, cuerpo robusto, pelaje áspero y duro de color rojo o cervato, orejas medianas caídas. Especializado en caza en terrenos difíciles.
185	1	Sabueso Finlandés (Suomenajokoira)	\N	20.00	25.00	\N	\N	12	14	4	\N	Raza nacional de Finlandia, sabueso de cuerpo fuerte y elegante, pelaje corto tricolor (negro, fuego y blanco), orejas largas caídas. Gran resistencia al frío.
186	1	Sabueso Griego (Hellinikós Ichnilátis)	\N	17.00	20.00	\N	\N	11	13	4	\N	Perro de caza griego, cuerpo delgado y ágil, pelaje corto negro con marcas fuego, orejas largas caídas. Muy resistente en terrenos montañosos.
187	1	Sabueso Italiano de Pelo Corto (Segugio Italiano a Pelo Raso)	\N	18.00	28.00	\N	\N	11	13	4	\N	Sabueso italiano, cuerpo alargado y esbelto, pelaje corto y fino de color cervato o negro-fuego, orejas largas y finas, expresión elegante.
188	1	Sabueso Italiano de Pelo Duro (Segugio Italiano a Pelo Forte)	\N	20.00	28.00	\N	\N	11	13	4	\N	Variante italiana con pelaje áspero y duro, cuerpo atlético, colores similares al de pelo corto (cervato o negro-fuego), orejas largas caídas.
189	1	Sabueso Noruego (Norwegian Hound / Dunker)	\N	15.00	23.00	\N	\N	12	13	4	\N	Sabueso de Noruega, cuerpo robusto y atlético, pelaje corto moteado azul-grisáceo con negro y fuego, orejas largas caídas. Muy usado en caza menor.
190	1	Sabueso Serbio (Srpski Goni?)	\N	20.00	25.00	\N	\N	12	14	4	\N	Sabueso de los Balcanes, cuerpo alargado y fuerte, pelaje corto rojo con silla de color negro, orejas largas colgantes, expresión vivaz.
191	1	Sabueso Suizo (Schweizer Laufhund)	\N	18.00	25.00	\N	\N	12	14	4	\N	Raza suiza de caza, de cuerpo elegante y ágil, pelaje corto, existen variedades de color (tricolor, blanco-naranja, negro-fuego), orejas muy largas y finas.
192	1	Sabueso Tricolor Serbio (Srpski Trobojni Goni?)	\N	20.00	25.00	\N	\N	12	14	4	\N	Variante serbia de pelaje tricolor (negro, fuego y blanco), cuerpo compacto y musculoso, orejas medianas caídas. Raza resistente de caza.
193	1	Saluki	\N	18.00	27.00	\N	\N	12	14	6	\N	Galgo oriental de aspecto elegante y refinado, cuerpo delgado y alto, pelaje corto con flecos en orejas y cola, colores variados (arena, crema, blanco, negro). Muy veloz.
194	1	Samoyedo (Samoyed)	\N	16.00	30.00	\N	\N	12	14	6	\N	Raza nórdica de trabajo, pelaje largo, espeso y blanco puro, expresión característica de “sonrisa”, cuerpo fuerte y elegante, orejas triangulares erguidas, cola curvada sobre la espalda.
195	1	Schapendoes Neerlandés	\N	12.00	25.00	\N	\N	12	14	4	\N	Pastor holandés de cuerpo ágil, cubierto por un pelaje largo, abundante y ondulado, que le da un aspecto desaliñado. Orejas medianas caídas y cola peluda en movimiento constante.
196	1	Schnauzer (mediano)	\N	14.00	20.00	\N	\N	13	16	4	\N	Perro robusto y compacto, pelaje duro y áspero, barba y cejas características, colores negro o sal y pimienta. Orejas erectas o semicaídas según el corte.
47	2	Ocicat	\N	3.00	6.00	\N	\N	12	18	4	\N	Pelaje corto moteado como de ocelote, cuerpo atlético y musculoso.
198	1	Setter Irlandés	\N	25.00	34.00	\N	\N	12	15	2	\N	Perro de caza muy activo, cuerpo estilizado, pelaje largo y liso de color rojo caoba brillante, orejas largas colgantes, expresión noble y vivaz.
199	1	Setter Irlandés Rojo y Blanco	\N	25.00	34.00	\N	\N	11	15	2	\N	Similar al Setter Irlandés, pero con pelaje blanco con manchas rojas, largo y sedoso, cuerpo atlético, orejas caídas, expresión alerta.
200	1	Shikoku (Shikoku Inu)	\N	16.00	25.00	\N	\N	12	15	4	\N	Raza japonesa de tipo Spitz, cuerpo atlético y bien proporcionado, pelaje doble y denso (colores sésamo, negro-sésamo o rojo-sésamo), orejas triangulares erguidas, cola enroscada sobre la espalda. Aspecto similar al Akita pero más pequeño.
201	1	Siberian Husky	\N	16.00	27.00	\N	\N	12	14	4	\N	Perro nórdico de trabajo, pelaje doble espeso, colores variados (gris, negro, rojo con blanco), ojos azules o heterocromía, orejas erguidas, cola curvada. Muy enérgico.
202	1	Sloughi (Lebrel Árabe)	\N	20.00	27.00	\N	\N	12	14	6	\N	Galgo del norte de África, cuerpo esbelto y atlético, pelaje corto y fino, colores arena, leonado o atigrado, orejas caídas, expresión noble.
203	1	Spaniel Azul de Picardía	\N	20.00	23.00	\N	\N	12	14	4	\N	Perro francés de caza, cuerpo robusto, pelaje largo y ondulado de color gris azulado con manchas negras, orejas largas y peludas, expresión dulce.
204	1	Spaniel Bretón (Epagneul Breton)	\N	13.00	18.00	\N	\N	12	14	4	\N	Spaniel francés, compacto y ágil, pelaje medio, blanco con manchas naranjas o marrones, orejas medianas caídas, mirada vivaz. Muy versátil en caza.
205	1	Spaniel de Pont-Audemer	\N	18.00	27.00	\N	\N	12	14	4	\N	Spaniel francés raro, cuerpo fuerte, pelaje rizado y lanoso en color marrón o hígado, orejas largas cubiertas de rizos, aspecto rústico.
206	1	Spaniel Francés (Epagneul Français)	\N	23.00	27.00	\N	\N	12	14	6	\N	Perro de caza francés, cuerpo fuerte y elegante, pelaje largo y ondulado en marrón y blanco, orejas largas cubiertas de pelo. Muy versátil como perro de muestra.
207	1	Spitz Alemán (Deutscher Spitz)	\N	8.00	20.00	\N	\N	12	15	13	\N	Perro tipo Spitz, pelaje largo y abundante, orejas pequeñas y erguidas, cola curvada sobre la espalda. Colores variados: blanco, negro, naranja, crema.
208	1	Spitz de Norrbotten (Norrbottenspets)	\N	11.00	15.00	\N	\N	12	15	13	\N	Perro nórdico de caza sueco, cuerpo compacto, pelaje corto y denso blanco con manchas, orejas triangulares erguidas, cola curvada. Muy alerta y ágil.
209	1	Spitz Finlandés (Suomenpystykorva)	\N	12.00	15.00	\N	\N	12	15	4	\N	Raza nacional de Finlandia, cuerpo ligero y elegante, pelaje espeso color rojizo, orejas triangulares erguidas, cola curvada sobre la espalda. Usado como perro de caza.
210	1	Springer Spaniel Galés (Welsh Springer Spaniel)	\N	16.00	25.00	\N	\N	12	15	4	\N	Spaniel de caza británico, cuerpo compacto, pelaje sedoso de longitud media, color blanco con manchas rojas, orejas largas peludas. Energético y obediente.
211	1	Springer Spaniel Inglés (English Springer Spaniel)	\N	18.00	25.00	\N	\N	12	14	4	\N	Perro de caza versátil, cuerpo atlético, pelaje medio y ondulado, blanco con manchas negras o marrones, orejas largas caídas con flecos. Muy activo y obediente.
212	1	Staffordshire Bull Terrier	\N	11.00	17.00	\N	\N	12	14	4	\N	Perro compacto y musculoso, cabeza ancha, hocico corto, orejas pequeñas semierguidas, pelaje corto y liso en varios colores (negro, atigrado, blanco, rojo). Conocido por su fuerza y cariño hacia las personas.
213	1	Sussex Spaniel	\N	16.00	23.00	\N	\N	12	14	4	\N	Spaniel británico de cuerpo bajo y alargado, pelaje abundante, ondulado y de color hígado dorado, orejas largas caídas. De carácter tranquilo y leal.
214	1	Terrier Glen de Imaal Irlandés	\N	14.00	16.00	\N	\N	12	15	13	\N	Terrier irlandés robusto, cuerpo alargado con patas cortas, pelaje duro y áspero en colores trigo, azul o atigrado, orejas semierguidas. Valiente y buen cazador.
215	1	Terrier Irlandés (Irish Terrier)	\N	11.00	12.00	\N	\N	12	15	4	\N	Perro elegante y ágil, pelaje duro y rojizo, hocico alargado con barba, orejas pequeñas en forma de “V”. De temperamento vivaz y valiente.
216	1	Terrier Irlandés de Pelo Suave (Soft Coated Wheaten Terrier)	\N	16.00	20.00	\N	\N	12	14	4	\N	Terrier irlandés de constitución fuerte, pelaje suave, largo y sedoso de color trigo, orejas pequeñas caídas hacia adelante. Expresión simpática y vivaz.
217	1	Terrier Tibetano	\N	8.00	14.00	\N	\N	12	15	13	\N	Perro originario del Tíbet, cuerpo compacto, pelaje largo, denso y liso, variedad de colores, orejas caídas con flecos. Alegre y muy afectuoso.
218	1	Viringo Peruano (Perro sin Pelo del Perú)	\N	4.00	25.00	\N	\N	12	14	14	\N	Perro peruano de cuerpo esbelto, sin pelo (aunque existe variedad con pelo), piel en tonos grises, negros o rosados, orejas grandes erguidas. Elegante y antiguo.
219	1	Welsh Corgi Cardigan	\N	11.00	17.00	\N	\N	12	15	13	\N	Cuerpo largo y bajo, patas cortas, pelaje doble de longitud media, orejas grandes y erguidas, cola larga. Colores variados con blanco.
220	1	Welsh Corgi Pembroke	\N	9.00	12.00	\N	\N	12	15	11	\N	Similar al Cardigan pero más pequeño, cuerpo alargado y bajo, orejas erguidas, cola corta (a veces natural o cortada), pelaje denso en varios colores con blanco. Muy popular.
221	1	Akita (Akita Inu japonés)	\N	32.00	45.00	\N	\N	10	13	2	\N	Perro japonés robusto y poderoso, pelaje doble y espeso en colores rojo, blanco, sésamo o atigrado, orejas triangulares erguidas, cola gruesa enroscada sobre la espalda.
222	1	Akita Americano	\N	34.00	54.00	\N	\N	10	13	2	\N	Similar al Akita japonés pero más grande y corpulento, cabeza ancha, pelaje doble denso en múltiples colores, orejas erguidas, cola enroscada. Muy protector.
223	1	Antiguo Perro de Muestra Danés (Old Danish Pointer)	\N	26.00	35.00	\N	\N	12	14	6	\N	Perro de caza robusto, cuerpo fuerte y cuadrado, pelaje corto blanco con manchas marrón-rojizas, orejas medianas caídas. De carácter tranquilo y estable.
224	1	Antiguo Perro de Pastor Inglés (Old English Sheepdog)	\N	27.00	45.00	\N	\N	10	12	2	\N	Pastor inglés de cuerpo macizo, pelaje largo, abundante y lanoso, colores gris, azul o blanco, orejas ocultas bajo el pelo. Famoso por su aspecto “despeinado”.
225	1	Aidi (Perro del Atlas)	\N	20.00	25.00	\N	\N	10	13	4	\N	Perro guardián originario de Marruecos, cuerpo fuerte y musculoso, pelaje espeso medio-largo de colores variados (blanco, negro, marrón), orejas medianas caídas. Valiente y protector.
226	1	Basset Hound	\N	20.00	29.00	\N	\N	10	12	4	\N	Perro de patas cortas y cuerpo alargado, orejas muy largas y caídas, piel suelta con arrugas, pelaje corto tricolor (negro, blanco y fuego). Famoso por su olfato excepcional.
227	1	Billy	\N	27.00	32.00	\N	\N	12	14	2	\N	Sabueso francés, cuerpo alto y elegante, pelaje corto blanco con ligeros tonos crema o naranja, orejas largas y finas. De aspecto distinguido.
48	2	Oriental Longhair	\N	3.00	5.00	\N	\N	12	15	4	\N	Cuerpo esbelto, pelaje largo y sedoso, ojos verdes almendrados.
228	1	Borzoi (Galgo Ruso)	\N	25.00	47.00	\N	\N	10	12	2	\N	Galgo de Rusia, cuerpo alto, esbelto y elegante, pelaje largo y sedoso ondulado, colores variados, cabeza estrecha, orejas pequeñas hacia atrás. Muy veloz.
229	1	Boyero de Flandes (Bouvier des Flandres)	\N	27.00	40.00	\N	\N	10	12	2	\N	Perro de trabajo belga, cuerpo robusto y poderoso, pelaje áspero y abundante en colores oscuros, barba y cejas prominentes, orejas semierguidas o cortadas.
230	1	Braco Italiano (Bracco Italiano)	\N	25.00	40.00	\N	\N	10	13	2	\N	Perro de muestra italiano, cuerpo fuerte y atlético, pelaje corto blanco con manchas naranjas o marrones, orejas largas caídas, expresión noble.
231	1	Braco Alemán de Pelo Corto (Deutsch Kurzhaar / German Shorthaired Pointer)	\N	20.00	32.00	\N	\N	12	14	6	\N	Perro de muestra alemán, cuerpo atlético y elegante, pelaje corto y denso en colores hígado, blanco con hígado o moteado. Orejas medianas caídas, mirada alerta.
232	1	Braco de Weimar (Weimaraner)	\N	25.00	40.00	\N	\N	10	13	2	\N	Perro de caza alemán, cuerpo estilizado y musculoso, pelaje corto y fino de color gris plateado, orejas largas caídas. Muy activo y elegante.
233	1	Braco Francés (tipo Gascuña)	\N	25.00	32.00	\N	\N	12	14	2	\N	Perro de muestra francés, cuerpo robusto, pelaje corto blanco con manchas marrones, orejas largas y caídas. Rústico y trabajador.
234	1	Briard	\N	30.00	40.00	\N	\N	10	12	2	\N	Perro pastor francés, cuerpo fuerte, pelaje largo, ondulado y abundante (colores negro, cervato, gris), orejas caídas y cubiertas de pelo. Muy protector.
235	1	Boxer	\N	25.00	32.00	\N	\N	10	12	6	\N	Perro alemán de constitución fuerte y atlética, hocico corto y cuadrado, pelaje corto y brillante en colores atigrado o leonado, orejas semicaídas o cortadas. Muy enérgico y leal.
236	1	Cane Corso	\N	40.00	50.00	\N	\N	9	12	2	\N	Moloso italiano, cuerpo muy musculoso y poderoso, pelaje corto y brillante en negro, gris o leonado, cabeza grande con hocico ancho, orejas caídas o cortadas. Excelente guardián.
237	1	Cazador de Alces Sueco (Jämthund)	\N	25.00	35.00	\N	\N	12	13	2	\N	Perro nórdico sueco de caza mayor, cuerpo robusto, pelaje espeso grisáceo con máscara clara, orejas triangulares erguidas, cola curvada sobre la espalda.
238	1	Cesky Fousek (Bohemian Wirehaired Pointing Dog)	\N	22.00	28.00	\N	\N	12	14	6	\N	Perro de muestra checo, cuerpo robusto, pelaje áspero y duro color hígado con moteado gris, barba y cejas distintivas, orejas largas caídas.
239	1	Cimarrón Uruguayo	\N	33.00	45.00	\N	\N	10	13	2	\N	Perro guardián y de trabajo uruguayo, cuerpo fuerte y rústico, pelaje corto atigrado o leonado, orejas medianas caídas, expresión valiente.
240	1	Clumber Spaniel	\N	25.00	34.00	\N	\N	10	12	2	\N	Spaniel británico de caza, cuerpo pesado y bajo, pelaje denso blanco con manchas limón o naranjas, orejas largas peludas, expresión noble y tranquila.
241	1	Coonhound Negro y Fuego (Black and Tan Coonhound)	\N	25.00	34.00	\N	\N	10	12	2	\N	Perro de caza estadounidense, cuerpo musculoso, pelaje corto negro con marcas fuego, orejas muy largas y caídas, excelente olfato para rastrear.
242	1	Cuvac Eslovaco (Slovenský ?uva?)	\N	31.00	44.00	\N	\N	11	13	2	\N	Perro guardián de montaña, cuerpo fuerte, pelaje largo y espeso de color blanco puro, orejas medianas caídas, expresión noble y protectora.
243	1	Dogo Argentino	\N	35.00	45.00	\N	\N	10	12	2	\N	Moloso argentino de caza mayor, cuerpo muy musculoso y atlético, pelaje corto y completamente blanco, cabeza grande, orejas semierguidas o cortadas. Valiente y leal.
244	1	Dogo de Mallorca (Ca de Bou / Perro de Presa Mallorquín)	\N	30.00	28.00	\N	\N	10	12	2	\N	Perro moloso español, cuerpo robusto y compacto, pelaje corto en colores leonado, atigrado o negro, cabeza ancha con mandíbula fuerte. Excelente guardián.
245	1	Dálmata	\N	23.00	32.00	\N	\N	11	13	6	\N	Raza famosa por su pelaje corto blanco con manchas negras o hígado, cuerpo atlético y proporcionado, orejas medianas caídas. Muy activo y enérgico.
246	1	Espinone (Spinone Italiano)	\N	28.00	39.00	\N	\N	12	14	2	\N	Perro de muestra italiano, cuerpo robusto y fuerte, pelaje duro y áspero en colores blanco, naranja o marrón, barba y cejas pobladas, orejas largas caídas.
247	1	Fila de San Miguel (Cão de Fila de São Miguel)	\N	25.00	35.00	\N	\N	12	14	6	\N	Moloso portugués de las Azores, cuerpo musculoso y compacto, pelaje corto atigrado o leonado, orejas cortas y erguidas (a veces recortadas). Buen guardián de ganado.
248	1	Galgo Español (Spanish Greyhound)	\N	23.00	29.00	\N	\N	12	14	6	\N	Galgo ibérico, cuerpo esbelto y muy alto, pelaje corto o duro, colores variados, cabeza alargada, orejas caídas. Muy veloz, criado para la caza de liebres.
249	1	German Wirehaired Pointing Dog (Deutsch Drahthaar)	\N	23.00	32.00	\N	\N	12	14	6	\N	Perro de muestra alemán, cuerpo atlético, pelaje áspero e impermeable en hígado, blanco o moteado, barba y cejas prominentes, orejas medianas caídas.
250	1	Golden Retriever	\N	25.00	34.00	\N	\N	12	14	6	\N	Perro de compañía y trabajo, cuerpo musculoso y equilibrado, pelaje largo, denso y ondulado de color dorado, orejas medianas caídas. Muy sociable y cariñoso.
251	1	Gran Boyero Suizo (Greater Swiss Mountain Dog)	\N	35.00	60.00	\N	\N	8	11	2	\N	Moloso de trabajo suizo, cuerpo muy robusto y musculoso, pelaje corto tricolor (negro, blanco y fuego), orejas medianas caídas, expresión noble.
252	1	Gran Grifón Vendeano (Grand Griffon Vendéen)	\N	25.00	36.00	\N	\N	11	13	2	\N	Sabueso francés de caza, cuerpo fuerte y alto, pelaje largo, áspero y desgreñado, orejas largas caídas. De carácter enérgico y valiente.
253	1	Gran Münsterländer (Large Münsterländer)	\N	23.00	30.00	\N	\N	12	14	6	\N	Perro de muestra alemán, cuerpo atlético, pelaje largo y denso en blanco con manchas negras, orejas largas peludas. Muy versátil en caza.
254	1	Gran Sabueso Anglo-Francés Blanco y Naranja	\N	30.00	35.00	\N	\N	10	12	2	\N	Sabueso francés de caza mayor, cuerpo robusto, pelaje corto blanco con manchas naranjas, orejas largas y finas caídas. Raza de jauría.
255	1	Gran Sabueso Anglo-Francés Blanco y Negro	\N	30.00	35.00	\N	\N	10	12	2	\N	Similar al anterior pero con pelaje corto blanco y negro con marcas fuego, cuerpo fuerte y elegante, orejas largas caídas.
256	1	Gran Sabueso Azul de Gascuña (Grand Bleu de Gascogne)	\N	30.00	35.00	\N	\N	10	12	2	\N	Sabueso francés de cuerpo robusto y elegante, pelaje corto moteado azul (mezcla de negro y blanco) con marcas fuego, orejas largas caídas.
257	1	Greyhound	\N	27.00	40.00	\N	\N	10	14	2	\N	Galgo inglés, cuerpo muy esbelto y alto, pelaje corto en gran variedad de colores, cabeza estrecha, orejas pequeñas hacia atrás. El perro más veloz.
258	1	Grifón de Muestra de Pelo Duro (Wirehaired Pointing Griffon)	\N	20.00	32.00	\N	\N	12	14	6	\N	Perro de muestra de caza, cuerpo fuerte y atlético, pelaje duro y áspero de color gris con manchas marrones, barba y cejas pobladas.
259	1	Hovawart	\N	25.00	40.00	\N	\N	10	14	2	\N	Perro alemán de trabajo, cuerpo poderoso y proporcionado, pelaje largo y abundante (negro, rubio o negro y fuego), orejas medianas caídas, expresión noble y vigilante.
260	1	Komondor	\N	40.00	60.00	\N	\N	10	12	2	\N	Perro pastor húngaro inconfundible por su pelaje largo en forma de cordones (“dreadlocks”), cuerpo robusto, orejas medianas caídas. Criado como guardián de rebaños.
261	1	Kuvasz	\N	32.00	52.00	\N	\N	10	12	2	\N	Pastor húngaro de cuerpo fuerte y elegante, pelaje largo, blanco y denso, orejas caídas, expresión noble. Protector y leal.
262	1	Labrador Retriever	\N	25.00	36.00	\N	\N	10	12	6	\N	Uno de los perros más populares, cuerpo atlético, pelaje corto y denso en negro, chocolate o amarillo, orejas medianas caídas. Sociable y versátil.
263	1	Lebrel Afgano (Afghan Hound)	\N	20.00	27.00	\N	\N	12	14	2	\N	Galgo elegante y esbelto, pelaje muy largo, fino y sedoso, orejas largas cubiertas de pelo, expresión distinguida. Muy veloz.
264	1	Lebrel Escocés (Scottish Deerhound)	\N	34.00	50.00	\N	\N	8	11	2	\N	Galgo escocés, cuerpo alto y robusto, pelaje áspero y duro grisáceo, cabeza alargada, orejas pequeñas hacia atrás. Criado para caza de ciervos.
265	1	Lebrel Húngaro (Magyar Agár)	\N	22.00	31.00	\N	\N	12	14	2	\N	Galgo húngaro, cuerpo delgado y musculoso, pelaje corto y fino en varios colores, cabeza estrecha, orejas pequeñas semierguidas. Criado para carreras y caza.
266	1	Mastín del Alentejo (Rafeiro do Alentejo)	\N	35.00	60.00	\N	\N	10	13	2	\N	Perro guardián portugués, cuerpo muy robusto y poderoso, pelaje corto y denso en colores leonado, negro o atigrado, orejas medianas caídas. Protector de ganado.
267	1	Otterhound	\N	30.00	50.00	\N	\N	10	12	2	\N	Perro inglés criado para caza de nutrias, cuerpo fuerte y grande, pelaje largo, áspero e impermeable, orejas largas y cubiertas de pelo, expresión simpática.
268	1	Pastor Alemán (German Shepherd Dog)	\N	22.00	40.00	\N	\N	9	13	2	\N	Una de las razas más conocidas, cuerpo musculoso y ágil, pelaje doble denso (negro y fuego, sable o negro sólido), orejas grandes erguidas, expresión inteligente.
269	1	Pastor Blanco Suizo	\N	25.00	40.00	\N	\N	12	14	2	\N	Variante del Pastor Alemán reconocida como raza independiente, cuerpo atlético, pelaje largo o medio y completamente blanco, orejas erguidas, expresión noble y vigilante.
270	1	Pastor de Beauce (Beauceron)	\N	30.00	45.00	\N	\N	10	12	2	\N	Pastor francés, cuerpo fuerte y musculoso, pelaje corto negro con marcas fuego, orejas semierguidas o caídas, expresión seria. Muy protector y obediente.
271	1	Pastor de la Maremma y de los Abruzos (Maremmano-Abruzzese Sheepdog)	\N	30.00	45.00	\N	\N	11	13	2	\N	Perro guardián italiano, cuerpo robusto, pelaje largo y denso completamente blanco, orejas pequeñas caídas, expresión noble. Protector de ganado.
272	1	Pastor Holandés (Dutch Shepherd)	\N	20.00	32.00	\N	\N	11	14	6	\N	Pastor ágil y versátil, pelaje corto, largo o áspero, generalmente atigrado, orejas erguidas, cuerpo atlético. Excelente perro de trabajo.
273	1	Pastor Polaco de Podhale (Polski Owczarek Podhala?ski)	\N	35.00	45.00	\N	\N	10	12	2	\N	Pastor polaco de montaña, cuerpo muy fuerte, pelaje largo y espeso blanco, orejas medianas caídas. Protector de rebaños en zonas montañosas.
274	1	Pastor Rumano de los Cárpatos	\N	30.00	40.00	\N	\N	12	14	2	\N	Pastor rumano, cuerpo poderoso, pelaje doble denso grisáceo con blanco, orejas medianas caídas. Famoso por su valentía y fidelidad.
275	1	Pastor Rumano de Mioritza	\N	35.00	45.00	\N	\N	11	13	2	\N	Pastor rumano de montaña, cuerpo robusto, pelaje largo, abundante y lanoso, generalmente blanco o blanco con gris. Orejas medianas caídas, expresión vigilante.
276	1	Perdiguero de Burgos	\N	25.00	30.00	\N	\N	12	14	6	\N	Perro de muestra español, cuerpo fuerte, pelaje corto y denso de color hígado y blanco, orejas largas caídas. Usado en caza menor.
277	1	Perdiguero de Drente (Drentsche Patrijshond)	\N	20.00	30.00	\N	\N	12	14	4	\N	Perro de caza neerlandés, cuerpo proporcionado, pelaje semilargo blanco con parches marrones, orejas largas peludas. Versátil y obediente.
278	1	Perro Crestado Rodesiano (Rhodesian Ridgeback)	\N	29.00	41.00	\N	\N	10	12	2	\N	Raza africana, cuerpo atlético y musculoso, pelaje corto rojizo con la característica cresta de pelo en el lomo. Orejas medianas caídas.
279	1	Perro de Agua Frisón (Wetterhoun)	\N	25.00	35.00	\N	\N	12	14	6	\N	Raza neerlandesa de caza y agua, cuerpo fuerte y compacto, pelaje rizado, impermeable, generalmente negro o marrón. Orejas medianas caídas.
280	1	Perro de Castro Laboreiro	\N	25.00	40.00	\N	\N	10	12	2	\N	Perro guardián portugués, cuerpo fuerte y robusto, pelaje corto de tonos grises atigrados, orejas medianas caídas, expresión seria. Muy protector.
281	1	Perro de Groenlandia (Greenland Dog)	\N	30.00	32.00	\N	\N	12	14	2	\N	Perro nórdico de trineo, cuerpo musculoso y resistente, pelaje doble espeso en varios colores, orejas pequeñas erguidas, cola curvada sobre la espalda.
282	1	Perro de Muestra Alemán de Pelo Largo (Deutsch Langhaar)	\N	25.00	30.00	\N	\N	12	14	6	\N	Perro de caza alemán, cuerpo atlético, pelaje largo, denso y ondulado de color marrón o marrón con blanco. Orejas largas peludas.
283	1	Perro de Pastor Mallorquín (Ca de Bestiar)	\N	30.00	40.00	\N	\N	11	13	2	\N	Raza balear de pastoreo y guardia, cuerpo robusto, pelaje corto negro (a veces con manchas blancas), orejas medianas caídas, expresión seria.
284	1	Perro de San Huberto (Bloodhound)	\N	36.00	50.00	\N	\N	10	12	2	\N	Sabueso de rastreo, cuerpo grande y pesado, piel suelta con arrugas, orejas extremadamente largas, pelaje corto rojo, negro y fuego. Olfato excepcional.
285	1	Perro del Faraón (Pharaoh Hound)	\N	20.00	25.00	\N	\N	11	14	4	\N	Raza elegante originaria de Malta, cuerpo atlético y delgado, pelaje corto color rojizo, orejas grandes y erguidas, expresión vivaz. Destaca por su elegancia y velocidad.
286	1	Perro Lobo Checoslovaco (Czechoslovakian Wolfdog)	\N	20.00	26.00	\N	\N	12	16	2	\N	Híbrido de Pastor Alemán y lobo de los Cárpatos, cuerpo fuerte y ágil, pelaje gris plateado, orejas triangulares erguidas, mirada penetrante similar al lobo.
287	1	Perro Lobo de Saarloos (Saarloos Wolfdog)	\N	36.00	41.00	\N	\N	10	12	2	\N	Perro holandés con fuerte parecido al lobo, cuerpo robusto, pelaje doble gris o marrón, orejas erguidas, expresión seria. Criado como perro de compañía y trabajo.
288	1	Podenco Canario	\N	20.00	25.00	\N	\N	11	13	4	\N	Raza de caza española, cuerpo esbelto, pelaje corto de color rojizo o arena, orejas muy grandes y erguidas. Muy ágil y rápido en terrenos rocosos.
289	1	Pointer Inglés	\N	20.00	30.00	\N	\N	12	14	6	\N	Perro de muestra británico, cuerpo atlético y elegante, pelaje corto y fino en colores blanco con manchas negras, marrones o limones, orejas medianas caídas. Muy energético.
290	1	Poitevino (Chien de Poitevin)	\N	25.00	30.00	\N	\N	10	13	2	\N	Sabueso francés de caza, cuerpo alto y esbelto, pelaje corto tricolor (blanco, negro y fuego), orejas largas caídas. Muy veloz y resistente.
291	1	Presa Canario (Dogo Canario)	\N	40.00	65.00	\N	\N	9	11	2	\N	Moloso español, cuerpo muy musculoso y poderoso, pelaje corto atigrado o leonado, cabeza grande con hocico ancho, orejas medianas caídas. Excelente guardián.
292	1	Pudelpointer	\N	20.00	30.00	\N	\N	12	14	6	\N	Perro de muestra alemán, resultado del cruce de Poodle y Pointer, cuerpo fuerte y ágil, pelaje áspero o denso en marrón, negro o hígado. Muy versátil en caza.
293	1	Retriever de la Bahía de Chesapeake (Chesapeake Bay Retriever)	\N	25.00	36.00	\N	\N	10	13	2	\N	Perro cobrador estadounidense, cuerpo robusto y musculoso, pelaje corto, espeso e impermeable de color marrón o caoba, orejas medianas caídas. Excelente nadador.
294	1	Retriever de Pelo Liso (Flat-Coated Retriever)	\N	25.00	36.00	\N	\N	8	10	2	\N	Retriever británico, cuerpo elegante y atlético, pelaje largo, liso y brillante de color negro o hígado, orejas medianas caídas, expresión alegre.
295	1	Retriever de Pelo Rizado (Curly-Coated Retriever)	\N	27.00	36.00	\N	\N	9	12	2	\N	Retriever inglés, cuerpo atlético y elegante, pelaje rizado y apretado en negro o marrón, orejas medianas caídas. Gran nadador y cobrador.
296	1	Sabueso Anglo-Francés Mediano (Anglo-Français de Petite Vénerie)	\N	15.00	20.00	\N	\N	12	14	4	\N	Sabueso de caza francés, cuerpo ágil y ligero, pelaje corto tricolor (blanco, negro y fuego), orejas largas caídas. Criado para caza menor.
297	1	Sabueso Artesiano (Ariegeois)	\N	25.00	30.00	\N	\N	11	13	6	\N	Sabueso francés, cuerpo elegante y delgado, pelaje corto blanco con manchas negras y fuego, orejas largas finas y caídas. Muy resistente en caza.
298	1	Sabueso Bavarés de Montaña (Bavarian Mountain Hound)	\N	20.00	25.00	\N	\N	10	13	4	\N	Perro de rastreo alemán, cuerpo musculoso, pelaje corto rojizo, orejas largas caídas. Excelente olfato para rastrear piezas heridas.
299	1	Sabueso de Artois (Chien d’Artois)	\N	28.00	30.00	\N	\N	12	14	6	\N	Sabueso francés, cuerpo robusto y compacto, pelaje corto tricolor (blanco, negro y fuego), orejas largas caídas. Muy apreciado en la caza de liebres.
300	1	Sabueso Francés Blanco y Negro (Grand Anglo-Français Blanc et Noir)	\N	30.00	35.00	\N	\N	10	12	2	\N	Sabueso francés de jauría, cuerpo robusto, pelaje corto blanco y negro con marcas fuego, orejas largas caídas. Muy resistente en la caza mayor.
301	1	Sabueso Francés Tricolor (Grand Anglo-Français Tricolore)	\N	30.00	35.00	\N	\N	10	12	2	\N	Similar al anterior, pero tricolor (blanco, negro y fuego). De cuerpo atlético, orejas largas y finas, criado para la caza en jauría.
302	1	Sabueso Polaco (Polski Ogar)	\N	25.00	32.00	\N	\N	11	13	2	\N	Sabueso de origen polaco, cuerpo fuerte, pelaje corto de color negro y fuego, orejas largas caídas. Muy apreciado como perro de rastreo.
303	1	Foxhound Inglés (English Foxhound)	\N	29.00	34.00	\N	\N	10	13	2	\N	Perro de caza inglés, cuerpo musculoso y resistente, pelaje corto tricolor (blanco, negro y fuego), orejas medianas caídas. Usado en caza de zorros en jauría.
304	1	Schnauzer Gigante (Riesenschnauzer)	\N	35.00	47.00	\N	\N	10	12	2	\N	Schnauzer alemán de mayor tamaño, cuerpo fuerte y compacto, pelaje duro y áspero, barba y cejas características, colores negro o sal y pimienta. Muy protector.
305	1	Setter Gordon	\N	25.00	36.00	\N	\N	12	13	2	\N	Perro elegante de caza de origen escocés, pelaje largo y sedoso de color negro con marcas fuego. Cuerpo atlético, orejas caídas, expresión noble.
306	1	Spaniel Picardo (Épagneul Picard)	\N	20.00	25.00	\N	\N	12	14	4	\N	Spaniel francés de caza, cuerpo fuerte, pelaje ondulado gris moteado con marcas marrones. Orejas largas y peludas, mirada suave.
307	1	Terrier Negro de Rusia (Black Russian Terrier)	\N	36.00	65.00	\N	\N	10	12	2	\N	Perro imponente de origen ruso, criado para trabajo militar. Pelaje negro, denso y áspero, barba y bigote prominentes. Fuerte, protector y leal.
308	1	Vizsla de Pelo Duro (Wirehaired Vizsla)	\N	20.00	30.00	\N	\N	12	14	6	\N	Variante del vizsla húngaro con pelaje áspero y duro de color dorado. Cuerpo atlético, orejas caídas, mirada expresiva. Muy activo.
309	1	Bernese Mountain Dog (Boyero de Berna)	\N	35.00	50.00	\N	\N	7	10	2	\N	Perro suizo de montaña, cuerpo robusto, pelaje largo y tricolor (negro, blanco y fuego). Cabeza grande, orejas medianas, muy noble y familiar.
310	1	Broholmer	\N	40.00	70.00	\N	\N	8	10	2	\N	Perro guardián danés, de constitución fuerte y cuerpo macizo. Pelaje corto, colores amarillos, leonados o rojizos con máscara negra. Aspecto imponente pero tranquilo.
311	1	Bullmastiff	\N	45.00	60.00	\N	\N	8	10	2	\N	Perro inglés de guardia, musculoso y robusto. Cabeza grande y cuadrada, hocico corto. Pelaje corto en tonos leonado, rojo o atigrado. Protector y valiente.
312	1	Dogo de Burdeos	\N	45.00	65.00	\N	\N	8	10	2	\N	Perro francés muy robusto y musculoso. Cabeza enorme con arrugas, hocico corto. Pelaje corto de color rojo fuego. Aspecto poderoso y valiente.
313	1	Dogo del Tíbet (Mastín Tibetano)	\N	45.00	70.00	\N	\N	10	12	2	\N	Perro guardián de origen tibetano, de gran tamaño y melena abundante que recuerda a un león. Pelaje denso, colores negro, dorado o marrón. Imponente y protector.
314	1	Gran Danés (Dogo Alemán)	\N	50.00	90.00	\N	\N	7	10	1	\N	Una de las razas más grandes del mundo. Altura impresionante, cuerpo musculoso y elegante. Pelaje corto, variedad de colores (arlequín, negro, azul, atigrado, leonado). Cariñoso y leal.
315	1	Irish Wolfhound	\N	40.00	55.00	\N	\N	6	10	1	\N	Perro irlandés de los más altos del mundo, cuerpo largo y musculoso. Pelaje áspero y duro, en colores gris, negro, atigrado o blanco. Aspecto noble y majestuoso.
316	1	Kangal Shepherd Dog	\N	50.00	65.00	\N	\N	10	13	2	\N	Perro guardián turco, de gran tamaño y fuerte musculatura. Pelaje corto y denso, generalmente beige con máscara negra. Conocido por su fuerza y valentía.
317	1	Landseer	\N	50.00	75.00	\N	\N	9	11	2	\N	Similar al Terranova, pero con pelaje blanco con manchas negras. Cuerpo robusto, patas largas y aspecto elegante. Amigable y excelente nadador.
318	1	Leonberger	\N	45.00	75.00	\N	\N	8	10	1	\N	Perro alemán de aspecto leonino, con melena abundante alrededor del cuello. Pelaje largo en tonos dorados o leonados. Majestuoso, equilibrado y familiar.
319	1	Mastiff (Mastín Inglés)	\N	70.00	100.00	\N	\N	6	10	1	\N	Una de las razas más pesadas del mundo. Cuerpo masivo, pecho ancho y cabeza grande. Pelaje corto en tonos leonado, atigrado o albaricoque. Protector y tranquilo.
320	1	Mastín del Pirineo	\N	55.00	80.00	\N	\N	8	12	1	\N	Perro español de montaña, criado para proteger rebaños. De gran tamaño y fuerte constitución, pelaje espeso y blanco con manchas grises, negras o leonadas. Carácter noble y protector.
321	1	Mastín Español	\N	60.00	100.00	\N	\N	8	12	1	\N	Una de las razas más grandes de España. Cuerpo robusto, pecho ancho y patas fuertes. Pelaje denso, normalmente leonado, atigrado o negro. Conocido por su labor como guardián de ganado.
322	1	Neapolitan Mastiff (Mastín Napolitano)	\N	50.00	70.00	\N	\N	8	10	2	\N	Perro italiano de aspecto impresionante, piel suelta con arrugas abundantes. Cuerpo musculoso y macizo. Pelaje corto en gris, negro, marrón o leonado. Protector y leal.
323	1	Newfoundland (Terranova)	\N	45.00	70.00	\N	\N	8	10	2	\N	Perro canadiense de trabajo, excelente nadador y rescatista acuático. Cuerpo grande y fuerte, pelaje largo, denso y resistente al agua. Colores negro, marrón o blanco y negro.
324	1	Perro de la Sierra de la Estrela	\N	30.00	50.00	\N	\N	10	12	2	\N	Raza portuguesa, perro pastor de montaña. Cuerpo fuerte, musculoso y bien proporcionado. Pelaje largo o corto, espeso, en colores amarillos, grises o atigrados. Protector y leal.
325	1	Perro de Montaña de los Pirineos	\N	45.00	60.00	\N	\N	10	12	1	\N	Majestuoso perro guardián francés, de gran tamaño y porte elegante. Pelaje largo, denso y blanco, a veces con manchas grises o amarillas. Protector, noble y sereno.
326	1	Rottweiler	\N	35.00	60.00	\N	\N	8	10	2	\N	Perro alemán robusto y musculoso, de cuerpo compacto y fuerte. Pelaje corto, negro con marcas fuego en cara, pecho y patas. Inteligente, seguro y protector.
327	1	San Bernardo	\N	60.00	90.00	\N	\N	8	10	1	\N	Conocido perro de rescate alpino, imponente y fuerte. Pelaje denso, largo o corto, blanco con manchas marrones o leonadas. Amigable, noble y bondadoso.
328	1	Afgano (Lebrel Afgano)	\N	20.00	30.00	\N	\N	12	14	2	\N	Elegante lebrel oriental, de cuerpo alto y estilizado. Pelaje largo, fino y sedoso en gran variedad de colores. Distinguido y veloz.
329	1	Akita Japonés	\N	32.00	45.00	\N	\N	10	12	2	\N	Perro japonés de constitución robusta y porte digno. Pelaje doble, denso y corto, en colores rojo, blanco o atigrado. Valiente, leal y reservado.
330	1	Basset Azul de Gascuña	\N	16.00	18.00	\N	\N	11	13	4	\N	Perro francés de orejas largas y cuerpo alargado. Pelaje corto, moteado azul con manchas negras y marcas fuego. Buen cazador y de carácter amigable.
331	1	Basset Grifón Vandeano (Pequeño)	\N	15.00	20.00	\N	\N	12	14	4	\N	De cuerpo alargado, patas cortas y pelaje duro y áspero. Colores variados (blanco, negro, naranja, limón, leonado). Alegre, resistente y valiente.
332	1	Beauceron	\N	30.00	45.00	\N	\N	10	12	2	\N	Perro pastor francés, musculoso y bien proporcionado. Pelaje corto, negro y fuego o arlequín. Inteligente, valiente y excelente guardián.
333	1	Bedlington Terrier	\N	8.00	10.00	\N	\N	12	14	11	\N	Terrier inglés con apariencia similar a un cordero. Pelaje rizado, suave y lanoso en colores azul, hígado o arena. Ágil, cariñoso y enérgico.
334	1	Bergamasco	\N	26.00	38.00	\N	\N	12	156	2	\N	Perro pastor italiano, conocido por su pelaje largo en mechones similares a rastas. Colores gris y negro. De aspecto rústico, equilibrado y protector.
335	1	Bichón Frisé	\N	5.00	8.00	\N	\N	14	15	11	\N	Perro pequeño, alegre y vivaz. Pelaje blanco, esponjoso y rizado, con aspecto de algodón. Ojos oscuros y expresivos, aspecto simpático. Muy sociable y juguetón.
336	1	Bloodhound (Sabueso de San Huberto)	\N	36.00	50.00	\N	\N	10	12	2	\N	Famoso sabueso de rastreo, de orejas largas y piel suelta con pliegues. Pelaje corto en negro y fuego, hígado y fuego o rojo. Olfato excepcional.
337	1	Bobtail (Antiguo Perro Pastor Inglés)	\N	27.00	45.00	\N	\N	10	12	2	\N	Pastor inglés con pelaje largo, abundante y lanoso, generalmente gris y blanco. De cuerpo fuerte y aspecto entrañable. Protector y amigable.
338	1	Bodeguero Andaluz	\N	7.00	8.00	\N	\N	12	14	11	\N	Terrier español, ágil y enérgico. Pelaje corto, blanco con manchas negras y/o marrones en la cabeza. Usado tradicionalmente para cazar roedores en bodegas.
339	1	Border Collie	\N	14.00	20.00	\N	\N	12	15	4	\N	Pastor escocés, considerado uno de los perros más inteligentes. Cuerpo ágil y atlético, pelaje medio o largo en varios colores, siendo común el blanco y negro. Incansable y trabajador.
340	1	Bracco Italiano (Braco Italiano)	\N	25.00	40.00	\N	\N	10	12	2	\N	Perro de caza italiano, de cuerpo atlético y elegante. Cabeza alargada, orejas largas y pelaje corto moteado o bicolor (blanco-naranja o blanco-marrón). Fino rastreador.
341	1	Braco Alemán de Pelo Corto	\N	20.00	32.00	\N	\N	12	14	6	\N	Perro de caza versátil, de constitución atlética. Pelaje corto, denso y moteado (hígado y blanco). Muy enérgico y obediente.
342	1	Braco Alemán de Pelo Duro	\N	25.00	34.00	\N	\N	12	14	2	\N	Variante robusta del braco alemán, con pelaje duro y áspero, barba y cejas pobladas. Colores hígado, blanco o moteado. Resistente y excelente cazador.
343	1	Braco de Weimar (Weimaraner)	\N	25.00	40.00	\N	\N	10	13	2	\N	Perro de caza alemán, elegante y atlético. Pelaje corto, plateado o grisáceo, ojos claros distintivos. Conocido como el "fantasma gris". Leal y enérgico.
344	1	Braco Húngaro (Vizsla)	\N	20.00	30.00	\N	\N	12	14	4	\N	Perro de caza húngaro, elegante y atlético. Pelaje corto y dorado-rojizo, ojos y nariz en tonos avellana. Muy enérgico, leal y afectuoso.
345	1	Braco Húngaro de Pelo Duro (Vizsla de Pelo Duro)	\N	20.00	30.00	\N	\N	12	14	4	\N	Variante del Vizsla con pelaje áspero, denso y con barba característica. Color dorado-rojizo. Resistente, activo y trabajador.
346	1	Bretón (Spaniel Bretón)	\N	13.00	18.00	\N	\N	12	14	4	\N	Perro de caza francés, compacto y ágil. Pelaje medio, denso y ondulado, bicolor o tricolor (blanco-naranja, blanco-marrón). Muy alegre y sociable.
347	1	Bull Terrier Miniatura	\N	9.00	16.00	\N	\N	11	14	13	\N	Similar al Bull Terrier estándar pero más pequeño. Cabeza ovalada, fuerte musculatura. Pelaje corto, variedad de colores (blanco, atigrado, negro, marrón). Valiente y juguetón.
348	1	Bulldog (Inglés)	\N	18.00	23.00	\N	\N	8	10	4	\N	Perro británico, bajo y robusto. Cabeza grande con arrugas, hocico chato. Pelaje corto en varios colores (blanco, leonado, atigrado). Cariñoso y tranquilo.
349	1	Caniche Enano (Miniatura)	\N	5.00	9.00	\N	\N	12	15	11	\N	Variedad del Caniche, de tamaño intermedio entre el toy y el estándar. Pelaje rizado e hipoalergénico, en colores variados (blanco, negro, marrón, gris, albaricoque). Elegante, activo e inteligente.
350	1	Caniche Grande (Estándar)	\N	20.00	32.00	\N	\N	12	15	6	\N	La variedad más grande del Caniche. Cuerpo atlético y proporcionado, pelaje rizado y espeso, en múltiples colores. Muy versátil, elegante y obediente.
351	1	Caniche Toy	\N	2.00	4.00	\N	\N	14	17	8	\N	La variedad más pequeña de los Caniches. Pelaje rizado, denso e hipoalergénico. De aspecto delicado y elegante, pero vivaz y juguetón.
49	2	Oriental Shorthair	\N	3.00	5.00	\N	\N	12	15	4	\N	Cuerpo delgado, pelaje corto brillante en gran variedad de colores, orejas grandes puntiagudas.
352	1	Cavalier King Charles Spaniel	\N	5.00	8.00	\N	\N	12	15	11	\N	Perro inglés de compañía, de aspecto refinado. Pelaje sedoso, largo y ondulado en colores Blenheim, tricolor, rubí o negro y fuego. Muy afectuoso y sociable.
353	1	Cazador de Alces Noruego (Elkhound Noruego)	\N	20.00	30.00	\N	\N	12	15	4	\N	Perro nórdico de caza, fuerte y compacto. Pelaje doble, gris plateado con tonos negros, cola enroscada sobre el lomo. Leal, protector y valiente.
354	1	Chihuahua (de pelo largo)	\N	1.00	3.00	\N	\N	14	17	8	\N	El perro más pequeño del mundo, con pelaje largo, suave y sedoso. Cabeza redonda tipo “manzana”, orejas grandes y ojos expresivos. Muy vivaz y apegado a su dueño.
355	1	Chihuahua (de pelo suave/corto)	\N	1.00	3.00	\N	\N	14	17	8	\N	Similar al de pelo largo pero con pelaje corto, liso y brillante. De cuerpo pequeño y compacto. Carácter valiente, curioso y enérgico.
356	1	Chin Japonés	\N	2.00	5.00	\N	\N	12	14	11	\N	Perro de compañía de aspecto elegante y delicado. Pelaje largo, sedoso y abundante, generalmente blanco con negro o rojo. Carácter dulce, tranquilo y afectuoso.
357	1	Chow Chow (de pelo suave)	\N	20.00	30.00	\N	\N	9	15	6	\N	Variante del Chow Chow con pelaje más corto y liso. De aspecto robusto y leonino, lengua azul característica. Digno, independiente y protector.
358	1	Clumber Spaniel	\N	25.00	34.00	\N	\N	10	12	6	\N	Spaniel inglés de cuerpo robusto y bajo. Pelaje denso, blanco con manchas limón o naranjas. Orejas grandes y caídas, expresión calmada. Sereno y leal.
359	1	Cobrador de Nueva Escocia (Nova Scotia Duck Tolling Retriever)	\N	17.00	23.00	\N	\N	12	14	4	\N	El más pequeño de los retrievers, de cuerpo compacto y atlético. Pelaje medio, denso e impermeable, color rojo o naranja con marcas blancas. Enérgico y excelente nadador.
360	1	Cockapoo	\N	5.00	11.00	\N	\N	12	15	13	\N	Mestizo entre Cocker Spaniel y Caniche. Pelaje rizado u ondulado, variedad de colores. Alegre, cariñoso e inteligente, considerado hipoalergénico.
361	1	Cocker Spaniel (Inglés)	\N	12.00	16.00	\N	\N	12	15	4	\N	Perro de caza inglés, de cuerpo equilibrado y orejas largas. Pelaje sedoso, de longitud media, en gran variedad de colores (unicolores o particolores). Alegre y afectuoso.
362	1	Cocker Spaniel Americano	\N	11.00	13.00	\N	\N	12	15	13	\N	Similar al inglés pero más pequeño y de cabeza más redondeada. Pelaje largo, sedoso y abundante, en diversos colores. Expresivo y sociable.
363	1	Collie Barbudo (Bearded Collie)	\N	18.00	27.00	\N	\N	12	14	6	\N	Pastor escocés, de cuerpo ágil y cubierto por un largo pelaje doble y ondulado. Colores gris, negro, azul o marrón con blanco. Vivaz, alegre y muy afectuoso.
364	1	Collie de Pelo Corto	\N	18.00	29.00	\N	\N	12	14	6	\N	Variante del Collie con pelaje corto, liso y denso. Cuerpo elegante y atlético, colores sable, tricolor o azul mirlo. Inteligente, leal y buen pastor.
365	1	Corgi Galés de Cardigan	\N	11.00	17.00	\N	\N	12	15	13	\N	El más antiguo de los Corgis, de cuerpo alargado y patas cortas. Cola larga, pelaje medio en varios colores. Muy activo, alerta y protector.
366	1	Corgi Galés de Pembroke	\N	9.00	12.00	\N	\N	12	15	11	\N	Famoso por ser favorito de la realeza británica. De cuerpo alargado, patas cortas y cola generalmente corta o ausente. Pelaje medio, en tonos rojizos o tricolores. Alegre, sociable y fiel.
367	1	Crestado Chino (Chinese Crested Dog)	\N	4.00	6.00	\N	\N	12	14	11	\N	Perro de compañía único, en dos variedades: "desnudo" (piel descubierta con mechones en cabeza, cola y patas) y "powderpuff" (pelaje largo y sedoso). Elegante y afectuoso.
368	1	Crestado Rodesiano (Rhodesian Ridgeback)	\N	30.00	39.00	\N	\N	10	12	2	\N	Perro africano de caza y guardia. Reconocible por la cresta de pelo invertido en la espalda. Cuerpo fuerte y atlético, pelaje corto color trigo. Valiente y protector.
369	1	Field Spaniel	\N	18.00	25.00	\N	\N	12	14	4	\N	Spaniel inglés de caza, de cuerpo alargado y elegante. Pelaje medio, liso o ligeramente ondulado, en colores negro, hígado o con marcas fuego. Sereno, equilibrado y afectuoso.
370	1	Fox Terrier de Pelo Duro	\N	7.00	9.00	\N	\N	12	15	11	\N	Terrier inglés muy activo y enérgico. Pelaje duro, áspero y denso, generalmente blanco con manchas negras o marrones. Ágil, valiente y curioso.
371	1	Fox Terrier de Pelo Liso	\N	7.00	8.00	\N	\N	12	15	11	\N	Similar al de pelo duro, pero con pelaje corto y liso. Color predominante blanco con manchas negras o fuego. Inteligente, vivaz y muy dinámico.
372	1	Foxhound (Americano o Inglés)	\N	25.00	34.00	\N	\N	10	13	6	\N	Perro de caza, fuerte y resistente. Pelaje corto y denso en tricolor (negro, blanco y fuego). Muy enérgico, necesita ejercicio intenso.
373	1	Galgo (Español)	\N	25.00	30.00	\N	\N	12	14	2	\N	Lebrel estilizado, ágil y muy veloz. Cuerpo delgado, patas largas y musculosas. Pelaje corto o duro, variedad de colores. Noble y reservado, excelente corredor.
374	1	Galgo Italiano	\N	3.00	5.00	\N	\N	13	15	11	\N	Lebrel miniatura, muy esbelto y elegante. Cuerpo delgado, patas largas y finas. Pelaje corto y liso en variedad de colores (gris, negro, crema). Ágil, afectuoso y veloz.
375	1	Golden Retriever	\N	25.00	34.00	\N	\N	10	12	2	\N	Uno de los perros más populares, originario de Escocia. Cuerpo robusto y armonioso, pelaje largo, denso y dorado. Inteligente, obediente y muy sociable.
376	1	Gran Azul de Gascuña	\N	35.00	39.00	\N	\N	10	12	2	\N	Sabueso francés de gran tamaño. Pelaje moteado azul con manchas negras y marcas fuego. Orejas largas y caídas, expresión noble. Excelente olfato y resistente.
377	1	Gran Danés (Dogo Alemán)	\N	50.00	90.00	\N	\N	7	10	1	\N	Una de las razas más grandes del mundo. Cuerpo musculoso y elegante, pelaje corto en varios colores (arlequín, negro, azul, leonado, atigrado). Cariñoso y leal.
378	1	Grifón de Bruselas	\N	3.00	6.00	\N	\N	12	15	11	\N	Perro de compañía belga, de cabeza redonda y hocico corto. Dos variedades: pelo duro y pelo liso. Colores rojo, negro o negro y fuego. Expresivo y vivaz.
379	1	Grifón Vandeano Grande (Grand Basset Griffon Vendéen)	\N	18.00	20.00	\N	\N	12	14	4	\N	Perro de caza francés, de cuerpo alargado y orejas largas. Pelaje duro, áspero y desordenado, en colores blanco con manchas negras, limón o naranja. Alegre, resistente y valiente.
380	1	Habanero (Bichón Habanero)	\N	4.00	7.00	\N	\N	13	15	11	\N	Perro de compañía cubano, de cuerpo pequeño y compacto. Pelaje largo, ondulado y sedoso, en variedad de colores. Muy cariñoso, alegre y juguetón.
381	1	Hamilton Stovare	\N	23.00	27.00	\N	\N	12	14	6	\N	Sabueso sueco de caza, de cuerpo fuerte y elegante. Pelaje corto, tricolor (negro, blanco y fuego). Conocido por su resistencia y carácter equilibrado.
382	1	Husky Siberiano	\N	16.00	27.00	\N	\N	12	14	4	\N	Perro de trineo originario de Siberia. Cuerpo atlético y compacto, pelaje doble espeso en varios colores, ojos azules o heterocromía. Energético y sociable.
383	1	Keeshond	\N	16.00	20.00	\N	\N	12	14	4	\N	Perro holandés tipo spitz, de cuerpo robusto y pelaje abundante gris plateado con cara y orejas oscuras. Cola enroscada. Expresivo, alegre y muy familiar.
384	1	Kerry Blue Terrier	\N	15.00	18.00	\N	\N	12	15	4	\N	Terrier irlandés de cuerpo atlético y elegante. Pelaje ondulado, denso y de color azul grisáceo característico. Inteligente, enérgico y leal.
385	1	King Charles Spaniel	\N	3.00	7.00	\N	\N	10	12	11	\N	Perro de compañía inglés, de cuerpo compacto y orejas largas y caídas. Pelaje largo, sedoso, en colores rubí, tricolor, negro y fuego o Blenheim. Cariñoso y dócil.
386	1	Kuvasz Húngaro	\N	35.00	52.00	\N	\N	10	12	2	\N	Perro guardián húngaro de gran tamaño. Pelaje blanco, largo y denso. De constitución fuerte y porte noble. Protector, valiente y fiel.
387	1	Labradoodle	\N	15.00	30.00	\N	\N	12	14	6	\N	Cruce entre Labrador y Caniche. Pelaje rizado u ondulado, hipoalergénico, en variedad de colores. Muy sociable, activo e inteligente.
388	1	Labrador Retriever	\N	25.00	36.00	\N	\N	10	12	2	\N	Una de las razas más populares. Cuerpo robusto y musculoso, pelaje corto y denso en colores amarillo, negro o chocolate. Amigable, equilibrado y excelente nadador.
389	1	Laekenois (Pastor Belga Laekenois)	\N	20.00	30.00	\N	\N	10	12	6	\N	Una de las cuatro variedades del Pastor Belga. Pelaje duro y áspero, de color leonado con sombras negras. Ágil, protector y muy trabajador.
390	1	Lancashire Heeler	\N	3.00	6.00	\N	\N	12	15	11	\N	Perro británico pequeño, de cuerpo alargado y patas cortas. Pelaje corto, liso y negro con marcas fuego. Alegre, vivaz y excelente perro de compañía.
391	1	Lebrel Escocés (Deerhound)	\N	3.00	50.00	\N	\N	8	11	2	\N	Perro cazador de ciervos, muy alto y estilizado. Pelaje áspero y duro, generalmente gris azulado. Noble, tranquilo y cariñoso.
392	1	Lobero Irlandés (Irish Wolfhound)	\N	40.00	55.00	\N	\N	6	10	1	\N	Uno de los perros más altos del mundo. Cuerpo musculoso y largo, pelaje duro y áspero en varios colores (gris, negro, atigrado, blanco). Imponente y gentil.
393	1	Lowchen (Pequeño Perro León)	\N	4.00	8.00	\N	\N	10	14	11	\N	Perro de compañía, de cuerpo compacto. Pelaje largo, ondulado y sedoso, en varios colores. Tradicionalmente se le arregla en corte tipo “león”. Cariñoso y vivaz.
394	1	Malamute de Alaska	\N	34.00	45.00	\N	\N	10	12	2	\N	Perro de trineo de gran tamaño, robusto y muy fuerte. Pelaje doble, espeso y resistente al frío, en colores gris, negro, sable o rojo con blanco. Cola peluda enroscada sobre el lomo. Amigable y trabajador.
395	1	Maltés	\N	3.00	4.00	\N	\N	12	15	11	\N	Perro de compañía elegante, de cuerpo pequeño y compacto. Pelaje largo, sedoso y blanco puro. Expresivo, vivaz y muy cariñoso.
396	1	Manchester Terrier	\N	5.00	10.00	\N	\N	14	16	11	\N	Terrier inglés ágil y atlético. Pelaje corto, liso y brillante, siempre negro con marcas fuego. Inteligente, alerta y valiente.
397	1	Mastín Inglés (Mastiff)	\N	70.00	100.00	\N	\N	6	10	1	\N	Uno de los perros más pesados del mundo. Cuerpo macizo, pecho amplio y cabeza grande. Pelaje corto en tonos leonado, atigrado o albaricoque. Protector y tranquilo.
398	1	Mastín Napolitano	\N	50.00	70.00	\N	\N	8	10	2	\N	Perro italiano muy robusto y musculoso. Piel suelta con arrugas abundantes, hocico ancho y fuerte. Pelaje corto en gris, negro, leonado o marrón. Protector y leal.
399	1	Mastín Tibetano	\N	45.00	70.00	\N	\N	10	12	2	\N	Perro guardián originario del Tíbet. De aspecto imponente con melena espesa alrededor del cuello. Pelaje largo y denso en negro, dorado o marrón. Independiente y vigilante.
400	1	Munsterlander Grande	\N	25.00	30.00	\N	\N	12	14	6	\N	Perro de caza alemán, elegante y atlético. Pelaje largo, blanco con manchas negras o hígado. Orejas largas y caídas. Excelente cobrador y muy obediente.
401	1	Pachón Navarro	\N	27.00	33.00	\N	\N	11	13	6	\N	Antigua raza española de caza. Reconocible por su característica nariz doble. Pelaje corto, generalmente blanco con manchas naranjas o marrones. Noble y trabajador.
402	1	Papillon	\N	3.00	5.00	\N	\N	13	15	11	\N	Perro de compañía francés, pequeño y refinado. Llamado “mariposa” por la forma de sus orejas grandes y erguidas. Pelaje largo y sedoso, blanco con manchas de varios colores. Alegre y cariñoso.
403	1	Parson Jack Russell Terrier	\N	6.00	8.00	\N	\N	13	15	11	\N	Terrier inglés enérgico y valiente. Cuerpo compacto, patas más largas que el Jack Russell estándar. Pelaje corto, duro o liso, predominantemente blanco con manchas negras o marrones. Muy activo y cazador nato.
404	1	Pastor Belga Groenendael	\N	25.00	35.00	\N	\N	12	14	6	\N	Una de las cuatro variedades del Pastor Belga. Pelaje largo, abundante y negro sólido. De cuerpo elegante, musculoso y ágil. Inteligente, leal y excelente guardián.
405	1	Pastor Belga Malinois	\N	25.00	30.00	\N	\N	12	14	6	\N	Pastor belga de pelo corto y duro. Pelaje leonado con máscara negra. Atlético, ágil y obediente, muy usado en labores policiales y militares.
406	1	Pastor Belga Tervueren	\N	25.00	30.00	\N	\N	12	14	6	\N	Variedad de Pastor Belga con pelaje largo, denso y de color leonado con máscara negra. Aspecto elegante, muy activo, protector y versátil.
407	1	Pastor de Anatolia (Kangal)	\N	50.00	65.00	\N	\N	10	13	2	\N	Perro guardián turco de gran tamaño y fuerza. Pelaje corto y denso, generalmente beige con máscara negra. Independiente, protector y muy leal.
408	1	Pastor de Brie (Briard)	\N	30.00	40.00	\N	\N	10	12	2	\N	Perro pastor francés de cuerpo fuerte y elegante. Pelaje largo, ondulado y áspero, en colores negro, gris o leonado. Orejas caídas y carácter leal y protector.
409	1	Pastor de los Pirineos	\N	8.00	15.00	\N	\N	12	15	13	\N	Pastor francés, ágil y vivaz. Pelaje largo o semilargo, en variedad de colores (marrón, gris, negro, leonado). Muy inteligente y trabajador.
410	1	Pastor de Maremma (Maremmano-Abruzzese)	\N	30.00	45.00	\N	\N	11	13	2	\N	Perro guardián italiano de rebaños. Pelaje largo, blanco y denso. De cuerpo fuerte y aspecto noble. Protector, valiente y fiel.
411	1	Pastor de Shetland (Shetland Sheepdog)	\N	6.00	12.00	\N	\N	12	14	13	\N	Similar al Collie pero más pequeño. Pelaje largo, espeso y abundante, en colores sable, tricolor o azul mirlo. Inteligente, muy ágil y obediente.
412	1	Pastor Ganadero Australiano (Australian Cattle Dog)	\N	18.00	25.00	\N	\N	12	15	4	\N	Perro de trabajo robusto y ágil. Pelaje corto y denso, moteado azul o rojo. Muy enérgico, leal y resistente. Excelente perro de pastoreo.
413	1	Pastor Lapon de Suecia	\N	20.00	30.00	\N	\N	12	14	4	\N	Perro nórdico de trabajo, ágil y resistente. Pelaje doble, espeso y de longitud media, en colores oscuros con marcas claras. Utilizado como perro pastor y de trineo.
445	1	Setter Escocés (Gordon Setter)	\N	25.00	36.00	\N	\N	10	12	2	\N	Perro de caza elegante y resistente. Pelaje largo y sedoso, de color negro y fuego. Cuerpo fuerte y atlético. Leal, trabajador y noble.
414	1	Bull Terrier	\N	20.00	36.00	\N	\N	11	13	4	\N	Terrier inglés de aspecto inconfundible. Cabeza ovalada en forma de “huevo”, cuerpo musculoso y compacto. Pelaje corto, en blanco sólido o con manchas de color. Valiente y enérgico.
415	1	Cane Corso (Mastín Italiano)	\N	40.00	50.00	\N	\N	9	12	2	\N	Perro italiano de guardia y compañía. Cuerpo atlético y poderoso, cabeza grande. Pelaje corto en negro, gris, leonado o atigrado. Protector, leal y seguro.
416	1	Perro de Agua Portugués	\N	16.00	25.00	\N	\N	12	14	4	\N	Perro marinero portugués, de cuerpo robusto y compacto. Pelaje rizado o ondulado, resistente al agua, en negro, blanco o marrón. Inteligente, activo y excelente nadador.
417	1	Perro del Faraón (Pharaoh Hound)	\N	20.00	25.00	\N	\N	12	14	4	\N	Antigua raza maltesa de caza. Cuerpo elegante y atlético, pelaje corto y fino color marrón rojizo. Expresivo, ágil y muy afectuoso.
418	1	Perro Finlandés de Laponia	\N	15.00	24.00	\N	\N	12	14	4	\N	Perro nórdico de pastoreo, compacto y robusto. Pelaje doble, abundante y espeso, en varios colores (negro, marrón, crema) con marcas claras. Sociable, trabajador y amistoso.
419	1	Mini Pinscher (Pinscher Miniatura)	\N	4.00	6.00	\N	\N	12	15	11	\N	Pequeño perro alemán, ágil y vivaz. Cuerpo compacto, pelaje corto y brillante en negro y fuego, chocolate o rojo. Llamado el “rey de los toys”.
420	1	Pastor Blanco Suizo	\N	25.00	40.00	\N	\N	12	14	6	\N	Variante del Pastor Alemán, de cuerpo elegante y fuerte. Pelaje blanco, largo o semilargo. Inteligente, leal y muy protector.
421	1	Pastor Catalán (Gos d’Atura Català)	\N	16.00	20.00	\N	\N	12	14	4	\N	Perro pastor rústico y ágil. Pelaje largo, ondulado y de aspecto desordenado, en tonos marrones, grises o negros. Muy activo, inteligente y trabajador.
422	1	Pastor del Cáucaso	\N	45.00	70.00	\N	\N	10	12	2	\N	Imponente perro guardián de montaña. Cuerpo robusto y fuerte, pelaje denso y largo en varios colores. Protector, independiente y valiente.
423	1	Pastor Vasco	\N	17.00	36.00	\N	\N	12	14	4	\N	Perro pastor autóctono del País Vasco. Dos variedades: Iletsua (pelaje largo y rústico) y Gorbeiakoa (pelaje corto). Colores leonados o rojizos. Muy activo, trabajador y fiel.
424	1	Pointer Inglés	\N	20.00	30.00	\N	\N	12	15	6	\N	Perro de caza británico, elegante y atlético. Cuerpo estilizado, pelaje corto y liso en colores combinados (blanco con negro, limón, hígado o naranja). Famoso por su postura de “apuntar”.
425	1	Perro Serra da Estrela (Pastor de la Sierra de Estrela)	\N	30.00	50.00	\N	\N	10	12	2	\N	Perro pastor portugués de montaña. Pelaje espeso, largo o corto, en tonos leonados, atigrados o grises. Fuerte, protector y leal.
426	1	Pinscher Alemán	\N	11.00	20.00	\N	\N	12	14	4	\N	Antecesor del Doberman y Mini Pinscher. Cuerpo compacto y musculoso, pelaje corto y brillante en negro y fuego, rojo o marrón. Valiente, ágil y vigilante.
427	1	Pitbull Terrier Americano	\N	14.00	27.00	\N	\N	12	15	4	\N	Perro musculoso y atlético. Pelaje corto y brillante, variedad de colores. Fuerte, resistente y enérgico, aunque muy afectuoso con su familia.
428	1	Podenco Canario	\N	20.00	25.00	\N	\N	11	13	4	\N	Perro de caza originario de Canarias. Cuerpo delgado y musculoso, orejas grandes y erguidas. Pelaje corto y fino, color rojizo o blanco y rojizo. Muy ágil y veloz.
429	1	Podenco Ibicenco (de pelo corto y liso)	\N	20.00	29.00	\N	\N	12	14	6	\N	Perro cazador de las Baleares. Cuerpo estilizado, orejas grandes y erguidas. Pelaje corto y duro o liso, generalmente blanco y rojizo. Veloz y elegante.
430	1	Puli Húngaro	\N	10.00	15.00	\N	\N	12	16	4	\N	Pastor húngaro de tamaño medio. Destaca por su pelaje largo en forma de cordones o rastas, que lo protege del clima. Activo, ágil y muy inteligente.
431	1	Ratonero Valenciano (Gos Rater Valencià)	\N	4.00	8.00	\N	\N	12	14	11	\N	Terrier español de cuerpo pequeño y ágil. Pelaje corto, generalmente tricolor (negro, blanco y fuego). Usado tradicionalmente para cazar roedores. Vivo y enérgico.
432	1	Pastor Alemán	\N	22.00	40.00	\N	\N	9	13	2	\N	Una de las razas más populares del mundo. Cuerpo fuerte y musculoso, pelaje doble (corto o largo), negro con fuego, sable o totalmente negro. Inteligente, leal y versátil.
433	1	Chow Chow (de pelo duro)	\N	20.00	30.00	\N	\N	9	15	6	\N	Variante del Chow Chow con pelaje más corto, áspero y denso. Apariencia robusta, con la característica lengua azulada. Independiente, digno y protector.
434	1	Retriever de Chesapeake (Chesapeake Bay Retriever)	\N	25.00	36.00	\N	\N	10	13	2	\N	Perro cobrador estadounidense, fuerte y atlético. Pelaje denso, aceitoso y rizado, en tonos marrón, juncal o paja. Excelente nadador y trabajador.
435	1	Retriever de Pelo Liso (Flat-Coated Retriever)	\N	25.00	34.00	\N	\N	10	12	2	\N	Perro cobrador inglés, de aspecto elegante y alegre. Pelaje largo, liso y brillante, generalmente negro o hígado. Muy sociable y enérgico.
436	1	Rough Collie (Pastor Escocés de Pelo Largo)	\N	18.00	29.00	\N	\N	12	14	6	\N	Famoso por la serie "Lassie". Cuerpo elegante, pelaje largo, abundante y sedoso en colores sable, tricolor o azul mirlo. Inteligente, leal y familiar.
437	1	Sabueso Bávaro de Montaña	\N	20.00	25.00	\N	\N	10	12	4	\N	Perro de rastreo alemán, de cuerpo fuerte y ágil. Pelaje corto y denso, de color rojizo o marrón. Excelente olfato, valiente y equilibrado.
438	1	Sabueso Italiano (de pelo corto y suave)	\N	18.00	28.00	\N	\N	12	14	4	\N	Sabueso de caza ágil y elegante. Pelaje corto, fino y brillante, en colores negro y fuego, leonado o rojo. Cuerpo estilizado, orejas largas y caídas. Muy resistente y con gran olfato.
439	1	Saluki (Galgo Persa)	\N	18.00	27.00	\N	\N	12	14	6	\N	Lebrel antiguo, de cuerpo delgado y elegante. Pelaje liso y sedoso con flecos en orejas, cola y patas. Colores variados (blanco, crema, dorado, negro). Veloz, refinado y noble.
440	1	San Bernardo (de pelo medio/largo)	\N	60.00	90.00	\N	\N	8	10	1	\N	Conocido perro alpino de rescate. Cuerpo imponente y musculoso, pelaje abundante y denso, blanco con manchas marrones o leonadas. Carácter noble, bondadoso y familiar.
441	1	Schnauzer Estándar	\N	14.00	20.00	\N	\N	12	14	4	\N	Terrier alemán de cuerpo robusto y ágil. Pelaje duro y áspero, barba y cejas características. Colores sal y pimienta o negro sólido. Inteligente, vigilante y activo.
442	1	Schnauzer Gigante	\N	25.00	48.00	\N	\N	10	12	2	\N	Versión más grande de la raza. Cuerpo musculoso y fuerte, pelaje duro, negro o sal y pimienta. Protector, trabajador y con gran energía. Muy usado en labores policiales.
443	1	Schnauzer Miniatura	\N	5.00	9.00	\N	\N	12	15	11	\N	Versión más pequeña del Schnauzer. Cuerpo compacto, barba y cejas características. Pelaje duro y áspero en colores sal y pimienta, negro o negro y plata. Alegre, vivaz y vigilante.
444	1	Sealyham Terrier	\N	8.00	9.00	\N	\N	12	14	11	\N	Terrier galés, de cuerpo robusto y bajo. Pelaje largo, duro y blanco, a veces con manchas en la cabeza. Valiente, independiente y con carácter fuerte.
446	1	Setter Inglés	\N	20.00	30.00	\N	\N	10	12	2	\N	Perro de muestra elegante y armonioso. Pelaje largo, sedoso y con motas (belton), en varios colores como azul, limón, hígado o naranja. Inteligente, cariñoso y ágil.
447	1	Setter Irlandés	\N	25.00	34.00	\N	\N	12	15	2	\N	Reconocible por su pelaje largo, sedoso y de color rojo caoba. Cuerpo atlético y elegante. Muy enérgico, sociable y afectuoso.
448	1	Shar Pei	\N	18.00	25.00	\N	\N	8	12	4	\N	Perro chino famoso por sus arrugas profundas y piel suelta. Hocico ancho, orejas pequeñas y pelaje corto y áspero en varios colores. Protector, independiente y leal.
449	1	Shiba Inu	\N	8.00	11.00	\N	\N	12	15	13	\N	Perro japonés compacto y ágil. Pelaje doble y denso, de color rojo, sésamo, negro y fuego o crema. Cola enroscada sobre el lomo. Valiente, independiente y fiel.
450	1	Shih Tzu	\N	4.00	8.00	\N	\N	10	16	11	\N	Perro de compañía de origen chino-tibetano. Pelaje largo, abundante y sedoso, en variedad de colores. Hocico corto, cara achatada y expresión dulce. Cariñoso y alegre.
451	1	Skye Terrier	\N	8.00	10.00	\N	\N	12	14	13	\N	Terrier escocés de cuerpo alargado y patas cortas. Pelaje largo, liso y abundante, en colores gris, negro o crema. Orejas erguidas o caídas. Fiel, valiente y reservado.
452	1	Sloughi (Galgo Árabe)	\N	20.00	30.00	\N	\N	12	14	2	\N	Lebrel africano de cuerpo delgado y elegante. Pelaje corto, fino y liso, en colores arena, rojo o crema. Veloz, noble y sensible.
453	1	Soft Coated Wheaten Terrier	\N	16.00	20.00	\N	\N	12	14	4	\N	Terrier irlandés, de cuerpo compacto y fuerte. Pelaje largo, sedoso y ondulado, de color trigo suave. Alegre, afectuoso y muy activo.
454	1	Spaniel Holandés (Kooikerhondje)	\N	9.00	11.00	\N	\N	12	14	13	\N	Perro de caza neerlandés, elegante y ágil. Pelaje medio, blanco con manchas anaranjadas y orejas con plumas negras. Sociable, alegre y trabajador.
455	1	Spinone Italiano	\N	28.00	39.00	\N	\N	12	14	2	\N	Perro de muestra italiano, robusto y atlético. Pelaje duro y áspero, en colores blanco, naranja o marrón. Con barba y cejas pobladas. Noble y versátil.
456	1	Spitz Alemán Mediano	\N	7.00	11.00	\N	\N	12	15	4	\N	Perro tipo spitz, de cuerpo compacto. Pelaje abundante y esponjoso, en varios colores. Cola curvada sobre el lomo. Muy vivaz y alerta.
457	1	Spitz Alemán Pequeño	\N	3.00	5.00	\N	\N	13	15	11	\N	Similar al mediano pero de menor tamaño. Pelaje abundante y esponjoso, en variedad de colores. Activo, vigilante y alegre.
458	1	Spitz Finlandés	\N	12.00	15.00	\N	\N	12	14	4	\N	Perro nacional de Finlandia, de cuerpo compacto y ágil. Pelaje espeso, de color rojo dorado. Orejas erguidas y cola enroscada sobre el lomo. Alegre, valiente y buen cazador.
459	1	Spitz Japonés	\N	5.00	10.00	\N	\N	12	14	13	\N	Perro de compañía elegante, similar al Samoyedo pero más pequeño. Pelaje blanco, largo y abundante. Cola enroscada y expresión vivaz. Cariñoso y fiel.
460	1	Springer Spaniel Galés	\N	16.00	20.00	\N	\N	12	15	4	\N	Spaniel de caza robusto y activo. Pelaje medio, rojo y blanco, con orejas largas y caídas. Muy sociable, alegre y enérgico.
461	1	Staffordshire Bull Terrier	\N	11.00	17.00	\N	\N	12	14	4	\N	Perro inglés de cuerpo musculoso y compacto. Pelaje corto y brillante, en varios colores. De expresión fuerte pero muy cariñoso con la familia.
462	1	Sussex Spaniel	\N	16.00	20.00	\N	\N	12	15	4	\N	Spaniel inglés bajo y robusto. Pelaje largo, ondulado y abundante, color hígado dorado. Carácter tranquilo, leal y afectuoso.
463	1	Teckel (pelo largo)	\N	7.00	15.00	\N	\N	12	16	13	\N	Perro alemán alargado y de patas cortas. Pelaje largo, liso y brillante en múltiples colores (rojo, negro y fuego, arlequín). Inteligente y curioso.
464	1	Teckel (pelo duro)	\N	7.00	15.00	\N	\N	12	16	13	\N	Variante del Teckel con pelaje duro y áspero, barba y cejas pobladas. Colores variados, muy usado en la caza. Valiente y resistente.
465	1	Teckel (pelo liso)	\N	7.00	15.00	\N	\N	12	16	13	\N	La variedad original del Teckel. Pelaje corto, denso y brillante, en rojo, negro y fuego o arlequín. De cuerpo compacto y patas cortas. Enérgico y alerta.
466	1	Teckel miniatura (pelo duro)	\N	4.00	5.00	\N	\N	12	16	11	\N	Versión más pequeña del Teckel de pelo duro. Pelaje áspero y denso, con barba y cejas. Utilizado en caza de pequeños animales. Vivo y valiente.
467	1	Teckel miniatura (pelo largo)	\N	4.00	5.00	\N	\N	12	16	11	\N	Versión miniatura del Teckel de pelo largo. Pelaje sedoso y brillante en diversos colores. Cariñoso, activo y muy apegado a su familia.
468	1	Teckel miniatura (pelo liso)	\N	4.00	5.00	\N	\N	12	16	11	\N	Versión más pequeña del Teckel de pelo corto. Cuerpo alargado y patas cortas, pelaje liso, denso y brillante en varios colores. Vivaz, curioso y afectuoso.
469	1	Terranova (Newfoundland)	\N	45.00	70.00	\N	\N	8	10	2	\N	Perro de trabajo canadiense, excelente nadador y rescatista acuático. Cuerpo grande y fuerte, pelaje largo y denso, en negro, marrón o blanco y negro. Noble, paciente y protector.
470	1	Terrier Australiano	\N	5.00	7.00	\N	\N	12	15	11	\N	Terrier robusto y ágil, de cuerpo alargado. Pelaje áspero y duro, en azul y fuego o arena. Vivo, valiente y muy leal a su familia.
471	1	Terrier Checo	\N	6.00	10.00	\N	\N	12	15	11	\N	Terrier originario de la República Checa. Cuerpo bajo y alargado, pelaje sedoso y largo, en gris azulado o marrón. Cariñoso, dócil y buen cazador.
472	1	Terrier de Airedale (Airedale Terrier)	\N	18.00	29.00	\N	\N	10	13	6	\N	El mayor de los terriers, originario de Inglaterra. Cuerpo fuerte y atlético, pelaje duro y áspero, color negro y fuego. Inteligente, valiente y protector.
473	1	Terrier de Norfolk	\N	5.00	6.00	\N	\N	12	15	11	\N	Terrier inglés de patas cortas y cuerpo compacto. Pelaje duro y áspero, en colores rojo, trigo, negro y fuego o gris. Orejas caídas. Alegre, vivaz y afectuoso.
474	1	Terrier de Norwich	\N	5.00	6.00	\N	\N	12	15	11	\N	Similar al Norfolk, pero con orejas erguidas. Pelaje áspero y duro en colores similares. Muy enérgico, curioso y sociable.
475	1	Terrier Escocés (Scottish Terrier)	\N	8.00	10.00	\N	\N	12	15	11	\N	Terrier de cuerpo bajo y robusto. Pelaje duro y áspero, generalmente negro, aunque también trigo o atigrado. Hocico largo y cejas pobladas. Valiente y leal.
476	1	Terrier Galés (Welsh Terrier)	\N	9.00	10.00	\N	\N	12	15	13	\N	Terrier británico de cuerpo compacto. Pelaje duro y áspero, color negro y fuego. Similar al Airedale pero más pequeño. Activo, valiente y juguetón.
477	1	Terrier Tibetano	\N	8.00	14.00	\N	\N	12	15	4	\N	Perro de compañía tibetano, de cuerpo fuerte y ágil. Pelaje largo, abundante y denso, en varios colores. Alegre, afectuoso y protector.
478	1	Toy Terrier Inglés (English Toy Terrier, Black & Tan)	\N	2.00	4.00	\N	\N	12	13	11	\N	Terrier miniatura inglés, elegante y ágil. Pelaje corto, liso y brillante, siempre negro y fuego. Orejas grandes y erguidas. Vivaz, leal y vigilante.
479	1	Xoloitzcuintle Mediano	\N	7.00	14.00	\N	\N	12	15	4	\N	Raza mexicana ancestral, sin pelo (aunque existe variedad con pelo corto). Piel suave y oscura, orejas grandes y erguidas. Elegante, noble y muy fiel.
1	2	Abyssinian	\N	3.00	5.00	\N	\N	12	15	4	\N	Cuerpo esbelto y musculoso, pelaje corto de color rojizo o arena con efecto “ticking”.
2	2	Aegean	\N	3.00	5.00	\N	\N	9	12	4	\N	Pelo semilargo bicolor (generalmente blanco con manchas negras o rojizas), ojos almendrados.
3	2	American Bobtail	\N	3.00	7.00	\N	\N	13	16	4	\N	Gato robusto con cola corta natural, pelaje espeso de longitud media, ojos grandes y expresivos.
4	2	American Curl	\N	2.00	5.00	\N	\N	12	16	4	\N	Reconocido por sus orejas curvadas hacia atrás, pelaje sedoso corto o largo, cuerpo esbelto.
5	2	American Shorthair	\N	3.00	7.00	\N	\N	15	20	4	\N	Cuerpo fuerte, hocico ancho, pelaje corto y denso con múltiples patrones (clásico atigrado común).
6	2	American Wirehair	\N	3.00	6.00	\N	\N	12	16	4	\N	Pelaje áspero y rizado como alambre, cuerpo robusto, ojos redondos.
7	2	Aphrodite Giant	\N	5.00	9.00	\N	\N	12	15	2	\N	Gato de cuerpo alargado, patas largas, pelaje semilargo, ojos grandes y almendrados.
8	2	Arabian Mau	\N	3.00	6.00	\N	\N	12	14	4	\N	Gato de pelaje corto y pegado al cuerpo, orejas grandes, cuerpo atlético.
9	2	Asian	\N	3.00	6.00	\N	\N	12	16	4	\N	Pelaje corto y brillante, ojos grandes dorados o verdes, cuerpo elegante parecido al birmano.
10	2	Asian Semi-longhair	\N	3.00	6.00	\N	\N	12	16	4	\N	Pelaje semilargo y sedoso, ojos expresivos, cuerpo esbelto pero musculoso.
11	2	Australian Mist	\N	3.00	6.00	\N	\N	12	16	4	\N	Pelaje corto con moteado o jaspeado, cuerpo compacto y musculoso, ojos grandes verdes.
12	2	Balinese	\N	3.00	5.00	\N	\N	12	20	4	\N	Pelaje semilargo y sedoso, cuerpo esbelto, orejas grandes, ojos azules almendrados.
13	2	Bambino	\N	2.00	4.00	\N	\N	9	13	11	\N	Cuerpo sin pelo o con poco vello (similar al Sphynx) y patas cortas tipo Munchkin.
14	2	Bengal	\N	4.00	7.00	\N	\N	12	16	4	\N	Pelaje corto con rosetas o moteado que recuerda al leopardo, cuerpo atlético.
15	2	Birman	\N	3.00	6.00	\N	\N	12	16	4	\N	Pelo semilargo, ojos azules intensos, patas blancas (“guantes”), cuerpo robusto.
16	2	Bombay	\N	3.00	6.00	\N	\N	12	16	4	\N	Pelaje corto, liso y negro brillante, ojos dorados o cobrizos grandes y redondos.
17	2	Brazilian Shorthair	\N	3.00	6.00	\N	\N	12	16	4	\N	Cuerpo flexible y atlético, pelaje corto con múltiples colores y patrones.
18	2	British Longhair	\N	4.00	8.00	\N	\N	12	16	2	\N	Pelaje largo y denso, cuerpo fornido, cara redonda y ojos grandes (cobre o dorado).
19	2	British Shorthair	\N	4.00	8.00	\N	\N	12	20	2	\N	Cuerpo robusto, pelaje corto y muy denso, cabeza ancha con ojos grandes (cobre o azul).
20	2	Burmese	\N	3.00	6.00	\N	\N	10	15	4	\N	Cuerpo compacto, pelaje corto y satinado, ojos grandes dorados o amarillos.
21	2	Burmilla	\N	3.00	6.00	\N	\N	12	15	4	\N	Pelaje corto plateado con sombras, ojos verdes expresivos, cuerpo mediano y elegante.
22	2	California Spangled	\N	3.00	7.00	\N	\N	9	13	4	\N	Pelaje corto con manchas tipo leopardo, cuerpo atlético y alargado.
23	2	Chantilly-Tiffany	\N	3.00	6.00	\N	\N	10	16	4	\N	Pelaje semilargo sedoso, usualmente marrón chocolate, ojos dorados a ámbar.
24	2	Chartreux	\N	4.00	7.00	\N	\N	10	15	4	\N	Pelaje corto y lanoso azul grisáceo, ojos anaranjados o cobrizos, cuerpo robusto.
25	2	Chausie	\N	4.00	7.00	\N	\N	12	15	2	\N	Cuerpo largo y musculoso, pelaje corto con tonos marrones o grises, orejas grandes.
26	2	Cornish Rex	\N	2.00	4.00	\N	\N	11	15	11	\N	Pelaje muy corto y rizado, cuerpo delgado y esbelto, orejas grandes y altas.
27	2	Cymric	\N	4.00	6.00	\N	\N	12	16	4	\N	Gato sin cola (variante del Manx), pelaje largo y espeso, cuerpo compacto.
28	2	Devon Rex	\N	2.00	4.00	\N	\N	9	14	11	\N	Pelaje corto y rizado, orejas muy grandes, cara triangular.
29	2	Donskoy	\N	3.00	5.00	\N	\N	12	15	4	\N	Cuerpo sin pelo o con poco vello, piel arrugada, orejas grandes.
30	2	Egyptian Mau	\N	3.00	5.00	\N	\N	13	16	4	\N	Pelaje corto plateado con manchas oscuras, cuerpo ágil y musculoso, ojos verdes.
31	2	Exotic Shorthair	\N	3.00	6.00	\N	\N	12	15	4	\N	Similar al Persa pero con pelo corto y denso, cara achatada, ojos grandes redondos.
32	2	Havana	\N	3.00	5.00	\N	\N	12	15	4	\N	Pelaje corto marrón caoba uniforme, ojos verdes almendrados.
33	2	Highlander	\N	4.00	7.00	\N	\N	10	15	2	\N	Cuerpo musculoso, orejas curvadas, cola corta, pelaje moteado o atigrado.
34	2	Himalayan	\N	3.00	6.00	\N	\N	9	15	4	\N	Pelaje largo y sedoso, cuerpo robusto, cara achatada, ojos azules intensos.
35	2	Japanese Bobtail	\N	2.00	5.00	\N	\N	10	16	11	\N	Cola corta en forma de pompón, cuerpo esbelto, pelaje corto o semilargo.
36	2	Khaomanee	\N	3.00	5.00	\N	\N	10	12	4	\N	Pelaje blanco puro, ojos de colores distintos (heterocromía frecuente).
37	2	Korat	\N	3.00	5.00	\N	\N	10	15	4	\N	Pelaje corto azul plateado, ojos grandes verdes, cuerpo compacto.
38	2	Kurilian Bobtail	\N	3.00	7.00	\N	\N	12	16	4	\N	Cola corta en forma de pompón, pelaje semilargo, cuerpo fuerte y musculoso.
39	2	LaPerm	\N	3.00	5.00	\N	\N	12	15	4	\N	Pelaje rizado y ondulado, cuerpo esbelto, orejas medianas.
40	2	Maine Coon	\N	6.00	10.00	\N	\N	12	15	2	\N	Gran tamaño, pelaje largo y espeso, orejas grandes con penachos, cuerpo musculoso.
41	2	Manx	\N	3.00	6.00	\N	\N	12	16	4	\N	Gato sin cola (o con cola muy corta), cuerpo redondeado, pelaje corto o semilargo.
42	2	Minskin	\N	2.00	4.00	\N	\N	10	12	11	\N	Cuerpo sin pelo con parches de pelaje, patas cortas tipo Munchkin.
43	2	Minuet	\N	2.00	4.00	\N	\N	9	13	11	\N	Cuerpo compacto, patas cortas, pelaje largo y denso, cara achatada.
44	2	Munchkin	\N	2.00	4.00	\N	\N	12	15	11	\N	Patas muy cortas, cuerpo alargado, pelaje corto o largo, múltiples colores.
45	2	Nebelung	\N	3.00	6.00	\N	\N	11	16	4	\N	Pelaje semilargo azul grisáceo, ojos verdes, cuerpo elegante.
46	2	Norwegian Forest	\N	4.00	9.00	\N	\N	12	16	2	\N	Pelaje semilargo espeso e impermeable, cuerpo grande y robusto, orejas con penachos.
50	2	Persian	\N	3.00	6.00	\N	\N	12	17	4	\N	Cuerpo robusto, cara achatada, ojos grandes redondos, pelaje largo y sedoso.
51	2	Peterbald	\N	3.00	6.00	\N	\N	12	15	4	\N	Gato sin pelo o con pelaje muy corto, cuerpo esbelto y orejas grandes.
52	2	Pixiebob	\N	4.00	7.00	\N	\N	13	16	2	\N	Cuerpo musculoso, pelaje corto moteado, cola corta natural.
53	2	Pixiebob Longhair	\N	4.00	7.00	\N	\N	13	16	2	\N	Similar al Pixiebob, pero con pelaje largo y espeso, cola corta natural.
54	2	Ragdoll	\N	4.00	9.00	\N	\N	12	16	2	\N	Pelaje semilargo, ojos azules intensos, cuerpo grande y robusto.
55	2	Russian Blue	\N	3.00	5.00	\N	\N	10	15	4	\N	Pelaje corto azul plateado, ojos verdes brillantes, cuerpo elegante.
56	2	Savannah	\N	5.00	9.00	\N	\N	12	20	2	\N	Cuerpo alargado, pelaje corto moteado como leopardo, orejas grandes.
57	2	Scottish Fold	\N	3.00	9.00	\N	\N	11	15	4	\N	Orejas dobladas hacia adelante, pelaje corto, cuerpo compacto.
58	2	Scottish Fold Longhair	\N	3.00	6.00	\N	\N	11	15	4	\N	Igual al Scottish Fold pero con pelaje largo y denso.
59	2	Scottish Straight	\N	3.00	6.00	\N	\N	11	15	4	\N	Orejas rectas, pelaje corto, cuerpo redondeado y compacto.
60	2	Scottish Straight Longhair	\N	3.00	6.00	\N	\N	11	15	4	\N	Igual al Scottish Straight pero con pelaje largo y sedoso.
61	2	Selkirk Rex	\N	3.00	7.00	\N	\N	12	15	4	\N	Pelaje corto rizado, cuerpo robusto, cara redondeada.
62	2	Selkirk Rex Longhair	\N	3.00	7.00	\N	\N	12	15	4	\N	Igual al Selkirk Rex pero con pelaje largo y rizado.
63	2	Serengeti	\N	4.00	7.00	\N	\N	10	12	4	\N	Cuerpo atlético, pelaje corto moteado, patas largas.
64	2	Siamese	\N	2.00	5.00	\N	\N	12	20	4	\N	Cuerpo esbelto, orejas grandes, ojos azules almendrados, pelaje corto con puntos de color.
65	2	Siberian	\N	4.00	9.00	\N	\N	12	15	2	\N	Pelaje semilargo denso, cuerpo musculoso y robusto, ojos grandes redondos.
66	2	Singapura	\N	2.00	4.00	\N	\N	11	15	11	\N	Gato de talla pequeña, pelaje corto sepia, ojos grandes y expresivos.
67	2	Snowshoe	\N	3.00	6.00	\N	\N	12	15	4	\N	Pelaje corto bicolor con patas blancas, ojos azules, cuerpo musculoso.
68	2	Somali	\N	3.00	6.00	\N	\N	12	16	4	\N	Pelaje semilargo y esponjoso, cola muy poblada, cuerpo esbelto.
69	2	Sphynx	\N	3.00	6.00	\N	\N	8	14	4	\N	Cuerpo sin pelo, piel arrugada, orejas grandes, ojos almendrados.
70	2	Tennessee Rex	\N	3.00	6.00	\N	\N	12	15	4	\N	Pelaje rizado y sedoso de colores variados, cuerpo mediano.
71	2	Tennessee Rex Shorthair	\N	3.00	6.00	\N	\N	12	15	4	\N	Similar al Tennessee Rex pero con pelaje corto rizado.
72	2	Thai	\N	3.00	5.00	\N	\N	12	16	4	\N	Similar al siamés tradicional, cuerpo robusto, ojos azules, pelaje corto.
73	2	Tonkinese	\N	3.00	5.00	\N	\N	12	16	4	\N	Cuerpo mediano, ojos azul verdoso, pelaje corto con patrón intermedio entre siamés y burmés.
74	2	Toybob	\N	2.00	4.00	\N	\N	10	14	8	\N	Gato enano, cuerpo compacto, cola corta natural, pelaje corto o semilargo.
75	2	Toyger	\N	4.00	7.00	\N	\N	12	15	4	\N	Pelaje corto con rayas tipo tigre, cuerpo musculoso y alargado.
76	2	Turkish Angora	\N	3.00	5.00	\N	\N	12	18	4	\N	Pelaje largo y sedoso, cuerpo elegante, ojos azules, verdes o dispares.
77	2	Turkish Van	\N	4.00	7.00	\N	\N	12	17	2	\N	Pelaje semilargo blanco con manchas de color en cabeza y cola, ojos azules o ámbar.
1	3	Periquitos	\N	\N	\N	15.00	18.00	10	12	\N	1	Plumaje verde brillante con máscara amarilla y manchas negras en alas.
2	3	Canarios	\N	\N	\N	13.00	13.00	9	10	\N	3	Plumaje amarillo intenso (también puede ser blanco o rojizo), cuerpo pequeño y esbelto.
3	3	Diamantes	\N	\N	\N	10.00	12.00	6	6	\N	4	Cuerpo pequeño, plumaje gris con detalles negros y naranjas en mejillas.
4	3	Agapornis	\N	\N	\N	13.00	16.00	10	15	\N	1	Plumaje colorido (verde, naranja, amarillo o azul), pico curvado fuerte.
5	3	Ninfas	\N	\N	\N	35.00	35.00	13	15	\N	6	Plumaje gris, con cara amarilla y mejillas anaranjadas, cresta erguida.
6	3	Cotorras	\N	\N	\N	25.00	35.00	15	20	\N	6	Plumaje verde brillante, pico fuerte curvado, cola larga.
7	3	Loro gris africano	\N	\N	\N	33.00	33.00	60	100	\N	6	Plumaje gris uniforme con cola roja, ojos amarillos.
8	3	Cacatúas	\N	\N	\N	40.00	60.00	48	50	\N	6	Plumaje blanco o rosado, cresta prominente y móvil, pico grande.
9	3	Guacamayo	\N	\N	\N	50.00	50.00	68	70	\N	6	Plumaje muy colorido (azul, amarillo, rojo o verde), cuerpo grande y cola larga.
10	3	Ecletus	\N	\N	\N	34.00	34.00	55	60	\N	1	Macho verde brillante, hembra roja y azul; pico anaranjado en machos.
11	3	Petirrojo	\N	\N	\N	14.00	14.00	2	3	\N	2	Plumaje marrón con pecho anaranjado-rojizo característico.
12	3	Ruiseñor	\N	\N	\N	15.00	17.00	3	5	\N	2	Plumaje marrón discreto, garganta clara; tamaño pequeño y aspecto delgado.
1	4	Iguana	\N	\N	\N	1.00	2.00	15	20	\N	4	Reptil de cuerpo alargado, piel verde con escamas, cresta dorsal y cola larga.
2	4	Gecko	\N	\N	\N	15.00	25.00	6	10	\N	4	Lagarto pequeño, cuerpo corto, dedos anchos con almohadillas adherentes, piel moteada.
3	4	Camaleón	\N	\N	\N	20.00	40.00	5	10	\N	3	Reptil con ojos móviles independientes, lengua larga extensible y piel capaz de cambiar de color.
4	4	Tortuga de agua	\N	\N	\N	15.00	30.00	20	40	\N	2	Caparazón duro ovalado, piel verdosa o marrón, patas palmeadas adaptadas a nadar.
5	4	Serpiente del maíz	\N	\N	\N	1.00	2.00	10	15	\N	4	Serpiente delgada con escamas lisas, patrón atigrado anaranjado, rojizo o marrón.
6	4	Pogonas (Dragón barbudo)	\N	\N	\N	40.00	60.00	8	12	\N	5	Lagarto robusto, cuerpo aplanado con “barba” espinosa bajo la garganta, colores arena o marrón.
7	4	Serpiente jarretera	\N	\N	\N	50.00	90.00	6	10	\N	2	Serpiente delgada, cuerpo con rayas longitudinales amarillas o verdes sobre fondo oscuro.
\.


--
-- Data for Name: cat_tamano; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cat_tamano (id_tamano, nom_tamano) FROM stdin;
1	Gigante
2	Grande
4	Mediano
6	Mediano/Grande
8	Muy pequeño
11	Pequeño
13	Pequeño/Mediano
14	Pequeño/Mediano/Grande
\.


--
-- Data for Name: cat_tipo_asentamiento; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cat_tipo_asentamiento (id_tipo_asenta, d_tipo_asenta) FROM stdin;
17	Equipamiento
12	Conjunto habitacional
4	Campamento
2	Barrio
1	Aeropuerto
10	Condominio
21	Fraccionamiento
29	Ranchería
31	Unidad habitacional
15	Ejido
28	Pueblo
34	Zona federal
37	Zona industrial
9	Colonia
\.


--
-- Data for Name: cat_tipo_patologia; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cat_tipo_patologia (id_tipo, nombre_tipo) FROM stdin;
1	Viral
2	Bacteriana
3	Parasitaria
4	Metabólica
5	Degenerativa
6	Neoplastica (Tumores)
7	Infecciosa (General)
8	Genética/Desarrollo
9	Mecánica
10	Inflamatoria
11	Congénita
12	Alérgica/Inmunológica
\.


--
-- Data for Name: cat_tratamientos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cat_tratamientos (id_tratamiento, descripcion, tipo_tratamiento) FROM stdin;
\.


--
-- Data for Name: cat_unidades_medida; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cat_unidades_medida (id_unidad_medida, nombre_unidad, id_especie, abreviatura) FROM stdin;
1	g	4	g
2	ml	4	ml
3	mg	4	mg
4	tabletas	4	tabletas
5	L	4	L
6	sobres de 12.5 g	4	sobres de 12.5 g
7	sobres de 10.22 g	4	sobres de 10.22 g
8	dosis de 1 mL	4	dosis de 1 mL
9	masa antigenica	4	masa antigenica
10	UI	4	UI
11	kg	4	kg
12	mcg	4	mcg
13	N/E	4	N/E
\.


--
-- Data for Name: cat_unidades_por_compuesto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cat_unidades_por_compuesto (id_compxu, compxu, id_especie) FROM stdin;
1	mL	3
2	g	3
3	sobre	3
4	frasco	3
5	L	3
6	tableta	3
7	dl	3
8	polvo 	3
9	500 ml	3
10	kg	3
11	100 g	3
12	N/E	3
1	mL	1
2	g	1
3	sobre	1
4	frasco	1
5	L	1
6	tableta	1
7	dl	1
8	polvo 	1
9	500 ml	1
10	kg	1
11	100 g	1
12	N/E	1
1	mL	2
2	g	2
3	sobre	2
4	frasco	2
5	L	2
6	tableta	2
7	dl	2
8	polvo 	2
9	500 ml	2
10	kg	2
11	100 g	2
12	N/E	2
\.


--
-- Data for Name: cat_vias_admin; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cat_vias_admin (id_via_administracion, nombre_via, descripcion, id_especie) FROM stdin;
8	En agua de bebida	Diluido en el agua	3
9	Inhalatoria	Administración mediante inhalación de gases o aerosoles hacia los pulmones.	1
10	Transdérmica	Absorción del medicamento a través de la piel intacta (parches o soluciones spot-on).	1
11	Tópica	Aplicación directa sobre la piel o mucosas para acción local.	1
12	Oftálmica	Aplicación en los ojos mediante gotas, pomadas o geles oftálmicos.	1
13	Otica	Aplicación en el conducto auditivo mediante gotas o soluciones óticas.	1
14	Intranasal	Administración a través de las fosas nasales, absorción por mucosa nasal.	1
15	Intratraqueal	Administración directa en la tráquea, generalmente durante intubación.	1
16	Intracameral	Inyección en la cámara anterior del ojo, entre córnea e iris.	1
17	Epidural	Inyección en el espacio epidural de la columna vertebral, para anestesia regional.	1
18	Intratecal	Inyección en el espacio subaracnoideo de la médula espinal (líquido cefalorraquídeo).	1
1	Oral	Por boca, puede ser forzada o mezclada con alimento	4
2	Intramuscular	Inyección en músculo, común en extremidades anteriores	4
3	Subcutánea	Inyección bajo la piel	4
4	Tópica	Aplicación externa sobre piel o caparazón	4
5	Intracelómica	Inyección en cavidad celómica	4
6	Oftálmica	Aplicación en ojos	4
7	Intranasal	Aplicación en fosas nasales	4
\.


--
-- Data for Name: cat_vias_transmision; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cat_vias_transmision (id_via, descripcion) FROM stdin;
\.


--
-- Data for Name: catalogo_fabricantes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.catalogo_fabricantes (id_fabricante, nombre_fabricante) FROM stdin;
900	Fabricante Genérico ICAR
\.


--
-- Data for Name: catalogo_paises; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.catalogo_paises (id_pais, nombre_pais) FROM stdin;
484	Mexico
840	Estados Unidos
8	Albania
20	Andorra
40	Austria
56	Belgica
70	Bosnia y Herzegovina
100	Bulgaria
191	Croacia
196	Chipre
203	Republica Checa
208	Dinamarca
233	Estonia
234	Islas Feroe
246	Finlandia
250	Francia
276	Alemania
292	Gibraltar
300	Grecia
336	Ciudad del Vaticano
348	Hungria
352	Islandia
372	Irlanda
380	Italia
428	Letonia
438	Liechtenstein
440	Lituania
442	Luxemburgo
470	Malta
492	Monaco
499	Montenegro
528	Paises Bajos
578	Noruega
616	Polonia
620	Portugal
642	Rumania
643	Rusia
674	San Marino
688	Serbia
703	Eslovaquia
705	Eslovenia
724	España
752	Suecia
756	Suiza
804	Ucrania
826	Reino Unido
12	Argelia
32	Argentina
44	Bahamas
52	Barbados
60	Bermuda
68	Bolivia
76	Brasil
84	Belice
90	Islas Salomon
96	Brunei
104	Myanmar
124	Canada
132	Cabo Verde
136	Islas Caiman
152	Chile
156	China
170	Colombia
188	Costa Rica
192	Cuba
212	Dominica
214	Republica Dominicana
218	Ecuador
222	El Salvador
242	Fiji
258	Polinesia Francesa
262	Yibuti
266	Gabon
268	Georgia
270	Gambia
288	Ghana
308	Granada
320	Guatemala
328	Guyana
332	Haiti
340	Honduras
344	Hong Kong
356	India
360	Indonesia
368	Irak
376	Israel
384	Costa de Marfil
388	Jamaica
392	Japon
398	Kazajstan
400	Jordania
404	Kenia
408	Corea del Norte
410	Corea del Sur
414	Kuwait
417	Kirguistan
422	Libano
426	Lesoto
434	Libia
446	Macao
458	Malasia
462	Maldivas
466	Mali
478	Mauritania
480	Mauricio
496	Mongolia
498	Moldavia
504	Marruecos
508	Mozambique
512	Oman
516	Namibia
524	Nepal
548	Vanuatu
554	Nueva Zelanda
558	Nicaragua
562	Niger
566	Nigeria
586	Pakistan
591	Panama
598	Papua Nueva Guinea
600	Paraguay
604	Peru
608	Filipinas
624	Guinea-Bissau
626	Timor Oriental
630	Puerto Rico
634	Qatar
646	Ruanda
654	Santa Elena
659	San Cristobal y Nieves
662	Santa Lucia
670	San Vicente
678	Santo Tome y Principe
682	Arabia Saudita
686	Senegal
690	Seychelles
694	Sierra Leona
702	Singapur
704	Vietnam
706	Somalia
710	Sudafrica
716	Zimbabwe
728	Sudan del Sur
729	Sudan
740	Surinam
748	Suazilandia
760	Siria
762	Tayikistan
764	Tailandia
768	Togo
772	Tokelau
776	Tonga
780	Trinidad y Tobago
784	Emiratos Arabes Unidos
788	Tunez
792	Turquia
795	Turkmenistan
798	Tuvalu
800	Uganda
807	Macedonia
818	Egipto
834	Tanzania
854	Burkina Faso
858	Uruguay
860	Uzbekistan
862	Venezuela
876	Wallis y Futuna
882	Samoa
887	Yemen
894	Zambia
\.


--
-- Data for Name: chip_identificacion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.chip_identificacion (id_chip_pk, num_chip, tipo_protocolo, id_pais, id_fabricante, id_mascota, datos_especificos) FROM stdin;
\.


--
-- Data for Name: chipavid; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.chipavid (id_animalavid, header_avid, codigo_rebano_avid, id_animal_avid, b_reservados_avid, b_control_crc_avid, b_stop_avid, b_control_adicional_avid, seguridad_avid, id_mascota_fk) FROM stdin;
\.


--
-- Data for Name: chipicar; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.chipicar (id_animalicar, header_icar, codigo_control_icar, id_animal_icar, b_reservados_icar, b_control_crc_icar, b_stop_icar, b_control_val_icar, id_mascota_fk) FROM stdin;
\.


--
-- Data for Name: chipiso; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.chipiso (id_chipiso, bitheader, pais_chipiso, identificador_animal, contador_etiquetado, info_usuario, futuro_uso, id_pais_fk, id_mascota_fk) FROM stdin;
\.


--
-- Data for Name: domicilio; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.domicilio (id_domicilio, nom_calle, num_calleint, num_calleext, cp, id_asenta) FROM stdin;
1	Av. Siempre Viva	\N	742	1000	1
2	Snads	4O	58	1080	22
\.


--
-- Data for Name: ingrediente_activo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ingrediente_activo (id_presxmed, id_comp, cantidad, id_um, id_comxu, id_especie) FROM stdin;
\.


--
-- Data for Name: instrucciones_manejo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.instrucciones_manejo (id_instruccion, id_comportamiento, instruccion) FROM stdin;
1	3	En hoteles o guarderías, permitir interacción controlada con otros perros y humanos. En clínica o estética, usar caricias suaves y reforzar conductas calmadas.
2	4	Necesita ejercicio físico frecuente y juegos para liberar energía. En clínica o estética, reducir esperas largas y proporcionar distracciones como juguetes resistentes.
3	5	Evitar manipulación brusca y entornos ruidosos. En clínicas, usar espacios tranquilos y permitir la presencia del dueño si es posible. En hoteles, ofrecer refugios seguros.
4	6	Debe manejarse con firmeza, evitando confrontaciones. En clínica o estética, utilizar bozales de seguridad y personal capacitado para manipulación.
5	7	Requiere rutinas claras y un dueño con liderazgo calmado. En hotel, mantener horarios estables de comida y paseo. En clínica, anticipar movimientos con calma.
6	8	Proporcionar paseos variados y juguetes de estimulación mental. En clínicas, permitir exploración limitada del entorno antes de manipular.
7	9	Entrenamiento constante con refuerzo positivo. En clínica o estética, facilitar manejo enseñando comandos básicos como 'quieto' o 'sentado'.
8	10	Respetar límites en caricias y manipulación. En estética, realizar cepillado progresivo y pausas si se muestra incómodo.
9	11	Mantener bajo control en paseos y en hoteles, evitar contacto con animales pequeños. Usar juegos de caza controlada para liberar instinto.
10	12	Puede ser un buen guardián, pero requiere control de ladridos. En hoteles, mantenerlo en áreas seguras para evitar sobreestimulación.
11	13	En ausencia del dueño, ofrecer juguetes interactivos y atención del personal. En estética, usar premios y contacto humano para tranquilizarlo.
12	14	No forzar socialización. En hoteles, ofrecer espacios privados. En clínica, mantener contacto mínimo y directo solo cuando sea necesario.
13	15	Manipular de manera breve y eficiente. En estética, realizar procedimientos en sesiones cortas. En casa, juegos o entrenamientos de pocos minutos.
14	16	Ideal para deportes caninos o tareas de trabajo. En hoteles, ofrecer juegos de inteligencia. En clínica, mantenerlo ocupado con distracciones.
15	17	Ofrecer un ambiente seguro, con refuerzo positivo para generar confianza. En clínicas, manipular con calma y dar pausas. En hoteles, mantener un cuidador de referencia.
16	18	Presentar nuevas personas gradualmente. En hoteles, permitir interacción controlada con el personal. En clínica, permitir que se acerque al veterinario con calma.
17	19	Preparar al perro para ausencias con rutinas de enriquecimiento ambiental. En hoteles, mantener horarios parecidos a los de casa. En clínica, minimizar tiempo lejos del dueño.
18	20	Mantenerlo lejos de ruidos fuertes (pólvora, tráfico). En clínicas, colocar en áreas silenciosas. En hoteles, ofrecer habitaciones aisladas del bullicio.
19	21	Permitir interacción frecuente con personas, caricias suaves, juegos y estímulos sociales. En un hotel o estética, dejar que explore el lugar con calma para generar confianza.
20	22	Brindar sesiones de juego con juguetes interactivos (cañas, láser, pelotas). En clínica o estética, usar técnicas de distracción con juguetes o snacks para reducir estrés.
21	23	Evitar ruidos fuertes, movimientos bruscos y exceso de manipulación. Ofrecer escondites (cajas, mantas) en hospital u hotel. Hablar con tono calmado y permitir que el gato se acerque por sí mismo.
22	24	No forzar contacto, usar guantes protectores o toallas para manipulación en clínica. Mantener separación de otros animales y permitir espacios de aislamiento.
23	25	Establecer rutinas claras (horarios de comida, espacios definidos). En estética o veterinaria, permitir que explore un poco el lugar antes de manipularlo.
24	26	Proporcionar rascadores, túneles o lugares altos. En hotel o clínica, ofrecer estímulos seguros que reduzcan el aburrimiento y permitan explorar gradualmente.
25	27	Utilizar refuerzo positivo con premios y clicker. En clínica, facilitar exámenes enseñando previamente a tolerar la manipulación de patas, boca o cuerpo.
26	28	Respetar señales (cola, orejas, bufidos). En estética, manipular suavemente y dar pausas frecuentes. Evitar caricias en zonas que no tolere (panza, cola).
27	29	Canalizar con juguetes de caza. Evitar dejarlo con aves pequeñas u otros animales vulnerables en hotel o clínica.
28	30	Introducir gradualmente a nuevos entornos. En clínica u hospital, mantenerlo en transportadora hasta estar en un espacio controlado.
29	31	Proporcionar compañía y contacto frecuente. En ausencia del dueño (hotel o clínica), compensar con juguetes y enriquecimiento ambiental.
30	32	No forzar interacción. En hotel, dar espacios altos o escondidos donde pueda descansar sin molestias.
31	33	Manipulación breve y eficiente en estética o clínica. Sesiones cortas de juego o cepillado en casa.
32	34	Ofrecer retos mentales (puzzles, juegos de comida). En hospital, mantener ocupación para reducir estrés por encierro.
33	35	Evitar cambios bruscos en entorno. En estética, trabajar con paciencia y permitir pausas para que se tranquilice.
34	36	Presentar nuevas personas de forma gradual. En hotel, dejar que se acerque cuando esté listo en vez de forzar contacto.
35	37	Preparar enriquecimiento ambiental antes de dejarlo solo (juguetes con comida, lugares altos). En hoteles, mantener rutinas parecidas a las de casa.
36	38	Mantener un ambiente tranquilo, lejos de ruidos fuertes. En clínica u hospital, colocar en un espacio aislado del bullicio.
37	39	Aves sociales (pericos, canarios) necesitan compañía, interacción con humanos o con otras aves. En hoteles, mantenerlas en jaulas cerca de otras aves para evitar soledad.
38	40	Ofrecer tiempo de vuelo controlado (en casa o aviario seguro). En clínica, manipular con movimientos suaves y rápidos para evitar estrés.
39	41	Evitar ruidos fuertes y movimientos bruscos. En clínica, cubrir la jaula con una manta ligera para dar seguridad.
40	42	No manipular sin entrenamiento previo. Usar guantes suaves en clínica. En hoteles, mantenerlas separadas de aves con temperamentos distintos.
41	43	Respetar su espacio (jaula/nido). No introducir aves nuevas de golpe en la misma jaula.
42	44	Proveer juguetes de madera, campanas o ramas naturales. En hoteles, enriquecer jaulas con columpios y perchas.
43	45	Entrenar con refuerzo positivo (premios, semillas). En clínica, facilitar revisiones enseñando a subirse a la mano o palo.
44	46	Muchas aves no disfrutan caricias. En estética (baño o corte de plumas), manipular con toallas suaves para inmovilizar sin lastimar.
45	47	Evitar ambientes con ladridos o tráfico. En hoteles, mantenerlas en áreas tranquilas y con luz natural.
46	48	Muchos reptiles no buscan contacto humano, pero toleran manipulación breve. En clínicas, manipular solo lo necesario para evitar estrés.
47	49	Pasan mucho tiempo quietos (ej. tortugas). En hoteles, asegurar espacio limpio y temperatura adecuada más que interacción.
48	50	Reptiles pueden retraerse, bufar o agitar la cola. Evitar manipulación excesiva. En clínica, manipular en superficies seguras y cálidas.
49	51	Usar guantes de seguridad si es necesario. Nunca forzar contacto. Mantener en terrarios separados en hoteles.
50	52	Reptiles suelen explorar su entorno lentamente. En casa y hoteles, ofrecer troncos, cuevas y espacios donde esconderse.
51	53	Poca tolerancia. Evitar manipulación innecesaria en estética (baños, limpieza). En clínicas, manipular con firmeza pero suavidad.
52	54	Su bienestar depende de temperatura, humedad y luz. En hoteles y clínicas, asegurar terrarios con parámetros adecuados.
53	55	No perciben sonidos como mamíferos, pero reaccionan a vibraciones. Mantener en lugares tranquilos sin sobresaltos.
\.


--
-- Data for Name: mascota; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mascota (id_mascota, nombre_mascota, id_subtipo, edad_mascota, genero_mascota, peso_mascota, esterilizado, url_foto, id_usuario_fk, edad, especie, raza, tamano, ruac, tiene_chip, foto, id_especie) FROM stdin;
\.


--
-- Data for Name: medicamentos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.medicamentos (id_med, nombre_medicamento, id_lab, id_via_admin, id_cat_med, id_especie) FROM stdin;
1	ACTUOL	1	1	1	1
2	ADENOVAC	2	4	20	1
3	ADRECAINE	3	4	10	1
4	ADVANTAGE	4	11	29	1
5	ADVANTAGE MULTI (Perros)	4	11	29	1
6	ADVANTIX	4	11	29	1
7	ALBEN MAX PUPPY	5	1	1	1
8	ALIN	2	1	3	1
9	ALIN DEPOT	2	3	3	1
10	ALIN OFTÁLMICO	2	12	17	1
11	ALIN VETERINARIO	2	3	3	1
12	ALPHACEF	6	1	2	1
13	ALVEUM	3	1	3	1
14	AMIBAC	3	1	2	1
15	AMIKAVET-PE	7	1	1	1
16	AMINOFORTE F	8	1	8	1
17	AMINO-VIT	9	1	8	1
18	AMOXAL	10	1	2	1
19	AMOXIDEX L.A.	11	1	2	1
20	AMOXIPHORTE	12	1	2	1
21	AMOXI-TABS C-250	9	1	2	1
22	AMPI ESTREP con Flumetasona	9	1	2	1
23	AMPIDON	7	1	2	1
24	AMPROX L.A.	10	1	2	1
25	ANABEN 4	14	1	8	1
26	ANALVET	15	1	3	1
27	ANAPIRO	16	1	2	1
28	ANDOBIOTIC	16	1	2	1
29	ANDOCI Fragancias	16	11	19	1
30	ANDOPIRO	16	1	2	1
31	ANDOZINE 2%	16	3	22	1
32	ANIMOX	14	1	2	1
33	ANTIHELMÍNTICO Líquido Cheminova	17	1	1	1
34	ANTIHISTAMÍNICO	18	3	9	1
35	ANTISEP OFTÁLMICO	5	12	17	1
36	AP 920	19	1	8	1
37	APODERM SPRAY	11	11	19	1
38	Ap-vax puppy	3	4	20	1
39	Ap-vax puppy plus	3	4	20	1
40	Ap-vax Q	3	4	20	1
41	Ap -vax rabia	3	4	20	1
42	ARSIL	20	3	21	1
43	ARTRODOL SUSPENSIÓN	5	1	3	1
44	ASUNTOL JABÓN	4	11	29	1
45	ATOPICA	4	1	19	1
46	AZUL PIOTÁNICO	3	11	19	1
47	BÁLSAMO BLANCO	3	11	19	1
48	BAMITOL	4	11	29	1
49	BAYCOX 5%	4	1	28	1
50	BAY-O-PET JABÓN ANTIPULGAS	4	11	29	1
51	BAYTICOL	4	11	29	1
52	BAYTRIL FLAVOUR	4	1	2	1
53	BEBIDA UNIVERSAL	3	1	21	1
54	BEBIDA UNIVERSAL CONTRA LA TOS	3	1	15	1
55	BENDAVAL PLUS	14	1	1	1
56	BENDAVAL PLUS SUSPENSIÓN	14	1	1	1
57	BENDAVAL TABLETAS	14	1	1	1
58	BENZAMIN B12	15	3	8	1
59	BIODEXAL	21	3	3	1
60	BLOCK IN PETS	5	1	25	1
61	BOLFO SHAMPOO	4	11	29	1
62	BOLFO TALCO	4	11	29	1
63	BOVI-LEPTO	2	4	20	1
64	BOVITRAZ 12,5%	4	11	29	1
65	BRAVO	14	11	29	1
66	BRAVO JABÓN	14	11	29	1
67	BRAVO SHAMPOO	14	11	29	1
68	BRAVO SPRAY	14	11	29	1
69	BROMEXIN	22	3	15	1
70	BRONQUIFUR	23	3	15	1
71	BRONYL	22	3	15	1
72	BROXACINA	4	1	2	1
73	CALCIO VITAMINADO	3	1	8	1
74	CALCIOAMINOVIT	3	1	8	1
75	CALCIPROTEIN FUERTE	3	1	8	1
76	CALCIPROTEIN VITAMINADO	3	1	8	1
77	CALCIPROTEIN VITAMINADO Rx	3	1	8	1
78	CALCISEHY	24	1	8	1
79	CALDEX F.M. VITAMINADO Y PROTEINIZADO	24	1	8	1
80	CALFODEX NEGRO	24	1	8	1
81	CALFÓN FUERTE	24	1	8	1
82	CALPHORTE	24	1	8	1
83	CANI-PV	25	4	20	1
84	CANI-PV-CORONA	25	4	20	1
85	CANI-RAB-V.I.	25	4	20	1
86	CANI-TABS BRAIN & NEURO	26	1	8	1
87	CANI-TABS CALMING + RELAX	26	1	22	1
88	CANI-TABS DAILY MULTI ADULT	26	1	8	1
89	CANI-TABS DAILY MULTI PUPPY	26	1	8	1
90	CANI-TABS DAILY MULTI SENIOR	26	1	8	1
91	CANI-TABS DIGESTIVE+	26	1	14	1
92	CANI-TABS HEALTHY BONES CA+P	26	1	8	1
93	CANI-TABS LIVER+	26	1	8	1
94	CANI-TABS OMEGA 3+EPA & DHA	26	1	8	1
95	CANI-TABS REPRO +	26	1	8	1
96	CANI-TABS SKIN + COAT	26	1	19	1
97	CANVITAL	27	1	8	1
98	CARPROBAY	27	1	3	1
99	CARPRODYL 100	27	1	3	1
100	CARPRODYL 25	27	1	3	1
101	CATOSAL	4	3	8	1
102	CEFALMED-10	14	1	2	1
103	CEFALMED-30	14	1	2	1
104	CEFALOX PETS	4	1	2	1
105	CEFTIOVET RTU	4	3	2	1
106	CEFURIN PET 150	4	1	2	1
107	CEFURIN PET 300	4	1	2	1
108	CEFURIN PET 600	4	1	2	1
109	CEFURIN PET SUSPENSIÓN	4	1	2	1
110	CINETIC FLEX 3% / CINETIC FLEX 6%	15	3	3	1
111	CIPIONATO SANFER	11	3	14	1
112	CLAVAM SUSPENSIÓN	4	1	2	1
113	CLAVOXIVET	4	1	2	1
114	CLAXIN	4	1	2	1
115	CLAXIN-10	4	1	2	1
116	CLAXIN-30	4	1	2	1
117	CLINDACIN 10	4	1	2	1
118	CLINDACIN 30	4	1	2	1
119	CLINDAMICINA	17	1	2	1
120	CLINDAMICINA CHEMINOVA	17	1	2	1
121	CLORHEXIN GEL	17	11	11	1
122	CLORHEXIN JABÓN	17	11	11	1
123	CLORHEXIN SPRAY	17	11	11	1
124	CLOSANTIL 5% SOL. INY.	18	3	1	1
125	COCCIMED-10	4	1	1	1
126	COCCIMED-5	4	1	1	1
127	COCCIPLAN PE	7	1	1	1
128	COMBATICK	4	11	29	1
129	COMPLEJO B CON HÍGADO	3	1	8	1
130	COMPLEJO B EXTRA	3	1	8	1
131	COMPLEJO B REFORZADO	3	1	8	1
132	CRAYÓN ANDOCI	16	11	29	1
133	CREMA DON RICARDO PLUS	14	11	19	1
134	CRONVAL HD 1.25 / CRONVAL HD 5	15	1	12	1
135	CRYPTOFIN	19	1	1	1
136	CYCLOSUPRIM	4	1	2	1
137	CYCLOSUPRIM OFTÁLMICO	4	12	17	1
138	DAMAX INYECTABLE	11	3	3	1
139	DERMISAN SHAMPOO	11	11	19	1
140	DERMISAN SPRAY	11	11	19	1
141	DEXA-ESTREPTOVET	14	3	2	1
142	DEXAFIORIN	14	3	3	1
143	DEXAFLAM	14	3	3	1
144	DEXAMETASONA INYECTABLE ARANDA	3	3	3	1
145	DEXAMOX L.A.	4	3	2	1
146	DEX-HIDRO-VIT	3	3	8	1
147	DEXTRIMAZOL	3	11	5	1
148	DEXVET S.B.	3	3	3	1
149	DIANABOL	3	1	21	1
150	DIANABOL MASCOTA	3	1	21	1
151	DIANABOL TABLETAS	3	1	21	1
152	DIARREFIN	3	1	25	1
153	DICLOFEN (oftálmica)	3	12	17	1
154	DICLOFEN (inyectable)	3	3	3	1
155	DICLOFEN TABLETAS	3	1	3	1
156	DIFENPET	3	1	3	1
157	DIPIRONA CHEMINOVA	17	3	3	1
158	DIPROFENID	11	3	3	1
159	DIRO PETS (tabletas)	4	1	1	1
160	DIRO PETS (inyectable)	4	3	1	1
161	DIURAVET	4	3	16	1
162	DIURÉTICO INYECTABLE CHEMINOVA	17	3	16	1
163	DIURIDE 500	3	1	16	1
164	DIURVET	3	3	16	1
165	DOBLEVAC -PC	4	4	20	1
166	DOLORVET	4	1	3	1
167	DOLO-VET OFTÁLMICO	4	12	17	1
168	DOLO-VET ÓTICO	4	13	18	1
169	DOLO-VET TABLETAS	4	1	3	1
170	DOXICICLINA	17	1	2	1
171	DOXIMED-10	4	1	2	1
172	DOXIMED-30	4	1	2	1
173	DOXMAS 100 y 200	4	1	2	1
174	DRONTAL PLUS + SABOR	4	1	1	1
175	DRONTAL PUPPY	4	1	1	1
176	DURALÁGRIMA	4	12	17	1
177	DYSCURAL	4	3	16	1
178	DYSCURAL PVE	4	3	16	1
179	DYSCURAL VET	4	3	16	1
180	ECTOSOL JABÓN	4	11	29	1
181	ECTOSOL SHAMPOO	18	11	29	1
182	EDEMOFIN	11	3	3	1
183	ELECTRÓLITOS	3	1	27	1
184	ELECTROPET	22	1	27	1
185	EMETIN INYECTABLE	14	3	1	1
186	EMETIN ORAL	3	1	1	1
187	EMETRON	6	1	24	1
188	ENDOVET -CES INYECTABLE	15	3	1	1
189	ENDOVET -CES TABLETAS	15	1	1	1
190	ENDOVET CREMA	15	11	19	1
191	ENDOVET TABLETAS	15	1	1	1
192	ENROCILINA	4	3	2	1
193	ENROFLOX 20 L.A.	4	3	2	1
194	ENROFLOX M L.A.	4	3	2	1
195	ENROFLOXACINA 10% SANFER	11	3	2	1
196	ENROFLOXACINO 10% CHEMINOVA	17	3	2	1
197	ENROL 150	11	1	2	1
198	ENROL CON DIPIRONA	11	3	3	1
199	ENROL TABLETAS	11	1	2	1
200	ENROL TABLETAS CON DIPIRONA	11	1	3	1
201	ENROQUE	4	1	2	1
202	ENROQUE AVES	4	1	2	1
203	ENROXAL 150 SUSPENSIÓN	4	1	2	1
204	ENROXAL 50 SUSPENSIÓN	4	1	2	1
205	ENROXIL	4	1	2	1
206	ENROXOL	4	1	2	1
207	ENROXTAL	4	1	2	1
208	ENTEREX	3	1	14	1
209	EPIC SHAMPOO	11	11	19	1
210	EPILEPXIS	3	1	23	1
211	ESCUDERM	11	11	19	1
212	ESPASMOSEDAL	3	3	14	1
213	ESPENFORT	3	3	8	1
214	ESTREPTOGANABENCIL	4	3	2	1
215	ETI PETS	4	1	8	1
216	EUGASTRIL	3	1	14	1
217	EURICAN PNEUMO	4	4	20	1
218	EUYACOL FORTE	3	1	15	1
219	EXPECTORANTE BRONCODILATADOR	3	1	15	1
220	FENIBAC	4	1	2	1
221	FETOL	3	3	13	1
222	FETOL PLUS	3	3	13	1
223	FH-10 FACTOR HEPÁTICO 10	3	3	8	1
224	FIBROCINE	3	3	3	1
225	FIORALGESÍN	23	1	3	1
226	FIORI ESTREPTOENZIM	23	3	2	1
227	FIOTRYL	23	3	2	1
228	FIOTRYL	23	3	2	1
229	FIPROMED	13	11	29	1
230	FIPROMED FORTE	13	11	29	1
231	FIPROMED SPRAY	13	11	29	1
232	FIPRONEX G5 DROP ON	4	11	29	1
233	FIPRONEX G5 SPRAY	4	11	29	1
234	FIPROTECT	4	11	29	1
235	FLORFENICOL 30	3	3	2	1
236	FLOXAPANA	11	3	2	1
237	FLOXAPANA 10%	11	3	2	1
238	FLUBIOPEN	11	3	2	1
239	FLUMEXIN VET	4	3	3	1
240	FLUNIDOL	4	3	3	1
241	FLUNIXIN SANFER	11	3	3	1
242	FLUVIOTIC	4	3	2	1
243	FLUXYMEG PANAVET	9	3	3	1
244	FORENZIM	9	3	3	1
245	FORESTRO	4	11	29	1
246	FORMIZINA 5,000,000 U.I.	11	3	2	1
247	FORTABOL	3	1	8	1
248	FORTE JABÓN	3	11	19	1
249	FORTE SPRAY	3	11	19	1
250	FOSFONOVA + B12	11	3	8	1
251	FOSFOVIT B12	11	3	8	1
252	FRONTLINE PLUS	4	11	29	1
253	FRONTLINE TOP SPOT	4	11	29	1
254	FULLTRUST ADULTO	3	1	8	1
255	FULLTRUST ADULTO ATÚN Y CÍTRICOS	3	1	8	1
256	FULLTRUST ADULTO CORDERO, AVENA Y ARROZ	3	1	8	1
257	FULLTRUST ADULTO HÍGADO Y CHÍCHAROS	3	1	8	1
258	FULLTRUST ADULTO PATO Y PIÑA	3	1	8	1
259	FULLTRUST ADULTO PAVO Y ARÁNDANOS	3	1	8	1
260	FULLTRUST ADULTO RAZAS PEQUEÑAS	3	1	8	1
261	FULLTRUST ADULTO SALMÓN Y TOMILLO	3	1	8	1
262	FULLTRUST CACHORRO	3	1	8	1
263	FULLTRUST CACHORRO RAZAS PEQUEÑAS	3	1	8	1
264	FULLTRUST PESO IDEAL	3	1	8	1
265	FULLTRUST SENIOR	3	1	8	1
266	FUNGUS-K CHEMINOVA	17	11	5	1
267	GASTRO BALANCE CHEMINOVA	17	3	14	1
268	GASTROPET	3	1	14	1
269	GENOVIT 6500	3	3	8	1
270	GENTACYN 150	4	3	2	1
271	GENTALEN 100	4	3	2	1
272	GENTAM-F	4	11	5	1
273	GENTAVET 50	4	3	2	1
274	GENTEX	4	3	2	1
275	GENTOFTAL- OFTÁLMICO	4	12	17	1
276	GLUTAMINA	3	1	8	1
277	GLUTICORT T	3	3	3	1
278	GLUTICORT VET	3	3	3	1
279	GONAFORTE 2,500 U.I.	3	3	13	1
280	GOTIKALL	13	12	17	1
281	GOTIKAS	13	12	17	1
282	GRAMICIDIN	11	12	17	1
283	GRINOLON	3	3	2	1
284	GRINOLON	3	3	2	1
285	HALFIN	14	1	3	1
286	HEARTGARD PLUS	4	1	1	1
287	HEMATOFOS B12	3	3	8	1
288	HEMOPLEX	3	3	8	1
289	HEMOSTOP K	3	3	26	1
290	HEMOSYLAT	3	3	26	1
291	HEPATO-JECT	3	3	30	1
292	HEPATOPETS	3	1	30	1
293	HEPAVIT	3	1	30	1
294	HERISAN	3	3	2	1
295	HIDRA-PETS	3	1	27	1
296	HIPOXITOCINA	3	3	13	1
297	HISTAFIN	3	3	9	1
298	HYDRA PETS	3	1	27	1
299	IDÓL	4	1	2	1
300	ILCOCÍN L.A.	4	3	2	1
301	ILCOCÍN-R	4	3	2	1
302	IMIDOCARB SANFER	11	3	1	1
303	IMIDOFIN INYECTABLE	11	3	1	1
304	IMIDOFIN TABLETAS	11	1	1	1
305	IMIDOX 120	11	3	1	1
306	IMIDOZOL	11	3	1	1
307	IMMITICIDE	27	3	1	1
308	IMRAB 3 TF	4	4	20	1
309	INMUC-PARVO	4	4	20	1
310	INMUC-RAB	4	4	20	1
311	ITRASEK	4	1	5	1
312	IVERFULL TABS FOR PETS (10kg)	4	1	1	1
313	JABÓN ANTIPULGAS	4	11	29	1
314	JABÓN RIN TIN TIN	4	11	29	1
315	JABÓN SCABISIN	4	11	29	1
316	KAOFIORÍN	3	3	14	1
317	KAOPHORTE	3	3	14	1
318	KEOSUL	3	3	14	1
319	KETODERM SPRAY	4	11	19	1
320	KILTIX	4	11	29	1
321	KINODYL SE	3	1	8	1
322	KOAGUSAN	3	3	26	1
323	KOAGUSAN	3	3	26	1
324	KOPTIN S	3	3	2	1
325	KORTEBA	3	3	3	1
326	LACTOCIN 20	3	3	14	1
327	LASARNOL	3	3	1	1
328	LEGEND	3	3	20	1
329	LEIDOFS	3	3	2	1
330	LEIDOFS SOLUCIÓN	3	11	2	1
331	LEVAGUARD	3	3	20	1
332	LEVIVET	3	3	1	1
333	LEVIVET ORAL	3	1	1	1
334	LEVIVET-10	3	1	1	1
335	LEVIVET-30	3	1	1	1
336	LIMPER SHAMPOO	4	11	29	1
337	LINCOMICINA + ESPECTINOMICINA	4	3	2	1
338	LOCIÓN ANTIVERRUGAS	3	11	19	1
339	LODYVET	3	3	2	1
340	LOMBRIN	4	1	1	1
341	LOPATOL	4	1	1	1
342	LOPATOL POUR-ON	4	11	29	1
343	LOPATOL TALISMÁN	4	11	29	1
344	LUXEN	4	1	2	1
345	MELODEX	4	3	3	1
346	MELODEX PETS 0.5%	4	3	3	1
347	MELOXICAM	4	3	3	1
348	MELOXIPAR 5 mg	4	1	3	1
349	MEPRAZOLIC	4	3	14	1
350	METACAM 0.5%	4	3	3	1
351	METACAM SUSPENSIÓN ORAL	4	1	3	1
352	METRONID	4	1	2	1
353	METRONID IV	4	3	2	1
354	METROXAL SUSPENSIÓN XL	4	1	2	1
355	MICOFIN 1%	17	11	5	1
356	MICOFIN TABLETAS	17	1	5	1
357	MIDOXAL	4	1	2	1
358	MIDOXAL SUSPENSIÓN	4	1	2	1
359	MIRA ADULTOS	3	1	8	1
360	MIRA CACHORROS	3	1	8	1
361	MODIVITASAN	3	3	8	1
362	MORDIX	3	3	3	1
363	MUCODILAT	3	3	15	1
364	MULTIVIT-B	3	3	8	1
365	MYCOGAL INYECTABLE	17	3	5	1
366	NECAIN (oftálmica)	17	12	17	1
367	NECAIN (ótica)	17	13	18	1
368	NEGASUNT AEROSOL	4	11	19	1
369	NEGASUNT POLVO	4	11	19	1
370	NEOSIN-T	4	3	2	1
371	NEPTRA	4	13	18	1
372	NEUMOXOL	4	3	2	1
373	NEUTRAC INYECTABLE	3	3	27	1
374	NEUTRAC ORAL	3	1	27	1
375	NEUTRAC TABLETAS	3	1	27	1
376	NEXGARD	4	1	29	1
377	NEXGARD SPECTRA	4	1	29	1
378	NOWORM	4	1	1	1
379	NUTRIVIT GEL	3	1	8	1
380	NUTROMIX SKIN + COAT	3	1	19	1
381	OBRYVET	11	3	3	1
382	OCUSOL POLVO	3	12	17	1
383	OFTALUB	3	12	17	1
384	OFTOCIP	4	12	17	1
385	OFTOFLOX	4	12	17	1
386	OLEOVET	3	11	19	1
387	OMEPRA	3	1	14	1
388	ONSEC TABLETAS	3	1	3	1
389	ONSIOR	4	1	3	1
390	OPTHAVET	4	12	17	1
391	OPTIGEN	3	3	8	1
392	OTIDERMA-CEF	4	13	18	1
393	OTISAN	4	13	18	1
394	OXANTEL 6	4	1	1	1
395	OXIMA	4	1	1	1
396	OXITOCÍN	3	3	13	1
397	OXITOCINA INYECTABLE CHEMINOVA	17	3	13	1
398	PARAFEN SUSPENSIÓN AL 3%	3	1	3	1
399	PARAFEN TABS	3	1	3	1
400	PARASTIN BIG DOG	4	1	1	1
401	PARASTIN DOG	4	1	1	1
402	PARASTIN DOGGY	4	1	1	1
403	PARASTIN PUPPY	4	1	1	1
404	PARFOSAL	3	3	14	1
405	PAROL	3	1	3	1
406	PAROL T PLUS	3	1	3	1
407	PARTARGET	3	3	14	1
408	PELO BRILLANTE	3	1	19	1
409	PEN DUO STREP 250/201	4	3	2	1
410	PENICILINA ACUOSA	4	3	2	1
411	PENIMOX L.A.	4	3	2	1
412	PERVINAL JARABE	3	1	15	1
413	PETONIC RECUPERATION	3	1	8	1
414	PIRODEX GEL	3	11	19	1
415	PIROXICAM-81	3	1	3	1
416	PISAN N.F.	3	3	2	1
417	PLASMOGAN RTU	4	3	2	1
418	POLIVIT B12 + ADE	3	3	8	1
419	POMADA VERDE	3	11	19	1
420	POMADA YODADA	3	11	19	1
421	POMADA YODADA	3	11	19	1
422	POMADA YODADA	3	11	19	1
423	POMADA YODOFORMADA	3	11	19	1
424	POXINA FORTE	4	13	18	1
425	PRADOL SUSPENSIÓN	3	1	3	1
426	PREDOFTAL	4	12	17	1
427	PREGABALYN-11	3	1	23	1
428	PREGABALYN-31	3	1	23	1
429	PREGABALYN-6	3	1	23	1
430	PREVICOX	4	1	3	1
431	PRIMACORT	3	3	3	1
432	PRIMAPEN	4	3	2	1
433	PRINCIPIO OXITÓCICO	3	3	13	1
434	PROCAVETS 300 LA	3	3	2	1
435	PROGESTERONA	3	3	13	1
436	PROGESTERONA INYECTABLE CHEMINOVA	17	3	13	1
437	PROLONG-CEF	4	3	2	1
438	PROMOFER	3	3	8	1
439	PRONTAFORMO BOLOS ORALES	3	1	1	1
440	PRONTAFORMO UTERINO	3	3	1	1
441	PUPPYPARVO-DHP	4	4	20	1
442	RAN-TAC	3	1	14	1
443	RECOMBITEK C4	4	4	20	1
444	RECOMBITEK C5	4	4	20	1
445	RECOMBITEK C4/CV	4	4	20	1
446	RECOMBITEK C7	4	4	20	1
447	RECOMBITEK C6/CV	4	4	20	1
448	RECOMBITEK C8	4	4	20	1
449	RECOMBITEK C9	4	4	20	1
450	RECOMBITEK ORAL BORDETELLA	4	4	20	1
451	RESPAIRE TABLETAS	3	1	15	1
452	RESPAIRE TABLETAS	3	1	15	1
453	RESPIPET	3	3	15	1
454	RESPIREN	3	3	15	1
455	RESPIVET	3	3	15	1
456	RESULVET TABLETAS	3	1	15	1
457	REUGOL	3	3	13	1
458	REUGOL	3	3	13	1
459	REVETCICLINA F	3	3	2	1
460	RIN TIN TIN BAÑO EN SECO	4	11	19	1
461	RIN TIN TIN JABÓN INSECTICIDA	4	11	29	1
462	RIN TIN TIN SHAMPOO	4	11	29	1
463	ROMPUN	4	3	10	1
464	RUILAND VETRI OMEGA	3	3	8	1
465	RUILAND VETRI-GERIAPET	3	3	8	1
466	RUILAND-VETRI ARTROFLEX	3	3	8	1
467	RUILAND-VETRI CAp	3	3	8	1
468	RUILAND-VETRI COFACTOR	3	3	8	1
469	SANA SANA GEL	3	11	19	1
470	SANITOR FORTE	3	1	2	1
471	SANITOR FORTE	3	1	2	1
472	SCABISIN	4	11	29	1
473	SCABISIN CALM	4	11	29	1
474	SCABISIN CLEAR	4	11	29	1
475	SCABISIN FRESH	4	11	29	1
476	SCABISIN FUNGI	4	11	29	1
477	SCABISIN NEUTRO JABÓN	4	11	29	1
478	SCABISIN SHAMPOO	4	11	29	1
479	SCABISIN SPOT ON	4	11	29	1
480	SEDALGESIC	3	3	3	1
481	SEDALPHORTE	3	3	3	1
482	SEDOZOO HERBAL JOJOBA	3	11	19	1
483	SEDOZOO HERBAL MANZANILLA	3	11	19	1
484	SEDOZOO HERBAL ROMERO	3	11	19	1
485	SEDOZOO SHAMPOO	3	11	19	1
486	SEDOZOO SHAMPOO	3	11	19	1
487	SEHYTIOFUR	24	3	2	1
488	SENCOX 2.5%	1	3	1	1
489	SENCOX 5%	1	3	1	1
490	SENSIBLEX	3	1	15	1
491	SENTOPRIM-S	3	3	2	1
492	SERESTO	4	11	29	1
493	SEVERIN NFS	3	3	2	1
494	SEVERIN NFT	3	3	2	1
495	SHAMPOO ANTIPULGAS	4	11	29	1
496	SHAMPOO ANTIPULGAS	4	11	29	1
497	SHAMPOO DE ZÁBILA PARA CABALLO	3	11	19	1
498	SHAMPOO DE ZÁBILA PARA CABALLO	3	11	19	1
499	SHAMPOO EN SECO	3	11	19	1
500	SHAMPOO URUS	3	11	19	1
501	SHAMPOOS POCKET	3	11	19	1
502	SILDAN HP	3	3	12	1
503	SILDAN HP	3	3	12	1
504	SULFABAC	3	3	2	1
505	SULFAPRIM	3	3	2	1
506	SULFATRIM	3	3	2	1
507	SULFAXAL	3	3	2	1
508	SyBAVIT	3	3	8	1
509	SYNALAR NEO	3	11	5	1
510	TALCO ANTIPULGAS	4	11	29	1
511	TEAR FUNCTION CHEMINOVA	17	12	17	1
512	TERZOO JABÓN	3	11	19	1
513	TERZOO SHAMPOO	3	11	19	1
514	TETRACEF	3	3	2	1
515	TOLTRASEHY	24	3	1	1
516	TOMO	3	1	14	1
517	TOMO MASCOTAS	3	1	14	1
518	TOPIVET	3	11	19	1
519	TOXISORB CLASSIC	3	3	14	1
520	TOXISORB PLUS	3	3	14	1
521	TOXISORB PREMIUM	3	3	14	1
522	TRAFULL	3	1	3	1
523	TRIOXIL	4	11	29	1
524	TRIOXIL	4	11	29	1
525	TROPIGENOL	3	3	8	1
526	TROPIGENOL	3	3	8	1
527	UBRICINA	3	3	2	1
528	UBRICINA	3	3	2	1
529	UNGÜENTO AMARILLO	3	11	19	1
530	UNGÜENTO VETERINARIO DE LA TÍA	3	11	19	1
531	uniRapix	3	1	1	1
532	UROSEMID	3	3	16	1
533	VACUFIVE 5V	4	4	20	1
534	VACUGEN 6L	4	4	20	1
535	VAREC POMADA	3	11	19	1
536	VEMINTHOL	3	1	1	1
537	VENTRIX SUSPENSIÓN	3	1	15	1
538	VERMICELL	3	1	1	1
539	VERMICELL PLUS	3	1	1	1
540	VERMICELL TABLETAS	3	1	1	1
541	VETCITRO	3	11	19	1
542	VETCITRO	3	11	19	1
543	VETERIBAC MASCOTAS	3	3	2	1
544	VETERIBAC MASCOTAS GEL	3	11	2	1
545	VETISUL	3	3	2	1
546	VETMEDIN	4	1	12	1
547	VETMEDIN 1.25 mg	4	1	12	1
548	VETRACINA SUSPENSIÓN	4	1	2	1
549	VETRIDERM ESSEC ESPUMA SECA	3	11	19	1
550	VETRIDERM JABÓN DERMATOLÓGICO	3	11	19	1
551	VETRIDERM OTO	3	13	18	1
552	VETRIDERM SHAMPOO	3	11	19	1
553	VIDA-FIORI	23	3	8	1
554	VIGANTOL ADE FUERTE	3	3	8	1
555	VIOGEL	3	11	19	1
556	VIRUSTAD	3	3	6	1
557	VITAFORT ADE+B	3	3	8	1
558	VITAFORT-H	3	3	8	1
559	VITA-JOINT PET	3	1	8	1
560	VITALEX PETS	3	1	8	1
561	VITAMINA ADE	3	3	8	1
562	VITAMINA B12 5500	3	3	8	1
563	VITAMINA C	3	3	8	1
564	VITAMINA NEGRA	3	3	8	1
565	VITAMINAS + CARNITINA	3	3	8	1
566	VITANHEGRA B12	3	3	8	1
567	VITAPET-PHORTE	3	1	8	1
568	VITARÉ	3	1	8	1
569	VITARÉ OMG	3	1	8	1
570	VITASEHY PET	24	3	8	1
571	XILAZINA AL 10%	3	3	10	1
572	XILAZINA INYECTABLE ARANDA	3	3	10	1
573	XILOCAM	3	3	10	1
574	XILOCAM GOTAS	3	12	17	1
575	YODO DESINFECTANTE	3	3	11	1
576	ZENLAVET 10%	3	3	2	1
577	ZENLAVET 2%	3	3	2	1
578	ZEOLEX EXTRA	3	3	14	1
579	ZEOTEK	3	3	14	1
580	ZINPAR	3	3	1	1
581	ZINPAR PIPETAS	3	11	29	1
582	ZINPAR PRO	3	11	29	1
583	ZINPAR PRO	3	11	29	1
584	ZONAVET	3	3	2	1
585	ZOPOL GRIN	3	3	2	1
586	ZURI-COX 5%	3	3	3	1
1	ACTUOL	1	1	1	2
2	ADENOVAC	2	4	20	2
3	ADRECAINE	3	4	10	2
4	ADVANTAGE	4	11	29	2
5	ADVANTAGE MULTI (Perros)	4	11	29	2
6	ADVANTIX	4	11	29	2
7	ALBEN MAX PUPPY	5	1	1	2
8	ALIN	2	1	3	2
9	ALIN DEPOT	2	3	3	2
10	ALIN OFTÁLMICO	2	12	17	2
11	ALIN VETERINARIO	2	3	3	2
12	ALPHACEF	6	1	2	2
13	ALVEUM	3	1	3	2
14	AMIBAC	3	1	2	2
15	AMIKAVET-PE	7	1	1	2
16	AMINOFORTE F	8	1	8	2
17	AMINO-VIT	9	1	8	2
18	AMOXAL	10	1	2	2
19	AMOXIDEX L.A.	11	1	2	2
20	AMOXIPHORTE	12	1	2	2
21	AMOXI-TABS C-250	9	1	2	2
22	AMPI ESTREP con Flumetasona	9	1	2	2
23	AMPIDON	7	1	2	2
24	AMPROX L.A.	10	1	2	2
25	ANABEN 4	14	1	8	2
26	ANALVET	15	1	3	2
27	ANAPIRO	16	1	2	2
28	ANDOBIOTIC	16	1	2	2
29	ANDOCI Fragancias	16	11	19	2
30	ANDOPIRO	16	1	2	2
31	ANDOZINE 2%	16	3	22	2
32	ANIMOX	14	1	2	2
33	ANTIHELMÍNTICO Líquido Cheminova	17	1	1	2
34	ANTIHISTAMÍNICO	18	3	9	2
35	ANTISEP OFTÁLMICO	5	12	17	2
36	AP 920	19	1	8	2
37	APODERM SPRAY	11	11	19	2
38	Ap-vax puppy	3	4	20	2
39	Ap-vax puppy plus	3	4	20	2
40	Ap-vax Q	3	4	20	2
41	Ap -vax rabia	3	4	20	2
42	ARSIL	20	3	21	2
43	ARTRODOL SUSPENSIÓN	5	1	3	2
44	ASUNTOL JABÓN	4	11	29	2
45	ATOPICA	4	1	19	2
46	AZUL PIOTÁNICO	3	11	19	2
47	BÁLSAMO BLANCO	3	11	19	2
48	BAMITOL	4	11	29	2
49	BAYCOX 5%	4	1	28	2
50	BAY-O-PET JABÓN ANTIPULGAS	4	11	29	2
51	BAYTICOL	4	11	29	2
52	BAYTRIL FLAVOUR	4	1	2	2
53	BEBIDA UNIVERSAL	3	1	21	2
54	BEBIDA UNIVERSAL CONTRA LA TOS	3	1	15	2
55	BENDAVAL PLUS	14	1	1	2
56	BENDAVAL PLUS SUSPENSIÓN	14	1	1	2
57	BENDAVAL TABLETAS	14	1	1	2
58	BENZAMIN B12	15	3	8	2
59	BIODEXAL	21	3	3	2
60	BLOCK IN PETS	5	1	25	2
61	BOLFO SHAMPOO	4	11	29	2
62	BOLFO TALCO	4	11	29	2
63	BOVI-LEPTO	2	4	20	2
64	BOVITRAZ 12,5%	4	11	29	2
65	BRAVO	14	11	29	2
66	BRAVO JABÓN	14	11	29	2
67	BRAVO SHAMPOO	14	11	29	2
68	BRAVO SPRAY	14	11	29	2
69	BROMEXIN	22	3	15	2
70	BRONQUIFUR	23	3	15	2
71	BRONYL	22	3	15	2
72	BROXACINA	4	1	2	2
73	CALCIO VITAMINADO	3	1	8	2
74	CALCIOAMINOVIT	3	1	8	2
75	CALCIPROTEIN FUERTE	3	1	8	2
76	CALCIPROTEIN VITAMINADO	3	1	8	2
77	CALCIPROTEIN VITAMINADO Rx	3	1	8	2
78	CALCISEHY	24	1	8	2
79	CALDEX F.M. VITAMINADO Y PROTEINIZADO	24	1	8	2
80	CALFODEX NEGRO	24	1	8	2
81	CALFÓN FUERTE	24	1	8	2
82	CALPHORTE	24	1	8	2
83	CANI-PV	25	4	20	2
84	CANI-PV-CORONA	25	4	20	2
85	CANI-RAB-V.I.	25	4	20	2
86	CANI-TABS BRAIN & NEURO	26	1	8	2
87	CANI-TABS CALMING + RELAX	26	1	22	2
88	CANI-TABS DAILY MULTI ADULT	26	1	8	2
89	CANI-TABS DAILY MULTI PUPPY	26	1	8	2
90	CANI-TABS DAILY MULTI SENIOR	26	1	8	2
91	CANI-TABS DIGESTIVE+	26	1	14	2
92	CANI-TABS HEALTHY BONES CA+P	26	1	8	2
93	CANI-TABS LIVER+	26	1	8	2
94	CANI-TABS OMEGA 3+EPA & DHA	26	1	8	2
95	CANI-TABS REPRO +	26	1	8	2
96	CANI-TABS SKIN + COAT	26	1	19	2
97	CANVITAL	27	1	8	2
98	CARPROBAY	27	1	3	2
99	CARPRODYL 100	27	1	3	2
100	CARPRODYL 25	27	1	3	2
101	CATOSAL	4	3	8	2
102	CEFALMED-10	14	1	2	2
103	CEFALMED-30	14	1	2	2
104	CEFALOX PETS	4	1	2	2
105	CEFTIOVET RTU	4	3	2	2
106	CEFURIN PET 150	4	1	2	2
107	CEFURIN PET 300	4	1	2	2
108	CEFURIN PET 600	4	1	2	2
109	CEFURIN PET SUSPENSIÓN	4	1	2	2
110	CINETIC FLEX 3% / CINETIC FLEX 6%	15	3	3	2
111	CIPIONATO SANFER	11	3	14	2
112	CLAVAM SUSPENSIÓN	4	1	2	2
113	CLAVOXIVET	4	1	2	2
114	CLAXIN	4	1	2	2
115	CLAXIN-10	4	1	2	2
116	CLAXIN-30	4	1	2	2
117	CLINDACIN 10	4	1	2	2
118	CLINDACIN 30	4	1	2	2
119	CLINDAMICINA	17	1	2	2
120	CLINDAMICINA CHEMINOVA	17	1	2	2
121	CLORHEXIN GEL	17	11	11	2
122	CLORHEXIN JABÓN	17	11	11	2
123	CLORHEXIN SPRAY	17	11	11	2
124	CLOSANTIL 5% SOL. INY.	18	3	1	2
125	COCCIMED-10	4	1	1	2
126	COCCIMED-5	4	1	1	2
127	COCCIPLAN PE	7	1	1	2
128	COMBATICK	4	11	29	2
129	COMPLEJO B CON HÍGADO	3	1	8	2
130	COMPLEJO B EXTRA	3	1	8	2
131	COMPLEJO B REFORZADO	3	1	8	2
132	CRAYÓN ANDOCI	16	11	29	2
133	CREMA DON RICARDO PLUS	14	11	19	2
134	CRONVAL HD 1.25 / CRONVAL HD 5	15	1	12	2
135	CRYPTOFIN	19	1	1	2
136	CYCLOSUPRIM	4	1	2	2
137	CYCLOSUPRIM OFTÁLMICO	4	12	17	2
138	DAMAX INYECTABLE	11	3	3	2
139	DERMISAN SHAMPOO	11	11	19	2
140	DERMISAN SPRAY	11	11	19	2
141	DEXA-ESTREPTOVET	14	3	2	2
142	DEXAFIORIN	14	3	3	2
143	DEXAFLAM	14	3	3	2
144	DEXAMETASONA INYECTABLE ARANDA	3	3	3	2
145	DEXAMOX L.A.	4	3	2	2
146	DEX-HIDRO-VIT	3	3	8	2
147	DEXTRIMAZOL	3	11	5	2
148	DEXVET S.B.	3	3	3	2
149	DIANABOL	3	1	21	2
150	DIANABOL MASCOTA	3	1	21	2
151	DIANABOL TABLETAS	3	1	21	2
152	DIARREFIN	3	1	25	2
153	DICLOFEN (oftálmica)	3	12	17	2
154	DICLOFEN (inyectable)	3	3	3	2
155	DICLOFEN TABLETAS	3	1	3	2
156	DIFENPET	3	1	3	2
157	DIPIRONA CHEMINOVA	17	3	3	2
158	DIPROFENID	11	3	3	2
159	DIRO PETS (tabletas)	4	1	1	2
160	DIRO PETS (inyectable)	4	3	1	2
161	DIURAVET	4	3	16	2
162	DIURÉTICO INYECTABLE CHEMINOVA	17	3	16	2
163	DIURIDE 500	3	1	16	2
164	DIURVET	3	3	16	2
165	DOBLEVAC -PC	4	4	20	2
166	DOLORVET	4	1	3	2
167	DOLO-VET OFTÁLMICO	4	12	17	2
168	DOLO-VET ÓTICO	4	13	18	2
169	DOLO-VET TABLETAS	4	1	3	2
170	DOXICICLINA	17	1	2	2
171	DOXIMED-10	4	1	2	2
172	DOXIMED-30	4	1	2	2
173	DOXMAS 100 y 200	4	1	2	2
174	DRONTAL PLUS + SABOR	4	1	1	2
175	DRONTAL PUPPY	4	1	1	2
176	DURALÁGRIMA	4	12	17	2
177	DYSCURAL	4	3	16	2
178	DYSCURAL PVE	4	3	16	2
179	DYSCURAL VET	4	3	16	2
180	ECTOSOL JABÓN	4	11	29	2
181	ECTOSOL SHAMPOO	18	11	29	2
182	EDEMOFIN	11	3	3	2
183	ELECTRÓLITOS	3	1	27	2
184	ELECTROPET	22	1	27	2
185	EMETIN INYECTABLE	14	3	1	2
186	EMETIN ORAL	3	1	1	2
187	EMETRON	6	1	24	2
188	ENDOVET -CES INYECTABLE	15	3	1	2
189	ENDOVET -CES TABLETAS	15	1	1	2
190	ENDOVET CREMA	15	11	19	2
191	ENDOVET TABLETAS	15	1	1	2
192	ENROCILINA	4	3	2	2
193	ENROFLOX 20 L.A.	4	3	2	2
194	ENROFLOX M L.A.	4	3	2	2
195	ENROFLOXACINA 10% SANFER	11	3	2	2
196	ENROFLOXACINO 10% CHEMINOVA	17	3	2	2
197	ENROL 150	11	1	2	2
198	ENROL CON DIPIRONA	11	3	3	2
199	ENROL TABLETAS	11	1	2	2
200	ENROL TABLETAS CON DIPIRONA	11	1	3	2
201	ENROQUE	4	1	2	2
202	ENROQUE AVES	4	1	2	2
203	ENROXAL 150 SUSPENSIÓN	4	1	2	2
204	ENROXAL 50 SUSPENSIÓN	4	1	2	2
205	ENROXIL	4	1	2	2
206	ENROXOL	4	1	2	2
207	ENROXTAL	4	1	2	2
208	ENTEREX	3	1	14	2
209	EPIC SHAMPOO	11	11	19	2
210	EPILEPXIS	3	1	23	2
211	ESCUDERM	11	11	19	2
212	ESPASMOSEDAL	3	3	14	2
213	ESPENFORT	3	3	8	2
214	ESTREPTOGANABENCIL	4	3	2	2
215	ETI PETS	4	1	8	2
216	EUGASTRIL	3	1	14	2
217	EURICAN PNEUMO	4	4	20	2
218	EUYACOL FORTE	3	1	15	2
219	EXPECTORANTE BRONCODILATADOR	3	1	15	2
220	FENIBAC	4	1	2	2
221	FETOL	3	3	13	2
222	FETOL PLUS	3	3	13	2
223	FH-10 FACTOR HEPÁTICO 10	3	3	8	2
224	FIBROCINE	3	3	3	2
225	FIORALGESÍN	23	1	3	2
226	FIORI ESTREPTOENZIM	23	3	2	2
227	FIOTRYL	23	3	2	2
228	FIOTRYL	23	3	2	2
229	FIPROMED	13	11	29	2
230	FIPROMED FORTE	13	11	29	2
231	FIPROMED SPRAY	13	11	29	2
232	FIPRONEX G5 DROP ON	4	11	29	2
233	FIPRONEX G5 SPRAY	4	11	29	2
234	FIPROTECT	4	11	29	2
235	FLORFENICOL 30	3	3	2	2
236	FLOXAPANA	11	3	2	2
237	FLOXAPANA 10%	11	3	2	2
238	FLUBIOPEN	11	3	2	2
239	FLUMEXIN VET	4	3	3	2
240	FLUNIDOL	4	3	3	2
241	FLUNIXIN SANFER	11	3	3	2
242	FLUVIOTIC	4	3	2	2
243	FLUXYMEG PANAVET	9	3	3	2
244	FORENZIM	9	3	3	2
245	FORESTRO	4	11	29	2
246	FORMIZINA 5,000,000 U.I.	11	3	2	2
247	FORTABOL	3	1	8	2
248	FORTE JABÓN	3	11	19	2
249	FORTE SPRAY	3	11	19	2
250	FOSFONOVA + B12	11	3	8	2
251	FOSFOVIT B12	11	3	8	2
252	FRONTLINE PLUS	4	11	29	2
253	FRONTLINE TOP SPOT	4	11	29	2
254	FULLTRUST ADULTO	3	1	8	2
255	FULLTRUST ADULTO ATÚN Y CÍTRICOS	3	1	8	2
256	FULLTRUST ADULTO CORDERO, AVENA Y ARROZ	3	1	8	2
257	FULLTRUST ADULTO HÍGADO Y CHÍCHAROS	3	1	8	2
258	FULLTRUST ADULTO PATO Y PIÑA	3	1	8	2
259	FULLTRUST ADULTO PAVO Y ARÁNDANOS	3	1	8	2
260	FULLTRUST ADULTO RAZAS PEQUEÑAS	3	1	8	2
261	FULLTRUST ADULTO SALMÓN Y TOMILLO	3	1	8	2
262	FULLTRUST CACHORRO	3	1	8	2
263	FULLTRUST CACHORRO RAZAS PEQUEÑAS	3	1	8	2
264	FULLTRUST PESO IDEAL	3	1	8	2
265	FULLTRUST SENIOR	3	1	8	2
266	FUNGUS-K CHEMINOVA	17	11	5	2
267	GASTRO BALANCE CHEMINOVA	17	3	14	2
268	GASTROPET	3	1	14	2
269	GENOVIT 6500	3	3	8	2
270	GENTACYN 150	4	3	2	2
271	GENTALEN 100	4	3	2	2
272	GENTAM-F	4	11	5	2
273	GENTAVET 50	4	3	2	2
274	GENTEX	4	3	2	2
275	GENTOFTAL- OFTÁLMICO	4	12	17	2
276	GLUTAMINA	3	1	8	2
277	GLUTICORT T	3	3	3	2
278	GLUTICORT VET	3	3	3	2
279	GONAFORTE 2,500 U.I.	3	3	13	2
280	GOTIKALL	13	12	17	2
281	GOTIKAS	13	12	17	2
282	GRAMICIDIN	11	12	17	2
283	GRINOLON	3	3	2	2
284	GRINOLON	3	3	2	2
285	HALFIN	14	1	3	2
286	HEARTGARD PLUS	4	1	1	2
287	HEMATOFOS B12	3	3	8	2
288	HEMOPLEX	3	3	8	2
289	HEMOSTOP K	3	3	26	2
290	HEMOSYLAT	3	3	26	2
291	HEPATO-JECT	3	3	30	2
292	HEPATOPETS	3	1	30	2
293	HEPAVIT	3	1	30	2
294	HERISAN	3	3	2	2
295	HIDRA-PETS	3	1	27	2
296	HIPOXITOCINA	3	3	13	2
297	HISTAFIN	3	3	9	2
298	HYDRA PETS	3	1	27	2
299	IDÓL	4	1	2	2
300	ILCOCÍN L.A.	4	3	2	2
301	ILCOCÍN-R	4	3	2	2
302	IMIDOCARB SANFER	11	3	1	2
303	IMIDOFIN INYECTABLE	11	3	1	2
304	IMIDOFIN TABLETAS	11	1	1	2
305	IMIDOX 120	11	3	1	2
306	IMIDOZOL	11	3	1	2
307	IMMITICIDE	27	3	1	2
308	IMRAB 3 TF	4	4	20	2
309	INMUC-PARVO	4	4	20	2
310	INMUC-RAB	4	4	20	2
311	ITRASEK	4	1	5	2
312	IVERFULL TABS FOR PETS (10kg)	4	1	1	2
313	JABÓN ANTIPULGAS	4	11	29	2
314	JABÓN RIN TIN TIN	4	11	29	2
315	JABÓN SCABISIN	4	11	29	2
316	KAOFIORÍN	3	3	14	2
317	KAOPHORTE	3	3	14	2
318	KEOSUL	3	3	14	2
319	KETODERM SPRAY	4	11	19	2
320	KILTIX	4	11	29	2
321	KINODYL SE	3	1	8	2
322	KOAGUSAN	3	3	26	2
323	KOAGUSAN	3	3	26	2
324	KOPTIN S	3	3	2	2
325	KORTEBA	3	3	3	2
326	LACTOCIN 20	3	3	14	2
327	LASARNOL	3	3	1	2
328	LEGEND	3	3	20	2
329	LEIDOFS	3	3	2	2
330	LEIDOFS SOLUCIÓN	3	11	2	2
331	LEVAGUARD	3	3	20	2
332	LEVIVET	3	3	1	2
333	LEVIVET ORAL	3	1	1	2
334	LEVIVET-10	3	1	1	2
335	LEVIVET-30	3	1	1	2
336	LIMPER SHAMPOO	4	11	29	2
337	LINCOMICINA + ESPECTINOMICINA	4	3	2	2
338	LOCIÓN ANTIVERRUGAS	3	11	19	2
339	LODYVET	3	3	2	2
340	LOMBRIN	4	1	1	2
341	LOPATOL	4	1	1	2
342	LOPATOL POUR-ON	4	11	29	2
343	LOPATOL TALISMÁN	4	11	29	2
344	LUXEN	4	1	2	2
345	MELODEX	4	3	3	2
346	MELODEX PETS 0.5%	4	3	3	2
347	MELOXICAM	4	3	3	2
348	MELOXIPAR 5 mg	4	1	3	2
349	MEPRAZOLIC	4	3	14	2
350	METACAM 0.5%	4	3	3	2
351	METACAM SUSPENSIÓN ORAL	4	1	3	2
352	METRONID	4	1	2	2
353	METRONID IV	4	3	2	2
354	METROXAL SUSPENSIÓN XL	4	1	2	2
355	MICOFIN 1%	17	11	5	2
356	MICOFIN TABLETAS	17	1	5	2
357	MIDOXAL	4	1	2	2
358	MIDOXAL SUSPENSIÓN	4	1	2	2
359	MIRA ADULTOS	3	1	8	2
360	MIRA CACHORROS	3	1	8	2
361	MODIVITASAN	3	3	8	2
362	MORDIX	3	3	3	2
363	MUCODILAT	3	3	15	2
364	MULTIVIT-B	3	3	8	2
365	MYCOGAL INYECTABLE	17	3	5	2
366	NECAIN (oftálmica)	17	12	17	2
367	NECAIN (ótica)	17	13	18	2
368	NEGASUNT AEROSOL	4	11	19	2
369	NEGASUNT POLVO	4	11	19	2
370	NEOSIN-T	4	3	2	2
371	NEPTRA	4	13	18	2
372	NEUMOXOL	4	3	2	2
373	NEUTRAC INYECTABLE	3	3	27	2
374	NEUTRAC ORAL	3	1	27	2
375	NEUTRAC TABLETAS	3	1	27	2
376	NEXGARD	4	1	29	2
377	NEXGARD SPECTRA	4	1	29	2
378	NOWORM	4	1	1	2
379	NUTRIVIT GEL	3	1	8	2
380	NUTROMIX SKIN + COAT	3	1	19	2
381	OBRYVET	11	3	3	2
382	OCUSOL POLVO	3	12	17	2
383	OFTALUB	3	12	17	2
384	OFTOCIP	4	12	17	2
385	OFTOFLOX	4	12	17	2
386	OLEOVET	3	11	19	2
387	OMEPRA	3	1	14	2
388	ONSEC TABLETAS	3	1	3	2
389	ONSIOR	4	1	3	2
390	OPTHAVET	4	12	17	2
391	OPTIGEN	3	3	8	2
392	OTIDERMA-CEF	4	13	18	2
393	OTISAN	4	13	18	2
394	OXANTEL 6	4	1	1	2
395	OXIMA	4	1	1	2
396	OXITOCÍN	3	3	13	2
397	OXITOCINA INYECTABLE CHEMINOVA	17	3	13	2
398	PARAFEN SUSPENSIÓN AL 3%	3	1	3	2
399	PARAFEN TABS	3	1	3	2
400	PARASTIN BIG DOG	4	1	1	2
401	PARASTIN DOG	4	1	1	2
402	PARASTIN DOGGY	4	1	1	2
403	PARASTIN PUPPY	4	1	1	2
404	PARFOSAL	3	3	14	2
405	PAROL	3	1	3	2
406	PAROL T PLUS	3	1	3	2
407	PARTARGET	3	3	14	2
408	PELO BRILLANTE	3	1	19	2
409	PEN DUO STREP 250/201	4	3	2	2
410	PENICILINA ACUOSA	4	3	2	2
411	PENIMOX L.A.	4	3	2	2
412	PERVINAL JARABE	3	1	15	2
413	PETONIC RECUPERATION	3	1	8	2
414	PIRODEX GEL	3	11	19	2
415	PIROXICAM-81	3	1	3	2
416	PISAN N.F.	3	3	2	2
417	PLASMOGAN RTU	4	3	2	2
418	POLIVIT B12 + ADE	3	3	8	2
419	POMADA VERDE	3	11	19	2
420	POMADA YODADA	3	11	19	2
421	POMADA YODADA	3	11	19	2
422	POMADA YODADA	3	11	19	2
423	POMADA YODOFORMADA	3	11	19	2
424	POXINA FORTE	4	13	18	2
425	PRADOL SUSPENSIÓN	3	1	3	2
426	PREDOFTAL	4	12	17	2
427	PREGABALYN-11	3	1	23	2
428	PREGABALYN-31	3	1	23	2
429	PREGABALYN-6	3	1	23	2
430	PREVICOX	4	1	3	2
431	PRIMACORT	3	3	3	2
432	PRIMAPEN	4	3	2	2
433	PRINCIPIO OXITÓCICO	3	3	13	2
434	PROCAVETS 300 LA	3	3	2	2
435	PROGESTERONA	3	3	13	2
436	PROGESTERONA INYECTABLE CHEMINOVA	17	3	13	2
437	PROLONG-CEF	4	3	2	2
438	PROMOFER	3	3	8	2
439	PRONTAFORMO BOLOS ORALES	3	1	1	2
440	PRONTAFORMO UTERINO	3	3	1	2
441	PUPPYPARVO-DHP	4	4	20	2
442	RAN-TAC	3	1	14	2
443	RECOMBITEK C4	4	4	20	2
444	RECOMBITEK C5	4	4	20	2
445	RECOMBITEK C4/CV	4	4	20	2
446	RECOMBITEK C7	4	4	20	2
447	RECOMBITEK C6/CV	4	4	20	2
448	RECOMBITEK C8	4	4	20	2
449	RECOMBITEK C9	4	4	20	2
450	RECOMBITEK ORAL BORDETELLA	4	4	20	2
451	RESPAIRE TABLETAS	3	1	15	2
452	RESPAIRE TABLETAS	3	1	15	2
453	RESPIPET	3	3	15	2
454	RESPIREN	3	3	15	2
455	RESPIVET	3	3	15	2
456	RESULVET TABLETAS	3	1	15	2
457	REUGOL	3	3	13	2
458	REUGOL	3	3	13	2
459	REVETCICLINA F	3	3	2	2
460	RIN TIN TIN BAÑO EN SECO	4	11	19	2
461	RIN TIN TIN JABÓN INSECTICIDA	4	11	29	2
462	RIN TIN TIN SHAMPOO	4	11	29	2
463	ROMPUN	4	3	10	2
464	RUILAND VETRI OMEGA	3	3	8	2
465	RUILAND VETRI-GERIAPET	3	3	8	2
466	RUILAND-VETRI ARTROFLEX	3	3	8	2
467	RUILAND-VETRI CAp	3	3	8	2
468	RUILAND-VETRI COFACTOR	3	3	8	2
469	SANA SANA GEL	3	11	19	2
470	SANITOR FORTE	3	1	2	2
471	SANITOR FORTE	3	1	2	2
472	SCABISIN	4	11	29	2
473	SCABISIN CALM	4	11	29	2
474	SCABISIN CLEAR	4	11	29	2
475	SCABISIN FRESH	4	11	29	2
476	SCABISIN FUNGI	4	11	29	2
477	SCABISIN NEUTRO JABÓN	4	11	29	2
478	SCABISIN SHAMPOO	4	11	29	2
479	SCABISIN SPOT ON	4	11	29	2
480	SEDALGESIC	3	3	3	2
481	SEDALPHORTE	3	3	3	2
482	SEDOZOO HERBAL JOJOBA	3	11	19	2
483	SEDOZOO HERBAL MANZANILLA	3	11	19	2
484	SEDOZOO HERBAL ROMERO	3	11	19	2
485	SEDOZOO SHAMPOO	3	11	19	2
486	SEDOZOO SHAMPOO	3	11	19	2
487	SEHYTIOFUR	24	3	2	2
488	SENCOX 2.5%	1	3	1	2
489	SENCOX 5%	1	3	1	2
490	SENSIBLEX	3	1	15	2
491	SENTOPRIM-S	3	3	2	2
492	SERESTO	4	11	29	2
493	SEVERIN NFS	3	3	2	2
494	SEVERIN NFT	3	3	2	2
495	SHAMPOO ANTIPULGAS	4	11	29	2
496	SHAMPOO ANTIPULGAS	4	11	29	2
497	SHAMPOO DE ZÁBILA PARA CABALLO	3	11	19	2
498	SHAMPOO DE ZÁBILA PARA CABALLO	3	11	19	2
499	SHAMPOO EN SECO	3	11	19	2
500	SHAMPOO URUS	3	11	19	2
501	SHAMPOOS POCKET	3	11	19	2
502	SILDAN HP	3	3	12	2
503	SILDAN HP	3	3	12	2
504	SULFABAC	3	3	2	2
505	SULFAPRIM	3	3	2	2
506	SULFATRIM	3	3	2	2
507	SULFAXAL	3	3	2	2
508	SyBAVIT	3	3	8	2
509	SYNALAR NEO	3	11	5	2
510	TALCO ANTIPULGAS	4	11	29	2
511	TEAR FUNCTION CHEMINOVA	17	12	17	2
512	TERZOO JABÓN	3	11	19	2
513	TERZOO SHAMPOO	3	11	19	2
514	TETRACEF	3	3	2	2
515	TOLTRASEHY	24	3	1	2
516	TOMO	3	1	14	2
517	TOMO MASCOTAS	3	1	14	2
518	TOPIVET	3	11	19	2
519	TOXISORB CLASSIC	3	3	14	2
520	TOXISORB PLUS	3	3	14	2
521	TOXISORB PREMIUM	3	3	14	2
522	TRAFULL	3	1	3	2
523	TRIOXIL	4	11	29	2
524	TRIOXIL	4	11	29	2
525	TROPIGENOL	3	3	8	2
526	TROPIGENOL	3	3	8	2
527	UBRICINA	3	3	2	2
528	UBRICINA	3	3	2	2
529	UNGÜENTO AMARILLO	3	11	19	2
530	UNGÜENTO VETERINARIO DE LA TÍA	3	11	19	2
531	uniRapix	3	1	1	2
532	UROSEMID	3	3	16	2
533	VACUFIVE 5V	4	4	20	2
534	VACUGEN 6L	4	4	20	2
535	VAREC POMADA	3	11	19	2
536	VEMINTHOL	3	1	1	2
537	VENTRIX SUSPENSIÓN	3	1	15	2
538	VERMICELL	3	1	1	2
539	VERMICELL PLUS	3	1	1	2
540	VERMICELL TABLETAS	3	1	1	2
541	VETCITRO	3	11	19	2
542	VETCITRO	3	11	19	2
543	VETERIBAC MASCOTAS	3	3	2	2
544	VETERIBAC MASCOTAS GEL	3	11	2	2
545	VETISUL	3	3	2	2
546	VETMEDIN	4	1	12	2
547	VETMEDIN 1.25 mg	4	1	12	2
548	VETRACINA SUSPENSIÓN	4	1	2	2
549	VETRIDERM ESSEC ESPUMA SECA	3	11	19	2
550	VETRIDERM JABÓN DERMATOLÓGICO	3	11	19	2
551	VETRIDERM OTO	3	13	18	2
552	VETRIDERM SHAMPOO	3	11	19	2
553	VIDA-FIORI	23	3	8	2
554	VIGANTOL ADE FUERTE	3	3	8	2
555	VIOGEL	3	11	19	2
556	VIRUSTAD	3	3	6	2
557	VITAFORT ADE+B	3	3	8	2
558	VITAFORT-H	3	3	8	2
559	VITA-JOINT PET	3	1	8	2
560	VITALEX PETS	3	1	8	2
561	VITAMINA ADE	3	3	8	2
562	VITAMINA B12 5500	3	3	8	2
563	VITAMINA C	3	3	8	2
564	VITAMINA NEGRA	3	3	8	2
565	VITAMINAS + CARNITINA	3	3	8	2
566	VITANHEGRA B12	3	3	8	2
567	VITAPET-PHORTE	3	1	8	2
568	VITARÉ	3	1	8	2
569	VITARÉ OMG	3	1	8	2
570	VITASEHY PET	24	3	8	2
571	XILAZINA AL 10%	3	3	10	2
572	XILAZINA INYECTABLE ARANDA	3	3	10	2
573	XILOCAM	3	3	10	2
574	XILOCAM GOTAS	3	12	17	2
575	YODO DESINFECTANTE	3	3	11	2
576	ZENLAVET 10%	3	3	2	2
577	ZENLAVET 2%	3	3	2	2
578	ZEOLEX EXTRA	3	3	14	2
579	ZEOTEK	3	3	14	2
580	ZINPAR	3	3	1	2
581	ZINPAR PIPETAS	3	11	29	2
582	ZINPAR PRO	3	11	29	2
583	ZINPAR PRO	3	11	29	2
584	ZONAVET	3	3	2	2
585	ZOPOL GRIN	3	3	2	2
586	ZURI-COX 5%	3	3	3	2
1	Enrofloxacina	\N	\N	\N	4
2	Amoxicilina	\N	\N	\N	4
3	Ceftazidima	\N	\N	\N	4
4	Gentamicina	\N	\N	\N	4
5	Doxiciclina	\N	\N	\N	4
6	Marbofloxacina	\N	\N	\N	4
7	Azitromicina	\N	\N	\N	4
8	Cefalexina	\N	\N	\N	4
9	Cloranfenicol	\N	\N	\N	4
10	Trimetoprima-Sulfametoxazol	\N	\N	\N	4
11	Ciprofloxacina	\N	\N	\N	4
12	Ampicilina	\N	\N	\N	4
13	Tetraciclina	\N	\N	\N	4
14	Neomicina	\N	\N	\N	4
15	Claritromicina	\N	\N	\N	4
16	Fenbendazol	\N	\N	\N	4
17	Ivermectina	\N	\N	\N	4
18	Praziquantel	\N	\N	\N	4
19	Metronidazol	\N	\N	\N	4
20	Albendazol	\N	\N	\N	4
21	Pirantel	\N	\N	\N	4
22	Levamisol	\N	\N	\N	4
23	Mebendazol	\N	\N	\N	4
24	Piperazina	\N	\N	\N	4
25	Nitazoxanida	\N	\N	\N	4
26	Tiabendazol	\N	\N	\N	4
27	Oxfendazol	\N	\N	\N	4
28	Multivitamínico	\N	\N	\N	4
29	Vitamina A	\N	\N	\N	4
30	Vitamina D3	\N	\N	\N	4
31	Vitamina E	\N	\N	\N	4
32	Vitamina K	\N	\N	\N	4
33	Complejo B	\N	\N	\N	4
34	Vitamina C	\N	\N	\N	4
35	Biotina	\N	\N	\N	4
36	Meloxicam	\N	\N	\N	4
37	Carprofeno	\N	\N	\N	4
38	Ketoprofeno	\N	\N	\N	4
39	Flunixina	\N	\N	\N	4
40	Piroxicam	\N	\N	\N	4
41	Dexametasona	\N	\N	\N	4
42	Prednisolona	\N	\N	\N	4
43	Diclofenaco	\N	\N	\N	4
44	Clotrimazol	\N	\N	\N	4
45	Ketoconazol	\N	\N	\N	4
46	Itraconazol	\N	\N	\N	4
47	Fluconazol	\N	\N	\N	4
48	Miconazol	\N	\N	\N	4
49	Terbinafina	\N	\N	\N	4
50	Nistatina	\N	\N	\N	4
51	Gluconato de Calcio	\N	\N	\N	4
52	Calcitriol	\N	\N	\N	4
53	Oxitocina	\N	\N	\N	4
54	Atropina	\N	\N	\N	4
55	Butorfanol	\N	\N	\N	4
56	Tramadol	\N	\N	\N	4
57	Omeprazol	\N	\N	\N	4
58	Ranitidina	\N	\N	\N	4
59	Metoclopramida	\N	\N	\N	4
60	Lactulosa	\N	\N	\N	4
61	Silimarina	\N	\N	\N	4
62	Ácido Ascórbico	\N	\N	\N	4
63	Enrofloxacina	\N	\N	\N	4
64	Amoxicilina	\N	\N	\N	4
65	Ceftazidima	\N	\N	\N	4
66	Gentamicina	\N	\N	\N	4
67	Doxiciclina	\N	\N	\N	4
68	Marbofloxacina	\N	\N	\N	4
69	Azitromicina	\N	\N	\N	4
70	Cefalexina	\N	\N	\N	4
71	Cloranfenicol	\N	\N	\N	4
72	Trimetoprima-Sulfametoxazol	\N	\N	\N	4
73	Ciprofloxacina	\N	\N	\N	4
74	Ampicilina	\N	\N	\N	4
75	Tetraciclina	\N	\N	\N	4
76	Neomicina	\N	\N	\N	4
77	Claritromicina	\N	\N	\N	4
78	Fenbendazol	\N	\N	\N	4
79	Ivermectina	\N	\N	\N	4
80	Praziquantel	\N	\N	\N	4
81	Metronidazol	\N	\N	\N	4
82	Albendazol	\N	\N	\N	4
83	Pirantel	\N	\N	\N	4
84	Levamisol	\N	\N	\N	4
85	Mebendazol	\N	\N	\N	4
86	Piperazina	\N	\N	\N	4
87	Nitazoxanida	\N	\N	\N	4
88	Tiabendazol	\N	\N	\N	4
89	Oxfendazol	\N	\N	\N	4
90	Multivitamínico	\N	\N	\N	4
91	Vitamina A	\N	\N	\N	4
92	Vitamina D3	\N	\N	\N	4
93	Vitamina E	\N	\N	\N	4
94	Vitamina K	\N	\N	\N	4
95	Complejo B	\N	\N	\N	4
96	Vitamina C	\N	\N	\N	4
97	Biotina	\N	\N	\N	4
98	Meloxicam	\N	\N	\N	4
99	Carprofeno	\N	\N	\N	4
100	Ketoprofeno	\N	\N	\N	4
101	Flunixina	\N	\N	\N	4
102	Piroxicam	\N	\N	\N	4
103	Dexametasona	\N	\N	\N	4
104	Prednisolona	\N	\N	\N	4
105	Diclofenaco	\N	\N	\N	4
106	Clotrimazol	\N	\N	\N	4
107	Ketoconazol	\N	\N	\N	4
108	Itraconazol	\N	\N	\N	4
109	Fluconazol	\N	\N	\N	4
110	Miconazol	\N	\N	\N	4
111	Terbinafina	\N	\N	\N	4
112	Nistatina	\N	\N	\N	4
113	Gluconato de Calcio	\N	\N	\N	4
114	Calcitriol	\N	\N	\N	4
115	Oxitocina	\N	\N	\N	4
116	Atropina	\N	\N	\N	4
117	Butorfanol	\N	\N	\N	4
118	Tramadol	\N	\N	\N	4
119	Omeprazol	\N	\N	\N	4
120	Ranitidina	\N	\N	\N	4
121	Metoclopramida	\N	\N	\N	4
122	Lactulosa	\N	\N	\N	4
123	Silimarina	\N	\N	\N	4
124	Ácido Ascórbico	\N	\N	\N	4
125	Enrofloxacina	\N	\N	\N	4
126	Amoxicilina	\N	\N	\N	4
127	Ceftazidima	\N	\N	\N	4
128	Gentamicina	\N	\N	\N	4
129	Doxiciclina	\N	\N	\N	4
130	Marbofloxacina	\N	\N	\N	4
131	Azitromicina	\N	\N	\N	4
132	Cefalexina	\N	\N	\N	4
133	Cloranfenicol	\N	\N	\N	4
134	Trimetoprima-Sulfametoxazol	\N	\N	\N	4
135	Ciprofloxacina	\N	\N	\N	4
136	Ampicilina	\N	\N	\N	4
137	Tetraciclina	\N	\N	\N	4
138	Neomicina	\N	\N	\N	4
139	Claritromicina	\N	\N	\N	4
140	Fenbendazol	\N	\N	\N	4
141	Ivermectina	\N	\N	\N	4
142	Praziquantel	\N	\N	\N	4
143	Metronidazol	\N	\N	\N	4
144	Albendazol	\N	\N	\N	4
145	Pirantel	\N	\N	\N	4
146	Levamisol	\N	\N	\N	4
147	Mebendazol	\N	\N	\N	4
148	Piperazina	\N	\N	\N	4
149	Nitazoxanida	\N	\N	\N	4
150	Tiabendazol	\N	\N	\N	4
151	Oxfendazol	\N	\N	\N	4
152	Multivitamínico	\N	\N	\N	4
153	Vitamina A	\N	\N	\N	4
154	Vitamina D3	\N	\N	\N	4
155	Vitamina E	\N	\N	\N	4
156	Vitamina K	\N	\N	\N	4
157	Complejo B	\N	\N	\N	4
158	Vitamina C	\N	\N	\N	4
159	Biotina	\N	\N	\N	4
160	Meloxicam	\N	\N	\N	4
161	Carprofeno	\N	\N	\N	4
162	Ketoprofeno	\N	\N	\N	4
163	Flunixina	\N	\N	\N	4
164	Piroxicam	\N	\N	\N	4
165	Dexametasona	\N	\N	\N	4
166	Prednisolona	\N	\N	\N	4
167	Diclofenaco	\N	\N	\N	4
168	Clotrimazol	\N	\N	\N	4
169	Ketoconazol	\N	\N	\N	4
170	Itraconazol	\N	\N	\N	4
171	Fluconazol	\N	\N	\N	4
172	Miconazol	\N	\N	\N	4
173	Terbinafina	\N	\N	\N	4
174	Nistatina	\N	\N	\N	4
175	Gluconato de Calcio	\N	\N	\N	4
176	Calcitriol	\N	\N	\N	4
177	Oxitocina	\N	\N	\N	4
178	Atropina	\N	\N	\N	4
179	Butorfanol	\N	\N	\N	4
180	Tramadol	\N	\N	\N	4
181	Omeprazol	\N	\N	\N	4
182	Ranitidina	\N	\N	\N	4
183	Metoclopramida	\N	\N	\N	4
184	Lactulosa	\N	\N	\N	4
185	Silimarina	\N	\N	\N	4
186	Ácido Ascórbico	\N	\N	\N	4
187	Enrofloxacina	\N	\N	\N	4
188	Amoxicilina	\N	\N	\N	4
189	Ceftazidima	\N	\N	\N	4
190	Gentamicina	\N	\N	\N	4
191	Doxiciclina	\N	\N	\N	4
192	Marbofloxacina	\N	\N	\N	4
193	Azitromicina	\N	\N	\N	4
194	Cefalexina	\N	\N	\N	4
195	Cloranfenicol	\N	\N	\N	4
196	Trimetoprima-Sulfametoxazol	\N	\N	\N	4
197	Ciprofloxacina	\N	\N	\N	4
198	Ampicilina	\N	\N	\N	4
199	Tetraciclina	\N	\N	\N	4
200	Neomicina	\N	\N	\N	4
201	Claritromicina	\N	\N	\N	4
202	Fenbendazol	\N	\N	\N	4
203	Ivermectina	\N	\N	\N	4
204	Praziquantel	\N	\N	\N	4
205	Metronidazol	\N	\N	\N	4
206	Albendazol	\N	\N	\N	4
207	Pirantel	\N	\N	\N	4
208	Levamisol	\N	\N	\N	4
209	Mebendazol	\N	\N	\N	4
210	Piperazina	\N	\N	\N	4
211	Nitazoxanida	\N	\N	\N	4
212	Tiabendazol	\N	\N	\N	4
213	Oxfendazol	\N	\N	\N	4
214	Multivitamínico	\N	\N	\N	4
215	Vitamina A	\N	\N	\N	4
216	Vitamina D3	\N	\N	\N	4
217	Vitamina E	\N	\N	\N	4
218	Vitamina K	\N	\N	\N	4
219	Complejo B	\N	\N	\N	4
220	Vitamina C	\N	\N	\N	4
221	Biotina	\N	\N	\N	4
222	Meloxicam	\N	\N	\N	4
223	Carprofeno	\N	\N	\N	4
224	Ketoprofeno	\N	\N	\N	4
225	Flunixina	\N	\N	\N	4
226	Piroxicam	\N	\N	\N	4
227	Dexametasona	\N	\N	\N	4
228	Prednisolona	\N	\N	\N	4
229	Diclofenaco	\N	\N	\N	4
230	Clotrimazol	\N	\N	\N	4
231	Ketoconazol	\N	\N	\N	4
232	Itraconazol	\N	\N	\N	4
233	Fluconazol	\N	\N	\N	4
234	Miconazol	\N	\N	\N	4
235	Terbinafina	\N	\N	\N	4
236	Nistatina	\N	\N	\N	4
237	Gluconato de Calcio	\N	\N	\N	4
238	Calcitriol	\N	\N	\N	4
239	Oxitocina	\N	\N	\N	4
240	Atropina	\N	\N	\N	4
241	Butorfanol	\N	\N	\N	4
242	Tramadol	\N	\N	\N	4
243	Omeprazol	\N	\N	\N	4
244	Ranitidina	\N	\N	\N	4
245	Metoclopramida	\N	\N	\N	4
246	Lactulosa	\N	\N	\N	4
247	Silimarina	\N	\N	\N	4
248	Ácido Ascórbico	\N	\N	\N	4
249	Enrofloxacina	\N	\N	\N	4
250	Amoxicilina	\N	\N	\N	4
251	Ceftazidima	\N	\N	\N	4
252	Gentamicina	\N	\N	\N	4
253	Doxiciclina	\N	\N	\N	4
254	Marbofloxacina	\N	\N	\N	4
255	Azitromicina	\N	\N	\N	4
256	Cefalexina	\N	\N	\N	4
257	Cloranfenicol	\N	\N	\N	4
258	Trimetoprima-Sulfametoxazol	\N	\N	\N	4
259	Ciprofloxacina	\N	\N	\N	4
260	Ampicilina	\N	\N	\N	4
261	Tetraciclina	\N	\N	\N	4
262	Neomicina	\N	\N	\N	4
263	Claritromicina	\N	\N	\N	4
264	Fenbendazol	\N	\N	\N	4
265	Ivermectina	\N	\N	\N	4
266	Praziquantel	\N	\N	\N	4
267	Metronidazol	\N	\N	\N	4
268	Albendazol	\N	\N	\N	4
269	Pirantel	\N	\N	\N	4
270	Levamisol	\N	\N	\N	4
271	Mebendazol	\N	\N	\N	4
272	Piperazina	\N	\N	\N	4
273	Nitazoxanida	\N	\N	\N	4
274	Tiabendazol	\N	\N	\N	4
275	Oxfendazol	\N	\N	\N	4
276	Multivitamínico	\N	\N	\N	4
277	Vitamina A	\N	\N	\N	4
278	Vitamina D3	\N	\N	\N	4
279	Vitamina E	\N	\N	\N	4
280	Vitamina K	\N	\N	\N	4
281	Complejo B	\N	\N	\N	4
282	Vitamina C	\N	\N	\N	4
283	Biotina	\N	\N	\N	4
284	Meloxicam	\N	\N	\N	4
285	Carprofeno	\N	\N	\N	4
286	Ketoprofeno	\N	\N	\N	4
287	Flunixina	\N	\N	\N	4
288	Piroxicam	\N	\N	\N	4
289	Dexametasona	\N	\N	\N	4
290	Prednisolona	\N	\N	\N	4
291	Diclofenaco	\N	\N	\N	4
292	Clotrimazol	\N	\N	\N	4
293	Ketoconazol	\N	\N	\N	4
294	Itraconazol	\N	\N	\N	4
295	Fluconazol	\N	\N	\N	4
296	Miconazol	\N	\N	\N	4
297	Terbinafina	\N	\N	\N	4
298	Nistatina	\N	\N	\N	4
299	Gluconato de Calcio	\N	\N	\N	4
300	Calcitriol	\N	\N	\N	4
301	Oxitocina	\N	\N	\N	4
302	Atropina	\N	\N	\N	4
303	Butorfanol	\N	\N	\N	4
304	Tramadol	\N	\N	\N	4
305	Omeprazol	\N	\N	\N	4
306	Ranitidina	\N	\N	\N	4
307	Metoclopramida	\N	\N	\N	4
308	Lactulosa	\N	\N	\N	4
309	Silimarina	\N	\N	\N	4
310	Ácido Ascórbico	\N	\N	\N	4
311	Enrofloxacina	\N	\N	\N	4
312	Amoxicilina	\N	\N	\N	4
313	Ceftazidima	\N	\N	\N	4
314	Gentamicina	\N	\N	\N	4
315	Doxiciclina	\N	\N	\N	4
316	Marbofloxacina	\N	\N	\N	4
317	Azitromicina	\N	\N	\N	4
318	Cefalexina	\N	\N	\N	4
319	Cloranfenicol	\N	\N	\N	4
320	Trimetoprima-Sulfametoxazol	\N	\N	\N	4
321	Ciprofloxacina	\N	\N	\N	4
322	Ampicilina	\N	\N	\N	4
323	Tetraciclina	\N	\N	\N	4
324	Neomicina	\N	\N	\N	4
325	Claritromicina	\N	\N	\N	4
326	Fenbendazol	\N	\N	\N	4
327	Ivermectina	\N	\N	\N	4
328	Praziquantel	\N	\N	\N	4
329	Metronidazol	\N	\N	\N	4
330	Albendazol	\N	\N	\N	4
331	Pirantel	\N	\N	\N	4
332	Levamisol	\N	\N	\N	4
333	Mebendazol	\N	\N	\N	4
334	Piperazina	\N	\N	\N	4
335	Nitazoxanida	\N	\N	\N	4
336	Tiabendazol	\N	\N	\N	4
337	Oxfendazol	\N	\N	\N	4
338	Multivitamínico	\N	\N	\N	4
339	Vitamina A	\N	\N	\N	4
340	Vitamina D3	\N	\N	\N	4
341	Vitamina E	\N	\N	\N	4
342	Vitamina K	\N	\N	\N	4
343	Complejo B	\N	\N	\N	4
344	Vitamina C	\N	\N	\N	4
345	Biotina	\N	\N	\N	4
346	Meloxicam	\N	\N	\N	4
347	Carprofeno	\N	\N	\N	4
348	Ketoprofeno	\N	\N	\N	4
349	Flunixina	\N	\N	\N	4
350	Piroxicam	\N	\N	\N	4
351	Dexametasona	\N	\N	\N	4
352	Prednisolona	\N	\N	\N	4
353	Diclofenaco	\N	\N	\N	4
354	Clotrimazol	\N	\N	\N	4
355	Ketoconazol	\N	\N	\N	4
356	Itraconazol	\N	\N	\N	4
357	Fluconazol	\N	\N	\N	4
358	Miconazol	\N	\N	\N	4
359	Terbinafina	\N	\N	\N	4
360	Nistatina	\N	\N	\N	4
361	Gluconato de Calcio	\N	\N	\N	4
362	Calcitriol	\N	\N	\N	4
363	Oxitocina	\N	\N	\N	4
364	Atropina	\N	\N	\N	4
365	Butorfanol	\N	\N	\N	4
366	Tramadol	\N	\N	\N	4
367	Omeprazol	\N	\N	\N	4
368	Ranitidina	\N	\N	\N	4
369	Metoclopramida	\N	\N	\N	4
370	Lactulosa	\N	\N	\N	4
371	Silimarina	\N	\N	\N	4
372	Ácido Ascórbico	\N	\N	\N	4
373	Enrofloxacina	\N	\N	\N	4
374	Amoxicilina	\N	\N	\N	4
375	Ceftazidima	\N	\N	\N	4
376	Gentamicina	\N	\N	\N	4
377	Doxiciclina	\N	\N	\N	4
378	Marbofloxacina	\N	\N	\N	4
379	Azitromicina	\N	\N	\N	4
380	Cefalexina	\N	\N	\N	4
381	Cloranfenicol	\N	\N	\N	4
382	Trimetoprima-Sulfametoxazol	\N	\N	\N	4
383	Ciprofloxacina	\N	\N	\N	4
384	Ampicilina	\N	\N	\N	4
385	Tetraciclina	\N	\N	\N	4
386	Neomicina	\N	\N	\N	4
387	Claritromicina	\N	\N	\N	4
388	Fenbendazol	\N	\N	\N	4
389	Ivermectina	\N	\N	\N	4
390	Praziquantel	\N	\N	\N	4
391	Metronidazol	\N	\N	\N	4
392	Albendazol	\N	\N	\N	4
393	Pirantel	\N	\N	\N	4
394	Levamisol	\N	\N	\N	4
395	Mebendazol	\N	\N	\N	4
396	Piperazina	\N	\N	\N	4
397	Nitazoxanida	\N	\N	\N	4
398	Tiabendazol	\N	\N	\N	4
399	Oxfendazol	\N	\N	\N	4
400	Multivitamínico	\N	\N	\N	4
401	Vitamina A	\N	\N	\N	4
402	Vitamina D3	\N	\N	\N	4
403	Vitamina E	\N	\N	\N	4
404	Vitamina K	\N	\N	\N	4
405	Complejo B	\N	\N	\N	4
406	Vitamina C	\N	\N	\N	4
407	Biotina	\N	\N	\N	4
408	Meloxicam	\N	\N	\N	4
409	Carprofeno	\N	\N	\N	4
410	Ketoprofeno	\N	\N	\N	4
411	Flunixina	\N	\N	\N	4
412	Piroxicam	\N	\N	\N	4
413	Dexametasona	\N	\N	\N	4
414	Prednisolona	\N	\N	\N	4
415	Diclofenaco	\N	\N	\N	4
416	Clotrimazol	\N	\N	\N	4
417	Ketoconazol	\N	\N	\N	4
418	Itraconazol	\N	\N	\N	4
419	Fluconazol	\N	\N	\N	4
420	Miconazol	\N	\N	\N	4
421	Terbinafina	\N	\N	\N	4
422	Nistatina	\N	\N	\N	4
423	Gluconato de Calcio	\N	\N	\N	4
424	Calcitriol	\N	\N	\N	4
425	Oxitocina	\N	\N	\N	4
426	Atropina	\N	\N	\N	4
427	Butorfanol	\N	\N	\N	4
428	Tramadol	\N	\N	\N	4
429	Omeprazol	\N	\N	\N	4
430	Ranitidina	\N	\N	\N	4
431	Metoclopramida	\N	\N	\N	4
432	Lactulosa	\N	\N	\N	4
433	Silimarina	\N	\N	\N	4
434	Ácido Ascórbico	\N	\N	\N	4
435	Enrofloxacina	\N	\N	\N	4
436	Amoxicilina	\N	\N	\N	4
437	Ceftazidima	\N	\N	\N	4
438	Gentamicina	\N	\N	\N	4
439	Doxiciclina	\N	\N	\N	4
440	Marbofloxacina	\N	\N	\N	4
441	Azitromicina	\N	\N	\N	4
442	Cefalexina	\N	\N	\N	4
443	Cloranfenicol	\N	\N	\N	4
444	Trimetoprima-Sulfametoxazol	\N	\N	\N	4
445	Ciprofloxacina	\N	\N	\N	4
446	Ampicilina	\N	\N	\N	4
447	Tetraciclina	\N	\N	\N	4
448	Neomicina	\N	\N	\N	4
449	Claritromicina	\N	\N	\N	4
450	Fenbendazol	\N	\N	\N	4
451	Ivermectina	\N	\N	\N	4
452	Praziquantel	\N	\N	\N	4
453	Metronidazol	\N	\N	\N	4
454	Albendazol	\N	\N	\N	4
455	Pirantel	\N	\N	\N	4
456	Levamisol	\N	\N	\N	4
457	Mebendazol	\N	\N	\N	4
458	Piperazina	\N	\N	\N	4
459	Nitazoxanida	\N	\N	\N	4
460	Tiabendazol	\N	\N	\N	4
461	Oxfendazol	\N	\N	\N	4
462	Multivitamínico	\N	\N	\N	4
463	Vitamina A	\N	\N	\N	4
464	Vitamina D3	\N	\N	\N	4
465	Vitamina E	\N	\N	\N	4
466	Vitamina K	\N	\N	\N	4
467	Complejo B	\N	\N	\N	4
468	Vitamina C	\N	\N	\N	4
469	Biotina	\N	\N	\N	4
470	Meloxicam	\N	\N	\N	4
471	Carprofeno	\N	\N	\N	4
472	Ketoprofeno	\N	\N	\N	4
473	Flunixina	\N	\N	\N	4
474	Piroxicam	\N	\N	\N	4
475	Dexametasona	\N	\N	\N	4
476	Prednisolona	\N	\N	\N	4
477	Diclofenaco	\N	\N	\N	4
478	Clotrimazol	\N	\N	\N	4
479	Ketoconazol	\N	\N	\N	4
480	Itraconazol	\N	\N	\N	4
481	Fluconazol	\N	\N	\N	4
482	Miconazol	\N	\N	\N	4
483	Terbinafina	\N	\N	\N	4
484	Nistatina	\N	\N	\N	4
485	Gluconato de Calcio	\N	\N	\N	4
486	Calcitriol	\N	\N	\N	4
487	Oxitocina	\N	\N	\N	4
488	Atropina	\N	\N	\N	4
489	Butorfanol	\N	\N	\N	4
490	Tramadol	\N	\N	\N	4
491	Omeprazol	\N	\N	\N	4
492	Ranitidina	\N	\N	\N	4
493	Metoclopramida	\N	\N	\N	4
494	Lactulosa	\N	\N	\N	4
495	Silimarina	\N	\N	\N	4
496	Ácido Ascórbico	\N	\N	\N	4
497	Enrofloxacina	\N	\N	\N	4
498	Amoxicilina	\N	\N	\N	4
499	Ceftazidima	\N	\N	\N	4
500	Gentamicina	\N	\N	\N	4
501	Doxiciclina	\N	\N	\N	4
502	Marbofloxacina	\N	\N	\N	4
503	Azitromicina	\N	\N	\N	4
504	Cefalexina	\N	\N	\N	4
505	Cloranfenicol	\N	\N	\N	4
506	Trimetoprima-Sulfametoxazol	\N	\N	\N	4
507	Ciprofloxacina	\N	\N	\N	4
508	Ampicilina	\N	\N	\N	4
509	Tetraciclina	\N	\N	\N	4
510	Neomicina	\N	\N	\N	4
511	Claritromicina	\N	\N	\N	4
512	Fenbendazol	\N	\N	\N	4
513	Ivermectina	\N	\N	\N	4
514	Praziquantel	\N	\N	\N	4
515	Metronidazol	\N	\N	\N	4
516	Albendazol	\N	\N	\N	4
517	Pirantel	\N	\N	\N	4
518	Levamisol	\N	\N	\N	4
519	Mebendazol	\N	\N	\N	4
520	Piperazina	\N	\N	\N	4
521	Nitazoxanida	\N	\N	\N	4
522	Tiabendazol	\N	\N	\N	4
523	Oxfendazol	\N	\N	\N	4
524	Multivitamínico	\N	\N	\N	4
525	Vitamina A	\N	\N	\N	4
526	Vitamina D3	\N	\N	\N	4
527	Vitamina E	\N	\N	\N	4
528	Vitamina K	\N	\N	\N	4
529	Complejo B	\N	\N	\N	4
530	Vitamina C	\N	\N	\N	4
531	Biotina	\N	\N	\N	4
532	Meloxicam	\N	\N	\N	4
533	Carprofeno	\N	\N	\N	4
534	Ketoprofeno	\N	\N	\N	4
535	Flunixina	\N	\N	\N	4
536	Piroxicam	\N	\N	\N	4
537	Dexametasona	\N	\N	\N	4
538	Prednisolona	\N	\N	\N	4
539	Diclofenaco	\N	\N	\N	4
540	Clotrimazol	\N	\N	\N	4
541	Ketoconazol	\N	\N	\N	4
542	Itraconazol	\N	\N	\N	4
543	Fluconazol	\N	\N	\N	4
544	Miconazol	\N	\N	\N	4
545	Terbinafina	\N	\N	\N	4
546	Nistatina	\N	\N	\N	4
547	Gluconato de Calcio	\N	\N	\N	4
548	Calcitriol	\N	\N	\N	4
549	Oxitocina	\N	\N	\N	4
550	Atropina	\N	\N	\N	4
551	Butorfanol	\N	\N	\N	4
552	Tramadol	\N	\N	\N	4
553	Omeprazol	\N	\N	\N	4
554	Ranitidina	\N	\N	\N	4
555	Metoclopramida	\N	\N	\N	4
556	Lactulosa	\N	\N	\N	4
557	Silimarina	\N	\N	\N	4
558	Ácido Ascórbico	\N	\N	\N	4
559	Enrofloxacina	\N	\N	\N	4
560	Amoxicilina	\N	\N	\N	4
561	Ceftazidima	\N	\N	\N	4
562	Gentamicina	\N	\N	\N	4
563	Doxiciclina	\N	\N	\N	4
564	Marbofloxacina	\N	\N	\N	4
565	Azitromicina	\N	\N	\N	4
566	Cefalexina	\N	\N	\N	4
567	Cloranfenicol	\N	\N	\N	4
568	Trimetoprima-Sulfametoxazol	\N	\N	\N	4
569	Ciprofloxacina	\N	\N	\N	4
570	Ampicilina	\N	\N	\N	4
571	Tetraciclina	\N	\N	\N	4
572	Neomicina	\N	\N	\N	4
573	Claritromicina	\N	\N	\N	4
574	Fenbendazol	\N	\N	\N	4
575	Ivermectina	\N	\N	\N	4
576	Praziquantel	\N	\N	\N	4
577	Metronidazol	\N	\N	\N	4
578	Albendazol	\N	\N	\N	4
579	Pirantel	\N	\N	\N	4
580	Levamisol	\N	\N	\N	4
581	Mebendazol	\N	\N	\N	4
582	Piperazina	\N	\N	\N	4
583	Nitazoxanida	\N	\N	\N	4
584	Tiabendazol	\N	\N	\N	4
585	Oxfendazol	\N	\N	\N	4
586	Multivitamínico	\N	\N	\N	4
587	Vitamina A	\N	\N	\N	4
588	Vitamina D3	\N	\N	\N	4
589	Vitamina E	\N	\N	\N	4
590	Vitamina K	\N	\N	\N	4
591	Complejo B	\N	\N	\N	4
592	Vitamina C	\N	\N	\N	4
593	Biotina	\N	\N	\N	4
594	Meloxicam	\N	\N	\N	4
595	Carprofeno	\N	\N	\N	4
596	Ketoprofeno	\N	\N	\N	4
597	Flunixina	\N	\N	\N	4
598	Piroxicam	\N	\N	\N	4
599	Dexametasona	\N	\N	\N	4
600	Prednisolona	\N	\N	\N	4
601	Diclofenaco	\N	\N	\N	4
602	Clotrimazol	\N	\N	\N	4
603	Ketoconazol	\N	\N	\N	4
604	Itraconazol	\N	\N	\N	4
605	Fluconazol	\N	\N	\N	4
606	Miconazol	\N	\N	\N	4
607	Terbinafina	\N	\N	\N	4
608	Nistatina	\N	\N	\N	4
609	Gluconato de Calcio	\N	\N	\N	4
610	Calcitriol	\N	\N	\N	4
611	Oxitocina	\N	\N	\N	4
612	Atropina	\N	\N	\N	4
613	Butorfanol	\N	\N	\N	4
614	Tramadol	\N	\N	\N	4
615	Omeprazol	\N	\N	\N	4
616	Ranitidina	\N	\N	\N	4
617	Metoclopramida	\N	\N	\N	4
618	Lactulosa	\N	\N	\N	4
619	Silimarina	\N	\N	\N	4
620	Ácido Ascórbico	\N	\N	\N	4
621	Enrofloxacina	\N	\N	\N	4
622	Amoxicilina	\N	\N	\N	4
623	Ceftazidima	\N	\N	\N	4
624	Gentamicina	\N	\N	\N	4
625	Doxiciclina	\N	\N	\N	4
626	Marbofloxacina	\N	\N	\N	4
627	Azitromicina	\N	\N	\N	4
628	Cefalexina	\N	\N	\N	4
629	Cloranfenicol	\N	\N	\N	4
630	Trimetoprima-Sulfametoxazol	\N	\N	\N	4
631	Ciprofloxacina	\N	\N	\N	4
632	Ampicilina	\N	\N	\N	4
633	Tetraciclina	\N	\N	\N	4
634	Neomicina	\N	\N	\N	4
635	Claritromicina	\N	\N	\N	4
636	Fenbendazol	\N	\N	\N	4
637	Ivermectina	\N	\N	\N	4
638	Praziquantel	\N	\N	\N	4
639	Metronidazol	\N	\N	\N	4
640	Albendazol	\N	\N	\N	4
641	Pirantel	\N	\N	\N	4
642	Levamisol	\N	\N	\N	4
643	Mebendazol	\N	\N	\N	4
644	Piperazina	\N	\N	\N	4
645	Nitazoxanida	\N	\N	\N	4
646	Tiabendazol	\N	\N	\N	4
647	Oxfendazol	\N	\N	\N	4
648	Multivitamínico	\N	\N	\N	4
649	Vitamina A	\N	\N	\N	4
650	Vitamina D3	\N	\N	\N	4
651	Vitamina E	\N	\N	\N	4
652	Vitamina K	\N	\N	\N	4
653	Complejo B	\N	\N	\N	4
654	Vitamina C	\N	\N	\N	4
655	Biotina	\N	\N	\N	4
656	Meloxicam	\N	\N	\N	4
657	Carprofeno	\N	\N	\N	4
658	Ketoprofeno	\N	\N	\N	4
659	Flunixina	\N	\N	\N	4
660	Piroxicam	\N	\N	\N	4
661	Dexametasona	\N	\N	\N	4
662	Prednisolona	\N	\N	\N	4
663	Diclofenaco	\N	\N	\N	4
664	Clotrimazol	\N	\N	\N	4
665	Ketoconazol	\N	\N	\N	4
666	Itraconazol	\N	\N	\N	4
667	Fluconazol	\N	\N	\N	4
668	Miconazol	\N	\N	\N	4
669	Terbinafina	\N	\N	\N	4
670	Nistatina	\N	\N	\N	4
671	Gluconato de Calcio	\N	\N	\N	4
672	Calcitriol	\N	\N	\N	4
673	Oxitocina	\N	\N	\N	4
674	Atropina	\N	\N	\N	4
675	Butorfanol	\N	\N	\N	4
676	Tramadol	\N	\N	\N	4
677	Omeprazol	\N	\N	\N	4
678	Ranitidina	\N	\N	\N	4
679	Metoclopramida	\N	\N	\N	4
680	Lactulosa	\N	\N	\N	4
681	Silimarina	\N	\N	\N	4
682	Ácido Ascórbico	\N	\N	\N	4
683	Enrofloxacina	\N	\N	\N	4
684	Amoxicilina	\N	\N	\N	4
685	Ceftazidima	\N	\N	\N	4
686	Gentamicina	\N	\N	\N	4
687	Doxiciclina	\N	\N	\N	4
688	Marbofloxacina	\N	\N	\N	4
689	Azitromicina	\N	\N	\N	4
690	Cefalexina	\N	\N	\N	4
691	Cloranfenicol	\N	\N	\N	4
692	Trimetoprima-Sulfametoxazol	\N	\N	\N	4
693	Ciprofloxacina	\N	\N	\N	4
694	Ampicilina	\N	\N	\N	4
695	Tetraciclina	\N	\N	\N	4
696	Neomicina	\N	\N	\N	4
697	Claritromicina	\N	\N	\N	4
698	Fenbendazol	\N	\N	\N	4
699	Ivermectina	\N	\N	\N	4
700	Praziquantel	\N	\N	\N	4
\.


--
-- Data for Name: patologias; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.patologias (id_patologia, nombre_patologia, es_alergia, gravedad_pronostico, causa, transmision, sintomas, tratamiento, tipo, clasificacion, id_especie, id_tipo_patologia) FROM stdin;
1	Cólera aviar	f	\N	Pasteurella multocida	contacto directo con aves enfermas o portadoras crónicas, a través de agua o alimentos contaminados con heces y secreciones oronasales, y por contacto indirecto con cadáveres de aves infectadas.	Animales dejan de comer y beber, perida de peso	sulfaquinoxalina , penicilina, enrofloxacina y fosfomicina.	Bacteriana	Forma hiperaguda	3	\N
2	Cólera aviar	f	\N	Pasteurella multocida	contacto directo con aves enfermas o portadoras crónicas, a través de agua o alimentos contaminados con heces y secreciones oronasales, y por contacto indirecto con cadáveres de aves infectadas.	Animales dejan de comer y beber, perida de peso	sulfaquinoxalina , penicilina, enrofloxacina y fosfomicina.	Bacteriana	Forma aguda	3	\N
3	Cólera aviar	f	\N	Pasteurella multocida	contacto directo con aves enfermas o portadoras crónicas, a través de agua o alimentos contaminados con heces y secreciones oronasales, y por contacto indirecto con cadáveres de aves infectadas.	Inflamación en la cara y barbillas que pueden tomar un color rojo vino y sentirse calientes al tactoI	sulfaquinoxalina , penicilina, enrofloxacina y fosfomicina.	Bacteriana	Forma cronica	3	\N
4	Colibacilosis	f	\N	Variedades de Escherichia coli	Las principales vías de infección por bacterias son el sistema respiratorio y el tracto gastrointestinal. Las infecciones de los pollos jóvenes pueden producirse por ingreso a través del ombligo no curado o por penetración de la cáscara del huevo antes o durante la incubación.	Dificultad respiratorio, tos ocasional, jadeos y diarrea	antibióticos de amplio espectro	Bacteriana	Forma aguda	3	\N
5	Colibacilosis	f	\N	Variedades de Escherichia coli	Las principales vías de infección por bacterias son el sistema respiratorio y el tracto gastrointestinal. Las infecciones de los pollos jóvenes pueden producirse por ingreso a través del ombligo no curado o por penetración de la cáscara del huevo antes o durante la incubación.	Dificultad respiratorio, tos ocasional, jadeos y diarrea	antibióticos de amplio espectro	Bacteriana	Forma cronica	3	\N
6	Coriza infecciosa	f	\N	Haemophilus gallinarum	Por contacto directo, por el aire, el polvo o en las descargas respiratorias, agua de bebida contaminada con exudados nasales.	Ojos con espuma, inflamación de parapados, secreciones purulentas por la nariz con mal olor, deshidratación y peridad de peso	sulfato de streptomicina, quinolonas, tetraciclinas, sulfadimetoxina, sulfatiazol, eritromicina en el alimento o el agua, estreptomicina por vía intramuscular pueden reducir los síntomas de la enfermedad, pero no pueden eliminarla completamente.	Bacteriana	Forma aguda	3	\N
7	Coriza infecciosa	f	\N	Haemophilus gallinarum	Por contacto directo, por el aire, el polvo o en las descargas respiratorias, agua de bebida contaminada con exudados nasales.	Ojos con espuma, inflamación de parapados, secreciones purulentas por la nariz con mal olor, deshidratación y peridad de peso	sulfato de streptomicina, quinolonas, tetraciclinas, sulfadimetoxina, sulfatiazol, eritromicina en el alimento o el agua, estreptomicina por vía intramuscular pueden reducir los síntomas de la enfermedad, pero no pueden eliminarla completamente.	Bacteriana	Forma cronica	3	\N
8	Enteritis necrótica 	f	\N	Clostridum	La transmisión ocurre por contacto oral con los excrementos de aves infectadas.	Decaimiento, inapetencia, fiebre, heces oscuras ocasionalmente con sangre	Diclortet 15 %, bacitracina o virginiamicina son tratamientos efectivos, administrados en el alimento.	Bacteriana	Forma aguda	3	\N
9	Enteritis necrótica 	f	\N	Clostridum	La transmisión ocurre por contacto oral con los excrementos de aves infectadas.	Decaimiento, inapetencia, fiebre, heces oscuras ocasionalmente con sangre	Diclortet 15 %, bacitracina o virginiamicina son tratamientos efectivos, administrados en el alimento.	Bacteriana	Forma cronica	3	\N
10	Enteritis ulcerativa	f	\N	Clostridium colinum	La infección se contagia a las aves sanas por medio de las excretas de aves enfermas o portadoras.	plumas desordenadas, diarrea blanquecina y líquida, adoptando una postura encogida	bacitracina o penicilina.	Bacteriana	Forma aguda	3	\N
11	Enteritis ulcerativa	f	\N	Clostridium colinum	La infección se contagia a las aves sanas por medio de las excretas de aves enfermas o portadoras.	plumas desordenadas, diarrea blanquecina y líquida, adoptando una postura encogida	bacitracina o penicilina.	Bacteriana	Forma cronica	3	\N
12	Erisipela	f	\N	Erysipelothrix insidiosa	Las bacterias pueden sobrevivir por largos periodos en el suelo y los brotes se originan en suelos o instalaciones contaminadas. Las ovejas, cerdos o roedores pueden ser portadores de bacterias	Debilidad general, inquietud, falta de apetito y a veces diarrea verdosa o amarillenta.	penicilina.	Bacteriana	Forma aguda	3	\N
13	Erisipela	f	\N	Erysipelothrix insidiosa	Las bacterias pueden sobrevivir por largos periodos en el suelo y los brotes se originan en suelos o instalaciones contaminadas. Las ovejas, cerdos o roedores pueden ser portadores de bacterias	Debilidad general, inquietud, falta de apetito y a veces diarrea verdosa o amarillenta.	penicilina.	Bacteriana	Forma cronica	3	\N
14	Myclopasmosis	f	\N	Agente Mycoplasma	Principalmente se transmite por el huevo, las gallinas infectadas transmiten las bacterias y los pollitos se infectan al nacer. También pueden transmitirse por contacto directo con aves infectadas o portadoras.	Lagrimeo, mucosidad nasal y adeos	Lo mejor es su control mediante la eliminación de los animales enfermos o usar altos niveles de un antibiótico de amplio espectro (Tylosina, aureomicina, terramicina, gallimicina) o algunos antimicoplásmicos (advocin, baytril, dinamutilin, lincospectin, tylan, suanovil, spiramix).	Bacteriana	Forma aguda	3	\N
15	Myclopasmosis	f	\N	Agente Mycoplasma	Principalmente se transmite por el huevo, las gallinas infectadas transmiten las bacterias y los pollitos se infectan al nacer. También pueden transmitirse por contacto directo con aves infectadas o portadoras.	Lagrimeo, mucosidad nasal y adeos	Lo mejor es su control mediante la eliminación de los animales enfermos o usar altos niveles de un antibiótico de amplio espectro (Tylosina, aureomicina, terramicina, gallimicina) o algunos antimicoplásmicos (advocin, baytril, dinamutilin, lincospectin, tylan, suanovil, spiramix).	Bacteriana	Forma cronica	3	\N
16	Salmonelosis	f	\N	Salmonella pullorum	De la gallina infectada al huevo y del huevo al pollito, de pollo a pollo en la incubadora, caja de pollo, o galpones. Los sobrevivientes se convierten en reproductores infectados (comenzando un nuevo ciclo). Transmisión mecánica (transportada en la ropa, calzado, equipos o instalaciones contaminadas).	En los pollitos decaimiento, dejan caer las alas, se aglomeran cerca del calentador, diarrea primero amarillo-verdoso, luego blanco-grisácea pegajosa y espumosa	Se recomiendan la furazolidona, quinolonas de 2a y 3a generación, el sulfato de gentamicina y las sulfas (sulfadimetoxina, sulfametacina y sulfameracina).	Bacteriana	Pulorosis(crónica en adultos, aguda en jóvenes)	3	\N
71	Anaplasmosis	f	\N	Anaplasma phagocytophilum	Picadura de garrapatas	Fiebre, cojera, dolor articular, letargo	AntibiÃ³ticos (doxiciclina)	\N	\N	2	\N
17	Salmonelosis	f	\N	Salmonella Gallinarum	De la gallina infectada al huevo y del huevo al pollito, de pollo a pollo en la incubadora, caja de pollo, o galpones. Los sobrevivientes se convierten en reproductores infectados (comenzando un nuevo ciclo). Transmisión mecánica (transportada en la ropa, calzado, equipos o instalaciones contaminadas).	En los pollitos decaimiento, dejan caer las alas, se aglomeran cerca del calentador, diarrea primero amarillo-verdoso, luego blanco-grisácea pegajosa y espumosa	Se recomiendan la furazolidona, quinolonas de 2a y 3a generación, el sulfato de gentamicina y las sulfas (sulfadimetoxina, sulfametacina y sulfameracina).	Bacteriana	Tifosis Aviar (aguda)	3	\N
18	Salmonelosis	f	\N	Salmonella paratifoidea	De la gallina infectada al huevo y del huevo al pollito, de pollo a pollo en la incubadora, caja de pollo, o galpones. Los sobrevivientes se convierten en reproductores infectados (comenzando un nuevo ciclo). Transmisión mecánica (transportada en la ropa, calzado, equipos o instalaciones contaminadas).	En los pollitos decaimiento, dejan caer las alas, se aglomeran cerca del calentador, diarrea primero amarillo-verdoso, luego blanco-grisácea pegajosa y espumosa	Se recomiendan la furazolidona, quinolonas de 2a y 3a generación, el sulfato de gentamicina y las sulfas (sulfadimetoxina, sulfametacina y sulfameracina).	Bacteriana	Paratifosis (mayormente aguda o subclínica/portadora)	3	\N
19	Staphilocococcia y streptocococcia	f	\N	Staphilocococcia y Streptocococcia	De ave a ave por contacto directo o por contacto con equipo o instalaciones mal desinfectadas.	Se observa la presencia de pus, abscesos en los pulpejos plantares y los conductos auditivos externos y los ojos.	drenar y aplicar un desinfectante local.	Bacteriana	Forma aguda	3	\N
20	Staphilocococcia y streptocococcia	f	\N	Staphilocococcia y Streptocococcia	De ave a ave por contacto directo o por contacto con equipo o instalaciones mal desinfectadas.	Se observa la presencia de pus, abscesos en los pulpejos plantares y los conductos auditivos externos y los ojos.	drenar y aplicar un desinfectante local.	Bacteriana	Forma cronica	3	\N
21	Tifoidea aviar	f	\N	Salmonella gallinarum	De la gallina infectada al huevo y del huevo al pollito, de pollo a pollo en la incubadora, caja de pollo, o galpones. Los sobrevivientes se convierten en reproductores infectados (comenzando un nuevo ciclo). Transmisión mecánica (transportada en la ropa, calzado, equipos o instalaciones contaminadas).	Mortalidad súbita o esporádica, inquietud, diarrea verde o amarilla (las plumas de la cloaca, empastadas y pegadas), pérdida de apetito, aumento de sed y una apariencia pálida, anémica, de la cresta y las barbas.	mismos medicamentos que para el pullorum.	Bacteriana	Forma aguda	3	\N
22	Tifoidea aviar	f	\N	Salmonella gallinarum	De la gallina infectada al huevo y del huevo al pollito, de pollo a pollo en la incubadora, caja de pollo, o galpones. Los sobrevivientes se convierten en reproductores infectados (comenzando un nuevo ciclo). Transmisión mecánica (transportada en la ropa, calzado, equipos o instalaciones contaminadas).	Mortalidad súbita o esporádica, inquietud, diarrea verde o amarilla (las plumas de la cloaca, empastadas y pegadas), pérdida de apetito, aumento de sed y una apariencia pálida, anémica, de la cresta y las barbas.	mismos medicamentos que para el pullorum.	Bacteriana	Forma cronica	3	\N
23	Bronquitis infecciosa	f	\N	 Coronavirus	Por el aire y puede "saltar" distancias considerables durante un brote activo.	Respiración laboriosa, jadeo, ahogos, estornudos y estertores, mucosidad, secreciones de los ojos y aberturas nasales	La vacuna de las cepas Connecticut o Massachusetts atenuadas, solas o en combinación, pueden aplicarse desde el primer día de nacidas.	Viral	Forma aguda	3	\N
24	Encefalomielitis aviar	f	\N	"entero virus" del grupo de los picomavirus	Principalmente por medio de los huevos de aves infectadas	En animales jóvenes, se manifiesta un caminar vacilante, incoordinación y hasta parálisis parcial o total	Niveles adecuados de Vitamina E , adicionar 5 a 10 U.I. de Vitamina. E por kilogramo de alimento y vacunación en las reproductoras	Viral	Forma aguda	3	\N
25	Enfermedad de Marek	f	\N	virus herpes	Por medio de las escamas que se desprenden de los folículos (raíz) de las plumas, las cuales se transportan por el viento.	Languidez, plumaje pobre y pérdida de peso	No tiene tratamiento, su control se realiza mediante la vacunación de todos los animales, por la vía subcutánea, durante las primeras 24 horas de vida antes de que salgan de la planta de incubación. Esta vacuna protegerá a las aves durante toda su vida.	Viral	Forma Neurológica (Clásica)	3	\N
26	Enfermedad de Marek	f	\N	virus herpes	Por medio de las escamas que se desprenden de los folículos (raíz) de las plumas, las cuales se transportan por el viento.	Languidez, plumaje pobre y pérdida de peso	No tiene tratamiento, su control se realiza mediante la vacunación de todos los animales, por la vía subcutánea, durante las primeras 24 horas de vida antes de que salgan de la planta de incubación. Esta vacuna protegerá a las aves durante toda su vida.	Viral	Forma Visceral	3	\N
27	Enfermedad de Marek	f	\N	virus herpes	Por medio de las escamas que se desprenden de los folículos (raíz) de las plumas, las cuales se transportan por el viento.	Languidez, plumaje pobre y pérdida de peso	No tiene tratamiento, su control se realiza mediante la vacunación de todos los animales, por la vía subcutánea, durante las primeras 24 horas de vida antes de que salgan de la planta de incubación. Esta vacuna protegerá a las aves durante toda su vida.	Viral	Forma Cutánea	3	\N
28	Enfermedad de Marek	f	\N	virus herpes	Por medio de las escamas que se desprenden de los folículos (raíz) de las plumas, las cuales se transportan por el viento.	Languidez, plumaje pobre y pérdida de peso	No tiene tratamiento, su control se realiza mediante la vacunación de todos los animales, por la vía subcutánea, durante las primeras 24 horas de vida antes de que salgan de la planta de incubación. Esta vacuna protegerá a las aves durante toda su vida.	Viral	Parálisis Transitoria	3	\N
29	Enfermedad de Marek	f	\N	virus herpes	Por medio de las escamas que se desprenden de los folículos (raíz) de las plumas, las cuales se transportan por el viento.	Languidez, plumaje pobre y pérdida de peso	No tiene tratamiento, su control se realiza mediante la vacunación de todos los animales, por la vía subcutánea, durante las primeras 24 horas de vida antes de que salgan de la planta de incubación. Esta vacuna protegerá a las aves durante toda su vida.	Viral	Ocular	3	\N
30	Enfermedad de Newcastle	f	\N	Orthomixovirus, Paramyxovirus (PMV-I)	El virus puede transmitirse por medio de las descargas nasales y excremento de las aves infectadas, por equipos contaminados, calzado, ropa y pájaros que vuelan libremente.	tos, ahogo, descarga nasal y respiración irritante	vacuna llamada B1, vacuna de virus vivo atenuado y la tipo La Sota. Se pueden aplicar en forma de gota nasal u ocular, en el agua de bebida o en spray.	Viral	Forma aguda	3	\N
51	Ascaridiosis	f	\N	Ascarídia galli	Las aves se infectan comiéndose los huevos que han llegado al estado infectivo.	El parásito de color blanco amarillento, de 4 a 7.5 cm. de largo, puede ser observado a simple vista en heces contaminadas.	Piperacina.	Parasitos internos	Infección cronica	3	\N
31	Influenza aviar o Peste aviar	f	\N	virus Orthomixovirus	El contacto directo con secreciones de aves infectadas es el principal método de transmisión dentro de parvadas infectadas.	Marcada depresión, plumas erizadas, inapetencia, sed excesiva, caída en la producción de huevo y diarrea acuosa de un color verde brillante	Tratamiento con hidrocloruro de amantadina es efectivo para atenuar la severidad e incidencia de Influenza Aviar	Viral	Influenza Aviar de Baja Patogenicidad (IABP)	3	\N
32	Influenza aviar o Peste aviar	f	\N	virus Orthomixovirus	El contacto directo con secreciones de aves infectadas es el principal método de transmisión dentro de parvadas infectadas.	Marcada depresión, plumas erizadas, inapetencia, sed excesiva, caída en la producción de huevo y diarrea acuosa de un color verde brillante	Tratamiento con hidrocloruro de amantadina es efectivo para atenuar la severidad e incidencia de Influenza Aviar	Viral	Influenza Aviar de Alta Patogenicidad (IAAP) 	3	\N
33	Laringotraqueitis aviar	f	\N	Herpes virus	De ave a ave por medio del aire y el contacto. Transmisión mecánica por equipo e instalaciones.	Congestión ocular, nasal y grandes dificultades para respirar	Sin tratamiento.	Viral	Forma aguda	3	\N
34	Laringotraqueitis aviar	f	\N	Herpes virus	De ave a ave por medio del aire y el contacto. Transmisión mecánica por equipo e instalaciones.	Congestión ocular, nasal y grandes dificultades para respirar	Sin tratamiento.	Viral	Forma cronica	3	\N
35	Leucosis linfoide 	f	\N	Virus	Por los huevos y las heces de las aves y mecánicamente a través de parásitos chupadores de sangre o el hombre.	Las aves afectadas pueden morir sin presentar síntomas preliminares, pero la enfermedad generalmente es de naturaleza, crónica y muestran pérdida de apetito, emaciación progresiva y diarrea.	Sin tratamiento.	Viral	Forma aguda	3	\N
36	Leucosis linfoide 	f	\N	Virus	Por los huevos y las heces de las aves y mecánicamente a través de parásitos chupadores de sangre o el hombre.	Las aves afectadas pueden morir sin presentar síntomas preliminares, pero la enfermedad generalmente es de naturaleza, crónica y muestran pérdida de apetito, emaciación progresiva y diarrea.	Sin tratamiento.	Viral	Forma cronica	3	\N
37	Viruela Aviar	f	\N	virus Borreliota avium	se transmite por contacto directo, de un animal a otro o por medio del alimento o agua de bebida. Los zancudos u otros insectos que chupan sangre podrían ser transmisores de esta enfermedad.	Viruela seca o viruela cutánea, generalmente aparece como una ampolla o picada de mosquito que forma nódulos y luego se forma una costra.	Toques de tintura de yodo en las heridas. Azul de metileno en el agua de beber.	Viral	Forma humeda	3	\N
38	Viruela Aviar	f	\N	virus Borreliota avium	se transmite por contacto directo, de un animal a otro o por medio del alimento o agua de bebida. Los zancudos u otros insectos que chupan sangre podrían ser transmisores de esta enfermedad.	Viruela seca o viruela cutánea, generalmente aparece como una ampolla o picada de mosquito que forma nódulos y luego se forma una costra.	Toques de tintura de yodo en las heridas. Azul de metileno en el agua de beber.	Viral	Forma seca	3	\N
39	Aspergillosis	f	\N	Aspergillus fumigatus	No es contagiosa ni se transmite de un ave a otra y las aves sanas pueden resistir exposiciones repetidas a estos organismos.	Jadeo, tos, boqueo, ojos inflamados, falta de sueño y/o apetito, rápida disminución de peso	Sin tratamiento.	Micosis	Aspergillosis aguda	3	\N
40	Aspergillosis	f	\N	Aspergillus fumigatus	No es contagiosa ni se transmite de un ave a otra y las aves sanas pueden resistir exposiciones repetidas a estos organismos.	Jadeo, tos, boqueo, ojos inflamados, falta de sueño y/o apetito, rápida disminución de peso	Sin tratamiento.	Micosis	Aspergillosis cronica	3	\N
41	Micotoxicosis	f	\N	Ingestión de sustancias tóxicas producidas por crecimiento de mohos en el alimento	Mohos toxicos en el alimento.	Similares a los descriptos para aspergillosis por lo que se requerirá análisis químicos para detectar las aflatoxinas en el alimento	Sin tratamiento.	Micosis	Micotoxicosis aguda	3	\N
42	Micotoxicosis	f	\N	Ingestión de sustancias tóxicas producidas por crecimiento de mohos en el alimento	Mohos toxicos en el alimento.	Similares a los descriptos para aspergillosis por lo que se requerirá análisis químicos para detectar las aflatoxinas en el alimento	Sin tratamiento.	Micosis	Micotoxicosis cronica	3	\N
43	Moniliasis	f	\N	Candida albicans	Por la ingestión del organismo causal en alimentos, agua o ambiente	Las más jóvenes se ponen inquietas, pálidas, con plumaje desordenado y presentan mal aspecto general. Las ponedoras en jaulas se vuelven obesas y anémicas	El tratamiento de todo el lote con antimicóticos controlan la infección.	Micosis	Forma aguda	3	\N
44	Moniliasis	f	\N	Candida albicans	Por la ingestión del organismo causal en alimentos, agua o ambiente	Las más jóvenes se ponen inquietas, pálidas, con plumaje desordenado y presentan mal aspecto general. Las ponedoras en jaulas se vuelven obesas y anémicas	El tratamiento de todo el lote con antimicóticos controlan la infección.	Micosis	Forma cronica	3	\N
45	Ácaros	f	\N	Dermanyssus gallinae, Knemidocoptes, Knemidocoptes laevis, variedad gallinae	El contacto entre las aves y las instalaciones infestadas es la principal fuente de infestación.	Algunos de estos ácaros se observan a simple vista sobre el cuerpo de las aves. Pérdida de sangre, irritación, anemia, disminución de la producción de huevos, engrosamiento de las escamas de las piernas y la consecuente deformación de las patas. Rotura y desprendimiento de plumas. 	5 %, Malation, o Polvo de Azufre en la cama y en los nidales.	Parasitos externos	No aplica	3	\N
46	Piojos	f	\N	Todos los piojos que infectan a las aves son del tipo masticador	El contacto entre las aves es la principal fuente de infestación.	 Irritación de la piel, plumas fruncidas, diarrea	espolvorear directamente a las aves con polvos de Malation o Carbaril 5%.	Parasitos externos	No aplica	3	\N
47	Garrapatas 	f	\N	Es un chupador de sangre que además, puede transmitir la spiroketosis o fiebre	El contacto entre las aves es la principal fuente de infestación y el uso de instalaciones mal desinfectadas.	pérdida de apetito y peso, posible anemia	Rosear con insecticida de amplio espectro.	Parasitos externos	No aplica	3	\N
48	Chinches	f	\N	Cimex lectularius	El contacto entre las aves es la principal fuente de infestación y el uso de instalaciones mal desinfectadas.	pérdida de apetito y peso, posible anemia	Usar carbaril, coumafós, malatión, estirofós o mezclas de estirofós y diclorvós.	Parasitos externos	No aplica	3	\N
49	Pulgas adherentes	f	\N	Echidnophaga gallinácea	El contacto entre las aves es la principal fuente de infestación y el uso de instalaciones mal desinfectadas.	Ulceración e irritación de la piel, ceguera	Aplicación del polvo (Carbaril; 5 %), directamente en las áreas donde residen las pulgas y en la cama.	Parasitos externos	No aplica	3	\N
50	Ascaridiosis	f	\N	Ascarídia galli	Las aves se infectan comiéndose los huevos que han llegado al estado infectivo.	El parásito de color blanco amarillento, de 4 a 7.5 cm. de largo, puede ser observado a simple vista en heces contaminadas.	Piperacina.	Parasitos internos	Infección aguda	3	\N
52	Lombrices cecales	f	\N	Heterakis gallinae	Por contacto directo de las aves con la materia fecal, donde los huevos que son muy resistentes a las condiciones ambientales permanecerán viables por largos períodos.	Las lombrices adultas pueden observarse con facilidad en los "ciegos" de las aves infestadas, ya que miden hasta 12 milímetros de largo y de color blanco.	Puede ser tratada efectivamente con fenbendazole.	Parasitos internos	No aplica	3	\N
53	Capillaria	f	\N	Varias especies de Capillaria	Por contacto directo de las aves con la materia fecal.	reducción del crecimiento, baja de la producción de huevos	Se puede usar higromicina en el control, y resulta valiosa la adición de Vitamina A.	Parasitos internos	Forma aguda	3	\N
54	Capillaria	f	\N	Varias especies de Capillaria	Por contacto directo de las aves con la materia fecal.	reducción del crecimiento, baja de la producción de huevos	Se puede usar higromicina en el control, y resulta valiosa la adición de Vitamina A.	Parasitos internos	Forma cronica	3	\N
55	Teniasis	f	\N	Raillietina tetragona, Davainea proglottina	Las ingieren los huéspedes intermediarios.	Enflaquecimiento y baja de la producción, reducción de la eficiencia y disminución del crecimiento	Las infecciones pueden controlarse tratando regularmente a las aves con fenbendazol y levamisol.	Parasitos internos	Infección cronica	3	\N
56	Nematodos	f	\N	Syngamus trachea	Contacto de las aves con instalaciones infestadas.	Respiración con el pico abierto, aves que emiten una especie de gruñido y muchas mueren asfixiadas.	Administrar un antiparasitario con intervalos de quince a treinta días	Parasitos internos	Infección aguda	3	\N
57	Nematodos	f	\N	Syngamus trachea	Contacto de las aves con instalaciones infestadas.	Respiración con el pico abierto, aves que emiten una especie de gruñido y muchas mueren asfixiadas.	Administrar un antiparasitario con intervalos de quince a treinta días	Parasitos internos	Infección cronica	3	\N
58	Coccidiosis	f	\N	Organismo microscópico llamado coccidia	Por contacto directo o indirecto con los excrementos de otras aves infectadas.	Disminución en el consumo de alimento; aves que encorvan espalda, dejan caer los rabos y fruncen las pluma.	Para el tratamiento se puede usar sulfaquinoxalina, sulfasuccidina o sulfametazina.	Parasitos internos	Infección aguda	3	\N
59	Histomoniasis. Conocida como Cabeza Negra	f	\N	Histomona meleagridis	Por contacto directo de las aves con la materia fecal.	Pérdida del apetito, aumento de sed, malestar, somnolencia, oscurecimiento de la región facial y diarrea	El buen manejo es el único método efectivo para el control de esta enfermedad, puesto que muchos de los productos que se usaban hace años ya no están disponibles comercialmente.	Parasitos internos	Forma aguda	3	\N
60	Histomoniasis. Conocida como Cabeza Negra	f	\N	Histomona meleagridis	Por contacto directo de las aves con la materia fecal.	Pérdida del apetito, aumento de sed, malestar, somnolencia, oscurecimiento de la región facial y diarrea	El buen manejo es el único método efectivo para el control de esta enfermedad, puesto que muchos de los productos que se usaban hace años ya no están disponibles comercialmente.	Parasitos internos	Forma cronica	3	\N
1	Dermatitis alergica por pulgas (DAP)	t	\N	Saliva de pulgas	\N	Causa mas comun de alergia en gatos, prurito severo	Control de pulgas (pipetas, collares, limpieza del entorno), corticoides o antihistamonicos según gravedad	Parasitarias/Alergicas	\N	2	\N
2	Alergia alimentaria	t	\N	Proteinas alimentarias (pollo, pescado, res, lacteos)	\N	Se manifiesta con vomitos, diarrea o problemas cutaneos	Dieta hipoalerginica o de eliminacion, evitar el alimento causante	Alimentaria	\N	2	\N
3	Dermatitis atopica felina	t	\N	Alergenos ambientales (acaros, polenes, polvo)	\N	Prurito cronico, lesiones en piel y orejas	Control ambiental, inmunoterapia, antihistaminicos, batos medicados	Ambiental	\N	2	\N
4	Asma felino (alergia respiratoria)	t	\N	Inhalacion de alergenos (polvo, humo, polenes)	\N	Causa tos, sibilancias y dificultad respiratoria	Broncodilatadores e inhaladores con corticoides, evitar alorgenos	Respiratoria	\N	2	\N
5	Alergia de contacto	t	\N	Plasticos, detergentes, productos quimicos	\N	Zonas de piel enrojecida o con perdida de pelo	Evitar el contacto con el agente, cremas calmantes o corticoides tipicos	Contacto	\N	2	\N
6	Reacciones adversas a farmacos	t	\N	Medicamentos (ej. antibioticos, AINEs, vacunas)	\N	Desde urticaria hasta shock anafilictico	Suspender el farmaco, administrar antihistaminicos o corticoides; en casos graves, atencion veterinaria urgente	Medicamentosas	\N	2	\N
7	Hipersensibilidad a picaduras de insectos	t	\N	Abejas, avispas, mosquitos	\N	Inflamacion localizada o reacciones graves	Compresas freas, corticoides o antihistamanicos; en casos severos, tratamiento de emergencia	Insectos	\N	2	\N
61	Rabia	f	\N	Virus de la rabia	Mordeduras o saliva de animales infectados	Cambios de comportamiento, salivaciÃ³n excesiva, parÃ¡lisis	No tiene cura; prevenciÃ³n con vacuna	\N	\N	2	\N
62	Panleucopenia felina	f	\N	Parvovirus felino	Contacto con heces o secreciones de gatos infectados	Fiebre, vÃ³mito, diarrea, deshidrataciÃ³n	Terapia de soporte, lÃ­quidos, antibiÃ³ticos preventivos	\N	\N	2	\N
63	Calicivirosis felina	f	\N	Calicivirus felino	Contacto con secreciones nasales o saliva	Estornudos, Ãºlceras orales, fiebre, conjuntivitis	Soporte, antibiÃ³ticos si hay infecciÃ³n secundaria	\N	\N	2	\N
64	RinotraqueÃ­tis viral felina	f	\N	Herpesvirus felino tipo 1	Secreciones nasales y oculares	SecreciÃ³n nasal y ocular, estornudos, fiebre	Antivirales, antibiÃ³ticos, soporte	\N	\N	2	\N
65	Leucemia felina (FeLV)	f	\N	Retrovirus felino	Contacto con saliva, sangre o leche materna	InmunosupresiÃ³n, pÃ©rdida de peso, fiebre	No tiene cura, manejo sintomÃ¡tico y vacunaciÃ³n preventiva	\N	\N	2	\N
66	Inmunodeficiencia felina (FIV)	f	\N	Lentivirus felino	Mordeduras profundas, contacto con sangre	Fiebre, pÃ©rdida de apetito, infecciones recurrentes	No tiene cura, manejo del sistema inmune	\N	\N	2	\N
67	Clamidiosis felina	f	\N	Chlamydia felis	Contacto directo, secreciones oculares	Conjuntivitis, estornudos, secreciÃ³n ocular acuosa	AntibiÃ³ticos (doxiciclina), limpieza ocular	\N	\N	2	\N
68	Bordetelosis felina	f	\N	Bordetella bronchiseptica	InhalaciÃ³n de gotas infectadas	Tos, estornudos, fiebre, ruidos pulmonares	AntibiÃ³ticos, terapia de soporte	\N	\N	2	\N
69	Micoplasmosis felina	f	\N	Mycoplasma haemofelis	Picaduras de pulgas o garrapatas	Anemia, ictericia, debilidad, fiebre	AntibiÃ³ticos (doxiciclina), en casos graves transfusiones	\N	\N	2	\N
70	Ehrlichiosis felina	f	\N	Ehrlichia spp.	Picadura de garrapatas infectadas	Fiebre, letargo, pÃ©rdida de peso, dolor articular	AntibiÃ³ticos (doxiciclina)	\N	\N	2	\N
72	Peritonitis infecciosa felina (PIF)	f	\N	Coronavirus felino (mutado)	MutaciÃ³n interna del coronavirus entÃ©rico	Derrame abdominal (forma hÃºmeda), fiebre, pÃ©rdida de peso	Tratamientos experimentales (GS-441524), soporte	\N	\N	2	\N
73	Toxoplasmosis	f	\N	Toxoplasma gondii	IngestiÃ³n de carne cruda o presas infectadas	Fiebre, pÃ©rdida de apetito, sÃ­ntomas respiratorios o neurolÃ³gicos	AntibiÃ³ticos especÃ­ficos (clindamicina)	\N	\N	2	\N
74	Giardiasis	f	\N	Giardia duodenalis	IngestiÃ³n de agua o alimentos contaminados con quistes	Diarrea crÃ³nica maloliente, pÃ©rdida de peso	Antiparasitarios (metronidazol, fenbendazol)	\N	\N	2	\N
75	Toxocariasis	f	\N	Toxocara cati	IngestiÃ³n de huevos en el ambiente o vÃ­a leche materna	VÃ³mitos, diarrea, abdomen hinchado, tos	Antiparasitarios (albendazol, moxidectina)	\N	\N	2	\N
76	Dipilidiasis	f	\N	Dipylidium caninum	IngestiÃ³n de pulgas infectadas	PicazÃ³n anal, vÃ³mitos, presencia de segmentos del parÃ¡sito	Praziquantel	\N	\N	2	\N
77	Otocariosis	f	\N	Otodectes cynotis	Contacto directo con gatos infestados	PicazÃ³n en orejas, sacudidas de cabeza, secreciÃ³n oscura	Limpieza, acaricidas (ivermectina, selamectina)	\N	\N	2	\N
78	Dermatofitosis (TiÃ±a)	f	\N	Microsporum canis	Contacto con esporas o superficies contaminadas	PÃ©rdida de pelo circular, picazÃ³n, costras	AntifÃºngicos tÃ³picos y orales (itraconazol)	\N	\N	2	\N
79	Candidiasis	f	\N	Candida spp.	Oportunista, inmunosupresiÃ³n	Lesiones en mucosas, piel o tracto digestivo	AntifÃºngicos (nistatina, fluconazol)	\N	\N	2	\N
80	Criptococosis	f	\N	Cryptococcus neoformans	InhalaciÃ³n de esporas del suelo o heces de palomas	Estornudos, masas nasales, sÃ­ntomas neurolÃ³gicos	AntifÃºngicos prolongados (fluconazol, itraconazol)	\N	\N	2	\N
81	Enfermedad renal crÃ³nica	f	\N	Multifactorial	No transmisible	Aumento de sed, pÃ©rdida de peso, vÃ³mitos	Dieta renal, hidrataciÃ³n, control de fÃ³sforo	\N	\N	2	\N
82	Diabetes mellitus felina	f	\N	Multifactorial	No transmisible	Sed y hambre excesivas, pÃ©rdida de peso	Insulina, dieta especial	\N	\N	2	\N
83	Alergia por Picadura de Pulga (DAPP)	t	Muy comun. Una sola picadura puede desencadenar la reacción en perros sensibilizados.	Picadura de pulga (la saliva actúa como alérgeno).	\N	Picor (prurito) intenso, rascado/mordedura excesiva, caída del pelo, costras, lesiones cutáneas, infección secundaria.	Tratamiento rápido para eliminar pulgas, desinfección total de la casa y otras mascotas. Champú medicinal o pomada para el picor.	\N	\N	1	\N
84	Alergias Ambientales (Atopia)	t	Cronica (suele ser de por vida) y estacional (si es por polen).	Polen (árboles, plantas, césped), polvo, moho, caspa.	\N	Picor excesivo (especialmente en patas, hocico e ingles), estornudos, tos, goteo nasal (rinitis alérgica), calvas o lesiones por el rascado.	Evitar el alérgeno (ej. evitar césped en época de polen). Medicamentos (antiinflamatorios) recetados por el veterinario para el picor.	\N	\N	1	\N
85	Alergias Alimentarias	t	Poco frecuentes (menos del 10% de las alergias caninas). El manejo es a largo plazo con dieta especializada.	Proteinas comunes como la ternera, el pollo o los lácteos.	\N	Más frecuentemente reacciones cutáneas (picor, hinchazón) que digestivas, aunque pueden ocurrir vómitos o diarrea.	Dieta de eliminación (alimentos hidrolizados/hipoalergénicos) para el diagnóstico. Una vez confirmado, eliminar el ingrediente de la dieta.	\N	\N	1	\N
86	Reacciones Alérgicas Agudas	t	Mortal si no se trata urgentemente.	Picadura de insecto (abejas, avispas), medicamentos u otros alérgenos.	\N	Dificultad para respirar, sibilancias, hinchazón de la cara, urticaria, babeo, vómitos, convulsiones, pérdida de consciencia.	ATENCIÓN VETERINARIA DE EMERGENCIA INMEDIATA.	\N	\N	1	\N
115	Tos de las perreras	f	\N	Bacterias o Virus	Contagiosa del tracto respiratorio superior.	Tos frecuente, presión en la tráquea, fiebre leve, moqueo nasal, ojos llorosos.	Medicamento especializado, no ejercer presión con la correa, agua tibia, evitar lugares fríos.	\N	\N	1	7
116	Diabetes mellitus	f	\N	Mala alimentacion	\N	Sed y orina excesiva, pérdida de peso considerable a pesar de comer mucho.	Tratamiento de por vida con inyecciones de insulina (dosis determinada por el veterinario).	\N	\N	1	5
117	Insuficiencia Renal	f	\N	Edad avanzada, degeneración renal, ingesta de químicos o uso excesivo de medicamentos.	\N	Mal aliento, aumento de sed y orina, desgano, pérdida de apetito y peso, vómitos.	Medicamentos y alimento especial para mantener el estado de salud.	\N	\N	1	5
118	Parvovirus	f	\N	Virus	Viral del intestino.	Diarrea y vómito constantes, sangre en heces, temblores, decaimiento, pérdida de apetito, deshidratación.	Administración de Vitamina K, suero (oral/intravenoso), antibióticos, antidiarreicos.	\N	\N	1	1
119	Ectoparásitos	f	\N	Parasitos	Contacto directo, ambiente cálido y húmedo (pulgas/ácaros), paseo por alta vegetación (garrapatas).	Comezón severa, áreas de piel enrojecidas, inflamación de la piel. (Garrapatas: Inapetencia, fiebre, orina con sangre).	Tratamiento a base de pipetas y champú. Limpieza estricta del entorno.	\N	\N	1	3
120	Endoparásitos	f	\N	Parasitos Intestinales	Ingesta de parásitos o sus huevos.	Estómago muy hinchado (más notorio en cachorros), problemas digestivos, diarrea sanguinolenta, presencia de gusanos en heces.	Tratamiento antiparasitario indicado por el veterinario.	\N	\N	1	3
121	Tumores	f	\N	\N	\N	Falta de apetito y pérdida de peso, protuberancias en la piel o masas duras (ej. glándulas mamarias), debilidad.	Cirugía, quimioterapia y/o radioterapia.	\N	\N	1	6
122	Sarna	f	\N	Varias especies de ácaros	Altamente contagiosa por contacto.	Picazón severa, enrojecimiento, áreas de piel ásperas/secas, pérdida de pelo y mal olor.	Tratamiento específico según el tipo de ácaro, recetado por un especialista.	\N	\N	1	3
123	Infecciones de Oído	f	\N	Bacterias, hongos o parásitos.	\N	Rascarse mucho las orejas, sacudir la cabeza, mal olor o brillo en el interior, mucho cerumen.	Antibióticos y soluciones especiales para limpieza recetadas por el veterinario.	\N	\N	1	7
124	Torsión Gástrica	f	\N	Rotación del estómago y vasos sanguíneos (generalmente por actividad física intensa después de comer).	\N	Estómago inflamado, inquietud, no come, exceso de salivación, arcadas.	Cirugía de urgencia.	\N	\N	1	9
125	Peritonitis	f	\N	Inflamación del peritoneo por bacterias, trauma abdominal, cáncer o pancreatitis.	\N	Vómitos, diarrea, fiebre, pérdida de apetito y abdomen hinchado.	Atención médica veterinaria inmediata.	\N	\N	1	10
126	Derivación Portosistémica	f	\N	Vaso sanguíneo que se salta el hígado (puede ser congénito o por enfermedad hepática).	Puede ser congénito o adquirido.	N/A (Requiere análisis médicos, pero afecta la capacidad del hígado para procesar toxinas).	Cirugía (si es congénita) o tratamiento para la enfermedad hepática subyacente (si es adquirida).	\N	\N	1	11
127	Obstrucción de Glándulas Anales	f	\N	Obstrucción de los sacos anales.	\N	Frotar el ano contra el suelo, lamer la zona anal, molestia al caminar, falta de movimiento de la cola.	El veterinario o un profesional debe vaciar y limpiar las glándulas.	\N	\N	1	9
128	Displasia de Cadera	f	\N	Falta de desarrollo de la articulación de la cadera.	\N	Dolor persistente, posible pandeo de la cadera, dificultad al caminar.	\N	\N	\N	1	8
129	Reacción Adversa a Fármacos/Vacunas	t	Potencialmente mortal (Anafilaxia); Reacción localizada suele ser autolimitada.	Medicamentos, Vacunas, Hemoderivados, Picaduras/Mordeduras de insectos	\N	No documentado con detalle en reptiles; en general, dificultad respiratoria, hinchazón facial/local, shock, colapso.	Urgencia veterinaria; inyecciones intravenosas (epinefrina), antihistamínicos, antiinflamatorios, fluidos.	\N	\N	4	12
130	Dermatitis Alérgica (Atopia/Contacto)	t	No Documentado.	No Documentado (en mamíferos: polen, ácaros, mohos, etc.)	\N	No Documentado; en mamíferos se presenta como prurito intenso, enrojecimiento, rascado, infecciones secundarias.	No Documentado. Se trataría de eliminar el presunto alérgeno/irritante y tratamiento sintomático (corticoides, antihistamínicos).	\N	\N	4	12
131	Alergia Alimentaria Cutánea/Gastrointestinal	t	No Documentado.	No Documentado (en mamíferos: fuentes de proteínas como carne de vaca, pollo, trigo, etc.)	\N	No Documentado; en mamíferos: vómitos, diarrea, prurito.	No Documentado. En mamíferos, se usa una dieta de eliminación.	\N	\N	4	12
132	Abscesos	f	Recidiva frecuente si no se extirpan; variable	Infección bacteriana (varias especies)	Mordeduras, lesiones, malas condiciones ambientales	Úlceras llenas de pus, inflamación, pequeños bultos o tumefacciones (subcutáneos)	Extirpación quirúrgica (pequeños), abrir y drenar (grandes), antibióticos apropiados	\N	\N	4	2
133	Dermatofitosis	f	Variable	Infección fúngica (hongo)	Lesión en la piel proporciona punto de entrada	Infección fúngica de la piel o uñas; caparazón con tejido muerto/dañado/infectado	Retirar tejido muerto/dañado, solución antiséptica, antimicóticos orales o tópicos, luz ultravioleta	\N	\N	4	3
134	Disecdisis (Muda Anormal)	f	Puede provocar infecciones secundarias; prevenible	Baja humedad, parásitos cutáneos, deficiencias nutricionales, enfermedades infecciosas	Factores de manejo o internos	Desprendimiento incompleto de la piel, escamas supraoculares o bandas de piel retenidas	Sumergir en agua tibia y retirar suavemente la piel retenida; pomada ocular (escamas supraoculares); cámara de humedad	\N	\N	4	4
135	E. Ulcerativa Cutánea Septicémica	f	Septicemia y muerte posibles (C. freundii); variable	Citrobacter freundii, Serratia spp. (sinérgico), Vibrio (Beneckea) chitinovora	Contaminación bacteriana; la alimentación con cangrejos a menudo implicada (Vibrio)	Caparazón con orificios, secreción purulenta, anorexia, letargo, hemorragias, necrosis hepática, abscesos	Antibióticos sistémicos, desbridamiento; Yodo tópico + antibióticos (Vibrio); higiene correcta	\N	\N	4	7
136	Dermatitis Necrótica (Pudrición de Escamas)	f	Puede causar septicemia y muerte	Aeromonas spp., Pseudomonas spp., varias bacterias/hongos	Condiciones antihigiénicas, humedad excesiva, lechos contaminados, piel dañada	Eritema, necrosis, ulceración de la dermis, descarga exudativa; hemorragia en escamas seguida de pústulas y lesiones abiertas	Desbridamiento, antibióticos sistémicos y tópicos, higiene excelente	\N	\N	4	2
137	E. Cuerpos de Inclusión (ECI)	f	Mal pronóstico (crónica en boas, aguda/fatal en pitones)	Reptarenavirus	Contacto con fluidos corporales, reproducción, peleas, contaminación fecal/oral, ácaros de las serpientes	Boas: Incapacidad para ganar peso, anorexia, signos neurológicos. Pitones: Curso más agudo, signos neurológicos profundos.	No tiene cura. Aislamiento, terapia de soporte, paliativos, eutanasia.	\N	\N	4	1
138	Gota	f	Variable, puede ser crónica	Asociado a problemas metabólicos, exceso de ácido úrico	Dieta inadecuada, deshidratación	Tofos (depósitos de urato) mineralizados o radiolúcidos en órganos y articulaciones; dolor al movimiento, falta de apetito	Terapia a largo plazo; eutanasia si hay dolor severo and anorexia	\N	\N	4	7
139	Hiperparatiroidismo Nutricional Secundario	f	Variable, mejor con intervención temprana	Deficiencias nutricionales (Ca, Vitamina D3 o relación Ca:P inadecuada)	Dieta inadecuada; manejo incorrecto de iluminación/suplementos	Debilidad ósea, deformidades, fracturas patológicas	Corrección de la dieta y manejo ambiental	\N	\N	4	4
140	Estomatitis	f	Variable, grave si no se trata	Bacterias (principalmente), hongos, virus o tumores	Malas condiciones de manejo, deficiencias nutricionales, ácaros, traumatismo oral, tumores	Inflamación e infección de encías, lengua, paladar y labios; puede afectar el tracto digestivo superior	Desbridamiento, antibióticos, tratamiento de la causa subyacente	\N	\N	4	1
141	Septicemia	f	Frecuente causa de muerte. Grave.	Aeromonas spp., Pseudomonas spp. (a menudo).	Infección generalizada a partir de traumatismo, infección localizada, parasitismo o estrés ambiental. Aeromonas se transmite a través de ectoparásitos.	Dificultad respiratoria, letargo, convulsiones, falta de coordinación (terminales), petequias en el abdomen. En quelonios: eritema de la concha ventral.	Aislar al animal. Iniciar tratamiento antibiótico. Corregir higiene y cuidado.	\N	\N	4	7
142	Enfermedad Ulcerativa Cutánea Septicémica	f	Grave debido a la septicemia. La variante por Vibrio rara vez causa septicemia.	Comúnmente Citrobacter freundii. Serratia spp. puede facilitar la entrada. También por Vibrio (Beneckea) chitinovora (asociada a cangrejos).	Malas condiciones de higiene del agua. La variante por Vibrio se relaciona con la alimentación con cangrejos.	Lesiones en el caparazón con orificios y secreción purulenta. Anorexia, letargo, hemorragias petequiales. Necrosis hepática y abscesos son comunes.	Antibióticos sistémicos. Desbridamiento de heridas. Higiene correcta (esencial para la prevención). Para Vibrio: yodo tópico y antibióticos, desaconsejar cangrejos.	\N	\N	4	7
143	Ulceración o Dermatitis Necrótica (Pudrición de las escamas)	f	Puede llevar a septicemia y muerte si no se trata.	Aeromonas spp., Pseudomonas spp. y otras bacterias (infección secundaria a daño primario). Proliferación bacteriana y fúngica.	Mantenimiento en condiciones antihigiénicas, humedad excesiva, condensación. Exposición a productos de degradación fecal, daños por suelos calefactables.	Eritema, necrosis, ulceración de la dermis, descarga exudativa. Puede empezar como ampollas o pústulas. Puede progresar a septicemia.	Desbridamiento. Antibióticos sistémicos. Pomadas antibióticas tópicas. Excelente higiene y cuidado general.	\N	\N	4	2
144	Abscesos (Subcutáneos y Viscerales)	f	El pronóstico depende de la extirpación completa; los antibióticos sistémicos solos rara vez tienen éxito en abscesos viscerales.	Peptostreptococcus (anaerobio), y una variedad de aerobios como Pseudomonas, Aeromonas, Salmonella, Staphylococcus, etc. (a menudo en combinación).	Lesiones traumáticas, heridas por mordeduras, o manejo inadecuado. Abscesos viscerales por infección hematógena o translocación intestinal.	Nódulos o tumefacciones (subcutáneos). Abscesos viscerales que pueden causar celiomitis. Abscesos subespeculares en serpientes (debajo del ojo).	Extirpación completa (pequeños localizados). Resección total con desbridamiento y lavados antisépticos locales. Intervención quirúrgica para abscesos viscerales. Suplementos de Vitamina A para afecciones oculares en tortugas.	\N	\N	4	7
145	Estomatitis Infecciosa (Boca podrida)	f	Puede ser grave si la infección se extiende y causa osteomielitis.	Aeromonas spp., Pseudomonas spp. (con mayor frecuencia), y variedad de bacterias Gram negativas y positivas, aerobias y anaerobias.	Bacterias a menudo presentes en la boca. Factores predisponentes como estrés e inmunosupresión.	Petequias en la cavidad oral (precoz). Desarrollo de material caseoso a lo largo de los dientes. En casos graves: osteomielitis de mandíbula y maxilar.	Desbridamiento quirúrgico. Irrigación repetida con antisépticos. Antibióticos sistémicos. Terapia de soporte. Suplementación con Vitaminas A y C.	\N	\N	4	2
146	Neumonía (Infecciones respiratorias)	f	Puede llevar a septicemia en casos graves o prolongados.	Aeromonas spp., Pseudomonas spp. (a menudo), pero muchas infecciones son de carácter mixto.	Parasitismo, temperatura/humedad ambiental desfavorable, ventilación insuficiente, malas condiciones sanitarias, malnutrición.	Respiración oral, secreción nasal o glotal, disnea.	Mejorar el cuidado y mantener la temperatura en el límite superior de la ZTOP. Iniciar antibioterapia sistémica. Nebulización con antibióticos y acetilcisteína. Corrección dietética (Vitamina A).	\N	\N	4	7
147	Micoplasmosis	f	En caimanes americanos: enfermedad sistémica grave y frecuentemente muerte.	Especies de Mycoplasma.	Desconocido en el texto.	En quelonios: rinitis y enfermedad de las vías respiratorias superiores (a menudo crónica e intermitente). En cocodrilos: poliserositis y enfermedad sistémica grave.	Tetraciclinas y macrólidos.	\N	\N	4	7
148	Otitis (Infecciones del oído)	f	Suele ser curativo con la eliminación total de la infección.	Proteus spp., Pseudomonas spp., Citrobacter spp., Morganella morganii, y otras bacterias.	Secundaria a hipovitaminosis A o por infecciones ascendentes desde la cavidad oral.	Inflamación intensa de la membrana timpánica. Presencia de material caseoso.	Incisión en la membrana timpánica, aspiración completa. Lavado con povidona yodada diluida. Tratamiento quirúrgico.	\N	\N	4	2
149	Osteopatía Espinal/Osteomielitis	f	Pronóstico suele ser reservado o desfavorable.	Infecciones bacterianas crónicas, más comúnmente asociadas con Salmonella spp.	Asociada a infecciones bacterianas crónicas.	Lesiones espinales proliferativas y progresivas.	Tratamiento antibiótico a largo plazo puede ser útil.	\N	\N	4	2
150	Micobacteriosis	f	La mayoría de los casos se eutanasian en un estadio avanzado. Muy grave.	Mycobacterium ulcerans, M. chelonae, M. marinum, etc.	Más frecuente en reptiles silvestres importados (con adelgazamiento crónico), pero también en cautividad.	Adelgazamiento crónico. Lesiones granulomatosas. Quelonios: afección pulmonar. Lagartos, serpientes y cocodrilos: granulomas viscerales.	No hay informes de tratamiento exitoso (la rifampicina e isoniacida son hepatotóxicos a largo plazo).	\N	\N	4	7
151	Infección por Salmonella enterica	f	Para el reptil es un microorganismo comensal.	Especies de Salmonella.	Forma parte de la flora GI en reptiles clínicamente sanos. Transmisión a humanos por manipulación (zoonosis).	Los reptiles están a menudo clínicamente sanos.	No se recomienda intentar eliminar la bacteria. Se debe concientizar sobre el riesgo zoonótico para los humanos.	\N	\N	4	7
152	Herpesvirus (forma general)	f	Variada, puede causar necrosis hepática o síntomas debilitantes (anorexia).	Herpesvirus	Desconocida.	Tortugas de agua dulce: Necrosis hepática. Tortugas terrestres: Necrosis de la mucosa oral, anorexia, regurgitación, secreción oral y ocular.	Aislamiento, terapia de soporte. Aplicación de Aciclovir al 5 % a lesiones orales. Aciclovir por vía sistémica.	\N	\N	4	1
153	Adenovirus	f	Letal en muchas especies. Alta morbilidad en dragones barbudos jóvenes, pero mayor supervivencia con tratamiento de apoyo.	Adenovirus	Contaminación fecal/oral (especialmente en dragones barbudos).	Enfermedades hepáticas o GI letales. En dragones barbudos jóvenes: letargo, debilidad, pérdida de peso, diarrea y muerte súbita. Signos inespecíficos; más leves en adultos.	Tratamiento de apoyo (líquidos, alimentación forzada). Antibióticos para infecciones secundarias. Cuarentena de al menos 3 meses para lagartos recuperados.	\N	\N	4	1
\.


--
-- Data for Name: presentacion_medicamento; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.presentacion_medicamento (id_presentacion_medicamento, id_medicamento, id_presentacion, id_forma_farmaceutica, cantidad, id_unidad_medida, id_especie) FROM stdin;
2	1	1	1	10.00	2	4
3	2	2	2	100.00	2	4
4	3	3	3	60.00	4	4
5	4	4	4	5.00	1	4
6	5	5	5	50.00	1	4
7	6	1	6	10.00	2	4
8	7	2	7	60.00	4	4
9	8	3	8	50.00	1	4
10	9	4	9	50.00	2	4
11	10	5	10	250.00	2	4
12	11	1	11	120.00	2	4
13	12	2	12	10.00	1	4
14	13	3	13	10.00	2	4
15	14	4	14	150.00	2	4
16	15	5	15	60.00	4	4
17	16	1	16	5.00	1	4
18	17	2	17	50.00	1	4
19	18	3	18	10.00	2	4
20	19	4	19	60.00	4	4
21	20	5	20	50.00	1	4
22	21	1	21	50.00	2	4
23	22	2	22	250.00	2	4
24	23	3	23	120.00	2	4
25	24	4	24	10.00	1	4
26	25	5	25	10.00	2	4
27	26	1	26	60.00	2	4
28	27	2	27	60.00	4	4
29	28	3	28	5.00	1	4
30	29	4	29	50.00	1	4
31	30	5	30	10.00	2	4
32	31	1	31	60.00	4	4
33	32	2	32	50.00	1	4
34	33	3	33	50.00	2	4
35	34	4	34	250.00	2	4
36	35	5	35	120.00	2	4
37	36	1	36	10.00	1	4
38	37	2	37	10.00	2	4
39	38	3	38	120.00	2	4
40	39	4	39	60.00	4	4
41	40	5	40	5.00	1	4
42	41	1	41	50.00	1	4
43	42	2	42	10.00	2	4
44	43	3	43	60.00	4	4
45	44	4	44	50.00	1	4
46	45	5	45	50.00	2	4
47	46	1	46	250.00	2	4
48	47	2	47	120.00	2	4
49	48	3	48	10.00	1	4
50	49	4	49	10.00	2	4
51	50	5	50	30.00	2	4
52	51	1	51	60.00	4	4
53	52	2	52	5.00	1	4
54	53	3	53	50.00	1	4
55	54	4	54	10.00	2	4
56	55	5	55	60.00	4	4
57	56	1	56	50.00	1	4
58	57	2	57	50.00	2	4
59	58	3	58	250.00	2	4
60	59	4	59	120.00	2	4
61	60	5	60	10.00	1	4
62	61	1	61	10.00	2	4
63	62	2	62	100.00	2	4
64	63	3	63	60.00	4	4
65	64	4	64	5.00	1	4
66	65	5	65	50.00	1	4
67	66	1	66	10.00	2	4
68	67	2	67	60.00	4	4
69	68	3	68	50.00	1	4
70	69	4	69	50.00	2	4
71	70	5	70	250.00	2	4
72	71	1	71	120.00	2	4
73	72	2	72	10.00	1	4
74	73	3	73	10.00	2	4
75	74	4	74	150.00	2	4
76	75	5	75	60.00	4	4
77	76	1	76	5.00	1	4
78	77	2	77	50.00	1	4
79	78	3	78	10.00	2	4
80	79	4	79	60.00	4	4
81	80	5	80	50.00	1	4
82	81	1	81	50.00	2	4
83	82	2	82	250.00	2	4
84	83	3	83	120.00	2	4
85	84	4	84	10.00	1	4
86	85	5	85	10.00	2	4
87	86	1	86	60.00	2	4
88	87	2	87	60.00	4	4
89	88	3	88	5.00	1	4
90	89	4	89	50.00	1	4
91	90	5	90	10.00	2	4
92	91	1	91	60.00	4	4
93	92	2	92	50.00	1	4
94	93	3	93	50.00	2	4
95	94	4	94	250.00	2	4
96	95	5	95	120.00	2	4
97	96	1	96	10.00	1	4
98	97	2	97	10.00	2	4
99	98	3	98	120.00	2	4
100	99	4	99	60.00	4	4
101	100	5	100	5.00	1	4
102	101	1	101	50.00	1	4
103	102	2	102	10.00	2	4
104	103	3	103	60.00	4	4
105	104	4	104	50.00	1	4
106	105	5	105	50.00	2	4
107	106	1	106	250.00	2	4
108	107	2	107	120.00	2	4
109	108	3	108	10.00	1	4
110	109	4	109	10.00	2	4
111	110	5	110	30.00	2	4
112	111	1	111	60.00	4	4
113	112	2	112	5.00	1	4
114	113	3	113	50.00	1	4
115	114	4	114	10.00	2	4
116	115	5	115	60.00	4	4
117	116	1	116	50.00	1	4
118	117	2	117	50.00	2	4
119	118	3	118	250.00	2	4
120	119	4	119	120.00	2	4
121	120	5	120	10.00	1	4
122	121	1	121	10.00	2	4
123	122	2	122	100.00	2	4
124	123	3	123	60.00	4	4
125	124	4	124	5.00	1	4
126	125	5	125	50.00	1	4
127	126	1	126	10.00	2	4
128	127	2	127	60.00	4	4
129	128	3	128	50.00	1	4
130	129	4	129	50.00	2	4
131	130	5	130	250.00	2	4
132	131	1	131	120.00	2	4
133	132	2	132	10.00	1	4
134	133	3	133	10.00	2	4
135	134	4	134	150.00	2	4
136	135	5	135	60.00	4	4
137	136	1	136	5.00	1	4
138	137	2	137	50.00	1	4
139	138	3	138	10.00	2	4
140	139	4	139	60.00	4	4
141	140	5	140	50.00	1	4
142	141	1	141	50.00	2	4
143	142	2	142	250.00	2	4
144	143	3	143	120.00	2	4
145	144	4	144	10.00	1	4
146	145	5	145	10.00	2	4
147	146	1	146	60.00	2	4
148	147	2	147	60.00	4	4
149	148	3	148	5.00	1	4
150	149	4	149	50.00	1	4
151	150	5	150	10.00	2	4
152	151	1	151	60.00	4	4
153	152	2	152	50.00	1	4
154	153	3	153	50.00	2	4
155	154	4	154	250.00	2	4
156	155	5	155	120.00	2	4
157	156	1	156	10.00	1	4
158	157	2	157	10.00	2	4
159	158	3	158	120.00	2	4
160	159	4	159	60.00	4	4
161	160	5	160	5.00	1	4
162	161	1	161	50.00	1	4
163	162	2	162	10.00	2	4
164	163	3	163	60.00	4	4
165	164	4	164	50.00	1	4
166	165	5	165	50.00	2	4
167	166	1	166	250.00	2	4
168	167	2	167	120.00	2	4
169	168	3	168	10.00	1	4
170	169	4	169	10.00	2	4
171	170	5	170	30.00	2	4
172	171	1	171	60.00	4	4
173	172	2	172	5.00	1	4
174	173	3	173	50.00	1	4
175	174	4	174	10.00	2	4
176	175	5	175	60.00	4	4
177	176	1	176	50.00	1	4
178	177	2	177	50.00	2	4
179	178	3	178	250.00	2	4
180	179	4	179	120.00	2	4
181	180	5	180	10.00	1	4
182	181	1	181	10.00	2	4
183	182	2	182	100.00	2	4
184	183	3	183	60.00	4	4
185	184	4	184	5.00	1	4
186	185	5	185	50.00	1	4
187	186	1	186	10.00	2	4
188	187	2	187	60.00	4	4
189	188	3	188	50.00	1	4
190	189	4	189	50.00	2	4
191	190	5	190	250.00	2	4
192	191	1	191	120.00	2	4
193	192	2	192	10.00	1	4
194	193	3	193	10.00	2	4
195	194	4	194	150.00	2	4
196	195	5	195	60.00	4	4
197	196	1	196	5.00	1	4
198	197	2	197	50.00	1	4
199	198	3	198	10.00	2	4
200	199	4	199	60.00	4	4
201	200	5	200	50.00	1	4
202	201	1	201	50.00	2	4
203	202	2	202	250.00	2	4
204	203	3	203	120.00	2	4
205	204	4	204	10.00	1	4
206	205	5	205	10.00	2	4
207	206	1	206	60.00	2	4
208	207	2	207	60.00	4	4
209	208	3	208	5.00	1	4
210	209	4	209	50.00	1	4
211	210	5	210	10.00	2	4
212	211	1	211	60.00	4	4
213	212	2	212	50.00	1	4
214	213	3	213	50.00	2	4
215	214	4	214	250.00	2	4
216	215	5	215	120.00	2	4
217	216	1	216	10.00	1	4
218	217	2	217	10.00	2	4
219	218	3	218	120.00	2	4
220	219	4	219	60.00	4	4
221	220	5	220	5.00	1	4
222	221	1	221	50.00	1	4
223	222	2	222	10.00	2	4
224	223	3	223	60.00	4	4
225	224	4	224	50.00	1	4
226	225	5	225	50.00	2	4
227	226	1	226	250.00	2	4
228	227	2	227	120.00	2	4
229	228	3	228	10.00	1	4
230	229	4	229	10.00	2	4
231	230	5	230	30.00	2	4
232	231	1	231	60.00	4	4
233	232	2	232	5.00	1	4
234	233	3	233	50.00	1	4
235	234	4	234	10.00	2	4
236	235	5	235	60.00	4	4
237	236	1	236	50.00	1	4
238	237	2	237	50.00	2	4
239	238	3	238	250.00	2	4
240	239	4	239	120.00	2	4
241	240	5	240	10.00	1	4
242	241	1	241	10.00	2	4
243	242	2	242	100.00	2	4
244	243	3	243	60.00	4	4
245	244	4	244	5.00	1	4
246	245	5	245	50.00	1	4
247	246	1	246	10.00	2	4
248	247	2	247	60.00	4	4
249	248	3	248	50.00	1	4
250	249	4	249	50.00	2	4
251	250	5	250	250.00	2	4
252	251	1	251	120.00	2	4
253	252	2	252	10.00	1	4
254	253	3	253	10.00	2	4
255	254	4	254	150.00	2	4
256	255	5	255	60.00	4	4
257	256	1	256	5.00	1	4
258	257	2	257	50.00	1	4
259	258	3	258	10.00	2	4
260	259	4	259	60.00	4	4
261	260	5	260	50.00	1	4
262	261	1	261	50.00	2	4
263	262	2	262	250.00	2	4
264	263	3	263	120.00	2	4
265	264	4	264	10.00	1	4
266	265	5	265	10.00	2	4
267	266	1	266	60.00	2	4
268	267	2	267	60.00	4	4
269	268	3	268	5.00	1	4
270	269	4	269	50.00	1	4
271	270	5	270	10.00	2	4
272	271	1	271	60.00	4	4
273	272	2	272	50.00	1	4
274	273	3	273	50.00	2	4
275	274	4	274	250.00	2	4
276	275	5	275	120.00	2	4
277	276	1	276	10.00	1	4
278	277	2	277	10.00	2	4
279	278	3	278	120.00	2	4
280	279	4	279	60.00	4	4
281	280	5	280	5.00	1	4
282	281	1	281	50.00	1	4
283	282	2	282	10.00	2	4
284	283	3	283	60.00	4	4
285	284	4	284	50.00	1	4
286	285	5	285	50.00	2	4
287	286	1	286	250.00	2	4
288	287	2	287	120.00	2	4
289	288	3	288	10.00	1	4
290	289	4	289	10.00	2	4
291	290	5	290	30.00	2	4
292	291	1	291	60.00	4	4
293	292	2	292	5.00	1	4
294	293	3	293	50.00	1	4
295	294	4	294	10.00	2	4
296	295	5	295	60.00	4	4
297	296	1	296	50.00	1	4
298	297	2	297	50.00	2	4
299	298	3	298	250.00	2	4
300	299	4	299	120.00	2	4
301	300	5	300	10.00	1	4
302	301	1	301	10.00	2	4
303	302	2	302	100.00	2	4
304	303	3	303	60.00	4	4
305	304	4	304	5.00	1	4
306	305	5	305	50.00	1	4
307	306	1	306	10.00	2	4
308	307	2	307	60.00	4	4
309	308	3	308	50.00	1	4
310	309	4	309	50.00	2	4
311	310	5	310	250.00	2	4
312	311	1	311	120.00	2	4
313	312	2	312	10.00	1	4
314	313	3	313	10.00	2	4
315	314	4	314	150.00	2	4
316	315	5	315	60.00	4	4
317	316	1	316	5.00	1	4
318	317	2	317	50.00	1	4
319	318	3	318	10.00	2	4
320	319	4	319	60.00	4	4
321	320	5	320	50.00	1	4
322	321	1	321	50.00	2	4
323	322	2	322	250.00	2	4
324	323	3	323	120.00	2	4
325	324	4	324	10.00	1	4
326	325	5	325	10.00	2	4
327	326	1	326	60.00	2	4
328	327	2	327	60.00	4	4
329	328	3	328	5.00	1	4
330	329	4	329	50.00	1	4
331	330	5	330	10.00	2	4
332	331	1	331	60.00	4	4
333	332	2	332	50.00	1	4
334	333	3	333	50.00	2	4
335	334	4	334	250.00	2	4
336	335	5	335	120.00	2	4
337	336	1	336	10.00	1	4
338	337	2	337	10.00	2	4
339	338	3	338	120.00	2	4
340	339	4	339	60.00	4	4
341	340	5	340	5.00	1	4
342	341	1	341	50.00	1	4
343	342	2	342	10.00	2	4
344	343	3	343	60.00	4	4
345	344	4	344	50.00	1	4
346	345	5	345	50.00	2	4
347	346	1	346	250.00	2	4
348	347	2	347	120.00	2	4
349	348	3	348	10.00	1	4
350	349	4	349	10.00	2	4
351	350	5	350	30.00	2	4
352	351	1	351	60.00	4	4
353	352	2	352	5.00	1	4
354	353	3	353	50.00	1	4
355	354	4	354	10.00	2	4
356	355	5	355	60.00	4	4
357	356	1	356	50.00	1	4
358	357	2	357	50.00	2	4
359	358	3	358	250.00	2	4
360	359	4	359	120.00	2	4
361	360	5	360	10.00	1	4
362	361	1	361	10.00	2	4
363	362	2	362	100.00	2	4
364	363	3	363	60.00	4	4
365	364	4	364	5.00	1	4
366	365	5	365	50.00	1	4
367	366	1	366	10.00	2	4
368	367	2	367	60.00	4	4
369	368	3	368	50.00	1	4
370	369	4	369	50.00	2	4
371	370	5	370	250.00	2	4
372	371	1	371	120.00	2	4
373	372	2	372	10.00	1	4
374	373	3	373	10.00	2	4
375	374	4	374	150.00	2	4
376	375	5	375	60.00	4	4
377	376	1	376	5.00	1	4
378	377	2	377	50.00	1	4
379	378	3	378	10.00	2	4
380	379	4	379	60.00	4	4
381	380	5	380	50.00	1	4
382	381	1	381	50.00	2	4
383	382	2	382	250.00	2	4
384	383	3	383	120.00	2	4
385	384	4	384	10.00	1	4
386	385	5	385	10.00	2	4
387	386	1	386	60.00	2	4
388	387	2	387	60.00	4	4
389	388	3	388	5.00	1	4
390	389	4	389	50.00	1	4
391	390	5	390	10.00	2	4
392	391	1	391	60.00	4	4
393	392	2	392	50.00	1	4
394	393	3	393	50.00	2	4
395	394	4	394	250.00	2	4
396	395	5	395	120.00	2	4
397	396	1	396	10.00	1	4
398	397	2	397	10.00	2	4
399	398	3	398	120.00	2	4
400	399	4	399	60.00	4	4
401	400	5	400	5.00	1	4
402	401	1	401	50.00	1	4
403	402	2	402	10.00	2	4
404	403	3	403	60.00	4	4
405	404	4	404	50.00	1	4
406	405	5	405	50.00	2	4
407	406	1	406	250.00	2	4
408	407	2	407	120.00	2	4
409	408	3	408	10.00	1	4
410	409	4	409	10.00	2	4
411	410	5	410	30.00	2	4
412	411	1	411	60.00	4	4
413	412	2	412	5.00	1	4
414	413	3	413	50.00	1	4
415	414	4	414	10.00	2	4
416	415	5	415	60.00	4	4
417	416	1	416	50.00	1	4
418	417	2	417	50.00	2	4
419	418	3	418	250.00	2	4
420	419	4	419	120.00	2	4
421	420	5	420	10.00	1	4
422	421	1	421	10.00	2	4
423	422	2	422	100.00	2	4
424	423	3	423	60.00	4	4
425	424	4	424	5.00	1	4
426	425	5	425	50.00	1	4
427	426	1	426	10.00	2	4
428	427	2	427	60.00	4	4
429	428	3	428	50.00	1	4
430	429	4	429	50.00	2	4
431	430	5	430	250.00	2	4
432	431	1	431	120.00	2	4
433	432	2	432	10.00	1	4
434	433	3	433	10.00	2	4
435	434	4	434	150.00	2	4
436	435	5	435	60.00	4	4
437	436	1	436	5.00	1	4
438	437	2	437	50.00	1	4
439	438	3	438	10.00	2	4
440	439	4	439	60.00	4	4
441	440	5	440	50.00	1	4
442	441	1	441	50.00	2	4
443	442	2	442	250.00	2	4
444	443	3	443	120.00	2	4
445	444	4	444	10.00	1	4
446	445	5	445	10.00	2	4
447	446	1	446	60.00	2	4
448	447	2	447	60.00	4	4
449	448	3	448	5.00	1	4
450	449	4	449	50.00	1	4
451	450	5	450	10.00	2	4
452	451	1	451	60.00	4	4
453	452	2	452	50.00	1	4
454	453	3	453	50.00	2	4
455	454	4	454	250.00	2	4
456	455	5	455	120.00	2	4
457	456	1	456	10.00	1	4
458	457	2	457	10.00	2	4
459	458	3	458	120.00	2	4
460	459	4	459	60.00	4	4
461	460	5	460	5.00	1	4
462	461	1	461	50.00	1	4
463	462	2	462	10.00	2	4
464	463	3	463	60.00	4	4
465	464	4	464	50.00	1	4
466	465	5	465	50.00	2	4
467	466	1	466	250.00	2	4
468	467	2	467	120.00	2	4
469	468	3	468	10.00	1	4
470	469	4	469	10.00	2	4
471	470	5	470	30.00	2	4
472	471	1	471	60.00	4	4
473	472	2	472	5.00	1	4
474	473	3	473	50.00	1	4
475	474	4	474	10.00	2	4
476	475	5	475	60.00	4	4
477	476	1	476	50.00	1	4
478	477	2	477	50.00	2	4
479	478	3	478	250.00	2	4
480	479	4	479	120.00	2	4
481	480	5	480	10.00	1	4
482	481	1	481	10.00	2	4
483	482	2	482	100.00	2	4
484	483	3	483	60.00	4	4
485	484	4	484	5.00	1	4
486	485	5	485	50.00	1	4
487	486	1	486	10.00	2	4
488	487	2	487	60.00	4	4
489	488	3	488	50.00	1	4
490	489	4	489	50.00	2	4
491	490	5	490	250.00	2	4
492	491	1	491	120.00	2	4
493	492	2	492	10.00	1	4
494	493	3	493	10.00	2	4
495	494	4	494	150.00	2	4
496	495	5	495	60.00	4	4
497	496	1	496	5.00	1	4
498	497	2	497	50.00	1	4
499	498	3	498	10.00	2	4
500	499	4	499	60.00	4	4
501	500	5	500	50.00	1	4
502	501	1	501	50.00	2	4
503	502	2	502	250.00	2	4
504	503	3	503	120.00	2	4
505	504	4	504	10.00	1	4
506	505	5	505	10.00	2	4
507	506	1	506	60.00	2	4
508	507	2	507	60.00	4	4
509	508	3	508	5.00	1	4
510	509	4	509	50.00	1	4
511	510	5	510	10.00	2	4
512	511	1	511	60.00	4	4
513	512	2	512	50.00	1	4
514	513	3	513	50.00	2	4
515	514	4	514	250.00	2	4
516	515	5	515	120.00	2	4
517	516	1	516	10.00	1	4
518	517	2	517	10.00	2	4
519	518	3	518	120.00	2	4
520	519	4	519	60.00	4	4
521	520	5	520	5.00	1	4
522	521	1	521	50.00	1	4
523	522	2	522	10.00	2	4
524	523	3	523	60.00	4	4
525	524	4	524	50.00	1	4
526	525	5	525	50.00	2	4
527	526	1	526	250.00	2	4
528	527	2	527	120.00	2	4
529	528	3	528	10.00	1	4
530	529	4	529	10.00	2	4
531	530	5	530	30.00	2	4
532	531	1	531	60.00	4	4
533	532	2	532	5.00	1	4
534	533	3	533	50.00	1	4
535	534	4	534	10.00	2	4
536	535	5	535	60.00	4	4
537	536	1	536	50.00	1	4
538	537	2	537	50.00	2	4
539	538	3	538	250.00	2	4
540	539	4	539	120.00	2	4
541	540	5	540	10.00	1	4
542	541	1	541	10.00	2	4
543	542	2	542	100.00	2	4
544	543	3	543	60.00	4	4
545	544	4	544	5.00	1	4
546	545	5	545	50.00	1	4
547	546	1	546	10.00	2	4
548	547	2	547	60.00	4	4
549	548	3	548	50.00	1	4
550	549	4	549	50.00	2	4
551	550	5	550	250.00	2	4
552	551	1	551	120.00	2	4
553	552	2	552	10.00	1	4
554	553	3	553	10.00	2	4
555	554	4	554	150.00	2	4
556	555	5	555	60.00	4	4
557	556	1	556	5.00	1	4
558	557	2	557	50.00	1	4
559	558	3	558	10.00	2	4
560	559	4	559	60.00	4	4
561	560	5	560	50.00	1	4
562	561	1	561	50.00	2	4
563	562	2	562	250.00	2	4
564	563	3	563	120.00	2	4
565	564	4	564	10.00	1	4
566	565	5	565	10.00	2	4
567	566	1	566	60.00	2	4
568	567	2	567	60.00	4	4
569	568	3	568	5.00	1	4
570	569	4	569	50.00	1	4
571	570	5	570	10.00	2	4
572	571	1	571	60.00	4	4
573	572	2	572	50.00	1	4
574	573	3	573	50.00	2	4
575	574	4	574	250.00	2	4
576	575	5	575	120.00	2	4
577	576	1	576	10.00	1	4
578	577	2	577	10.00	2	4
579	578	3	578	120.00	2	4
580	579	4	579	60.00	4	4
581	580	5	580	5.00	1	4
582	581	1	581	50.00	1	4
583	582	2	582	10.00	2	4
584	583	3	583	60.00	4	4
585	584	4	584	50.00	1	4
586	585	5	585	50.00	2	4
587	586	1	586	250.00	2	4
588	587	2	587	120.00	2	4
589	588	3	588	10.00	1	4
590	589	4	589	10.00	2	4
591	590	5	590	30.00	2	4
592	591	1	591	60.00	4	4
593	592	2	592	5.00	1	4
594	593	3	593	50.00	1	4
595	594	4	594	10.00	2	4
596	595	5	595	60.00	4	4
597	596	1	596	50.00	1	4
598	597	2	597	50.00	2	4
599	598	3	598	250.00	2	4
600	599	4	599	120.00	2	4
601	600	5	600	10.00	1	4
602	601	1	601	10.00	2	4
603	602	2	602	100.00	2	4
604	603	3	603	60.00	4	4
605	604	4	604	5.00	1	4
606	605	5	605	50.00	1	4
607	606	1	606	10.00	2	4
608	607	2	607	60.00	4	4
609	608	3	608	50.00	1	4
610	609	4	609	50.00	2	4
611	610	5	610	250.00	2	4
612	611	1	611	120.00	2	4
613	612	2	612	10.00	1	4
614	613	3	613	10.00	2	4
615	614	4	614	150.00	2	4
616	615	5	615	60.00	4	4
617	616	1	616	5.00	1	4
618	617	2	617	50.00	1	4
619	618	3	618	10.00	2	4
620	619	4	619	60.00	4	4
621	620	5	620	50.00	1	4
622	621	1	621	50.00	2	4
623	622	2	622	250.00	2	4
624	623	3	623	120.00	2	4
625	624	4	624	10.00	1	4
626	625	5	625	10.00	2	4
627	626	1	626	60.00	2	4
628	627	2	627	60.00	4	4
629	628	3	628	5.00	1	4
630	629	4	629	50.00	1	4
631	630	5	630	10.00	2	4
632	631	1	631	60.00	4	4
633	632	2	632	50.00	1	4
634	633	3	633	50.00	2	4
635	634	4	634	250.00	2	4
636	635	5	635	120.00	2	4
637	636	1	636	10.00	1	4
638	637	2	637	10.00	2	4
639	638	3	638	120.00	2	4
640	639	4	639	60.00	4	4
641	640	5	640	5.00	1	4
642	641	1	641	50.00	1	4
643	642	2	642	10.00	2	4
644	643	3	643	60.00	4	4
645	644	4	644	50.00	1	4
646	645	5	645	50.00	2	4
647	646	1	646	250.00	2	4
648	647	2	647	120.00	2	4
649	648	3	648	10.00	1	4
650	649	4	649	10.00	2	4
651	650	5	650	30.00	2	4
652	651	1	651	60.00	4	4
653	652	2	652	5.00	1	4
654	653	3	653	50.00	1	4
655	654	4	654	10.00	2	4
656	655	5	655	60.00	4	4
657	656	1	656	50.00	1	4
658	657	2	657	50.00	2	4
659	658	3	658	250.00	2	4
660	659	4	659	120.00	2	4
661	660	5	660	10.00	1	4
662	661	1	661	10.00	2	4
663	662	2	662	100.00	2	4
664	663	3	663	60.00	4	4
665	664	4	664	5.00	1	4
666	665	5	665	50.00	1	4
667	666	1	666	10.00	2	4
668	667	2	667	60.00	4	4
669	668	3	668	50.00	1	4
670	669	4	669	50.00	2	4
671	670	5	670	250.00	2	4
672	671	1	671	120.00	2	4
673	672	2	672	10.00	1	4
674	673	3	673	10.00	2	4
675	674	4	674	150.00	2	4
676	675	5	675	60.00	4	4
677	676	1	676	5.00	1	4
678	677	2	677	50.00	1	4
679	678	3	678	10.00	2	4
680	679	4	679	60.00	4	4
681	680	5	680	50.00	1	4
682	681	1	681	50.00	2	4
683	682	2	682	250.00	2	4
684	683	3	683	120.00	2	4
685	684	4	684	10.00	1	4
686	685	5	685	10.00	2	4
687	686	1	686	60.00	2	4
688	687	2	687	60.00	4	4
689	688	3	688	5.00	1	4
690	689	4	689	50.00	1	4
691	690	5	690	10.00	2	4
692	691	1	691	60.00	4	4
693	692	2	692	50.00	1	4
694	693	3	693	50.00	2	4
695	694	4	694	250.00	2	4
696	695	5	695	120.00	2	4
697	696	1	696	10.00	1	4
698	697	2	697	10.00	2	4
699	698	3	698	120.00	2	4
700	699	4	699	60.00	4	4
701	700	5	700	5.00	1	4
\.


--
-- Data for Name: rel_especie_patologia; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rel_especie_patologia (id_especie, id_patologia) FROM stdin;
\.


--
-- Data for Name: rel_patologia_agente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rel_patologia_agente (id_patologia, id_agente) FROM stdin;
\.


--
-- Data for Name: rel_patologia_sintoma; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rel_patologia_sintoma (id_patologia, id_sintoma) FROM stdin;
\.


--
-- Data for Name: rel_patologia_transmision; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rel_patologia_transmision (id_patologia, id_via) FROM stdin;
\.


--
-- Data for Name: rel_patologia_tratamiento; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rel_patologia_tratamiento (id_patologia, id_tratamiento) FROM stdin;
\.


--
-- Data for Name: rel_vacuna_especie; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rel_vacuna_especie (id_vacuna, id_especie) FROM stdin;
\.


--
-- Data for Name: rel_vacuna_laboratorio; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rel_vacuna_laboratorio (id_especie, id_vacuna, id_lab) FROM stdin;
1	1	1
1	1	2
1	2	1
1	2	2
1	3	1
1	3	2
1	4	1
1	4	2
1	5	1
1	6	1
1	6	2
1	6	3
1	7	1
1	7	2
1	7	3
1	8	1
1	8	2
1	8	3
1	9	1
1	9	2
1	9	3
1	10	1
1	10	2
1	10	3
1	11	1
1	11	2
1	11	3
\.


--
-- Data for Name: rel_vacuna_patologia; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.rel_vacuna_patologia (id_vacuna, id_patologia, id_especie) FROM stdin;
1	4	2
1	3	2
1	2	2
1	5	2
2	5	2
3	1	2
4	4	2
4	3	2
4	2	2
5	1	2
6	4	2
6	3	2
6	2	2
7	4	2
7	3	2
7	2	2
7	1	2
8	4	2
8	3	2
8	2	2
9	5	2
\.


--
-- Data for Name: reservaciones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reservaciones (id_reservacion, id_usuario_fk, id_mascota_fk, id_servicio_fk, fecha_entrada, hora_reservacion, estado_reservacion, notas_especiales, fecha_registro, fecha_salida, tipo_habitacion) FROM stdin;
\.


--
-- Data for Name: temperamento_especie; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.temperamento_especie (id_comportamiento, id_especie, id_rasgo) FROM stdin;
1	1	1
2	2	2
3	1	21
4	1	25
5	1	6
6	1	4
7	1	24
8	1	20
9	1	18
10	1	10
11	1	9
12	1	13
13	1	17
14	1	11
15	1	30
16	1	7
17	1	28
18	1	3
19	1	5
20	1	23
21	2	21
22	2	25
23	2	6
24	2	4
25	2	24
26	2	20
27	2	18
28	2	10
29	2	9
30	2	13
31	2	17
32	2	11
33	2	30
34	2	7
35	2	28
36	2	3
37	2	5
38	2	23
39	3	21
40	3	25
41	3	6
42	3	27
43	3	16
44	3	20
45	3	18
46	3	15
47	3	23
48	4	12
49	4	26
50	4	29
51	4	22
52	4	20
53	4	19
54	4	8
55	4	14
\.


--
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuarios (id_usuario, nombre_usu, apellido_pa_usu, apellido_ma_usu, email_usu, tel_usu, passw_usu, fec_nac_usu, id_domicilio_fk) FROM stdin;
1	Nahum	Estudiante	\N	nahum@test.com	\N	12345	\N	1
2	Tilin	xd	DSA	dassada@gmail.com	55899978	12345678	2026-01-01	2
\.


--
-- Data for Name: vacunas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vacunas (id_vacuna, nombre_vacuna, id_lab, importancia, nota_aplicacion, id_especie, tipo_vacuna, cura, nombre_lab_txt) FROM stdin;
1	Gallimune 302 ENC+BI+EDS	\N	\N	\N	3	Biológicos Aviares	Newcastle, Bronquitis infecciosa y el síndrome de baja postura	Lapisa
2	Volvac AE+FP MLV	\N	\N	\N	3	Biológicos Aviares	Encefalomielitis Aviar + Viruela Aviar	Lapisa
3	Volvac Influenza FP Recombinante	\N	\N	\N	3	Biológicos Aviares	Viruela + Influenza Aviar	Lapisa
4	Volvac ND+IB MLV	\N	\N	\N	3	Biológicos Aviares	Newcastle + Bronquitis Infecciosa	Lapisa
5	Minazel plus	\N	\N	\N	3	Adsorbente de Micotoxinas	micotoxicosis	Lapisa
6	Lapigen 100	\N	\N	\N	3	Antibioticos inyectables	E. coli, E. aerogenes, Salmonella spp y P. aeruginosa	Lapisa
7	Lapigen 50	\N	\N	\N	3	Antibioticos inyectables	E. coli, E. aerogenes, Salmonella spp y P. aeruginosa	Lapisa
8	Minoxel	\N	\N	\N	3	Antibioticos inyectables	colibacilosis	Lapisa
9	Minoxel 8G	\N	\N	\N	3	Antibioticos inyectables	colibacilosis	Lapisa
10	Diramox Soluble	\N	\N	\N	3	Antibioticos solubles	nfecciones secundarias a una enfermedad viral.	Lapisa
11	Espectolin Polvo Soluble	\N	\N	\N	3	Antibioticos solubles	Escherichia coli y Mycoplasma gallisepticum.	Lapisa
12	Ne-O-Tetra	\N	\N	\N	3	Antibioticos solubles	diarreas, estados de estrés, baja de postura.	Lapisa
13	Primecin Soluble	\N	\N	\N	3	Antibioticos solubles	Pasteurella, Mycoplasma, E. coli, Salmonella, Haemophilus, Staphylococcus, Streptococcus, Pseudomonas y Corynebacterium.	Lapisa
14	Sulfatropin Plus	\N	\N	\N	3	Antibioticos solubles	colibacilosis, ECR, tifus aviar, pulorosis, salmonelosis, coriza infecciosa, cólera aviar.	Lapisa
15	Diramox Premix	\N	\N	\N	3	Antibióticos en Premezcla	s infecciones bacterianas susceptibles a la amoxicilina en aves de engorda. Así como coadyuvante en infecciones secundarias a una enfermedad viral.	Lapisa
16	Diramox Premix 50%	\N	\N	\N	3	Antibióticos en Premezcla	enfermedades bacterianas en aves (engorda y reproductoras), causadas por Salmonella spp, Escherichia coli, Pasteurella spp, Haemophilus spp, Streptococcus spp y Clostridium spp	Lapisa
17	Flortec Premix	\N	\N	\N	3	Antibióticos en Premezcla	Florfenicol, así como coadyuvante en infecciones bacterianas secundarias a una enfermedad viral.	Lapisa
18	Flortec Premix 8%	\N	\N	\N	3	Antibióticos en Premezcla	Salmonella spp, Escherichia coli, Pasteurella haemolytica, Pasteurella multocida, Streptococcus spp y Mycoplasma spp.	Lapisa
19	Kitacron Feed 110	\N	\N	\N	3	Antibióticos en Premezcla	Para el tratamiento de enfermedades bacterianas causadas por gérmenes sensibles a la kitasamicina.	Lapisa
20	Lapi-Resp FT	\N	\N	\N	3	Antibióticos en Premezcla	Salmonella spp, Escherichia coli, Mannheimia haemolytica, Pasteurella multocida, Streptococcus spp y Mycoplasma spp	Lapisa
21	Neumo 200	\N	\N	\N	3	Antibióticos en Premezcla	Para el tratamiento de enfermedades causadas por gérmenes sensibles a la acción de la oxitetraciclina	Lapisa
22	Neumoclor 200	\N	\N	\N	3	Antibióticos en Premezcla	gérmenes susceptibles a la clortetraciclina, así como coadyuvante en infecciones secundarias a una enfermedad viral.	Lapisa
23	Primecin Premix	\N	\N	\N	3	Antibióticos en Premezcla	Mycoplasma gallisepticum, Mycoplasma synoviae, Haemophilus paragallinarum, Pasteurella multocida, así como enfermedades del tracto digestivo causadas por gérmenes Gram positivos y Gram negativos	Lapisa
24	Sulfatropin Premezcla	\N	\N	\N	3	Antibióticos en Premezcla	Para el tratamiento de las infecciones causadas por las bacterias sensibles a la acción de la fórmula en aves de granja y de combate.	Lapisa
25	Tiaprem	\N	\N	\N	3	Antibióticos en Premezcla	Mycoplasma gallisepticum, sinovitis infecciosa causada por Mycoplasma synoviae y otras infecciones causadas por microorganismos susceptibles a la fórmula	Lapisa
26	Tiaprem 50%	\N	\N	\N	3	Antibióticos en Premezcla	Mycoplasma gallisepticum, la sinovitis infecciosa causada por Mycoplasma synoviae.	Lapisa
27	Expectoral	\N	\N	\N	3	Farmacéuticos	Expectorante coadyuvante en la prevención y tratamiento de las infecciones respiratorias en pollos de engorda, reproductoras y gallinas de postura.	Lapisa
28	Electrolife	\N	\N	\N	3	Farmacéuticos	Coadyuvante en el tratamiento de deshidratación, diarreas, y convalecencias.	Lapisa
29	Vitamix	\N	\N	\N	3	Farmacéuticos	Para la prevención y corrección de deficiencias vitamínicas incluidas en la fórmula, así como estados de estrés o convalecencia de alguna enfermedad en aves.	Lapisa
30	Garra Ban Mo 29	\N	\N	\N	3	Larvicidas y Mosquicidas	Boophilus spp, Amblyomma sp, Dermacentor spp, Anocentor sp; moscas: Haematobia sp, Stomoxys sp; piojos: Haematopinus spp, Lignogatus sp, Solenopotes sp; Melophagus spp, Damalinia spp.	Lapisa
31	Larvakill Premix	\N	\N	\N	3	Larvicidas y Mosquicidas	Regulador sintético del crecimiento de insectos con actividad contra dípteros (moscas, mosquitos, moscas de la fruta).	Lapisa
32	Lomo Pon S	\N	\N	\N	3	Larvicidas y Mosquicidas	Haematobia sp, Stomoxys sp, mosca doméstica, tábanos y mosquitos, piojos: Haematopinus spp, Lignogatus sp, Solenopotes sp, Melophagus spp; Damalinia spp	Lapisa
33	Ticoff	\N	\N	\N	3	Larvicidas y Mosquicidas	mosca del establo, mosca de la paleta, mosca de la cara, así como tábanos, piojos y ácaros.	Lapisa
34	Trak	\N	\N	\N	3	Larvicidas y Mosquicidas	Boophilus spp, Amblyomma spp, Damalinia sp, Haematopinus spp, Solenoptes sp, Linognathus spp, Trichodectes sp, Demodex sp, Otodectes sp, Dermacentor sp, Rhipicephalus sp, Otobius sp, Sarcoptes spp, Psoroptes sp y Chorioptes sp.	Lapisa
1	FELINE 1 HCP+FeLV	1	ESENCIAL	\N	2	\N	\N	\N
2	FELINE 2-FeLV	2	NO ESENCIAL	\N	2	\N	\N	\N
3	RABIA	2	ESENCIAL	\N	2	\N	\N	\N
4	TRICAT TRIO	2	ESENCIAL	\N	2	\N	\N	\N
5	DEFENSOR 1	3	ESENCIAL	\N	2	\N	\N	\N
6	FELOCELL 3	3	ESENCIAL	\N	2	\N	\N	\N
7	FELIGREN CRP/R	4	ESENCIAL	\N	2	\N	\N	\N
8	FELIGREN CRP	4	ESENCIAL	\N	2	\N	\N	\N
9	LEUCOGEN	4	NO ESENCIAL	\N	2	\N	\N	\N
1	Bordetella (Bronchiseptica)	\N	NO ESENCIAL	\N	1	\N	\N	\N
2	Leptospira	\N	NO ESENCIAL	\N	1	\N	\N	\N
3	Borrelia Burgdorferi	\N	NO ESENCIAL	\N	1	\N	\N	\N
4	Influenza Canina (H3N8 y H3N2)	\N	NO ESENCIAL	\N	1	\N	\N	\N
5	Toxoide de Crotalus Atrox	\N	NO ESENCIAL	\N	1	\N	\N	\N
6	Moquillo Canino	\N	ESENCIAL	\N	1	\N	\N	\N
7	Adenovirus (Hepatitis Infecciosa)	\N	ESENCIAL	\N	1	\N	\N	\N
8	Adenovirus (Hepatitis Infecciosa)	\N	ESENCIAL	\N	1	\N	\N	\N
9	Parvovirus	\N	ESENCIAL	\N	1	\N	\N	\N
10	Rabia	\N	ESENCIAL	\N	1	\N	\N	\N
11	Combinadas	\N	NO ESENCIAL	\N	1	\N	\N	\N
1	HerpShield	1	OPCIONAL	\N	4	\N	\N	\N
2	SerpoVac	1	OPCIONAL	\N	4	\N	\N	\N
\.


--
-- Name: aplicacion_dosis_id_apli_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.aplicacion_dosis_id_apli_seq', 1400, true);


--
-- Name: cat_agentes_id_agente_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cat_agentes_id_agente_seq', 1, false);


--
-- Name: cat_categorias_med_id_cat_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cat_categorias_med_id_cat_seq', 30, true);


--
-- Name: cat_compuestos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cat_compuestos_id_seq', 242, true);


--
-- Name: cat_especies_id_especie_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cat_especies_id_especie_seq', 4, true);


--
-- Name: cat_formas_farm_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cat_formas_farm_id_seq', 33, true);


--
-- Name: cat_importancia_vacuna_id_importancia_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cat_importancia_vacuna_id_importancia_seq', 1, false);


--
-- Name: cat_interaccion_id_interaccion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cat_interaccion_id_interaccion_seq', 6, true);


--
-- Name: cat_laboratorios_id_lab_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cat_laboratorios_id_lab_seq', 27, true);


--
-- Name: cat_lugares_id_lugar_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cat_lugares_id_lugar_seq', 1, false);


--
-- Name: cat_presentaciones_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cat_presentaciones_id_seq', 5, true);


--
-- Name: cat_rasgos_id_rasgo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cat_rasgos_id_rasgo_seq', 30, true);


--
-- Name: cat_servicios_id_servicio_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cat_servicios_id_servicio_seq', 5, true);


--
-- Name: cat_sintomas_id_sintoma_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cat_sintomas_id_sintoma_seq', 1, false);


--
-- Name: cat_subtipos_id_subtipo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cat_subtipos_id_subtipo_seq', 1, false);


--
-- Name: cat_tamano_id_tamano_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cat_tamano_id_tamano_seq', 14, true);


--
-- Name: cat_tipo_patologia_id_tipo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cat_tipo_patologia_id_tipo_seq', 11, true);


--
-- Name: cat_tratamientos_id_tratamiento_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cat_tratamientos_id_tratamiento_seq', 1, false);


--
-- Name: cat_vias_admin_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cat_vias_admin_id_seq', 18, true);


--
-- Name: cat_vias_transmision_id_via_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cat_vias_transmision_id_via_seq', 1, false);


--
-- Name: chip_identificacion_id_chip_pk_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.chip_identificacion_id_chip_pk_seq', 1, false);


--
-- Name: domicilio_id_domicilio_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.domicilio_id_domicilio_seq', 2, true);


--
-- Name: instrucciones_manejo_id_instruccion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.instrucciones_manejo_id_instruccion_seq', 53, true);


--
-- Name: mascota_id_mascota_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mascota_id_mascota_seq', 1, false);


--
-- Name: patologias_id_patologia_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.patologias_id_patologia_seq', 153, true);


--
-- Name: pres_med_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pres_med_id_seq', 701, true);


--
-- Name: presentacion_medicamento_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.presentacion_medicamento_id_seq', 1, false);


--
-- Name: reservaciones_id_reservacion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reservaciones_id_reservacion_seq', 1, false);


--
-- Name: temperamento_especie_id_comportamiento_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.temperamento_especie_id_comportamiento_seq', 55, true);


--
-- Name: usuarios_id_usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuarios_id_usuario_seq', 2, true);


--
-- Name: vacunas_id_vacuna_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vacunas_id_vacuna_seq', 34, true);


--
-- Name: aplicacion_dosis aplicacion_dosis_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aplicacion_dosis
    ADD CONSTRAINT aplicacion_dosis_pkey PRIMARY KEY (id_aplicacion);


--
-- Name: cat_agentes cat_agentes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cat_agentes
    ADD CONSTRAINT cat_agentes_pkey PRIMARY KEY (id_agente);


--
-- Name: cat_asentamientos cat_asentamientos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cat_asentamientos
    ADD CONSTRAINT cat_asentamientos_pkey PRIMARY KEY (id_asenta, codigop_fk);


--
-- Name: cat_categorias_med cat_categorias_med_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cat_categorias_med
    ADD CONSTRAINT cat_categorias_med_pkey PRIMARY KEY (id_especie, id_cat_med);


--
-- Name: cat_compuestos cat_compuestos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cat_compuestos
    ADD CONSTRAINT cat_compuestos_pkey PRIMARY KEY (id_especie, id_compuesto);


--
-- Name: cat_cp_base cat_cp_base_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cat_cp_base
    ADD CONSTRAINT cat_cp_base_pkey PRIMARY KEY (codigop);


--
-- Name: cat_especies cat_especies_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cat_especies
    ADD CONSTRAINT cat_especies_pkey PRIMARY KEY (id_especie);


--
-- Name: cat_estados cat_estados_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cat_estados
    ADD CONSTRAINT cat_estados_pkey PRIMARY KEY (id_estado);


--
-- Name: cat_formas_farmaceuticas cat_formas_farmaceuticas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cat_formas_farmaceuticas
    ADD CONSTRAINT cat_formas_farmaceuticas_pkey PRIMARY KEY (id_especie, id_forma_farmaceutica);


--
-- Name: cat_importancia_vacuna cat_importancia_vacuna_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cat_importancia_vacuna
    ADD CONSTRAINT cat_importancia_vacuna_pkey PRIMARY KEY (id_importancia);


--
-- Name: cat_interaccion cat_interaccion_nivel_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cat_interaccion
    ADD CONSTRAINT cat_interaccion_nivel_key UNIQUE (nivel);


--
-- Name: cat_interaccion cat_interaccion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cat_interaccion
    ADD CONSTRAINT cat_interaccion_pkey PRIMARY KEY (id_interaccion);


--
-- Name: cat_laboratorios cat_laboratorios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cat_laboratorios
    ADD CONSTRAINT cat_laboratorios_pkey PRIMARY KEY (id_especie, id_laboratorio);


--
-- Name: cat_lugares cat_lugares_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cat_lugares
    ADD CONSTRAINT cat_lugares_pkey PRIMARY KEY (id_lugar);


--
-- Name: cat_municipios cat_municipios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cat_municipios
    ADD CONSTRAINT cat_municipios_pkey PRIMARY KEY (id_mnpio, id_estado_fk);


--
-- Name: cat_presentaciones cat_presentaciones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cat_presentaciones
    ADD CONSTRAINT cat_presentaciones_pkey PRIMARY KEY (id_especie, id_presentacion);


--
-- Name: cat_rasgos cat_rasgos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cat_rasgos
    ADD CONSTRAINT cat_rasgos_pkey PRIMARY KEY (id_rasgo);


--
-- Name: cat_servicios cat_servicios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cat_servicios
    ADD CONSTRAINT cat_servicios_pkey PRIMARY KEY (id_servicio);


--
-- Name: cat_sintomas cat_sintomas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cat_sintomas
    ADD CONSTRAINT cat_sintomas_pkey PRIMARY KEY (id_sintoma);


--
-- Name: cat_subtipos cat_subtipos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cat_subtipos
    ADD CONSTRAINT cat_subtipos_pkey PRIMARY KEY (id_especie, id_subtipo);


--
-- Name: cat_tamano cat_tamano_nom_tamano_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cat_tamano
    ADD CONSTRAINT cat_tamano_nom_tamano_key UNIQUE (nom_tamano);


--
-- Name: cat_tamano cat_tamano_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cat_tamano
    ADD CONSTRAINT cat_tamano_pkey PRIMARY KEY (id_tamano);


--
-- Name: cat_tipo_asentamiento cat_tipo_asentamiento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cat_tipo_asentamiento
    ADD CONSTRAINT cat_tipo_asentamiento_pkey PRIMARY KEY (id_tipo_asenta);


--
-- Name: cat_tipo_patologia cat_tipo_patologia_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cat_tipo_patologia
    ADD CONSTRAINT cat_tipo_patologia_pkey PRIMARY KEY (id_tipo);


--
-- Name: cat_tratamientos cat_tratamientos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cat_tratamientos
    ADD CONSTRAINT cat_tratamientos_pkey PRIMARY KEY (id_tratamiento);


--
-- Name: cat_unidades_medida cat_unidades_medida_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cat_unidades_medida
    ADD CONSTRAINT cat_unidades_medida_pkey PRIMARY KEY (id_especie, id_unidad_medida);


--
-- Name: cat_unidades_por_compuesto cat_unidades_por_compuesto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cat_unidades_por_compuesto
    ADD CONSTRAINT cat_unidades_por_compuesto_pkey PRIMARY KEY (id_especie, id_compxu);


--
-- Name: cat_vias_admin cat_vias_admin_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cat_vias_admin
    ADD CONSTRAINT cat_vias_admin_pkey PRIMARY KEY (id_especie, id_via_administracion);


--
-- Name: cat_vias_transmision cat_vias_transmision_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cat_vias_transmision
    ADD CONSTRAINT cat_vias_transmision_pkey PRIMARY KEY (id_via);


--
-- Name: catalogo_fabricantes catalogo_fabricantes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.catalogo_fabricantes
    ADD CONSTRAINT catalogo_fabricantes_pkey PRIMARY KEY (id_fabricante);


--
-- Name: catalogo_paises catalogo_paises_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.catalogo_paises
    ADD CONSTRAINT catalogo_paises_pkey PRIMARY KEY (id_pais);


--
-- Name: chip_identificacion chip_identificacion_num_chip_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chip_identificacion
    ADD CONSTRAINT chip_identificacion_num_chip_key UNIQUE (num_chip);


--
-- Name: chip_identificacion chip_identificacion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chip_identificacion
    ADD CONSTRAINT chip_identificacion_pkey PRIMARY KEY (id_chip_pk);


--
-- Name: chipavid chipavid_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chipavid
    ADD CONSTRAINT chipavid_pkey PRIMARY KEY (id_animalavid);


--
-- Name: chipicar chipicar_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chipicar
    ADD CONSTRAINT chipicar_pkey PRIMARY KEY (id_animalicar);


--
-- Name: chipiso chipiso_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chipiso
    ADD CONSTRAINT chipiso_pkey PRIMARY KEY (id_chipiso);


--
-- Name: domicilio domicilio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.domicilio
    ADD CONSTRAINT domicilio_pkey PRIMARY KEY (id_domicilio);


--
-- Name: ingrediente_activo ingrediente_activo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ingrediente_activo
    ADD CONSTRAINT ingrediente_activo_pkey PRIMARY KEY (id_presxmed, id_comp);


--
-- Name: instrucciones_manejo instrucciones_manejo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instrucciones_manejo
    ADD CONSTRAINT instrucciones_manejo_pkey PRIMARY KEY (id_instruccion);


--
-- Name: mascota mascota_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mascota
    ADD CONSTRAINT mascota_pkey PRIMARY KEY (id_mascota);


--
-- Name: medicamentos medicamentos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medicamentos
    ADD CONSTRAINT medicamentos_pkey PRIMARY KEY (id_especie, id_med);


--
-- Name: patologias patologias_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patologias
    ADD CONSTRAINT patologias_pkey PRIMARY KEY (id_especie, id_patologia);


--
-- Name: presentacion_medicamento presentacion_medicamento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.presentacion_medicamento
    ADD CONSTRAINT presentacion_medicamento_pkey PRIMARY KEY (id_especie, id_presentacion_medicamento);


--
-- Name: rel_especie_patologia rel_especie_patologia_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rel_especie_patologia
    ADD CONSTRAINT rel_especie_patologia_pkey PRIMARY KEY (id_especie, id_patologia);


--
-- Name: rel_patologia_agente rel_patologia_agente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rel_patologia_agente
    ADD CONSTRAINT rel_patologia_agente_pkey PRIMARY KEY (id_patologia, id_agente);


--
-- Name: rel_patologia_sintoma rel_patologia_sintoma_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rel_patologia_sintoma
    ADD CONSTRAINT rel_patologia_sintoma_pkey PRIMARY KEY (id_patologia, id_sintoma);


--
-- Name: rel_patologia_transmision rel_patologia_transmision_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rel_patologia_transmision
    ADD CONSTRAINT rel_patologia_transmision_pkey PRIMARY KEY (id_patologia, id_via);


--
-- Name: rel_patologia_tratamiento rel_patologia_tratamiento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rel_patologia_tratamiento
    ADD CONSTRAINT rel_patologia_tratamiento_pkey PRIMARY KEY (id_patologia, id_tratamiento);


--
-- Name: rel_vacuna_especie rel_vacuna_especie_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rel_vacuna_especie
    ADD CONSTRAINT rel_vacuna_especie_pkey PRIMARY KEY (id_vacuna, id_especie);


--
-- Name: rel_vacuna_laboratorio rel_vacuna_laboratorio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rel_vacuna_laboratorio
    ADD CONSTRAINT rel_vacuna_laboratorio_pkey PRIMARY KEY (id_especie, id_vacuna, id_lab);


--
-- Name: rel_vacuna_patologia rel_vacuna_patologia_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rel_vacuna_patologia
    ADD CONSTRAINT rel_vacuna_patologia_pkey PRIMARY KEY (id_especie, id_vacuna, id_patologia);


--
-- Name: reservaciones reservaciones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservaciones
    ADD CONSTRAINT reservaciones_pkey PRIMARY KEY (id_reservacion);


--
-- Name: temperamento_especie temperamento_especie_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temperamento_especie
    ADD CONSTRAINT temperamento_especie_pkey PRIMARY KEY (id_comportamiento);


--
-- Name: cat_formas_farmaceuticas uq_forma_especie; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cat_formas_farmaceuticas
    ADD CONSTRAINT uq_forma_especie UNIQUE (id_forma_farmaceutica, id_especie);


--
-- Name: cat_categorias_med uq_id_cat_med; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cat_categorias_med
    ADD CONSTRAINT uq_id_cat_med UNIQUE (id_cat_med);


--
-- Name: cat_compuestos uq_id_compuesto; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cat_compuestos
    ADD CONSTRAINT uq_id_compuesto UNIQUE (id_compuesto);


--
-- Name: cat_laboratorios uq_id_laboratorio; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cat_laboratorios
    ADD CONSTRAINT uq_id_laboratorio UNIQUE (id_laboratorio);


--
-- Name: cat_presentaciones uq_id_presentacion; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cat_presentaciones
    ADD CONSTRAINT uq_id_presentacion UNIQUE (id_presentacion);


--
-- Name: cat_unidades_medida uq_id_unidad_medida; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cat_unidades_medida
    ADD CONSTRAINT uq_id_unidad_medida UNIQUE (id_unidad_medida);


--
-- Name: cat_vias_admin uq_id_via_admin; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cat_vias_admin
    ADD CONSTRAINT uq_id_via_admin UNIQUE (id_via_administracion);


--
-- Name: usuarios usuarios_email_usu_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_usu_key UNIQUE (email_usu);


--
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id_usuario);


--
-- Name: vacunas vacunas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vacunas
    ADD CONSTRAINT vacunas_pkey PRIMARY KEY (id_especie, id_vacuna);


--
-- Name: aplicacion_dosis aplicacion_dosis_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aplicacion_dosis
    ADD CONSTRAINT aplicacion_dosis_fkey FOREIGN KEY (id_especie, id_via_administracion) REFERENCES public.cat_subtipos(id_especie, id_subtipo);


--
-- Name: aplicacion_dosis aplicacion_dosis_id_especie_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aplicacion_dosis
    ADD CONSTRAINT aplicacion_dosis_id_especie_fkey FOREIGN KEY (id_especie) REFERENCES public.cat_especies(id_especie);


--
-- Name: cat_asentamientos cat_asentamientos_codigop_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cat_asentamientos
    ADD CONSTRAINT cat_asentamientos_codigop_fk_fkey FOREIGN KEY (codigop_fk) REFERENCES public.cat_cp_base(codigop);


--
-- Name: cat_asentamientos cat_asentamientos_id_tipo_asenta_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cat_asentamientos
    ADD CONSTRAINT cat_asentamientos_id_tipo_asenta_fk_fkey FOREIGN KEY (id_tipo_asenta_fk) REFERENCES public.cat_tipo_asentamiento(id_tipo_asenta);


--
-- Name: cat_cp_base cat_cp_base_id_mnpio_fk_id_estado_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cat_cp_base
    ADD CONSTRAINT cat_cp_base_id_mnpio_fk_id_estado_fk_fkey FOREIGN KEY (id_mnpio_fk, id_estado_fk) REFERENCES public.cat_municipios(id_mnpio, id_estado_fk);


--
-- Name: cat_municipios cat_municipios_id_estado_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cat_municipios
    ADD CONSTRAINT cat_municipios_id_estado_fk_fkey FOREIGN KEY (id_estado_fk) REFERENCES public.cat_estados(id_estado);


--
-- Name: cat_subtipos cat_subtipos_id_especie_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cat_subtipos
    ADD CONSTRAINT cat_subtipos_id_especie_fkey FOREIGN KEY (id_especie) REFERENCES public.cat_especies(id_especie);


--
-- Name: cat_subtipos cat_subtipos_id_interaccion_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cat_subtipos
    ADD CONSTRAINT cat_subtipos_id_interaccion_fkey FOREIGN KEY (id_interaccion) REFERENCES public.cat_interaccion(id_interaccion);


--
-- Name: cat_subtipos cat_subtipos_id_tamano_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cat_subtipos
    ADD CONSTRAINT cat_subtipos_id_tamano_fkey FOREIGN KEY (id_tamano) REFERENCES public.cat_tamano(id_tamano);


--
-- Name: chip_identificacion chip_identificacion_id_fabricante_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chip_identificacion
    ADD CONSTRAINT chip_identificacion_id_fabricante_fkey FOREIGN KEY (id_fabricante) REFERENCES public.catalogo_fabricantes(id_fabricante);


--
-- Name: chip_identificacion chip_identificacion_id_mascota_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chip_identificacion
    ADD CONSTRAINT chip_identificacion_id_mascota_fkey FOREIGN KEY (id_mascota) REFERENCES public.mascota(id_mascota);


--
-- Name: chip_identificacion chip_identificacion_id_pais_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chip_identificacion
    ADD CONSTRAINT chip_identificacion_id_pais_fkey FOREIGN KEY (id_pais) REFERENCES public.catalogo_paises(id_pais);


--
-- Name: chipavid chipavid_id_mascota_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chipavid
    ADD CONSTRAINT chipavid_id_mascota_fk_fkey FOREIGN KEY (id_mascota_fk) REFERENCES public.mascota(id_mascota);


--
-- Name: chipicar chipicar_id_mascota_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chipicar
    ADD CONSTRAINT chipicar_id_mascota_fk_fkey FOREIGN KEY (id_mascota_fk) REFERENCES public.mascota(id_mascota);


--
-- Name: chipiso chipiso_id_mascota_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chipiso
    ADD CONSTRAINT chipiso_id_mascota_fk_fkey FOREIGN KEY (id_mascota_fk) REFERENCES public.mascota(id_mascota);


--
-- Name: chipiso chipiso_id_pais_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chipiso
    ADD CONSTRAINT chipiso_id_pais_fk_fkey FOREIGN KEY (id_pais_fk) REFERENCES public.catalogo_paises(id_pais);


--
-- Name: cat_categorias_med fk_cat_especie; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cat_categorias_med
    ADD CONSTRAINT fk_cat_especie FOREIGN KEY (id_especie) REFERENCES public.cat_especies(id_especie);


--
-- Name: cat_compuestos fk_comp_especie; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cat_compuestos
    ADD CONSTRAINT fk_comp_especie FOREIGN KEY (id_especie) REFERENCES public.cat_especies(id_especie);


--
-- Name: cat_unidades_por_compuesto fk_compxu_especie; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cat_unidades_por_compuesto
    ADD CONSTRAINT fk_compxu_especie FOREIGN KEY (id_especie) REFERENCES public.cat_especies(id_especie);


--
-- Name: domicilio fk_domicilio_asentamiento; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.domicilio
    ADD CONSTRAINT fk_domicilio_asentamiento FOREIGN KEY (cp, id_asenta) REFERENCES public.cat_asentamientos(codigop_fk, id_asenta);


--
-- Name: aplicacion_dosis fk_dosis_med_compuesta; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.aplicacion_dosis
    ADD CONSTRAINT fk_dosis_med_compuesta FOREIGN KEY (id_especie, id_medicamento) REFERENCES public.medicamentos(id_especie, id_med);


--
-- Name: patologias fk_especie_patologia; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patologias
    ADD CONSTRAINT fk_especie_patologia FOREIGN KEY (id_especie) REFERENCES public.cat_especies(id_especie) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: vacunas fk_especie_vacuna; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vacunas
    ADD CONSTRAINT fk_especie_vacuna FOREIGN KEY (id_especie) REFERENCES public.cat_especies(id_especie);


--
-- Name: cat_formas_farmaceuticas fk_forma_especie; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cat_formas_farmaceuticas
    ADD CONSTRAINT fk_forma_especie FOREIGN KEY (id_especie) REFERENCES public.cat_especies(id_especie);


--
-- Name: ingrediente_activo fk_ia_compuesto_compuesto; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ingrediente_activo
    ADD CONSTRAINT fk_ia_compuesto_compuesto FOREIGN KEY (id_especie, id_comp) REFERENCES public.cat_compuestos(id_especie, id_compuesto);


--
-- Name: ingrediente_activo fk_ia_um_compuesta; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ingrediente_activo
    ADD CONSTRAINT fk_ia_um_compuesta FOREIGN KEY (id_especie, id_um) REFERENCES public.cat_unidades_medida(id_especie, id_unidad_medida);


--
-- Name: cat_laboratorios fk_lab_especie; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cat_laboratorios
    ADD CONSTRAINT fk_lab_especie FOREIGN KEY (id_especie) REFERENCES public.cat_especies(id_especie);


--
-- Name: medicamentos fk_med_cat_compuesta; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medicamentos
    ADD CONSTRAINT fk_med_cat_compuesta FOREIGN KEY (id_especie, id_cat_med) REFERENCES public.cat_categorias_med(id_especie, id_cat_med);


--
-- Name: medicamentos fk_med_lab_compuesta; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medicamentos
    ADD CONSTRAINT fk_med_lab_compuesta FOREIGN KEY (id_especie, id_lab) REFERENCES public.cat_laboratorios(id_especie, id_laboratorio);


--
-- Name: medicamentos fk_med_vias_compuesta; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medicamentos
    ADD CONSTRAINT fk_med_vias_compuesta FOREIGN KEY (id_especie, id_via_admin) REFERENCES public.cat_vias_admin(id_especie, id_via_administracion);


--
-- Name: patologias fk_patologia_tipo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patologias
    ADD CONSTRAINT fk_patologia_tipo FOREIGN KEY (id_tipo_patologia) REFERENCES public.cat_tipo_patologia(id_tipo);


--
-- Name: cat_presentaciones fk_pres_especie; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cat_presentaciones
    ADD CONSTRAINT fk_pres_especie FOREIGN KEY (id_especie) REFERENCES public.cat_especies(id_especie);


--
-- Name: presentacion_medicamento fk_pres_med_compuesta; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.presentacion_medicamento
    ADD CONSTRAINT fk_pres_med_compuesta FOREIGN KEY (id_especie, id_medicamento) REFERENCES public.medicamentos(id_especie, id_med);


--
-- Name: presentacion_medicamento fk_presmed_forma_compuesta; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.presentacion_medicamento
    ADD CONSTRAINT fk_presmed_forma_compuesta FOREIGN KEY (id_especie, id_forma_farmaceutica) REFERENCES public.cat_formas_farmaceuticas(id_especie, id_forma_farmaceutica);


--
-- Name: presentacion_medicamento fk_presmed_pres_compuesta; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.presentacion_medicamento
    ADD CONSTRAINT fk_presmed_pres_compuesta FOREIGN KEY (id_especie, id_presentacion) REFERENCES public.cat_presentaciones(id_especie, id_presentacion);


--
-- Name: rel_vacuna_patologia fk_rel_especie; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rel_vacuna_patologia
    ADD CONSTRAINT fk_rel_especie FOREIGN KEY (id_especie) REFERENCES public.cat_especies(id_especie) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: rel_vacuna_laboratorio fk_rel_vac_lab; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rel_vacuna_laboratorio
    ADD CONSTRAINT fk_rel_vac_lab FOREIGN KEY (id_especie, id_lab) REFERENCES public.cat_laboratorios(id_especie, id_laboratorio);


--
-- Name: cat_unidades_medida fk_um_especie; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cat_unidades_medida
    ADD CONSTRAINT fk_um_especie FOREIGN KEY (id_especie) REFERENCES public.cat_especies(id_especie);


--
-- Name: cat_vias_admin fk_vias_especie; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cat_vias_admin
    ADD CONSTRAINT fk_vias_especie FOREIGN KEY (id_especie) REFERENCES public.cat_especies(id_especie);


--
-- Name: instrucciones_manejo instrucciones_manejo_id_comportamiento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.instrucciones_manejo
    ADD CONSTRAINT instrucciones_manejo_id_comportamiento_fkey FOREIGN KEY (id_comportamiento) REFERENCES public.temperamento_especie(id_comportamiento);


--
-- Name: mascota mascota_id_usuario_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mascota
    ADD CONSTRAINT mascota_id_usuario_fk_fkey FOREIGN KEY (id_usuario_fk) REFERENCES public.usuarios(id_usuario);


--
-- Name: mascota mascota_subtipo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mascota
    ADD CONSTRAINT mascota_subtipo_fkey FOREIGN KEY (id_especie, id_subtipo) REFERENCES public.cat_subtipos(id_especie, id_subtipo);


--
-- Name: rel_especie_patologia rel_especie_patologia_id_especie_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rel_especie_patologia
    ADD CONSTRAINT rel_especie_patologia_id_especie_fkey FOREIGN KEY (id_especie) REFERENCES public.cat_especies(id_especie);


--
-- Name: rel_patologia_agente rel_patologia_agente_id_agente_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rel_patologia_agente
    ADD CONSTRAINT rel_patologia_agente_id_agente_fkey FOREIGN KEY (id_agente) REFERENCES public.cat_agentes(id_agente);


--
-- Name: rel_patologia_sintoma rel_patologia_sintoma_id_sintoma_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rel_patologia_sintoma
    ADD CONSTRAINT rel_patologia_sintoma_id_sintoma_fkey FOREIGN KEY (id_sintoma) REFERENCES public.cat_sintomas(id_sintoma);


--
-- Name: rel_patologia_transmision rel_patologia_transmision_id_via_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rel_patologia_transmision
    ADD CONSTRAINT rel_patologia_transmision_id_via_fkey FOREIGN KEY (id_via) REFERENCES public.cat_vias_transmision(id_via);


--
-- Name: rel_patologia_tratamiento rel_patologia_tratamiento_id_tratamiento_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rel_patologia_tratamiento
    ADD CONSTRAINT rel_patologia_tratamiento_id_tratamiento_fkey FOREIGN KEY (id_tratamiento) REFERENCES public.cat_tratamientos(id_tratamiento);


--
-- Name: rel_vacuna_especie rel_vacuna_especie_id_especie_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rel_vacuna_especie
    ADD CONSTRAINT rel_vacuna_especie_id_especie_fkey FOREIGN KEY (id_especie) REFERENCES public.cat_especies(id_especie);


--
-- Name: reservaciones reservaciones_id_mascota_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservaciones
    ADD CONSTRAINT reservaciones_id_mascota_fk_fkey FOREIGN KEY (id_mascota_fk) REFERENCES public.mascota(id_mascota);


--
-- Name: reservaciones reservaciones_id_servicio_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservaciones
    ADD CONSTRAINT reservaciones_id_servicio_fk_fkey FOREIGN KEY (id_servicio_fk) REFERENCES public.cat_servicios(id_servicio);


--
-- Name: reservaciones reservaciones_id_usuario_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservaciones
    ADD CONSTRAINT reservaciones_id_usuario_fk_fkey FOREIGN KEY (id_usuario_fk) REFERENCES public.usuarios(id_usuario);


--
-- Name: temperamento_especie temperamento_especie_id_especie_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temperamento_especie
    ADD CONSTRAINT temperamento_especie_id_especie_fkey FOREIGN KEY (id_especie) REFERENCES public.cat_especies(id_especie);


--
-- Name: temperamento_especie temperamento_especie_id_rasgo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.temperamento_especie
    ADD CONSTRAINT temperamento_especie_id_rasgo_fkey FOREIGN KEY (id_rasgo) REFERENCES public.cat_rasgos(id_rasgo);


--
-- Name: usuarios usuarios_id_domicilio_fk_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_id_domicilio_fk_fkey FOREIGN KEY (id_domicilio_fk) REFERENCES public.domicilio(id_domicilio);


--
-- PostgreSQL database dump complete
--
