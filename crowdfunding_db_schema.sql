-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/3w2reE
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- drop tables if exist
-- create contacts table and set our primary key

-- drop table if exists contacts cascade;
-- drop table if exists category cascade;
-- drop table if exists subcategory cascade;
-- drop table if exists campaign cascade;

CREATE TABLE "contacts" (
    "contact_id" int   NOT NULL,
    "first_name" varchar(150)   NOT NULL,
    "last_name" varchar(150)   NOT NULL,
    "email" varchar(150)   NOT NULL,
    CONSTRAINT "pk_contacts" PRIMARY KEY (
        "contact_id"
     )
);

-- create category table and set our primary key
CREATE TABLE "category" (
    "category_id" varchar(150)   NOT NULL,
    "category" varchar(150)   NOT NULL,
    CONSTRAINT "pk_category" PRIMARY KEY (
        "category_id"
     )
);

-- create subcategory table and set our primary key
CREATE TABLE "subcategory" (
    "subcategory_id" varchar(150)   NOT NULL,
    "subcategory" varchar(150)   NOT NULL,
    CONSTRAINT "pk_subcategory" PRIMARY KEY (
        "subcategory_id"
     )
);

-- create campaign table and set our primary key and foreign keys
CREATE TABLE "campaign" (
    "cf_id" int   NOT NULL,
    "contact_id" int   NOT NULL,
    "company_name" varchar(300)   NOT NULL,
    "description" varchar(300)   NOT NULL,
    "goal" float   NOT NULL,
    "pledged" float   NOT NULL,
    "outcome" varchar(300)   NOT NULL,
    "backers_count" int   NOT NULL,
    "country" varchar(300)   NOT NULL,
    "currency" varchar(300)   NOT NULL,
    "launched_date" date   NOT NULL,
    "end_date" date   NOT NULL,
    "category_id" varchar(300)   NOT NULL,
    "subcategory_id" varchar(300)   NOT NULL,
    CONSTRAINT "pk_campaign" PRIMARY KEY (
        "cf_id"
     )
);

ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_contact_id" FOREIGN KEY("contact_id")
REFERENCES "contacts" ("contact_id");

ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_category_id" FOREIGN KEY("category_id")
REFERENCES "category" ("category_id");

ALTER TABLE "campaign" ADD CONSTRAINT "fk_campaign_subcategory_id" FOREIGN KEY("subcategory_id")
REFERENCES "subcategory" ("subcategory_id");
-- drop tables if exist



-- create contacts table and set our primary key

-- CREATE TABLE contacts (
--     contact_id int NOT NULL,
--     first_name varchar (150)  NOT NULL,
--     last_name varchar (150)  NOT NULL,
--     email varchar (150)  NOT NULL,
-- 	primary key (contact_id)
-- );

-- create category table and set our primary key

-- CREATE TABLE category (
--     category_id varchar (150)   NOT NULL,
--     category varchar (150)  NOT NULL,
-- 	primary key (category_id)
-- );

-- -- create subcategory table and set our primary key

-- CREATE TABLE subcategory (
--     subcategory_id varchar (150)  NOT NULL,
--     subcategory varchar (150)  NOT NULL,
-- 	primary key (subcategory_id)
-- );

-- -- create campaign table and set our primary key and foreign keys

-- CREATE TABLE campaign (
--     cf_id int NOT NULL,
--     contact_id int NOT NULL,
--     company_name varchar (300)  NOT NULL,
--     description varchar (300)  NOT NULL,
--     goal float NOT NULL,
--     pledged float  NOT NULL,
--     outcome varchar (300)  NOT NULL,
--     backers_count int   NOT NULL,
--     country varchar (300)  NOT NULL,
--     currency varchar (300)  NOT NULL,
--     launched_date date   NOT NULL,
--     end_date date   NOT NULL,
--     category_id varchar (300)  NOT NULL,
--     subcategory_id varchar (300)  NOT NULL,
-- 	primary key (cf_id),
-- 	foreign key (contact_id) references contacts(contact_id),
-- 	foreign key (category_id) references category(category_id),
-- 	foreign key (subcategory_id) references subcategory(subcategory_id)
-- );

-- Use COPY command to import data from CSV files

COPY contacts FROM '/resources/contacts.csv' DELIMITER ',' CSV HEADER;
COPY category FROM '/resources/category.csv' DELIMITER ',' CSV HEADER;
COPY subcategory FROM '/resources/subcategory.csv' DELIMITER ',' CSV HEADER;
COPY campaign FROM '/resources/campaign.csv' DELIMITER ',' CSV HEADER;

select * from contacts;
select * from category;
select * from subcategory;
select * from campaign;
