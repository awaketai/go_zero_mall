CREATE TABLE `user`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL DEFAULT '' COMMENT '用户名称',
    `gender` TINYINT(3) UNSIGNED NOT NULL DEFAULT '0' COMMENT '用户性别',
    `mobile` VARCHAR(255) NOT NULL DEFAULT '' COMMENT '用户电话',
    `password` VARCHAR(255) NOT NULL DEFAULT '' COMMENT '用户密码',
    `create_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
    `update_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP ,
    PRIMARY KEY(`id`),
    UNIQUE KEY `idx_mobile_unique`(`mobile`)
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
