-- phpMyAdmin SQL Dump
-- version 4.8.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- 생성 시간: 18-12-26 17:24
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
-- 테이블 구조 `user`
--

CREATE TABLE `user` (
  `id` varchar(50) CHARACTER SET utf8 NOT NULL COMMENT '아이디',
  `password` text CHARACTER SET utf8 NOT NULL COMMENT '비밀번호',
  `name` varchar(50) CHARACTER SET utf8 NOT NULL COMMENT '이름',
  `phone` varchar(11) CHARACTER SET utf8 NOT NULL COMMENT '전화번호',
  `type` int(11) DEFAULT '1' COMMENT '관리자/사용자',
  `regDate` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 테이블의 덤프 데이터 `user`
--

INSERT INTO `user` (`id`, `password`, `name`, `phone`, `type`, `regDate`) VALUES
('', '', '', '', 1, '2018-12-19 11:51:54'),
('1', '', '', '', 1, '2018-12-19 13:15:59');

--
-- 덤프된 테이블의 인덱스
--

--
-- 테이블의 인덱스 `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
