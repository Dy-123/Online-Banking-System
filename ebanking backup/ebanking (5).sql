-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 22, 2017 at 05:26 AM
-- Server version: 10.1.13-MariaDB
-- PHP Version: 5.6.23

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ebanking`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `acc_no` bigint(100) NOT NULL,
  `customer_id` int(20) NOT NULL,
  `acc_status` varchar(35) NOT NULL,
  `primary_acc` bigint(100) NOT NULL,
  `acc_date` date NOT NULL,
  `acc_type_id` int(10) NOT NULL,
  `fd_id` int(10) NOT NULL,
  `acc_balance` double(10,2) NOT NULL,
  `unclear_bal` double(10,2) NOT NULL,
  `interest` double(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`acc_no`, `customer_id`, `acc_status`, `primary_acc`, `acc_date`, `acc_type_id`, `fd_id`, `acc_balance`, `unclear_bal`, `interest`) VALUES
(117501000811393, 1, 'Active', 117501000811393, '2017-02-13', 1, 0, 0.00, 0.00, 4.00),
(117501000811394, 2, 'Active', 117501000811394, '2017-02-13', 1, 0, 25000.00, 10000.00, 4.00),
(117501000811395, 2, 'Active', 117501000811394, '2017-02-13', 1, 0, 90000.00, 0.00, 4.00),
(117501000811396, 2, 'Active', 117501000811394, '2017-02-13', 2, 0, 0.00, 0.00, 4.00),
(117501000811401, 3, 'Active', 117501000811401, '2017-02-22', 1, 0, 0.00, 0.00, 4.00),
(117501000811402, 4, 'Active', 117501000811402, '2017-02-26', 1, 0, 0.00, 0.00, 4.00),
(117501000811404, 4, 'Active', 117501000811402, '2017-02-27', 1, 0, 0.00, 0.00, 4.00),
(117501000811411, 5, 'Active', 117501000811411, '2017-03-08', 1, 0, 10000.00, 1000.00, 4.00),
(117501000811412, 1, 'Active', 0, '2017-03-10', 0, 1, 900000.00, 0.00, 6.58),
(117501000811413, 4, 'Active', 0, '2017-03-10', 0, 2, 0.00, 0.00, 5.00),
(117501000811414, 7, 'Active', 117501000811414, '2017-03-17', 1, 0, 10000.00, 0.00, 4.00),
(117501000811415, 7, 'Active', 0, '2017-03-17', 0, 1, 200000.00, 0.00, 6.58),
(117501000811416, 2, 'Active', 0, '2017-03-19', 0, 1, 0.00, 0.00, 6.58),
(117501000811419, 2, 'Active', 0, '2017-03-20', 0, 1, 0.00, 0.00, 6.58),
(117501000811420, 2, 'Active', 0, '2017-03-20', 0, 2, 50000.00, 0.00, 5.00),
(117501000811421, 2, 'Active', 117501000811394, '2017-03-21', 3, 0, 5656.00, 0.00, 5.00),
(117501000811422, 2, 'Active', 0, '2017-03-21', 0, 1, 0.00, 0.00, 6.58),
(117501000811423, 7, 'Active', 0, '2017-03-21', 0, 1, 0.00, 0.00, 6.58);

-- --------------------------------------------------------

--
-- Table structure for table `account_master`
--

CREATE TABLE `account_master` (
  `acc_type_id` int(10) NOT NULL,
  `prefix` varchar(35) NOT NULL,
  `acc_type` varchar(25) NOT NULL,
  `min_balance` double(10,2) NOT NULL,
  `interest` double(10,2) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `account_master`
--

INSERT INTO `account_master` (`acc_type_id`, `prefix`, `acc_type`, `min_balance`, `interest`, `status`) VALUES
(1, 'SB', 'Savings', 500.00, 4.00, 'Active'),
(2, 'SALAC', 'Salary Account', 100.00, 4.00, 'Active'),
(3, 'SAL', 'Salary', 5000.00, 5.00, 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `branch`
--

CREATE TABLE `branch` (
  `ifsc_code` varchar(20) NOT NULL,
  `branch_name` varchar(25) NOT NULL,
  `branch_address` text NOT NULL,
  `state` varchar(20) NOT NULL,
  `country` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `branch`
--

INSERT INTO `branch` (`ifsc_code`, `branch_name`, `branch_address`, `state`, `country`) VALUES
('EB000001', 'Bangalore', 'Jayanagara', 'Karnataka', 'India'),
('EB000002', 'Delhi', 'Agra', 'Uttar Pradesh', 'India'),
('EB000003', 'Karkala', 'Venoor', 'Karnataka', 'India'),
('EB000004', 'Mangalore', 'Kadri', 'Karnataka', 'India'),
('EB000005', 'Mumbai', 'Andheri', 'Maharastra', 'India');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(20) NOT NULL,
  `ifsc_code` varchar(25) NOT NULL,
  `first_name` varchar(25) NOT NULL,
  `last_name` varchar(25) NOT NULL,
  `login_id` varchar(25) NOT NULL,
  `acc_password` varchar(100) NOT NULL,
  `trans_password` varchar(100) NOT NULL,
  `acc_status` varchar(30) NOT NULL,
  `mob_no` varchar(15) NOT NULL,
  `email_id` varchar(30) NOT NULL,
  `address` text NOT NULL,
  `city` varchar(25) NOT NULL,
  `state` varchar(25) NOT NULL,
  `country` varchar(15) NOT NULL,
  `acc_open_date` date NOT NULL,
  `last_login` datetime NOT NULL,
  `photo` varchar(100) NOT NULL,
  `proof` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `ifsc_code`, `first_name`, `last_name`, `login_id`, `acc_password`, `trans_password`, `acc_status`, `mob_no`, `email_id`, `address`, `city`, `state`, `country`, `acc_open_date`, `last_login`, `photo`, `proof`) VALUES
(1, 'EB000003', 'John', 'Hudson', 'johnhudson', 'bbd641d60a3655ae1c69585f9fbc6816', 'bbd641d60a3655ae1c69585f9fbc6816', 'Active', '9986058114', 'cmdacds@gmail.com', '3rd floor city light building', 'Balmatta', 'Karnataka', 'India', '2017-03-01', '2017-03-13 12:52:07', '614095460.jpg', '187906ch1.jpg'),
(2, 'EB000001', 'Clement', 'Dsouza', 'clement', 'c5c0c6a2d40f17ffc63e2823858fa629', '630be7b17ecb9502959938d6173357a6', 'Active', '7022208573', 'cmdacds@gmail.com', '5th cross, kadri, Manglore', 'DK', 'Karnataka', 'India', '2017-03-07', '2017-03-20 02:28:49', '440646187906ch1.jpg', '532036666937614095460.jpg'),
(3, 'EB000001', 'Zeeta', 'Dsouza', 'zeeta', 'a52fc242ff1dcb191097fcee94785f2c', '648542d731635be31ad46cb1cd25f5eb', 'Active', '7022208573', 'cmdacds@gmail.com', 'kadri, Manglore', 'DK', 'Karnataka', 'India', '2017-03-07', '2017-03-07 07:53:00', '927680440646187906ch1.jpg', '924235614095460.jpg'),
(4, 'EB000003', 'Chithra', 'Dsouza', 'chithra', '9d24ce24806920693fe84249e90de599', 'e7a949da57c975f746f1a216d284e677', 'Active', '9486571230', 'cmdads@gmail.com', 'Manglore', 'DK', 'Karnataka', 'India', '2017-03-08', '2017-03-09 08:23:45', '611545DSC_0395.JPG', '548855IMG_20170308_070320-1.jpg'),
(5, 'EB000003', 'Gagana', 'Hegde', 'gagana', '515c95091718f5773d692f4739b88f2c', '318742625919e15c3d96e3c453633772', 'Active', '9856473214', 'cmdacds@gmail.com', 'Atthur, Karakala', 'Manglore', 'Karnataka', 'India', '2017-03-10', '2017-03-12 08:16:17', '', ''),
(6, 'EB000004', 'Varsha', 'Rai', 'Varsha', '1f302601e7dd466b0c902e9bdf87cc88', '030300e7c971651b0b74756a41a24104', 'Active', '7022208573', 'cmdacds@gmail.com', 'Muger, Manglore', 'DK', 'Karnataka', 'India', '2017-03-10', '0000-00-00 00:00:00', '', ''),
(7, 'EB000001', 'Shivani', 'kY', 'shivani', '7e64454221c345dd330bec94f35521f9', '3ab84b5ff2f96b5a2646c2d35dd5b041', 'Active', '9856472548', 'cmdacds@gmail.com', 'Shivbag, Manglore', 'DK', 'Karnataka', 'India', '2017-03-17', '2017-03-21 11:38:33', '', ''),
(8, 'EB000004', 'Christitha', 'Dsouza', 'christitha', '9357d96c4fc72e4f35e5e836bac6c80d', '3d500354bb30ea3fa460ebc0ba55acfb', 'Pending', '9481576409', 'cmdacds@gmail.com', 'Kadri, Manglore', 'DK', 'Karnataka', 'India', '2017-03-17', '0000-00-00 00:00:00', '650526636338DSC_0395.JPG', '950575556938IMG_20170308_070320-1.jpg'),
(9, 'EB000001', 'Roshan', 'Dsa', 'roshan', '7865f48c9f2bf332dcb549c6d85fbd96', '825464a6c50ae70e1625143a92ea6f71', 'Active', '9481651562', 'roshan@gmail.com', 'Bendore', 'Manglore', '', 'India', '2017-03-17', '0000-00-00 00:00:00', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

CREATE TABLE `employee` (
  `emp_id` int(15) NOT NULL,
  `ifsc_code` varchar(25) NOT NULL,
  `emp_name` varchar(25) NOT NULL,
  `login_id` varchar(25) NOT NULL,
  `password` varchar(100) NOT NULL,
  `email_id` varchar(25) NOT NULL,
  `contact_no` varchar(15) NOT NULL,
  `emp_type` varchar(25) NOT NULL,
  `create_date` date NOT NULL,
  `last_login` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`emp_id`, `ifsc_code`, `emp_name`, `login_id`, `password`, `email_id`, `contact_no`, `emp_type`, `create_date`, `last_login`) VALUES
(1, '', 'Reeshal', 'reeshal', '0d3455eb3ef0cd70c41cc51e979ae2f4', 'reeshal@gmail.com', '9481951562', 'Admin', '2017-01-18', '2017-01-18 10:55:43'),
(2, '', 'Christitha', 'christitha', 'd64e23d3793a9bf17c97737177e265b6', 'christitha@gmail.com', '9481651562', 'Admin', '2017-01-18', '2017-01-18 10:58:39'),
(3, '', 'Asmitha', 'asmitha', '8cf4aae2085419f33565384ef4836e48', 'asmitha@gmail.com', '7022208573', 'Admin', '2017-01-30', '2017-01-30 10:01:01'),
(4, '', 'Raj Kiran', 'rajkiran', '099dda988c9b96499bbbd82df502539d', 'rajkiran@gmail.com', '9481576409', 'Admin', '2017-02-06', '2017-02-06 09:26:32'),
(5, 'EB000001', 'Mahesh ', 'mahesh', '7cb323203b1306810d65271d8e9228ef', 'mahesh@gmail.com', '9874563210', 'Employee', '2017-02-06', '2017-02-06 09:42:27'),
(6, 'EB000001', 'Rajesh', 'rajesh', 'bf44e33d9745e04551770c7a5a6cdb3b', 'rajesh@gmail.com', '8745632104', 'Employee', '2017-02-08', '2017-02-08 10:05:18'),
(7, 'EB000002', 'Peterking', 'peterking', 'b8f0b5eb660944b643ed824de2f462ba', 'peterking@gmail.com', '7894561235', 'Employee', '2017-02-26', '2017-02-26 01:46:39'),
(8, 'EB000003', 'Arvindh', 'arvindh', '1205e7e2c7e58aba452721626c802d0a', 'arvindh@gmail.com', '9481566408', 'Employee', '2017-03-07', '2017-03-07 08:23:45'),
(9, 'EB000002', 'Krithika', 'krithika', 'f50b1ac7c6fe80d6bc53914d810b568f', 'krithika@gmail.com', '9845765132', 'Employee', '2017-03-12', '2017-03-12 10:40:40'),
(10, 'EB000003', 'Varsha', 'varsha', 'da5cc2e4ea12660ffd090b38c678b25c', 'varsha@gmail.com', '7022228573', 'Employee', '2017-03-12', '2017-03-12 10:48:25'),
(11, 'EB000005', 'Athmiya', 'athmiya', '959302068538e732a3e3e99bef4790c9', 'athmiya@gmail.com', '7022208573', 'Employee', '2017-03-12', '2017-03-12 10:55:14'),
(12, 'EB000004', 'Shivani', 'shivani', '16a729caaab66c55e6800ab111f32ed4', 'shivani@gmail.com', '9481576409', 'Employee', '2017-03-12', '2017-03-12 10:56:57'),
(13, 'EB000005', 'Royal', 'royal', '62a910f814bb580216d4cccc0aa91146', 'royal@gmail.com', '7795190229', 'Employee', '2017-03-17', '2017-03-17 01:27:47');

-- --------------------------------------------------------

--
-- Table structure for table `fixed_deposit`
--

CREATE TABLE `fixed_deposit` (
  `fd_id` int(10) NOT NULL,
  `deposit_type` varchar(25) NOT NULL,
  `prefix` varchar(15) NOT NULL,
  `min_amt` float(10,2) NOT NULL,
  `max_amt` float(10,2) NOT NULL,
  `interest` float(10,2) NOT NULL,
  `terms` text NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `fixed_deposit`
--

INSERT INTO `fixed_deposit` (`fd_id`, `deposit_type`, `prefix`, `min_amt`, `max_amt`, `interest`, `terms`, `status`) VALUES
(1, 'Lakhs Plan', 'LP', 50000.00, 1000000.00, 6.58, '1', 'Active'),
(2, 'Double plan', 'DP', 100000.00, 2000000.00, 5.00, '5', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `loan`
--

CREATE TABLE `loan` (
  `loan_acc_no` bigint(100) NOT NULL,
  `customer_id` int(15) NOT NULL,
  `loan_type_id` int(15) NOT NULL,
  `loan_amt` float(10,2) NOT NULL,
  `interest` float(10,2) NOT NULL,
  `create_date` date NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `loan`
--

INSERT INTO `loan` (`loan_acc_no`, `customer_id`, `loan_type_id`, `loan_amt`, `interest`, `create_date`, `status`) VALUES
(117501000811414, 1, 2, 100000.00, 6.00, '2017-03-16', 'Active'),
(117501000811415, 7, 1, 100000.00, 7.50, '2017-03-17', 'Active'),
(117501000811419, 0, 1, 100.00, 7.50, '2017-03-20', 'Pending'),
(117501000811420, 0, 1, 100.00, 7.50, '2017-03-20', 'Pending'),
(117501000811421, 2, 1, 0.00, 7.50, '2017-03-21', 'Active'),
(117501000811422, 7, 2, 0.00, 6.00, '2017-03-21', 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `loan_payment`
--

CREATE TABLE `loan_payment` (
  `payment_id` int(10) NOT NULL,
  `customer_id` int(10) NOT NULL,
  `loan_acc_no` bigint(100) NOT NULL,
  `loan_amt` float(12,2) NOT NULL,
  `interest` float(15,2) NOT NULL,
  `total_amt` float(15,2) NOT NULL,
  `paid` float(15,2) NOT NULL,
  `payment_type` varchar(25) NOT NULL,
  `balance` float(15,2) NOT NULL,
  `paid_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `loan_payment`
