
CREATE TABLE "areas" (
                         "id" serial ,
                         "name" varchar(128) NOT NULL,
                         "height" varchar(128) NOT NULL,
                         "parent_id" serial not null
                             references "areas" ("id"),
                         PRIMARY KEY ("id")

);

CREATE TABLE "works" (
                         "id" serial not null,
                         "name" varchar(128) NOT NULL,
                         "work_parent_id" serial not null
                             references "works" ("id"),
                         PRIMARY KEY ("id")

);

CREATE TABLE "materials" (
                         "id" serial not null,
                         "name" varchar(128) NOT NULL,
                         "measurement" varchar(128) NOT NULL,
                         "qty" serial NOT NULL ,
                         "parent_id" serial not null
                             references "materials" ("id"),
                         PRIMARY KEY ("id")
);