-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 09, 2020 at 08:44 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.3.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `anand`
--

-- --------------------------------------------------------

--
-- Table structure for table `contact`
--

CREATE TABLE `contact` (
  `id` int(11) NOT NULL,
  `name` text NOT NULL,
  `email_id` varchar(30) NOT NULL,
  `phone_num` varchar(12) NOT NULL,
  `msg` text NOT NULL,
  `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `contact`
--

INSERT INTO `contact` (`id`, `name`, `email_id`, `phone_num`, `msg`, `date`) VALUES
(1, 'Jai Ganesh', 'gnesh@devi.com', '776422987', 'Ohm namashivaya', '0000-00-00 00:00:00'),
(2, 'Jai Ganesh', 'Ram@devi.com', '6788934', 'jai sree ram', '2020-06-05 21:47:37'),
(3, 'Jai Ganesh', 'Ram@devi.com', '6788934', 'jai sree ram', '2020-06-05 15:42:01'),
(4, 'Namashivaya', 'jai@sreeram.in', '67883665', 'Ohm Jai jagadeesh hare !', '2020-06-06 00:39:59'),
(5, 'Namashivaya', 'jai@sreeram.in', '67883665', 'Ohm Jai jagadeesh hare !', '2020-06-06 00:41:25'),
(6, 'Namashivaya', 'jai@sreeram.in', '67883665', 'Ohm Jai jagadeesh hare !', '2020-06-06 00:50:54'),
(7, 'Namashivaya', 'jai@sreeram.in', '67883665', 'Ohm Jai jagadeesh hare !', '2020-06-06 00:54:07');

-- --------------------------------------------------------

--
-- Table structure for table `posts`
--

CREATE TABLE `posts` (
  `sno` int(11) NOT NULL,
  `title` text NOT NULL,
  `tag_line` text NOT NULL,
  `slug` varchar(20) NOT NULL,
  `content` text NOT NULL,
  `img_file` varchar(20) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `posts`
--

INSERT INTO `posts` (`sno`, `title`, `tag_line`, `slug`, `content`, `img_file`, `date`) VALUES
(1, 'About Artificial intelligence', 'Anad\'s first Post', 'first-post', '\"AI\" redirects here. For other uses, see AI (disambiguation) and Artificial intelligence (disambiguation).\r\nPart on a series on\r\nArtificial intelligence\r\nMajor goals[show]\r\nApproaches[show]\r\nPhilosophy[show]\r\nHistory[show]\r\nTechnology[show]\r\nGlossary[show]\r\nvte\r\nIn computer science, artificial intelligence (AI), sometimes called machine intelligence, is intelligence demonstrated by machines, in contrast to the natural intelligence displayed by humans and animals. Leading AI textbooks define the field as the study of \"intelligent agents\": any device that perceives its environment and takes actions that maximize its chance of successfully achieving its goals.[1] Colloquially, the term \"artificial intelligence\" is often used to describe machines (or computers) that mimic \"cognitive\" functions that humans associate with the human mind, such as \"learning\" and \"problem solving\".[2]\r\n\r\nAs machines become increasingly capable, tasks considered to require \"intelligence\" are often removed from the definition of AI, a phenomenon known as the AI effect.[3] A quip in Tesler\'s Theorem says \"AI is whatever hasn\'t been done yet.\"[4] For instance, optical character recognition is frequently excluded from things considered to be AI,[5] having become a routine technology.[6] Modern machine capabilities generally classified as AI include successfully understanding human speech,[7] competing at the highest level in strategic game systems (such as chess and Go),[8] autonomously operating cars, intelligent routing in content delivery networks, and military simulations[9].', 'post-bg.jpg', '2020-06-06 08:54:32'),
(2, 'Updated second post', 'Fix on Python Flask blog post', 'sec', 'Second post for testing', 'bg-post.jpg', '2020-06-08 15:15:31'),
(3, 'Data Science', 'Do more with data science', 'Data-science', 'Data science is an inter-disciplinary field that uses scientific methods, processes, algorithms and systems to extract knowledge and insights from many structural and unstructured data.[1][2] Data science is related to data mining, deep learning and big data.\r\n\r\nData science is a \"concept to unify statistics, data analysis, machine learning, domain knowledge and their related methods\" in order to \"understand and analyze actual phenomena\" with data.[3] It uses techniques and theories drawn from many fields within the context of mathematics, statistics, computer science, domain knowledge and information science. Turing award winner Jim Gray imagined data science as a \"fourth paradigm\" of science (empirical, theoretical, computational and now data-driven) and asserted that \"everything about science is changing because of the impact of information technology\" and the data deluge.[4][5]', 'data-science.jpg', '2020-06-07 02:56:54'),
(4, 'Internet of things', 'IoT devices are a part of the larger concept of home automation', 'Internet-of-things', 'The Internet of things (IoT) is a system of interrelated computing devices, mechanical and digital machines provided with unique identifiers (UIDs) and the ability to transfer data over a network without requiring human-to-human or human-to-computer interaction.[1][2][3][4]\r\n\r\nThe definition of the Internet of things has evolved due to the convergence of multiple technologies, real-time analytics, machine learning, commodity sensors, and embedded systems.[1] Traditional fields of embedded systems, wireless sensor networks, control systems, automation (including home and building automation), and others all contribute to enabling the Internet of things. In the consumer market, IoT technology is most synonymous with products pertaining to the concept of the \"smart home\", covering devices and appliances (such as lighting fixtures, thermostats, home security systems and cameras, and other home appliances) that support one or more common ecosystems, and can be controlled via devices associated with that ecosystem, such as smartphones and smart speakers.\r\n\r\nThere are a number of serious concerns about dangers in the growth of IoT, especially in the areas of privacy and security, and consequently industry and governmental moves to address these concerns have begun.', 'iot.jpg', '2020-06-07 09:14:04'),
(5, 'Kivy frame work for Python', 'Python Mobile app development', 'kivy', 'Kivy is a free and open source Python library for developing mobile apps and other multitouch application software with a natural user interface (NUI). It is distributed under the terms of the MIT License, and can run on Android, iOS, GNU/Linux, OS X, and Windows.\r\n\r\nKivy is the main framework developed by the Kivy organization,[2] alongside Python for Android,[3] Kivy iOS,[4] and several other libraries meant to be used on all platforms. In 2012, Kivy got a $5000 grant from the Python Software Foundation for porting it to Python 3.3.[5] Kivy also supports the Raspberry Pi which was funded through Bountysource.[6]\r\n\r\nThe framework contains all the elements for building an application such as:\r\n\r\nextensive input support for mouse, keyboard, TUIO, and OS-specific multitouch events,\r\na graphic library using only OpenGL ES 2, and based on Vertex Buffer Object and shaders,\r\na wide range of widgets that support multitouch,\r\nan intermediate language (Kv)[7] used to easily design custom widgets.', 'kivy.png', '2020-06-07 09:15:38'),
(6, 'Machine learning', 'Statistical learning\" redirects here. For statistical learning in linguistics, see statistical learning in language acquisition.', 'machine-learning', 'Machine learning (ML) is the study of computer algorithms that improve automatically through experience.[1] It is seen as a subset of artificial intelligence. Machine learning algorithms build a mathematical model based on sample data, known as \"training data\", in order to make predictions or decisions without being explicitly programmed to do so.[2] Machine learning algorithms are used in a wide variety of applications, such as email filtering and computer vision, where it is difficult or infeasible to develop conventional algorithms to perform the needed tasks.\r\n\r\nMachine learning is closely related to computational statistics, which focuses on making predictions using computers. The study of mathematical optimization delivers methods, theory and application domains to the field of machine learning. Data mining is a related field of study, focusing on exploratory data analysis through unsupervised learning.[4][5] In its application across business problems, machine learning is also referred to as predictive analytics.', 'ml.jpg', '2020-06-07 09:16:57'),
(7, 'MySQL database', ' MySQL DatabaseStorage Engines', 'mysql-db', 'MySQL is an open-source relational database management system. Its name is a combination of \"My\", the name of co-founder Michael Widenius\'s daughter, and \"SQL\", the abbreviation for Structured Query Language. ', 'mysql.jpg', '2020-06-07 09:19:10'),
(8, 'About Node JS', 'The Node.js distributed by the Node.js Foundation', 'node-js', 'Node.js is an open-source, cross-platform, JavaScript runtime environment that executes JavaScript code outside a web browser. Node.js lets developers use JavaScript to write command line tools and for server-side scripting—running scripts server-side to produce dynamic web page content before the page is sent to the user\'s web browser. Consequently, Node.js represents a \"JavaScript everywhere\" paradigm,[6] unifying web-application development around a single programming language, rather than different languages for server- and client-side scripts.\r\n\r\nThough .js is the standard filename extension for JavaScript code, the name \"Node.js\" doesn\'t refer to a particular file in this context and is merely the name of the product. Node.js has an event-driven architecture capable of asynchronous I/O.', 'node.jpg', '2020-06-07 09:21:07'),
(9, 'HP: Hypertext Preprocessor', 'This article is about the scripting language.', 'php', 'PHP is a popular general-purpose scripting language that is especially suited to web development.[5] It was originally created by Danish-Canadian programmer Rasmus Lerdorf in 1994;[6] the PHP reference implementation is now produced by The PHP Group.[7] PHP originally stood for Personal Home Page,[6] but it now stands for the recursive initialism PHP: Hypertext Preprocessor.[8]\r\n\r\nPHP code is usually processed on a web server by a PHP interpreter implemented as a module, a daemon or as a Common Gateway Interface (CGI) executable. On a web server, the result of the interpreted and executed PHP code – which may be any type of data, such as generated HTML or binary image data – would form the whole or part of a HTTP response. Various web template systems, web content management systems, and web frameworks exist which can be employed to orchestrate or facilitate the generation of that response. Additionally, PHP can be used for many programming tasks outside of the web context, such as standalone graphical applications[9] and robotic drone control.[10] Arbitrary PHP code can also be interpreted and executed via command-line interface (CLI).', 'php.jpg', '2020-06-07 09:22:48');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contact`
--
ALTER TABLE `contact`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`sno`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `contact`
--
ALTER TABLE `contact`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `posts`
--
ALTER TABLE `posts`
  MODIFY `sno` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
