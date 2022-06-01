-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: 01-Jun-2022 às 00:10
-- Versão do servidor: 5.7.26
-- versão do PHP: 7.1.29

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
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=latin1;

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
(33, 6, 'Telefone fixo', 1, 'telefone-fixo', '2022-04-30 17:48:12', '2022-04-30 17:48:12'),
(34, 5, 'Joystick', 1, 'joystick', '2022-05-19 01:28:08', '2022-05-19 01:28:08'),
(35, 7, 'Tablet', 1, 'tablet', '2022-05-19 02:01:41', '2022-05-19 02:01:41');

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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `clientes`
--

INSERT INTO `clientes` (`cliente_id`, `cliente_data_cadastro`, `cliente_nome`, `cliente_sobrenome`, `cliente_data_nascimento`, `cliente_cpf`, `cliente_email`, `cliente_telefone_fixo`, `cliente_telefone_movel`, `cliente_cep`, `cliente_endereco`, `cliente_numero_endereco`, `cliente_bairro`, `cliente_cidade`, `cliente_estado`, `cliente_complemento`, `cliente_data_alteracao`) VALUES
(27, '2022-05-31 23:57:21', 'Leilson', 'Francelino', '1980-10-10', '292.810.628-60', 'leilsonf@gmail.com', '', '(16) 98131-4007', '15980-000', 'Bernardino de Carvalho', '387', 'Vila Morano', 'Dobrada', 'SP', '', '2022-05-31 23:57:21');

-- --------------------------------------------------------

--
-- Estrutura da tabela `config_correios`
--

