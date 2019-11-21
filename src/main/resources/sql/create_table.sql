CREATE TABLE public.category
(
    id          integer                                        NOT NULL DEFAULT nextval('category_id_seq'::regclass),
    name        character varying COLLATE pg_catalog."default" NOT NULL,
    description character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT category_pkey PRIMARY KEY (id)
);

CREATE TABLE public."order"
(
    id           integer                                        NOT NULL DEFAULT nextval('order_id_seq'::regclass),
    " idProfile" integer                                        NOT NULL DEFAULT nextval('"order_ idProfile_seq"'::regclass),
    date         character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT order_pkey PRIMARY KEY (id),
    CONSTRAINT "order_ idProfile_fkey" FOREIGN KEY (" idProfile")
        REFERENCES public."purchaserProfileInfo" (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);

CREATE TABLE public."orderProduct"
(
    id          integer NOT NULL DEFAULT nextval('"orderProduct_id_seq"'::regclass),
    "idProduct" integer NOT NULL DEFAULT nextval('"orderProduct_idProduct_seq"'::regclass),
    "idOrder"   integer NOT NULL DEFAULT nextval('"orderProduct_idOrder_seq"'::regclass),
    quantity    integer NOT NULL,
    CONSTRAINT "orderProduct_pkey" PRIMARY KEY (id),
    CONSTRAINT "order" FOREIGN KEY ("idOrder")
        REFERENCES public."order" (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT product FOREIGN KEY ("idProduct")
        REFERENCES public.product (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);

CREATE TABLE public.product
(
    id           integer                                        NOT NULL DEFAULT nextval('product_id_seq'::regclass),
    "ownerId"    integer                                        NOT NULL DEFAULT nextval('"product_ownerId_seq"'::regclass),
    "categoryId" integer                                        NOT NULL DEFAULT nextval('"product_categoryId_seq"'::regclass),
    name         character varying COLLATE pg_catalog."default" NOT NULL,
    description  character varying COLLATE pg_catalog."default" NOT NULL,
    price        double precision                               NOT NULL,
    quantity     integer                                        NOT NULL,
    CONSTRAINT product_pkey PRIMARY KEY (id),
    CONSTRAINT category FOREIGN KEY ("categoryId")
        REFERENCES public.category (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT owner FOREIGN KEY ("ownerId")
        REFERENCES public."sellerProfileInfo" (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);

CREATE TABLE public."purchaserProfileInfo"
(
    id            integer                                        NOT NULL DEFAULT nextval('"purchaserProfileInfo_id_seq"'::regclass),
    "userId"      integer                                        NOT NULL DEFAULT nextval('"purchaserProfileInfo_userId_seq"'::regclass),
    "firstName"   character varying COLLATE pg_catalog."default" NOT NULL,
    "secondName"  character varying COLLATE pg_catalog."default" NOT NULL,
    "dataOfBirth" character varying COLLATE pg_catalog."default" NOT NULL,
    address       character varying COLLATE pg_catalog."default" NOT NULL,
    "phoneNumber" character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "purchaserProfileInfo_pkey" PRIMARY KEY (id),
    CONSTRAINT "user" FOREIGN KEY ("userId")
        REFERENCES public."user" (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);

CREATE TABLE public.role
(
    id          integer                                        NOT NULL DEFAULT nextval('role_id_seq'::regclass),
    name        character varying COLLATE pg_catalog."default" NOT NULL,
    description character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT role_pkey PRIMARY KEY (id)
);

CREATE TABLE public."sellerProfileInfo"
(
    id            integer                                        NOT NULL DEFAULT nextval('"sellerProfileInfo_id_seq"'::regclass),
    "userId"      integer                                        NOT NULL DEFAULT nextval('"sellerProfileInfo_userId_seq"'::regclass),
    "firstName"   character varying COLLATE pg_catalog."default" NOT NULL,
    "secondName"  character varying COLLATE pg_catalog."default" NOT NULL,
    "phoneNumber" character varying COLLATE pg_catalog."default" NOT NULL,
    address       character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "sellerProfileInfo_pkey" PRIMARY KEY (id),
    CONSTRAINT "user" FOREIGN KEY ("userId")
        REFERENCES public."user" (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);

CREATE TABLE public."user"
(
    id       integer                                        NOT NULL DEFAULT nextval('user_id_seq'::regclass),
    "roleId" integer                                        NOT NULL DEFAULT nextval('"user_roleId_seq"'::regclass),
    login    character varying COLLATE pg_catalog."default" NOT NULL,
    password character varying COLLATE pg_catalog."default" NOT NULL,
    mail     character varying COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT user_pkey PRIMARY KEY (id),
    CONSTRAINT role FOREIGN KEY ("roleId")
        REFERENCES public.role (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
);

