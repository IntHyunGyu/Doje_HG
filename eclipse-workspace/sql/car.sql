-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- 생성 시간: 18-12-26 17:25
-- 서버 버전: 10.1.34-MariaDB-0ubuntu0.18.04.1
-- PHP 버전: 7.2.10-0ubuntu0.18.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 데이터베이스: `yy_20109`
--

-- --------------------------------------------------------

--
-- 테이블 구조 `car`
--

CREATE TABLE `car` (
  `carNum` varchar(50) CHARACTER SET utf8 NOT NULL COMMENT '차번호',
  `user` varchar(50) CHARACTER SET utf8 NOT NULL COMMENT 'user.id',
  `carType` varchar(50) CHARACTER SET utf8 NOT NULL COMMENT '차량종류'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 테이블의 덤프 데이터 `car`
--

INSERT INTO `car` (`carNum`, `user`, `carType`) VALUES
('', '', '선택');

--
-- 덤프된 테이블의 인덱스
--

--
-- 테이블의 인덱스 `car`
--
ALTER TABLE `car`
  ADD PRIMARY KEY (`carNum`),
  ADD KEY `user` (`user`);

--
-- 덤프된 테이블의 제약사항
--

--
-- 테이블의 제약사항 `car`
--
ALTER TABLE `car`
  ADD CONSTRAINT `car_ibfk_1` FOREIGN KEY (`user`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
