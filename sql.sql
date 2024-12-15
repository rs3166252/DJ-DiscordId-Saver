CREATE TABLE `player_identifiers` (
	`id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
	`license` VARCHAR(50) NOT NULL COLLATE 'utf8mb3_general_ci',
	`discord` VARCHAR(50) NOT NULL COLLATE 'utf8mb3_general_ci',
	PRIMARY KEY (`id`) USING BTREE,
	UNIQUE INDEX `license` (`license`) USING BTREE
)
COLLATE='utf8mb3_general_ci'
ENGINE=InnoDB
AUTO_INCREMENT=5
;
