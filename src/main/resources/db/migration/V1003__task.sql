CREATE TABLE "tasks" (
                         "id" serial UNIQUE,
                         "name" varchar(128) NOT NULL,
                         "user" varchar(128) NOT NULL,
                         "milestone" boolean,
                         "brigade" varchar(128) ,
                         "delta" serial ,
                         "equipment" varchar(128) ,
                         "number_of_people" serial,
                         "comment" varchar(128),
                         "default_comment" varchar(128),
                         "opened" boolean,
                         "start_date" date not null ,
                         "finish_date" date,
                         "status" serial not null ,
                         "area_id" serial,
                         "work_id" serial,
                         PRIMARY KEY ("id"),
                         foreign key ("area_id") references "areas" ("id"),
                         foreign key ("work_id") references "works" ("id")
);

CREATE TABLE "task_materials" (
                         "materials_id" serial,
                         "task_id" serial,
                         foreign key ("materials_id") references "materials" ("id"),
                         foreign key ("task_id") references "tasks" ("id")

);

CREATE TABLE "tasks_parents" (
                                  "parent_id" serial,
                                  "children_id" serial,
                                  foreign key ("children_id") references "tasks" ("id"),
                                  foreign key ("parent_id") references "tasks" ("id")

);