--

INSERT INTO `loan_payment` (`payment_id`, `customer_id`, `loan_acc_no`, `loan_amt`, `interest`, `total_amt`, `paid`, `payment_type`, `balance`, `paid_date`) VALUES
(1, 7, 117501000811415, 100000.00, 7.50, 107500.00, 5000.00, 'Cash', 102500.00, '2017-03-17'),
(2, 7, 117501000811415, 100000.00, 7.50, 102500.00, 5000.00, 'Account', 97500.00, '2017-03-17'),
(3, 1, 117501000811414, 100000.00, 6.00, 106000.00, 0.00, '', 0.00, '2017-03-21'),
(4, 7, 117501000811415, 100000.00, 7.50, 97500.00, 0.00, 'Account', 0.00, '2017-03-21'),
(5, 7, 117501000811415, 100000.00, 7.50, 97500.00, 0.00, 'Account', 0.00, '2017-03-21');

-- --------------------------------------------------------

--
-- Table structure for table `loan_type`
--

CREATE TABLE `loan_type` (
  `loan_type_id` int(10) NOT NULL,
  `loan_type` varchar(25) NOT NULL,
  `prefix` varchar(25) NOT NULL,
  `min_amount` float(10,2) NOT NULL,
  `max_amount` float(10,2) NOT NULL,
  `interest` float(10,2) NOT NULL,
  `terms` int(20) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `loan_type`
--

INSERT INTO `loan_type` (`loan_type_id`, `loan_type`, `prefix`, `min_amount`, `max_amount`, `interest`, `terms`, `status`) VALUES
(1, 'House Loan', 'HL', 30000.00, 500000.00, 7.50, 2, 'Active'),
(2, 'Personal Loan', 'PL', 50000.00, 300000.00, 6.00, 3, 'Active'),
(3, 'Education loan', 'EL', 50000.00, 500000.00, 11.00, 5, 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `mail`
--

CREATE TABLE `mail` (
  `mail_request_id` int(15) NOT NULL,
  `sender_id` int(15) NOT NULL,
  `receiver_id` int(25) NOT NULL,
  `subject` varchar(100) NOT NULL,
  `message` text NOT NULL,
  `message_type` varchar(25) NOT NULL,
  `date_time` datetime NOT NULL,
  `cust_status` varchar(10) NOT NULL,
  `emp_status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mail`
--

INSERT INTO `mail` (`mail_request_id`, `sender_id`, `receiver_id`, `subject`, `message`, `message_type`, `date_time`, `cust_status`, `emp_status`) VALUES
(17, 2, 1, 'Hello test mail', '<p>Test message</p>', 'CustomerAdmin', '2017-03-07 01:59:06', '', ''),
(20, 2, 1, 'Database Design', '<p>Here is the design part...</p>', 'CustomerAdmin', '2017-03-08 02:54:11', 'Deleted', ''),
(30, 2, 3, 'database', '<p>test</p>', 'AdminCustomer', '2017-03-10 06:51:55', '', ''),
(34, 5, 7, 'Registration', '<p>Your account registered successfully...</p>', 'AdminCustomer', '2017-03-17 08:13:01', 'Deleted', ''),
(35, 7, 1, 'Request for home loan', '<p>Hello..</p>\r\n<p>Please confirm the date of loan sanction.</p>', 'CustomerAdmin', '2017-03-17 08:58:48', '', ''),
(44, 2, 1, 'test', '<p>lkjhcjhcjdshcj</p>', 'CustomerAdmin', '2017-03-20 04:32:53', '', ''),
(49, 5, 2, 'rer', '<p>rrr</p>', 'AdminCustomer', '2017-03-20 04:39:41', 'Deleted', ''),
(51, 7, 1, 'hello', '<p>ssdsds</p>', 'CustomerAdmin', '2017-03-21 12:45:20', '', ''),
(52, 5, 7, 'hello', '<p>cczc</p>', 'AdminCustomer', '2017-03-21 12:58:35', 'Deleted', ''),
(53, 7, 1, 'ooooooooooooooooooooooo', '<p>qqqqqqqqqqqqqqqqqqqqq</p>', 'CustomerAdmin', '2017-03-21 01:11:19', '', ''),
(54, 5, 2, 'fdd', '<p>fgbfbf</p>', 'AdminCustomer', '2017-03-21 01:27:26', '', ''),
(55, 5, 2, 'ggg', '<p>grgrg</p>', 'AdminCustomer', '2017-03-21 01:29:28', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `registered_payee`
--

CREATE TABLE `registered_payee` (
  `registered_payee_id` int(10) NOT NULL,
  `customer_id` int(20) NOT NULL,
  `registered_payee_type` varchar(20) NOT NULL,
  `payee_name` varchar(25) NOT NULL,
  `bank_acc_no` bigint(20) NOT NULL,
  `acc_type` varchar(25) NOT NULL,
  `bank_name` varchar(25) NOT NULL,
  `ifsc_code` varchar(25) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `registered_payee`
--

INSERT INTO `registered_payee` (`registered_payee_id`, `customer_id`, `registered_payee_type`, `payee_name`, `bank_acc_no`, `acc_type`, `bank_name`, `ifsc_code`, `status`) VALUES
(1, 1, 'Intra Bank', 'John Hudson', 117501000811408, 'Salary Account', 'eBanking', 'EB000003', 'Active'),
(2, 2, 'Intra Bank', 'Clement Dsouza', 117501000811394, 'Savings', 'eBanking', 'EB000001', 'Active'),
(3, 1, 'Other bank', 'Abi', 108301111000030, 'Fixed deposite', 'Vijaya Bank', 'VIJB10830', 'Pending'),
(4, 7, 'Intra Bank', 'Clement Dsouza', 117501000811395, 'Savings', 'eBanking', 'EB000001', 'Active'),
(5, 7, 'Intra Bank', 'Clement Dsouza', 117501000811395, 'Savings', 'eBanking', 'EB000001', 'Active'),
(6, 7, 'Intra Bank', '', 0, '', '', '', 'Active');

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `trans_id` int(15) NOT NULL,
  `registered_payee_id` int(25) NOT NULL,
  `from_acc_no` bigint(100) NOT NULL,
  `to_acc_no` bigint(100) NOT NULL,
  `amount` float(10,2) NOT NULL,
  `comission` float(10,2) NOT NULL,
  `particulars` varchar(100) NOT NULL,
  `transaction_type` varchar(25) NOT NULL,
  `trans_date_time` datetime NOT NULL,
  `approve_date_time` datetime NOT NULL,
  `payment_status` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`trans_id`, `registered_payee_id`, `from_acc_no`, `to_acc_no`, `amount`, `comission`, `particulars`, `transaction_type`, `trans_date_time`, `approve_date_time`, `payment_status`) VALUES
(1, 0, 0, 117501000811394, 50000.00, 0.00, 'Deposite', 'Credit', '2017-03-07 05:29:16', '2017-03-07 05:29:16', 'Active'),
(2, 0, 0, 117501000811394, 10000.00, 0.00, 'Deposit', 'Cheque', '2017-03-07 05:30:14', '2017-03-07 05:30:14', 'Active'),
(3, 0, 0, 117501000811394, 10000.00, 0.00, 'withdraw\r\n', 'Debit', '2017-03-07 05:31:18', '2017-03-07 05:31:18', 'Active'),
(4, 2, 117501000811394, 117501000811394, 9500.00, 0.00, 'fund transfered', 'Credit', '2017-03-07 05:39:25', '2017-03-07 05:39:25', 'Active'),
(5, 2, 0, 117501000811394, 9500.00, 0.00, 'fund transfered', 'Debit', '2017-03-07 05:39:25', '2017-03-07 05:39:25', 'Active'),
(6, 0, 0, 117501000811394, 5000.00, 0.00, 'Loan Amount payment of Ac No. 117501000811398', 'Debit', '2017-03-08 02:49:35', '2017-03-08 02:49:35', 'Active'),
(7, 0, 0, 117501000811411, 10000.00, 0.00, 'Account opening balance', 'Credit', '2017-03-08 07:19:52', '2017-03-08 07:19:52', 'Approved'),
(8, 0, 0, 117501000811411, 1000.00, 0.00, 'Account opening balance', 'Cheque', '2017-03-08 07:19:52', '0000-00-00 00:00:00', 'Active'),
(9, 0, 0, 117501000811395, 80000.00, 0.00, 'Deposit', 'Credit', '2017-03-10 06:12:22', '2017-03-10 06:12:22', 'Active'),
(10, 0, 0, 117501000811395, 10000.00, 0.00, 'Deposit', 'Credit', '2017-03-10 06:13:06', '2017-03-10 06:13:06', 'Active'),
(11, 0, 0, 117501000811414, 100000.00, 0.00, 'Account opening balance', 'Credit', '2017-03-10 01:33:10', '2017-03-10 01:33:10', 'Approved'),
(12, 0, 0, 117501000811414, 10000.00, 0.00, 'Account opening balance', 'Credit', '2017-03-17 08:11:29', '2017-03-17 08:11:29', 'Approved'),
(13, 0, 0, 117501000811414, 5000.00, 0.00, 'Deposit', 'Credit', '2017-03-17 08:22:05', '2017-03-17 08:22:05', 'Active'),
(14, 0, 0, 117501000811414, 4000.00, 0.00, 'withdraw', 'Debit', '2017-03-17 08:22:27', '2017-03-17 08:22:27', 'Active'),
(15, 0, 0, 117501000811414, 5000.00, 0.00, 'Loan Amount payment of Ac No. 117501000811415', 'Debit', '2017-03-17 08:41:16', '2017-03-17 08:41:16', 'Active'),
(16, 0, 0, 117501000811414, 10000.00, 0.00, 'Deposit', 'Credit', '2017-03-17 10:44:51', '2017-03-17 10:44:51', 'Active'),
(17, 0, 0, 117501000811414, 6000.00, 0.00, 'Withdraw', 'Debit', '2017-03-17 10:48:04', '2017-03-17 10:48:04', 'Active'),
(18, 0, 0, 117501000811394, 10000.00, 0.00, 'test', 'Debit', '2017-03-17 03:51:43', '2017-03-17 03:51:43', 'Active'),
(19, 0, 0, 117501000811421, 5656.00, 0.00, 'Account opening balance', 'Credit', '2017-03-21 01:24:34', '2017-03-21 01:24:34', 'Approved'),
(20, 0, 0, 117501000811414, 0.00, 0.00, '', 'Debit', '2017-03-21 01:36:38', '2017-03-21 01:36:38', 'Active'),
(21, 0, 0, 0, 0.00, 0.00, '', 'Debit', '2017-03-21 01:46:03', '2017-03-21 01:46:03', 'Active'),
(22, 0, 0, 117501000811414, 0.00, 0.00, 'Loan Amount payment of Ac No. 117501000811415', 'Debit', '2017-03-21 01:49:41', '2017-03-21 01:49:41', 'Active'),
(23, 0, 0, 117501000811414, 0.00, 0.00, 'Loan Amount payment of Ac No. 117501000811415', 'Debit', '2017-03-21 01:51:59', '2017-03-21 01:51:59', 'Active');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`acc_no`);

--
-- Indexes for table `account_master`
--
ALTER TABLE `account_master`
  ADD PRIMARY KEY (`acc_type_id`);

--
-- Indexes for table `branch`
--
ALTER TABLE `branch`
  ADD PRIMARY KEY (`ifsc_code`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- Indexes for table `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`emp_id`);

--
-- Indexes for table `fixed_deposit`
--
ALTER TABLE `fixed_deposit`
  ADD PRIMARY KEY (`fd_id`);

--
-- Indexes for table `loan`
--
ALTER TABLE `loan`
  ADD PRIMARY KEY (`loan_acc_no`);

--
-- Indexes for table `loan_payment`
--
ALTER TABLE `loan_payment`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `loan_type`
--
ALTER TABLE `loan_type`
  ADD PRIMARY KEY (`loan_type_id`);

--
-- Indexes for table `mail`
--
ALTER TABLE `mail`
  ADD PRIMARY KEY (`mail_request_id`);

--
-- Indexes for table `registered_payee`
--
ALTER TABLE `registered_payee`
  ADD PRIMARY KEY (`registered_payee_id`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`trans_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `account_master`
--
ALTER TABLE `account_master`
  MODIFY `acc_type_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `employee`
--
ALTER TABLE `employee`
  MODIFY `emp_id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `fixed_deposit`
--
ALTER TABLE `fixed_deposit`
  MODIFY `fd_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `loan_payment`
--
ALTER TABLE `loan_payment`
  MODIFY `payment_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `loan_type`
--
ALTER TABLE `loan_type`
  MODIFY `loan_type_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `mail`
--
ALTER TABLE `mail`
  MODIFY `mail_request_id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;
--
-- AUTO_INCREMENT for table `registered_payee`
--
ALTER TABLE `registered_payee`
  MODIFY `registered_payee_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `trans_id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
