CREATE DATABASE `test` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
-- test.Authors definition

CREATE TABLE `Authors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- test.Categories definition

CREATE TABLE `Categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- test.Comics definition

CREATE TABLE `Comics` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `AuthorId` int DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `poster` varchar(255) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Comics_Authors_FK` (`AuthorId`),
  CONSTRAINT `Comics_Authors_FK` FOREIGN KEY (`AuthorId`) REFERENCES `Authors` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


-- test.Chapters definition

CREATE TABLE `Chapters` (
  `id` int NOT NULL AUTO_INCREMENT,
  `views` int DEFAULT NULL,
  `ComicId` int DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Chapters_Comics_FK` (`ComicId`),
  CONSTRAINT `Chapters_Comics_FK` FOREIGN KEY (`ComicId`) REFERENCES `Comics` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- test.Comic_Images definition

CREATE TABLE `Comic_Images` (
  `id` int NOT NULL AUTO_INCREMENT,
  `url` varchar(255) DEFAULT NULL,
  `ChapterId` int DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Comic_Images_Chapters_FK` (`ChapterId`),
  CONSTRAINT `Comic_Images_Chapters_FK` FOREIGN KEY (`ChapterId`) REFERENCES `Chapters` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1191 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- test.CategoryComics definition

CREATE TABLE `CategoryComics` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ComicId` int DEFAULT NULL,
  `CategoryId` int DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `CategoryComics_Comics_FK` (`ComicId`),
  KEY `CategoryComics_Categories_FK` (`CategoryId`),
  CONSTRAINT `CategoryComics_Categories_FK` FOREIGN KEY (`CategoryId`) REFERENCES `Categories` (`id`),
  CONSTRAINT `CategoryComics_Comics_FK` FOREIGN KEY (`ComicId`) REFERENCES `Comics` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- test.Users definition

CREATE TABLE `Users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` tinyint(1) DEFAULT '0',
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- test.Follows definition

CREATE TABLE `Follows` (
  `id` int NOT NULL AUTO_INCREMENT,
  `UserId` int DEFAULT NULL,
  `ComicId` int DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `Favorites_Comics_FK` (`ComicId`),
  KEY `Favorites_Users_FK` (`UserId`),
  CONSTRAINT `Favorites_Comics_FK` FOREIGN KEY (`ComicId`) REFERENCES `Comics` (`id`),
  CONSTRAINT `Favorites_Users_FK` FOREIGN KEY (`UserId`) REFERENCES `Users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

INSERT INTO test.Authors (name,createdAt,updatedAt) VALUES
	 ('unknown','2024-03-12 02:30:25','2024-03-12 02:30:25'),
	 ('kien','2024-03-12 02:30:27','2024-03-12 02:30:27'),
	 ('hoai','2024-03-12 02:30:31','2024-03-12 02:30:31'),
	 ('lan','2024-03-12 02:30:33','2024-03-12 02:30:33');
	
INSERT INTO test.Categories (name,createdAt,updatedAt) VALUES
	 ('hai huoc','2024-03-12 02:30:48','2024-03-12 02:30:48'),
	 ('kinh di','2024-03-12 02:30:53','2024-03-12 02:30:53'),
	 ('ngon tinh','2024-03-12 02:30:57','2024-03-12 02:30:57'),
	 ('vien tuong','2024-03-12 02:31:05','2024-03-12 02:31:05'),
	 ('truong hoc','2024-03-12 02:31:08','2024-03-12 02:31:08'),
	 ('xuyen khong','2024-03-12 02:31:14','2024-03-12 02:31:14');
	
INSERT INTO test.Comics (name,AuthorId,summary,poster,status,createdAt,updatedAt) VALUES
	 ('Mahou Tsukai no Yome',2,'Tồn tại cùng với chúng ta là thế giới của ma thuật, nơi mà phù thuỷ, thuật sĩ, người sói, ma quỷ... sinh sống','https://i7.bumcheo.info/manga/6/6436/mahou.thumb_500x.jpg',0,'2024-03-12 12:41:39','2024-03-15 15:16:26'),
	 ('Usogui ',0,'Anh chàng Kaji đang nợ đầm đìa và cố gắng gỡ gạc lại bằng cách chơi bạc thì vô tình gặp được Usogui','https://i7.bumcheo.info/manga/29/29410/81t7vzz5pll._ac_uf10001000_ql80_.thumb_500x.jpg',0,'2024-03-12 12:59:55','2024-03-12 12:59:55'),
	 ('Gannibal - Làng Ăn Thịt Người',3,'Một cảnh sát được giao nhiệm vụ tới một ngôi làng ở vùng quê hẻo lánh, sau đó anh ta dần nhận ra rằng mình đang sống trong một cộng đồng của những kẻ ăn thịt người','https://i7.bumcheo.info/manga/33/33474/image_2024-02-06_235559702.thumb_500x.png',0,'2024-03-13 06:45:15','2024-03-13 06:45:15'),
	 ('One-Punch Man',4,'Thế giới đầy quái vật bí ẩn xuất hiện và gây ra nhiều thảm họa. Nhân vật chính Saitama (Onepunch Man),','https://i7.bumcheo.info/manga/3/3415/fullsaitat-2.thumb_300x300.jpg',0,'2024-03-14 04:24:53','2024-03-14 04:24:53'),
	 ('CHOUSOU NO BABEL',2,'Đáng ra hôm đó là một ngày bình thường như bao ngày khác nhưng khi Sousuke (main) đến nhà người thầy để ngắm pháo hoa','https://i7.bumcheo.info/manga/15/15661/0001.thumb_500x.jpg',0,'2024-03-14 04:41:45','2024-03-14 04:41:45'),
	 ('Đế Chế Diệt Vong',2,'Con người từ xưa đã sống dưới sự bảo hộ của phù thủy, họ tôn kính, biết ơn và đồng thời cũng cảm thấy ... KHIẾP SỢ trước năng lực của các phù thủy','https://i7.bumcheo.info/manga/41/41423/de-che-diet-vong-5729.thumb_500x.jpg',0,'2024-03-14 04:45:40','2024-03-14 04:45:40'),
	 ('Hồi chuông dũng khí',0,'Sanda Souji là con trai của ông trùm Yakuza. Cũng bởi vì điều đó mà cậu bị xã hội ghét bỏ, xa lánh, dù vậy cậu vẫn luôn cố gắng để sống một cuộc sống bình thường','https://i7.bumcheo.info/manga/33/33368/bravebell.thumb_500x.jpg',0,'2024-03-14 15:49:35','2024-03-14 15:49:35'),
	 ('Ta muốn trở thành quý tộc ác nhân chứ có phải thánh nhân đâu!',4,'Một thanh niên simp lỏd sống một đời liêm khiết nhưng lại phải nhận cái kết đau lòng. Trong cơn hấp hối đầy hận thù, main nhà ta đã thề sẽ sống như một phản diện "đích thực".','https://i7.bumcheo.info/manga/33/33484/1.thumb_500x.jpg',0,'2024-03-14 15:53:20','2024-03-14 15:53:20');
	
INSERT INTO test.Users (email,password,`role`,createdAt,updatedAt) VALUES
	 ('minh@gmail.com','123',1,'2024-03-19 12:17:38','2024-03-19 12:17:38'),
	 ('tranngocminh474@gmail.com','123',0,'2024-03-19 12:18:28','2024-03-20 05:32:56');
	 
INSERT INTO test.Follows (UserId,ComicId,createdAt,updatedAt) VALUES
	 (2,6,'2024-03-21 05:35:58','2024-03-21 05:35:58');
	 
INSERT INTO test.CategoryComics (ComicId,CategoryId,createdAt,updatedAt) VALUES
	 (12,1,'2024-03-14 15:53:20','2024-03-14 15:53:20'),
	 (12,2,'2024-03-14 15:53:20','2024-03-14 15:53:20'),
	 (12,3,'2024-03-14 15:53:20','2024-03-14 15:53:20'),
	 (6,2,'2024-03-14 15:53:20','2024-03-14 15:53:20'),
	 (7,4,'2024-03-14 15:53:20','2024-03-14 15:53:20'),
	 (8,1,'2024-03-14 15:53:20','2024-03-14 15:53:20'),
	 (9,3,'2024-03-14 15:53:20','2024-03-14 15:53:20'),
	 (10,2,'2024-03-14 15:53:20','2024-03-14 15:53:20'),
	 (11,4,'2024-03-14 15:53:20','2024-03-14 15:53:20'),
	 (12,4,'2024-03-14 15:53:20','2024-03-14 15:53:20');
INSERT INTO test.CategoryComics (ComicId,CategoryId,createdAt,updatedAt) VALUES
	 (4,1,'2024-03-15 15:16:26','2024-03-15 15:16:26'),
	 (4,2,'2024-03-15 15:16:26','2024-03-15 15:16:26'),
	 (4,5,'2024-03-15 15:16:26','2024-03-15 15:16:26');
	
INSERT INTO test.Chapters (views,ComicId,createdAt,updatedAt,name) VALUES
	 (0,NULL,'2024-03-13 06:10:51','2024-03-13 06:10:51','chap 1'),
	 (4,6,'2024-03-13 06:13:57','2024-03-22 05:41:45','chap 1'),
	 (1,7,'2024-03-13 06:45:28','2024-03-23 05:27:56','chap 1'),
	 (2,7,'2024-03-13 07:00:07','2024-03-23 05:28:07','chap 2'),
	 (1,7,'2024-03-13 07:40:16','2024-03-22 04:55:11','chap 3'),
	 (0,8,'2024-03-14 04:25:34','2024-03-14 04:25:34','chap 1'),
	 (0,8,'2024-03-14 04:25:54','2024-03-14 04:25:54','chap 2'),
	 (0,8,'2024-03-14 04:26:31','2024-03-14 04:26:31','chap 3'),
	 (0,8,'2024-03-14 04:27:02','2024-03-14 04:27:02','chap 4'),
	 (0,8,'2024-03-14 04:27:37','2024-03-14 04:27:37','chap 5');
INSERT INTO test.Chapters (views,ComicId,createdAt,updatedAt,name) VALUES
	 (0,4,'2024-03-14 04:29:13','2024-03-14 04:29:13','chap 1'),
	 (2,4,'2024-03-14 04:29:31','2024-03-22 04:35:07','chap 2'),
	 (1,4,'2024-03-14 04:29:35','2024-03-22 04:34:59','chap 3'),
	 (1,4,'2024-03-14 04:29:40','2024-03-22 04:00:21','chap 4'),
	 (2,4,'2024-03-14 04:29:47','2024-03-30 02:15:18','chap 5'),
	 (3,6,'2024-03-14 04:32:16','2024-03-22 05:41:47','chap 2'),
	 (8,6,'2024-03-14 04:32:21','2024-03-22 05:42:08','chap 3'),
	 (16,6,'2024-03-14 04:32:26','2024-03-22 05:42:08','chap 4'),
	 (8,6,'2024-03-14 04:32:31','2024-03-22 05:42:07','chap 5'),
	 (2,7,'2024-03-14 04:37:59','2024-03-30 02:16:07','chap 4');
INSERT INTO test.Chapters (views,ComicId,createdAt,updatedAt,name) VALUES
	 (24,7,'2024-03-14 04:38:06','2024-03-23 07:58:40','chap 5'),
	 (0,9,'2024-03-14 04:42:07','2024-03-14 04:42:07','chap 1'),
	 (0,9,'2024-03-14 04:42:13','2024-03-14 04:42:13','chap 2'),
	 (1,9,'2024-03-14 04:42:20','2024-03-23 07:58:54','chap 3'),
	 (0,10,'2024-03-14 04:45:51','2024-03-14 04:45:51','chap 1'),
	 (0,10,'2024-03-14 04:45:58','2024-03-14 04:45:58','chap 2'),
	 (0,10,'2024-03-14 04:46:06','2024-03-14 04:46:06','chap 3'),
	 (0,10,'2024-03-14 04:46:11','2024-03-14 04:46:11','chap 4'),
	 (1,10,'2024-03-14 04:46:18','2024-03-22 04:59:23','chap 5');
	
INSERT INTO test.Comic_Images (url,ChapterId,createdAt,updatedAt) VALUES
	 ('https://i8.bumcheo.info/849/849612/2.jpg?v=1707238879
',9,'2024-03-13 07:02:18','2024-03-13 07:02:18'),
	 ('https://i8.bumcheo.info/849/849612/3.jpg?v=1707238879
',9,'2024-03-13 07:02:18','2024-03-13 07:02:18'),
	 ('https://i8.bumcheo.info/849/849612/4.jpg?v=1707238879
',9,'2024-03-13 07:02:18','2024-03-13 07:02:18'),
	 ('https://i8.bumcheo.info/849/849612/5.jpg?v=1707238879
',9,'2024-03-13 07:02:18','2024-03-13 07:02:18'),
	 ('https://i8.bumcheo.info/849/849612/6.jpg?v=1707238880
',9,'2024-03-13 07:02:18','2024-03-13 07:02:18'),
	 ('https://i8.bumcheo.info/849/849612/7.jpg?v=1707238880
',9,'2024-03-13 07:02:18','2024-03-13 07:02:18'),
	 ('https://i8.bumcheo.info/849/849612/8.jpg?v=1707238880
',9,'2024-03-13 07:02:18','2024-03-13 07:02:18'),
	 ('https://i8.bumcheo.info/849/849612/9.jpg?v=1707238880
',9,'2024-03-13 07:02:18','2024-03-13 07:02:18'),
	 ('https://i8.bumcheo.info/849/849612/10.jpg?v=1707238880
',9,'2024-03-13 07:02:18','2024-03-13 07:02:18'),
	 ('https://i8.bumcheo.info/849/849612/11.jpg?v=1707238880
',9,'2024-03-13 07:02:18','2024-03-13 07:02:18');
INSERT INTO test.Comic_Images (url,ChapterId,createdAt,updatedAt) VALUES
	 ('https://i8.bumcheo.info/849/849612/12.jpg?v=1707238880
',9,'2024-03-13 07:02:18','2024-03-13 07:02:18'),
	 ('https://i8.bumcheo.info/849/849612/13.jpg?v=1707238880
',9,'2024-03-13 07:02:18','2024-03-13 07:02:18'),
	 ('https://i8.bumcheo.info/849/849612/14.jpg?v=1707238880
',9,'2024-03-13 07:02:18','2024-03-13 07:02:18'),
	 ('https://i8.bumcheo.info/849/849612/15.jpg?v=1707238880
',9,'2024-03-13 07:02:18','2024-03-13 07:02:18'),
	 ('https://i8.bumcheo.info/849/849612/16.jpg?v=1707238880
',9,'2024-03-13 07:02:18','2024-03-13 07:02:18'),
	 ('https://i8.bumcheo.info/849/849612/17.jpg?v=1707238881
',9,'2024-03-13 07:02:18','2024-03-13 07:02:18'),
	 ('https://i8.bumcheo.info/849/849612/18.jpg?v=1707238881
',9,'2024-03-13 07:02:18','2024-03-13 07:02:18'),
	 ('https://i8.bumcheo.info/849/849612/19.jpg?v=1707238881
',9,'2024-03-13 07:02:18','2024-03-13 07:02:18'),
	 ('https://i8.bumcheo.info/849/849612/20.jpg?v=1707238881
',9,'2024-03-13 07:02:18','2024-03-13 07:02:18'),
	 ('https://i8.bumcheo.info/849/849612/21.jpg?v=1707238881
',9,'2024-03-13 07:02:18','2024-03-13 07:02:18');
INSERT INTO test.Comic_Images (url,ChapterId,createdAt,updatedAt) VALUES
	 ('https://i8.bumcheo.info/849/849612/22.jpg?v=1707238881
',9,'2024-03-13 07:02:18','2024-03-13 07:02:18'),
	 ('https://i8.bumcheo.info/849/849612/23.jpg?v=1707238881
',9,'2024-03-13 07:02:18','2024-03-13 07:02:18'),
	 ('https://i8.bumcheo.info/849/849612/024-05b300c1.jpg?v=1707238881
',9,'2024-03-13 07:02:18','2024-03-13 07:02:18'),
	 ('https://i8.bumcheo.info/849/849612/025-73c7c761.jpg?v=1707238881
',9,'2024-03-13 07:02:18','2024-03-13 07:02:18'),
	 ('https://i8.bumcheo.info/849/849612/026-7a151291.jpg?v=1707238881
',9,'2024-03-13 07:02:18','2024-03-13 07:02:18'),
	 ('https://i8.bumcheo.info/849/849612/027-1650df91.jpg?v=1707238881
',9,'2024-03-13 07:02:18','2024-03-13 07:02:18'),
	 ('https://i8.bumcheo.info/849/849612/028-4ab79d01.jpg?v=1707238881
',9,'2024-03-13 07:02:18','2024-03-13 07:02:18'),
	 ('https://i8.bumcheo.info/849/849612/029-405d8481.jpg?v=1707238881
',9,'2024-03-13 07:02:18','2024-03-13 07:02:18'),
	 ('https://i8.bumcheo.info/849/849612/030-2bc17381.jpg?v=1707238881
',9,'2024-03-13 07:02:18','2024-03-13 07:02:18'),
	 ('https://i8.bumcheo.info/849/849612/031-b1b4dd31.jpg?v=1707238881
',9,'2024-03-13 07:02:18','2024-03-13 07:02:18');
INSERT INTO test.Comic_Images (url,ChapterId,createdAt,updatedAt) VALUES
	 ('https://i8.bumcheo.info/849/849612/032-d82877e1.jpg?v=1707238882
',9,'2024-03-13 07:02:18','2024-03-13 07:02:18'),
	 ('https://i8.bumcheo.info/849/849612/033-b3b31e51.jpg?v=1707238882
',9,'2024-03-13 07:02:18','2024-03-13 07:02:18'),
	 ('https://i8.bumcheo.info/849/849612/034-57f160e1.jpg?v=1707238882
',9,'2024-03-13 07:02:18','2024-03-13 07:02:18'),
	 ('https://i8.bumcheo.info/849/849612/035-2879a141.jpg?v=1707238882
',9,'2024-03-13 07:02:18','2024-03-13 07:02:18'),
	 ('https://i8.bumcheo.info/849/849612/036-a7fe36a1.jpg?v=1707238882
',9,'2024-03-13 07:02:18','2024-03-13 07:02:18'),
	 ('https://i8.bumcheo.info/849/849612/037-8a0a9281.jpg?v=1707238882
',9,'2024-03-13 07:02:18','2024-03-13 07:02:18'),
	 ('https://i8.bumcheo.info/849/849612/038-179be961.jpg?v=1707238882
',9,'2024-03-13 07:02:18','2024-03-13 07:02:18'),
	 ('https://i8.bumcheo.info/849/849612/039-741c3ff1.jpg?v=1707238882
',9,'2024-03-13 07:02:18','2024-03-13 07:02:18'),
	 ('https://i8.bumcheo.info/849/849612/040-76836f61.jpg?v=1707238882
',9,'2024-03-13 07:02:18','2024-03-13 07:02:18'),
	 ('https://i7.bumcheo.info/manga/13/13223/1.png
',9,'2024-03-13 07:02:18','2024-03-13 07:02:18');
INSERT INTO test.Comic_Images (url,ChapterId,createdAt,updatedAt) VALUES
	 ('https://i8.bumcheo.info/849/849613/002-f281794.jpg?v=1707238898
',11,'2024-03-13 07:02:44','2024-03-13 07:02:44'),
	 ('https://i8.bumcheo.info/849/849613/001-a308dd3.jpg?v=1707238898
',11,'2024-03-13 07:02:44','2024-03-13 07:02:44'),
	 ('https://i8.bumcheo.info/849/849613/003-63b2b1b.jpg?v=1707238898
',11,'2024-03-13 07:02:44','2024-03-13 07:02:44'),
	 ('https://i8.bumcheo.info/849/849613/004-0d88f89.jpg?v=1707238897
',11,'2024-03-13 07:02:44','2024-03-13 07:02:44'),
	 ('https://i8.bumcheo.info/849/849613/005-99d0426.jpg?v=1707238898
',11,'2024-03-13 07:02:44','2024-03-13 07:02:44'),
	 ('https://i8.bumcheo.info/849/849613/006-fd765ec.jpg?v=1707238897
',11,'2024-03-13 07:02:44','2024-03-13 07:02:44'),
	 ('https://i8.bumcheo.info/849/849613/007-db93d19.jpg?v=1707238898
',11,'2024-03-13 07:02:44','2024-03-13 07:02:44'),
	 ('https://i8.bumcheo.info/849/849613/008-9aa2ed0.jpg?v=1707238898
',11,'2024-03-13 07:02:44','2024-03-13 07:02:44'),
	 ('https://i8.bumcheo.info/849/849613/009-6110056.jpg?v=1707238898
',11,'2024-03-13 07:02:44','2024-03-13 07:02:44'),
	 ('https://i8.bumcheo.info/849/849613/010-6034cf6.jpg?v=1707238898
',11,'2024-03-13 07:02:44','2024-03-13 07:02:44');
INSERT INTO test.Comic_Images (url,ChapterId,createdAt,updatedAt) VALUES
	 ('https://i8.bumcheo.info/849/849613/011-c7ce599.jpg?v=1707238898
',11,'2024-03-13 07:02:44','2024-03-13 07:02:44'),
	 ('https://i8.bumcheo.info/849/849613/012-106cbb0.jpg?v=1707238898
',11,'2024-03-13 07:02:44','2024-03-13 07:02:44'),
	 ('https://i8.bumcheo.info/849/849613/013-f68f8aa.jpg?v=1707238898
',11,'2024-03-13 07:02:44','2024-03-13 07:02:44'),
	 ('https://i8.bumcheo.info/849/849613/014-772087f.jpg?v=1707238898
',11,'2024-03-13 07:02:44','2024-03-13 07:02:44'),
	 ('https://i8.bumcheo.info/849/849613/015-a9ed2fb.jpg?v=1707238898
',11,'2024-03-13 07:02:44','2024-03-13 07:02:44'),
	 ('https://i8.bumcheo.info/849/849613/016-208991e.jpg?v=1707238898
',11,'2024-03-13 07:02:44','2024-03-13 07:02:44'),
	 ('https://i8.bumcheo.info/849/849613/017-b56d6d1.jpg?v=1707238899
',11,'2024-03-13 07:02:44','2024-03-13 07:02:44'),
	 ('https://i8.bumcheo.info/849/849613/018-4fc5da6.jpg?v=1707238899
',11,'2024-03-13 07:02:44','2024-03-13 07:02:44'),
	 ('https://i8.bumcheo.info/849/849613/019-7800551.jpg?v=1707238899
',11,'2024-03-13 07:02:44','2024-03-13 07:02:44'),
	 ('https://i8.bumcheo.info/849/849613/020-603bd76.jpg?v=1707238899
',11,'2024-03-13 07:02:44','2024-03-13 07:02:44');
INSERT INTO test.Comic_Images (url,ChapterId,createdAt,updatedAt) VALUES
	 ('https://i8.bumcheo.info/849/849613/021-60a0df7.jpg?v=1707238899
',11,'2024-03-13 07:02:44','2024-03-13 07:02:44'),
	 ('https://i8.bumcheo.info/849/849613/022-d46684f.jpg?v=1707238899
',11,'2024-03-13 07:02:44','2024-03-13 07:02:44'),
	 ('https://i8.bumcheo.info/849/849613/023-ae58ec3.jpg?v=1707238899
',11,'2024-03-13 07:02:44','2024-03-13 07:02:44'),
	 ('https://i8.bumcheo.info/849/849613/024-270422e.jpg?v=1707238899
',11,'2024-03-13 07:02:44','2024-03-13 07:02:44'),
	 ('https://i8.bumcheo.info/849/849613/025-0a96e1c.jpg?v=1707238899
',11,'2024-03-13 07:02:44','2024-03-13 07:02:44'),
	 ('https://i8.bumcheo.info/849/849613/026-d90d303.jpg?v=1707238899
',11,'2024-03-13 07:02:44','2024-03-13 07:02:44'),
	 ('https://i8.bumcheo.info/849/849613/500.jpg?v=1707238899
',11,'2024-03-13 07:02:44','2024-03-13 07:02:44'),
	 ('https://i7.bumcheo.info/manga/13/13223/1.png
',11,'2024-03-13 07:02:44','2024-03-13 07:02:44'),
	 ('https://blogtruyen.vn/content/images/chapter-error.png
',11,'2024-03-13 07:02:44','2024-03-13 07:02:44'),
	 ('https://i8.bumcheo.info/849/849614/002-63b1fdb.jpg?v=1707238912
',13,'2024-03-13 07:40:44','2024-03-13 07:40:44');
INSERT INTO test.Comic_Images (url,ChapterId,createdAt,updatedAt) VALUES
	 ('https://i8.bumcheo.info/849/849614/003-7b46a7b.jpg?v=1707238912
',13,'2024-03-13 07:40:44','2024-03-13 07:40:44'),
	 ('https://i8.bumcheo.info/849/849614/004-82b2ab3.jpg?v=1707238912
',13,'2024-03-13 07:40:44','2024-03-13 07:40:44'),
	 ('https://i8.bumcheo.info/849/849614/005-2d18fbe.jpg?v=1707238912
',13,'2024-03-13 07:40:44','2024-03-13 07:40:44'),
	 ('https://i8.bumcheo.info/849/849614/006-f6ba4fa.jpg?v=1707238912
',13,'2024-03-13 07:40:44','2024-03-13 07:40:44'),
	 ('https://i8.bumcheo.info/849/849614/007-b5f48fc.jpg?v=1707238912
',13,'2024-03-13 07:40:44','2024-03-13 07:40:44'),
	 ('https://i8.bumcheo.info/849/849614/008-c368117.jpg?v=1707238912
',13,'2024-03-13 07:40:44','2024-03-13 07:40:44'),
	 ('https://i8.bumcheo.info/849/849614/009-ec1ffc7.jpg?v=1707238912
',13,'2024-03-13 07:40:44','2024-03-13 07:40:44'),
	 ('https://i8.bumcheo.info/849/849614/010-db047a2.jpg?v=1707238912
',13,'2024-03-13 07:40:44','2024-03-13 07:40:44'),
	 ('https://i8.bumcheo.info/849/849614/011-65bad0f.jpg?v=1707238912
',13,'2024-03-13 07:40:44','2024-03-13 07:40:44'),
	 ('https://i8.bumcheo.info/849/849614/012-689483a.jpg?v=1707238912
',13,'2024-03-13 07:40:44','2024-03-13 07:40:44');
INSERT INTO test.Comic_Images (url,ChapterId,createdAt,updatedAt) VALUES
	 ('https://i8.bumcheo.info/849/849614/013-8e59e41.jpg?v=1707238912
',13,'2024-03-13 07:40:44','2024-03-13 07:40:44'),
	 ('https://i8.bumcheo.info/849/849614/014-1ed1086.jpg?v=1707238913
',13,'2024-03-13 07:40:44','2024-03-13 07:40:44'),
	 ('https://i8.bumcheo.info/849/849614/015-4c856fd.jpg?v=1707238913
',13,'2024-03-13 07:40:44','2024-03-13 07:40:44'),
	 ('https://i8.bumcheo.info/849/849614/016-04dd91a.jpg?v=1707238913
',13,'2024-03-13 07:40:44','2024-03-13 07:40:44'),
	 ('https://i8.bumcheo.info/849/849614/017-f64da1d.jpg?v=1707238913
',13,'2024-03-13 07:40:44','2024-03-13 07:40:44'),
	 ('https://i8.bumcheo.info/849/849614/018-343c435.jpg?v=1707238913
',13,'2024-03-13 07:40:44','2024-03-13 07:40:44'),
	 ('https://i8.bumcheo.info/849/849614/019-635df16.jpg?v=1707238913
',13,'2024-03-13 07:40:44','2024-03-13 07:40:44'),
	 ('https://i8.bumcheo.info/849/849614/020-bd42c06.jpg?v=1707238913
',13,'2024-03-13 07:40:44','2024-03-13 07:40:44'),
	 ('https://i8.bumcheo.info/849/849614/021-09e7fda.jpg?v=1707238913
',13,'2024-03-13 07:40:44','2024-03-13 07:40:44'),
	 ('https://i7.bumcheo.info/manga/13/13223/1.png
',13,'2024-03-13 07:40:44','2024-03-13 07:40:44');
INSERT INTO test.Comic_Images (url,ChapterId,createdAt,updatedAt) VALUES
	 ('https://blogtruyen.vn/content/images/chapter-error.png
',13,'2024-03-13 07:40:44','2024-03-13 07:40:44'),
	 ('https://blogtruyen.vn/content/images/chapter-fix.png',13,'2024-03-13 07:40:44','2024-03-13 07:40:44'),
	 ('https://i7.bumcheo.info/manga/13/13223/0.jpg
',14,'2024-03-14 04:25:38','2024-03-14 04:25:38'),
	 ('https://i.bumcheo1.info/66/66124/chapter-252520001-000.jpg
',14,'2024-03-14 04:25:38','2024-03-14 04:25:38'),
	 ('https://i.bumcheo1.info/66/66124/chapter-252520001-001.jpg
',14,'2024-03-14 04:25:38','2024-03-14 04:25:38'),
	 ('https://i.bumcheo1.info/66/66124/chapter-252520001-002.jpg
',14,'2024-03-14 04:25:38','2024-03-14 04:25:38'),
	 ('https://i.bumcheo1.info/66/66124/chapter-252520001-003.jpg
',14,'2024-03-14 04:25:38','2024-03-14 04:25:38'),
	 ('https://i.bumcheo1.info/66/66124/chapter-252520001-004.jpg
',14,'2024-03-14 04:25:38','2024-03-14 04:25:38'),
	 ('https://i.bumcheo1.info/66/66124/chapter-252520001-005.jpg
',14,'2024-03-14 04:25:38','2024-03-14 04:25:38'),
	 ('https://i.bumcheo1.info/66/66124/chapter-252520001-006.jpg
',14,'2024-03-14 04:25:38','2024-03-14 04:25:38');
INSERT INTO test.Comic_Images (url,ChapterId,createdAt,updatedAt) VALUES
	 ('https://i.bumcheo1.info/66/66124/chapter-252520001-007.jpg
',14,'2024-03-14 04:25:38','2024-03-14 04:25:38'),
	 ('https://i.bumcheo1.info/66/66124/chapter-252520001-008.jpg
',14,'2024-03-14 04:25:38','2024-03-14 04:25:38'),
	 ('https://i.bumcheo1.info/66/66124/chapter-252520001-009.jpg
',14,'2024-03-14 04:25:38','2024-03-14 04:25:38'),
	 ('https://i.bumcheo1.info/66/66124/chapter-252520001-010.jpg
',14,'2024-03-14 04:25:38','2024-03-14 04:25:38'),
	 ('https://i.bumcheo1.info/66/66124/chapter-252520001-011.jpg
',14,'2024-03-14 04:25:38','2024-03-14 04:25:38'),
	 ('https://i.bumcheo1.info/66/66124/chapter-252520001-012.jpg
',14,'2024-03-14 04:25:38','2024-03-14 04:25:38'),
	 ('https://i.bumcheo1.info/66/66124/chapter-252520001-013.jpg
',14,'2024-03-14 04:25:38','2024-03-14 04:25:38'),
	 ('https://i.bumcheo1.info/66/66124/chapter-252520001-014.jpg
',14,'2024-03-14 04:25:38','2024-03-14 04:25:38'),
	 ('https://i.bumcheo1.info/66/66124/chapter-252520001-015.jpg
',14,'2024-03-14 04:25:38','2024-03-14 04:25:38'),
	 ('https://i.bumcheo1.info/66/66124/chapter-252520001-016.jpg
',14,'2024-03-14 04:25:38','2024-03-14 04:25:38');
INSERT INTO test.Comic_Images (url,ChapterId,createdAt,updatedAt) VALUES
	 ('https://i.bumcheo1.info/66/66124/chapter-252520001-017.jpg
',14,'2024-03-14 04:25:38','2024-03-14 04:25:38'),
	 ('https://i.bumcheo1.info/66/66124/chapter-252520001-018.jpg
',14,'2024-03-14 04:25:38','2024-03-14 04:25:38'),
	 ('https://i.bumcheo1.info/66/66124/chapter-252520001-019.jpg
',14,'2024-03-14 04:25:38','2024-03-14 04:25:38'),
	 ('https://i.bumcheo1.info/66/66124/chapter-252520001-020.jpg
',14,'2024-03-14 04:25:38','2024-03-14 04:25:38'),
	 ('https://i7.bumcheo.info/manga/13/13223/1.png
',14,'2024-03-14 04:25:38','2024-03-14 04:25:38'),
	 ('https://blogtruyen.vn/content/images/chapter-error.png
',14,'2024-03-14 04:25:38','2024-03-14 04:25:38'),
	 ('https://blogtruyen.vn/content/images/chapter-fix.png
',14,'2024-03-14 04:25:38','2024-03-14 04:25:38'),
	 ('https://i7.bumcheo.info/avatar/noavatar/noavatar.thumb_64x64.png
',14,'2024-03-14 04:25:38','2024-03-14 04:25:38'),
	 ('https://1.bp.blogspot.com/-1rtVBecx6MI/TxUwByvlxtI/AAAAAAAAFPU/zO0ZISyyXgM/Upanhso.tk-1.gif
',14,'2024-03-14 04:25:38','2024-03-14 04:25:38'),
	 ('https://i7.bumcheo.info/avatar/noavatar/noavatar.thumb_64x64.png
',14,'2024-03-14 04:25:38','2024-03-14 04:25:38');
INSERT INTO test.Comic_Images (url,ChapterId,createdAt,updatedAt) VALUES
	 ('https://1.bp.blogspot.com/-DFdQ1q2SaUs/WtuC0Utob9I/AAAAAAABiEc/rRQ9PtVAFVwNPT5zcebGqOzsr_jXV8hwACKgBGAs/h120/14-yaoming.gif',14,'2024-03-14 04:25:38','2024-03-14 04:25:38'),
	 ('https://i7.bumcheo.info/manga/13/13223/0.jpg
',15,'2024-03-14 04:26:16','2024-03-14 04:26:16'),
	 ('https://i.bumcheo1.info/66/66337/chapter-252520002-002.jpg
',15,'2024-03-14 04:26:16','2024-03-14 04:26:16'),
	 ('https://i.bumcheo1.info/66/66337/chapter-252520002-000.jpg
',15,'2024-03-14 04:26:16','2024-03-14 04:26:16'),
	 ('https://i.bumcheo1.info/66/66337/chapter-252520002-001.jpg
',15,'2024-03-14 04:26:16','2024-03-14 04:26:16'),
	 ('https://i.bumcheo1.info/66/66337/chapter-252520002-003.jpg
',15,'2024-03-14 04:26:16','2024-03-14 04:26:16'),
	 ('https://i.bumcheo1.info/66/66337/chapter-252520002-004.jpg
',15,'2024-03-14 04:26:16','2024-03-14 04:26:16'),
	 ('https://i.bumcheo1.info/66/66337/chapter-252520002-005.jpg
',15,'2024-03-14 04:26:16','2024-03-14 04:26:16'),
	 ('https://i.bumcheo1.info/66/66337/chapter-252520002-006.jpg
',15,'2024-03-14 04:26:16','2024-03-14 04:26:16'),
	 ('https://i.bumcheo1.info/66/66337/chapter-252520002-007.jpg
',15,'2024-03-14 04:26:16','2024-03-14 04:26:16');
INSERT INTO test.Comic_Images (url,ChapterId,createdAt,updatedAt) VALUES
	 ('https://i.bumcheo1.info/66/66337/chapter-252520002-009.jpg
',15,'2024-03-14 04:26:16','2024-03-14 04:26:16'),
	 ('https://i.bumcheo1.info/66/66337/chapter-252520002-010.jpg
',15,'2024-03-14 04:26:16','2024-03-14 04:26:16'),
	 ('https://i.bumcheo1.info/66/66337/chapter-252520002-011.jpg
',15,'2024-03-14 04:26:16','2024-03-14 04:26:16'),
	 ('https://i.bumcheo1.info/66/66337/chapter-252520002-012.jpg
',15,'2024-03-14 04:26:16','2024-03-14 04:26:16'),
	 ('https://i.bumcheo1.info/66/66337/chapter-252520002-013.jpg
',15,'2024-03-14 04:26:16','2024-03-14 04:26:16'),
	 ('https://i.bumcheo1.info/66/66337/chapter-252520002-014.jpg
',15,'2024-03-14 04:26:16','2024-03-14 04:26:16'),
	 ('https://i.bumcheo1.info/66/66337/chapter-252520002-015.jpg
',15,'2024-03-14 04:26:16','2024-03-14 04:26:16'),
	 ('https://i.bumcheo1.info/66/66337/chapter-252520002-016.jpg
',15,'2024-03-14 04:26:16','2024-03-14 04:26:16'),
	 ('https://i7.bumcheo.info/manga/13/13223/1.png
',15,'2024-03-14 04:26:16','2024-03-14 04:26:16'),
	 ('https://blogtruyen.vn/content/images/chapter-error.png
',15,'2024-03-14 04:26:16','2024-03-14 04:26:16');
INSERT INTO test.Comic_Images (url,ChapterId,createdAt,updatedAt) VALUES
	 ('https://blogtruyen.vn/content/images/chapter-fix.png',15,'2024-03-14 04:26:16','2024-03-14 04:26:16'),
	 ('https://i.bumcheo1.info/66/66402/chapter-252520003-001.jpg
',16,'2024-03-14 04:26:46','2024-03-14 04:26:46'),
	 ('https://i7.bumcheo.info/manga/13/13223/0.jpg
',16,'2024-03-14 04:26:46','2024-03-14 04:26:46'),
	 ('https://i.bumcheo1.info/66/66402/chapter-252520003-000.jpg
',16,'2024-03-14 04:26:46','2024-03-14 04:26:46'),
	 ('https://i.bumcheo1.info/66/66402/chapter-252520003-002.jpg
',16,'2024-03-14 04:26:46','2024-03-14 04:26:46'),
	 ('https://i.bumcheo1.info/66/66402/chapter-252520003-003.jpg
',16,'2024-03-14 04:26:46','2024-03-14 04:26:46'),
	 ('https://i.bumcheo1.info/66/66402/chapter-252520003-004.jpg
',16,'2024-03-14 04:26:46','2024-03-14 04:26:46'),
	 ('https://i.bumcheo1.info/66/66402/chapter-252520003-005.jpg
',16,'2024-03-14 04:26:46','2024-03-14 04:26:46'),
	 ('https://i.bumcheo1.info/66/66402/chapter-252520003-006.jpg
',16,'2024-03-14 04:26:46','2024-03-14 04:26:46'),
	 ('https://i.bumcheo1.info/66/66402/chapter-252520003-007.jpg
',16,'2024-03-14 04:26:46','2024-03-14 04:26:46');
INSERT INTO test.Comic_Images (url,ChapterId,createdAt,updatedAt) VALUES
	 ('https://i.bumcheo1.info/66/66402/chapter-252520003-008.jpg
',16,'2024-03-14 04:26:46','2024-03-14 04:26:46'),
	 ('https://i.bumcheo1.info/66/66402/chapter-252520003-009.jpg
',16,'2024-03-14 04:26:46','2024-03-14 04:26:46'),
	 ('https://i.bumcheo1.info/66/66402/chapter-252520003-010.jpg
',16,'2024-03-14 04:26:46','2024-03-14 04:26:46'),
	 ('https://i.bumcheo1.info/66/66402/chapter-252520003-011.jpg
',16,'2024-03-14 04:26:46','2024-03-14 04:26:46'),
	 ('https://i.bumcheo1.info/66/66402/chapter-252520003-012.jpg
',16,'2024-03-14 04:26:46','2024-03-14 04:26:46'),
	 ('https://i.bumcheo1.info/66/66402/chapter-252520003-013.jpg
',16,'2024-03-14 04:26:46','2024-03-14 04:26:46'),
	 ('https://i.bumcheo1.info/66/66402/chapter-252520003-014.jpg
',16,'2024-03-14 04:26:46','2024-03-14 04:26:46'),
	 ('https://i.bumcheo1.info/66/66402/chapter-252520003-015.jpg
',16,'2024-03-14 04:26:46','2024-03-14 04:26:46'),
	 ('https://i.bumcheo1.info/66/66402/chapter-252520003-016.jpg
',16,'2024-03-14 04:26:46','2024-03-14 04:26:46'),
	 ('https://i.bumcheo1.info/66/66402/chapter-252520003-017.jpg
',16,'2024-03-14 04:26:46','2024-03-14 04:26:46');
INSERT INTO test.Comic_Images (url,ChapterId,createdAt,updatedAt) VALUES
	 ('https://i.bumcheo1.info/66/66402/chapter-252520003-018.jpg
',16,'2024-03-14 04:26:46','2024-03-14 04:26:46'),
	 ('https://i.bumcheo1.info/66/66402/chapter-252520003-019.jpg
',16,'2024-03-14 04:26:46','2024-03-14 04:26:46'),
	 ('https://i.bumcheo1.info/66/66402/chapter-252520003-020.jpg
',16,'2024-03-14 04:26:46','2024-03-14 04:26:46'),
	 ('https://i.bumcheo1.info/66/66402/chapter-252520003-021.jpg
',16,'2024-03-14 04:26:46','2024-03-14 04:26:46'),
	 ('https://i.bumcheo1.info/66/66402/chapter-252520003-022.jpg
',16,'2024-03-14 04:26:46','2024-03-14 04:26:46'),
	 ('https://i7.bumcheo.info/manga/13/13223/1.png
',16,'2024-03-14 04:26:46','2024-03-14 04:26:46'),
	 ('https://blogtruyen.vn/content/images/chapter-error.png
',16,'2024-03-14 04:26:46','2024-03-14 04:26:46'),
	 ('https://blogtruyen.vn/content/images/chapter-fix.png
',16,'2024-03-14 04:26:46','2024-03-14 04:26:46'),
	 ('https://blogtruyen.vn/Content/images/loading.gif',16,'2024-03-14 04:26:46','2024-03-14 04:26:46'),
	 ('https://i.bumcheo1.info/66/66656/chapter-252520004-001.jpg
',17,'2024-03-14 04:27:24','2024-03-14 04:27:24');
INSERT INTO test.Comic_Images (url,ChapterId,createdAt,updatedAt) VALUES
	 ('https://i7.bumcheo.info/manga/13/13223/0.jpg
',17,'2024-03-14 04:27:24','2024-03-14 04:27:24'),
	 ('https://i.bumcheo1.info/66/66656/chapter-252520004-000.jpg
',17,'2024-03-14 04:27:24','2024-03-14 04:27:24'),
	 ('https://i.bumcheo1.info/66/66656/chapter-252520004-002.jpg
',17,'2024-03-14 04:27:24','2024-03-14 04:27:24'),
	 ('https://i.bumcheo1.info/66/66656/chapter-252520004-003.jpg
',17,'2024-03-14 04:27:24','2024-03-14 04:27:24'),
	 ('https://i.bumcheo1.info/66/66656/chapter-252520004-004.jpg
',17,'2024-03-14 04:27:24','2024-03-14 04:27:24'),
	 ('https://i.bumcheo1.info/66/66656/chapter-252520004-005.jpg
',17,'2024-03-14 04:27:24','2024-03-14 04:27:24'),
	 ('https://i.bumcheo1.info/66/66656/chapter-252520004-006.jpg
',17,'2024-03-14 04:27:24','2024-03-14 04:27:24'),
	 ('https://i.bumcheo1.info/66/66656/chapter-252520004-007.jpg
',17,'2024-03-14 04:27:24','2024-03-14 04:27:24'),
	 ('https://i.bumcheo1.info/66/66656/chapter-252520004-008.jpg
',17,'2024-03-14 04:27:24','2024-03-14 04:27:24'),
	 ('https://i.bumcheo1.info/66/66656/chapter-252520004-009.jpg
',17,'2024-03-14 04:27:24','2024-03-14 04:27:24');
INSERT INTO test.Comic_Images (url,ChapterId,createdAt,updatedAt) VALUES
	 ('https://i.bumcheo1.info/66/66656/chapter-252520004-010.jpg
',17,'2024-03-14 04:27:24','2024-03-14 04:27:24'),
	 ('https://i.bumcheo1.info/66/66656/chapter-252520004-011.jpg
',17,'2024-03-14 04:27:24','2024-03-14 04:27:24'),
	 ('https://i.bumcheo1.info/66/66656/chapter-252520004-012.jpg
',17,'2024-03-14 04:27:24','2024-03-14 04:27:24'),
	 ('https://i.bumcheo1.info/66/66656/chapter-252520004-013.jpg
',17,'2024-03-14 04:27:24','2024-03-14 04:27:24'),
	 ('https://i.bumcheo1.info/66/66656/chapter-252520004-014.jpg
',17,'2024-03-14 04:27:24','2024-03-14 04:27:24'),
	 ('https://i.bumcheo1.info/66/66656/chapter-252520004-015.jpg
',17,'2024-03-14 04:27:24','2024-03-14 04:27:24'),
	 ('https://i.bumcheo1.info/66/66656/chapter-252520004-016.jpg
',17,'2024-03-14 04:27:24','2024-03-14 04:27:24'),
	 ('https://i.bumcheo1.info/66/66656/chapter-252520004-017.jpg
',17,'2024-03-14 04:27:24','2024-03-14 04:27:24'),
	 ('https://i.bumcheo1.info/66/66656/chapter-252520004-018.jpg
',17,'2024-03-14 04:27:24','2024-03-14 04:27:24'),
	 ('https://i.bumcheo1.info/66/66656/chapter-252520004-019.jpg
',17,'2024-03-14 04:27:24','2024-03-14 04:27:24');
INSERT INTO test.Comic_Images (url,ChapterId,createdAt,updatedAt) VALUES
	 ('https://i.bumcheo1.info/66/66656/chapter-252520004-020.jpg
',17,'2024-03-14 04:27:24','2024-03-14 04:27:24'),
	 ('https://i.bumcheo1.info/66/66656/chapter-252520004-021.jpg
',17,'2024-03-14 04:27:24','2024-03-14 04:27:24'),
	 ('https://i7.bumcheo.info/manga/13/13223/1.png
',17,'2024-03-14 04:27:24','2024-03-14 04:27:24'),
	 ('https://blogtruyen.vn/content/images/chapter-error.png
',17,'2024-03-14 04:27:24','2024-03-14 04:27:24'),
	 ('https://blogtruyen.vn/content/images/chapter-fix.png',17,'2024-03-14 04:27:24','2024-03-14 04:27:24'),
	 ('https://i.bumcheo1.info/66/66870/chapter-252520005-000-2.jpg
',18,'2024-03-14 04:27:59','2024-03-14 04:27:59'),
	 ('https://i7.bumcheo.info/manga/13/13223/0.jpg
',18,'2024-03-14 04:27:59','2024-03-14 04:27:59'),
	 ('https://i.bumcheo1.info/66/66870/chapter-252520005-001-2.jpg
',18,'2024-03-14 04:27:59','2024-03-14 04:27:59'),
	 ('https://i.bumcheo1.info/66/66870/chapter-252520005-002-2.jpg
',18,'2024-03-14 04:27:59','2024-03-14 04:27:59'),
	 ('https://i.bumcheo1.info/66/66870/chapter-252520005-003-2.jpg
',18,'2024-03-14 04:27:59','2024-03-14 04:27:59');
INSERT INTO test.Comic_Images (url,ChapterId,createdAt,updatedAt) VALUES
	 ('https://i.bumcheo1.info/66/66870/chapter-252520005-004-2.jpg
',18,'2024-03-14 04:27:59','2024-03-14 04:27:59'),
	 ('https://i.bumcheo1.info/66/66870/chapter-252520005-005-2.jpg
',18,'2024-03-14 04:27:59','2024-03-14 04:27:59'),
	 ('https://i.bumcheo1.info/66/66870/chapter-252520005-006-2.jpg
',18,'2024-03-14 04:27:59','2024-03-14 04:27:59'),
	 ('https://i.bumcheo1.info/66/66870/chapter-252520005-007-2.jpg
',18,'2024-03-14 04:27:59','2024-03-14 04:27:59'),
	 ('https://i.bumcheo1.info/66/66870/chapter-252520005-008-2.jpg
',18,'2024-03-14 04:27:59','2024-03-14 04:27:59'),
	 ('https://i.bumcheo1.info/66/66870/chapter-252520005-009-2.jpg
',18,'2024-03-14 04:27:59','2024-03-14 04:27:59'),
	 ('https://i.bumcheo1.info/66/66870/chapter-252520005-010-2.jpg
',18,'2024-03-14 04:27:59','2024-03-14 04:27:59'),
	 ('https://i.bumcheo1.info/66/66870/chapter-252520005-011-2.jpg
',18,'2024-03-14 04:27:59','2024-03-14 04:27:59'),
	 ('https://i.bumcheo1.info/66/66870/chapter-252520005-012-2.jpg
',18,'2024-03-14 04:27:59','2024-03-14 04:27:59'),
	 ('https://i.bumcheo1.info/66/66870/chapter-252520005-013-2.jpg
',18,'2024-03-14 04:27:59','2024-03-14 04:27:59');
INSERT INTO test.Comic_Images (url,ChapterId,createdAt,updatedAt) VALUES
	 ('https://i.bumcheo1.info/66/66870/chapter-252520005-014-2.jpg
',18,'2024-03-14 04:27:59','2024-03-14 04:27:59'),
	 ('https://i.bumcheo1.info/66/66870/chapter-252520005-015-2.jpg
',18,'2024-03-14 04:27:59','2024-03-14 04:27:59'),
	 ('https://i.bumcheo1.info/66/66870/chapter-252520005-016-2.jpg
',18,'2024-03-14 04:27:59','2024-03-14 04:27:59'),
	 ('https://i.bumcheo1.info/66/66870/chapter-252520005-017-2.jpg
',18,'2024-03-14 04:27:59','2024-03-14 04:27:59'),
	 ('https://i.bumcheo1.info/66/66870/chapter-252520005-018-2.jpg
',18,'2024-03-14 04:27:59','2024-03-14 04:27:59'),
	 ('https://i.bumcheo1.info/66/66870/chapter-252520005-019-2.jpg
',18,'2024-03-14 04:27:59','2024-03-14 04:27:59'),
	 ('https://i.bumcheo1.info/66/66870/chapter-252520005-020-2.jpg
',18,'2024-03-14 04:27:59','2024-03-14 04:27:59'),
	 ('https://i.bumcheo1.info/66/66870/chapter-252520005-021-2.jpg
',18,'2024-03-14 04:27:59','2024-03-14 04:27:59'),
	 ('https://i7.bumcheo.info/manga/13/13223/1.png
',18,'2024-03-14 04:27:59','2024-03-14 04:27:59'),
	 ('https://blogtruyen.vn/content/images/chapter-error.png
',18,'2024-03-14 04:27:59','2024-03-14 04:27:59');
INSERT INTO test.Comic_Images (url,ChapterId,createdAt,updatedAt) VALUES
	 ('https://blogtruyen.vn/content/images/chapter-fix.png',18,'2024-03-14 04:27:59','2024-03-14 04:27:59'),
	 ('https://i7.bumcheo.info/manga/13/13223/0.jpg
',19,'2024-03-14 04:29:16','2024-03-14 04:29:16'),
	 ('https://i2.bumcheo1.info/100/100920/c2-yo01-002-p2j.jpg
',19,'2024-03-14 04:29:16','2024-03-14 04:29:16'),
	 ('https://i2.bumcheo1.info/100/100920/c2-yo01-001-p2j.jpg
',19,'2024-03-14 04:29:16','2024-03-14 04:29:16'),
	 ('https://i2.bumcheo1.info/100/100920/c2-yo01-003-p2j.jpg
',19,'2024-03-14 04:29:16','2024-03-14 04:29:16'),
	 ('https://i2.bumcheo1.info/100/100920/c2-yo01-004-005-p2j.jpg
',19,'2024-03-14 04:29:16','2024-03-14 04:29:16'),
	 ('https://i2.bumcheo1.info/100/100920/c2-yo01-006-p2j.jpg
',19,'2024-03-14 04:29:16','2024-03-14 04:29:16'),
	 ('https://i2.bumcheo1.info/100/100920/c2-yo01-007-p2j.jpg
',19,'2024-03-14 04:29:16','2024-03-14 04:29:16'),
	 ('https://i2.bumcheo1.info/100/100920/c2-yo01-008-p2j.jpg
',19,'2024-03-14 04:29:16','2024-03-14 04:29:16'),
	 ('https://i2.bumcheo1.info/100/100920/c2-yo01-009-p2j.jpg
',19,'2024-03-14 04:29:16','2024-03-14 04:29:16');
INSERT INTO test.Comic_Images (url,ChapterId,createdAt,updatedAt) VALUES
	 ('https://i2.bumcheo1.info/100/100920/c2-yo01-010-p2j.jpg
',19,'2024-03-14 04:29:16','2024-03-14 04:29:16'),
	 ('https://i2.bumcheo1.info/100/100920/c2-yo01-011-p2j.jpg
',19,'2024-03-14 04:29:16','2024-03-14 04:29:16'),
	 ('https://i2.bumcheo1.info/100/100920/c2-yo01-012-p2j.jpg
',19,'2024-03-14 04:29:16','2024-03-14 04:29:16'),
	 ('https://i2.bumcheo1.info/100/100920/c2-yo01-013-p2j.jpg
',19,'2024-03-14 04:29:16','2024-03-14 04:29:16'),
	 ('https://i2.bumcheo1.info/100/100920/c2-yo01-014-p2j.jpg
',19,'2024-03-14 04:29:16','2024-03-14 04:29:16'),
	 ('https://i2.bumcheo1.info/100/100920/c2-yo01-015-p2j.jpg
',19,'2024-03-14 04:29:16','2024-03-14 04:29:16'),
	 ('https://i2.bumcheo1.info/100/100920/c2-yo01-016-p2j.jpg
',19,'2024-03-14 04:29:16','2024-03-14 04:29:16'),
	 ('https://i2.bumcheo1.info/100/100920/c2-yo01-017-p2j.jpg
',19,'2024-03-14 04:29:16','2024-03-14 04:29:16'),
	 ('https://i2.bumcheo1.info/100/100920/c2-yo01-018-p2j.jpg
',19,'2024-03-14 04:29:16','2024-03-14 04:29:16'),
	 ('https://i2.bumcheo1.info/100/100920/c2-yo01-019-p2j.jpg
',19,'2024-03-14 04:29:16','2024-03-14 04:29:16');
INSERT INTO test.Comic_Images (url,ChapterId,createdAt,updatedAt) VALUES
	 ('https://i2.bumcheo1.info/100/100920/c2-yo01-020-p2j.jpg
',19,'2024-03-14 04:29:16','2024-03-14 04:29:16'),
	 ('https://i2.bumcheo1.info/100/100920/c2-yo01-021-p2j.jpg
',19,'2024-03-14 04:29:16','2024-03-14 04:29:16'),
	 ('https://i2.bumcheo1.info/100/100920/c2-yo01-022-p2j.jpg
',19,'2024-03-14 04:29:16','2024-03-14 04:29:16'),
	 ('https://i2.bumcheo1.info/100/100920/c2-yo01-023-p2j.jpg
',19,'2024-03-14 04:29:16','2024-03-14 04:29:16'),
	 ('https://i2.bumcheo1.info/100/100920/c2-yo01-024-p2j.jpg
',19,'2024-03-14 04:29:16','2024-03-14 04:29:16'),
	 ('https://i2.bumcheo1.info/100/100920/c2-yo01-025-p2j.jpg
',19,'2024-03-14 04:29:16','2024-03-14 04:29:16'),
	 ('https://i2.bumcheo1.info/100/100920/c2-yo01-026-p2j.jpg
',19,'2024-03-14 04:29:16','2024-03-14 04:29:16'),
	 ('https://i2.bumcheo1.info/100/100920/c2-yo01-027-p2j.jpg
',19,'2024-03-14 04:29:16','2024-03-14 04:29:16'),
	 ('https://i2.bumcheo1.info/100/100920/c2-yo01-028-p2j.jpg
',19,'2024-03-14 04:29:16','2024-03-14 04:29:16'),
	 ('https://i2.bumcheo1.info/100/100920/c2-yo01-029-p2j.jpg
',19,'2024-03-14 04:29:16','2024-03-14 04:29:16');
INSERT INTO test.Comic_Images (url,ChapterId,createdAt,updatedAt) VALUES
	 ('https://i2.bumcheo1.info/100/100920/c2-yo01-030-p2j.jpg
',19,'2024-03-14 04:29:16','2024-03-14 04:29:16'),
	 ('https://i2.bumcheo1.info/100/100920/c2-yo01-031-p2j.jpg
',19,'2024-03-14 04:29:16','2024-03-14 04:29:16'),
	 ('https://i2.bumcheo1.info/100/100920/c2-yo01-032-p2j.jpg
',19,'2024-03-14 04:29:16','2024-03-14 04:29:16'),
	 ('https://i2.bumcheo1.info/100/100920/c2-yo01-033-p2j.jpg
',19,'2024-03-14 04:29:16','2024-03-14 04:29:16'),
	 ('https://i2.bumcheo1.info/100/100920/c2-yo01-034-p2j.jpg
',19,'2024-03-14 04:29:16','2024-03-14 04:29:16'),
	 ('https://i2.bumcheo1.info/100/100920/c2-yo01-035-p2j.jpg
',19,'2024-03-14 04:29:16','2024-03-14 04:29:16'),
	 ('https://i2.bumcheo1.info/100/100920/c2-yo01-036-p2j.jpg
',19,'2024-03-14 04:29:16','2024-03-14 04:29:16'),
	 ('https://i2.bumcheo1.info/100/100920/c2-yo01-037-p2j.jpg
',19,'2024-03-14 04:29:16','2024-03-14 04:29:16'),
	 ('https://i2.bumcheo1.info/100/100920/c2-yo01-038-p2j.jpg
',19,'2024-03-14 04:29:16','2024-03-14 04:29:16'),
	 ('https://i2.bumcheo1.info/100/100920/c2-yo01-039-p2j.jpg
',19,'2024-03-14 04:29:16','2024-03-14 04:29:16');
INSERT INTO test.Comic_Images (url,ChapterId,createdAt,updatedAt) VALUES
	 ('https://i2.bumcheo1.info/100/100920/c2-yo01-040-p2j.jpg
',19,'2024-03-14 04:29:16','2024-03-14 04:29:16'),
	 ('https://i2.bumcheo1.info/100/100920/c2-yo01-041-p2j.jpg
',19,'2024-03-14 04:29:16','2024-03-14 04:29:16'),
	 ('https://i2.bumcheo1.info/100/100920/c2-yo01-042-p2j.jpg
',19,'2024-03-14 04:29:16','2024-03-14 04:29:16'),
	 ('https://i2.bumcheo1.info/100/100920/c2-yo01-043-p2j.jpg
',19,'2024-03-14 04:29:16','2024-03-14 04:29:16'),
	 ('https://i2.bumcheo1.info/100/100920/c2-yo01-044-p2j.jpg
',19,'2024-03-14 04:29:16','2024-03-14 04:29:16'),
	 ('https://i2.bumcheo1.info/100/100920/c2-yo01-045-p2j.jpg
',19,'2024-03-14 04:29:16','2024-03-14 04:29:16'),
	 ('https://i2.bumcheo1.info/100/100920/c2-yo01-046-p2j.jpg
',19,'2024-03-14 04:29:16','2024-03-14 04:29:16'),
	 ('https://i2.bumcheo1.info/100/100920/c2-yo01-047-p2j.jpg
',19,'2024-03-14 04:29:16','2024-03-14 04:29:16'),
	 ('https://i7.bumcheo.info/manga/13/13223/1.png
',19,'2024-03-14 04:29:16','2024-03-14 04:29:16'),
	 ('https://blogtruyen.vn/content/images/chapter-error.png
',19,'2024-03-14 04:29:16','2024-03-14 04:29:16');
INSERT INTO test.Comic_Images (url,ChapterId,createdAt,updatedAt) VALUES
	 ('https://blogtruyen.vn/content/images/chapter-fix.png',19,'2024-03-14 04:29:16','2024-03-14 04:29:16'),
	 ('https://i2.bumcheo1.info/104/104577/c2-yo02-001-p2j.jpg
',20,'2024-03-14 04:30:08','2024-03-14 04:30:08'),
	 ('https://i7.bumcheo.info/manga/13/13223/0.jpg
',20,'2024-03-14 04:30:08','2024-03-14 04:30:08'),
	 ('https://i2.bumcheo1.info/104/104577/c2-yo02-002-p2j.jpg
',20,'2024-03-14 04:30:08','2024-03-14 04:30:08'),
	 ('https://i2.bumcheo1.info/104/104577/c2-yo02-003-p2j.jpg
',20,'2024-03-14 04:30:08','2024-03-14 04:30:08'),
	 ('https://i2.bumcheo1.info/104/104577/c2-yo02-004-p2j.jpg
',20,'2024-03-14 04:30:08','2024-03-14 04:30:08'),
	 ('https://i2.bumcheo1.info/104/104577/c2-yo02-005-p2j.jpg
',20,'2024-03-14 04:30:08','2024-03-14 04:30:08'),
	 ('https://i2.bumcheo1.info/104/104577/c2-yo02-006-p2j.jpg
',20,'2024-03-14 04:30:08','2024-03-14 04:30:08'),
	 ('https://i2.bumcheo1.info/104/104577/c2-yo02-007-p2j.jpg
',20,'2024-03-14 04:30:08','2024-03-14 04:30:08'),
	 ('https://i2.bumcheo1.info/104/104577/c2-yo02-008-p2j.jpg
',20,'2024-03-14 04:30:08','2024-03-14 04:30:08');
INSERT INTO test.Comic_Images (url,ChapterId,createdAt,updatedAt) VALUES
	 ('https://i2.bumcheo1.info/104/104577/c2-yo02-009-p2j.jpg
',20,'2024-03-14 04:30:08','2024-03-14 04:30:08'),
	 ('https://i2.bumcheo1.info/104/104577/c2-yo02-010-011-p2j.jpg
',20,'2024-03-14 04:30:08','2024-03-14 04:30:08'),
	 ('https://i2.bumcheo1.info/104/104577/c2-yo02-012-p2j.jpg
',20,'2024-03-14 04:30:08','2024-03-14 04:30:08'),
	 ('https://i2.bumcheo1.info/104/104577/c2-yo02-013-p2j.jpg
',20,'2024-03-14 04:30:08','2024-03-14 04:30:08'),
	 ('https://i2.bumcheo1.info/104/104577/c2-yo02-014-p2j.jpg
',20,'2024-03-14 04:30:08','2024-03-14 04:30:08'),
	 ('https://i2.bumcheo1.info/104/104577/c2-yo02-015-p2j.jpg
',20,'2024-03-14 04:30:08','2024-03-14 04:30:08'),
	 ('https://i2.bumcheo1.info/104/104577/c2-yo02-016-p2j.jpg
',20,'2024-03-14 04:30:08','2024-03-14 04:30:08'),
	 ('https://i2.bumcheo1.info/104/104577/c2-yo02-017-p2j.jpg
',20,'2024-03-14 04:30:08','2024-03-14 04:30:08'),
	 ('https://i2.bumcheo1.info/104/104577/c2-yo02-018-p2j.jpg
',20,'2024-03-14 04:30:08','2024-03-14 04:30:08'),
	 ('https://i2.bumcheo1.info/104/104577/c2-yo02-019-p2j.jpg
',20,'2024-03-14 04:30:08','2024-03-14 04:30:08');
INSERT INTO test.Comic_Images (url,ChapterId,createdAt,updatedAt) VALUES
	 ('https://i2.bumcheo1.info/104/104577/c2-yo02-020-p2j.jpg
',20,'2024-03-14 04:30:08','2024-03-14 04:30:08'),
	 ('https://i2.bumcheo1.info/104/104577/c2-yo02-021-p2j.jpg
',20,'2024-03-14 04:30:08','2024-03-14 04:30:08'),
	 ('https://i2.bumcheo1.info/104/104577/c2-yo02-022-p2j.jpg
',20,'2024-03-14 04:30:08','2024-03-14 04:30:08'),
	 ('https://i2.bumcheo1.info/104/104577/c2-yo02-023-p2j.jpg
',20,'2024-03-14 04:30:08','2024-03-14 04:30:08'),
	 ('https://i2.bumcheo1.info/104/104577/c2-yo02-024-p2j.jpg
',20,'2024-03-14 04:30:08','2024-03-14 04:30:08'),
	 ('https://i2.bumcheo1.info/104/104577/c2-yo02-025-p2j.jpg
',20,'2024-03-14 04:30:08','2024-03-14 04:30:08'),
	 ('https://i2.bumcheo1.info/104/104577/c2-yo02-026-p2j.jpg
',20,'2024-03-14 04:30:08','2024-03-14 04:30:08'),
	 ('https://i2.bumcheo1.info/104/104577/c2-yo02-027-p2j.jpg
',20,'2024-03-14 04:30:08','2024-03-14 04:30:08'),
	 ('https://i2.bumcheo1.info/104/104577/c2-yo02-028-p2j.jpg
',20,'2024-03-14 04:30:08','2024-03-14 04:30:08'),
	 ('https://i2.bumcheo1.info/104/104577/c2-yo02-029-p2j.jpg
',20,'2024-03-14 04:30:08','2024-03-14 04:30:08');
INSERT INTO test.Comic_Images (url,ChapterId,createdAt,updatedAt) VALUES
	 ('https://i2.bumcheo1.info/104/104577/c2-yo02-030-p2j.jpg
',20,'2024-03-14 04:30:08','2024-03-14 04:30:08'),
	 ('https://i2.bumcheo1.info/104/104577/c2-yo02-031-p2j.jpg
',20,'2024-03-14 04:30:08','2024-03-14 04:30:08'),
	 ('https://i2.bumcheo1.info/104/104577/c2-yo02-032-p2j.jpg
',20,'2024-03-14 04:30:08','2024-03-14 04:30:08'),
	 ('https://i2.bumcheo1.info/104/104577/c2-yo02-033-p2j.jpg
',20,'2024-03-14 04:30:08','2024-03-14 04:30:08'),
	 ('https://i2.bumcheo1.info/104/104577/c2-yo02-034-p2j.jpg
',20,'2024-03-14 04:30:08','2024-03-14 04:30:08'),
	 ('https://i2.bumcheo1.info/104/104577/c2-yo02-035-p2j.jpg
',20,'2024-03-14 04:30:08','2024-03-14 04:30:08'),
	 ('https://i2.bumcheo1.info/104/104577/c2-yo02-036-p2j.jpg
',20,'2024-03-14 04:30:08','2024-03-14 04:30:08'),
	 ('https://i2.bumcheo1.info/104/104577/c2-yo02-037-p2j.jpg
',20,'2024-03-14 04:30:08','2024-03-14 04:30:08'),
	 ('https://i2.bumcheo1.info/104/104577/c2-yo02-038-p2j.jpg
',20,'2024-03-14 04:30:08','2024-03-14 04:30:08'),
	 ('https://i2.bumcheo1.info/104/104577/c2-yo02-039-p2j.jpg
',20,'2024-03-14 04:30:08','2024-03-14 04:30:08');
INSERT INTO test.Comic_Images (url,ChapterId,createdAt,updatedAt) VALUES
	 ('https://i7.bumcheo.info/manga/13/13223/1.png
',20,'2024-03-14 04:30:08','2024-03-14 04:30:08'),
	 ('https://blogtruyen.vn/content/images/chapter-error.png
',20,'2024-03-14 04:30:08','2024-03-14 04:30:08'),
	 ('https://blogtruyen.vn/content/images/chapter-fix.png',20,'2024-03-14 04:30:08','2024-03-14 04:30:08'),
	 ('https://i7.bumcheo.info/manga/13/13223/0.jpg
',21,'2024-03-14 04:30:28','2024-03-14 04:30:28'),
	 ('https://i2.bumcheo1.info/110/110702/c2-yo03-001-p2j.jpg
',21,'2024-03-14 04:30:28','2024-03-14 04:30:28'),
	 ('https://i2.bumcheo1.info/110/110702/c2-yo03-002-p2j.jpg
',21,'2024-03-14 04:30:28','2024-03-14 04:30:28'),
	 ('https://i2.bumcheo1.info/110/110702/c2-yo03-003-p2j.jpg
',21,'2024-03-14 04:30:28','2024-03-14 04:30:28'),
	 ('https://i2.bumcheo1.info/110/110702/c2-yo03-004-p2j.jpg
',21,'2024-03-14 04:30:28','2024-03-14 04:30:28'),
	 ('https://i2.bumcheo1.info/110/110702/c2-yo03-005-p2j.jpg
',21,'2024-03-14 04:30:28','2024-03-14 04:30:28'),
	 ('https://i2.bumcheo1.info/110/110702/c2-yo03-006-p2j.jpg
',21,'2024-03-14 04:30:28','2024-03-14 04:30:28');
INSERT INTO test.Comic_Images (url,ChapterId,createdAt,updatedAt) VALUES
	 ('https://i2.bumcheo1.info/110/110702/c2-yo03-007-p2j.jpg
',21,'2024-03-14 04:30:28','2024-03-14 04:30:28'),
	 ('https://i2.bumcheo1.info/110/110702/c2-yo03-008-p2j.jpg
',21,'2024-03-14 04:30:28','2024-03-14 04:30:28'),
	 ('https://i2.bumcheo1.info/110/110702/c2-yo03-009-p2j.jpg
',21,'2024-03-14 04:30:28','2024-03-14 04:30:28'),
	 ('https://i2.bumcheo1.info/110/110702/c2-yo03-010-p2j.jpg
',21,'2024-03-14 04:30:28','2024-03-14 04:30:28'),
	 ('https://i2.bumcheo1.info/110/110702/c2-yo03-011-p2j.jpg
',21,'2024-03-14 04:30:28','2024-03-14 04:30:28'),
	 ('https://i2.bumcheo1.info/110/110702/c2-yo03-012-p2j.jpg
',21,'2024-03-14 04:30:28','2024-03-14 04:30:28'),
	 ('https://i2.bumcheo1.info/110/110702/c2-yo03-013-p2j.jpg
',21,'2024-03-14 04:30:28','2024-03-14 04:30:28'),
	 ('https://i2.bumcheo1.info/110/110702/c2-yo03-014-p2j.jpg
',21,'2024-03-14 04:30:28','2024-03-14 04:30:28'),
	 ('https://i2.bumcheo1.info/110/110702/c2-yo03-015-p2j.jpg
',21,'2024-03-14 04:30:28','2024-03-14 04:30:28'),
	 ('https://i2.bumcheo1.info/110/110702/c2-yo03-016-p2j.jpg
',21,'2024-03-14 04:30:28','2024-03-14 04:30:28');
INSERT INTO test.Comic_Images (url,ChapterId,createdAt,updatedAt) VALUES
	 ('https://i2.bumcheo1.info/110/110702/c2-yo03-017-p2j.jpg
',21,'2024-03-14 04:30:28','2024-03-14 04:30:28'),
	 ('https://i2.bumcheo1.info/110/110702/c2-yo03-018-p2j.jpg
',21,'2024-03-14 04:30:28','2024-03-14 04:30:28'),
	 ('https://i2.bumcheo1.info/110/110702/c2-yo03-019-p2j.jpg
',21,'2024-03-14 04:30:28','2024-03-14 04:30:28'),
	 ('https://i2.bumcheo1.info/110/110702/c2-yo03-020-p2j.jpg
',21,'2024-03-14 04:30:28','2024-03-14 04:30:28'),
	 ('https://i2.bumcheo1.info/110/110702/c2-yo03-021-p2j.jpg
',21,'2024-03-14 04:30:28','2024-03-14 04:30:28'),
	 ('https://i2.bumcheo1.info/110/110702/c2-yo03-022-p2j.jpg
',21,'2024-03-14 04:30:28','2024-03-14 04:30:28'),
	 ('https://i2.bumcheo1.info/110/110702/c2-yo03-023-p2j.jpg
',21,'2024-03-14 04:30:28','2024-03-14 04:30:28'),
	 ('https://i2.bumcheo1.info/110/110702/c2-yo03-024-p2j.jpg
',21,'2024-03-14 04:30:28','2024-03-14 04:30:28'),
	 ('https://i2.bumcheo1.info/110/110702/c2-yo03-025-p2j.jpg
',21,'2024-03-14 04:30:28','2024-03-14 04:30:28'),
	 ('https://i2.bumcheo1.info/110/110702/c2-yo03-026-p2j.jpg
',21,'2024-03-14 04:30:28','2024-03-14 04:30:28');
INSERT INTO test.Comic_Images (url,ChapterId,createdAt,updatedAt) VALUES
	 ('https://i2.bumcheo1.info/110/110702/c2-yo03-027-p2j.jpg
',21,'2024-03-14 04:30:28','2024-03-14 04:30:28'),
	 ('https://i2.bumcheo1.info/110/110702/c2-yo03-028-p2j.jpg
',21,'2024-03-14 04:30:28','2024-03-14 04:30:28'),
	 ('https://i2.bumcheo1.info/110/110702/c2-yo03-029-p2j.jpg
',21,'2024-03-14 04:30:28','2024-03-14 04:30:28'),
	 ('https://i2.bumcheo1.info/110/110702/c2-yo03-030-p2j.jpg
',21,'2024-03-14 04:30:28','2024-03-14 04:30:28'),
	 ('https://i2.bumcheo1.info/110/110702/c2-yo03-031-p2j.jpg
',21,'2024-03-14 04:30:28','2024-03-14 04:30:28'),
	 ('https://i2.bumcheo1.info/110/110702/c2-yo03-032-p2j.jpg
',21,'2024-03-14 04:30:28','2024-03-14 04:30:28'),
	 ('https://i2.bumcheo1.info/110/110702/c2-yo03-033-p2j.jpg
',21,'2024-03-14 04:30:28','2024-03-14 04:30:28'),
	 ('https://i2.bumcheo1.info/110/110702/c2-yo03-034-p2j.jpg
',21,'2024-03-14 04:30:28','2024-03-14 04:30:28'),
	 ('https://i2.bumcheo1.info/110/110702/c2-yo03-035-p2j.jpg
',21,'2024-03-14 04:30:28','2024-03-14 04:30:28'),
	 ('https://i2.bumcheo1.info/110/110702/c2-yo03-036-p2j.jpg
',21,'2024-03-14 04:30:28','2024-03-14 04:30:28');
INSERT INTO test.Comic_Images (url,ChapterId,createdAt,updatedAt) VALUES
	 ('https://i2.bumcheo1.info/110/110702/c2-yo03-037-p2j.jpg
',21,'2024-03-14 04:30:28','2024-03-14 04:30:28'),
	 ('https://i7.bumcheo.info/manga/13/13223/1.png
',21,'2024-03-14 04:30:28','2024-03-14 04:30:28'),
	 ('https://blogtruyen.vn/content/images/chapter-error.png
',21,'2024-03-14 04:30:28','2024-03-14 04:30:28'),
	 ('https://blogtruyen.vn/content/images/chapter-fix.png
',21,'2024-03-14 04:30:28','2024-03-14 04:30:28'),
	 ('https://blogtruyen.vn/Content/images/loading.gif',21,'2024-03-14 04:30:28','2024-03-14 04:30:28'),
	 ('https://i2.bumcheo1.info/125/125388/c2-yo04-001-p2j.jpg
',22,'2024-03-14 04:30:48','2024-03-14 04:30:48'),
	 ('https://i7.bumcheo.info/manga/13/13223/0.jpg
',22,'2024-03-14 04:30:48','2024-03-14 04:30:48'),
	 ('https://i2.bumcheo1.info/125/125388/c2-yo04-002-p2j.jpg
',22,'2024-03-14 04:30:48','2024-03-14 04:30:48'),
	 ('https://i2.bumcheo1.info/125/125388/c2-yo04-003-p2j.jpg
',22,'2024-03-14 04:30:48','2024-03-14 04:30:48'),
	 ('https://i2.bumcheo1.info/125/125388/c2-yo04-004-p2j.jpg
',22,'2024-03-14 04:30:48','2024-03-14 04:30:48');
INSERT INTO test.Comic_Images (url,ChapterId,createdAt,updatedAt) VALUES
	 ('https://i2.bumcheo1.info/125/125388/c2-yo04-005-p2j.jpg
',22,'2024-03-14 04:30:48','2024-03-14 04:30:48'),
	 ('https://i2.bumcheo1.info/125/125388/c2-yo04-006-p2j.jpg
',22,'2024-03-14 04:30:48','2024-03-14 04:30:48'),
	 ('https://i2.bumcheo1.info/125/125388/c2-yo04-007-p2j.jpg
',22,'2024-03-14 04:30:48','2024-03-14 04:30:48'),
	 ('https://i2.bumcheo1.info/125/125388/c2-yo04-008-p2j.jpg
',22,'2024-03-14 04:30:48','2024-03-14 04:30:48'),
	 ('https://i2.bumcheo1.info/125/125388/c2-yo04-009-p2j.jpg
',22,'2024-03-14 04:30:48','2024-03-14 04:30:48'),
	 ('https://i2.bumcheo1.info/125/125388/c2-yo04-010-p2j.jpg
',22,'2024-03-14 04:30:48','2024-03-14 04:30:48'),
	 ('https://i2.bumcheo1.info/125/125388/c2-yo04-011-p2j.jpg
',22,'2024-03-14 04:30:48','2024-03-14 04:30:48'),
	 ('https://i2.bumcheo1.info/125/125388/c2-yo04-012-p2j.jpg
',22,'2024-03-14 04:30:48','2024-03-14 04:30:48'),
	 ('https://i2.bumcheo1.info/125/125388/c2-yo04-013-p2j.jpg
',22,'2024-03-14 04:30:48','2024-03-14 04:30:48'),
	 ('https://i2.bumcheo1.info/125/125388/c2-yo04-014-p2j.jpg
',22,'2024-03-14 04:30:48','2024-03-14 04:30:48');
INSERT INTO test.Comic_Images (url,ChapterId,createdAt,updatedAt) VALUES
	 ('https://i2.bumcheo1.info/125/125388/c2-yo04-015-p2j.jpg
',22,'2024-03-14 04:30:48','2024-03-14 04:30:48'),
	 ('https://i2.bumcheo1.info/125/125388/c2-yo04-016-p2j.jpg
',22,'2024-03-14 04:30:48','2024-03-14 04:30:48'),
	 ('https://i2.bumcheo1.info/125/125388/c2-yo04-017-p2j.jpg
',22,'2024-03-14 04:30:48','2024-03-14 04:30:48'),
	 ('https://i2.bumcheo1.info/125/125388/c2-yo04-018-p2j.jpg
',22,'2024-03-14 04:30:48','2024-03-14 04:30:48'),
	 ('https://i2.bumcheo1.info/125/125388/c2-yo04-019-p2j.jpg
',22,'2024-03-14 04:30:48','2024-03-14 04:30:48'),
	 ('https://i2.bumcheo1.info/125/125388/c2-yo04-020-p2j.jpg
',22,'2024-03-14 04:30:48','2024-03-14 04:30:48'),
	 ('https://i2.bumcheo1.info/125/125388/c2-yo04-021-p2j.jpg
',22,'2024-03-14 04:30:48','2024-03-14 04:30:48'),
	 ('https://i2.bumcheo1.info/125/125388/c2-yo04-022-p2j.jpg
',22,'2024-03-14 04:30:48','2024-03-14 04:30:48'),
	 ('https://i2.bumcheo1.info/125/125388/c2-yo04-023-p2j.jpg
',22,'2024-03-14 04:30:48','2024-03-14 04:30:48'),
	 ('https://i2.bumcheo1.info/125/125388/c2-yo04-024-p2j.jpg
',22,'2024-03-14 04:30:48','2024-03-14 04:30:48');
INSERT INTO test.Comic_Images (url,ChapterId,createdAt,updatedAt) VALUES
	 ('https://i2.bumcheo1.info/125/125388/c2-yo04-025-p2j.jpg
',22,'2024-03-14 04:30:48','2024-03-14 04:30:48'),
	 ('https://i2.bumcheo1.info/125/125388/c2-yo04-026-p2j.jpg
',22,'2024-03-14 04:30:48','2024-03-14 04:30:48'),
	 ('https://i7.bumcheo.info/manga/13/13223/1.png
',22,'2024-03-14 04:30:48','2024-03-14 04:30:48'),
	 ('https://blogtruyen.vn/content/images/chapter-error.png
',22,'2024-03-14 04:30:48','2024-03-14 04:30:48'),
	 ('https://blogtruyen.vn/content/images/chapter-fix.png',22,'2024-03-14 04:30:48','2024-03-14 04:30:48'),
	 ('https://i7.bumcheo.info/manga/13/13223/0.jpg
',23,'2024-03-14 04:31:11','2024-03-14 04:31:11'),
	 ('https://i2.bumcheo1.info/130/130181/c2-yo05-001-p2j.jpg
',23,'2024-03-14 04:31:11','2024-03-14 04:31:11'),
	 ('https://i2.bumcheo1.info/130/130181/c2-yo05-002-p2j.jpg
',23,'2024-03-14 04:31:11','2024-03-14 04:31:11'),
	 ('https://i2.bumcheo1.info/130/130181/c2-yo05-004-p2j.jpg
',23,'2024-03-14 04:31:11','2024-03-14 04:31:11'),
	 ('https://i2.bumcheo1.info/130/130181/c2-yo05-003-p2j.jpg
',23,'2024-03-14 04:31:11','2024-03-14 04:31:11');
INSERT INTO test.Comic_Images (url,ChapterId,createdAt,updatedAt) VALUES
	 ('https://i2.bumcheo1.info/130/130181/c2-yo05-005-p2j.jpg
',23,'2024-03-14 04:31:11','2024-03-14 04:31:11'),
	 ('https://i2.bumcheo1.info/130/130181/c2-yo05-006-p2j.jpg
',23,'2024-03-14 04:31:11','2024-03-14 04:31:11'),
	 ('https://i2.bumcheo1.info/130/130181/c2-yo05-007-p2j.jpg
',23,'2024-03-14 04:31:11','2024-03-14 04:31:11'),
	 ('https://i2.bumcheo1.info/130/130181/c2-yo05-008-p2j.jpg
',23,'2024-03-14 04:31:11','2024-03-14 04:31:11'),
	 ('https://i2.bumcheo1.info/130/130181/c2-yo05-009-p2j.jpg
',23,'2024-03-14 04:31:11','2024-03-14 04:31:11'),
	 ('https://i2.bumcheo1.info/130/130181/c2-yo05-010-p2j.jpg
',23,'2024-03-14 04:31:11','2024-03-14 04:31:11'),
	 ('https://i2.bumcheo1.info/130/130181/c2-yo05-011-p2j.jpg
',23,'2024-03-14 04:31:11','2024-03-14 04:31:11'),
	 ('https://i2.bumcheo1.info/130/130181/c2-yo05-012-p2j.jpg
',23,'2024-03-14 04:31:11','2024-03-14 04:31:11'),
	 ('https://i2.bumcheo1.info/130/130181/c2-yo05-013-p2j.jpg
',23,'2024-03-14 04:31:11','2024-03-14 04:31:11'),
	 ('https://i2.bumcheo1.info/130/130181/c2-yo05-014-p2j.jpg
',23,'2024-03-14 04:31:11','2024-03-14 04:31:11');
INSERT INTO test.Comic_Images (url,ChapterId,createdAt,updatedAt) VALUES
	 ('https://i2.bumcheo1.info/130/130181/c2-yo05-015-p2j.jpg
',23,'2024-03-14 04:31:11','2024-03-14 04:31:11'),
	 ('https://i2.bumcheo1.info/130/130181/c2-yo05-016-p2j.jpg
',23,'2024-03-14 04:31:11','2024-03-14 04:31:11'),
	 ('https://i2.bumcheo1.info/130/130181/c2-yo05-017-p2j.jpg
',23,'2024-03-14 04:31:11','2024-03-14 04:31:11'),
	 ('https://i2.bumcheo1.info/130/130181/c2-yo05-018-p2j.jpg
',23,'2024-03-14 04:31:11','2024-03-14 04:31:11'),
	 ('https://i2.bumcheo1.info/130/130181/c2-yo05-019-p2j.jpg
',23,'2024-03-14 04:31:11','2024-03-14 04:31:11'),
	 ('https://i2.bumcheo1.info/130/130181/c2-yo05-020-p2j.jpg
',23,'2024-03-14 04:31:11','2024-03-14 04:31:11'),
	 ('https://i2.bumcheo1.info/130/130181/c2-yo05-021-p2j.jpg
',23,'2024-03-14 04:31:11','2024-03-14 04:31:11'),
	 ('https://i2.bumcheo1.info/130/130181/c2-yo05-022-023-p2j.jpg
',23,'2024-03-14 04:31:11','2024-03-14 04:31:11'),
	 ('https://i2.bumcheo1.info/130/130181/c2-yo05-024-p2j.jpg
',23,'2024-03-14 04:31:11','2024-03-14 04:31:11'),
	 ('https://i2.bumcheo1.info/130/130181/c2-yo05-025-p2j.jpg
',23,'2024-03-14 04:31:11','2024-03-14 04:31:11');
INSERT INTO test.Comic_Images (url,ChapterId,createdAt,updatedAt) VALUES
	 ('https://i2.bumcheo1.info/130/130181/c2-yo05-026-p2j.jpg
',23,'2024-03-14 04:31:11','2024-03-14 04:31:11'),
	 ('https://i2.bumcheo1.info/130/130181/c2-yo05-027-p2j.jpg
',23,'2024-03-14 04:31:11','2024-03-14 04:31:11'),
	 ('https://i2.bumcheo1.info/130/130181/c2-yo05-028-p2j.jpg
',23,'2024-03-14 04:31:11','2024-03-14 04:31:11'),
	 ('https://i7.bumcheo.info/manga/13/13223/1.png
',23,'2024-03-14 04:31:11','2024-03-14 04:31:11'),
	 ('https://blogtruyen.vn/content/images/chapter-error.png
',23,'2024-03-14 04:31:11','2024-03-14 04:31:11'),
	 ('https://blogtruyen.vn/content/images/chapter-fix.png',23,'2024-03-14 04:31:11','2024-03-14 04:31:11'),
	 ('https://i7.bumcheo.info/665/665760/1.jpg
',8,'2024-03-14 04:32:05','2024-03-14 04:32:05'),
	 ('https://i7.bumcheo.info/665/665760/2.jpg
',8,'2024-03-14 04:32:05','2024-03-14 04:32:05'),
	 ('https://i7.bumcheo.info/665/665760/3.jpg
',8,'2024-03-14 04:32:05','2024-03-14 04:32:05'),
	 ('https://i7.bumcheo.info/665/665760/4.jpg
',8,'2024-03-14 04:32:05','2024-03-14 04:32:05');
INSERT INTO test.Comic_Images (url,ChapterId,createdAt,updatedAt) VALUES
	 ('https://i7.bumcheo.info/665/665760/5.jpg
',8,'2024-03-14 04:32:05','2024-03-14 04:32:05'),
	 ('https://i7.bumcheo.info/665/665760/6.jpg
',8,'2024-03-14 04:32:05','2024-03-14 04:32:05'),
	 ('https://i7.bumcheo.info/665/665760/7.jpg
',8,'2024-03-14 04:32:05','2024-03-14 04:32:05'),
	 ('https://i7.bumcheo.info/665/665760/8.jpg
',8,'2024-03-14 04:32:05','2024-03-14 04:32:05'),
	 ('https://i7.bumcheo.info/665/665760/9.jpg
',8,'2024-03-14 04:32:05','2024-03-14 04:32:05'),
	 ('https://i7.bumcheo.info/665/665760/10.jpg
',8,'2024-03-14 04:32:05','2024-03-14 04:32:05'),
	 ('https://i7.bumcheo.info/665/665760/11.jpg
',8,'2024-03-14 04:32:05','2024-03-14 04:32:05'),
	 ('https://i7.bumcheo.info/665/665760/12.jpg
',8,'2024-03-14 04:32:05','2024-03-14 04:32:05'),
	 ('https://i7.bumcheo.info/665/665760/13.jpg
',8,'2024-03-14 04:32:05','2024-03-14 04:32:05'),
	 ('https://i7.bumcheo.info/665/665760/14.jpg
',8,'2024-03-14 04:32:05','2024-03-14 04:32:05');
INSERT INTO test.Comic_Images (url,ChapterId,createdAt,updatedAt) VALUES
	 ('https://i7.bumcheo.info/665/665760/15.jpg
',8,'2024-03-14 04:32:05','2024-03-14 04:32:05'),
	 ('https://i7.bumcheo.info/665/665760/16.jpg
',8,'2024-03-14 04:32:05','2024-03-14 04:32:05'),
	 ('https://i7.bumcheo.info/665/665760/17.jpg
',8,'2024-03-14 04:32:05','2024-03-14 04:32:05'),
	 ('https://i7.bumcheo.info/665/665760/18.jpg
',8,'2024-03-14 04:32:05','2024-03-14 04:32:05'),
	 ('https://i7.bumcheo.info/665/665760/19.jpg
',8,'2024-03-14 04:32:05','2024-03-14 04:32:05'),
	 ('https://i7.bumcheo.info/665/665760/20.jpg
',8,'2024-03-14 04:32:05','2024-03-14 04:32:05'),
	 ('https://i7.bumcheo.info/665/665760/21.jpg
',8,'2024-03-14 04:32:05','2024-03-14 04:32:05'),
	 ('https://i7.bumcheo.info/665/665760/22.jpg
',8,'2024-03-14 04:32:05','2024-03-14 04:32:05'),
	 ('https://i7.bumcheo.info/665/665760/23.jpg
',8,'2024-03-14 04:32:05','2024-03-14 04:32:05'),
	 ('https://i7.bumcheo.info/665/665760/24.jpg
',8,'2024-03-14 04:32:05','2024-03-14 04:32:05');
INSERT INTO test.Comic_Images (url,ChapterId,createdAt,updatedAt) VALUES
	 ('https://i7.bumcheo.info/665/665760/25.jpg
',8,'2024-03-14 04:32:05','2024-03-14 04:32:05'),
	 ('https://i7.bumcheo.info/665/665760/26.jpg
',8,'2024-03-14 04:32:05','2024-03-14 04:32:05'),
	 ('https://i7.bumcheo.info/665/665760/27.jpg
',8,'2024-03-14 04:32:05','2024-03-14 04:32:05'),
	 ('https://i7.bumcheo.info/665/665760/28.jpg
',8,'2024-03-14 04:32:05','2024-03-14 04:32:05'),
	 ('https://i7.bumcheo.info/665/665760/29.jpg
',8,'2024-03-14 04:32:05','2024-03-14 04:32:05'),
	 ('https://i7.bumcheo.info/665/665760/30.jpg
',8,'2024-03-14 04:32:05','2024-03-14 04:32:05'),
	 ('https://i7.bumcheo.info/665/665760/31.jpg
',8,'2024-03-14 04:32:05','2024-03-14 04:32:05'),
	 ('https://i7.bumcheo.info/665/665760/32.jpg
',8,'2024-03-14 04:32:05','2024-03-14 04:32:05'),
	 ('https://i7.bumcheo.info/665/665760/33.jpg
',8,'2024-03-14 04:32:05','2024-03-14 04:32:05'),
	 ('https://i7.bumcheo.info/665/665760/34.jpg
',8,'2024-03-14 04:32:05','2024-03-14 04:32:05');
INSERT INTO test.Comic_Images (url,ChapterId,createdAt,updatedAt) VALUES
	 ('https://i7.bumcheo.info/665/665760/35.jpg
',8,'2024-03-14 04:32:05','2024-03-14 04:32:05'),
	 ('https://i7.bumcheo.info/665/665760/36.jpg
',8,'2024-03-14 04:32:05','2024-03-14 04:32:05'),
	 ('https://i7.bumcheo.info/665/665760/37.jpg
',8,'2024-03-14 04:32:05','2024-03-14 04:32:05'),
	 ('https://i7.bumcheo.info/665/665760/38.jpg
',8,'2024-03-14 04:32:05','2024-03-14 04:32:05'),
	 ('https://i7.bumcheo.info/665/665760/39.jpg
',8,'2024-03-14 04:32:05','2024-03-14 04:32:05'),
	 ('https://i7.bumcheo.info/665/665760/40.jpg
',8,'2024-03-14 04:32:05','2024-03-14 04:32:05'),
	 ('https://i7.bumcheo.info/665/665760/41.jpg
',8,'2024-03-14 04:32:05','2024-03-14 04:32:05'),
	 ('https://i7.bumcheo.info/665/665760/42.jpg
',8,'2024-03-14 04:32:05','2024-03-14 04:32:05'),
	 ('https://i7.bumcheo.info/665/665760/usoguicredit.jpg
',8,'2024-03-14 04:32:05','2024-03-14 04:32:05'),
	 ('https://i7.bumcheo.info/manga/13/13223/0.jpg
',24,'2024-03-14 04:32:52','2024-03-14 04:32:52');
INSERT INTO test.Comic_Images (url,ChapterId,createdAt,updatedAt) VALUES
	 ('https://i7.bumcheo.info/665/665761/1.jpg
',24,'2024-03-14 04:32:52','2024-03-14 04:32:52'),
	 ('https://i7.bumcheo.info/665/665761/2.jpg
',24,'2024-03-14 04:32:52','2024-03-14 04:32:52'),
	 ('https://i7.bumcheo.info/665/665761/3.jpg
',24,'2024-03-14 04:32:52','2024-03-14 04:32:52'),
	 ('https://i7.bumcheo.info/665/665761/4.jpg
',24,'2024-03-14 04:32:52','2024-03-14 04:32:52'),
	 ('https://i7.bumcheo.info/665/665761/5.jpg
',24,'2024-03-14 04:32:52','2024-03-14 04:32:52'),
	 ('https://i7.bumcheo.info/665/665761/6.jpg
',24,'2024-03-14 04:32:52','2024-03-14 04:32:52'),
	 ('https://i7.bumcheo.info/665/665761/7.jpg
',24,'2024-03-14 04:32:52','2024-03-14 04:32:52'),
	 ('https://i7.bumcheo.info/665/665761/8.jpg
',24,'2024-03-14 04:32:52','2024-03-14 04:32:52'),
	 ('https://i7.bumcheo.info/665/665761/9.jpg
',24,'2024-03-14 04:32:52','2024-03-14 04:32:52'),
	 ('https://i7.bumcheo.info/665/665761/10.jpg
',24,'2024-03-14 04:32:52','2024-03-14 04:32:52');
INSERT INTO test.Comic_Images (url,ChapterId,createdAt,updatedAt) VALUES
	 ('https://i7.bumcheo.info/665/665761/11.jpg
',24,'2024-03-14 04:32:52','2024-03-14 04:32:52'),
	 ('https://i7.bumcheo.info/665/665761/12.jpg
',24,'2024-03-14 04:32:52','2024-03-14 04:32:52'),
	 ('https://i7.bumcheo.info/665/665761/13.jpg
',24,'2024-03-14 04:32:52','2024-03-14 04:32:52'),
	 ('https://i7.bumcheo.info/665/665761/14.jpg
',24,'2024-03-14 04:32:52','2024-03-14 04:32:52'),
	 ('https://i7.bumcheo.info/665/665761/15.jpg
',24,'2024-03-14 04:32:52','2024-03-14 04:32:52'),
	 ('https://i7.bumcheo.info/665/665761/16.jpg
',24,'2024-03-14 04:32:52','2024-03-14 04:32:52'),
	 ('https://i7.bumcheo.info/665/665761/17.jpg
',24,'2024-03-14 04:32:52','2024-03-14 04:32:52'),
	 ('https://i7.bumcheo.info/665/665761/18.jpg
',24,'2024-03-14 04:32:52','2024-03-14 04:32:52'),
	 ('https://i7.bumcheo.info/665/665761/19.jpg
',24,'2024-03-14 04:32:52','2024-03-14 04:32:52'),
	 ('https://i7.bumcheo.info/665/665761/20.jpg
',24,'2024-03-14 04:32:52','2024-03-14 04:32:52');
INSERT INTO test.Comic_Images (url,ChapterId,createdAt,updatedAt) VALUES
	 ('https://i7.bumcheo.info/665/665761/21.jpg
',24,'2024-03-14 04:32:52','2024-03-14 04:32:52'),
	 ('https://i7.bumcheo.info/665/665761/22.jpg
',24,'2024-03-14 04:32:52','2024-03-14 04:32:52'),
	 ('https://i7.bumcheo.info/665/665761/23.jpg
',24,'2024-03-14 04:32:52','2024-03-14 04:32:52'),
	 ('https://i7.bumcheo.info/665/665761/24.jpg
',24,'2024-03-14 04:32:52','2024-03-14 04:32:52'),
	 ('https://i7.bumcheo.info/665/665761/25.jpg
',24,'2024-03-14 04:32:52','2024-03-14 04:32:52'),
	 ('https://i7.bumcheo.info/665/665761/26.jpg
',24,'2024-03-14 04:32:52','2024-03-14 04:32:52'),
	 ('https://i7.bumcheo.info/665/665761/27.jpg
',24,'2024-03-14 04:32:52','2024-03-14 04:32:52'),
	 ('https://i7.bumcheo.info/665/665761/28.jpg
',24,'2024-03-14 04:32:52','2024-03-14 04:32:52'),
	 ('https://i7.bumcheo.info/665/665761/29.jpg
',24,'2024-03-14 04:32:52','2024-03-14 04:32:52'),
	 ('https://i7.bumcheo.info/665/665761/30.jpg
',24,'2024-03-14 04:32:52','2024-03-14 04:32:52');
INSERT INTO test.Comic_Images (url,ChapterId,createdAt,updatedAt) VALUES
	 ('https://i7.bumcheo.info/665/665761/usoguicredit.jpg
',24,'2024-03-14 04:32:52','2024-03-14 04:32:52'),
	 ('https://i7.bumcheo.info/manga/13/13223/1.png
',24,'2024-03-14 04:32:52','2024-03-14 04:32:52'),
	 ('https://blogtruyen.vn/content/images/chapter-error.png
',24,'2024-03-14 04:32:52','2024-03-14 04:32:52'),
	 ('https://blogtruyen.vn/content/images/chapter-fix.png
',24,'2024-03-14 04:32:52','2024-03-14 04:32:52'),
	 ('https://i7.bumcheo.info/avatar/259/259301/untitled1.thumb_64x64.png
',24,'2024-03-14 04:32:52','2024-03-14 04:32:52'),
	 ('https://4.bp.blogspot.com/-678pJfhjGus/TxaJmHNhXUI/AAAAAAAAFWI/uVL_1LLkdKc/Upanhso.tk-1.gif',24,'2024-03-14 04:32:52','2024-03-14 04:32:52'),
	 ('https://i7.bumcheo.info/manga/13/13223/0.jpg
',25,'2024-03-14 04:33:12','2024-03-14 04:33:12'),
	 ('https://i7.bumcheo.info/665/665762/1.jpg
',25,'2024-03-14 04:33:12','2024-03-14 04:33:12'),
	 ('https://i7.bumcheo.info/665/665762/2.jpg
',25,'2024-03-14 04:33:12','2024-03-14 04:33:12'),
	 ('https://i7.bumcheo.info/665/665762/3.jpg
',25,'2024-03-14 04:33:12','2024-03-14 04:33:12');
INSERT INTO test.Comic_Images (url,ChapterId,createdAt,updatedAt) VALUES
	 ('https://i7.bumcheo.info/665/665762/4.jpg
',25,'2024-03-14 04:33:12','2024-03-14 04:33:12'),
	 ('https://i7.bumcheo.info/665/665762/5.jpg
',25,'2024-03-14 04:33:12','2024-03-14 04:33:12'),
	 ('https://i7.bumcheo.info/665/665762/6.jpg
',25,'2024-03-14 04:33:12','2024-03-14 04:33:12'),
	 ('https://i7.bumcheo.info/665/665762/7.jpg
',25,'2024-03-14 04:33:12','2024-03-14 04:33:12'),
	 ('https://i7.bumcheo.info/665/665762/8.jpg
',25,'2024-03-14 04:33:12','2024-03-14 04:33:12'),
	 ('https://i7.bumcheo.info/665/665762/9.jpg
',25,'2024-03-14 04:33:12','2024-03-14 04:33:12'),
	 ('https://i7.bumcheo.info/665/665762/10.jpg
',25,'2024-03-14 04:33:12','2024-03-14 04:33:12'),
	 ('https://i7.bumcheo.info/665/665762/11.jpg
',25,'2024-03-14 04:33:12','2024-03-14 04:33:12'),
	 ('https://i7.bumcheo.info/665/665762/12.jpg
',25,'2024-03-14 04:33:12','2024-03-14 04:33:12'),
	 ('https://i7.bumcheo.info/665/665762/13.jpg
',25,'2024-03-14 04:33:12','2024-03-14 04:33:12');
INSERT INTO test.Comic_Images (url,ChapterId,createdAt,updatedAt) VALUES
	 ('https://i7.bumcheo.info/665/665762/14.jpg
',25,'2024-03-14 04:33:12','2024-03-14 04:33:12'),
	 ('https://i7.bumcheo.info/665/665762/15.jpg
',25,'2024-03-14 04:33:12','2024-03-14 04:33:12'),
	 ('https://i7.bumcheo.info/665/665762/16.jpg
',25,'2024-03-14 04:33:12','2024-03-14 04:33:12'),
	 ('https://i7.bumcheo.info/665/665762/17.jpg
',25,'2024-03-14 04:33:12','2024-03-14 04:33:12'),
	 ('https://i7.bumcheo.info/665/665762/18.jpg
',25,'2024-03-14 04:33:12','2024-03-14 04:33:12'),
	 ('https://i7.bumcheo.info/665/665762/19.jpg
',25,'2024-03-14 04:33:12','2024-03-14 04:33:12'),
	 ('https://i7.bumcheo.info/665/665762/20.jpg
',25,'2024-03-14 04:33:12','2024-03-14 04:33:12'),
	 ('https://i7.bumcheo.info/665/665762/21.jpg
',25,'2024-03-14 04:33:12','2024-03-14 04:33:12'),
	 ('https://i7.bumcheo.info/665/665762/usoguicredit.jpg
',25,'2024-03-14 04:33:12','2024-03-14 04:33:12'),
	 ('https://i7.bumcheo.info/manga/13/13223/1.png
',25,'2024-03-14 04:33:12','2024-03-14 04:33:12');
INSERT INTO test.Comic_Images (url,ChapterId,createdAt,updatedAt) VALUES
	 ('https://blogtruyen.vn/content/images/chapter-error.png
',25,'2024-03-14 04:33:12','2024-03-14 04:33:12'),
	 ('https://blogtruyen.vn/content/images/chapter-fix.png',25,'2024-03-14 04:33:12','2024-03-14 04:33:12'),
	 ('https://i7.bumcheo.info/manga/13/13223/0.jpg
',26,'2024-03-14 04:33:36','2024-03-14 04:33:36'),
	 ('https://i7.bumcheo.info/665/665763/2.jpg
',26,'2024-03-14 04:33:36','2024-03-14 04:33:36'),
	 ('https://i7.bumcheo.info/665/665763/1.jpg
',26,'2024-03-14 04:33:36','2024-03-14 04:33:36'),
	 ('https://i7.bumcheo.info/665/665763/4.jpg
',26,'2024-03-14 04:33:36','2024-03-14 04:33:36'),
	 ('https://i7.bumcheo.info/665/665763/3.jpg
',26,'2024-03-14 04:33:36','2024-03-14 04:33:36'),
	 ('https://i7.bumcheo.info/665/665763/5.jpg
',26,'2024-03-14 04:33:36','2024-03-14 04:33:36'),
	 ('https://i7.bumcheo.info/665/665763/6.jpg
',26,'2024-03-14 04:33:36','2024-03-14 04:33:36'),
	 ('https://i7.bumcheo.info/665/665763/7.jpg
',26,'2024-03-14 04:33:36','2024-03-14 04:33:36');
INSERT INTO test.Comic_Images (url,ChapterId,createdAt,updatedAt) VALUES
	 ('https://i7.bumcheo.info/665/665763/8.jpg
',26,'2024-03-14 04:33:36','2024-03-14 04:33:36'),
	 ('https://i7.bumcheo.info/665/665763/9.jpg
',26,'2024-03-14 04:33:36','2024-03-14 04:33:36'),
	 ('https://i7.bumcheo.info/665/665763/10.jpg
',26,'2024-03-14 04:33:36','2024-03-14 04:33:36'),
	 ('https://i7.bumcheo.info/665/665763/11.jpg
',26,'2024-03-14 04:33:36','2024-03-14 04:33:36'),
	 ('https://i7.bumcheo.info/665/665763/12.jpg
',26,'2024-03-14 04:33:36','2024-03-14 04:33:36'),
	 ('https://i7.bumcheo.info/665/665763/13.jpg
',26,'2024-03-14 04:33:36','2024-03-14 04:33:36'),
	 ('https://i7.bumcheo.info/665/665763/14.jpg
',26,'2024-03-14 04:33:36','2024-03-14 04:33:36'),
	 ('https://i7.bumcheo.info/665/665763/15.jpg
',26,'2024-03-14 04:33:36','2024-03-14 04:33:36'),
	 ('https://i7.bumcheo.info/665/665763/16.jpg
',26,'2024-03-14 04:33:36','2024-03-14 04:33:36'),
	 ('https://i7.bumcheo.info/665/665763/17.jpg
',26,'2024-03-14 04:33:36','2024-03-14 04:33:36');
INSERT INTO test.Comic_Images (url,ChapterId,createdAt,updatedAt) VALUES
	 ('https://i7.bumcheo.info/665/665763/usoguicredit.jpg
',26,'2024-03-14 04:33:36','2024-03-14 04:33:36'),
	 ('https://i7.bumcheo.info/manga/13/13223/1.png
',26,'2024-03-14 04:33:36','2024-03-14 04:33:36'),
	 ('https://blogtruyen.vn/content/images/chapter-error.png
',26,'2024-03-14 04:33:36','2024-03-14 04:33:36'),
	 ('https://blogtruyen.vn/content/images/chapter-fix.png
',26,'2024-03-14 04:33:36','2024-03-14 04:33:36'),
	 ('https://i7.bumcheo.info/avatar/261/261582/43c1358fa2aa52215c079f81929265a0.thumb_64x64.jpg',26,'2024-03-14 04:33:36','2024-03-14 04:33:36'),
	 ('https://i7.bumcheo.info/667/667366/1.jpg
',27,'2024-03-14 04:33:58','2024-03-14 04:33:58'),
	 ('https://i7.bumcheo.info/manga/13/13223/0.jpg
',27,'2024-03-14 04:33:58','2024-03-14 04:33:58'),
	 ('https://i7.bumcheo.info/667/667366/2.jpg
',27,'2024-03-14 04:33:58','2024-03-14 04:33:58'),
	 ('https://i7.bumcheo.info/667/667366/3.jpg
',27,'2024-03-14 04:33:58','2024-03-14 04:33:58'),
	 ('https://i7.bumcheo.info/667/667366/4.jpg
',27,'2024-03-14 04:33:58','2024-03-14 04:33:58');
INSERT INTO test.Comic_Images (url,ChapterId,createdAt,updatedAt) VALUES
	 ('https://i7.bumcheo.info/667/667366/5.jpg
',27,'2024-03-14 04:33:58','2024-03-14 04:33:58'),
	 ('https://i7.bumcheo.info/667/667366/6.jpg
',27,'2024-03-14 04:33:58','2024-03-14 04:33:58'),
	 ('https://i7.bumcheo.info/667/667366/7.jpg
',27,'2024-03-14 04:33:58','2024-03-14 04:33:58'),
	 ('https://i7.bumcheo.info/667/667366/8.jpg
',27,'2024-03-14 04:33:58','2024-03-14 04:33:58'),
	 ('https://i7.bumcheo.info/667/667366/9.jpg
',27,'2024-03-14 04:33:58','2024-03-14 04:33:58'),
	 ('https://i7.bumcheo.info/667/667366/10.jpg
',27,'2024-03-14 04:33:58','2024-03-14 04:33:58'),
	 ('https://i7.bumcheo.info/667/667366/11.jpg
',27,'2024-03-14 04:33:58','2024-03-14 04:33:58'),
	 ('https://i7.bumcheo.info/667/667366/12.jpg
',27,'2024-03-14 04:33:58','2024-03-14 04:33:58'),
	 ('https://i7.bumcheo.info/667/667366/13.jpg
',27,'2024-03-14 04:33:58','2024-03-14 04:33:58'),
	 ('https://i7.bumcheo.info/667/667366/14.jpg
',27,'2024-03-14 04:33:58','2024-03-14 04:33:58');
INSERT INTO test.Comic_Images (url,ChapterId,createdAt,updatedAt) VALUES
	 ('https://i7.bumcheo.info/667/667366/15.jpg
',27,'2024-03-14 04:33:58','2024-03-14 04:33:58'),
	 ('https://i7.bumcheo.info/667/667366/16.jpg
',27,'2024-03-14 04:33:58','2024-03-14 04:33:58'),
	 ('https://i7.bumcheo.info/667/667366/17.jpg
',27,'2024-03-14 04:33:58','2024-03-14 04:33:58'),
	 ('https://i7.bumcheo.info/667/667366/usoguicredit.jpg
',27,'2024-03-14 04:33:58','2024-03-14 04:33:58'),
	 ('https://i7.bumcheo.info/manga/13/13223/1.png
',27,'2024-03-14 04:33:58','2024-03-14 04:33:58'),
	 ('https://blogtruyen.vn/content/images/chapter-error.png
',27,'2024-03-14 04:33:58','2024-03-14 04:33:58'),
	 ('https://blogtruyen.vn/content/images/chapter-fix.png',27,'2024-03-14 04:33:58','2024-03-14 04:33:58'),
	 ('https://i8.bumcheo.info/849/849615/001-c3b4238.jpg?v=1707239083
',28,'2024-03-14 04:38:25','2024-03-14 04:38:25'),
	 ('https://i7.bumcheo.info/manga/13/13223/0.jpg
',28,'2024-03-14 04:38:25','2024-03-14 04:38:25'),
	 ('https://i8.bumcheo.info/849/849615/002-f8d6502.jpg?v=1707239084
',28,'2024-03-14 04:38:25','2024-03-14 04:38:25');
INSERT INTO test.Comic_Images (url,ChapterId,createdAt,updatedAt) VALUES
	 ('https://i8.bumcheo.info/849/849615/003-ac4bab2.jpg?v=1707239083
',28,'2024-03-14 04:38:25','2024-03-14 04:38:25'),
	 ('https://i8.bumcheo.info/849/849615/004-33f712d.jpg?v=1707239083
',28,'2024-03-14 04:38:25','2024-03-14 04:38:25'),
	 ('https://i8.bumcheo.info/849/849615/005-a67f9e4.jpg?v=1707239083
',28,'2024-03-14 04:38:25','2024-03-14 04:38:25'),
	 ('https://i8.bumcheo.info/849/849615/006-1ac1437.jpg?v=1707239084
',28,'2024-03-14 04:38:25','2024-03-14 04:38:25'),
	 ('https://i8.bumcheo.info/849/849615/007-b4b2e8c.jpg?v=1707239084
',28,'2024-03-14 04:38:25','2024-03-14 04:38:25'),
	 ('https://i8.bumcheo.info/849/849615/008-b044e56.jpg?v=1707239084
',28,'2024-03-14 04:38:25','2024-03-14 04:38:25'),
	 ('https://i8.bumcheo.info/849/849615/009-f27667e.jpg?v=1707239084
',28,'2024-03-14 04:38:25','2024-03-14 04:38:25'),
	 ('https://i8.bumcheo.info/849/849615/010-2d706c7.jpg?v=1707239084
',28,'2024-03-14 04:38:25','2024-03-14 04:38:25'),
	 ('https://i8.bumcheo.info/849/849615/011-f1b6c36.jpg?v=1707239084
',28,'2024-03-14 04:38:25','2024-03-14 04:38:25'),
	 ('https://i8.bumcheo.info/849/849615/012-a978589.jpg?v=1707239085
',28,'2024-03-14 04:38:25','2024-03-14 04:38:25');
INSERT INTO test.Comic_Images (url,ChapterId,createdAt,updatedAt) VALUES
	 ('https://i8.bumcheo.info/849/849615/013-9e9b404.jpg?v=1707239085
',28,'2024-03-14 04:38:25','2024-03-14 04:38:25'),
	 ('https://i8.bumcheo.info/849/849615/014-c099681.jpg?v=1707239085
',28,'2024-03-14 04:38:25','2024-03-14 04:38:25'),
	 ('https://i8.bumcheo.info/849/849615/015-ebc9495.jpg?v=1707239085
',28,'2024-03-14 04:38:25','2024-03-14 04:38:25'),
	 ('https://i8.bumcheo.info/849/849615/016-f20639c.jpg?v=1707239085
',28,'2024-03-14 04:38:25','2024-03-14 04:38:25'),
	 ('https://i8.bumcheo.info/849/849615/017-2106a99.jpg?v=1707239085
',28,'2024-03-14 04:38:25','2024-03-14 04:38:25'),
	 ('https://i8.bumcheo.info/849/849615/018-76b1391.jpg?v=1707239085
',28,'2024-03-14 04:38:25','2024-03-14 04:38:25'),
	 ('https://i8.bumcheo.info/849/849615/019-f64bdae.jpg?v=1707239085
',28,'2024-03-14 04:38:25','2024-03-14 04:38:25'),
	 ('https://i8.bumcheo.info/849/849615/020-6be623d.jpg?v=1707239085
',28,'2024-03-14 04:38:25','2024-03-14 04:38:25'),
	 ('https://i8.bumcheo.info/849/849615/022-c135a6a.jpg?v=1707239085
',28,'2024-03-14 04:38:25','2024-03-14 04:38:25'),
	 ('https://i7.bumcheo.info/manga/13/13223/1.png
',28,'2024-03-14 04:38:25','2024-03-14 04:38:25');
INSERT INTO test.Comic_Images (url,ChapterId,createdAt,updatedAt) VALUES
	 ('https://blogtruyen.vn/content/images/chapter-error.png
',28,'2024-03-14 04:38:25','2024-03-14 04:38:25'),
	 ('https://blogtruyen.vn/content/images/chapter-fix.png',28,'2024-03-14 04:38:25','2024-03-14 04:38:25'),
	 ('https://i8.bumcheo.info/849/849616/001-de1fcd6.jpg?v=1707239101
',29,'2024-03-14 04:38:51','2024-03-14 04:38:51'),
	 ('https://i8.bumcheo.info/849/849616/002-d72a8e9.jpg?v=1707239101
',29,'2024-03-14 04:38:51','2024-03-14 04:38:51'),
	 ('https://i7.bumcheo.info/manga/13/13223/0.jpg
',29,'2024-03-14 04:38:51','2024-03-14 04:38:51'),
	 ('https://i8.bumcheo.info/849/849616/003-221896f.jpg?v=1707239101
',29,'2024-03-14 04:38:51','2024-03-14 04:38:51'),
	 ('https://i8.bumcheo.info/849/849616/004-8719948.jpg?v=1707239101
',29,'2024-03-14 04:38:51','2024-03-14 04:38:51'),
	 ('https://i8.bumcheo.info/849/849616/005-aaac722.jpg?v=1707239101
',29,'2024-03-14 04:38:51','2024-03-14 04:38:51'),
	 ('https://i8.bumcheo.info/849/849616/006-7259e7c.jpg?v=1707239101
',29,'2024-03-14 04:38:51','2024-03-14 04:38:51'),
	 ('https://i8.bumcheo.info/849/849616/007-25604a8.jpg?v=1707239102
',29,'2024-03-14 04:38:51','2024-03-14 04:38:51');
INSERT INTO test.Comic_Images (url,ChapterId,createdAt,updatedAt) VALUES
	 ('https://i8.bumcheo.info/849/849616/008-278b63c.jpg?v=1707239102
',29,'2024-03-14 04:38:51','2024-03-14 04:38:51'),
	 ('https://i8.bumcheo.info/849/849616/009-c24c7a6.jpg?v=1707239102
',29,'2024-03-14 04:38:51','2024-03-14 04:38:51'),
	 ('https://i8.bumcheo.info/849/849616/010-bfd9fb8.jpg?v=1707239102
',29,'2024-03-14 04:38:51','2024-03-14 04:38:51'),
	 ('https://i8.bumcheo.info/849/849616/011-8768e3d.jpg?v=1707239102
',29,'2024-03-14 04:38:51','2024-03-14 04:38:51'),
	 ('https://i8.bumcheo.info/849/849616/012-57239d7.jpg?v=1707239102
',29,'2024-03-14 04:38:51','2024-03-14 04:38:51'),
	 ('https://i8.bumcheo.info/849/849616/013-034be75.jpg?v=1707239103
',29,'2024-03-14 04:38:51','2024-03-14 04:38:51'),
	 ('https://i8.bumcheo.info/849/849616/014-a4caa91.jpg?v=1707239103
',29,'2024-03-14 04:38:51','2024-03-14 04:38:51'),
	 ('https://i8.bumcheo.info/849/849616/015-57d5750.jpg?v=1707239103
',29,'2024-03-14 04:38:51','2024-03-14 04:38:51'),
	 ('https://i8.bumcheo.info/849/849616/016-e8d683f.jpg?v=1707239103
',29,'2024-03-14 04:38:51','2024-03-14 04:38:51'),
	 ('https://i8.bumcheo.info/849/849616/017-65cdc19.jpg?v=1707239103
',29,'2024-03-14 04:38:51','2024-03-14 04:38:51');
INSERT INTO test.Comic_Images (url,ChapterId,createdAt,updatedAt) VALUES
	 ('https://i8.bumcheo.info/849/849616/018-87da937.jpg?v=1707239103
',29,'2024-03-14 04:38:51','2024-03-14 04:38:51'),
	 ('https://i8.bumcheo.info/849/849616/019-2880c58.jpg?v=1707239103
',29,'2024-03-14 04:38:51','2024-03-14 04:38:51'),
	 ('https://i8.bumcheo.info/849/849616/020-80ec30f.jpg?v=1707239103
',29,'2024-03-14 04:38:51','2024-03-14 04:38:51'),
	 ('https://i8.bumcheo.info/849/849616/022-b6dbf0c.jpg?v=1707239103
',29,'2024-03-14 04:38:51','2024-03-14 04:38:51'),
	 ('https://i7.bumcheo.info/manga/13/13223/1.png
',29,'2024-03-14 04:38:51','2024-03-14 04:38:51'),
	 ('https://blogtruyen.vn/content/images/chapter-error.png
',29,'2024-03-14 04:38:51','2024-03-14 04:38:51'),
	 ('https://blogtruyen.vn/content/images/chapter-fix.png',29,'2024-03-14 04:38:51','2024-03-14 04:38:51'),
	 ('https://i3.bumcheo2.info/253/253628/000a-copy.jpg
',30,'2024-03-14 04:42:46','2024-03-14 04:42:46'),
	 ('https://i7.bumcheo.info/manga/13/13223/0.jpg
',30,'2024-03-14 04:42:46','2024-03-14 04:42:46'),
	 ('https://i3.bumcheo2.info/253/253628/1.jpg
',30,'2024-03-14 04:42:46','2024-03-14 04:42:46');
INSERT INTO test.Comic_Images (url,ChapterId,createdAt,updatedAt) VALUES
	 ('https://i3.bumcheo2.info/253/253628/2-3.jpg
',30,'2024-03-14 04:42:46','2024-03-14 04:42:46'),
	 ('https://i3.bumcheo2.info/253/253628/4.jpg
',30,'2024-03-14 04:42:46','2024-03-14 04:42:46'),
	 ('https://i3.bumcheo2.info/253/253628/5.jpg
',30,'2024-03-14 04:42:46','2024-03-14 04:42:46'),
	 ('https://i3.bumcheo2.info/253/253628/6.jpg
',30,'2024-03-14 04:42:46','2024-03-14 04:42:46'),
	 ('https://i3.bumcheo2.info/253/253628/7.jpg
',30,'2024-03-14 04:42:46','2024-03-14 04:42:46'),
	 ('https://i3.bumcheo2.info/253/253628/8.jpg
',30,'2024-03-14 04:42:46','2024-03-14 04:42:46'),
	 ('https://i3.bumcheo2.info/253/253628/9.jpg
',30,'2024-03-14 04:42:46','2024-03-14 04:42:46'),
	 ('https://i3.bumcheo2.info/253/253628/10.jpg
',30,'2024-03-14 04:42:46','2024-03-14 04:42:46'),
	 ('https://i3.bumcheo2.info/253/253628/11.jpg
',30,'2024-03-14 04:42:46','2024-03-14 04:42:46'),
	 ('https://i3.bumcheo2.info/253/253628/12.jpg
',30,'2024-03-14 04:42:46','2024-03-14 04:42:46');
INSERT INTO test.Comic_Images (url,ChapterId,createdAt,updatedAt) VALUES
	 ('https://i3.bumcheo2.info/253/253628/13.jpg
',30,'2024-03-14 04:42:46','2024-03-14 04:42:46'),
	 ('https://i3.bumcheo2.info/253/253628/14.jpg
',30,'2024-03-14 04:42:46','2024-03-14 04:42:46'),
	 ('https://i3.bumcheo2.info/253/253628/15.jpg
',30,'2024-03-14 04:42:46','2024-03-14 04:42:46'),
	 ('https://i3.bumcheo2.info/253/253628/16.jpg
',30,'2024-03-14 04:42:46','2024-03-14 04:42:46'),
	 ('https://i3.bumcheo2.info/253/253628/17.jpg
',30,'2024-03-14 04:42:46','2024-03-14 04:42:46'),
	 ('https://i3.bumcheo2.info/253/253628/18.jpg
',30,'2024-03-14 04:42:46','2024-03-14 04:42:46'),
	 ('https://i3.bumcheo2.info/253/253628/19.jpg
',30,'2024-03-14 04:42:46','2024-03-14 04:42:46'),
	 ('https://i3.bumcheo2.info/253/253628/20.jpg
',30,'2024-03-14 04:42:46','2024-03-14 04:42:46'),
	 ('https://i3.bumcheo2.info/253/253628/21.jpg
',30,'2024-03-14 04:42:46','2024-03-14 04:42:46'),
	 ('https://i3.bumcheo2.info/253/253628/22.jpg
',30,'2024-03-14 04:42:46','2024-03-14 04:42:46');
INSERT INTO test.Comic_Images (url,ChapterId,createdAt,updatedAt) VALUES
	 ('https://i3.bumcheo2.info/253/253628/23.jpg
',30,'2024-03-14 04:42:46','2024-03-14 04:42:46'),
	 ('https://i3.bumcheo2.info/253/253628/24.jpg
',30,'2024-03-14 04:42:46','2024-03-14 04:42:46'),
	 ('https://i3.bumcheo2.info/253/253628/25.jpg
',30,'2024-03-14 04:42:46','2024-03-14 04:42:46'),
	 ('https://i3.bumcheo2.info/253/253628/26.jpg
',30,'2024-03-14 04:42:46','2024-03-14 04:42:46'),
	 ('https://i3.bumcheo2.info/253/253628/27.jpg
',30,'2024-03-14 04:42:46','2024-03-14 04:42:46'),
	 ('https://i3.bumcheo2.info/253/253628/28.jpg
',30,'2024-03-14 04:42:46','2024-03-14 04:42:46'),
	 ('https://i3.bumcheo2.info/253/253628/29.jpg
',30,'2024-03-14 04:42:46','2024-03-14 04:42:46'),
	 ('https://i3.bumcheo2.info/253/253628/30.jpg
',30,'2024-03-14 04:42:46','2024-03-14 04:42:46'),
	 ('https://i3.bumcheo2.info/253/253628/31.jpg
',30,'2024-03-14 04:42:46','2024-03-14 04:42:46'),
	 ('https://i3.bumcheo2.info/253/253628/32.jpg
',30,'2024-03-14 04:42:46','2024-03-14 04:42:46');
INSERT INTO test.Comic_Images (url,ChapterId,createdAt,updatedAt) VALUES
	 ('https://i3.bumcheo2.info/253/253628/33.jpg
',30,'2024-03-14 04:42:46','2024-03-14 04:42:46'),
	 ('https://i3.bumcheo2.info/253/253628/34.jpg
',30,'2024-03-14 04:42:46','2024-03-14 04:42:46'),
	 ('https://i3.bumcheo2.info/253/253628/35.jpg
',30,'2024-03-14 04:42:46','2024-03-14 04:42:46'),
	 ('https://i3.bumcheo2.info/253/253628/36.jpg
',30,'2024-03-14 04:42:46','2024-03-14 04:42:46'),
	 ('https://i3.bumcheo2.info/253/253628/37.jpg
',30,'2024-03-14 04:42:46','2024-03-14 04:42:46'),
	 ('https://i3.bumcheo2.info/253/253628/38.jpg
',30,'2024-03-14 04:42:46','2024-03-14 04:42:46'),
	 ('https://i3.bumcheo2.info/253/253628/39.jpg
',30,'2024-03-14 04:42:46','2024-03-14 04:42:46'),
	 ('https://i7.bumcheo.info/manga/13/13223/1.png
',30,'2024-03-14 04:42:46','2024-03-14 04:42:46'),
	 ('http://blogtruyenvn.com/content/images/chapter-error.png
',30,'2024-03-14 04:42:46','2024-03-14 04:42:46'),
	 ('http://blogtruyenvn.com/content/images/chapter-fix.png
',30,'2024-03-14 04:42:46','2024-03-14 04:42:46');
INSERT INTO test.Comic_Images (url,ChapterId,createdAt,updatedAt) VALUES
	 ('http://i7.bumcheo.info/avatar/noavatar/noavatar.thumb_64x64.png',30,'2024-03-14 04:42:46','2024-03-14 04:42:46'),
	 ('https://i3.bumcheo2.info/254/254501/000a-copy.jpg
',31,'2024-03-14 04:43:07','2024-03-14 04:43:07'),
	 ('https://i3.bumcheo2.info/254/254501/6.jpg
',31,'2024-03-14 04:43:07','2024-03-14 04:43:07'),
	 ('https://i7.bumcheo.info/manga/13/13223/0.jpg
',31,'2024-03-14 04:43:07','2024-03-14 04:43:07'),
	 ('https://i3.bumcheo2.info/254/254501/8.jpg
',31,'2024-03-14 04:43:07','2024-03-14 04:43:07'),
	 ('https://i3.bumcheo2.info/254/254501/7.jpg
',31,'2024-03-14 04:43:07','2024-03-14 04:43:07'),
	 ('https://i3.bumcheo2.info/254/254501/9.jpg
',31,'2024-03-14 04:43:07','2024-03-14 04:43:07'),
	 ('https://i3.bumcheo2.info/254/254501/10.jpg
',31,'2024-03-14 04:43:07','2024-03-14 04:43:07'),
	 ('https://i3.bumcheo2.info/254/254501/11.jpg
',31,'2024-03-14 04:43:07','2024-03-14 04:43:07'),
	 ('https://i3.bumcheo2.info/254/254501/12.jpg
',31,'2024-03-14 04:43:07','2024-03-14 04:43:07');
INSERT INTO test.Comic_Images (url,ChapterId,createdAt,updatedAt) VALUES
	 ('https://i3.bumcheo2.info/254/254501/13.jpg
',31,'2024-03-14 04:43:07','2024-03-14 04:43:07'),
	 ('https://i3.bumcheo2.info/254/254501/14.jpg
',31,'2024-03-14 04:43:07','2024-03-14 04:43:07'),
	 ('https://i3.bumcheo2.info/254/254501/15.jpg
',31,'2024-03-14 04:43:07','2024-03-14 04:43:07'),
	 ('https://i3.bumcheo2.info/254/254501/16.jpg
',31,'2024-03-14 04:43:07','2024-03-14 04:43:07'),
	 ('https://i3.bumcheo2.info/254/254501/17.jpg
',31,'2024-03-14 04:43:07','2024-03-14 04:43:07'),
	 ('https://i3.bumcheo2.info/254/254501/18.jpg
',31,'2024-03-14 04:43:07','2024-03-14 04:43:07'),
	 ('https://i3.bumcheo2.info/254/254501/19.jpg
',31,'2024-03-14 04:43:07','2024-03-14 04:43:07'),
	 ('https://i3.bumcheo2.info/254/254501/20.jpg
',31,'2024-03-14 04:43:07','2024-03-14 04:43:07'),
	 ('https://i3.bumcheo2.info/254/254501/21.jpg
',31,'2024-03-14 04:43:07','2024-03-14 04:43:07'),
	 ('https://i3.bumcheo2.info/254/254501/22.jpg
',31,'2024-03-14 04:43:07','2024-03-14 04:43:07');
INSERT INTO test.Comic_Images (url,ChapterId,createdAt,updatedAt) VALUES
	 ('https://i3.bumcheo2.info/254/254501/23.jpg
',31,'2024-03-14 04:43:07','2024-03-14 04:43:07'),
	 ('https://i3.bumcheo2.info/254/254501/24.jpg
',31,'2024-03-14 04:43:07','2024-03-14 04:43:07'),
	 ('https://i3.bumcheo2.info/254/254501/25.jpg
',31,'2024-03-14 04:43:07','2024-03-14 04:43:07'),
	 ('https://i3.bumcheo2.info/254/254501/26.jpg
',31,'2024-03-14 04:43:07','2024-03-14 04:43:07'),
	 ('https://i3.bumcheo2.info/254/254501/27.jpg
',31,'2024-03-14 04:43:07','2024-03-14 04:43:07'),
	 ('https://i3.bumcheo2.info/254/254501/28.jpg
',31,'2024-03-14 04:43:07','2024-03-14 04:43:07'),
	 ('https://i3.bumcheo2.info/254/254501/29.jpg
',31,'2024-03-14 04:43:07','2024-03-14 04:43:07'),
	 ('https://i3.bumcheo2.info/254/254501/30.jpg
',31,'2024-03-14 04:43:07','2024-03-14 04:43:07'),
	 ('https://i3.bumcheo2.info/254/254501/31.jpg
',31,'2024-03-14 04:43:07','2024-03-14 04:43:07'),
	 ('https://i3.bumcheo2.info/254/254501/32.jpg
',31,'2024-03-14 04:43:07','2024-03-14 04:43:07');
INSERT INTO test.Comic_Images (url,ChapterId,createdAt,updatedAt) VALUES
	 ('https://i3.bumcheo2.info/254/254501/33.jpg
',31,'2024-03-14 04:43:07','2024-03-14 04:43:07'),
	 ('https://i3.bumcheo2.info/254/254501/34.jpg
',31,'2024-03-14 04:43:07','2024-03-14 04:43:07'),
	 ('https://i3.bumcheo2.info/254/254501/35.jpg
',31,'2024-03-14 04:43:07','2024-03-14 04:43:07'),
	 ('https://i3.bumcheo2.info/254/254501/36.jpg
',31,'2024-03-14 04:43:07','2024-03-14 04:43:07'),
	 ('https://i3.bumcheo2.info/254/254501/37.jpg
',31,'2024-03-14 04:43:07','2024-03-14 04:43:07'),
	 ('https://i3.bumcheo2.info/254/254501/38.jpg
',31,'2024-03-14 04:43:07','2024-03-14 04:43:07'),
	 ('https://i3.bumcheo2.info/254/254501/39.jpg
',31,'2024-03-14 04:43:07','2024-03-14 04:43:07'),
	 ('https://i3.bumcheo2.info/254/254501/40.jpg
',31,'2024-03-14 04:43:07','2024-03-14 04:43:07'),
	 ('https://i3.bumcheo2.info/254/254501/41.jpg
',31,'2024-03-14 04:43:07','2024-03-14 04:43:07'),
	 ('https://i3.bumcheo2.info/254/254501/42.jpg
',31,'2024-03-14 04:43:07','2024-03-14 04:43:07');
INSERT INTO test.Comic_Images (url,ChapterId,createdAt,updatedAt) VALUES
	 ('https://i3.bumcheo2.info/254/254501/43.jpg
',31,'2024-03-14 04:43:07','2024-03-14 04:43:07'),
	 ('https://i3.bumcheo2.info/254/254501/44.jpg
',31,'2024-03-14 04:43:07','2024-03-14 04:43:07'),
	 ('https://i3.bumcheo2.info/254/254501/45.jpg
',31,'2024-03-14 04:43:07','2024-03-14 04:43:07'),
	 ('https://i7.bumcheo.info/manga/13/13223/1.png
',31,'2024-03-14 04:43:07','2024-03-14 04:43:07'),
	 ('http://blogtruyenvn.com/content/images/chapter-error.png
',31,'2024-03-14 04:43:07','2024-03-14 04:43:07'),
	 ('http://blogtruyenvn.com/content/images/chapter-fix.png
',31,'2024-03-14 04:43:07','2024-03-14 04:43:07'),
	 ('https://blogtruyen.vn/Content/images/loading.gif',31,'2024-03-14 04:43:07','2024-03-14 04:43:07'),
	 ('https://i7.bumcheo.info/manga/13/13223/0.jpg
',32,'2024-03-14 04:43:25','2024-03-14 04:43:25'),
	 ('https://i3.bumcheo2.info/254/254629/000a-copy.jpg
',32,'2024-03-14 04:43:25','2024-03-14 04:43:25'),
	 ('https://i3.bumcheo2.info/254/254629/46.jpg
',32,'2024-03-14 04:43:25','2024-03-14 04:43:25');
INSERT INTO test.Comic_Images (url,ChapterId,createdAt,updatedAt) VALUES
	 ('https://i3.bumcheo2.info/254/254629/47.jpg
',32,'2024-03-14 04:43:25','2024-03-14 04:43:25'),
	 ('https://i3.bumcheo2.info/254/254629/48.jpg
',32,'2024-03-14 04:43:25','2024-03-14 04:43:25'),
	 ('https://i3.bumcheo2.info/254/254629/49.jpg
',32,'2024-03-14 04:43:25','2024-03-14 04:43:25'),
	 ('https://i3.bumcheo2.info/254/254629/50.jpg
',32,'2024-03-14 04:43:25','2024-03-14 04:43:25'),
	 ('https://i3.bumcheo2.info/254/254629/51.jpg
',32,'2024-03-14 04:43:25','2024-03-14 04:43:25'),
	 ('https://i3.bumcheo2.info/254/254629/52.jpg
',32,'2024-03-14 04:43:25','2024-03-14 04:43:25'),
	 ('https://i3.bumcheo2.info/254/254629/53.jpg
',32,'2024-03-14 04:43:25','2024-03-14 04:43:25'),
	 ('https://i3.bumcheo2.info/254/254629/54.jpg
',32,'2024-03-14 04:43:25','2024-03-14 04:43:25'),
	 ('https://i3.bumcheo2.info/254/254629/55.jpg
',32,'2024-03-14 04:43:25','2024-03-14 04:43:25'),
	 ('https://i3.bumcheo2.info/254/254629/56.jpg
',32,'2024-03-14 04:43:25','2024-03-14 04:43:25');
INSERT INTO test.Comic_Images (url,ChapterId,createdAt,updatedAt) VALUES
	 ('https://i3.bumcheo2.info/254/254629/57.jpg
',32,'2024-03-14 04:43:25','2024-03-14 04:43:25'),
	 ('https://i3.bumcheo2.info/254/254629/58.jpg
',32,'2024-03-14 04:43:25','2024-03-14 04:43:25'),
	 ('https://i3.bumcheo2.info/254/254629/59.jpg
',32,'2024-03-14 04:43:25','2024-03-14 04:43:25'),
	 ('https://i3.bumcheo2.info/254/254629/60.jpg
',32,'2024-03-14 04:43:25','2024-03-14 04:43:25'),
	 ('https://i3.bumcheo2.info/254/254629/61.jpg
',32,'2024-03-14 04:43:25','2024-03-14 04:43:25'),
	 ('https://i3.bumcheo2.info/254/254629/62.jpg
',32,'2024-03-14 04:43:25','2024-03-14 04:43:25'),
	 ('https://i3.bumcheo2.info/254/254629/63.jpg
',32,'2024-03-14 04:43:25','2024-03-14 04:43:25'),
	 ('https://i3.bumcheo2.info/254/254629/64.jpg
',32,'2024-03-14 04:43:25','2024-03-14 04:43:25'),
	 ('https://i3.bumcheo2.info/254/254629/65.jpg
',32,'2024-03-14 04:43:25','2024-03-14 04:43:25'),
	 ('https://i7.bumcheo.info/manga/13/13223/1.png
',32,'2024-03-14 04:43:25','2024-03-14 04:43:25');
INSERT INTO test.Comic_Images (url,ChapterId,createdAt,updatedAt) VALUES
	 ('http://blogtruyenvn.com/content/images/chapter-error.png
',32,'2024-03-14 04:43:25','2024-03-14 04:43:25'),
	 ('http://blogtruyenvn.com/content/images/chapter-fix.png',32,'2024-03-14 04:43:25','2024-03-14 04:43:25'),
	 ('https://i7.bumcheo.info/manga/13/13223/0.jpg
',33,'2024-03-14 04:46:40','2024-03-14 04:46:40'),
	 ('https://i8.bumcheo.info/868/868504/0.jpg?v=1710116746
',33,'2024-03-14 04:46:40','2024-03-14 04:46:40'),
	 ('https://i8.bumcheo.info/868/868504/1.jpg?v=1710116750
',33,'2024-03-14 04:46:40','2024-03-14 04:46:40'),
	 ('https://i8.bumcheo.info/868/868504/2.jpg?v=1710116754
',33,'2024-03-14 04:46:40','2024-03-14 04:46:40'),
	 ('https://i8.bumcheo.info/868/868504/3.jpg?v=1710116758
',33,'2024-03-14 04:46:40','2024-03-14 04:46:40'),
	 ('https://i8.bumcheo.info/868/868504/4.jpg?v=1710116762
',33,'2024-03-14 04:46:40','2024-03-14 04:46:40'),
	 ('https://i8.bumcheo.info/868/868504/5.jpg?v=1710116766
',33,'2024-03-14 04:46:40','2024-03-14 04:46:40'),
	 ('https://i8.bumcheo.info/868/868504/6.jpg?v=1710116770
',33,'2024-03-14 04:46:40','2024-03-14 04:46:40');
INSERT INTO test.Comic_Images (url,ChapterId,createdAt,updatedAt) VALUES
	 ('https://i8.bumcheo.info/868/868504/7.jpg?v=1710116773
',33,'2024-03-14 04:46:40','2024-03-14 04:46:40'),
	 ('https://i8.bumcheo.info/868/868504/8.jpg?v=1710116777
',33,'2024-03-14 04:46:40','2024-03-14 04:46:40'),
	 ('https://i8.bumcheo.info/868/868504/9.jpg?v=1710116781
',33,'2024-03-14 04:46:40','2024-03-14 04:46:40'),
	 ('https://i8.bumcheo.info/868/868504/10.jpg?v=1710116784
',33,'2024-03-14 04:46:40','2024-03-14 04:46:40'),
	 ('https://i8.bumcheo.info/868/868504/11.jpg?v=1710116788
',33,'2024-03-14 04:46:40','2024-03-14 04:46:40'),
	 ('https://i8.bumcheo.info/868/868504/12.jpg?v=1710116792
',33,'2024-03-14 04:46:40','2024-03-14 04:46:40'),
	 ('https://i8.bumcheo.info/868/868504/13.jpg?v=1710116796
',33,'2024-03-14 04:46:40','2024-03-14 04:46:40'),
	 ('https://i8.bumcheo.info/868/868504/14.jpg?v=1710116800
',33,'2024-03-14 04:46:40','2024-03-14 04:46:40'),
	 ('https://i8.bumcheo.info/868/868504/15.jpg?v=1710116804
',33,'2024-03-14 04:46:40','2024-03-14 04:46:40'),
	 ('https://i8.bumcheo.info/868/868504/16.jpg?v=1710116808
',33,'2024-03-14 04:46:40','2024-03-14 04:46:40');
INSERT INTO test.Comic_Images (url,ChapterId,createdAt,updatedAt) VALUES
	 ('https://i8.bumcheo.info/868/868504/17.jpg?v=1710116812
',33,'2024-03-14 04:46:40','2024-03-14 04:46:40'),
	 ('https://i8.bumcheo.info/868/868504/18.jpg?v=1710116815
',33,'2024-03-14 04:46:40','2024-03-14 04:46:40'),
	 ('https://i8.bumcheo.info/868/868504/19.jpg?v=1710116819
',33,'2024-03-14 04:46:40','2024-03-14 04:46:40'),
	 ('https://i8.bumcheo.info/868/868504/20.jpg?v=1710116823
',33,'2024-03-14 04:46:40','2024-03-14 04:46:40'),
	 ('https://i8.bumcheo.info/868/868504/21.jpg?v=1710116827
',33,'2024-03-14 04:46:40','2024-03-14 04:46:40'),
	 ('https://i8.bumcheo.info/868/868504/22.jpg?v=1710116831
',33,'2024-03-14 04:46:40','2024-03-14 04:46:40'),
	 ('https://i8.bumcheo.info/868/868504/23.jpg?v=1710116835
',33,'2024-03-14 04:46:40','2024-03-14 04:46:40'),
	 ('https://i8.bumcheo.info/868/868504/24.jpg?v=1710116839
',33,'2024-03-14 04:46:40','2024-03-14 04:46:40'),
	 ('https://i8.bumcheo.info/868/868504/25.jpg?v=1710116843
',33,'2024-03-14 04:46:40','2024-03-14 04:46:40'),
	 ('https://i8.bumcheo.info/868/868504/26.jpg?v=1710116847
',33,'2024-03-14 04:46:40','2024-03-14 04:46:40');
INSERT INTO test.Comic_Images (url,ChapterId,createdAt,updatedAt) VALUES
	 ('https://i8.bumcheo.info/868/868504/27.jpg?v=1710116851
',33,'2024-03-14 04:46:40','2024-03-14 04:46:40'),
	 ('https://i8.bumcheo.info/868/868504/28.jpg?v=1710116855
',33,'2024-03-14 04:46:40','2024-03-14 04:46:40'),
	 ('https://i8.bumcheo.info/868/868504/29.jpg?v=1710116859
',33,'2024-03-14 04:46:40','2024-03-14 04:46:40'),
	 ('https://i8.bumcheo.info/868/868504/30.jpg?v=1710117035
',33,'2024-03-14 04:46:40','2024-03-14 04:46:40'),
	 ('https://i8.bumcheo.info/868/868504/31.jpg?v=1710117040
',33,'2024-03-14 04:46:40','2024-03-14 04:46:40'),
	 ('https://i8.bumcheo.info/868/868504/32.jpg?v=1710117044
',33,'2024-03-14 04:46:40','2024-03-14 04:46:40'),
	 ('https://i8.bumcheo.info/868/868504/33.jpg?v=1710117048
',33,'2024-03-14 04:46:40','2024-03-14 04:46:40'),
	 ('https://i8.bumcheo.info/868/868504/34.jpg?v=1710117051
',33,'2024-03-14 04:46:40','2024-03-14 04:46:40'),
	 ('https://i8.bumcheo.info/868/868504/35.jpg?v=1710117055
',33,'2024-03-14 04:46:40','2024-03-14 04:46:40'),
	 ('https://i8.bumcheo.info/868/868504/36.jpg?v=1710117059
',33,'2024-03-14 04:46:40','2024-03-14 04:46:40');
INSERT INTO test.Comic_Images (url,ChapterId,createdAt,updatedAt) VALUES
	 ('https://i8.bumcheo.info/868/868504/37.jpg?v=1710117063
',33,'2024-03-14 04:46:40','2024-03-14 04:46:40'),
	 ('https://i8.bumcheo.info/868/868504/38.jpg?v=1710142838
',33,'2024-03-14 04:46:40','2024-03-14 04:46:40'),
	 ('https://i8.bumcheo.info/868/868504/39.jpg?v=1710142975
',33,'2024-03-14 04:46:40','2024-03-14 04:46:40'),
	 ('https://i8.bumcheo.info/868/868504/40.jpg?v=1710142978
',33,'2024-03-14 04:46:40','2024-03-14 04:46:40'),
	 ('https://i8.bumcheo.info/868/868504/41.jpg?v=1710142982
',33,'2024-03-14 04:46:40','2024-03-14 04:46:40'),
	 ('https://i8.bumcheo.info/868/868504/42.jpg?v=1710142986
',33,'2024-03-14 04:46:40','2024-03-14 04:46:40'),
	 ('https://i8.bumcheo.info/868/868504/43.jpg?v=1710142990
',33,'2024-03-14 04:46:40','2024-03-14 04:46:40'),
	 ('https://i8.bumcheo.info/868/868504/44.jpg?v=1710142994
',33,'2024-03-14 04:46:40','2024-03-14 04:46:40'),
	 ('https://i8.bumcheo.info/868/868504/45.jpg?v=1710142997
',33,'2024-03-14 04:46:40','2024-03-14 04:46:40'),
	 ('https://i8.bumcheo.info/868/868504/46.jpg?v=1710143001
',33,'2024-03-14 04:46:40','2024-03-14 04:46:40');
INSERT INTO test.Comic_Images (url,ChapterId,createdAt,updatedAt) VALUES
	 ('https://i8.bumcheo.info/868/868504/47.jpg?v=1710143005
',33,'2024-03-14 04:46:40','2024-03-14 04:46:40'),
	 ('https://i8.bumcheo.info/868/868504/48.jpg?v=1710143009
',33,'2024-03-14 04:46:40','2024-03-14 04:46:40'),
	 ('https://i8.bumcheo.info/868/868504/49.jpg?v=1710143013
',33,'2024-03-14 04:46:40','2024-03-14 04:46:40'),
	 ('https://i8.bumcheo.info/868/868504/50.jpg?v=1710143017
',33,'2024-03-14 04:46:40','2024-03-14 04:46:40'),
	 ('https://i8.bumcheo.info/868/868504/51.jpg?v=1710143021
',33,'2024-03-14 04:46:40','2024-03-14 04:46:40'),
	 ('https://i8.bumcheo.info/868/868504/52.jpg?v=1710143025
',33,'2024-03-14 04:46:40','2024-03-14 04:46:40'),
	 ('https://i8.bumcheo.info/868/868504/53.jpg?v=1710143028
',33,'2024-03-14 04:46:40','2024-03-14 04:46:40'),
	 ('https://i8.bumcheo.info/868/868504/54.jpg?v=1710143033
',33,'2024-03-14 04:46:40','2024-03-14 04:46:40'),
	 ('https://i7.bumcheo.info/manga/13/13223/1.png
',33,'2024-03-14 04:46:40','2024-03-14 04:46:40'),
	 ('https://blogtruyen.vn/content/images/chapter-error.png
',33,'2024-03-14 04:46:40','2024-03-14 04:46:40');
INSERT INTO test.Comic_Images (url,ChapterId,createdAt,updatedAt) VALUES
	 ('https://blogtruyen.vn/content/images/chapter-fix.png',33,'2024-03-14 04:46:40','2024-03-14 04:46:40'),
	 ('https://i8.bumcheo.info/868/868557/0.jpg?v=1710143051
',34,'2024-03-14 04:47:00','2024-03-14 04:47:00'),
	 ('https://i7.bumcheo.info/manga/13/13223/0.jpg
',34,'2024-03-14 04:47:00','2024-03-14 04:47:00'),
	 ('https://i8.bumcheo.info/868/868557/1.jpg?v=1710143055
',34,'2024-03-14 04:47:00','2024-03-14 04:47:00'),
	 ('https://i8.bumcheo.info/868/868557/2.jpg?v=1710143059
',34,'2024-03-14 04:47:00','2024-03-14 04:47:00'),
	 ('https://i8.bumcheo.info/868/868557/3.jpg?v=1710143062
',34,'2024-03-14 04:47:00','2024-03-14 04:47:00'),
	 ('https://i8.bumcheo.info/868/868557/4.jpg?v=1710143067
',34,'2024-03-14 04:47:00','2024-03-14 04:47:00'),
	 ('https://i8.bumcheo.info/868/868557/5.jpg?v=1710143070
',34,'2024-03-14 04:47:00','2024-03-14 04:47:00'),
	 ('https://i8.bumcheo.info/868/868557/6.jpg?v=1710143081
',34,'2024-03-14 04:47:00','2024-03-14 04:47:00'),
	 ('https://i8.bumcheo.info/868/868557/7.jpg?v=1710143085
',34,'2024-03-14 04:47:00','2024-03-14 04:47:00');
INSERT INTO test.Comic_Images (url,ChapterId,createdAt,updatedAt) VALUES
	 ('https://i8.bumcheo.info/868/868557/8.jpg?v=1710143089
',34,'2024-03-14 04:47:00','2024-03-14 04:47:00'),
	 ('https://i8.bumcheo.info/868/868557/9.jpg?v=1710143093
',34,'2024-03-14 04:47:00','2024-03-14 04:47:00'),
	 ('https://i8.bumcheo.info/868/868557/10.jpg?v=1710143155
',34,'2024-03-14 04:47:00','2024-03-14 04:47:00'),
	 ('https://i8.bumcheo.info/868/868557/11.jpg?v=1710143162
',34,'2024-03-14 04:47:00','2024-03-14 04:47:00'),
	 ('https://i8.bumcheo.info/868/868557/12.jpg?v=1710143167
',34,'2024-03-14 04:47:00','2024-03-14 04:47:00'),
	 ('https://i8.bumcheo.info/868/868557/13.jpg?v=1710143171
',34,'2024-03-14 04:47:00','2024-03-14 04:47:00'),
	 ('https://i8.bumcheo.info/868/868557/14.jpg?v=1710143174
',34,'2024-03-14 04:47:00','2024-03-14 04:47:00'),
	 ('https://i8.bumcheo.info/868/868557/15.jpg?v=1710143178
',34,'2024-03-14 04:47:00','2024-03-14 04:47:00'),
	 ('https://i8.bumcheo.info/868/868557/16.jpg?v=1710143182
',34,'2024-03-14 04:47:00','2024-03-14 04:47:00'),
	 ('https://i8.bumcheo.info/868/868557/17.jpg?v=1710143186
',34,'2024-03-14 04:47:00','2024-03-14 04:47:00');
INSERT INTO test.Comic_Images (url,ChapterId,createdAt,updatedAt) VALUES
	 ('https://i8.bumcheo.info/868/868557/18.jpg?v=1710143190
',34,'2024-03-14 04:47:00','2024-03-14 04:47:00'),
	 ('https://i8.bumcheo.info/868/868557/19.jpg?v=1710143194
',34,'2024-03-14 04:47:00','2024-03-14 04:47:00'),
	 ('https://i8.bumcheo.info/868/868557/20.jpg?v=1710143198
',34,'2024-03-14 04:47:00','2024-03-14 04:47:00'),
	 ('https://i8.bumcheo.info/868/868557/21.jpg?v=1710143202
',34,'2024-03-14 04:47:00','2024-03-14 04:47:00'),
	 ('https://i8.bumcheo.info/868/868557/22.jpg?v=1710143205
',34,'2024-03-14 04:47:00','2024-03-14 04:47:00'),
	 ('https://i8.bumcheo.info/868/868557/23.jpg?v=1710143210
',34,'2024-03-14 04:47:00','2024-03-14 04:47:00'),
	 ('https://i8.bumcheo.info/868/868557/24.jpg?v=1710143213
',34,'2024-03-14 04:47:00','2024-03-14 04:47:00'),
	 ('https://i8.bumcheo.info/868/868557/25.jpg?v=1710143217
',34,'2024-03-14 04:47:00','2024-03-14 04:47:00'),
	 ('https://i8.bumcheo.info/868/868557/26.jpg?v=1710143221
',34,'2024-03-14 04:47:00','2024-03-14 04:47:00'),
	 ('https://i8.bumcheo.info/868/868557/27.jpg?v=1710143225
',34,'2024-03-14 04:47:00','2024-03-14 04:47:00');
INSERT INTO test.Comic_Images (url,ChapterId,createdAt,updatedAt) VALUES
	 ('https://i8.bumcheo.info/868/868557/28.jpg?v=1710143229
',34,'2024-03-14 04:47:00','2024-03-14 04:47:00'),
	 ('https://i8.bumcheo.info/868/868557/29.jpg?v=1710143232
',34,'2024-03-14 04:47:00','2024-03-14 04:47:00'),
	 ('https://i8.bumcheo.info/868/868557/30.jpg?v=1710143236
',34,'2024-03-14 04:47:00','2024-03-14 04:47:00'),
	 ('https://i8.bumcheo.info/868/868557/31.jpg?v=1710143240
',34,'2024-03-14 04:47:00','2024-03-14 04:47:00'),
	 ('https://i8.bumcheo.info/868/868557/32.jpg?v=1710143243
',34,'2024-03-14 04:47:00','2024-03-14 04:47:00'),
	 ('https://i8.bumcheo.info/868/868557/33.jpg?v=1710143247
',34,'2024-03-14 04:47:00','2024-03-14 04:47:00'),
	 ('https://i8.bumcheo.info/868/868557/34.jpg?v=1710143251
',34,'2024-03-14 04:47:00','2024-03-14 04:47:00'),
	 ('https://i8.bumcheo.info/868/868557/35.jpg?v=1710143255
',34,'2024-03-14 04:47:00','2024-03-14 04:47:00'),
	 ('https://i8.bumcheo.info/868/868557/36.jpg?v=1710143258
',34,'2024-03-14 04:47:00','2024-03-14 04:47:00'),
	 ('https://i8.bumcheo.info/868/868557/37.jpg?v=1710143262
',34,'2024-03-14 04:47:00','2024-03-14 04:47:00');
INSERT INTO test.Comic_Images (url,ChapterId,createdAt,updatedAt) VALUES
	 ('https://i8.bumcheo.info/868/868557/38.jpg?v=1710143265
',34,'2024-03-14 04:47:00','2024-03-14 04:47:00'),
	 ('https://i8.bumcheo.info/868/868557/39.jpg?v=1710143269
',34,'2024-03-14 04:47:00','2024-03-14 04:47:00'),
	 ('https://i8.bumcheo.info/868/868557/40.jpg?v=1710143273
',34,'2024-03-14 04:47:00','2024-03-14 04:47:00'),
	 ('https://i8.bumcheo.info/868/868557/41.jpg?v=1710143277
',34,'2024-03-14 04:47:00','2024-03-14 04:47:00'),
	 ('https://i8.bumcheo.info/868/868557/42.jpg?v=1710143281
',34,'2024-03-14 04:47:00','2024-03-14 04:47:00'),
	 ('https://i8.bumcheo.info/868/868557/43.jpg?v=1710143285
',34,'2024-03-14 04:47:00','2024-03-14 04:47:00'),
	 ('https://i8.bumcheo.info/868/868557/44.jpg?v=1710143289
',34,'2024-03-14 04:47:00','2024-03-14 04:47:00'),
	 ('https://i8.bumcheo.info/868/868557/45.jpg?v=1710143293
',34,'2024-03-14 04:47:00','2024-03-14 04:47:00'),
	 ('https://i8.bumcheo.info/868/868557/46.jpg?v=1710143297
',34,'2024-03-14 04:47:00','2024-03-14 04:47:00'),
	 ('https://i8.bumcheo.info/868/868557/47.jpg?v=1710143302
',34,'2024-03-14 04:47:00','2024-03-14 04:47:00');
INSERT INTO test.Comic_Images (url,ChapterId,createdAt,updatedAt) VALUES
	 ('https://i7.bumcheo.info/manga/13/13223/1.png
',34,'2024-03-14 04:47:00','2024-03-14 04:47:00'),
	 ('https://blogtruyen.vn/content/images/chapter-error.png
',34,'2024-03-14 04:47:00','2024-03-14 04:47:00'),
	 ('https://blogtruyen.vn/content/images/chapter-fix.png
',34,'2024-03-14 04:47:00','2024-03-14 04:47:00'),
	 ('https://blogtruyen.vn/Content/images/loading.gif',34,'2024-03-14 04:47:00','2024-03-14 04:47:00'),
	 ('https://i7.bumcheo.info/manga/13/13223/0.jpg
',35,'2024-03-14 04:47:22','2024-03-14 04:47:22'),
	 ('https://i8.bumcheo.info/868/868608/0.jpg?v=1710143319
',35,'2024-03-14 04:47:22','2024-03-14 04:47:22'),
	 ('https://i8.bumcheo.info/868/868608/1.jpg?v=1710143323
',35,'2024-03-14 04:47:22','2024-03-14 04:47:22'),
	 ('https://i8.bumcheo.info/868/868608/2.jpg?v=1710143327
',35,'2024-03-14 04:47:22','2024-03-14 04:47:22'),
	 ('https://i8.bumcheo.info/868/868608/3.jpg?v=1710143331
',35,'2024-03-14 04:47:22','2024-03-14 04:47:22'),
	 ('https://i8.bumcheo.info/868/868608/4.jpg?v=1710143335
',35,'2024-03-14 04:47:22','2024-03-14 04:47:22');
INSERT INTO test.Comic_Images (url,ChapterId,createdAt,updatedAt) VALUES
	 ('https://i8.bumcheo.info/868/868608/5.jpg?v=1710143339
',35,'2024-03-14 04:47:22','2024-03-14 04:47:22'),
	 ('https://i8.bumcheo.info/868/868608/6.jpg?v=1710143343
',35,'2024-03-14 04:47:22','2024-03-14 04:47:22'),
	 ('https://i8.bumcheo.info/868/868608/7.jpg?v=1710143347
',35,'2024-03-14 04:47:22','2024-03-14 04:47:22'),
	 ('https://i8.bumcheo.info/868/868608/8.jpg?v=1710143351
',35,'2024-03-14 04:47:22','2024-03-14 04:47:22'),
	 ('https://i8.bumcheo.info/868/868608/9.jpg?v=1710143355
',35,'2024-03-14 04:47:22','2024-03-14 04:47:22'),
	 ('https://i8.bumcheo.info/868/868608/10.jpg?v=1710143359
',35,'2024-03-14 04:47:22','2024-03-14 04:47:22'),
	 ('https://i8.bumcheo.info/868/868608/11.jpg?v=1710143363
',35,'2024-03-14 04:47:22','2024-03-14 04:47:22'),
	 ('https://i8.bumcheo.info/868/868608/12.jpg?v=1710143367
',35,'2024-03-14 04:47:22','2024-03-14 04:47:22'),
	 ('https://i8.bumcheo.info/868/868608/13.jpg?v=1710143371
',35,'2024-03-14 04:47:22','2024-03-14 04:47:22'),
	 ('https://i8.bumcheo.info/868/868608/14.jpg?v=1710143376
',35,'2024-03-14 04:47:22','2024-03-14 04:47:22');
INSERT INTO test.Comic_Images (url,ChapterId,createdAt,updatedAt) VALUES
	 ('https://i8.bumcheo.info/868/868608/15.jpg?v=1710143379
',35,'2024-03-14 04:47:22','2024-03-14 04:47:22'),
	 ('https://i8.bumcheo.info/868/868608/16.jpg?v=1710143383
',35,'2024-03-14 04:47:22','2024-03-14 04:47:22'),
	 ('https://i8.bumcheo.info/868/868608/17.jpg?v=1710143387
',35,'2024-03-14 04:47:22','2024-03-14 04:47:22'),
	 ('https://i8.bumcheo.info/868/868608/18.jpg?v=1710143391
',35,'2024-03-14 04:47:22','2024-03-14 04:47:22'),
	 ('https://i8.bumcheo.info/868/868608/19.jpg?v=1710143395
',35,'2024-03-14 04:47:22','2024-03-14 04:47:22'),
	 ('https://i8.bumcheo.info/868/868608/20.jpg?v=1710143399
',35,'2024-03-14 04:47:22','2024-03-14 04:47:22'),
	 ('https://i8.bumcheo.info/868/868608/21.jpg?v=1710143403
',35,'2024-03-14 04:47:22','2024-03-14 04:47:22'),
	 ('https://i8.bumcheo.info/868/868608/22.jpg?v=1710143407
',35,'2024-03-14 04:47:22','2024-03-14 04:47:22'),
	 ('https://i8.bumcheo.info/868/868608/23.jpg?v=1710143411
',35,'2024-03-14 04:47:22','2024-03-14 04:47:22'),
	 ('https://i8.bumcheo.info/868/868608/24.jpg?v=1710143415
',35,'2024-03-14 04:47:22','2024-03-14 04:47:22');
INSERT INTO test.Comic_Images (url,ChapterId,createdAt,updatedAt) VALUES
	 ('https://i8.bumcheo.info/868/868608/25.jpg?v=1710143419
',35,'2024-03-14 04:47:22','2024-03-14 04:47:22'),
	 ('https://i8.bumcheo.info/868/868608/26.jpg?v=1710143423
',35,'2024-03-14 04:47:22','2024-03-14 04:47:22'),
	 ('https://i8.bumcheo.info/868/868608/27.jpg?v=1710143426
',35,'2024-03-14 04:47:22','2024-03-14 04:47:22'),
	 ('https://i8.bumcheo.info/868/868608/28.jpg?v=1710143430
',35,'2024-03-14 04:47:22','2024-03-14 04:47:22'),
	 ('https://i8.bumcheo.info/868/868608/29.jpg?v=1710143435
',35,'2024-03-14 04:47:22','2024-03-14 04:47:22'),
	 ('https://i8.bumcheo.info/868/868608/30.jpg?v=1710143439
',35,'2024-03-14 04:47:22','2024-03-14 04:47:22'),
	 ('https://i8.bumcheo.info/868/868608/31.jpg?v=1710143442
',35,'2024-03-14 04:47:22','2024-03-14 04:47:22'),
	 ('https://i8.bumcheo.info/868/868608/32.jpg?v=1710143446
',35,'2024-03-14 04:47:22','2024-03-14 04:47:22'),
	 ('https://i8.bumcheo.info/868/868608/33.jpg?v=1710143450
',35,'2024-03-14 04:47:22','2024-03-14 04:47:22'),
	 ('https://i8.bumcheo.info/868/868608/34.jpg?v=1710143454
',35,'2024-03-14 04:47:22','2024-03-14 04:47:22');
INSERT INTO test.Comic_Images (url,ChapterId,createdAt,updatedAt) VALUES
	 ('https://i8.bumcheo.info/868/868608/35.jpg?v=1710143458
',35,'2024-03-14 04:47:22','2024-03-14 04:47:22'),
	 ('https://i8.bumcheo.info/868/868608/36.jpg?v=1710143462
',35,'2024-03-14 04:47:22','2024-03-14 04:47:22'),
	 ('https://i8.bumcheo.info/868/868608/37.jpg?v=1710143465
',35,'2024-03-14 04:47:22','2024-03-14 04:47:22'),
	 ('https://i8.bumcheo.info/868/868608/38.jpg?v=1710143468
',35,'2024-03-14 04:47:22','2024-03-14 04:47:22'),
	 ('https://i8.bumcheo.info/868/868608/39.jpg?v=1710143472
',35,'2024-03-14 04:47:22','2024-03-14 04:47:22'),
	 ('https://i7.bumcheo.info/manga/13/13223/1.png
',35,'2024-03-14 04:47:22','2024-03-14 04:47:22'),
	 ('https://blogtruyen.vn/content/images/chapter-error.png
',35,'2024-03-14 04:47:22','2024-03-14 04:47:22'),
	 ('https://blogtruyen.vn/content/images/chapter-fix.png
',35,'2024-03-14 04:47:22','2024-03-14 04:47:22'),
	 ('https://blogtruyen.vn/Content/images/loading.gif',35,'2024-03-14 04:47:22','2024-03-14 04:47:22'),
	 ('https://i8.bumcheo.info/868/868656/0.jpg?v=1710143487
',36,'2024-03-14 04:47:51','2024-03-14 04:47:51');
INSERT INTO test.Comic_Images (url,ChapterId,createdAt,updatedAt) VALUES
	 ('https://i8.bumcheo.info/868/868656/1.jpg?v=1710143491
',36,'2024-03-14 04:47:51','2024-03-14 04:47:51'),
	 ('https://i7.bumcheo.info/manga/13/13223/0.jpg
',36,'2024-03-14 04:47:51','2024-03-14 04:47:51'),
	 ('https://i8.bumcheo.info/868/868656/2.jpg?v=1710143495
',36,'2024-03-14 04:47:51','2024-03-14 04:47:51'),
	 ('https://i8.bumcheo.info/868/868656/3.jpg?v=1710143499
',36,'2024-03-14 04:47:51','2024-03-14 04:47:51'),
	 ('https://i8.bumcheo.info/868/868656/4.jpg?v=1710143503
',36,'2024-03-14 04:47:51','2024-03-14 04:47:51'),
	 ('https://i8.bumcheo.info/868/868656/5.jpg?v=1710143507
',36,'2024-03-14 04:47:51','2024-03-14 04:47:51'),
	 ('https://i8.bumcheo.info/868/868656/6.jpg?v=1710143511
',36,'2024-03-14 04:47:51','2024-03-14 04:47:51'),
	 ('https://i8.bumcheo.info/868/868656/7.jpg?v=1710143515
',36,'2024-03-14 04:47:51','2024-03-14 04:47:51'),
	 ('https://i8.bumcheo.info/868/868656/8.jpg?v=1710143518
',36,'2024-03-14 04:47:51','2024-03-14 04:47:51'),
	 ('https://i8.bumcheo.info/868/868656/9.jpg?v=1710143522
',36,'2024-03-14 04:47:51','2024-03-14 04:47:51');
INSERT INTO test.Comic_Images (url,ChapterId,createdAt,updatedAt) VALUES
	 ('https://i8.bumcheo.info/868/868656/10.jpg?v=1710143526
',36,'2024-03-14 04:47:51','2024-03-14 04:47:51'),
	 ('https://i8.bumcheo.info/868/868656/11.jpg?v=1710143530
',36,'2024-03-14 04:47:51','2024-03-14 04:47:51'),
	 ('https://i8.bumcheo.info/868/868656/12.jpg?v=1710143534
',36,'2024-03-14 04:47:51','2024-03-14 04:47:51'),
	 ('https://i8.bumcheo.info/868/868656/13.jpg?v=1710143539
',36,'2024-03-14 04:47:51','2024-03-14 04:47:51'),
	 ('https://i8.bumcheo.info/868/868656/14.jpg?v=1710143542
',36,'2024-03-14 04:47:51','2024-03-14 04:47:51'),
	 ('https://i8.bumcheo.info/868/868656/15.jpg?v=1710143546
',36,'2024-03-14 04:47:51','2024-03-14 04:47:51'),
	 ('https://i8.bumcheo.info/868/868656/16.jpg?v=1710143550
',36,'2024-03-14 04:47:51','2024-03-14 04:47:51'),
	 ('https://i8.bumcheo.info/868/868656/17.jpg?v=1710143554
',36,'2024-03-14 04:47:51','2024-03-14 04:47:51'),
	 ('https://i8.bumcheo.info/868/868656/18.jpg?v=1710143558
',36,'2024-03-14 04:47:51','2024-03-14 04:47:51'),
	 ('https://i8.bumcheo.info/868/868656/19.jpg?v=1710143562
',36,'2024-03-14 04:47:51','2024-03-14 04:47:51');
INSERT INTO test.Comic_Images (url,ChapterId,createdAt,updatedAt) VALUES
	 ('https://i8.bumcheo.info/868/868656/20.jpg?v=1710143565
',36,'2024-03-14 04:47:51','2024-03-14 04:47:51'),
	 ('https://i8.bumcheo.info/868/868656/21.jpg?v=1710143569
',36,'2024-03-14 04:47:51','2024-03-14 04:47:51'),
	 ('https://i8.bumcheo.info/868/868656/22.jpg?v=1710143573
',36,'2024-03-14 04:47:51','2024-03-14 04:47:51'),
	 ('https://i8.bumcheo.info/868/868656/23.jpg?v=1710143577
',36,'2024-03-14 04:47:51','2024-03-14 04:47:51'),
	 ('https://i8.bumcheo.info/868/868656/24.jpg?v=1710143581
',36,'2024-03-14 04:47:51','2024-03-14 04:47:51'),
	 ('https://i8.bumcheo.info/868/868656/25.jpg?v=1710143585
',36,'2024-03-14 04:47:51','2024-03-14 04:47:51'),
	 ('https://i8.bumcheo.info/868/868656/26.jpg?v=1710143589
',36,'2024-03-14 04:47:51','2024-03-14 04:47:51'),
	 ('https://i8.bumcheo.info/868/868656/27.jpg?v=1710143592
',36,'2024-03-14 04:47:51','2024-03-14 04:47:51'),
	 ('https://i8.bumcheo.info/868/868656/28.jpg?v=1710143596
',36,'2024-03-14 04:47:51','2024-03-14 04:47:51'),
	 ('https://i8.bumcheo.info/868/868656/29.jpg?v=1710143600
',36,'2024-03-14 04:47:51','2024-03-14 04:47:51');
INSERT INTO test.Comic_Images (url,ChapterId,createdAt,updatedAt) VALUES
	 ('https://i8.bumcheo.info/868/868656/30.jpg?v=1710143604
',36,'2024-03-14 04:47:51','2024-03-14 04:47:51'),
	 ('https://i8.bumcheo.info/868/868656/31.jpg?v=1710143608
',36,'2024-03-14 04:47:51','2024-03-14 04:47:51'),
	 ('https://i8.bumcheo.info/868/868656/32.jpg?v=1710143612
',36,'2024-03-14 04:47:51','2024-03-14 04:47:51'),
	 ('https://i8.bumcheo.info/868/868656/33.jpg?v=1710143616
',36,'2024-03-14 04:47:51','2024-03-14 04:47:51'),
	 ('https://i8.bumcheo.info/868/868656/34.jpg?v=1710143620
',36,'2024-03-14 04:47:51','2024-03-14 04:47:51'),
	 ('https://i8.bumcheo.info/868/868656/35.jpg?v=1710143624
',36,'2024-03-14 04:47:51','2024-03-14 04:47:51'),
	 ('https://i8.bumcheo.info/868/868656/36.jpg?v=1710143628
',36,'2024-03-14 04:47:51','2024-03-14 04:47:51'),
	 ('https://i8.bumcheo.info/868/868656/37.jpg?v=1710143632
',36,'2024-03-14 04:47:51','2024-03-14 04:47:51'),
	 ('https://i7.bumcheo.info/manga/13/13223/1.png
',36,'2024-03-14 04:47:51','2024-03-14 04:47:51'),
	 ('https://blogtruyen.vn/content/images/chapter-error.png
',36,'2024-03-14 04:47:51','2024-03-14 04:47:51');
INSERT INTO test.Comic_Images (url,ChapterId,createdAt,updatedAt) VALUES
	 ('https://blogtruyen.vn/content/images/chapter-fix.png',36,'2024-03-14 04:47:51','2024-03-14 04:47:51'),
	 ('https://i8.bumcheo.info/868/868705/0.jpg?v=1710143652
',37,'2024-03-14 04:48:21','2024-03-14 04:48:21'),
	 ('https://i7.bumcheo.info/manga/13/13223/0.jpg
',37,'2024-03-14 04:48:21','2024-03-14 04:48:21'),
	 ('https://i8.bumcheo.info/868/868705/1.jpg?v=1710143656
',37,'2024-03-14 04:48:21','2024-03-14 04:48:21'),
	 ('https://i8.bumcheo.info/868/868705/3.jpg?v=1710143663
',37,'2024-03-14 04:48:21','2024-03-14 04:48:21'),
	 ('https://i8.bumcheo.info/868/868705/2.jpg?v=1710143659
',37,'2024-03-14 04:48:21','2024-03-14 04:48:21'),
	 ('https://i8.bumcheo.info/868/868705/4.jpg?v=1710143667
',37,'2024-03-14 04:48:21','2024-03-14 04:48:21'),
	 ('https://i8.bumcheo.info/868/868705/5.jpg?v=1710143671
',37,'2024-03-14 04:48:21','2024-03-14 04:48:21'),
	 ('https://i8.bumcheo.info/868/868705/6.jpg?v=1710143675
',37,'2024-03-14 04:48:21','2024-03-14 04:48:21'),
	 ('https://i8.bumcheo.info/868/868705/7.jpg?v=1710143679
',37,'2024-03-14 04:48:21','2024-03-14 04:48:21');
INSERT INTO test.Comic_Images (url,ChapterId,createdAt,updatedAt) VALUES
	 ('https://i8.bumcheo.info/868/868705/8.jpg?v=1710143683
',37,'2024-03-14 04:48:21','2024-03-14 04:48:21'),
	 ('https://i8.bumcheo.info/868/868705/9.jpg?v=1710143687
',37,'2024-03-14 04:48:21','2024-03-14 04:48:21'),
	 ('https://i8.bumcheo.info/868/868705/10.jpg?v=1710143691
',37,'2024-03-14 04:48:21','2024-03-14 04:48:21'),
	 ('https://i8.bumcheo.info/868/868705/11.jpg?v=1710143695
',37,'2024-03-14 04:48:21','2024-03-14 04:48:21'),
	 ('https://i8.bumcheo.info/868/868705/12.jpg?v=1710143698
',37,'2024-03-14 04:48:21','2024-03-14 04:48:21'),
	 ('https://i8.bumcheo.info/868/868705/13.jpg?v=1710143703
',37,'2024-03-14 04:48:21','2024-03-14 04:48:21'),
	 ('https://i8.bumcheo.info/868/868705/14.jpg?v=1710143707
',37,'2024-03-14 04:48:21','2024-03-14 04:48:21'),
	 ('https://i8.bumcheo.info/868/868705/15.jpg?v=1710143711
',37,'2024-03-14 04:48:21','2024-03-14 04:48:21'),
	 ('https://i8.bumcheo.info/868/868705/16.jpg?v=1710143715
',37,'2024-03-14 04:48:21','2024-03-14 04:48:21'),
	 ('https://i8.bumcheo.info/868/868705/17.jpg?v=1710143719
',37,'2024-03-14 04:48:21','2024-03-14 04:48:21');
INSERT INTO test.Comic_Images (url,ChapterId,createdAt,updatedAt) VALUES
	 ('https://i8.bumcheo.info/868/868705/18.jpg?v=1710143723
',37,'2024-03-14 04:48:21','2024-03-14 04:48:21'),
	 ('https://i8.bumcheo.info/868/868705/19.jpg?v=1710143727
',37,'2024-03-14 04:48:21','2024-03-14 04:48:21'),
	 ('https://i8.bumcheo.info/868/868705/20.jpg?v=1710143731
',37,'2024-03-14 04:48:21','2024-03-14 04:48:21'),
	 ('https://i8.bumcheo.info/868/868705/21.jpg?v=1710143735
',37,'2024-03-14 04:48:21','2024-03-14 04:48:21'),
	 ('https://i8.bumcheo.info/868/868705/22.jpg?v=1710143739
',37,'2024-03-14 04:48:21','2024-03-14 04:48:21'),
	 ('https://i8.bumcheo.info/868/868705/23.jpg?v=1710143743
',37,'2024-03-14 04:48:21','2024-03-14 04:48:21'),
	 ('https://i8.bumcheo.info/868/868705/24.jpg?v=1710143747
',37,'2024-03-14 04:48:21','2024-03-14 04:48:21'),
	 ('https://i8.bumcheo.info/868/868705/25.jpg?v=1710143751
',37,'2024-03-14 04:48:21','2024-03-14 04:48:21'),
	 ('https://i8.bumcheo.info/868/868705/26.jpg?v=1710143755
',37,'2024-03-14 04:48:21','2024-03-14 04:48:21'),
	 ('https://i8.bumcheo.info/868/868705/27.jpg?v=1710143759
',37,'2024-03-14 04:48:21','2024-03-14 04:48:21');
INSERT INTO test.Comic_Images (url,ChapterId,createdAt,updatedAt) VALUES
	 ('https://i8.bumcheo.info/868/868705/28.jpg?v=1710143763
',37,'2024-03-14 04:48:21','2024-03-14 04:48:21'),
	 ('https://i8.bumcheo.info/868/868705/29.jpg?v=1710143768
',37,'2024-03-14 04:48:21','2024-03-14 04:48:21'),
	 ('https://i8.bumcheo.info/868/868705/30.jpg?v=1710143772
',37,'2024-03-14 04:48:21','2024-03-14 04:48:21'),
	 ('https://i8.bumcheo.info/868/868705/31.jpg?v=1710143776
',37,'2024-03-14 04:48:21','2024-03-14 04:48:21'),
	 ('https://i8.bumcheo.info/868/868705/32.jpg?v=1710143780
',37,'2024-03-14 04:48:21','2024-03-14 04:48:21'),
	 ('https://i8.bumcheo.info/868/868705/33.jpg?v=1710143785
',37,'2024-03-14 04:48:21','2024-03-14 04:48:21'),
	 ('https://i7.bumcheo.info/manga/13/13223/1.png
',37,'2024-03-14 04:48:21','2024-03-14 04:48:21'),
	 ('https://blogtruyen.vn/content/images/chapter-error.png
',37,'2024-03-14 04:48:21','2024-03-14 04:48:21'),
	 ('https://blogtruyen.vn/content/images/chapter-fix.png',37,'2024-03-14 04:48:21','2024-03-14 04:48:21'),
	 (NULL,NULL,'2024-03-18 10:29:25','2024-03-18 10:29:25');
