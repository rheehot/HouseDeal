CREATE TABLE `check_hit_search` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_no` int(11) DEFAULT NULL,
  `dong` varchar(30) DEFAULT NULL,
  `apt_name` varchar(50) DEFAULT NULL,
  `input_date` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_no_idx` (`user_no`),
  KEY `user_hit_no_idx` (`user_no`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;