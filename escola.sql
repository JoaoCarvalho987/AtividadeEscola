-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 07-Dez-2020 às 15:36
-- Versão do servidor: 10.4.17-MariaDB
-- versão do PHP: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `escola`
--
CREATE DATABASE IF NOT EXISTS `escola` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `escola`;

-- --------------------------------------------------------

--
-- Estrutura da tabela `cargo`
--

CREATE TABLE `cargo` (
  `codCargo` int(11) NOT NULL,
  `cargo` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `cargo`
--

INSERT INTO `cargo` (`codCargo`, `cargo`) VALUES
(1, 'Professor'),
(2, 'Coordenador pedagógico'),
(3, 'Diretor'),
(4, 'Analista de sistema'),
(5, 'Coordenador de curso - Informática'),
(6, 'Coordenador de curso - Administração'),
(7, 'Coordenador de curso - Ensino Médio'),
(8, 'Coordenador de curso - Recursos Humanos'),
(9, 'Coordenador de curso - Banco de dados');

-- --------------------------------------------------------

--
-- Estrutura da tabela `funccarg`
--

CREATE TABLE `funccarg` (
  `codCargo` int(11) NOT NULL,
  `codFunc` int(11) NOT NULL,
  `daEntr` date NOT NULL,
  `daSai` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `funccarg`
--

INSERT INTO `funccarg` (`codCargo`, `codFunc`, `daEntr`, `daSai`) VALUES
(1, 5, '2020-02-11', NULL),
(4, 1, '2019-05-13', NULL),
(1, 2, '2019-02-13', NULL),
(3, 2, '2018-08-13', NULL),
(9, 6, '2016-02-13', NULL),
(5, 6, '2015-09-13', '2016-02-12');

-- --------------------------------------------------------

--
-- Estrutura da tabela `funcionario`
--

CREATE TABLE `funcionario` (
  `codFunc` int(11) NOT NULL,
  `funcionario` varchar(255) NOT NULL,
  `daEntr` date NOT NULL,
  `daSai` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `funcionario`
--

INSERT INTO `funcionario` (`codFunc`, `funcionario`, `daEntr`, `daSai`) VALUES
(1, 'João Vitor Carvalho', '2019-02-13', NULL),
(2, 'Isabelle Rochedo', '2018-06-23', NULL),
(5, 'Carlos da Penha', '2020-08-12', NULL),
(6, 'Luiza Fernandez', '2015-09-02', NULL);

--
-- Índices para tabelas despejadas
--

--
-- Índices para tabela `cargo`
--
ALTER TABLE `cargo`
  ADD PRIMARY KEY (`codCargo`);

--
-- Índices para tabela `funccarg`
--
ALTER TABLE `funccarg`
  ADD KEY `codCargo` (`codCargo`),
  ADD KEY `codFunc` (`codFunc`);

--
-- Índices para tabela `funcionario`
--
ALTER TABLE `funcionario`
  ADD PRIMARY KEY (`codFunc`);

--
-- AUTO_INCREMENT de tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `cargo`
--
ALTER TABLE `cargo`
  MODIFY `codCargo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de tabela `funcionario`
--
ALTER TABLE `funcionario`
  MODIFY `codFunc` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restrições para despejos de tabelas
--

--
-- Limitadores para a tabela `funccarg`
--
ALTER TABLE `funccarg`
  ADD CONSTRAINT `funccarg_ibfk_1` FOREIGN KEY (`codCargo`) REFERENCES `cargo` (`codCargo`),
  ADD CONSTRAINT `funccarg_ibfk_2` FOREIGN KEY (`codFunc`) REFERENCES `funcionario` (`codFunc`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
