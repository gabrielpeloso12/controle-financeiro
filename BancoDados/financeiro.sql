-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           5.7.29-log - MySQL Community Server (GPL)
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              11.1.0.6116
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para financeiro
CREATE DATABASE IF NOT EXISTS `financeiro` /*!40100 DEFAULT CHARACTER SET armscii8 COLLATE armscii8_bin */;
USE `financeiro`;

-- Copiando estrutura para tabela financeiro.cargo
CREATE TABLE IF NOT EXISTS `cargo` (
  `C_CODIGO` int(11) NOT NULL AUTO_INCREMENT,
  `C_DESCRICAO` varchar(30) COLLATE armscii8_bin NOT NULL,
  `C_DATACAD` date NOT NULL,
  PRIMARY KEY (`C_CODIGO`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=armscii8 COLLATE=armscii8_bin;

-- Copiando dados para a tabela financeiro.cargo: ~4 rows (aproximadamente)
/*!40000 ALTER TABLE `cargo` DISABLE KEYS */;
INSERT INTO `cargo` (`C_CODIGO`, `C_DESCRICAO`, `C_DATACAD`) VALUES
	(32, 'GERENTE', '2022-10-18'),
	(33, 'ADMINISTRADOR', '2022-10-18'),
	(34, 'DIRETOR', '2022-10-18'),
	(35, 'CEO', '2022-10-18');
/*!40000 ALTER TABLE `cargo` ENABLE KEYS */;

-- Copiando estrutura para tabela financeiro.finalizador
CREATE TABLE IF NOT EXISTS `finalizador` (
  `F_CODIGO` int(11) NOT NULL AUTO_INCREMENT,
  `F_DESCRICAO` varchar(20) COLLATE armscii8_bin NOT NULL,
  `F_DATACAD` date NOT NULL,
  PRIMARY KEY (`F_CODIGO`)
) ENGINE=InnoDB DEFAULT CHARSET=armscii8 COLLATE=armscii8_bin;

-- Copiando dados para a tabela financeiro.finalizador: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `finalizador` DISABLE KEYS */;
/*!40000 ALTER TABLE `finalizador` ENABLE KEYS */;

-- Copiando estrutura para tabela financeiro.pessoa
CREATE TABLE IF NOT EXISTS `pessoa` (
  `P_CODIGO` int(11) NOT NULL AUTO_INCREMENT,
  `P_NOME` varchar(100) COLLATE armscii8_bin NOT NULL DEFAULT '0',
  `P_IDADE` int(11) DEFAULT NULL,
  `P_TELEFONE` varchar(14) COLLATE armscii8_bin DEFAULT NULL,
  `P_EMAIL` varchar(100) COLLATE armscii8_bin DEFAULT NULL,
  `P_CPFCNPJ` varchar(19) COLLATE armscii8_bin DEFAULT NULL,
  `P_SEXO` varchar(10) COLLATE armscii8_bin DEFAULT NULL,
  `P_CARGO` varchar(20) COLLATE armscii8_bin NOT NULL DEFAULT '0',
  `P_ENDERECO` varchar(100) COLLATE armscii8_bin DEFAULT NULL,
  `P_BAIRRO` varchar(60) COLLATE armscii8_bin DEFAULT NULL,
  `P_NUMERO` int(11) DEFAULT NULL,
  `P_DATACAD` date NOT NULL,
  PRIMARY KEY (`P_CODIGO`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=armscii8 COLLATE=armscii8_bin;

-- Copiando dados para a tabela financeiro.pessoa: ~1 rows (aproximadamente)
/*!40000 ALTER TABLE `pessoa` DISABLE KEYS */;
INSERT INTO `pessoa` (`P_CODIGO`, `P_NOME`, `P_IDADE`, `P_TELEFONE`, `P_EMAIL`, `P_CPFCNPJ`, `P_SEXO`, `P_CARGO`, `P_ENDERECO`, `P_BAIRRO`, `P_NUMERO`, `P_DATACAD`) VALUES
	(20, 'GABRIEL PELOSO DE OLIVEIRA', 28, '(14)99828-5647', 'GABRIEL_PELOSO@HOTMAIL.COM', '423.477.318-23', 'MASCULINO', 'CEO', 'RUA CB PM JOSE RIBEIRO FERREIRA', 'PARQUE ROOSEVELT', 455, '2022-10-18');
/*!40000 ALTER TABLE `pessoa` ENABLE KEYS */;

-- Copiando estrutura para tabela financeiro.usuario
CREATE TABLE IF NOT EXISTS `usuario` (
  `U_CODIGO` int(11) NOT NULL AUTO_INCREMENT,
  `U_PESSOA` varchar(50) COLLATE armscii8_bin NOT NULL,
  `U_NOMEUSUARIO` varchar(50) COLLATE armscii8_bin NOT NULL,
  `U_SENHA` varchar(10) COLLATE armscii8_bin NOT NULL,
  `U_DATACAD` date NOT NULL,
  PRIMARY KEY (`U_CODIGO`)
) ENGINE=InnoDB DEFAULT CHARSET=armscii8 COLLATE=armscii8_bin;

-- Copiando dados para a tabela financeiro.usuario: ~0 rows (aproximadamente)
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