DROP TABLE IF EXISTS `config_correios`;
CREATE TABLE IF NOT EXISTS `config_correios` (
  `config_id` int(11) NOT NULL,
  `config_cep_origem` varchar(20) NOT NULL,
  `config_codigo_pac` varchar(10) NOT NULL,
  `config_codigo_sedex` varchar(10) NOT NULL,
  `config_somar_frete` decimal(10,2) NOT NULL,
  `config_valor_declarado` decimal(5,2) NOT NULL,
  `config_data_alteracao` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `config_correios`
--

INSERT INTO `config_correios` (`config_id`, `config_cep_origem`, `config_codigo_pac`, `config_codigo_sedex`, `config_somar_frete`, `config_valor_declarado`, `config_data_alteracao`) VALUES
(1, '15980-000', '04510', '04014', '3.50', '21.50', '2022-05-19 23:51:27');

-- --------------------------------------------------------

--
-- Estrutura da tabela `config_pagseguro`
--

DROP TABLE IF EXISTS `config_pagseguro`;
CREATE TABLE IF NOT EXISTS `config_pagseguro` (
  `config_id` int(11) NOT NULL AUTO_INCREMENT,
  `config_email` varchar(255) NOT NULL,
  `config_token` varchar(100) NOT NULL,
  `config_ambiente` tinyint(1) NOT NULL COMMENT '0 -> Ambiente real / 1 -> Ambiente sandbox',
  `config_data_alteracao` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `config_pagseguro`
--

INSERT INTO `config_pagseguro` (`config_id`, `config_email`, `config_token`, `config_ambiente`, `config_data_alteracao`) VALUES
(1, 'leilsonf@gmail.com', '8BDC43814C9F431CBC5EDB83196064D1', 1, '2022-05-25 23:20:24');

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
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=latin1;

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
(24, 'Canon', 'canon', 1, '2022-05-01 00:42:47', NULL),
(25, 'Konami', 'konami', 1, '2022-05-19 01:35:07', NULL),
(26, 'GoPro', 'gopro', 1, '2022-05-22 23:40:57', NULL),
(27, 'D-link', 'd-link', 1, '2022-05-22 23:50:42', NULL),
(28, 'HyperX', 'hyperx', 1, '2022-05-22 23:58:33', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
CREATE TABLE IF NOT EXISTS `pedidos` (
  `pedido_id` int(11) NOT NULL AUTO_INCREMENT,
  `pedido_codigo` varchar(8) DEFAULT NULL,
  `pedido_cliente_id` int(11) DEFAULT NULL,
  `pedido_valor_produtos` decimal(15,2) DEFAULT NULL,
  `pedido_valor_frete` decimal(15,2) DEFAULT NULL,
  `pedido_valor_final` decimal(15,2) DEFAULT NULL,
  `pedido_forma_envio` tinyint(1) DEFAULT NULL COMMENT '1 = Correios Sedex---------------------2 - Correios PAC',
  `pedido_data_cadastro` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `pedido_data_alteracao` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`pedido_id`),
  KEY `pedido_cliente_id` (`pedido_cliente_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `pedidos`
--

INSERT INTO `pedidos` (`pedido_id`, `pedido_codigo`, `pedido_cliente_id`, `pedido_valor_produtos`, `pedido_valor_frete`, `pedido_valor_final`, `pedido_forma_envio`, `pedido_data_cadastro`, `pedido_data_alteracao`) VALUES
(5, '27910836', 27, '1500.00', '24.50', '1524.50', 1, '2022-05-31 23:59:08', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `pedidos_produtos`
--

DROP TABLE IF EXISTS `pedidos_produtos`;
CREATE TABLE IF NOT EXISTS `pedidos_produtos` (
  `pedido_id` int(11) DEFAULT NULL,
  `produto_id` int(11) DEFAULT NULL,
  `produto_nome` varchar(200) NOT NULL,
  `produto_quantidade` int(11) NOT NULL,
  `produto_valor_unitario` decimal(15,2) NOT NULL,
  `produto_valor_total` decimal(15,2) NOT NULL,
  KEY `pedido_id` (`pedido_id`,`produto_id`),
  KEY `produto_id` (`produto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `pedidos_produtos`
--

INSERT INTO `pedidos_produtos` (`pedido_id`, `produto_id`, `produto_nome`, `produto_quantidade`, `produto_valor_unitario`, `produto_valor_total`) VALUES
(5, 4, 'Smartphone Motorola Moto G 3ª Geração Edição Especial Cabernet Dual Chip Desbloqueado Android 5.1 Tela HD 5', 1, '1500.00', '1500.00');

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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `produtos`
--

INSERT INTO `produtos` (`produto_id`, `produto_codigo`, `produto_data_cadastro`, `produto_categoria_pai_id`, `produto_categoria_id`, `produto_marca_id`, `produto_nome`, `produto_meta_link`, `produto_peso`, `produto_altura`, `produto_largura`, `produto_comprimento`, `produto_valor`, `produto_destaque`, `produto_controlar_estoque`, `produto_quantidade_estoque`, `produto_ativo`, `produto_descricao`, `produto_data_alteracao`) VALUES
(4, '98034761', '2022-05-09 15:46:21', 6, 29, 2, 'Smartphone Motorola Moto G 3ª Geração Edição Especial Cabernet Dual Chip Desbloqueado Android 5.1 Tela HD 5', 'smartphone-motorola-moto-g-3-geracao-edicao-especial-cabernet-dual-chip-desbloqueado-android-51-tela-hd-5', 1, 15, 15, 15, '1500.00', 1, 1, 3, 1, '&lt;h2&gt;Smartphone para o que der e vier&lt;/h2&gt;\r\n\r\n&lt;p&gt;Prepare-se para as surpresas maravilhosas que o novo &lt;strong&gt;Moto G 3ª Geração&lt;/strong&gt; apresenta para você: ele está redesenhado, melhorado e mais completo! Com uma fantástica configuração e um design de tirar o fôlego, ele irá te surpreender. Da Tecnologia IPX7 de resistência à água à memória expansível para cartão Micro SD de até 32BG, esse aparelho te deixa por dentro do que há de mais moderno em tecnologia para Android. Quer saber mais? Então vem com a gente e navegue pelo mundo de um dos smartphones mais queridos da &lt;strong&gt;Motorola&lt;/strong&gt;!&lt;/p&gt;\r\n\r\n&lt;p&gt;Informações Técnicas&lt;/p&gt;\r\n\r\n&lt;table&gt;\r\n &lt;tbody&gt;\r\n  &lt;tr&gt;\r\n   &lt;th&gt;Marca&lt;/th&gt;\r\n   &lt;td&gt;Motorola&lt;/td&gt;\r\n  &lt;/tr&gt;\r\n  &lt;tr&gt;\r\n   &lt;th&gt;Cor&lt;/th&gt;\r\n   &lt;td&gt;Preto&lt;/td&gt;\r\n  &lt;/tr&gt;\r\n  &lt;tr&gt;\r\n   &lt;th&gt;Tipo de Chip&lt;/th&gt;\r\n   &lt;td&gt;Micro Chip&lt;/td&gt;\r\n  &lt;/tr&gt;\r\n  &lt;tr&gt;\r\n   &lt;th&gt;Quantidade de Chips&lt;/th&gt;\r\n   &lt;td&gt;Dual Chip&lt;/td&gt;\r\n  &lt;/tr&gt;\r\n  &lt;tr&gt;\r\n   &lt;th&gt;Sistema Operacional&lt;/th&gt;\r\n   &lt;td&gt;Android&lt;/td&gt;\r\n  &lt;/tr&gt;\r\n  &lt;tr&gt;\r\n   &lt;th&gt;Processador&lt;/th&gt;\r\n   &lt;td&gt;1.4GHz&lt;/td&gt;\r\n  &lt;/tr&gt;\r\n  &lt;tr&gt;\r\n   &lt;th&gt;Tipo de tela&lt;/th&gt;\r\n   &lt;td&gt;LCD TFT&lt;/td&gt;\r\n  &lt;/tr&gt;\r\n  &lt;tr&gt;\r\n   &lt;th&gt;Tamanho do Display&lt;/th&gt;\r\n   &lt;td&gt;5&quot;&lt;/td&gt;\r\n  &lt;/tr&gt;\r\n  &lt;tr&gt;\r\n   &lt;th&gt;Banda&lt;/th&gt;\r\n   &lt;td&gt;GSM 850; 900; 1800; 1900 MHz; WCDMA 850; 900; 1700; 1900; 2100 MHz; LTE 700 (B28); 1700 (B4); 2600 (B7) MHz&lt;/td&gt;\r\n  &lt;/tr&gt;\r\n  &lt;tr&gt;\r\n   &lt;th&gt;Conectividade&lt;/th&gt;\r\n   &lt;td&gt;4G&lt;/td&gt;\r\n  &lt;/tr&gt;\r\n  &lt;tr&gt;\r\n   &lt;th&gt;NFC&lt;/th&gt;\r\n   &lt;td&gt;Não&lt;/td&gt;\r\n  &lt;/tr&gt;\r\n  &lt;tr&gt;\r\n   &lt;th&gt;Memória Interna&lt;/th&gt;\r\n   &lt;td&gt;16GB&lt;/td&gt;\r\n  &lt;/tr&gt;\r\n  &lt;tr&gt;\r\n   &lt;th&gt;Câmera traseira&lt;/th&gt;\r\n   &lt;td&gt;13MP&lt;/td&gt;\r\n  &lt;/tr&gt;\r\n  &lt;tr&gt;\r\n   &lt;th&gt;Filmadora&lt;/th&gt;\r\n   &lt;td&gt;Full HD&lt;/td&gt;\r\n  &lt;/tr&gt;\r\n  &lt;tr&gt;\r\n   &lt;th&gt;TV&lt;/th&gt;\r\n   &lt;td&gt;Não&lt;/td&gt;\r\n  &lt;/tr&gt;\r\n  &lt;tr&gt;\r\n   &lt;th&gt;Expansivo até&lt;/th&gt;\r\n   &lt;td&gt;MicroSD até 32GB&lt;/td&gt;\r\n  &lt;/tr&gt;\r\n  &lt;tr&gt;\r\n   &lt;th&gt;Alimentação/Tipo de bateria&lt;/th&gt;\r\n   &lt;td&gt;2470 mAh&lt;/td&gt;\r\n  &lt;/tr&gt;\r\n  &lt;tr&gt;\r\n   &lt;th&gt;Conteúdo da Embalagem&lt;/th&gt;\r\n   &lt;td&gt;1 Aparelho Moto G 3ª Geração 16GB Preto com Capa Cabernet; 1 Carregador de parede; 1 Fone de ouvido estereo; 1 Kit de manuais; 1 Cabo para sincronismo; 1 Capa Traseira Preta&lt;/td&gt;\r\n  &lt;/tr&gt;\r\n  &lt;tr&gt;\r\n   &lt;th&gt;Dimensões aproximadas do produto - cm (AxLxP)&lt;/th&gt;\r\n   &lt;td&gt;14,2x7,2x1,1cm&lt;/td&gt;\r\n  &lt;/tr&gt;\r\n  &lt;tr&gt;\r\n   &lt;th&gt;Peso líq. aproximado do produto (kg)&lt;/th&gt;\r\n   &lt;td&gt;150 gramas&lt;/td&gt;\r\n  &lt;/tr&gt;\r\n  &lt;tr&gt;\r\n   &lt;th&gt;Garantia do Fornecedor&lt;/th&gt;\r\n   &lt;td&gt;12 meses&lt;/td&gt;\r\n  &lt;/tr&gt;\r\n  &lt;tr&gt;\r\n   &lt;th&gt;Referência do modelo&lt;/th&gt;\r\n   &lt;td&gt;XT1543CBP&lt;/td&gt;\r\n  &lt;/tr&gt;\r\n  &lt;tr&gt;\r\n   &lt;th&gt;Fornecedor&lt;/th&gt;\r\n   &lt;td&gt;Motorola&lt;/td&gt;\r\n  &lt;/tr&gt;\r\n  &lt;tr&gt;\r\n   &lt;th&gt;SAC&lt;/th&gt;\r\n   &lt;td&gt;Grande SP: 11 4004 4000; Demais regiões: 0800 12 4421&lt;/td&gt;\r\n  &lt;/tr&gt;\r\n &lt;/tbody&gt;\r\n&lt;/table&gt;\r\n\r\n&lt;p&gt; &lt;/p&gt;', NULL),
(5, '38259174', '2022-05-19 01:22:40', 3, 13, 12, 'Processador Intel Core i7-4790K  Haswell, Cache 8MB, 4.4GHz (4.4Ghz Max Turbo), LGA 1150, Intel HD Graphics 4600 BX80646I74790K Core i7-4790K 4.40GHz 8MB', 'processador-intel-core-i7-4790k-haswell-cache-8mb-44ghz-44ghz-max-turbo-lga-1150-intel-hd-graphics-4600-bx80646i74790k-core-i7-4790k-440ghz-8mb', 1, 20, 20, 20, '800.00', 1, 1, 10, 1, '&lt;p&gt;&lt;strong&gt;Características:&lt;/strong&gt;&lt;br&gt;\r\n- Marca: Intel&lt;br&gt;\r\n- Modelo: BX80646I74790K&lt;br&gt;\r\n&lt;br&gt;\r\n&lt;strong&gt;Especificações:&lt;/strong&gt;&lt;br&gt;\r\n- Status: Launched&lt;br&gt;\r\n- Data de inicialização: Q2&amp;#39;14&lt;br&gt;\r\n- Número do processador: i7-4790K&lt;br&gt;\r\n- Número de núcleos: 4&lt;br&gt;\r\n- Nº de threads: 8&lt;br&gt;\r\n- Velocidade do relógio: 4 GHz&lt;br&gt;\r\n- Frequência máx. turbo: 4.4 GHz&lt;br&gt;\r\n- Cache inteligente Intel®: 8 MB&lt;br&gt;\r\n- DMI2: 5 GT/s&lt;br&gt;\r\n- Conjunto de instruções: 64-bit&lt;br&gt;\r\n- Extensões do conjunto de instruções: SSE 4.1/4.2, AVX 2.0&lt;br&gt;\r\n- Litografia: 22 nm&lt;br&gt;\r\n- Escalabilidade: 1S Only&lt;br&gt;\r\n- TDP máximo: 88 W&lt;br&gt;\r\n- Especificação de solução térmica: PCG 2013D&lt;br&gt;\r\n&lt;br&gt;\r\n&lt;strong&gt;Memória:&lt;/strong&gt;&lt;br&gt;\r\n- Tamanho máximo de memória (de acordo com o tipo de memória): 32 GB&lt;br&gt;\r\n- Tipos de memória: DDR3-1333/1600&lt;br&gt;\r\n- Nº de canais de memória: 2&lt;br&gt;\r\n- Largura de banda máxima da memória: 25,6 GB/s&lt;br&gt;\r\n&lt;br&gt;\r\n&lt;strong&gt;Gráficos:&lt;/strong&gt;&lt;br&gt;\r\n- Gráficos do processador: Intel® HD Graphics 4600&lt;br&gt;\r\n- Frequência da base gráfica: 350 MHz&lt;br&gt;\r\n- Máxima frequência dinâmica da placa gráfica: 1.25 GHz&lt;br&gt;\r\n- Quantidade máxima de memória gráfica de vídeo: 1.7 GB&lt;br&gt;\r\n- Intel® Quick Sync Video&lt;br&gt;\r\n- Tecnologia Intel® InTru™ 3D&lt;br&gt;\r\n- Intel® Insider™&lt;br&gt;\r\n- Intel® Wireless Display&lt;br&gt;\r\n- Tecnologia de Alta Definição Intel® Clear Video&lt;br&gt;\r\n- Nº de telas suportadas: 3&lt;br&gt;\r\n&lt;br&gt;\r\n&lt;strong&gt;Opções de expansão:&lt;/strong&gt;&lt;br&gt;\r\n- Revisão de PCI Express: 3.0&lt;br&gt;\r\n- Configurações PCI Express: Up to 1x16, 2x8, 1x8/2x4&lt;br&gt;\r\n- Nº máximo de linhas PCI Express: 16&lt;br&gt;\r\n&lt;br&gt;\r\n&lt;strong&gt;Informações adicionais:&lt;/strong&gt;&lt;br&gt;\r\n- Configuração máxima da CPU: 1&lt;br&gt;\r\n- TCASE: 72.72°C&lt;br&gt;\r\n- Litografia gráfica e IMC: 22nm&lt;br&gt;\r\n- Soquetes suportados: FCLGA1150&lt;br&gt;\r\n&lt;br&gt;\r\n&lt;strong&gt;Tecnologia avançada:&lt;/strong&gt;&lt;br&gt;\r\n- Tecnologia Intel® Turbo Boost: 2.0&lt;br&gt;\r\n- Tecnologia Hyper-Threading Intel®&lt;br&gt;\r\n- Tecnologia de virtualização Intel® (VT-x)&lt;br&gt;\r\n- Tecnologia de virtualização Intel® para E/S direcionada (VT-d)&lt;br&gt;\r\n- Intel® VT-x com Tabelas de página estendida (EPT)&lt;br&gt;\r\n- Intel® TSX-NI&lt;br&gt;\r\n- Intel® 64&lt;br&gt;\r\n- Tecnologia Intel® My WiFi&lt;br&gt;\r\n- Estados ociosos&lt;br&gt;\r\n- Enhanced Intel SpeedStep® Technology&lt;br&gt;\r\n- Tecnologias de monitoramento térmico&lt;br&gt;\r\n- Tecnologia de proteção da identidade Intel®&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;br&gt;\r\n&lt;strong&gt;Conteúdo da embalagem:&lt;/strong&gt;&lt;br&gt;\r\n- 01 Processador Intel&lt;br&gt;\r\n- 01 Cooler&lt;br&gt;\r\n&lt;br&gt;\r\n&lt;strong&gt;Garantia&lt;/strong&gt;&lt;br&gt;\r\n12 meses de garantia&lt;br&gt;\r\n&lt;br&gt;\r\n&lt;strong&gt;Peso&lt;/strong&gt;&lt;br&gt;\r\n370 gramas (bruto com embalagem)&lt;/p&gt;', NULL),
(6, '52604379', '2022-05-19 01:31:20', 5, 34, 6, 'Controle Dazz Dualshock Bluetooth PS3 Preto 621121', 'controle-dazz-dualshock-bluetooth-ps3-preto-621121', 1, 15, 20, 15, '340.00', 1, 1, 20, 1, '&lt;p&gt;&lt;strong&gt;Características:&lt;/strong&gt;&lt;br&gt;\r\n- Marca:  Dazz &lt;br&gt;\r\n- Modelo: 621121&lt;br&gt;\r\n&lt;br&gt;\r\n&lt;strong&gt;Especificações:&lt;/strong&gt;&lt;br&gt;\r\n- Plataforma: PS3&lt;br&gt;\r\n- Sensor: SIX AXIS para maior realismo durante os jogos&lt;br&gt;\r\n- Conexão: Bluetooth&lt;br&gt;\r\n- Botões: L2 e R2 Customizados e botão Dazz que liga e desliga o console&lt;br&gt;\r\n- Dimensões: 145 x 75 x 117mm&lt;br&gt;\r\n- Cor: Preto&lt;br&gt;\r\n&lt;br&gt;\r\n&lt;strong&gt;Conteúdo da Embalagem:&lt;/strong&gt;&lt;br&gt;\r\n- Controle PS3&lt;br&gt;\r\n- Cabo Carregador &lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;Garantia&lt;/strong&gt;&lt;br&gt;\r\n12 meses de garantia&lt;br&gt;\r\n&lt;br&gt;\r\n&lt;strong&gt;Peso&lt;/strong&gt;&lt;br&gt;\r\n314 gramas (bruto com embalagem)&lt;/p&gt;', NULL),
(7, '48297603', '2022-05-19 01:37:21', 5, 28, 25, 'Game Pro Evolution Soccer - PES 2016 Xbox One', 'game-pro-evolution-soccer-pes-2016-xbox-one', 1, 5, 10, 15, '150.00', 1, 1, 15, 1, '&lt;p&gt;&lt;strong&gt;&lt;strong&gt;Características:&lt;/strong&gt;&lt;/strong&gt;&lt;br&gt;\r\n- Marca: Microsoft&lt;br&gt;\r\n- Game: PES 2016&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;&lt;strong&gt;Especificações:&lt;/strong&gt;&lt;/strong&gt;&lt;br&gt;\r\n- Plataforma: XBOX ONE&lt;br&gt;\r\n- Publisher: Konami&lt;br&gt;\r\n- Gênero: Esporte (Futebol)&lt;br&gt;\r\n- Multiplayer: 1 ~ 4 Jogadores (offline)&lt;br&gt;\r\n- Idioma: Português - Dublado&lt;br&gt;\r\n- Classificação: Livre&lt;br&gt;\r\n- Tipo de mídia: Blu-ray&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;&lt;strong&gt;Conteúdo da Embalagem:&lt;/strong&gt;&lt;/strong&gt;&lt;br&gt;\r\n- 1x Blu-ray Game&lt;br&gt;\r\n- Manual&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;&lt;strong&gt;ATENÇÃO!!! PARA GARANTIRMOS A SEGURANÇA E QUALIDADE DOS JOGOS POR NÓS FORNECIDOS, ESTE GAME NÃO PODERÁ SER DEVOLVIDO APÓS ABERTO, VISTO QUE TRATA-SE DE UM PRODUTO LACRADO.&lt;/strong&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;Garantia&lt;/strong&gt;&lt;br&gt;\r\n3 meses de garantia&lt;br&gt;\r\n&lt;br&gt;\r\n&lt;strong&gt;Peso&lt;/strong&gt;&lt;br&gt;\r\n80 gramas (bruto com embalagem)&lt;/p&gt;', NULL),
(8, '31604298', '2022-05-19 01:42:15', 2, 4, 10, 'Computador Lenovo 63 TW com Intel Core I3-4160 4GB 500GB Linux', 'computador-lenovo-63-tw-com-intel-core-i3-4160-4gb-500gb-linux', 3, 90, 90, 90, '2000.00', 1, 1, 3, 1, '&lt;p&gt;&lt;strong&gt;Características:&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;- Marca: Lenovo&lt;/p&gt;\r\n\r\n&lt;p&gt;- Modelo: 90AT005JBR&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt; Especificações: &lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;- Chipset Placa mãe: Intel H81 &lt;/p&gt;\r\n\r\n&lt;p&gt;- Slots PCIe X1: 02&lt;/p&gt;\r\n\r\n&lt;p&gt;- Slots PCIe X16: 01&lt;/p&gt;\r\n\r\n&lt;p&gt;- Placa de Vídeo: Compartilhada - Intel HD Graphics&lt;/p&gt;\r\n\r\n&lt;p&gt;- Drive Óptico: DVD+RW Dual Layer&lt;/p&gt;\r\n\r\n&lt;p&gt;- Rede: 10/100/1000 Mbps&lt;/p&gt;\r\n\r\n&lt;p&gt;- Fonte: 180 watts&lt;/p&gt;\r\n\r\n&lt;p&gt;- Gabinete: Mini Torre&lt;/p&gt;\r\n\r\n&lt;p&gt;- Sistema Operacional: Free Dos&lt;/p&gt;\r\n\r\n&lt;p&gt;- Dimensões aproximadas:  0,3 x 0,6 x 0,5 m&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;Processador:&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;- Intel Core i3&lt;/p&gt;\r\n\r\n&lt;p&gt;- Modelo: 4160 - 3.6GHz&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;Disco Rígido:&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;- Capacidade: 500GB &lt;/p&gt;\r\n\r\n&lt;p&gt;- Velocidade: 7200rpm &lt;/p&gt;\r\n\r\n&lt;p&gt;- SATA III&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;Memória:&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;- Tamanho: 4GB (1x4GB)&lt;/p&gt;\r\n\r\n&lt;p&gt;- Tipo: DDR3 1600 Mhz&lt;/p&gt;\r\n\r\n&lt;p&gt;- Tamanho máximo suportado: 16GB &lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;Conexões:&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;- USB 2.0: 04&lt;/p&gt;\r\n\r\n&lt;p&gt;- USB 3.0: 2&lt;/p&gt;\r\n\r\n&lt;p&gt;- VGA: 01&lt;/p&gt;\r\n\r\n&lt;p&gt;- Serial: 01 &lt;/p&gt;\r\n\r\n&lt;p&gt;- Display port: 01 &lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;Teclado:&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;- Cor: Preto&lt;/p&gt;\r\n\r\n&lt;p&gt;- Conexão: USB 2.0&lt;/p&gt;\r\n\r\n&lt;p&gt;- Padrão: ABNT 2 + Teclado numérico&lt;/p&gt;\r\n\r\n&lt;p&gt;- Multimídia&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;Mouse:&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;- Cor: Preto&lt;/p&gt;\r\n\r\n&lt;p&gt;- Conexão: USB 2.0&lt;/p&gt;\r\n\r\n&lt;p&gt;- Número de Botões: 3 &lt;/p&gt;\r\n\r\n&lt;p&gt;- Tecnologia: Óptico&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;Conteúdo da Emblagem:&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;- 01 Computador Lenovo&lt;/p&gt;\r\n\r\n&lt;p&gt;- 01 Teclado&lt;/p&gt;\r\n\r\n&lt;p&gt;- 01 Mouse&lt;/p&gt;\r\n\r\n&lt;p&gt;- Manual do Usuário&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;br&gt;\r\n&lt;strong&gt;Garantia&lt;/strong&gt;&lt;br&gt;\r\n12 meses de garantia&lt;br&gt;\r\n&lt;br&gt;\r\n&lt;strong&gt;Peso&lt;/strong&gt;&lt;br&gt;\r\n8400 gramas (bruto com embalagem)&lt;/p&gt;', NULL),
(9, '24039751', '2022-05-19 01:45:49', 7, 19, 23, 'Câmera Digital Nikon Coolpix P610 Full HD 16 MP - Vermelho', 'camera-digital-nikon-coolpix-p610-full-hd-16-mp-vermelho', 1, 20, 20, 20, '3500.00', 1, 1, 3, 1, '&lt;p&gt;&lt;strong&gt;&lt;strong&gt;Características:&lt;/strong&gt;&lt;/strong&gt;&lt;br&gt;\r\n- Marca: Nikon&lt;br&gt;\r\n- Modelo: P610&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;&lt;strong&gt;Especificaçõe:&lt;/strong&gt;&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;&lt;strong&gt;Tipo:&lt;/strong&gt;&lt;/strong&gt;&lt;br&gt;\r\n- Câmera Digital Compacta&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;&lt;strong&gt;Sensor de imagem:&lt;/strong&gt;&lt;/strong&gt;&lt;br&gt;\r\n- Pixels Efetivos 16,0 milhões&lt;br&gt;\r\n- Sensor de Imagem CMOS&lt;br&gt;\r\n- Tamanho do Sensor 1 / 2,3 pol.&lt;br&gt;\r\n- Total de Pixels 16,76 milhões (aprox.)&lt;br&gt;\r\n- Tamanho da imagem (pixels) 4608x3456 (16 M)&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;&lt;strong&gt;Lente:&lt;/strong&gt;&lt;/strong&gt;&lt;br&gt;\r\n- Cristal NIKKOR ED com Zoom ótico de 60x&lt;br&gt;\r\n- Distância focal da lente 4,3 a 258 mm (ângulo de visão equivalente à lente de 24 a 1440 mm em formato de 35 mm [135])&lt;br&gt;\r\n- Lente f/-número f/3.3-6.5&lt;br&gt;\r\n- Construção da Lente 16 elementos em 11 grupos&lt;br&gt;\r\n- Zoom da Lente 60 x&lt;br&gt;\r\n- Zoom Digital Até 4x (ângulo de visão equivalente à lente de 5.760 mm em formato de 35 mm [135])&lt;br&gt;\r\n- Abertura: Diafragma com íris de seis lâminas controlado eletronicamente&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;&lt;strong&gt;Redução de Vibração:&lt;/strong&gt;&lt;/strong&gt;&lt;br&gt;\r\n- Estabilizador de lente VR da lente (fotografias estáticas) &lt;br&gt;\r\n- Estabilizador de lente e VR eletrônico VR (vídeos)&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;&lt;strong&gt;Visor:&lt;/strong&gt;&lt;/strong&gt;&lt;br&gt;\r\n- Visor eletrônico, 0,5 cm LCD equivalente a aprox. 921.000 pontos com a função de ajuste de dioptria (-3 a + 3 m - 1)&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;&lt;strong&gt;Monitor:&lt;/strong&gt;&lt;/strong&gt;&lt;br&gt;\r\n- Tamanho do Monitor 3,0 pol. na diagonal&lt;br&gt;\r\n- Tipo de Monitor Ângulo Variável LCD-TFT com Película antirreflexo &lt;br&gt;\r\n- Ajuste de brilho em 6 níveis&lt;br&gt;\r\n- Resolução Monitor 921.000 pontos&lt;/p&gt;\r\n\r\n&lt;p&gt; &lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;&lt;strong&gt;Cobertura do Quadro do Monitor (modo de disparo):&lt;/strong&gt;&lt;/strong&gt;&lt;br&gt;\r\n- 100% horizontal (aprox.) - (comparado com a imagem real)&lt;br&gt;\r\n- 100% vertical (aprox.) - (comparado com a imagem real)&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;&lt;strong&gt;Cobertura do Quadro do Monitor (modo de reprodução):&lt;/strong&gt;&lt;/strong&gt;&lt;br&gt;\r\n- 100% horizontal (aprox.) - (comparado com a imagem real)&lt;br&gt;\r\n- 100% vertical (aprox.) - (comparado com a imagem real)&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;&lt;strong&gt;Mídia de Armazenamento:&lt;/strong&gt;&lt;/strong&gt;&lt;br&gt;\r\n- Cartão de memória SD &lt;br&gt;\r\n- Cartão de memória SDHC &lt;br&gt;\r\n- Cartão de memória SDXC&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;&lt;strong&gt;Sistema de Armazenamento de Arquivos:&lt;/strong&gt;&lt;/strong&gt;&lt;br&gt;\r\n- Em conformidade&lt;br&gt;\r\n- DCF &lt;br&gt;\r\n- EXIF 2.3&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;&lt;strong&gt;Formatos de Armazenamento de Arquivos:&lt;/strong&gt;&lt;/strong&gt;&lt;br&gt;\r\n- Imagens estáticas: JPEG &lt;br&gt;\r\n- Vídeos: MOV (Video: MPEG-4 AVC/H.264, Audio: LPCM estéreo)&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;&lt;strong&gt;Vídeo:&lt;/strong&gt;&lt;/strong&gt;&lt;br&gt;\r\n- Full HD: 1920x1080/60p &lt;br&gt;\r\n- Full HD: 1920x1080/50p &lt;br&gt;\r\n- Full HD: 1920x1080/ 30p &lt;br&gt;\r\n- Full HD: 1920x1080/ 25p &lt;br&gt;\r\n- HD: 1280x720/60p &lt;br&gt;\r\n- HD: 1280x720/50p &lt;br&gt;\r\n- HD: 1280x720/ 30p &lt;br&gt;\r\n- HD: 1280x720/ 25p &lt;br&gt;\r\n- HS 1920x1080/ 15p &lt;br&gt;\r\n- HS 1280x720/50p &lt;br&gt;\r\n- HS 1280x720 /60p &lt;br&gt;\r\n- HS 1920x1080/ 12.5p &lt;br&gt;\r\n- HS 640x480/ 100p &lt;br&gt;\r\n- VGA 640x480/30p &lt;br&gt;\r\n- VGA 640x480/25p &lt;br&gt;\r\n- HS 640x480/ 120p&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;&lt;strong&gt;Sensibilidade ISO:&lt;/strong&gt;&lt;/strong&gt;&lt;br&gt;\r\n- ISO 100 - 1600 &lt;br&gt;\r\n- ISO 3200, 6400 (disponível ao usar o modo P, S, A ou M) &lt;br&gt;\r\n- ISO Hi 1 (equivalente a ISO 12.800). Disponível ao utilizar modo monocromático de alto contraste em efeitos especiais&lt;br&gt;\r\n- Menor Sensibilidade ISO 100&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;&lt;strong&gt;Fotometria da Exposição:&lt;/strong&gt;&lt;/strong&gt;&lt;br&gt;\r\n- Matriz &lt;br&gt;\r\n- Ponderação Central &lt;br&gt;\r\n- Pontual&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;&lt;strong&gt;Controle de Exposição:&lt;/strong&gt;&lt;/strong&gt;&lt;br&gt;\r\n- Exposição auto programada com programa flexível &lt;br&gt;\r\n- Prioridade de abertura automática &lt;br&gt;\r\n- Bracketing de Exposição &lt;br&gt;\r\n- Manual &lt;br&gt;\r\n- Prioridade automática do obturador &lt;br&gt;\r\n- Compensação de exposição (EV de -2,0 a +2,0 em etapas de 1/3 EV)&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;&lt;strong&gt;Modos de Exposição:&lt;/strong&gt;&lt;/strong&gt;&lt;br&gt;\r\n- Automático &lt;br&gt;\r\n- Cena &lt;br&gt;\r\n- Seletor Automático de Cena &lt;br&gt;\r\n- Retrato Inteligente &lt;br&gt;\r\n- Efeitos Especiais&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;&lt;strong&gt;Modos de Cena:&lt;/strong&gt;&lt;/strong&gt;&lt;br&gt;\r\n- Luz de Fundo &lt;br&gt;\r\n- Observação de pássaros &lt;br&gt;\r\n- Praia &lt;br&gt;\r\n- Cópia em Preto e Branco &lt;br&gt;\r\n- Close up &lt;br&gt;\r\n- Crepúsculo/Madrugada &lt;br&gt;\r\n- Panorama Fácil &lt;br&gt;\r\n- Show de Fogos de Artifício &lt;br&gt;\r\n- Alimentos &lt;br&gt;\r\n- Paisagem &lt;br&gt;\r\n- Lua &lt;br&gt;\r\n- Museu &lt;br&gt;\r\n- Paisagem Noturna &lt;br&gt;\r\n- Retrato Noturno &lt;br&gt;\r\n- Festa/Interior &lt;br&gt;\r\n- Retrato Animal de Estimação &lt;br&gt;\r\n- Retrato &lt;br&gt;\r\n- Seletor Automático de Cena &lt;br&gt;\r\n- Neve &lt;br&gt;\r\n- Esportes &lt;br&gt;\r\n- Pôr-do-sol&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;&lt;strong&gt;Edição de Imagem em Câmera:&lt;/strong&gt;&lt;/strong&gt;&lt;br&gt;\r\n- Cortar &lt;br&gt;\r\n- D-Lighting &lt;br&gt;\r\n- Efeitos de Filtro &lt;br&gt;\r\n- Retoque Rápido &lt;br&gt;\r\n- Suavização de Pele &lt;br&gt;\r\n- Imagem Reduzida&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;&lt;strong&gt;Compensação de Exposição:&lt;/strong&gt;&lt;/strong&gt;&lt;br&gt;\r\n- EV de ±2 em passos de 1/3&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;&lt;strong&gt;Balanço de Branco:&lt;/strong&gt;&lt;/strong&gt;&lt;br&gt;\r\n- Automático &lt;br&gt;\r\n- Nublado &lt;br&gt;\r\n- Luz do dia &lt;br&gt;\r\n- Flash &lt;br&gt;\r\n- Fluorescente &lt;br&gt;\r\n- Incandescente &lt;br&gt;\r\n- Pré-ajuste do Balanço de Branco&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;&lt;strong&gt;Obturador:&lt;/strong&gt;&lt;/strong&gt;&lt;br&gt;\r\n- Obturador mecânico-eletrônico CMOS&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;&lt;strong&gt;Velocidade do Obturador:&lt;/strong&gt;&lt;/strong&gt;&lt;br&gt;\r\n- 1/4000 - 1 s &lt;br&gt;\r\n- 1/4000 - 15 s (quando ISSO é configurado em 100 e câmera em Modo M e a abertura está entre f/7.6&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;&lt;strong&gt;Velocidade Máxima de Disparo Contínuo com Resolução Total:&lt;/strong&gt;&lt;/strong&gt;&lt;br&gt;\r\n- Até 7 disparos de approx. 7 frames per second&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;&lt;strong&gt;Opções de Disparo Contínuo Seletor de Melhor Foto:&lt;/strong&gt;&lt;/strong&gt;&lt;br&gt;\r\n- H Contínuo &lt;br&gt;\r\n- H 60 Contínuo &lt;br&gt;\r\n- H 120 Contínuo &lt;br&gt;\r\n- L Contínuo &lt;br&gt;\r\n- Vários disparos 16 &lt;br&gt;\r\n- Cache pré-gravação &lt;br&gt;\r\n- Único&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;&lt;strong&gt;Temporizador automático:&lt;/strong&gt;&lt;/strong&gt;&lt;br&gt;\r\n- Pode ser selecionado com duração de 10 ou 2 segundos&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;&lt;strong&gt;Flash:&lt;/strong&gt;&lt;/strong&gt;&lt;br&gt;\r\n- Alcance (aprox.) do Flash embutido (Sensibilidade ISO: Automático): [W]: 0,5 a 7,5 m / [T]: 2,0 a 4,0 m&lt;br&gt;\r\n- Controle do Flash Embutido: Flash automático TTL com monitor pré-flash&lt;br&gt;\r\n- Flash Embutido&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;&lt;strong&gt;Interface:&lt;/strong&gt;&lt;/strong&gt;&lt;br&gt;\r\n- USB de alta velocidade&lt;br&gt;\r\n- Protocolo de transferência de dados da interface MTP / PTP&lt;br&gt;\r\n- Saída HDMI HDMI micro connector (Type D)&lt;br&gt;\r\n- Terminal de E/S E/S Digital (USB)&lt;br&gt;\r\n- Funcionalidade Wi-Fi&lt;br&gt;\r\n- GPS Embutido&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;&lt;strong&gt;Potência:&lt;/strong&gt;&lt;/strong&gt;&lt;br&gt;\r\n- Fontes de alimentação Uma Bateria Recarregável de Li-ion EN-EL23 (fornecida) &lt;br&gt;\r\n- Adaptador AC EH-67A (disponível separadamente)&lt;br&gt;\r\n- Tempo de carga 3 horas (usando o Adaptador/Carregador AC EH-71P e quando não tiver nenhuma carga remanescente) (Aprox.)&lt;br&gt;\r\n- Bateria/Baterias Bateria recarregável de íons de Lítio EN-EL23&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;&lt;strong&gt;Rosca do Tripé:&lt;/strong&gt;&lt;/strong&gt;&lt;br&gt;\r\n- ¼ (ISO 1222)&lt;br&gt;\r\n&lt;br&gt;\r\n&lt;strong&gt;Conteúdo da Embalagem:&lt;/strong&gt;&lt;br&gt;\r\n- 01 Câmera Digital Nikon Coolpix P610&lt;br&gt;\r\n- 01 Bateria recarregável&lt;br&gt;\r\n- 01 Adaptador / Carregador AC&lt;br&gt;\r\n- 01 Alça&lt;br&gt;\r\n- 01 Cabo USB&lt;br&gt;\r\n- 01 Tampa da Lente&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;br&gt;\r\n&lt;strong&gt;Garantia&lt;/strong&gt;&lt;br&gt;\r\n12 meses de garantia&lt;br&gt;\r\n&lt;br&gt;\r\n&lt;strong&gt;Peso&lt;/strong&gt;&lt;br&gt;\r\n945 gramas (bruto com embalagem)&lt;/p&gt;', NULL),
(10, '26137504', '2022-05-19 01:50:00', 4, 22, 9, 'Teclado e Mouse Gamer Multilaser Lightning TC195', 'teclado-e-mouse-gamer-multilaser-lightning-tc195', 1, 10, 50, 10, '240.00', 1, 1, 5, 1, '&lt;p&gt;&lt;strong&gt;Características:&lt;/strong&gt;&lt;br&gt;\r\n- Marca: Mulitlaser&lt;br&gt;\r\n- Modelo: TC195&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;Especificações:&lt;/strong&gt;&lt;br&gt;\r\n- Combo teclado e mouse com fio&lt;br&gt;\r\n- Opção de troca por teclas direcionais transparentes&lt;br&gt;\r\n- Conexão: USB&lt;br&gt;\r\n- Padrão: ABNT&lt;br&gt;\r\n- Compatível com: Windows 2000/ XP/ Vista, 7&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;Teclado:&lt;/strong&gt;&lt;br&gt;\r\n- 3 cores backlight opcional&lt;br&gt;\r\n- 10 funções multimídia&lt;br&gt;\r\n- Teclas silenciosas&lt;br&gt;\r\n- Dimensões: 49 x 20,5 x 30 cm&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;Mouse:&lt;/strong&gt;&lt;br&gt;\r\n- 6 botões com flash&lt;br&gt;\r\n- 5 milhões de cliques&lt;br&gt;\r\n- 4 níveis de velocidade: (800/1200/1600/2000dpi)&lt;br&gt;\r\n- Dimensões: 12,02 x 7,5 x 4,1 cm&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;Conteúdo da Embalagem:&lt;/strong&gt;&lt;br&gt;\r\n- 01 Teclado Multilaser&lt;br&gt;\r\n- 01 Mouse Multilaser&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;Observação:&lt;/strong&gt;&lt;br&gt;\r\n- Cores do Teclado e Mouse não é possível escolher, sendo sortido as cores.&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;Garantia&lt;/strong&gt;&lt;br&gt;\r\n12 meses de garantia&lt;br&gt;\r\n&lt;br&gt;\r\n&lt;strong&gt;Peso&lt;/strong&gt;&lt;br&gt;\r\n1250 gramas (bruto com embalagem)&lt;/p&gt;', NULL),
(11, '92087315', '2022-05-19 01:55:33', 3, 14, 13, 'Placa de Vídeo VGA GigaByte GTX750TI 1gb OC DDR5 2DVI / 2HDMI N75TOC-1GI', 'placa-de-video-vga-gigabyte-gtx750ti-1gb-oc-ddr5-2dvi-2hdmi-n75toc-1gi', 1, 10, 20, 20, '700.00', 1, 1, 6, 1, '&lt;p&gt;&lt;strong&gt;Características:&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;- Marca: Gigabyte&lt;/p&gt;\r\n\r\n&lt;p&gt;- Modelo: 2HDMI N75TOC-1GI&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;Especificações:&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;- Relógio núcleo: Base / impulso de relógio: 1033 / 1111MHz (padrão: 1020/1085)&lt;/p&gt;\r\n\r\n&lt;p&gt;- Relógio de memória: 5400 MHz&lt;/p&gt;\r\n\r\n&lt;p&gt;- Tecnologia de Processos: 28 nm&lt;/p&gt;\r\n\r\n&lt;p&gt;- Tamanho da memória: 1 GB&lt;/p&gt;\r\n\r\n&lt;p&gt;- Memória Bus: 128 bits&lt;/p&gt;\r\n\r\n&lt;p&gt;- Cartão Bus: PCI-E 3.0&lt;/p&gt;\r\n\r\n&lt;p&gt;- Tipo de memória: GDDR5&lt;/p&gt;\r\n\r\n&lt;p&gt;- DirectX: 12&lt;/p&gt;\r\n\r\n&lt;p&gt;- OpenGL: 4.4&lt;/p&gt;\r\n\r\n&lt;p&gt;- PCB Form: ATX&lt;/p&gt;\r\n\r\n&lt;p&gt;- Resolução máxima Digital: 4096 X 2160 (via HDMI 2)&lt;/p&gt;\r\n\r\n&lt;p&gt;- Resolução máxima Analógica: 2048 x 1536&lt;/p&gt;\r\n\r\n&lt;p&gt;- Multi-view: 4&lt;/p&gt;\r\n\r\n&lt;p&gt;- I/O: Dual-link DVI-I * 1 / DVI-D * 1 / HDMI * 2&lt;/p&gt;\r\n\r\n&lt;p&gt;- Tamanho do cartão: H = 43 mm, L = 185 mm, W = 135 mm&lt;/p&gt;\r\n\r\n&lt;p&gt;- Requisitos de alimentação: 400W (com um conector de alimentação externa de 6 pinos)&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;Conteúdo da embalagem:&lt;/strong&gt;&lt;/p&gt;\r\n\r\n&lt;p&gt;- 01 Placa de Vídeo VGA GigaByte GTX750TI&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;Garantia&lt;/strong&gt;&lt;br&gt;\r\n12 meses de garantia&lt;br&gt;\r\n&lt;br&gt;\r\n&lt;strong&gt;Peso&lt;/strong&gt;&lt;br&gt;\r\n650 gramas (bruto com embalagem)&lt;/p&gt;', NULL),
(12, '71358049', '2022-05-19 02:04:11', 7, 35, 1, 'Tablet Samsung Galaxy Tab E 7´ WI-FI SM-T113NU 8GB , Android 4.4 , Quad Core 1.3GHz , Câmera 2MP , RAM 1GB', 'tablet-samsung-galaxy-tab-e-7-wi-fi-sm-t113nu-8gb-android-44-quad-core-13ghz-camera-2mp-ram-1gb', 1, 10, 30, 30, '2100.00', 1, 1, 3, 1, '&lt;p&gt;&lt;strong&gt;Características:&lt;/strong&gt;&lt;br&gt;\r\n- Marca: Samsung&lt;br&gt;\r\n- Modelo: SM-T113NU&lt;br&gt;\r\n&lt;br&gt;\r\n&lt;strong&gt;Especificações: &lt;/strong&gt;&lt;br&gt;\r\n- GPS&lt;br&gt;\r\n- Cor: Preto&lt;br&gt;\r\n&lt;br&gt;\r\n&lt;strong&gt;Processador:&lt;/strong&gt;&lt;br&gt;\r\n- ARM Cortex A7 Quad Core de 1.3 Ghz&lt;br&gt;\r\n&lt;br&gt;\r\n&lt;strong&gt;Tela:&lt;/strong&gt;&lt;br&gt;\r\n- Capacitiva&lt;br&gt;\r\n- Tamanho da tela: 7”&lt;br&gt;\r\n- Formato: Widescreen&lt;br&gt;\r\n- Resolução: 1024 x 600&lt;br&gt;\r\n- Rotação automática da tela&lt;br&gt;\r\n&lt;br&gt;\r\n&lt;strong&gt;Memória:&lt;/strong&gt;&lt;br&gt;\r\n- Ram: 1GB&lt;br&gt;\r\n- Flash: 8GB&lt;br&gt;\r\n&lt;br&gt;\r\n&lt;strong&gt;Sistema Operacional:&lt;/strong&gt;&lt;br&gt;\r\n- Android Kit Kat 4.4&lt;br&gt;\r\n&lt;br&gt;\r\n&lt;strong&gt;Conectividade:&lt;/strong&gt;&lt;br&gt;\r\n- Wi-Fi: 802.11 b/g/n.&lt;br&gt;\r\n- Bluetooth: 4.0&lt;br&gt;\r\n&lt;br&gt;\r\n&lt;strong&gt;Câmera:&lt;/strong&gt;&lt;br&gt;\r\n- Frontal: 2MP&lt;br&gt;\r\n- Traseira: 2MP&lt;br&gt;\r\n- Zoom: 4x&lt;br&gt;\r\n- Efeitos da Foto&lt;br&gt;\r\n- Foco Automático&lt;br&gt;\r\n&lt;br&gt;\r\n&lt;strong&gt;Vídeos:&lt;/strong&gt;&lt;br&gt;\r\n- Resolução de reprodução: FHD (1920 x 1080)&lt;br&gt;\r\n- Resolução de gravação: VGA (640 x 480) &lt;br&gt;\r\n&lt;br&gt;\r\n&lt;strong&gt;Som:&lt;/strong&gt;&lt;br&gt;\r\n- MP3, M4A, 3GA, AAC, OGG, OGA, WAV&lt;br&gt;\r\n- AMR, AWB, FLAC, MID, MIDI, XMF, MXMF&lt;br&gt;\r\n- IMY, RTTTL, RTX, OTA&lt;br&gt;\r\n&lt;br&gt;\r\n&lt;strong&gt;Conexões:&lt;/strong&gt;&lt;br&gt;\r\n- Fone de Ouvido&lt;br&gt;\r\n- Cartão de Memória&lt;br&gt;\r\n&lt;br&gt;\r\n&lt;strong&gt;Alimentação:&lt;/strong&gt;&lt;br&gt;\r\n- Fonte: Bivolt&lt;br&gt;\r\n- Bateria: Recarregável de Ions de Lítio de 3600 mAh&lt;br&gt;\r\n&lt;br&gt;\r\n&lt;strong&gt;Conteúdo da Embalagem:&lt;/strong&gt;&lt;br&gt;\r\n- 01 Tablet Samsung Galaxy Tab E 7´   &lt;br&gt;\r\n- 01 Fone de Ouvido&lt;br&gt;\r\n- 01 Cabo USB&lt;br&gt;\r\n- 01 Carregador&lt;/p&gt;\r\n\r\n&lt;p&gt;&lt;strong&gt;Garantia&lt;/strong&gt;&lt;br&gt;\r\n12 meses de garantia&lt;br&gt;\r\n&lt;br&gt;\r\n&lt;strong&gt;Peso&lt;/strong&gt;&lt;br&gt;\r\n485 gramas (bruto com embalagem)&lt;/p&gt;', NULL),
(13, '12496083', '2022-05-22 23:46:10', 7, 19, 26, 'Câmera GOPRO Hero 8 Black - CHDHX-801-CM', 'camera-gopro-hero-8-black-chdhx-801-cm', 1, 15, 15, 15, '2399.99', 1, 1, 3, 1, '&lt;p&gt;Esta é a HERO8 Black, a mais versátil e mais estável câmera HERO já criada. O design otimizado facilita ainda mais o transporte da câmera e, graças às suas hastes dobráveis integradas, a troca de suportes leva apenas alguns segundos. E com o módulo de mídia opcional, você pode maximizar a capacidade de expansão para adicionar mais iluminação, áudio profissional e até mesmo outra tela. Há também o inovador recurso de estabilização HyperSmooth 2.0, com câmera lenta de cair o queixo.&lt;/p&gt;', NULL),
(14, '52943760', '2022-05-22 23:53:53', 2, 6, 27, 'Switch 8 portas 10/100 Mbps não gerenciável DES-1008C', 'switch-8-portas-10100-mbps-nao-gerenciavel-des-1008c', 1, 15, 15, 15, '59.00', 1, 1, 5, 1, '&lt;p&gt;Características do Produto&lt;/p&gt;\r\n\r\n&lt;p&gt;O DES-1008C 10/100 Mbps Switch é econômico, possui um plug-and-play de rede que é a solução para pequenas e médias empresas que precisam de fáceis pontos de acesso e expansão de rede, além disso fornece uma maneira rápida de conectividade.&lt;/p&gt;', NULL),
(15, '81627530', '2022-05-23 00:03:17', 2, 15, 28, 'Memória HyperX Fury, 8GB, 2666MHz, DDR4, CL16, Preto - HX426C16FB3/8', 'memoria-hyperx-fury-8gb-2666mhz-ddr4-cl16-preto-hx426c16fb38', 1, 15, 15, 15, '341.00', 1, 1, 5, 1, '&lt;p xss=removed&gt;A Memória RAM HyperX FURY DDR4 apresenta um visual incrível com um dissipador de calor atualizado. Com um potencial incrível para você performar em alto nível, ela conta com overclock automático Plug &amp; Play para módulos de velocidades até 2666MHz, sendo compatível com as mais recentes CPUs Intel e AMD. A Memória RAM HyperX FURY DDR4 possui garantia vitalícia, sendo uma atualização excelente e com preço acessível para fazer com que você tenha um desempenho incrível no seu jogo preferido. Sinta a verdadeira fúria das Memórias HyperX e tenha uma experiência jamais vivenciada antes.&lt;/p&gt;', NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `produtos_fotos`
--

INSERT INTO `produtos_fotos` (`foto_id`, `foto_produto_id`, `foto_caminho`) VALUES
(28, 4, '0703337f8cad2c8e8ae8557f90f356df.jpg'),
(30, 5, '7d7255148b90d800168e4be72592cfd2.jpg'),
(31, 6, '1232b4086de35c87d30626901d8c6851.jpg'),
(32, 7, '4c7a41067996a6cd0c362ad9422603a3.jpg'),
(33, 8, 'b887841ad43a5d9f6588cb7a0ac8ccdc.jpg'),
(35, 10, 'c5bbe20607a9cc9cd0ec47a03e61442f.jpg'),
(36, 11, '92462484bb29dcdd6d730db04e1a25f8.jpg'),
(37, 12, '8e37dfeae3e64964fff2e2d7f3cfe48f.jpg'),
(38, 9, '8a19145d28d3a86d8bf1b424e27cfa00.jpg'),
(48, 14, 'e07d6540bcd17ba45d2092077bb86334.jpg'),
(49, 14, 'ce554c32ec39007e55551e6b63c0460c.jpg'),
(50, 14, 'c33ba00219f362b1a0d874f4ca821f8a.jpg'),
(51, 14, 'e67fd1fe0c8c7c12d7fe9ce15d867798.jpg'),
(52, 15, '6d6ed1183ae78336be03931e94740357.jpg'),
(53, 15, '5c6197a19f8c5ec73b22ace678aac4fa.jpg'),
(54, 15, '68d8094eb32397fd2bb5614486ff61fb.jpg'),
(55, 15, '4df9ae3ab6db25d5f29dc169c0ccd87f.jpg'),
(56, 13, 'ea425cbbdd12a81b4c0c3fe272c93801.jpg'),
(57, 13, '159d3e2547d609240ad4e35c1e6ae04f.jpg'),
(58, 13, 'f56855b1ecf11ac6777007ccf4078ff5.jpg'),
(59, 13, '4c9b971304600e95a69681961f6a3bd0.jpg'),
(60, 13, '62dde8e5e27a019815c839141621e8a0.jpg');

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
-- Estrutura da tabela `transacoes`
--

DROP TABLE IF EXISTS `transacoes`;
CREATE TABLE IF NOT EXISTS `transacoes` (
  `transacao_id` int(11) NOT NULL AUTO_INCREMENT,
  `transacao_pedido_id` int(11) DEFAULT NULL,
  `transacao_cliente_id` int(11) DEFAULT NULL,
  `transacao_data` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `transacao_codigo_hash` varchar(255) DEFAULT NULL,
  `transacao_tipo_metodo_pagamento` tinyint(1) DEFAULT NULL COMMENT '1 = Cartão | 2 = Boleto | 3 = Transferência',
  `transacao_codigo_metodo_pagamento` varchar(10) DEFAULT NULL,
  `transacao_link_pagamento` varchar(255) DEFAULT NULL,
  `transacao_banco_escolhido` varchar(20) DEFAULT NULL,
  `transacao_valor_bruto` decimal(15,2) DEFAULT NULL,
  `transacao_valor_taxa_pagseguro` decimal(15,2) DEFAULT NULL,
  `transacao_valor_liquido` decimal(15,2) DEFAULT NULL,
  `transacao_numero_parcelas` int(11) DEFAULT NULL,
  `transacao_valor_parcela` decimal(15,2) DEFAULT NULL,
  `transacao_status` tinyint(1) DEFAULT NULL COMMENT 'Verificar documentação',
  `transacao_data_alteracao` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`transacao_id`),
  KEY `transacao_pedido_id` (`transacao_pedido_id`,`transacao_cliente_id`),
  KEY `fk_transacao_cliente_id` (`transacao_cliente_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;

--
-- Extraindo dados da tabela `transacoes`
--

INSERT INTO `transacoes` (`transacao_id`, `transacao_pedido_id`, `transacao_cliente_id`, `transacao_data`, `transacao_codigo_hash`, `transacao_tipo_metodo_pagamento`, `transacao_codigo_metodo_pagamento`, `transacao_link_pagamento`, `transacao_banco_escolhido`, `transacao_valor_bruto`, `transacao_valor_taxa_pagseguro`, `transacao_valor_liquido`, `transacao_numero_parcelas`, `transacao_valor_parcela`, `transacao_status`, `transacao_data_alteracao`) VALUES
(5, 5, 27, '2022-05-31 23:59:08', 'C4827CFB-F6EC-4294-AFA5-FB6A0E1F3899', 2, '202', 'https://sandbox.pagseguro.uol.com.br/checkout/payment/booklet/print.jhtml?c=bbeff50f32eae7a830862d4c29d8005439d2f05a7c80f67efea8ed2d2a095869e329d57ee1ee3d43', NULL, '1524.50', '76.47', '1448.03', 1, '1524.50', 1, NULL);

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
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `users`
--

INSERT INTO `users` (`id`, `ip_address`, `username`, `password`, `email`, `cliente_user_id`, `activation_selector`, `activation_code`, `forgotten_password_selector`, `forgotten_password_code`, `forgotten_password_time`, `remember_selector`, `remember_code`, `created_on`, `last_login`, `active`, `first_name`, `last_name`, `company`, `phone`) VALUES
(1, '127.0.0.1', 'administrator', '$2y$12$68J1neG25LgjkJl.yf5YT.hG1OuQ0GQV71SqsoqJLHRrpOjRqKvHC', 'admin@admin.com', NULL, NULL, '', NULL, NULL, NULL, NULL, NULL, 1268889823, 1654041620, 1, 'Admin', 'istrator', 'ADMIN', '0'),
(34, '127.0.0.1', 'Leilson', '$2y$10$1o25B0WHAxBZRfy.wHuSJ.O861hMnECYmu2M6lFNN2B31JSLIEita', 'leilsonf@gmail.com', 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1654041441, 1654041753, 1, 'Leilson', 'Francelino', NULL, '(16) 98131-4007');

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
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

--
-- Extraindo dados da tabela `users_groups`
--

INSERT INTO `users_groups` (`id`, `user_id`, `group_id`) VALUES
(21, 1, 1),
(50, 34, 2);

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `categorias`
--
ALTER TABLE `categorias`
  ADD CONSTRAINT `fk_categoria_pai_id` FOREIGN KEY (`categoria_pai_id`) REFERENCES `categorias_pai` (`categoria_pai_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `fk_pedido_cliente_id` FOREIGN KEY (`pedido_cliente_id`) REFERENCES `clientes` (`cliente_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `pedidos_produtos`
--
ALTER TABLE `pedidos_produtos`
  ADD CONSTRAINT `fk_pedido_id` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`pedido_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_produto_id` FOREIGN KEY (`produto_id`) REFERENCES `produtos` (`produto_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `produtos_fotos`
--
ALTER TABLE `produtos_fotos`
  ADD CONSTRAINT `fk_foto_produto_id` FOREIGN KEY (`foto_produto_id`) REFERENCES `produtos` (`produto_id`) ON DELETE CASCADE;

--
-- Limitadores para a tabela `transacoes`
--
ALTER TABLE `transacoes`
  ADD CONSTRAINT `fk_transacao_cliente_id` FOREIGN KEY (`transacao_cliente_id`) REFERENCES `clientes` (`cliente_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_transacao_pedido_id` FOREIGN KEY (`transacao_pedido_id`) REFERENCES `pedidos` (`pedido_id`) ON DELETE CASCADE;

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
