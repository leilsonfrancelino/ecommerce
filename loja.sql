-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: 09-Maio-2022 às 02:07
-- Versão do servidor: 5.7.26
-- versão do PHP: 7.0.33

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `loja`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `categorias`
--

DROP TABLE IF EXISTS `categorias`;
CREATE TABLE IF NOT EXISTS `categorias` (
  `categoria_id` int(11) NOT NULL AUTO_INCREMENT,
  `categoria_pai_id` int(11) DEFAULT NULL,
  `categoria_nome` varchar(45) NOT NULL,
  `categoria_ativa` tinyint(1) DEFAULT NULL,
  `categoria_meta_link` varchar(100) DEFAULT NULL,
  `categoria_data_criacao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `categoria_data_alteracao` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`categoria_id`),
  KEY `categoria_pai_id` (`categoria_pai_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `categorias`
--

INSERT INTO `categorias` (`categoria_id`, `categoria_pai_id`, `categoria_nome`, `categoria_ativa`, `categoria_meta_link`, `categoria_data_criacao`, `categoria_data_alteracao`) VALUES
(1, 2, 'Notebooks', 1, 'notebooks', '2022-04-24 19:18:30', '2022-04-30 17:23:01'),
(3, 3, 'Roteadores', 1, 'roteadores', '2022-04-25 00:56:20', '2022-04-30 17:23:26'),
(4, 2, 'Desktops', 1, 'desktops', '2022-04-30 02:40:12', '2022-04-30 17:23:51'),
(5, 2, 'Repetidores', 1, 'repetidores', '2022-04-30 17:29:18', '2022-04-30 17:29:18'),
(6, 2, 'Switches', 1, 'switches', '2022-04-30 17:29:36', '2022-04-30 17:29:36'),
(7, 2, 'Impressoras', 1, 'impressoras', '2022-04-30 17:29:55', '2022-04-30 17:29:55'),
(8, 2, 'Monitores', 1, 'monitores', '2022-04-30 17:30:13', '2022-04-30 17:30:13'),
(9, 2, 'Scanners e Mesas Digitalizadoras', 1, 'scanners-e-mesas-digitalizadoras', '2022-04-30 17:30:52', '2022-04-30 17:30:52'),
(10, 3, 'Placas Mães', 1, 'placas-maes', '2022-04-30 17:31:32', '2022-04-30 17:31:32'),
(11, 3, 'HDs', 1, 'hds', '2022-04-30 17:32:25', '2022-04-30 17:33:56'),
(12, 3, 'SSDs', 1, 'ssds', '2022-04-30 17:32:44', '2022-04-30 17:34:37'),
(13, 3, 'Processadores', 1, 'processadores', '2022-04-30 17:33:36', '2022-04-30 17:33:36'),
(14, 3, 'Placas de vídeo', 1, 'placas-de-video', '2022-04-30 17:35:00', '2022-04-30 17:35:00'),
(15, 2, 'Memórias', 1, 'memorias', '2022-04-30 17:35:40', '2022-04-30 17:35:40'),
(16, 3, 'Gabinetes', 1, 'gabinetes', '2022-04-30 17:36:28', '2022-04-30 17:36:28'),
(17, 3, 'Fontes', 1, 'fontes', '2022-04-30 17:36:55', '2022-04-30 17:38:53'),
(18, 3, 'Placas de som', 1, 'placas-de-som', '2022-04-30 17:37:34', '2022-04-30 17:38:30'),
(19, 7, 'Câmeras digitais', 1, 'cameras-digitais', '2022-04-30 17:38:07', '2022-04-30 17:38:07'),
(20, 7, 'Caixa de som portátil', 1, 'caixa-de-som-portatil', '2022-04-30 17:40:33', '2022-04-30 17:40:33'),
(21, 2, 'Acessórios', 1, 'acessorios', '2022-04-30 17:41:01', '2022-04-30 17:41:01'),
(22, 4, 'Mouses', 1, 'mouses', '2022-04-30 17:41:25', '2022-04-30 17:41:25'),
(23, 4, 'Teclados', 1, 'teclados', '2022-04-30 17:41:43', '2022-04-30 17:42:04'),
(24, 4, 'Fones de ouvido', 1, 'fones-de-ouvido', '2022-04-30 17:42:32', '2022-04-30 17:42:32'),
(25, 4, 'Mousepad', 1, 'mousepad', '2022-04-30 17:43:01', '2022-04-30 17:43:01'),
(26, 4, 'Webcam', 1, 'webcam', '2022-04-30 17:43:37', '2022-04-30 17:43:37'),
(27, 5, 'Console', 1, 'console', '2022-04-30 17:44:07', '2022-04-30 17:44:07'),
(28, 5, 'Jogos', 1, 'jogos', '2022-04-30 17:44:31', '2022-04-30 17:44:31'),
(29, 6, 'Smartphones', 1, 'smartphones', '2022-04-30 17:46:01', '2022-04-30 17:46:01'),
(30, 6, 'Smartwatches', 1, 'smartwatches', '2022-04-30 17:46:26', '2022-04-30 17:46:26'),
(31, 6, 'Iphone', 1, 'iphone', '2022-04-30 17:46:55', '2022-04-30 17:46:55'),
(32, 6, 'Celulares', 1, 'celulares', '2022-04-30 17:47:40', '2022-04-30 17:47:40'),
(33, 6, 'Telefone fixo', 1, 'telefone-fixo', '2022-04-30 17:48:12', '2022-04-30 17:48:12');

-- --------------------------------------------------------

--
-- Estrutura da tabela `categorias_pai`
--

DROP TABLE IF EXISTS `categorias_pai`;
CREATE TABLE IF NOT EXISTS `categorias_pai` (
  `categoria_pai_id` int(11) NOT NULL AUTO_INCREMENT,
  `categoria_pai_nome` varchar(45) NOT NULL,
  `categoria_pai_ativa` tinyint(1) DEFAULT NULL,
  `categoria_pai_meta_link` varchar(100) DEFAULT NULL,
  `categoria_pai_data_criacao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `categoria_pai_data_alteracao` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`categoria_pai_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `categorias_pai`
--

INSERT INTO `categorias_pai` (`categoria_pai_id`, `categoria_pai_nome`, `categoria_pai_ativa`, `categoria_pai_meta_link`, `categoria_pai_data_criacao`, `categoria_pai_data_alteracao`) VALUES
(2, 'Informática', 1, 'informatica', '2022-04-24 18:57:32', '2022-04-24 18:57:32'),
(3, 'Hardware', 1, 'hardware', '2022-04-29 23:50:18', '2022-04-29 23:50:18'),
(4, 'Periféricos', 1, 'perifericos', '2022-04-30 17:17:31', '2022-04-30 17:17:31'),
(5, 'Games', 1, 'games', '2022-04-30 17:17:55', '2022-04-30 17:17:55'),
(6, 'Telefonia', 1, 'telefonia', '2022-04-30 17:21:15', '2022-04-30 17:21:15'),
(7, 'Eletrônicos', 1, 'eletronicos', '2022-04-30 17:21:38', '2022-04-30 17:21:38');

-- --------------------------------------------------------

--
-- Estrutura da tabela `clientes`
--

DROP TABLE IF EXISTS `clientes`;
CREATE TABLE IF NOT EXISTS `clientes` (
  `cliente_id` int(11) NOT NULL AUTO_INCREMENT,
  `cliente_data_cadastro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `cliente_nome` varchar(45) NOT NULL,
  `cliente_sobrenome` varchar(150) NOT NULL,
  `cliente_data_nascimento` date DEFAULT NULL,
  `cliente_cpf` varchar(20) NOT NULL,
  `cliente_email` varchar(150) NOT NULL,
  `cliente_telefone_fixo` varchar(20) DEFAULT NULL,
  `cliente_telefone_movel` varchar(20) NOT NULL,
  `cliente_cep` varchar(10) NOT NULL,
  `cliente_endereco` varchar(155) NOT NULL,
  `cliente_numero_endereco` varchar(20) NOT NULL,
  `cliente_bairro` varchar(45) NOT NULL,
  `cliente_cidade` varchar(105) NOT NULL,
  `cliente_estado` varchar(2) NOT NULL,
  `cliente_complemento` varchar(145) DEFAULT NULL,
  `cliente_data_alteracao` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`cliente_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `clientes`
--

INSERT INTO `clientes` (`cliente_id`, `cliente_data_cadastro`, `cliente_nome`, `cliente_sobrenome`, `cliente_data_nascimento`, `cliente_cpf`, `cliente_email`, `cliente_telefone_fixo`, `cliente_telefone_movel`, `cliente_cep`, `cliente_endereco`, `cliente_numero_endereco`, `cliente_bairro`, `cliente_cidade`, `cliente_estado`, `cliente_complemento`, `cliente_data_alteracao`) VALUES
(1, '2022-04-27 03:00:00', 'Fulano', 'de Tal', '2020-03-10', '071.787.700-07', 'fulano@fulano.com', '(00) 0000-0000', '(00) 00000-0000', '15980-000', 'Rua Monte Alto', '45', 'Centro', 'Santos', 'SP', 'Ao lado da Praça', '2022-04-27 23:53:25'),
(2, '2022-04-29 01:49:08', 'Cicrano', 'de Tal', '1985-06-01', '303.361.990-82', 'cicrano@cicrano.com', '(00) 0000-0001', '(00) 00000-0000', '15980-000', 'Bernardino de Carvalho', '23', 'Centro', 'Araraquara', 'SP', 'Prefeitura mesma rua', '2022-04-29 01:49:08');

-- --------------------------------------------------------

--
-- Estrutura da tabela `groups`
--

DROP TABLE IF EXISTS `groups`;
CREATE TABLE IF NOT EXISTS `groups` (
  `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `description` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `groups`
--

INSERT INTO `groups` (`id`, `name`, `description`) VALUES
(1, 'admin', 'Administrator'),
(2, 'clientes', 'Clientes');

-- --------------------------------------------------------

--
-- Estrutura da tabela `login_attempts`
--

DROP TABLE IF EXISTS `login_attempts`;
CREATE TABLE IF NOT EXISTS `login_attempts` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(45) NOT NULL,
  `login` varchar(100) NOT NULL,
  `time` int(11) UNSIGNED DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Estrutura da tabela `marcas`
--

DROP TABLE IF EXISTS `marcas`;
CREATE TABLE IF NOT EXISTS `marcas` (
  `marca_id` int(11) NOT NULL AUTO_INCREMENT,
  `marca_nome` varchar(45) NOT NULL,
  `marca_meta_link` varchar(255) NOT NULL,
  `marca_ativa` tinyint(1) DEFAULT NULL,
  `marca_data_criacao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `marca_data_alteracao` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`marca_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `marcas`
--

INSERT INTO `marcas` (`marca_id`, `marca_nome`, `marca_meta_link`, `marca_ativa`, `marca_data_criacao`, `marca_data_alteracao`) VALUES
(1, 'Samsung', 'samsung', 1, '2022-04-24 00:40:13', '2022-05-01 00:32:16'),
(2, 'Motorola', 'motorola', 1, '2022-05-01 00:32:38', NULL),
(3, 'Microsoft', 'microsoft', 1, '2022-05-01 00:33:09', NULL),
(4, 'Asus', 'asus', 1, '2022-05-01 00:33:25', NULL),
(5, 'Nokia', 'nokia', 1, '2022-05-01 00:33:44', NULL),
(6, 'Sony', 'sony', 1, '2022-05-01 00:33:58', NULL),
(7, 'Positivo', 'positivo', 1, '2022-05-01 00:34:14', NULL),
(8, 'Apple', 'apple', 1, '2022-05-01 00:34:29', NULL),
(9, 'Multilaser', 'multilaser', 1, '2022-05-01 00:34:48', NULL),
(10, 'Lenovo', 'lenovo', 1, '2022-05-01 00:35:19', NULL),
(11, 'Acer', 'acer', 1, '2022-05-01 00:35:47', NULL),
(12, 'Intel', 'intel', 1, '2022-05-01 00:36:24', NULL),
(13, 'Gigabyte', 'gigabyte', 1, '2022-05-01 00:37:31', NULL),
(14, 'NVidia', 'nvidia', 1, '2022-05-01 00:37:54', NULL),
(15, 'AMD', 'amd', 1, '2022-05-01 00:38:16', NULL),
(16, 'Kingston', 'kingston', 1, '2022-05-01 00:38:49', NULL),
(17, 'IBM', 'ibm', 1, '2022-05-01 00:39:23', NULL),
(18, 'Seagate', 'seagate', 1, '2022-05-01 00:39:37', NULL),
(19, 'Compaq', 'compaq', 1, '2022-05-01 00:40:35', NULL),
(20, 'Cisco', 'cisco', 1, '2022-05-01 00:41:21', NULL),
(21, 'Intelbras', 'intelbras', 1, '2022-05-01 00:41:38', NULL),
(22, 'TP-Link', 'tp-link', 1, '2022-05-01 00:41:59', NULL),
(23, 'Nikon', 'nikon', 1, '2022-05-01 00:42:31', NULL),
(24, 'Canon', 'canon', 1, '2022-05-01 00:42:47', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos`
--

DROP TABLE IF EXISTS `produtos`;
CREATE TABLE IF NOT EXISTS `produtos` (
  `produto_id` int(11) NOT NULL AUTO_INCREMENT,
  `produto_codigo` varchar(45) DEFAULT NULL,
  `produto_data_cadastro` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `produto_categoria_pai_id` int(11) DEFAULT NULL,
  `produto_categoria_id` int(11) DEFAULT NULL,
  `produto_marca_id` int(11) DEFAULT NULL,
  `produto_nome` varchar(255) DEFAULT NULL,
  `produto_meta_link` varchar(255) DEFAULT NULL,
  `produto_peso` int(11) DEFAULT '0',
  `produto_altura` int(11) DEFAULT '0',
  `produto_largura` int(11) DEFAULT '0',
  `produto_comprimento` int(11) DEFAULT '0',
  `produto_valor` decimal(10,2) DEFAULT NULL,
  `produto_destaque` tinyint(1) DEFAULT NULL,
  `produto_controlar_estoque` tinyint(1) DEFAULT NULL,
  `produto_quantidade_estoque` int(11) DEFAULT '0',
  `produto_ativo` tinyint(1) DEFAULT NULL,
  `produto_descricao` longtext,
  `produto_data_alteracao` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`produto_id`),
  KEY `produto_categoria_id` (`produto_categoria_id`),
  KEY `produto_marca_id` (`produto_marca_id`),
  KEY `produto_categoria_pai_id` (`produto_categoria_pai_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `produtos`
--

INSERT INTO `produtos` (`produto_id`, `produto_codigo`, `produto_data_cadastro`, `produto_categoria_pai_id`, `produto_categoria_id`, `produto_marca_id`, `produto_nome`, `produto_meta_link`, `produto_peso`, `produto_altura`, `produto_largura`, `produto_comprimento`, `produto_valor`, `produto_destaque`, `produto_controlar_estoque`, `produto_quantidade_estoque`, `produto_ativo`, `produto_descricao`, `produto_data_alteracao`) VALUES
(3, '01452397', '2022-05-09 01:13:51', 6, 29, 1, 'Smartphone Motorola Moto G 3ª Geração Edição Especial Cabernet Dual Chip Desbloqueado Android 5.1 Tela HD 5', '', 1, 15, 15, 15, '3500.00', 1, 1, 5, 1, '&lt;h1&gt;Smartphone para o que der e vier&lt;/h1&gt;\r\n\r\n&lt;p&gt;Prepare-se para as surpresas maravilhosas que o novo &lt;strong&gt;Moto G 3ª Geração&lt;/strong&gt; apresenta para você: ele está redesenhado, melhorado e mais completo!&lt;/p&gt;\r\n\r\n&lt;p&gt;Com uma fantástica configuração e um design de tirar o fôlego, ele irá te surpreender. Da Tecnologia IPX7 de resistência à água à memória expansível para cartão Micro SD de até 32BG, esse aparelho te deixa por dentro do que há de mais moderno em tecnologia para Android.&lt;/p&gt;\r\n\r\n&lt;p&gt;Quer saber mais? Então vem com a gente e navegue pelo mundo de um dos smartphones mais queridos da &lt;strong&gt;Motorola&lt;/strong&gt;!&lt;/p&gt;\r\n\r\n&lt;p&gt;Informações Técnicas&lt;/p&gt;\r\n\r\n&lt;table&gt;\r\n &lt;tbody&gt;\r\n  &lt;tr&gt;\r\n   &lt;th&gt;Marca&lt;/th&gt;\r\n   &lt;td&gt;Motorola&lt;/td&gt;\r\n  &lt;/tr&gt;\r\n  &lt;tr&gt;\r\n   &lt;th&gt;Cor&lt;/th&gt;\r\n   &lt;td&gt;Preto&lt;/td&gt;\r\n  &lt;/tr&gt;\r\n  &lt;tr&gt;\r\n   &lt;th&gt;Tipo de Chip&lt;/th&gt;\r\n   &lt;td&gt;Micro Chip&lt;/td&gt;\r\n  &lt;/tr&gt;\r\n  &lt;tr&gt;\r\n   &lt;th&gt;Quantidade de Chips&lt;/th&gt;\r\n   &lt;td&gt;Dual Chip&lt;/td&gt;\r\n  &lt;/tr&gt;\r\n  &lt;tr&gt;\r\n   &lt;th&gt;Sistema Operacional&lt;/th&gt;\r\n   &lt;td&gt;Android&lt;/td&gt;\r\n  &lt;/tr&gt;\r\n  &lt;tr&gt;\r\n   &lt;th&gt;Processador&lt;/th&gt;\r\n   &lt;td&gt;1.4GHz&lt;/td&gt;\r\n  &lt;/tr&gt;\r\n  &lt;tr&gt;\r\n   &lt;th&gt;Tipo de tela&lt;/th&gt;\r\n   &lt;td&gt;LCD TFT&lt;/td&gt;\r\n  &lt;/tr&gt;\r\n  &lt;tr&gt;\r\n   &lt;th&gt;Tamanho do Display&lt;/th&gt;\r\n   &lt;td&gt;5&quot;&lt;/td&gt;\r\n  &lt;/tr&gt;\r\n  &lt;tr&gt;\r\n   &lt;th&gt;Banda&lt;/th&gt;\r\n   &lt;td&gt;GSM 850; 900; 1800; 1900 MHz; WCDMA 850; 900; 1700; 1900; 2100 MHz; LTE 700 (B28); 1700 (B4); 2600 (B7) MHz&lt;/td&gt;\r\n  &lt;/tr&gt;\r\n  &lt;tr&gt;\r\n   &lt;th&gt;Conectividade&lt;/th&gt;\r\n   &lt;td&gt;4G&lt;/td&gt;\r\n  &lt;/tr&gt;\r\n  &lt;tr&gt;\r\n   &lt;th&gt;NFC&lt;/th&gt;\r\n   &lt;td&gt;Não&lt;/td&gt;\r\n  &lt;/tr&gt;\r\n  &lt;tr&gt;\r\n   &lt;th&gt;Memória Interna&lt;/th&gt;\r\n   &lt;td&gt;16GB&lt;/td&gt;\r\n  &lt;/tr&gt;\r\n  &lt;tr&gt;\r\n   &lt;th&gt;Câmera traseira&lt;/th&gt;\r\n   &lt;td&gt;13MP&lt;/td&gt;\r\n  &lt;/tr&gt;\r\n  &lt;tr&gt;\r\n   &lt;th&gt;Filmadora&lt;/th&gt;\r\n   &lt;td&gt;Full HD&lt;/td&gt;\r\n  &lt;/tr&gt;\r\n  &lt;tr&gt;\r\n   &lt;th&gt;TV&lt;/th&gt;\r\n   &lt;td&gt;Não&lt;/td&gt;\r\n  &lt;/tr&gt;\r\n  &lt;tr&gt;\r\n   &lt;th&gt;Expansivo até&lt;/th&gt;\r\n   &lt;td&gt;MicroSD até 32GB&lt;/td&gt;\r\n  &lt;/tr&gt;\r\n  &lt;tr&gt;\r\n   &lt;th&gt;Alimentação/Tipo de bateria&lt;/th&gt;\r\n   &lt;td&gt;2470 mAh&lt;/td&gt;\r\n  &lt;/tr&gt;\r\n  &lt;tr&gt;\r\n   &lt;th&gt;Conteúdo da Embalagem&lt;/th&gt;\r\n   &lt;td&gt;1 Aparelho Moto G 3ª Geração 16GB Preto com Capa Cabernet; 1 Carregador de parede; 1 Fone de ouvido estereo; 1 Kit de manuais; 1 Cabo para sincronismo; 1 Capa Traseira Preta&lt;/td&gt;\r\n  &lt;/tr&gt;\r\n  &lt;tr&gt;\r\n   &lt;th&gt;Dimensões aproximadas do produto - cm (AxLxP)&lt;/th&gt;\r\n   &lt;td&gt;14,2x7,2x1,1cm&lt;/td&gt;\r\n  &lt;/tr&gt;\r\n  &lt;tr&gt;\r\n   &lt;th&gt;Peso líq. aproximado do produto (kg)&lt;/th&gt;\r\n   &lt;td&gt;150 gramas&lt;/td&gt;\r\n  &lt;/tr&gt;\r\n  &lt;tr&gt;\r\n   &lt;th&gt;Garantia do Fornecedor&lt;/th&gt;\r\n   &lt;td&gt;12 meses&lt;/td&gt;\r\n  &lt;/tr&gt;\r\n  &lt;tr&gt;\r\n   &lt;th&gt;Referência do modelo&lt;/th&gt;\r\n   &lt;td&gt;XT1543CBP&lt;/td&gt;\r\n  &lt;/tr&gt;\r\n  &lt;tr&gt;\r\n   &lt;th&gt;Fornecedor&lt;/th&gt;\r\n   &lt;td&gt;Motorola&lt;/td&gt;\r\n  &lt;/tr&gt;\r\n  &lt;tr&gt;\r\n   &lt;th&gt;SAC&lt;/th&gt;\r\n   &lt;td&gt;Grande SP: 11 4004 4000; Demais regiões: 0800 12 4421&lt;/td&gt;\r\n  &lt;/tr&gt;\r\n &lt;/tbody&gt;\r\n&lt;/table&gt;\r\n\r\n&lt;p&gt; &lt;/p&gt;', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `produtos_fotos`
--

DROP TABLE IF EXISTS `produtos_fotos`;
CREATE TABLE IF NOT EXISTS `produtos_fotos` (
  `foto_id` int(11) NOT NULL AUTO_INCREMENT,
  `foto_produto_id` int(11) DEFAULT NULL,
  `foto_caminho` varchar(255) NOT NULL,
  PRIMARY KEY (`foto_id`),
  KEY `fk_foto_produto_id` (`foto_produto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `produtos_fotos`
--

INSERT INTO `produtos_fotos` (`foto_id`, `foto_produto_id`, `foto_caminho`) VALUES
(11, 3, 'bf1e6c8c71defd67ea89463939e1fbdf.jpg');

-- --------------------------------------------------------

--
-- Estrutura da tabela `sistema`
--

DROP TABLE IF EXISTS `sistema`;
CREATE TABLE IF NOT EXISTS `sistema` (
  `sistema_id` int(11) NOT NULL,
  `sistema_razao_social` varchar(145) DEFAULT NULL,
  `sistema_nome_fantasia` varchar(145) DEFAULT NULL,
  `sistema_cnpj` varchar(25) DEFAULT NULL,
  `sistema_ie` varchar(25) DEFAULT NULL,
  `sistema_telefone_fixo` varchar(25) DEFAULT NULL,
  `sistema_telefone_movel` varchar(25) NOT NULL,
  `sistema_email` varchar(100) DEFAULT NULL,
  `sistema_site_url` varchar(100) DEFAULT NULL,
  `sistema_cep` varchar(25) DEFAULT NULL,
  `sistema_endereco` varchar(145) DEFAULT NULL,
  `sistema_numero` varchar(25) DEFAULT NULL,
  `sistema_cidade` varchar(45) DEFAULT NULL,
  `sistema_estado` varchar(2) DEFAULT NULL,
  `sistema_produtos_destaques` int(11) NOT NULL,
  `sistema_texto` tinytext,
  `sistema_data_alteracao` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `sistema`
--

INSERT INTO `sistema` (`sistema_id`, `sistema_razao_social`, `sistema_nome_fantasia`, `sistema_cnpj`, `sistema_ie`, `sistema_telefone_fixo`, `sistema_telefone_movel`, `sistema_email`, `sistema_site_url`, `sistema_cep`, `sistema_endereco`, `sistema_numero`, `sistema_cidade`, `sistema_estado`, `sistema_produtos_destaques`, `sistema_texto`, `sistema_data_alteracao`) VALUES
(1, 'Loja virtual', 'Sensação do Momento', '80.838.809/0001-26', '683.90228-49', '(16) 3232-3030', '(16) 9999-9999', 'lojavirtual@contato.com.br', 'http://lojavirtual.com.br', '80510-000', 'Rua da Programação', '54', 'São Paulo', 'SP', 10, 'Preço e qualidade!', '2022-05-01 00:52:14');

-- --------------------------------------------------------

--
-- Estrutura da tabela `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `ip_address` varchar(45) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(254) NOT NULL,
  `cliente_user_id` int(11) DEFAULT NULL,
  `activation_selector` varchar(255) DEFAULT NULL,
  `activation_code` varchar(255) DEFAULT NULL,
  `forgotten_password_selector` varchar(255) DEFAULT NULL,
  `forgotten_password_code` varchar(255) DEFAULT NULL,
  `forgotten_password_time` int(11) UNSIGNED DEFAULT NULL,
  `remember_selector` varchar(255) DEFAULT NULL,
  `remember_code` varchar(255) DEFAULT NULL,
  `created_on` int(11) UNSIGNED NOT NULL,
  `last_login` int(11) UNSIGNED DEFAULT NULL,
  `active` tinyint(1) UNSIGNED DEFAULT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `company` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uc_email` (`email`),
  UNIQUE KEY `uc_activation_selector` (`activation_selector`),
  UNIQUE KEY `uc_forgotten_password_selector` (`forgotten_password_selector`),
  UNIQUE KEY `uc_remember_selector` (`remember_selector`),
  KEY `cliente_user_id` (`cliente_user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `users`
--

INSERT INTO `users` (`id`, `ip_address`, `username`, `password`, `email`, `cliente_user_id`, `activation_selector`, `activation_code`, `forgotten_password_selector`, `forgotten_password_code`, `forgotten_password_time`, `remember_selector`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`) VALUES
(1, '127.0.0.1', 'administrator', '$2y$12$68J1neG25LgjkJl.yf5YT.hG1OuQ0GQV71SqsoqJLHRrpOjRqKvHC', 'admin@admin.com', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 1268889823, 1651092268, 1, 'Admin', 'istrator', 'ADMIN', '0'),
(8, '127.0.0.1', 'leilson', '$2y$12$VCSSn6KXnWIxj1eu7JDZTOUx3jGZpMFvzmbB9/rXI67UWjKqlOQAy', 'leilsonf@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1651185465, 1652055027, 1, 'Leilson', 'FRANCELINO', NULL, NULL),
(9, '', 'fulanodetal', '$2y$10$xrj6p/LQUnIvzZ0SxbmU4euDHjN4a73EEU3kTwfsUS2hGLHC/kY92', 'fulano@fulano.com', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1651185465, NULL, 1, 'Fulano', 'de Tal', NULL, NULL),
(10, '127.0.0.1', 'cicranodetal', '$2y$10$X.7BF9FNaLxGBiByutXMruQhA4yinC9Om/SdGXSdtPTpR9k2CebAi', 'cicrano@cicrano.com', 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1651196948, NULL, 1, 'Cicrano', 'de Tal', NULL, '(00) 00000-0000');

-- --------------------------------------------------------

--
-- Estrutura da tabela `users_groups`
--

DROP TABLE IF EXISTS `users_groups`;
CREATE TABLE IF NOT EXISTS `users_groups` (
  `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` int(11) UNSIGNED NOT NULL,
  `group_id` mediumint(8) UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uc_users_groups` (`user_id`,`group_id`),
  KEY `fk_users_groups_users1_idx` (`user_id`),
  KEY `fk_users_groups_groups1_idx` (`group_id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `users_groups`
--

INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES
(21, 1, 1),
(18, 8, 1),
(22, 9, 2),
(23, 10, 2);

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `categorias`
--
ALTER TABLE `categorias`
  ADD CONSTRAINT `fk_categoria_pai_id` FOREIGN KEY (`categoria_pai_id`) REFERENCES `categorias_pai` (`categoria_pai_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `produtos_fotos`
--
ALTER TABLE `produtos_fotos`
  ADD CONSTRAINT `fk_foto_produto_id` FOREIGN KEY (`foto_produto_id`) REFERENCES `produtos` (`produto_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_cliente_user_id` FOREIGN KEY (`cliente_user_id`) REFERENCES `clientes` (`cliente_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `users_groups`
--
ALTER TABLE `users_groups`
  ADD CONSTRAINT `fk_users_groups_groups1` FOREIGN KEY (`group_id`) REFERENCES `groups` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_users_groups_users1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
