USE web_homework;
CREATE TABLE IF NOT EXISTS`admin` (
  `admin_id` BIGINT(18) NOT NULL AUTO_INCREMENT,
  `nickname` VARCHAR(15) NOT NULL DEFAULT '',
  `password` VARCHAR(100) NOT NULL DEFAULT '',
  PRIMARY KEY(`admin_id`)
);