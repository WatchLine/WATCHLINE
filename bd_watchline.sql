-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: 177.153.63.71
-- Generation Time: 25-Nov-2023 às 20:21
-- Versão do servidor: 5.7.32-35-log
-- PHP Version: 5.6.40-0+deb8u12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bd_watchline`
--
CREATE DATABASE IF NOT EXISTS `bd_watchline` DEFAULT CHARACTER SET latin1 COLLATE latin1_general_ci;
USE `bd_watchline`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `atividade`
--

DROP TABLE IF EXISTS `atividade`;
CREATE TABLE `atividade` (
  `IDAtividade` int(11) NOT NULL,
  `Tipo` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `Conteudo` varchar(100) COLLATE latin1_general_ci DEFAULT NULL,
  `ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `ATIVIDADE_COMUNIDADE`
--

DROP TABLE IF EXISTS `ATIVIDADE_COMUNIDADE`;
CREATE TABLE `ATIVIDADE_COMUNIDADE` (
  `IDAtividadeComunidade` int(11) NOT NULL,
  `Data` date DEFAULT NULL,
  `Hora` time DEFAULT NULL,
  `IDAtividade` int(11) NOT NULL,
  `IDComunidade` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `comunidade`
--

DROP TABLE IF EXISTS `comunidade`;
CREATE TABLE `comunidade` (
  `IDComunidade` int(11) NOT NULL,
  `Nome` varchar(80) COLLATE latin1_general_ci NOT NULL,
  `ID` int(11) NOT NULL,
  `IDStreamer` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `Conteudo`
--

DROP TABLE IF EXISTS `Conteudo`;
CREATE TABLE `Conteudo` (
  `IDConteudo` int(11) NOT NULL,
  `Descrição` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `TituloVideo` varchar(80) COLLATE latin1_general_ci NOT NULL,
  `DataPostagem` date NOT NULL,
  `Duração` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `Classificacao` varchar(20) COLLATE latin1_general_ci NOT NULL,
  `Genero` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `IDStreamer` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `informacoes_perfil`
--

DROP TABLE IF EXISTS `informacoes_perfil`;
CREATE TABLE `informacoes_perfil` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `email` varchar(255) COLLATE latin1_general_ci NOT NULL,
  `age` int(11) DEFAULT NULL,
  `location` varchar(255) COLLATE latin1_general_ci DEFAULT NULL,
  `bio` text COLLATE latin1_general_ci,
  `profileImage` text COLLATE latin1_general_ci
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `streamer`
--

DROP TABLE IF EXISTS `streamer`;
CREATE TABLE `streamer` (
  `IDStreamer` int(11) NOT NULL,
  `Nome` varchar(80) COLLATE latin1_general_ci NOT NULL,
  `Senha` varchar(15) COLLATE latin1_general_ci NOT NULL,
  `Email` varchar(100) COLLATE latin1_general_ci NOT NULL,
  `DataRegistro` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario` (
  `ID` int(11) NOT NULL,
  `Usuario` varchar(80) COLLATE latin1_general_ci NOT NULL,
  `Email` varchar(50) COLLATE latin1_general_ci NOT NULL,
  `Senha` varchar(15) COLLATE latin1_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`ID`, `Usuario`, `Email`, `Senha`) VALUES
(31, 'DSPORAMOR', 'dsporamor@gmail.com', 'nalivx_08'),
(36, 'amanda', 'amandacavalheiroip@gmail.com', '123MANDA'),
(37, 'liv', 'dsporamor@gmail.com', 'liv123'),
(38, 'amanda', 'amandacavalheiroip@gmail.com', '123a'),
(39, 'livs', 'analivia2405@gmail.com', 'livs123'),
(40, 'Juliana Joia', 'julianavieirajoia@gmail.com', '30122005'),
(41, 'hanna', 'hannacat@gmail.com', 'hanninha');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `atividade`
--
ALTER TABLE `atividade`
  ADD PRIMARY KEY (`IDAtividade`),
  ADD KEY `ID` (`ID`);

--
-- Indexes for table `ATIVIDADE_COMUNIDADE`
--
ALTER TABLE `ATIVIDADE_COMUNIDADE`
  ADD PRIMARY KEY (`IDAtividadeComunidade`),
  ADD KEY `IDAtividade` (`IDAtividade`),
  ADD KEY `IDComunidade` (`IDComunidade`);

--
-- Indexes for table `comunidade`
--
ALTER TABLE `comunidade`
  ADD PRIMARY KEY (`IDComunidade`),
  ADD KEY `ID` (`ID`),
  ADD KEY `IDSreamer` (`IDStreamer`);

--
-- Indexes for table `Conteudo`
--
ALTER TABLE `Conteudo`
  ADD PRIMARY KEY (`IDConteudo`),
  ADD KEY `IDStreamer` (`IDStreamer`);

--
-- Indexes for table `informacoes_perfil`
--
ALTER TABLE `informacoes_perfil`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `streamer`
--
ALTER TABLE `streamer`
  ADD PRIMARY KEY (`IDStreamer`);

--
-- Indexes for table `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `comunidade`
--
ALTER TABLE `comunidade`
  MODIFY `IDComunidade` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Conteudo`
--
ALTER TABLE `Conteudo`
  MODIFY `IDConteudo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `informacoes_perfil`
--
ALTER TABLE `informacoes_perfil`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `usuario`
--
ALTER TABLE `usuario`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `atividade`
--
ALTER TABLE `atividade`
  ADD CONSTRAINT `atividade_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `usuario` (`ID`);

--
-- Limitadores para a tabela `ATIVIDADE_COMUNIDADE`
--
ALTER TABLE `ATIVIDADE_COMUNIDADE`
  ADD CONSTRAINT `ATIVIDADE_COMUNIDADE_ibfk_1` FOREIGN KEY (`IDAtividade`) REFERENCES `atividade` (`IDAtividade`),
  ADD CONSTRAINT `ATIVIDADE_COMUNIDADE_ibfk_2` FOREIGN KEY (`IDComunidade`) REFERENCES `comunidade` (`IDComunidade`);

--
-- Limitadores para a tabela `comunidade`
--
ALTER TABLE `comunidade`
  ADD CONSTRAINT `comunidade_ibfk_1` FOREIGN KEY (`ID`) REFERENCES `usuario` (`ID`),
  ADD CONSTRAINT `comunidade_ibfk_2` FOREIGN KEY (`IDStreamer`) REFERENCES `streamer` (`IDStreamer`);

--
-- Limitadores para a tabela `Conteudo`
--
ALTER TABLE `Conteudo`
  ADD CONSTRAINT `Conteudo_ibfk_1` FOREIGN KEY (`IDStreamer`) REFERENCES `streamer` (`IDStreamer`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
