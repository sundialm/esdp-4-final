use `esdp_test`;

CREATE TABLE `tasks` (
                         `id` bigint auto_increment NOT NULL,
                         `name` varchar(128) NOT NULL,
                         `user` varchar(128) NOT NULL,
                         `milestone` boolean,
                         `brigade` varchar(128) ,
                         `delta` bigint ,
                         `equipment` varchar(128) ,
                         `number_of_people` integer,
                         `comment` varchar(128),
                         `start_date` date not null ,
                         `finish_date` date,
                         `status` integer not null ,
                         `area_id` bigint not null,
                         `work_id` bigint not null,
                         PRIMARY KEY (`id`),
                         UNIQUE KEY `id` (`id`),
                         foreign key (`area_id`) references `areas` (`id`),
                         foreign key (`work_id`) references `works` (`id`)
);

CREATE TABLE `task_materials` (
                         `materials_id` bigint NOT NULL,
                         `task_id` bigint NOT NULL,
                         foreign key (`materials_id`) references `materials` (`id`),
                         foreign key (`task_id`) references `tasks` (`id`)

);

CREATE TABLE `tasks_parents` (
                                  `parent_id` bigint NOT NULL,
                                  `children_id` bigint NOT NULL,
                                  foreign key (`children_id`) references `tasks` (`id`),
                                  foreign key (`parent_id`) references `tasks` (`id`)

);

Alter table `tasks` add column `default_comment` varchar(128) after `comment`;
ALTER table `tasks` add column `opened` boolean after `default_comment`;
