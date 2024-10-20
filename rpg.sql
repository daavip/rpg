-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 20/10/2024 às 23:57
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `rpg`
--

-- --------------------------------------------------------

--
-- Estrutura para tabela `conta`
--

CREATE TABLE `conta` (
  `ID_CONTA` int(11) NOT NULL,
  `REGIAO` varchar(80) NOT NULL,
  `STATUS_CONTA` varchar(90) NOT NULL,
  `LOGIN_USER` varchar(200) DEFAULT NULL,
  `SENHA` varchar(80) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `conta`
--

INSERT INTO `conta` (`ID_CONTA`, `REGIAO`, `STATUS_CONTA`, `LOGIN_USER`, `SENHA`) VALUES
(1, 'ZeDoleite', 'Ativa', 'elrond_v', 'senha123'),
(2, 'DeideKosta', 'Banida', 'sauron_123', 'sombradoterror'),
(3, 'TEkomoNakama', 'Ativa', 'eomer_rohan', 'espada_45'),
(4, 'Shrek', 'Inativa', 'aragorn_king', 'anduril2024'),
(5, 'Minato', 'Ativa', 'frodo_bolseiro', 'comio_ku_dequentalendo');

-- --------------------------------------------------------

--
-- Estrutura para tabela `equipamento`
--

CREATE TABLE `equipamento` (
  `ID_EQUIPAMENTO` int(11) NOT NULL,
  `NOME` varchar(80) NOT NULL,
  `TIPO` varchar(60) NOT NULL,
  `DESCRICAO` varchar(250) DEFAULT NULL,
  `RARIDADE` varchar(20) NOT NULL,
  `ENCANTAMENTO` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `equipamento`
--

INSERT INTO `equipamento` (`ID_EQUIPAMENTO`, `NOME`, `TIPO`, `DESCRICAO`, `RARIDADE`, `ENCANTAMENTO`) VALUES
(1, 'Espada Longa', 'Arma', 'Uma espada de lâmina longa e afiada, ideal para guerreiros.', 'Raro', 'Fogo Flamejante'),
(2, 'Escudo de Ferro', 'Escudo', 'Escudo robusto forjado em ferro, oferece excelente defesa.', 'Comum', NULL),
(3, 'Arco Élfico', 'Arma', 'Arco feito pelos elfos, conhecido por sua precisão.', 'Épico', 'Tiro Veloz'),
(4, 'Elmo do Dragão', 'Armadura', 'Elmo resistente forjado com escamas de dragão.', 'Lendário', 'Resistência ao Fogo'),
(5, 'Botas de Agilidade', 'Armadura', 'Botas leves que aumentam a velocidade do usuário.', 'Raro', 'Agilidade Aumentada');

-- --------------------------------------------------------

--
-- Estrutura para tabela `habilidade`
--

CREATE TABLE `habilidade` (
  `ID_HABILIDADE` int(11) NOT NULL,
  `NOME` varchar(40) NOT NULL,
  `TIPO` varchar(40) NOT NULL,
  `CUSTO_MANA` decimal(7,2) DEFAULT NULL,
  `DANO` decimal(7,2) DEFAULT NULL,
  `COOLDOWN` decimal(7,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `habilidade`
--

INSERT INTO `habilidade` (`ID_HABILIDADE`, `NOME`, `TIPO`, `CUSTO_MANA`, `DANO`, `COOLDOWN`) VALUES
(1, 'Bola de Fogo', 'Magia', 20.00, 50.00, 5.00),
(2, 'Ataque Sombrio', 'Físico', 40.00, 40.00, 7.00),
(3, 'Cura', 'Magia', 15.00, NULL, 3.00),
(4, 'Fúria do Guerreiro', 'Físico', NULL, 60.00, 10.00),
(5, 'Rajada de Gelo', 'Magia', 25.00, 45.00, 6.00);

-- --------------------------------------------------------

--
-- Estrutura para tabela `missao`
--

CREATE TABLE `missao` (
  `ID_MISSAO` int(11) NOT NULL,
  `TITULO` varchar(40) NOT NULL,
  `DESCRICAO` varchar(200) DEFAULT NULL,
  `ID_RECOMPENSA` int(11) NOT NULL,
  `STATUS_MISSAO` varchar(20) DEFAULT NULL,
  `LVL_REQUERIDO` int(11) DEFAULT NULL,
  `DIFICULDADE` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `personagem`
--

CREATE TABLE `personagem` (
  `ID_PERSONAGEM` int(11) NOT NULL,
  `NOME` varchar(100) NOT NULL,
  `CLASSE` varchar(50) NOT NULL,
  `LEVEL_PERSONAGEM` int(11) DEFAULT NULL,
  `XP_PERSONAGEM` int(11) DEFAULT NULL,
  `VIDA_MAX` decimal(7,2) NOT NULL,
  `VIDA_ATUAL` decimal(7,2) DEFAULT NULL,
  `MANA` int(11) DEFAULT NULL,
  `INTELIGENCIA` int(11) DEFAULT NULL,
  `ID_RACA` int(11) NOT NULL,
  `ID_MISSAO` int(11) NOT NULL,
  `ID_HABILIDADE` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `personagem_equipamento`
--

CREATE TABLE `personagem_equipamento` (
  `ID_PERSONAGEM_EQUIPAMENTO` int(11) NOT NULL,
  `ID_PERSONAGEM` int(11) DEFAULT NULL,
  `ID_EQUIPAMENTO` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estrutura para tabela `raca`
--

CREATE TABLE `raca` (
  `ID_RACA` int(11) NOT NULL,
  `NOME` varchar(120) NOT NULL,
  `VIDA_BASE` decimal(7,2) NOT NULL,
  `FORCA_BASE` int(11) NOT NULL,
  `DEFESA_BASE` int(11) NOT NULL,
  `AGILIDADE_BASE` int(11) NOT NULL,
  `INTELIGENCIA_BASE` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `raca`
--

INSERT INTO `raca` (`ID_RACA`, `NOME`, `VIDA_BASE`, `FORCA_BASE`, `DEFESA_BASE`, `AGILIDADE_BASE`, `INTELIGENCIA_BASE`) VALUES
(1, 'Elfo', 100.00, 15, 10, 20, 25),
(2, 'Anão', 120.00, 25, 30, 10, 15),
(3, 'Orc', 150.00, 35, 20, 15, 10),
(4, 'Humano', 110.00, 20, 15, 18, 18),
(5, 'Dragão', 200.00, 40, 35, 15, 30);

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `conta`
--
ALTER TABLE `conta`
  ADD PRIMARY KEY (`ID_CONTA`),
  ADD UNIQUE KEY `LOGIN_USER` (`LOGIN_USER`);

--
-- Índices de tabela `equipamento`
--
ALTER TABLE `equipamento`
  ADD PRIMARY KEY (`ID_EQUIPAMENTO`);

--
-- Índices de tabela `habilidade`
--
ALTER TABLE `habilidade`
  ADD PRIMARY KEY (`ID_HABILIDADE`);

--
-- Índices de tabela `missao`
--
ALTER TABLE `missao`
  ADD PRIMARY KEY (`ID_MISSAO`),
  ADD KEY `ID_RECOMPENSA` (`ID_RECOMPENSA`);

--
-- Índices de tabela `personagem`
--
ALTER TABLE `personagem`
  ADD PRIMARY KEY (`ID_PERSONAGEM`),
  ADD KEY `ID_RACA` (`ID_RACA`),
  ADD KEY `ID_MISSAO` (`ID_MISSAO`),
  ADD KEY `ID_HABILIDADE` (`ID_HABILIDADE`);

--
-- Índices de tabela `personagem_equipamento`
--
ALTER TABLE `personagem_equipamento`
  ADD PRIMARY KEY (`ID_PERSONAGEM_EQUIPAMENTO`),
  ADD KEY `ID_PERSONAGEM` (`ID_PERSONAGEM`),
  ADD KEY `ID_EQUIPAMENTO` (`ID_EQUIPAMENTO`);

--
-- Índices de tabela `raca`
--
ALTER TABLE `raca`
  ADD PRIMARY KEY (`ID_RACA`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `conta`
--
ALTER TABLE `conta`
  MODIFY `ID_CONTA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `equipamento`
--
ALTER TABLE `equipamento`
  MODIFY `ID_EQUIPAMENTO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `habilidade`
--
ALTER TABLE `habilidade`
  MODIFY `ID_HABILIDADE` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de tabela `missao`
--
ALTER TABLE `missao`
  MODIFY `ID_MISSAO` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `personagem`
--
ALTER TABLE `personagem`
  MODIFY `ID_PERSONAGEM` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `personagem_equipamento`
--
ALTER TABLE `personagem_equipamento`
  MODIFY `ID_PERSONAGEM_EQUIPAMENTO` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de tabela `raca`
--
ALTER TABLE `raca`
  MODIFY `ID_RACA` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `missao`
--
ALTER TABLE `missao`
  ADD CONSTRAINT `missao_ibfk_1` FOREIGN KEY (`ID_RECOMPENSA`) REFERENCES `equipamento` (`ID_EQUIPAMENTO`);

--
-- Restrições para tabelas `personagem`
--
ALTER TABLE `personagem`
  ADD CONSTRAINT `personagem_ibfk_1` FOREIGN KEY (`ID_RACA`) REFERENCES `raca` (`ID_RACA`),
  ADD CONSTRAINT `personagem_ibfk_2` FOREIGN KEY (`ID_MISSAO`) REFERENCES `missao` (`ID_MISSAO`),
  ADD CONSTRAINT `personagem_ibfk_3` FOREIGN KEY (`ID_HABILIDADE`) REFERENCES `habilidade` (`ID_HABILIDADE`);

--
-- Restrições para tabelas `personagem_equipamento`
--
ALTER TABLE `personagem_equipamento`
  ADD CONSTRAINT `personagem_equipamento_ibfk_1` FOREIGN KEY (`ID_PERSONAGEM`) REFERENCES `personagem` (`ID_PERSONAGEM`),
  ADD CONSTRAINT `personagem_equipamento_ibfk_2` FOREIGN KEY (`ID_EQUIPAMENTO`) REFERENCES `equipamento` (`ID_EQUIPAMENTO`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
