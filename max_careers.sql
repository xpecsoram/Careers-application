-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Apr 18, 2021 at 10:43 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.3.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `max_careers`
--

-- --------------------------------------------------------

--
-- Table structure for table `cities`
--

CREATE TABLE `cities` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `cities`
--

INSERT INTO `cities` (`id`, `title`) VALUES
(1, 'New York'),
(2, 'California'),
(3, 'Los Angeles'),
(4, 'Chicago'),
(5, 'Texas');

-- --------------------------------------------------------

--
-- Table structure for table `company`
--

CREATE TABLE `company` (
  `id` int(11) NOT NULL,
  `company_name` varchar(100) NOT NULL,
  `city_id` int(11) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(50) NOT NULL,
  `profile_picture` varchar(100) DEFAULT NULL,
  `email` varchar(75) NOT NULL,
  `phone` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `company`
--

INSERT INTO `company` (`id`, `company_name`, `city_id`, `username`, `password`, `profile_picture`, `email`, `phone`) VALUES
(1, 'Apple Inc.', 1, 'apple', '12345', 'apple-logo.png', 'user@apple.com', '1234567890'),
(2, 'IBM', 2, 'ibm', '12345', 'ibm-logo.png', 'user@ibm.com', '1234567890'),
(3, 'Google', 3, 'google', '12345', 'google-logo.png', 'user@google.com', '1234567890'),
(4, 'Microsoft', 3, 'microsoft', '12345', 'microsoft-logo.png', 'user@microsoft.com', '1234567890'),
(5, 'Lifeline Hospital', 3, 'lifeline', '12345', 'lifeline-logo.png', 'user@lifeline.com', '1234567890');

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `job_category_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `city_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `jobs`
--

INSERT INTO `jobs` (`id`, `title`, `description`, `job_category_id`, `company_id`, `city_id`) VALUES
(1, 'Accounts Manager', 'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 1, 1, 2),
(2, 'Database optimization engineer', 'Laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur? Laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur? Laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?', 5, 3, 2),
(3, 'Arduino and G-code expert', 'Praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat. Praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat. Praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.', 6, 2, 4),
(4, 'Social media manager', 'Suspendisse potenti. Quisque fermentum justo sit amet tellus interdum, sagittis mollis arcu interdum. Sed vehicula ligula tortor, vel cursus nisi suscipit convallis. Curabitur faucibus metus purus, at vulputate est varius eu. In nec orci ante. Nulla tincidunt, libero eget sollicitudin consectetur, erat dui commodo sem, ac pellentesque lectus ligula ac mi. Donec at nulla eu tortor tempus tempus vitae in metus. Curabitur vestibulum ullamcorper nisi, eu congue nibh posuere id. Vestibulum a velit auctor, accumsan tortor quis, auctor lorem. Aliquam quam libero, dictum ut sem quis, auctor sodales lacus. Vestibulum scelerisque neque vitae arcu sollicitudin, ornare rhoncus libero ornare. Aliquam rutrum nulla sed ante convallis fermentum. Suspendisse potenti. Quisque fermentum justo sit amet tellus interdum, sagittis mollis arcu interdum. Sed vehicula ligula tortor, vel cursus nisi suscipit convallis. Curabitur faucibus metus purus, at vulputate est varius eu. In nec orci ante. Nulla tincidunt, libero eget sollicitudin consectetur, erat dui commodo sem, ac pellentesque lectus ligula ac mi. Donec at nulla eu tortor tempus tempus vitae in metus. Curabitur vestibulum ullamcorper nisi, eu congue nibh posuere id. Vestibulum a velit auctor, accumsan tortor quis, auctor lorem. Aliquam quam libero, dictum ut sem quis, auctor sodales lacus. Vestibulum scelerisque neque vitae arcu sollicitudin, ornare rhoncus libero ornare. Aliquam rutrum nulla sed ante convallis fermentum. Suspendisse potenti. Quisque fermentum justo sit amet tellus interdum, sagittis mollis arcu interdum. Sed vehicula ligula tortor, vel cursus nisi suscipit convallis. Curabitur faucibus metus purus, at vulputate est varius eu. In nec orci ante. Nulla tincidunt, libero eget sollicitudin consectetur, erat dui commodo sem, ac pellentesque lectus ligula ac mi. Donec at nulla eu tortor tempus tempus vitae in metus. Curabitur vestibulum ullamcorper nisi, eu congue nibh posuere id. Vestibulum a velit auctor, accumsan tortor quis, auctor lorem. Aliquam quam libero, dictum ut sem quis, auctor sodales lacus. Vestibulum scelerisque neque vitae arcu sollicitudin, ornare rhoncus libero ornare. Aliquam rutrum nulla sed ante convallis fermentum.', 10, 2, 3),
(5, 'Algorithm experts in C#', 'Aenean sed pretium est, vehicula pretium neque. Etiam rhoncus vestibulum scelerisque. Cras tellus massa, molestie dictum rutrum id, vestibulum nec urna. Sed et tristique tellus. Pellentesque eget diam id ligula faucibus fermentum. Curabitur venenatis turpis elit, vitae euismod arcu pharetra sed. Integer condimentum, nisi quis fermentum semper, dolor sapien placerat arcu, ut feugiat velit libero id ante. Nullam sit amet est sit amet sem lacinia eleifend. In ut velit quam. Nunc porttitor dignissim felis. Quisque nisi risus, sodales non arcu vel, condimentum ultricies ipsum. Maecenas rhoncus ante nec ipsum pharetra, vitae hendrerit arcu pellentesque. Sed vitae mauris ac tellus dictum condimentum sed sit amet turpis. Sed pellentesque mi ut finibus laoreet. Nulla vel tellus euismod metus facilisis aliquam. Aenean sed pretium est, vehicula pretium neque. Etiam rhoncus vestibulum scelerisque. Cras tellus massa, molestie dictum rutrum id, vestibulum nec urna. Sed et tristique tellus. Pellentesque eget diam id ligula faucibus fermentum. Curabitur venenatis turpis elit, vitae euismod arcu pharetra sed. Integer condimentum, nisi quis fermentum semper, dolor sapien placerat arcu, ut feugiat velit libero id ante. Nullam sit amet est sit amet sem lacinia eleifend. In ut velit quam. Nunc porttitor dignissim felis. Quisque nisi risus, sodales non arcu vel, condimentum ultricies ipsum. Maecenas rhoncus ante nec ipsum pharetra, vitae hendrerit arcu pellentesque. Sed vitae mauris ac tellus dictum condimentum sed sit amet turpis. Sed pellentesque mi ut finibus laoreet. Nulla vel tellus euismod metus facilisis aliquam. Aenean sed pretium est, vehicula pretium neque. Etiam rhoncus vestibulum scelerisque. Cras tellus massa, molestie dictum rutrum id, vestibulum nec urna. Sed et tristique tellus. Pellentesque eget diam id ligula faucibus fermentum. Curabitur venenatis turpis elit, vitae euismod arcu pharetra sed. Integer condimentum, nisi quis fermentum semper, dolor sapien placerat arcu, ut feugiat velit libero id ante. Nullam sit amet est sit amet sem lacinia eleifend. In ut velit quam. Nunc porttitor dignissim felis. Quisque nisi risus, sodales non arcu vel, condimentum ultricies ipsum. Maecenas rhoncus ante nec ipsum pharetra, vitae hendrerit arcu pellentesque. Sed vitae mauris ac tellus dictum condimentum sed sit amet turpis. Sed pellentesque mi ut finibus laoreet. Nulla vel tellus euismod metus facilisis aliquam.', 2, 4, 1),
(6, 'Oracle database administration', 'Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Sed egestas posuere mollis. In hac habitasse platea dictumst. Phasellus pellentesque tortor nec sem ornare mattis. Cras condimentum nec neque eu cursus. Donec fermentum augue vel tellus cursus, non sodales metus mattis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Sed egestas posuere mollis. In hac habitasse platea dictumst. Phasellus pellentesque tortor nec sem ornare mattis. Cras condimentum nec neque eu cursus. Donec fermentum augue vel tellus cursus, non sodales metus mattis. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Sed egestas posuere mollis. In hac habitasse platea dictumst. Phasellus pellentesque tortor nec sem ornare mattis. Cras condimentum nec neque eu cursus. Donec fermentum augue vel tellus cursus, non sodales metus mattis.', 5, 4, 5),
(7, 'Lead Visual designer', 'Maecenas volutpat non ante vitae finibus. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; In faucibus sapien ante, vel congue nibh pharetra eget. Donec ut lectus auctor, fermentum quam in, luctus tellus. Fusce bibendum ultricies leo, vitae interdum est aliquam ut. Suspendisse sit amet nulla a nulla luctus egestas. Fusce condimentum est et libero volutpat lacinia. In auctor felis vitae rutrum cursus. Phasellus at odio eros. Sed iaculis nunc orci, et fringilla diam pellentesque at. Maecenas volutpat non ante vitae finibus. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; In faucibus sapien ante, vel congue nibh pharetra eget. Donec ut lectus auctor, fermentum quam in, luctus tellus. Fusce bibendum ultricies leo, vitae interdum est aliquam ut. Suspendisse sit amet nulla a nulla luctus egestas. Fusce condimentum est et libero volutpat lacinia. In auctor felis vitae rutrum cursus. Phasellus at odio eros. Sed iaculis nunc orci, et fringilla diam pellentesque at. Maecenas volutpat non ante vitae finibus. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; In faucibus sapien ante, vel congue nibh pharetra eget. Donec ut lectus auctor, fermentum quam in, luctus tellus. Fusce bibendum ultricies leo, vitae interdum est aliquam ut. Suspendisse sit amet nulla a nulla luctus egestas. Fusce condimentum est et libero volutpat lacinia. In auctor felis vitae rutrum cursus. Phasellus at odio eros. Sed iaculis nunc orci, et fringilla diam pellentesque at.', 10, 3, 3),
(8, 'Big data assistant', 'Laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur? Laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur? Laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?', 5, 1, 4),
(9, 'Full-stack WordPress developer', 'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 2, 1, 1),
(10, 'MERN stack developer', 'Suspendisse potenti. Quisque fermentum justo sit amet tellus interdum, sagittis mollis arcu interdum. Sed vehicula ligula tortor, vel cursus nisi suscipit convallis. Curabitur faucibus metus purus, at vulputate est varius eu. In nec orci ante. Nulla tincidunt, libero eget sollicitudin consectetur, erat dui commodo sem, ac pellentesque lectus ligula ac mi. Donec at nulla eu tortor tempus tempus vitae in metus. Curabitur vestibulum ullamcorper nisi, eu congue nibh posuere id. Vestibulum a velit auctor, accumsan tortor quis, auctor lorem. Aliquam quam libero, dictum ut sem quis, auctor sodales lacus. Vestibulum scelerisque neque vitae arcu sollicitudin, ornare rhoncus libero ornare. Aliquam rutrum nulla sed ante convallis fermentum. Suspendisse potenti. Quisque fermentum justo sit amet tellus interdum, sagittis mollis arcu interdum. Sed vehicula ligula tortor, vel cursus nisi suscipit convallis. Curabitur faucibus metus purus, at vulputate est varius eu. In nec orci ante. Nulla tincidunt, libero eget sollicitudin consectetur, erat dui commodo sem, ac pellentesque lectus ligula ac mi. Donec at nulla eu tortor tempus tempus vitae in metus. Curabitur vestibulum ullamcorper nisi, eu congue nibh posuere id. Vestibulum a velit auctor, accumsan tortor quis, auctor lorem. Aliquam quam libero, dictum ut sem quis, auctor sodales lacus. Vestibulum scelerisque neque vitae arcu sollicitudin, ornare rhoncus libero ornare. Aliquam rutrum nulla sed ante convallis fermentum. Suspendisse potenti. Quisque fermentum justo sit amet tellus interdum, sagittis mollis arcu interdum. Sed vehicula ligula tortor, vel cursus nisi suscipit convallis. Curabitur faucibus metus purus, at vulputate est varius eu. In nec orci ante. Nulla tincidunt, libero eget sollicitudin consectetur, erat dui commodo sem, ac pellentesque lectus ligula ac mi. Donec at nulla eu tortor tempus tempus vitae in metus. Curabitur vestibulum ullamcorper nisi, eu congue nibh posuere id. Vestibulum a velit auctor, accumsan tortor quis, auctor lorem. Aliquam quam libero, dictum ut sem quis, auctor sodales lacus. Vestibulum scelerisque neque vitae arcu sollicitudin, ornare rhoncus libero ornare. Aliquam rutrum nulla sed ante convallis fermentum.', 2, 2, 2),
(11, 'Turbine supervisor', 'Laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur? Laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur? Laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?', 6, 2, 1),
(12, 'Field technician', 'Aenean sed pretium est, vehicula pretium neque. Etiam rhoncus vestibulum scelerisque. Cras tellus massa, molestie dictum rutrum id, vestibulum nec urna. Sed et tristique tellus. Pellentesque eget diam id ligula faucibus fermentum. Curabitur venenatis turpis elit, vitae euismod arcu pharetra sed. Integer condimentum, nisi quis fermentum semper, dolor sapien placerat arcu, ut feugiat velit libero id ante. Nullam sit amet est sit amet sem lacinia eleifend. In ut velit quam. Nunc porttitor dignissim felis. Quisque nisi risus, sodales non arcu vel, condimentum ultricies ipsum. Maecenas rhoncus ante nec ipsum pharetra, vitae hendrerit arcu pellentesque. Sed vitae mauris ac tellus dictum condimentum sed sit amet turpis. Sed pellentesque mi ut finibus laoreet. Nulla vel tellus euismod metus facilisis aliquam. Aenean sed pretium est, vehicula pretium neque. Etiam rhoncus vestibulum scelerisque. Cras tellus massa, molestie dictum rutrum id, vestibulum nec urna. Sed et tristique tellus. Pellentesque eget diam id ligula faucibus fermentum. Curabitur venenatis turpis elit, vitae euismod arcu pharetra sed. Integer condimentum, nisi quis fermentum semper, dolor sapien placerat arcu, ut feugiat velit libero id ante. Nullam sit amet est sit amet sem lacinia eleifend. In ut velit quam. Nunc porttitor dignissim felis. Quisque nisi risus, sodales non arcu vel, condimentum ultricies ipsum. Maecenas rhoncus ante nec ipsum pharetra, vitae hendrerit arcu pellentesque. Sed vitae mauris ac tellus dictum condimentum sed sit amet turpis. Sed pellentesque mi ut finibus laoreet. Nulla vel tellus euismod metus facilisis aliquam. Aenean sed pretium est, vehicula pretium neque. Etiam rhoncus vestibulum scelerisque. Cras tellus massa, molestie dictum rutrum id, vestibulum nec urna. Sed et tristique tellus. Pellentesque eget diam id ligula faucibus fermentum. Curabitur venenatis turpis elit, vitae euismod arcu pharetra sed. Integer condimentum, nisi quis fermentum semper, dolor sapien placerat arcu, ut feugiat velit libero id ante. Nullam sit amet est sit amet sem lacinia eleifend. In ut velit quam. Nunc porttitor dignissim felis. Quisque nisi risus, sodales non arcu vel, condimentum ultricies ipsum. Maecenas rhoncus ante nec ipsum pharetra, vitae hendrerit arcu pellentesque. Sed vitae mauris ac tellus dictum condimentum sed sit amet turpis. Sed pellentesque mi ut finibus laoreet. Nulla vel tellus euismod metus facilisis aliquam.', 8, 2, 2),
(13, 'Health care professional ', 'Laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur? Laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur? Laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?', 3, 3, 2),
(14, 'Bio technologist', 'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 4, 4, 1),
(15, 'Neuro Surgeon and Consultant', 'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 9, 5, 1),
(16, 'Alopethic Doctor', 'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.', 7, 5, 2);

-- --------------------------------------------------------

--
-- Table structure for table `job_categories`
--

CREATE TABLE `job_categories` (
  `id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `job_categories`
--

INSERT INTO `job_categories` (`id`, `title`) VALUES
(1, 'Accounting'),
(2, 'Programming'),
(3, 'Paramedic'),
(4, 'Teaching'),
(5, 'Database Engineer'),
(6, 'Electrical Engineer'),
(7, 'General Physician'),
(8, 'Technician'),
(9, 'Neuro Surgeon'),
(10, 'Graphic Designer');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cities`
--
ALTER TABLE `cities`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`id`),
  ADD KEY `city_id` (`city_id`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `city_id` (`city_id`),
  ADD KEY `company_id` (`company_id`),
  ADD KEY `job_category_id` (`job_category_id`);

--
-- Indexes for table `job_categories`
--
ALTER TABLE `job_categories`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cities`
--
ALTER TABLE `cities`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `company`
--
ALTER TABLE `company`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `job_categories`
--
ALTER TABLE `job_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `company`
--
ALTER TABLE `company`
  ADD CONSTRAINT `company_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`);

--
-- Constraints for table `jobs`
--
ALTER TABLE `jobs`
  ADD CONSTRAINT `jobs_ibfk_1` FOREIGN KEY (`city_id`) REFERENCES `cities` (`id`),
  ADD CONSTRAINT `jobs_ibfk_2` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`),
  ADD CONSTRAINT `jobs_ibfk_3` FOREIGN KEY (`job_category_id`) REFERENCES `job_categories` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
