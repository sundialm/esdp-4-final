
CREATE TABLE `areas` (
                         `id` bigint auto_increment NOT NULL,
                         `name` varchar(128) NOT NULL,
                         `height` varchar(128) NOT NULL,
                             `parent_id` bigint(128)
                             references `areas` (`id`),
                         PRIMARY KEY (`id`)

);

CREATE TABLE `works` (
                         `id` bigint auto_increment NOT NULL,
                         `name` varchar(128) NOT NULL,
                         `work_parent_id` bigint NULL
                             references `works` (`id`),
                         PRIMARY KEY (`id`)

);

CREATE TABLE `materials` (
                         `id` bigint auto_increment NOT NULL,
                         `name` varchar(128) NOT NULL,
                         `measurement` varchar(128) NOT NULL,
                         `qty` bigint NOT NULL ,
                         `parent_id` bigint NULL
                             references `materials` (`id`),
                         PRIMARY KEY (`id`)
);