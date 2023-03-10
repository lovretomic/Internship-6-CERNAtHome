PGDMP         6                z         
   CERNAtHome    15.1    15.1 9    A           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            B           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            C           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            D           1262    16607 
   CERNAtHome    DATABASE     ?   CREATE DATABASE "CERNAtHome" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Croatian_Croatia.1250';
    DROP DATABASE "CERNAtHome";
                postgres    false            R           1247    16609    gender    TYPE     J   CREATE TYPE public.gender AS ENUM (
    'M',
    'F',
    'U',
    'O'
);
    DROP TYPE public.gender;
       public          postgres    false            U           1247    16618 
   profession    TYPE     n   CREATE TYPE public.profession AS ENUM (
    'Programmer',
    'Physicist',
    'Engineer',
    'Scientist'
);
    DROP TYPE public.profession;
       public          postgres    false            ?            1259    16761    accelerators    TABLE     g   CREATE TABLE public.accelerators (
    id integer NOT NULL,
    name character varying(30) NOT NULL
);
     DROP TABLE public.accelerators;
       public         heap    postgres    false            ?            1259    16760    accelerators_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.accelerators_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.accelerators_id_seq;
       public          postgres    false    219            E           0    0    accelerators_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.accelerators_id_seq OWNED BY public.accelerators.id;
          public          postgres    false    218            ?            1259    16826    acceleratorsprojects    TABLE     _   CREATE TABLE public.acceleratorsprojects (
    acceleratorid integer,
    projectid integer
);
 (   DROP TABLE public.acceleratorsprojects;
       public         heap    postgres    false            ?            1259    16628 	   countries    TABLE     ?   CREATE TABLE public.countries (
    id integer NOT NULL,
    name character varying(30) NOT NULL,
    population bigint NOT NULL,
    ppppc integer NOT NULL
);
    DROP TABLE public.countries;
       public         heap    postgres    false            ?            1259    16627    countries_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.countries_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.countries_id_seq;
       public          postgres    false    215            F           0    0    countries_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.countries_id_seq OWNED BY public.countries.id;
          public          postgres    false    214            ?            1259    16635    hotels    TABLE     ?   CREATE TABLE public.hotels (
    id integer NOT NULL,
    capacity integer NOT NULL,
    location character varying(30) NOT NULL,
    title character varying(30) NOT NULL
);
    DROP TABLE public.hotels;
       public         heap    postgres    false            ?            1259    16634    hotels_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.hotels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE public.hotels_id_seq;
       public          postgres    false    217            G           0    0    hotels_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE public.hotels_id_seq OWNED BY public.hotels.id;
          public          postgres    false    216            ?            1259    16808    projects    TABLE     [   CREATE TABLE public.projects (
    id integer NOT NULL,
    title character varying(30)
);
    DROP TABLE public.projects;
       public         heap    postgres    false            ?            1259    16807    projects_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.projects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.projects_id_seq;
       public          postgres    false    221            H           0    0    projects_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.projects_id_seq OWNED BY public.projects.id;
          public          postgres    false    220            ?            1259    16904 
   scientists    TABLE     >  CREATE TABLE public.scientists (
    id integer NOT NULL,
    firstname character varying(30) NOT NULL,
    lastname character varying(30) NOT NULL,
    countryid integer,
    gender public.gender NOT NULL,
    profession public.profession NOT NULL,
    hotelid integer,
    dateofbirth timestamp without time zone
);
    DROP TABLE public.scientists;
       public         heap    postgres    false    853    850            ?            1259    16903    scientists_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.scientists_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.scientists_id_seq;
       public          postgres    false    225            I           0    0    scientists_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.scientists_id_seq OWNED BY public.scientists.id;
          public          postgres    false    224            ?            1259    16839    scientistsworks    TABLE     U   CREATE TABLE public.scientistsworks (
    scientistid integer,
    workid integer
);
 #   DROP TABLE public.scientistsworks;
       public         heap    postgres    false            ?            1259    16921    works    TABLE     ?   CREATE TABLE public.works (
    id integer NOT NULL,
    title character varying(60) NOT NULL,
    numberofcitations integer NOT NULL,
    projectid integer,
    published timestamp without time zone
);
    DROP TABLE public.works;
       public         heap    postgres    false            ?            1259    16920    works_id_seq    SEQUENCE     ?   CREATE SEQUENCE public.works_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.works_id_seq;
       public          postgres    false    227            J           0    0    works_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.works_id_seq OWNED BY public.works.id;
          public          postgres    false    226            ?           2604    16764    accelerators id    DEFAULT     r   ALTER TABLE ONLY public.accelerators ALTER COLUMN id SET DEFAULT nextval('public.accelerators_id_seq'::regclass);
 >   ALTER TABLE public.accelerators ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    218    219    219            ?           2604    16631    countries id    DEFAULT     l   ALTER TABLE ONLY public.countries ALTER COLUMN id SET DEFAULT nextval('public.countries_id_seq'::regclass);
 ;   ALTER TABLE public.countries ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    214    215    215            ?           2604    16638 	   hotels id    DEFAULT     f   ALTER TABLE ONLY public.hotels ALTER COLUMN id SET DEFAULT nextval('public.hotels_id_seq'::regclass);
 8   ALTER TABLE public.hotels ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    217    216    217            ?           2604    16811    projects id    DEFAULT     j   ALTER TABLE ONLY public.projects ALTER COLUMN id SET DEFAULT nextval('public.projects_id_seq'::regclass);
 :   ALTER TABLE public.projects ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    220    221    221            ?           2604    16907    scientists id    DEFAULT     n   ALTER TABLE ONLY public.scientists ALTER COLUMN id SET DEFAULT nextval('public.scientists_id_seq'::regclass);
 <   ALTER TABLE public.scientists ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    225    224    225            ?           2604    16924    works id    DEFAULT     d   ALTER TABLE ONLY public.works ALTER COLUMN id SET DEFAULT nextval('public.works_id_seq'::regclass);
 7   ALTER TABLE public.works ALTER COLUMN id DROP DEFAULT;
       public          postgres    false    227    226    227            6          0    16761    accelerators 
   TABLE DATA           0   COPY public.accelerators (id, name) FROM stdin;
    public          postgres    false    219   ?>       9          0    16826    acceleratorsprojects 
   TABLE DATA           H   COPY public.acceleratorsprojects (acceleratorid, projectid) FROM stdin;
    public          postgres    false    222   ?>       2          0    16628 	   countries 
   TABLE DATA           @   COPY public.countries (id, name, population, ppppc) FROM stdin;
    public          postgres    false    215   (?       4          0    16635    hotels 
   TABLE DATA           ?   COPY public.hotels (id, capacity, location, title) FROM stdin;
    public          postgres    false    217   ??       8          0    16808    projects 
   TABLE DATA           -   COPY public.projects (id, title) FROM stdin;
    public          postgres    false    221   @       <          0    16904 
   scientists 
   TABLE DATA           r   COPY public.scientists (id, firstname, lastname, countryid, gender, profession, hotelid, dateofbirth) FROM stdin;
    public          postgres    false    225   c@       :          0    16839    scientistsworks 
   TABLE DATA           >   COPY public.scientistsworks (scientistid, workid) FROM stdin;
    public          postgres    false    223   ?A       >          0    16921    works 
   TABLE DATA           S   COPY public.works (id, title, numberofcitations, projectid, published) FROM stdin;
    public          postgres    false    227   ?A       K           0    0    accelerators_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.accelerators_id_seq', 9, true);
          public          postgres    false    218            L           0    0    countries_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.countries_id_seq', 6, true);
          public          postgres    false    214            M           0    0    hotels_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.hotels_id_seq', 3, true);
          public          postgres    false    216            N           0    0    projects_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.projects_id_seq', 8, true);
          public          postgres    false    220            O           0    0    scientists_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.scientists_id_seq', 10, true);
          public          postgres    false    224            P           0    0    works_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.works_id_seq', 17, true);
          public          postgres    false    226            ?           2606    16766    accelerators accelerators_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.accelerators
    ADD CONSTRAINT accelerators_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.accelerators DROP CONSTRAINT accelerators_pkey;
       public            postgres    false    219            ?           2606    16633    countries countries_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.countries DROP CONSTRAINT countries_pkey;
       public            postgres    false    215            ?           2606    16640    hotels hotels_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.hotels
    ADD CONSTRAINT hotels_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.hotels DROP CONSTRAINT hotels_pkey;
       public            postgres    false    217            ?           2606    16813    projects projects_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.projects DROP CONSTRAINT projects_pkey;
       public            postgres    false    221            ?           2606    16909    scientists scientists_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.scientists
    ADD CONSTRAINT scientists_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.scientists DROP CONSTRAINT scientists_pkey;
       public            postgres    false    225            ?           2606    16926    works works_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.works
    ADD CONSTRAINT works_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.works DROP CONSTRAINT works_pkey;
       public            postgres    false    227            ?           2606    16829 <   acceleratorsprojects acceleratorsprojects_acceleratorid_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.acceleratorsprojects
    ADD CONSTRAINT acceleratorsprojects_acceleratorid_fkey FOREIGN KEY (acceleratorid) REFERENCES public.accelerators(id);
 f   ALTER TABLE ONLY public.acceleratorsprojects DROP CONSTRAINT acceleratorsprojects_acceleratorid_fkey;
       public          postgres    false    222    3223    219            ?           2606    16834 8   acceleratorsprojects acceleratorsprojects_projectid_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.acceleratorsprojects
    ADD CONSTRAINT acceleratorsprojects_projectid_fkey FOREIGN KEY (projectid) REFERENCES public.projects(id);
 b   ALTER TABLE ONLY public.acceleratorsprojects DROP CONSTRAINT acceleratorsprojects_projectid_fkey;
       public          postgres    false    221    222    3225            ?           2606    16910 $   scientists scientists_countryid_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.scientists
    ADD CONSTRAINT scientists_countryid_fkey FOREIGN KEY (countryid) REFERENCES public.countries(id);
 N   ALTER TABLE ONLY public.scientists DROP CONSTRAINT scientists_countryid_fkey;
       public          postgres    false    225    215    3219            ?           2606    16915 "   scientists scientists_hotelid_fkey    FK CONSTRAINT     ?   ALTER TABLE ONLY public.scientists
    ADD CONSTRAINT scientists_hotelid_fkey FOREIGN KEY (hotelid) REFERENCES public.hotels(id);
 L   ALTER TABLE ONLY public.scientists DROP CONSTRAINT scientists_hotelid_fkey;
       public          postgres    false    225    217    3221            ?           2606    16927    works works_projectid_fkey    FK CONSTRAINT     ~   ALTER TABLE ONLY public.works
    ADD CONSTRAINT works_projectid_fkey FOREIGN KEY (projectid) REFERENCES public.projects(id);
 D   ALTER TABLE ONLY public.works DROP CONSTRAINT works_projectid_fkey;
       public          postgres    false    3225    227    221            6   @   x?Mǻ	 ! D??W??_C???3A??t'g?s???}^?	?@?F?6????-Tm?i?zA,?      9   ;   x???  ?P?ɺg1?_????@8????Xh???????).o???'?7??Y$/pd	]      2   g   x?3?tO-?M̫??06 NC ?e??Y??S?ij	6	s?%?%?r??C?M?@?&???1?&.SΠ????DNC???`?f????y?&?(V??qqq ]6      4   ]   x?3?443??tO?K-K?tK?,???+Qp/J?KQ??/I??2?472??I,-N??K?*8Ue????$?ps??s?U??q:?9Au??qqq I??      8   G   x?3?t??p?2??s43?2?t??u?2q??L9C-??8]?=???9}<?,8??]?b???? ??      <      x?e?AN?0EדSp?????H?V?
Ԃ?a3MLb?Kn????PH^???[C???ܳ?G(??b?"??.?]-Qi???B?_f?9z?????????/???LBLBt5!?!??aO<?@??P?
Ke????Sl??G?[2	??W?
+???+$????"??	r?[q????B?[ND	+????VF???oB
???"5?[j???XR^?fc?Ra?,N?v?i?4?r?V?7????F?Ÿ?l?
jd?M?,'? ?.?44
!j????x?{Y0???rB^??,?e섊      :   A   x????0?PL??{8???:??!Т?Lln?9lgA???B?A?uLCe=??h??
??!???
?      >      x?U?Mn?0???S?X????\?E?E???Zbl")??SݾCK?@.?͛????W?ߔo?I5?????E3t?1qY??e?e}?e?o?F?Q7k??ը????>v?u?*@,??wuG?l?j4??????.F($?I??L2????kT6????jяM???EP??.(`?g?c???l????y	|.??	~//᧳?9*?&?????2??TI%Y?L*8????Vw4??@?su?8g??Wװm??6?Ń?Zyܹ?3???{??????w??;?k??hy?"M?4.ޝ?;@Y?8??`|?gp?h|?.:?ϓm.???????f?+)?I????=???&MU>ߊ??_??<???a=J???H?=??G)???3+?+??CPz?Ǟ???? ??f??׈?????d|qZ?v????iUɡX??\??<*???lH=,?՜?????????z^?????t?U
 D??7vk??m6???	??     