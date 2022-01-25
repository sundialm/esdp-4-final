use `esdp_test`;



CREATE TABLE `roles` (
                         `id` bigint auto_increment NOT NULL,
                         `name` varchar(128) NOT NULL,
                         `description` varchar(128) NOT NULL,
                         PRIMARY KEY (`id`)
);

CREATE TABLE `users` (
                         `id` bigint auto_increment NOT NULL,
                         `email` varchar(128) NOT NULL,
                         `password` varchar(128) NOT NULL,
                         `first_name` varchar(128) NOT NULL,
                         `sur_name` varchar(128) NOT NULL,
                         `username` varchar(128) NOT NULL,
                         PRIMARY KEY (`id`),
                         UNIQUE INDEX `email_unique` (`email` ASC)
);


CREATE TABLE `session` (
                           `id` bigint auto_increment NOT NULL,
                           `access_token` varchar(128) NOT NULL,
                           `refresh_token` varchar(128) NOT NULL,
                           `expiration_time` date NOT NULL,
                           `expiration_date` date NOT NULL,
                           PRIMARY KEY (`id`),
                           `user_id` bigint NOT NULL,
                           CONSTRAINT `fk_user_session_id`
                               foreign key (`user_id`)
                                   references `users` (`id`)
);



insert into `users` (`email`, `first_name`,`password`,`sur_name`,`username`)
values ('test@gmail.com','test', '$2a$10$RIbodYtMRoikAkwJyvL.Ae7FQ9oGMOdjMooB.RlBhprM8hp9pmr.K','test','test');


