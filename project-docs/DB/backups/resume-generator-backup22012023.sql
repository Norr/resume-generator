PGDMP     ,                      {            resume    15.1    15.1 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16398    resume    DATABASE     y   CREATE DATABASE resume WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Polish_Poland.1250';
    DROP DATABASE resume;
                postgres    false                        2615    16399    resume-generator    SCHEMA     "   CREATE SCHEMA "resume-generator";
     DROP SCHEMA "resume-generator";
                postgres    false            �            1259    16630    certificates    TABLE     1  CREATE TABLE "resume-generator".certificates (
    cert_id integer NOT NULL,
    cert_date timestamp without time zone NOT NULL,
    cert_organizer character varying(100) NOT NULL,
    cert_name character varying(255) NOT NULL,
    cert_link character varying(2048),
    cert_fk_users integer NOT NULL
);
 ,   DROP TABLE "resume-generator".certificates;
       resume-generator         heap    postgres    false    6            �           0    0    TABLE certificates    COMMENT     f   COMMENT ON TABLE "resume-generator".certificates IS 'User certificates from courses, training, etc.';
          resume-generator          postgres    false    216            �           0    0    COLUMN certificates.cert_date    COMMENT     V   COMMENT ON COLUMN "resume-generator".certificates.cert_date IS 'Date of certificate';
          resume-generator          postgres    false    216            �           0    0    COLUMN certificates.cert_name    COMMENT     a   COMMENT ON COLUMN "resume-generator".certificates.cert_name IS 'Name of course, training. etc.';
          resume-generator          postgres    false    216            �           0    0    COLUMN certificates.cert_link    COMMENT     V   COMMENT ON COLUMN "resume-generator".certificates.cert_link IS 'Link to certificate';
          resume-generator          postgres    false    216            �           0    0 !   COLUMN certificates.cert_fk_users    COMMENT     [   COMMENT ON COLUMN "resume-generator".certificates.cert_fk_users IS 'Foreign key to users';
          resume-generator          postgres    false    216            �            1259    16629    certificates_cert_id_seq    SEQUENCE     �   CREATE SEQUENCE "resume-generator".certificates_cert_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE "resume-generator".certificates_cert_id_seq;
       resume-generator          postgres    false    6    216            �           0    0    certificates_cert_id_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE "resume-generator".certificates_cert_id_seq OWNED BY "resume-generator".certificates.cert_id;
          resume-generator          postgres    false    215            �            1259    16639 	   education    TABLE     �  CREATE TABLE "resume-generator".education (
    ed_id integer NOT NULL,
    ed_fk_schools integer NOT NULL,
    ed_date_start timestamp without time zone NOT NULL,
    ed_date_finish timestamp without time zone,
    ed_fk_education_levels integer NOT NULL,
    ed_major character varying(500) NOT NULL,
    ed_specjalization character varying(300),
    ed_knowlage_gained text,
    ed_fk_users integer NOT NULL
);
 )   DROP TABLE "resume-generator".education;
       resume-generator         heap    postgres    false    6            �           0    0    TABLE education    COMMENT     M   COMMENT ON TABLE "resume-generator".education IS 'Table of education info.';
          resume-generator          postgres    false    218            �           0    0    COLUMN education.ed_fk_schools    COMMENT     Z   COMMENT ON COLUMN "resume-generator".education.ed_fk_schools IS 'Foreign key to schools';
          resume-generator          postgres    false    218            �           0    0 '   COLUMN education.ed_fk_education_levels    COMMENT     `   COMMENT ON COLUMN "resume-generator".education.ed_fk_education_levels IS 'Levels of education';
          resume-generator          postgres    false    218            �           0    0    COLUMN education.ed_major    COMMENT     D   COMMENT ON COLUMN "resume-generator".education.ed_major IS 'Major';
          resume-generator          postgres    false    218            �            1259    16638    education_ed_id_seq    SEQUENCE     �   CREATE SEQUENCE "resume-generator".education_ed_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE "resume-generator".education_ed_id_seq;
       resume-generator          postgres    false    6    218            �           0    0    education_ed_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE "resume-generator".education_ed_id_seq OWNED BY "resume-generator".education.ed_id;
          resume-generator          postgres    false    217            �            1259    16648    education_levels    TABLE     �   CREATE TABLE "resume-generator".education_levels (
    edlvl_id integer NOT NULL,
    edlvl_name character varying(150) NOT NULL
);
 0   DROP TABLE "resume-generator".education_levels;
       resume-generator         heap    postgres    false    6            �            1259    16647    education_levels_edlvl_id_seq    SEQUENCE     �   CREATE SEQUENCE "resume-generator".education_levels_edlvl_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 @   DROP SEQUENCE "resume-generator".education_levels_edlvl_id_seq;
       resume-generator          postgres    false    6    220            �           0    0    education_levels_edlvl_id_seq    SEQUENCE OWNED BY     w   ALTER SEQUENCE "resume-generator".education_levels_edlvl_id_seq OWNED BY "resume-generator".education_levels.edlvl_id;
          resume-generator          postgres    false    219            �            1259    16655 	   employers    TABLE     �   CREATE TABLE "resume-generator".employers (
    empl_id integer NOT NULL,
    empl_name character varying(150) NOT NULL,
    empl_city character varying(50) NOT NULL,
    empl_country character(2) NOT NULL
);
 )   DROP TABLE "resume-generator".employers;
       resume-generator         heap    postgres    false    6            �           0    0    TABLE employers    COMMENT     G   COMMENT ON TABLE "resume-generator".employers IS 'Table of employers';
          resume-generator          postgres    false    222            �           0    0    COLUMN employers.empl_name    COMMENT     P   COMMENT ON COLUMN "resume-generator".employers.empl_name IS 'Name of employer';
          resume-generator          postgres    false    222            �           0    0    COLUMN employers.empl_city    COMMENT     P   COMMENT ON COLUMN "resume-generator".employers.empl_city IS 'City of employer';
          resume-generator          postgres    false    222            �           0    0    COLUMN employers.empl_country    COMMENT     W   COMMENT ON COLUMN "resume-generator".employers.empl_country IS 'Country of employer.';
          resume-generator          postgres    false    222            �            1259    16654    employers_empl_id_seq    SEQUENCE     �   CREATE SEQUENCE "resume-generator".employers_empl_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE "resume-generator".employers_empl_id_seq;
       resume-generator          postgres    false    6    222            �           0    0    employers_empl_id_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE "resume-generator".employers_empl_id_seq OWNED BY "resume-generator".employers.empl_id;
          resume-generator          postgres    false    221            �            1259    16662 	   interests    TABLE     y   CREATE TABLE "resume-generator".interests (
    int_id integer NOT NULL,
    int_name character varying(200) NOT NULL
);
 )   DROP TABLE "resume-generator".interests;
       resume-generator         heap    postgres    false    6            �           0    0    TABLE interests    COMMENT     L   COMMENT ON TABLE "resume-generator".interests IS 'Table of user interests';
          resume-generator          postgres    false    224            �            1259    16661    interests_int_id_seq    SEQUENCE     �   CREATE SEQUENCE "resume-generator".interests_int_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE "resume-generator".interests_int_id_seq;
       resume-generator          postgres    false    224    6            �           0    0    interests_int_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE "resume-generator".interests_int_id_seq OWNED BY "resume-generator".interests.int_id;
          resume-generator          postgres    false    223            �            1259    16669    language    TABLE     z   CREATE TABLE "resume-generator".language (
    lang_id integer NOT NULL,
    lang_name character varying(100) NOT NULL
);
 (   DROP TABLE "resume-generator".language;
       resume-generator         heap    postgres    false    6            �           0    0    TABLE language    COMMENT     [   COMMENT ON TABLE "resume-generator".language IS 'Table of languages that the user knows.';
          resume-generator          postgres    false    226            �            1259    16668    language_lang_id_seq    SEQUENCE     �   CREATE SEQUENCE "resume-generator".language_lang_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE "resume-generator".language_lang_id_seq;
       resume-generator          postgres    false    226    6            �           0    0    language_lang_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE "resume-generator".language_lang_id_seq OWNED BY "resume-generator".language.lang_id;
          resume-generator          postgres    false    225            �            1259    16676    personal_info    TABLE     �  CREATE TABLE "resume-generator".personal_info (
    persinf_id integer NOT NULL,
    persinf_name character varying(100) NOT NULL,
    persinf_surname character varying(100) NOT NULL,
    persinf_date_of_birth timestamp without time zone NOT NULL,
    persinf_mobile character varying(12) NOT NULL,
    persinfo_locality character varying(50) NOT NULL,
    presinfo_photo text,
    persinfo_fk_users integer NOT NULL
);
 -   DROP TABLE "resume-generator".personal_info;
       resume-generator         heap    postgres    false    6            �           0    0    COLUMN personal_info.persinf_id    COMMENT     W   COMMENT ON COLUMN "resume-generator".personal_info.persinf_id IS 'Table primary key.';
          resume-generator          postgres    false    228            �           0    0 !   COLUMN personal_info.persinf_name    COMMENT     Q   COMMENT ON COLUMN "resume-generator".personal_info.persinf_name IS 'User name.';
          resume-generator          postgres    false    228            �           0    0 $   COLUMN personal_info.persinf_surname    COMMENT     W   COMMENT ON COLUMN "resume-generator".personal_info.persinf_surname IS 'User surname.';
          resume-generator          postgres    false    228            �           0    0 *   COLUMN personal_info.persinf_date_of_birth    COMMENT     d   COMMENT ON COLUMN "resume-generator".personal_info.persinf_date_of_birth IS 'Date of user birdth.';
          resume-generator          postgres    false    228            �           0    0 #   COLUMN personal_info.persinf_mobile    COMMENT     Z   COMMENT ON COLUMN "resume-generator".personal_info.persinf_mobile IS 'User phone number';
          resume-generator          postgres    false    228            �           0    0 &   COLUMN personal_info.persinfo_locality    COMMENT     Y   COMMENT ON COLUMN "resume-generator".personal_info.persinfo_locality IS 'User locality';
          resume-generator          postgres    false    228            �           0    0 #   COLUMN personal_info.presinfo_photo    COMMENT     S   COMMENT ON COLUMN "resume-generator".personal_info.presinfo_photo IS 'User photo';
          resume-generator          postgres    false    228            �            1259    16675    personal_info_persinf_id_seq    SEQUENCE     �   CREATE SEQUENCE "resume-generator".personal_info_persinf_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ?   DROP SEQUENCE "resume-generator".personal_info_persinf_id_seq;
       resume-generator          postgres    false    6    228            �           0    0    personal_info_persinf_id_seq    SEQUENCE OWNED BY     u   ALTER SEQUENCE "resume-generator".personal_info_persinf_id_seq OWNED BY "resume-generator".personal_info.persinf_id;
          resume-generator          postgres    false    227            �            1259    16685    schools    TABLE     �   CREATE TABLE "resume-generator".schools (
    schl_id integer NOT NULL,
    schl_name character varying(200) NOT NULL,
    schl_locality character varying(100) NOT NULL
);
 '   DROP TABLE "resume-generator".schools;
       resume-generator         heap    postgres    false    6            �           0    0    TABLE schools    COMMENT     D   COMMENT ON TABLE "resume-generator".schools IS 'Table of schools.';
          resume-generator          postgres    false    230            �            1259    16684    schools_schl_id_seq    SEQUENCE     �   CREATE SEQUENCE "resume-generator".schools_schl_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE "resume-generator".schools_schl_id_seq;
       resume-generator          postgres    false    6    230            �           0    0    schools_schl_id_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE "resume-generator".schools_schl_id_seq OWNED BY "resume-generator".schools.schl_id;
          resume-generator          postgres    false    229            �            1259    16692    skills    TABLE     v   CREATE TABLE "resume-generator".skills (
    skl_id integer NOT NULL,
    skl_name character varying(100) NOT NULL
);
 &   DROP TABLE "resume-generator".skills;
       resume-generator         heap    postgres    false    6            �           0    0    TABLE skills    COMMENT     R   COMMENT ON TABLE "resume-generator".skills IS 'Table of various types of skills';
          resume-generator          postgres    false    232            �            1259    16691    skills_skl_id_seq    SEQUENCE     �   CREATE SEQUENCE "resume-generator".skills_skl_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE "resume-generator".skills_skl_id_seq;
       resume-generator          postgres    false    232    6            �           0    0    skills_skl_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE "resume-generator".skills_skl_id_seq OWNED BY "resume-generator".skills.skl_id;
          resume-generator          postgres    false    231            �            1259    16699 	   templates    TABLE     �   CREATE TABLE "resume-generator".templates (
    tpl_id integer NOT NULL,
    tpl_name character varying(150) NOT NULL,
    tpl_file_name character varying(255) NOT NULL
);
 )   DROP TABLE "resume-generator".templates;
       resume-generator         heap    postgres    false    6            �           0    0    TABLE templates    COMMENT     I   COMMENT ON TABLE "resume-generator".templates IS 'A table of templates';
          resume-generator          postgres    false    234            �           0    0    COLUMN templates.tpl_name    COMMENT     O   COMMENT ON COLUMN "resume-generator".templates.tpl_name IS 'name of tamplate';
          resume-generator          postgres    false    234            �           0    0    COLUMN templates.tpl_file_name    COMMENT     V   COMMENT ON COLUMN "resume-generator".templates.tpl_file_name IS 'Template file name';
          resume-generator          postgres    false    234            �            1259    16698    templates_tpl_id_seq    SEQUENCE     �   CREATE SEQUENCE "resume-generator".templates_tpl_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE "resume-generator".templates_tpl_id_seq;
       resume-generator          postgres    false    6    234            �           0    0    templates_tpl_id_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE "resume-generator".templates_tpl_id_seq OWNED BY "resume-generator".templates.tpl_id;
          resume-generator          postgres    false    233            �            1259    16738    user_has_employers    TABLE        CREATE TABLE "resume-generator".user_has_employers (
    uhe_user_id integer NOT NULL,
    uhe_employer_id integer NOT NULL
);
 2   DROP TABLE "resume-generator".user_has_employers;
       resume-generator         heap    postgres    false    6            �            1259    16705    user_has_interests    TABLE     y   CREATE TABLE "resume-generator".user_has_interests (
    uhi_usr_id integer NOT NULL,
    uhi_int_id integer NOT NULL
);
 2   DROP TABLE "resume-generator".user_has_interests;
       resume-generator         heap    postgres    false    6            �            1259    16710    user_has_skills    TABLE     n   CREATE TABLE "resume-generator".user_has_skills (
    usr_id integer NOT NULL,
    skl_id integer NOT NULL
);
 /   DROP TABLE "resume-generator".user_has_skills;
       resume-generator         heap    postgres    false    6            �            1259    16715    user_knows_languages    TABLE     �   CREATE TABLE "resume-generator".user_knows_languages (
    ukl_usr_id integer NOT NULL,
    ukl_lang_id integer NOT NULL,
    ukl_level smallint NOT NULL
);
 4   DROP TABLE "resume-generator".user_knows_languages;
       resume-generator         heap    postgres    false    6            �            1259    16721    users    TABLE     <  CREATE TABLE "resume-generator".users (
    usr_id integer NOT NULL,
    usr_email character varying(255) NOT NULL,
    usr_password character(128) NOT NULL,
    usr_register_date date DEFAULT CURRENT_DATE NOT NULL,
    usr_email_confirmation boolean DEFAULT false NOT NULL,
    usr_fk_templates integer NOT NULL
);
 %   DROP TABLE "resume-generator".users;
       resume-generator         heap    postgres    false    6            �           0    0    TABLE users    COMMENT     ?   COMMENT ON TABLE "resume-generator".users IS 'Table of users';
          resume-generator          postgres    false    239            �           0    0    COLUMN users.usr_id    COMMENT     \   COMMENT ON COLUMN "resume-generator".users.usr_id IS 'Unique user id with auto-increment.';
          resume-generator          postgres    false    239            �           0    0    COLUMN users.usr_email    COMMENT     R   COMMENT ON COLUMN "resume-generator".users.usr_email IS 'Email address of user.';
          resume-generator          postgres    false    239            �           0    0    COLUMN users.usr_password    COMMENT     M   COMMENT ON COLUMN "resume-generator".users.usr_password IS 'User password.';
          resume-generator          postgres    false    239            �           0    0    COLUMN users.usr_register_date    COMMENT     ^   COMMENT ON COLUMN "resume-generator".users.usr_register_date IS 'Date of user registration.';
          resume-generator          postgres    false    239            �           0    0 #   COLUMN users.usr_email_confirmation    COMMENT     m   COMMENT ON COLUMN "resume-generator".users.usr_email_confirmation IS 'Flag that chek if user confirm email';
          resume-generator          postgres    false    239            �            1259    16720    users_usr_id_seq    SEQUENCE     �   CREATE SEQUENCE "resume-generator".users_usr_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE "resume-generator".users_usr_id_seq;
       resume-generator          postgres    false    6    239            �           0    0    users_usr_id_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE "resume-generator".users_usr_id_seq OWNED BY "resume-generator".users.usr_id;
          resume-generator          postgres    false    238            �            1259    16730 	   work_info    TABLE     [  CREATE TABLE "resume-generator".work_info (
    wrkinf_id integer NOT NULL,
    wrkinf_from timestamp without time zone NOT NULL,
    wrkinfo_to timestamp without time zone,
    wrkinf_organization character varying(150) NOT NULL,
    wrkinf_knowledge_gained text,
    wrkinf_fk_users integer NOT NULL,
    wrkinf_fk_employers integer NOT NULL
);
 )   DROP TABLE "resume-generator".work_info;
       resume-generator         heap    postgres    false    6            �           0    0    TABLE work_info    COMMENT     U   COMMENT ON TABLE "resume-generator".work_info IS 'Info about user work experience.';
          resume-generator          postgres    false    241            �           0    0    COLUMN work_info.wrkinf_from    COMMENT     L   COMMENT ON COLUMN "resume-generator".work_info.wrkinf_from IS 'Start date';
          resume-generator          postgres    false    241            �           0    0    COLUMN work_info.wrkinfo_to    COMMENT     I   COMMENT ON COLUMN "resume-generator".work_info.wrkinfo_to IS 'End date';
          resume-generator          postgres    false    241            �           0    0 $   COLUMN work_info.wrkinf_organization    COMMENT     [   COMMENT ON COLUMN "resume-generator".work_info.wrkinf_organization IS 'Name of employer.';
          resume-generator          postgres    false    241            �           0    0 (   COLUMN work_info.wrkinf_knowledge_gained    COMMENT     k   COMMENT ON COLUMN "resume-generator".work_info.wrkinf_knowledge_gained IS 'Knowledge gained during work.';
          resume-generator          postgres    false    241            �           0    0 $   COLUMN work_info.wrkinf_fk_employers    COMMENT     i   COMMENT ON COLUMN "resume-generator".work_info.wrkinf_fk_employers IS 'Foreign key to employers table.';
          resume-generator          postgres    false    241            �            1259    16729    work_info_wrkinf_id_seq    SEQUENCE     �   CREATE SEQUENCE "resume-generator".work_info_wrkinf_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE "resume-generator".work_info_wrkinf_id_seq;
       resume-generator          postgres    false    241    6            �           0    0    work_info_wrkinf_id_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE "resume-generator".work_info_wrkinf_id_seq OWNED BY "resume-generator".work_info.wrkinf_id;
          resume-generator          postgres    false    240            �           2604    16633    certificates cert_id    DEFAULT     �   ALTER TABLE ONLY "resume-generator".certificates ALTER COLUMN cert_id SET DEFAULT nextval('"resume-generator".certificates_cert_id_seq'::regclass);
 O   ALTER TABLE "resume-generator".certificates ALTER COLUMN cert_id DROP DEFAULT;
       resume-generator          postgres    false    216    215    216            �           2604    16642    education ed_id    DEFAULT     �   ALTER TABLE ONLY "resume-generator".education ALTER COLUMN ed_id SET DEFAULT nextval('"resume-generator".education_ed_id_seq'::regclass);
 J   ALTER TABLE "resume-generator".education ALTER COLUMN ed_id DROP DEFAULT;
       resume-generator          postgres    false    217    218    218            �           2604    16651    education_levels edlvl_id    DEFAULT     �   ALTER TABLE ONLY "resume-generator".education_levels ALTER COLUMN edlvl_id SET DEFAULT nextval('"resume-generator".education_levels_edlvl_id_seq'::regclass);
 T   ALTER TABLE "resume-generator".education_levels ALTER COLUMN edlvl_id DROP DEFAULT;
       resume-generator          postgres    false    220    219    220            �           2604    16658    employers empl_id    DEFAULT     �   ALTER TABLE ONLY "resume-generator".employers ALTER COLUMN empl_id SET DEFAULT nextval('"resume-generator".employers_empl_id_seq'::regclass);
 L   ALTER TABLE "resume-generator".employers ALTER COLUMN empl_id DROP DEFAULT;
       resume-generator          postgres    false    221    222    222            �           2604    16665    interests int_id    DEFAULT     �   ALTER TABLE ONLY "resume-generator".interests ALTER COLUMN int_id SET DEFAULT nextval('"resume-generator".interests_int_id_seq'::regclass);
 K   ALTER TABLE "resume-generator".interests ALTER COLUMN int_id DROP DEFAULT;
       resume-generator          postgres    false    223    224    224            �           2604    16672    language lang_id    DEFAULT     �   ALTER TABLE ONLY "resume-generator".language ALTER COLUMN lang_id SET DEFAULT nextval('"resume-generator".language_lang_id_seq'::regclass);
 K   ALTER TABLE "resume-generator".language ALTER COLUMN lang_id DROP DEFAULT;
       resume-generator          postgres    false    226    225    226            �           2604    16679    personal_info persinf_id    DEFAULT     �   ALTER TABLE ONLY "resume-generator".personal_info ALTER COLUMN persinf_id SET DEFAULT nextval('"resume-generator".personal_info_persinf_id_seq'::regclass);
 S   ALTER TABLE "resume-generator".personal_info ALTER COLUMN persinf_id DROP DEFAULT;
       resume-generator          postgres    false    228    227    228            �           2604    16688    schools schl_id    DEFAULT     �   ALTER TABLE ONLY "resume-generator".schools ALTER COLUMN schl_id SET DEFAULT nextval('"resume-generator".schools_schl_id_seq'::regclass);
 J   ALTER TABLE "resume-generator".schools ALTER COLUMN schl_id DROP DEFAULT;
       resume-generator          postgres    false    230    229    230            �           2604    16695    skills skl_id    DEFAULT     �   ALTER TABLE ONLY "resume-generator".skills ALTER COLUMN skl_id SET DEFAULT nextval('"resume-generator".skills_skl_id_seq'::regclass);
 H   ALTER TABLE "resume-generator".skills ALTER COLUMN skl_id DROP DEFAULT;
       resume-generator          postgres    false    232    231    232            �           2604    16702    templates tpl_id    DEFAULT     �   ALTER TABLE ONLY "resume-generator".templates ALTER COLUMN tpl_id SET DEFAULT nextval('"resume-generator".templates_tpl_id_seq'::regclass);
 K   ALTER TABLE "resume-generator".templates ALTER COLUMN tpl_id DROP DEFAULT;
       resume-generator          postgres    false    233    234    234            �           2604    16724    users usr_id    DEFAULT     �   ALTER TABLE ONLY "resume-generator".users ALTER COLUMN usr_id SET DEFAULT nextval('"resume-generator".users_usr_id_seq'::regclass);
 G   ALTER TABLE "resume-generator".users ALTER COLUMN usr_id DROP DEFAULT;
       resume-generator          postgres    false    239    238    239            �           2604    16733    work_info wrkinf_id    DEFAULT     �   ALTER TABLE ONLY "resume-generator".work_info ALTER COLUMN wrkinf_id SET DEFAULT nextval('"resume-generator".work_info_wrkinf_id_seq'::regclass);
 N   ALTER TABLE "resume-generator".work_info ALTER COLUMN wrkinf_id DROP DEFAULT;
       resume-generator          postgres    false    241    240    241            z          0    16630    certificates 
   TABLE DATA           {   COPY "resume-generator".certificates (cert_id, cert_date, cert_organizer, cert_name, cert_link, cert_fk_users) FROM stdin;
    resume-generator          postgres    false    216   x�       |          0    16639 	   education 
   TABLE DATA           �   COPY "resume-generator".education (ed_id, ed_fk_schools, ed_date_start, ed_date_finish, ed_fk_education_levels, ed_major, ed_specjalization, ed_knowlage_gained, ed_fk_users) FROM stdin;
    resume-generator          postgres    false    218   ��       ~          0    16648    education_levels 
   TABLE DATA           L   COPY "resume-generator".education_levels (edlvl_id, edlvl_name) FROM stdin;
    resume-generator          postgres    false    220   ��       �          0    16655 	   employers 
   TABLE DATA           \   COPY "resume-generator".employers (empl_id, empl_name, empl_city, empl_country) FROM stdin;
    resume-generator          postgres    false    222   ��       �          0    16662 	   interests 
   TABLE DATA           A   COPY "resume-generator".interests (int_id, int_name) FROM stdin;
    resume-generator          postgres    false    224   ��       �          0    16669    language 
   TABLE DATA           B   COPY "resume-generator".language (lang_id, lang_name) FROM stdin;
    resume-generator          postgres    false    226   	�       �          0    16676    personal_info 
   TABLE DATA           �   COPY "resume-generator".personal_info (persinf_id, persinf_name, persinf_surname, persinf_date_of_birth, persinf_mobile, persinfo_locality, presinfo_photo, persinfo_fk_users) FROM stdin;
    resume-generator          postgres    false    228   &�       �          0    16685    schools 
   TABLE DATA           P   COPY "resume-generator".schools (schl_id, schl_name, schl_locality) FROM stdin;
    resume-generator          postgres    false    230   C�       �          0    16692    skills 
   TABLE DATA           >   COPY "resume-generator".skills (skl_id, skl_name) FROM stdin;
    resume-generator          postgres    false    232   `�       �          0    16699 	   templates 
   TABLE DATA           P   COPY "resume-generator".templates (tpl_id, tpl_name, tpl_file_name) FROM stdin;
    resume-generator          postgres    false    234   }�       �          0    16738    user_has_employers 
   TABLE DATA           V   COPY "resume-generator".user_has_employers (uhe_user_id, uhe_employer_id) FROM stdin;
    resume-generator          postgres    false    242   ��       �          0    16705    user_has_interests 
   TABLE DATA           P   COPY "resume-generator".user_has_interests (uhi_usr_id, uhi_int_id) FROM stdin;
    resume-generator          postgres    false    235   ��       �          0    16710    user_has_skills 
   TABLE DATA           E   COPY "resume-generator".user_has_skills (usr_id, skl_id) FROM stdin;
    resume-generator          postgres    false    236   ��       �          0    16715    user_knows_languages 
   TABLE DATA           ^   COPY "resume-generator".user_knows_languages (ukl_usr_id, ukl_lang_id, ukl_level) FROM stdin;
    resume-generator          postgres    false    237   ��       �          0    16721    users 
   TABLE DATA           �   COPY "resume-generator".users (usr_id, usr_email, usr_password, usr_register_date, usr_email_confirmation, usr_fk_templates) FROM stdin;
    resume-generator          postgres    false    239   �       �          0    16730 	   work_info 
   TABLE DATA           �   COPY "resume-generator".work_info (wrkinf_id, wrkinf_from, wrkinfo_to, wrkinf_organization, wrkinf_knowledge_gained, wrkinf_fk_users, wrkinf_fk_employers) FROM stdin;
    resume-generator          postgres    false    241   +�       �           0    0    certificates_cert_id_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('"resume-generator".certificates_cert_id_seq', 1, false);
          resume-generator          postgres    false    215            �           0    0    education_ed_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('"resume-generator".education_ed_id_seq', 1, false);
          resume-generator          postgres    false    217            �           0    0    education_levels_edlvl_id_seq    SEQUENCE SET     X   SELECT pg_catalog.setval('"resume-generator".education_levels_edlvl_id_seq', 1, false);
          resume-generator          postgres    false    219            �           0    0    employers_empl_id_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('"resume-generator".employers_empl_id_seq', 1, false);
          resume-generator          postgres    false    221            �           0    0    interests_int_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('"resume-generator".interests_int_id_seq', 1, false);
          resume-generator          postgres    false    223            �           0    0    language_lang_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('"resume-generator".language_lang_id_seq', 1, false);
          resume-generator          postgres    false    225            �           0    0    personal_info_persinf_id_seq    SEQUENCE SET     W   SELECT pg_catalog.setval('"resume-generator".personal_info_persinf_id_seq', 1, false);
          resume-generator          postgres    false    227            �           0    0    schools_schl_id_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('"resume-generator".schools_schl_id_seq', 1, false);
          resume-generator          postgres    false    229            �           0    0    skills_skl_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('"resume-generator".skills_skl_id_seq', 1, false);
          resume-generator          postgres    false    231            �           0    0    templates_tpl_id_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('"resume-generator".templates_tpl_id_seq', 1, false);
          resume-generator          postgres    false    233            �           0    0    users_usr_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('"resume-generator".users_usr_id_seq', 1, false);
          resume-generator          postgres    false    238            �           0    0    work_info_wrkinf_id_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('"resume-generator".work_info_wrkinf_id_seq', 1, false);
          resume-generator          postgres    false    240            �           2606    16637    certificates pk_certificates 
   CONSTRAINT     k   ALTER TABLE ONLY "resume-generator".certificates
    ADD CONSTRAINT pk_certificates PRIMARY KEY (cert_id);
 R   ALTER TABLE ONLY "resume-generator".certificates DROP CONSTRAINT pk_certificates;
       resume-generator            postgres    false    216            �           2606    16646    education pk_education 
   CONSTRAINT     c   ALTER TABLE ONLY "resume-generator".education
    ADD CONSTRAINT pk_education PRIMARY KEY (ed_id);
 L   ALTER TABLE ONLY "resume-generator".education DROP CONSTRAINT pk_education;
       resume-generator            postgres    false    218            �           2606    16653 #   education_levels pk_education_level 
   CONSTRAINT     s   ALTER TABLE ONLY "resume-generator".education_levels
    ADD CONSTRAINT pk_education_level PRIMARY KEY (edlvl_id);
 Y   ALTER TABLE ONLY "resume-generator".education_levels DROP CONSTRAINT pk_education_level;
       resume-generator            postgres    false    220            �           2606    16660    employers pk_employers 
   CONSTRAINT     e   ALTER TABLE ONLY "resume-generator".employers
    ADD CONSTRAINT pk_employers PRIMARY KEY (empl_id);
 L   ALTER TABLE ONLY "resume-generator".employers DROP CONSTRAINT pk_employers;
       resume-generator            postgres    false    222            �           2606    16667    interests pk_interests 
   CONSTRAINT     d   ALTER TABLE ONLY "resume-generator".interests
    ADD CONSTRAINT pk_interests PRIMARY KEY (int_id);
 L   ALTER TABLE ONLY "resume-generator".interests DROP CONSTRAINT pk_interests;
       resume-generator            postgres    false    224            �           2606    16683    personal_info pk_personal_info 
   CONSTRAINT     p   ALTER TABLE ONLY "resume-generator".personal_info
    ADD CONSTRAINT pk_personal_info PRIMARY KEY (persinf_id);
 T   ALTER TABLE ONLY "resume-generator".personal_info DROP CONSTRAINT pk_personal_info;
       resume-generator            postgres    false    228            �           2606    16690    schools pk_schools 
   CONSTRAINT     a   ALTER TABLE ONLY "resume-generator".schools
    ADD CONSTRAINT pk_schools PRIMARY KEY (schl_id);
 H   ALTER TABLE ONLY "resume-generator".schools DROP CONSTRAINT pk_schools;
       resume-generator            postgres    false    230            �           2606    16697    skills pk_skills 
   CONSTRAINT     ^   ALTER TABLE ONLY "resume-generator".skills
    ADD CONSTRAINT pk_skills PRIMARY KEY (skl_id);
 F   ALTER TABLE ONLY "resume-generator".skills DROP CONSTRAINT pk_skills;
       resume-generator            postgres    false    232            �           2606    16674    language pk_tbl 
   CONSTRAINT     ^   ALTER TABLE ONLY "resume-generator".language
    ADD CONSTRAINT pk_tbl PRIMARY KEY (lang_id);
 E   ALTER TABLE ONLY "resume-generator".language DROP CONSTRAINT pk_tbl;
       resume-generator            postgres    false    226            �           2606    16704    templates pk_templates 
   CONSTRAINT     d   ALTER TABLE ONLY "resume-generator".templates
    ADD CONSTRAINT pk_templates PRIMARY KEY (tpl_id);
 L   ALTER TABLE ONLY "resume-generator".templates DROP CONSTRAINT pk_templates;
       resume-generator            postgres    false    234            �           2606    16709 (   user_has_interests pk_user_has_interests 
   CONSTRAINT     �   ALTER TABLE ONLY "resume-generator".user_has_interests
    ADD CONSTRAINT pk_user_has_interests PRIMARY KEY (uhi_usr_id, uhi_int_id);
 ^   ALTER TABLE ONLY "resume-generator".user_has_interests DROP CONSTRAINT pk_user_has_interests;
       resume-generator            postgres    false    235    235            �           2606    16719 ,   user_knows_languages pk_user_knows_languages 
   CONSTRAINT     �   ALTER TABLE ONLY "resume-generator".user_knows_languages
    ADD CONSTRAINT pk_user_knows_languages PRIMARY KEY (ukl_usr_id, ukl_lang_id);
 b   ALTER TABLE ONLY "resume-generator".user_knows_languages DROP CONSTRAINT pk_user_knows_languages;
       resume-generator            postgres    false    237    237            �           2606    16728    users pk_users 
   CONSTRAINT     \   ALTER TABLE ONLY "resume-generator".users
    ADD CONSTRAINT pk_users PRIMARY KEY (usr_id);
 D   ALTER TABLE ONLY "resume-generator".users DROP CONSTRAINT pk_users;
       resume-generator            postgres    false    239            �           2606    16714 #   user_has_skills pk_users_has_skills 
   CONSTRAINT     y   ALTER TABLE ONLY "resume-generator".user_has_skills
    ADD CONSTRAINT pk_users_has_skills PRIMARY KEY (usr_id, skl_id);
 Y   ALTER TABLE ONLY "resume-generator".user_has_skills DROP CONSTRAINT pk_users_has_skills;
       resume-generator            postgres    false    236    236            �           2606    16737    work_info pk_work_info 
   CONSTRAINT     g   ALTER TABLE ONLY "resume-generator".work_info
    ADD CONSTRAINT pk_work_info PRIMARY KEY (wrkinf_id);
 L   ALTER TABLE ONLY "resume-generator".work_info DROP CONSTRAINT pk_work_info;
       resume-generator            postgres    false    241            �           2606    16742 *   user_has_employers user_has_employers_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY "resume-generator".user_has_employers
    ADD CONSTRAINT user_has_employers_pkey PRIMARY KEY (uhe_user_id, uhe_employer_id);
 `   ALTER TABLE ONLY "resume-generator".user_has_employers DROP CONSTRAINT user_has_employers_pkey;
       resume-generator            postgres    false    242    242            �           2606    16743 ,   certificates certificates_cert_fk_users_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "resume-generator".certificates
    ADD CONSTRAINT certificates_cert_fk_users_fkey FOREIGN KEY (cert_fk_users) REFERENCES "resume-generator".users(usr_id) NOT VALID;
 b   ALTER TABLE ONLY "resume-generator".certificates DROP CONSTRAINT certificates_cert_fk_users_fkey;
       resume-generator          postgres    false    216    239    3286            �           2606    16748 /   education education_ed_fk_education_levels_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "resume-generator".education
    ADD CONSTRAINT education_ed_fk_education_levels_fkey FOREIGN KEY (ed_fk_education_levels) REFERENCES "resume-generator".education_levels(edlvl_id) NOT VALID;
 e   ALTER TABLE ONLY "resume-generator".education DROP CONSTRAINT education_ed_fk_education_levels_fkey;
       resume-generator          postgres    false    218    220    3264            �           2606    16753 &   education education_ed_fk_schools_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "resume-generator".education
    ADD CONSTRAINT education_ed_fk_schools_fkey FOREIGN KEY (ed_fk_schools) REFERENCES "resume-generator".schools(schl_id) NOT VALID;
 \   ALTER TABLE ONLY "resume-generator".education DROP CONSTRAINT education_ed_fk_schools_fkey;
       resume-generator          postgres    false    230    218    3274            �           2606    16758 $   education education_ed_fk_users_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "resume-generator".education
    ADD CONSTRAINT education_ed_fk_users_fkey FOREIGN KEY (ed_fk_users) REFERENCES "resume-generator".users(usr_id) NOT VALID;
 Z   ALTER TABLE ONLY "resume-generator".education DROP CONSTRAINT education_ed_fk_users_fkey;
       resume-generator          postgres    false    3286    218    239            �           2606    16763 2   personal_info personal_info_persinfo_fk_users_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "resume-generator".personal_info
    ADD CONSTRAINT personal_info_persinfo_fk_users_fkey FOREIGN KEY (persinfo_fk_users) REFERENCES "resume-generator".users(usr_id) NOT VALID;
 h   ALTER TABLE ONLY "resume-generator".personal_info DROP CONSTRAINT personal_info_persinfo_fk_users_fkey;
       resume-generator          postgres    false    228    3286    239            �           2606    16818 :   user_has_employers user_has_employers_uhe_employer_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "resume-generator".user_has_employers
    ADD CONSTRAINT user_has_employers_uhe_employer_id_fkey FOREIGN KEY (uhe_employer_id) REFERENCES "resume-generator".employers(empl_id) NOT VALID;
 p   ALTER TABLE ONLY "resume-generator".user_has_employers DROP CONSTRAINT user_has_employers_uhe_employer_id_fkey;
       resume-generator          postgres    false    3266    242    222            �           2606    16813 6   user_has_employers user_has_employers_uhe_user_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "resume-generator".user_has_employers
    ADD CONSTRAINT user_has_employers_uhe_user_id_fkey FOREIGN KEY (uhe_user_id) REFERENCES "resume-generator".users(usr_id) NOT VALID;
 l   ALTER TABLE ONLY "resume-generator".user_has_employers DROP CONSTRAINT user_has_employers_uhe_user_id_fkey;
       resume-generator          postgres    false    242    239    3286            �           2606    16773 5   user_has_interests user_has_interests_uhi_int_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "resume-generator".user_has_interests
    ADD CONSTRAINT user_has_interests_uhi_int_id_fkey FOREIGN KEY (uhi_int_id) REFERENCES "resume-generator".interests(int_id) NOT VALID;
 k   ALTER TABLE ONLY "resume-generator".user_has_interests DROP CONSTRAINT user_has_interests_uhi_int_id_fkey;
       resume-generator          postgres    false    3268    235    224            �           2606    16768 5   user_has_interests user_has_interests_uhi_usr_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "resume-generator".user_has_interests
    ADD CONSTRAINT user_has_interests_uhi_usr_id_fkey FOREIGN KEY (uhi_usr_id) REFERENCES "resume-generator".users(usr_id) NOT VALID;
 k   ALTER TABLE ONLY "resume-generator".user_has_interests DROP CONSTRAINT user_has_interests_uhi_usr_id_fkey;
       resume-generator          postgres    false    239    235    3286            �           2606    16783 +   user_has_skills user_has_skills_skl_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "resume-generator".user_has_skills
    ADD CONSTRAINT user_has_skills_skl_id_fkey FOREIGN KEY (skl_id) REFERENCES "resume-generator".skills(skl_id) NOT VALID;
 a   ALTER TABLE ONLY "resume-generator".user_has_skills DROP CONSTRAINT user_has_skills_skl_id_fkey;
       resume-generator          postgres    false    3276    232    236            �           2606    16778 +   user_has_skills user_has_skills_usr_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "resume-generator".user_has_skills
    ADD CONSTRAINT user_has_skills_usr_id_fkey FOREIGN KEY (usr_id) REFERENCES "resume-generator".users(usr_id) NOT VALID;
 a   ALTER TABLE ONLY "resume-generator".user_has_skills DROP CONSTRAINT user_has_skills_usr_id_fkey;
       resume-generator          postgres    false    239    3286    236            �           2606    16793 :   user_knows_languages user_knows_languages_ukl_lang_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "resume-generator".user_knows_languages
    ADD CONSTRAINT user_knows_languages_ukl_lang_id_fkey FOREIGN KEY (ukl_lang_id) REFERENCES "resume-generator".language(lang_id) NOT VALID;
 p   ALTER TABLE ONLY "resume-generator".user_knows_languages DROP CONSTRAINT user_knows_languages_ukl_lang_id_fkey;
       resume-generator          postgres    false    237    3270    226            �           2606    16788 9   user_knows_languages user_knows_languages_ukl_usr_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "resume-generator".user_knows_languages
    ADD CONSTRAINT user_knows_languages_ukl_usr_id_fkey FOREIGN KEY (ukl_usr_id) REFERENCES "resume-generator".users(usr_id) NOT VALID;
 o   ALTER TABLE ONLY "resume-generator".user_knows_languages DROP CONSTRAINT user_knows_languages_ukl_usr_id_fkey;
       resume-generator          postgres    false    3286    239    237            �           2606    16798 !   users users_usr_fk_templates_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "resume-generator".users
    ADD CONSTRAINT users_usr_fk_templates_fkey FOREIGN KEY (usr_fk_templates) REFERENCES "resume-generator".templates(tpl_id) NOT VALID;
 W   ALTER TABLE ONLY "resume-generator".users DROP CONSTRAINT users_usr_fk_templates_fkey;
       resume-generator          postgres    false    234    239    3278            �           2606    16808 ,   work_info work_info_wrkinf_fk_employers_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "resume-generator".work_info
    ADD CONSTRAINT work_info_wrkinf_fk_employers_fkey FOREIGN KEY (wrkinf_fk_employers) REFERENCES "resume-generator".employers(empl_id) NOT VALID;
 b   ALTER TABLE ONLY "resume-generator".work_info DROP CONSTRAINT work_info_wrkinf_fk_employers_fkey;
       resume-generator          postgres    false    222    3266    241            �           2606    16803 (   work_info work_info_wrkinf_fk_users_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY "resume-generator".work_info
    ADD CONSTRAINT work_info_wrkinf_fk_users_fkey FOREIGN KEY (wrkinf_fk_users) REFERENCES "resume-generator".users(usr_id) NOT VALID;
 ^   ALTER TABLE ONLY "resume-generator".work_info DROP CONSTRAINT work_info_wrkinf_fk_users_fkey;
       resume-generator          postgres    false    241    239    3286            z      x������ � �      |      x������ � �      ~      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �      �      x������ � �     