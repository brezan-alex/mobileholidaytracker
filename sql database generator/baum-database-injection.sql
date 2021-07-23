-- Created by POPOVICI CATALIN, property of BAUM ENGINEERING SRL --

DROP DATABASE IF EXISTS `sql_baum_holiday`;
CREATE DATABASE `sql_baum_holiday`;
USE `sql_baum_holiday`;

SET NAMES utf8 ;
SET character_set_client = utf8mb4 ;


CREATE TABLE `employees` (
  `employee_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
   `last_name` varchar(50) NOT NULL,
   `birth_date` date NOT NULL,
   `employed_since` date,
   `role` varchar(50) NOT NULL,
   `email` varchar(50) NOT NULL,
   `email_alias` varchar(50) NOT NULL,
   `phone_number` varchar(10) NOT NULL,
   `reports_to` int(11),
  PRIMARY KEY (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
INSERT INTO `employees` VALUES ( 1, 'Stefancic', 'Roberto', '1900-01-01', NULL, 'System Software Engineer', 'robi@baum.ro', 'rs@baum.ro', '0755312724', NULL);
INSERT INTO `employees` VALUES ( 2, 'Popovici', 'Catalin', '1998-02-25', NULL, 'System Software Engineer', 'catalin@baum.ro', 'cp@baum.ro', '0743416888', 1);
INSERT INTO `employees` VALUES ( 3, 'Forgacs', 'Cristian', '1900-01-01', NULL, 'System Software Engineer', 'cristi@baum.ro', 'cf@baum.ro', '0721652940', 1);
INSERT INTO `employees` VALUES ( 4, 'Sala', 'Adi', '1900-01-01', NULL, 'System Software Engineer', 'adi@baum.ro', 'as@baum.ro', '0744456034', 1);
INSERT INTO `employees` VALUES ( 5, 'Trutiu', 'Florin', '1900-01-01', NULL, 'System Software Engineer', 'florin@baum.ro', 'ft@baum.ro', '0729099271', 1);
INSERT INTO `employees` VALUES ( 6, 'Kovacs', 'Roland', '1900-01-01', NULL, 'System Software Engineer', 'roli@baum.ro', 'rk@baum.ro', '0749578570', 1);
INSERT INTO `employees` VALUES ( 7, 'Hegyi', 'Vilmos', '1900-01-01', NULL, 'System Software Engineer', 'vili@baum.ro', 'hv@baum.ro', '0787365857', 1);
INSERT INTO `employees` VALUES ( 8, 'Gosa', 'Tudor', '1900-01-01', NULL, 'System Software Engineer', 'tudor@baum.ro', 'tg@baum.ro', '0728565630', 1);
INSERT INTO `employees` VALUES ( 9, 'Papp', 'Levente', '1900-01-01', NULL, 'System Software Engineer', 'levi@baum.ro', 'lp@baum.ro', '0758377908', 1);

CREATE TABLE `holiday_situation` (
  `employee_id` int(11) NOT NULL,
  `annual_total_holidays` int(4) NOT NULL DEFAULT '21',
  `annual_remaining_holidays` int(4) NOT NULL DEFAULT '21',
  PRIMARY KEY (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
INSERT INTO `holiday_situation` VALUES ( 1, 21, 21);
INSERT INTO `holiday_situation` VALUES ( 2, 21, 21);
INSERT INTO `holiday_situation` VALUES ( 3, 21, 21);
INSERT INTO `holiday_situation` VALUES ( 4, 21, 21);
INSERT INTO `holiday_situation` VALUES ( 5, 21, 21);
INSERT INTO `holiday_situation` VALUES ( 6, 21, 21);
INSERT INTO `holiday_situation` VALUES ( 7, 21, 21);
INSERT INTO `holiday_situation` VALUES ( 8, 21, 21);
INSERT INTO `holiday_situation` VALUES ( 9, 21, 21);

CREATE TABLE `holiday_archive` (
  `holiday_nr` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `nr_of_holidays` int(11) NOT NULL,
  `holiday_type_id` char(50),
  PRIMARY KEY (`holiday_nr`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `current_year_holiday_archive` (
  `holiday_id` int(11) NOT NULL AUTO_INCREMENT,
  `employee_id` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `nr_of_holidays` int(11) NOT NULL,
  `holiday_type_id` int(11) NOT NULL,
  PRIMARY KEY (`holiday_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4;

CREATE TABLE `holiday_type` (
  `holiday_type_id` int(11) NOT NULL,
  `holiday_type` char(90) NOT NULL,
  PRIMARY KEY (`holiday_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
INSERT INTO `holiday_type` VALUES ( 1, 'Rest leave');
INSERT INTO `holiday_type` VALUES ( 2, 'Vocational training leave');
INSERT INTO `holiday_type` VALUES ( 3, 'Unpaid leave');
INSERT INTO `holiday_type` VALUES ( 4, 'Medical leave');
INSERT INTO `holiday_type` VALUES ( 5, 'Maternity risk leave');
INSERT INTO `holiday_type` VALUES ( 6, 'Maternity leave');
INSERT INTO `holiday_type` VALUES ( 7, 'Paternity leave');
INSERT INTO `holiday_type` VALUES ( 8, 'Parental leave');
INSERT INTO `holiday_type` VALUES ( 9, 'Sick childcare leave');
INSERT INTO `holiday_type` VALUES ( 10, 'Leave for the care of children with disabilities');
INSERT INTO `holiday_type` VALUES ( 11, 'Medical leave for work accident or occupational disease');
INSERT INTO `holiday_type` VALUES ( 12, 'Leave for special events');
INSERT INTO `holiday_type` VALUES ( 13, 'Quarantine leave');
INSERT INTO `holiday_type` VALUES ( 14, 'Accommodation leave');

DROP DATABASE IF EXISTS `sql_baum_users`;
CREATE DATABASE `sql_baum_users`;
USE `sql_baum_users`;

SET NAMES utf8 ;
SET character_set_client = utf8mb4 ;

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `username` char(90) NOT NULL,
  `password` char(90) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
INSERT INTO `users` VALUES ( 1, 'rs@baum.ro', '123456');
INSERT INTO `users` VALUES ( 2, 'cp@baum.ro', '123456');
INSERT INTO `users` VALUES ( 3, 'cf@baum.ro', '123456');
INSERT INTO `users` VALUES ( 4, 'as@baum.ro', '123456');
INSERT INTO `users` VALUES ( 5, 'ft@baum.ro', '123456');
INSERT INTO `users` VALUES ( 6, 'rk@baum.ro', '123456');
INSERT INTO `users` VALUES ( 7, 'hv@baum.ro', '123456');
INSERT INTO `users` VALUES ( 8, 'tg@baum.ro', '123456');
INSERT INTO `users` VALUES ( 9, 'lp@baum.ro', '123456');