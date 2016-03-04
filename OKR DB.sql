-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Mar 04, 2016 at 03:33 PM
-- Server version: 5.5.47-0ubuntu0.14.04.1
-- PHP Version: 5.5.9-1ubuntu4.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Project_Madapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `OKR_Archive`
--

CREATE TABLE `OKR_Archive` (
  `id` int(11) UNSIGNED NOT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `cycle` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `OKR_Archive`
--

INSERT INTO `OKR_Archive` (`id`, `user_id`, `cycle`) VALUES
(1, 1, 4),
(2, 1, 5),
(3, 19444, 5),
(4, 19444, 6),
(5, 8276, 5),
(6, 17383, 5),
(7, 37088, 5),
(8, 46174, 5),
(9, 32392, 5),
(10, 5208, 5),
(11, 44355, 5),
(12, 41257, 5),
(13, 41257, 6),
(14, 4111, 5),
(15, 27166, 5),
(16, 27166, 6),
(17, 22675, 5),
(18, 45482, 5),
(19, 72766, 5),
(20, 42525, 5),
(21, 45929, 5),
(22, 38507, 5),
(23, 22841, 5),
(24, 53329, 5),
(25, 4111, 6),
(26, 32444, 5),
(27, 8276, 6),
(28, 24175, 5),
(29, 35378, 5),
(30, 28576, 5),
(31, 28576, 6),
(32, 21332, 5),
(33, 50857, 5),
(34, 50857, 6),
(35, 21322, 5),
(36, 26837, 5),
(37, 26837, 6),
(38, 21332, 6),
(39, 45929, 6),
(40, 45929, 6),
(41, 4, 5),
(42, 4, 6),
(43, 67413, 5),
(44, 18835, 5),
(62, 21830, 3),
(63, 45482, 3),
(64, 27833, 4),
(66, 22332, 4),
(67, 74177, 4),
(68, 23466, 4),
(69, 38279, 4),
(70, 34066, 5),
(71, 49628, 5),
(72, 50340, 5),
(73, 21322, 1);

-- --------------------------------------------------------

--
-- Table structure for table `OKR_Grade`
--

CREATE TABLE `OKR_Grade` (
  `id` int(11) UNSIGNED NOT NULL,
  `mode_id` enum('vertical','horizontal','both') DEFAULT 'horizontal',
  `region_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `city_id` int(11) UNSIGNED NOT NULL DEFAULT '0',
  `vertical_id` int(11) UNSIGNED DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `grade` float DEFAULT NULL,
  `cycle` int(2) NOT NULL,
  `limited_data` enum('0','1') NOT NULL DEFAULT '0',
  `updated_on` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `OKR_Grade`
--

INSERT INTO `OKR_Grade` (`id`, `mode_id`, `region_id`, `city_id`, `vertical_id`, `user_id`, `grade`, `cycle`, `limited_data`, `updated_on`) VALUES
(1, 'both', 0, 26, 0, 1, 6.93, 6, '1', '2014-07-01 11:00:41'),
(4, 'horizontal', 0, 0, 0, 0, 0, 6, '1', '2014-07-01 11:00:41'),
(12, 'vertical', 0, 0, 0, 0, 0, 6, '1', '2014-07-01 11:00:41');

-- --------------------------------------------------------

--
-- Table structure for table `OKR_Key_Result`
--

CREATE TABLE `OKR_Key_Result` (
  `id` int(11) UNSIGNED NOT NULL,
  `subject` varchar(100) NOT NULL,
  `objective_id` int(11) UNSIGNED NOT NULL,
  `grade` float DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `OKR_Key_Result`
--

INSERT INTO `OKR_Key_Result` (`id`, `subject`, `objective_id`, `grade`) VALUES
(1, 'Designs have a 80% buy in from stake holders', 1, 8),
(3, '10 People in the intern pool', 3, 1),
(4, 'Minimum 30% Engagement of intern pool at all times', 3, 2),
(5, 'At least 3 projects handled in entirity by interns', 3, 3),
(6, 'Have 3 colaterals ready for the conference', 1, 0),
(7, 'KR 1:1', 4, 1),
(8, 'KR 1:2', 4, 2),
(9, 'KR 1:3', 4, 3),
(10, 'KR 2:1', 5, 4),
(11, 'KR 3:1', 6, 5),
(12, 'KR 2:2', 5, 4),
(13, 'KR 3:2', 6, 6),
(14, '15 Ed Support Volunteers', 9, 8),
(15, '20 Discover Volunteers', 9, 7),
(16, 'Add 15 Colleges by 5th', 10, 5),
(17, 'Make presentations in 5 colleges by 30th', 10, 9),
(18, 'Get 4 or higher Avg rating and induction training', 11, 10),
(19, 'Launch FB president\\''s update on 14th', 12, 2),
(20, ' Work with Cathy on her LC Sessions', 13, 0),
(21, 'Work with Loy on her LC Sessions', 13, 0),
(22, 'Work with finance team on their LC Sessions', 13, 0),
(23, 'Work with the directors and loy for the presidents   team LC Sessions', 13, 0),
(24, 'Work with Megha on her LC Sessions', 13, 0),
(25, ' Work with Khushboo and Gloria on PD LC Sessions', 13, 0),
(26, 'Speak to Abhishek and get his buy in on common   sessions', 13, 0),
(27, 'Work with Cathy on her city review parameters', 14, 0),
(28, 'Spend 30 mins with Loy on her city review parameters', 14, 0),
(29, 'Sent out the communication to all fellows', 15, 9),
(30, 'National Team -Ticket Booking', 15, 9),
(31, 'Strats Tickets- Sending', 15, 9),
(32, 'Room allocation meeting with Vaibhav and Rijuta', 15, 9),
(33, 'North Mail Ids', 20, 6),
(34, 'Final check on mail ids', 20, 9),
(35, 'Ed Support dashboard complete and working', 22, 0),
(36, 'Attendance marking for volunteers and students complete and working', 22, 0),
(37, 'Have 1 hour con-call reviewing the final content with the Dream Team', 23, 0),
(38, 'Sync up for 15-30 mins with Jithin and Kaus', 23, 0),
(39, 'Spend 1 hour with Cathy to create the Bhai_Bhai session', 23, 0),
(40, 'Spend 30 mins with vaibhav to give and get clarity on integration', 23, 0),
(41, 'Spend 0.5 hrs on each session to create framework', 24, 0),
(42, 'Spend 30 mins on the doc created with Kaus', 25, 0),
(43, 'Spend 30 mins with Jithin to sign off', 25, 0),
(44, 'Document the framework with each session on the Doc', 24, 0),
(45, 'update salary sheet with changes', 26, 0),
(46, 'send email to finance team', 26, 0),
(50, 'Have the themes of the sessions prepared', 28, 0),
(51, 'Have the deliverables of each session spelt out.', 28, 0),
(52, 'Milestone app needs to have a complete date option', 16, 10),
(53, 'Milestones can checked off only by who assigns it', 16, 10),
(54, 'The person who puts the milestones should be able to enter remarks', 16, 0),
(55, 'Create APK file', 17, 10),
(56, 'Get Paul to install it', 17, 10),
(57, 'Push all commits to the online app', 17, 10),
(58, 'Make sure all TODOs are cleared', 17, 3),
(59, 'Bike is working', 18, 10),
(60, 'Get meeting with Rakesh', 19, 10),
(61, 'Get a list of things to change in MADApp', 19, 5),
(62, 'Have the activity prepared for each of the themes.', 28, 0),
(63, 'Leave office at 6:00 P.M.', 29, 0),
(64, 'Meet brother/friends for dinner and spend atleast 2-3 hours with them.', 29, 0),
(65, 'Form a list of review parameters for CH.', 30, 0),
(66, 'Have a discussion with Vrishi,Kaus and Shil to finalise the parameters.', 30, 0),
(67, 'Speak to CTL and confirm if all is good.', 31, 0),
(68, 'Come up with 7 hours of content', 33, 0),
(69, 'Make Madapp login for all who dont have one', 34, 10),
(70, 'Respond and resolve all OKR issues', 34, 10),
(71, 'spend 15min on re-checking the session\\\\\\\\\\\\\\''s impact', 33, 0),
(72, 'Finish LxD blog post and email it to Abhishek for feedback. ', 35, 0),
(73, 'Review the Global Giving blog post', 35, 0),
(74, 'Send off the LC Communication email to the Fellows', 35, 0),
(75, 'Watch OKR video', 35, 0),
(76, 'Quantify and arrange sessions', 36, 0),
(77, 'Relook at the review parameters', 36, 0),
(78, 'Relook at the review parameters', 36, 0),
(79, 'Spend 30 mins with Jithin discussing the present schedule', 37, 0),
(80, 'Spend 15 mins on each session to list the session collateral', 37, 0),
(81, 'Get SalesForce+Donut Testing Setup created', 37, 0),
(82, 'Send User List of SalesForce to Sanjay', 37, 0),
(83, 'Talk to all verticals heads and get buy in for adding Finance Metrics', 39, 0),
(84, 'Get Confirmation from Ritesh regarding Bank Approval', 40, 0),
(85, 'Cash Flow Doc should be updated', 41, 0),
(86, 'Excel Doc to be prepared', 42, 0),
(87, 'Pass the necessory entries in Tally', 43, 0),
(88, 'Pass necessory entry in to Tally', 44, 0),
(89, 'Cash Flow Doc to be Updated', 45, 0),
(90, 'Prepare the excel sheet', 46, 0),
(91, 'Spend 1.5 hours to create a framework for Introduction + Role Clarity + Culture setting', 48, 0),
(92, 'Align sessions for CTL + CH for Deccan and Central', 48, 0),
(93, 'Get print out of the agreement', 49, 0),
(94, 'Finalize the LC agenda at least 24 hours before the timeline ', 50, 0),
(95, ' Communicate agenda to all stakeholders and get buy in (Rizwan)', 50, 0),
(96, ' Spend 30 mins with finance team on their city review parameters', 14, 0),
(97, 'Spend 60 mins with the directors for the presidents team city review parameters', 14, 0),
(98, ' Spend 60 mins with Megha on her city review parameters', 14, 0),
(99, 'Spend 30 mins with Khushboo and Gloria on PD city review parameters', 14, 0),
(100, 'Create a seperate quarterly review parameter doc. ', 14, 0),
(101, ' Open time between 3:30 to 4:00', 52, 0),
(102, ' Allignment meeting to ensure everyone is aware of everything and there are no doubts.', 52, 0),
(103, 'Do an OKR showcase and help people understand an area of confusion', 52, 0),
(104, 'Do a MADapp showcase and show people how awesome MAD has become', 52, 0),
(105, 'Prepare version 2 of Adult Outcome mindmap', 51, 0),
(106, 'Approve Plan', 53, 0),
(107, 'Complete plan by tonight', 53, 0),
(108, 'PPTs done', 54, 0),
(109, '2 hours thinking and structuring the sessions', 54, 0),
(110, '1 questionnaire', 55, 0),
(111, '2 review parameters for CTLS', 56, 0),
(112, '7 review parameters for CHs', 56, 0),
(113, 'Send out mail', 57, 0),
(114, 'Sync with strat', 57, 0),
(115, 'Spend 45 mins with each strat on a call', 59, 0),
(116, 'Spend 4 hours on reading about appriciative enquiry online', 38, 0),
(117, 'Do one engagement activity on Whatsapp group', 59, 0),
(118, 'Inter vertical Collaboration', 61, 0),
(119, 'snehabhavan done', 62, 0),
(120, 'ymca done', 62, 0),
(121, 'crescent done', 62, 0),
(122, 'big boys done', 62, 0),
(123, 'Fellows update things without me following up.', 72, 0),
(124, 'Sticking to the schedule of time: Fellow calls for 45  minutes', 76, 0),
(125, 'Acknowledging every email in your inbox on time until the next cycle.', 77, 0),
(126, 'Get L3 in all your milestones in Q2', 78, 0),
(127, 'deliver trello tasks ', 79, 0),
(128, 'Class wise papers- connecting to chs+teachers', 80, 2),
(129, 'Preparing a module for evaluation', 80, 2),
(130, 'attained', 69, 0),
(131, 'attained', 70, 0),
(132, 'still lagging', 71, 0),
(133, 'Reply to emails within 48 hours', 84, 0),
(134, 'Fill in all Docs on time', 84, 0),
(135, '4', 85, 8),
(136, '5', 85, 7),
(137, 'Setting deadlines', 86, 0),
(138, 'Follow up', 86, 0),
(139, 'Be regular friends with atleast 10 volunteers and have 18 close friends', 89, 0),
(140, 'To have a 75% increase in effectiveness of the classes and 0 anomalies in budgets, bills and account', 90, 0),
(141, 'Reach 24 teams', 91, 0),
(142, 'Visits every center once in 2 weeks', 92, 5),
(143, 'Do a ops concall once in two week', 93, 2),
(144, 'Quality check 9 days in advance', 94, 3),
(145, 'Yo', 97, 0),
(146, 'Yo', 99, 0),
(147, 'Test', 97, 0),
(148, 'Result', 101, 0),
(149, 'Have a one-one with everyone in team once a week', 103, 0),
(150, '5 volunteer per week!', 117, 0),
(151, 'weekly mail about city updates', 125, 0),
(152, 'immediate communication about the problems being faced', 125, 0),
(153, 'setting up deadlines for  a cycle', 126, 0),
(154, 'setting up a high priority task list', 126, 0),
(155, 'weekly calls with interns', 127, 0),
(156, 'Ensure 3 hours per day for Propel work', 133, 0),
(157, 'Help 2 fellows to customize the kit for their centres per week', 134, 0),
(158, 'Spend 3 hours per week on aftercare', 135, 0),
(159, 'Have 1 sync up call per week with Vaibhav and Bhumika', 135, 0),
(160, 'Ensure that I do the work taken up by me on the promised day.', 145, 0),
(161, 'If I foresee a difficulty, I will inform the concerned persons 2 days prior.', 145, 0),
(162, 'Ensure that all relevant information is conveyed to the concerned person with 12 hours of receipt on', 146, 0),
(163, 'Ensure acknowledgement of the message from their end within 18 hours of my sending it.', 146, 0),
(164, 'Ensure that important conversations take place within a week from when I become aware of such a nece', 147, 0),
(165, 'Ensure that I am adequately prepared for such a conversation to make the person comfortable through', 147, 0),
(166, 'Keeping personal deadlines as 2 days before the final deadline', 149, 0),
(167, 'To break down tasks over the week (i.e every Tuesday and Friday write the to doâ€™s and the deadline', 149, 0),
(168, 'Try talking to at least 2 volunteers a week on informal basis.', 155, 0),
(169, 'Making a dedicated timetable to manage both levels.', 156, 0),
(170, 'Have one-one interaction with all the MADsters at the centre to understand their problems. ', 157, 0),
(171, 'All children score atleast 50% in their school exams.', 158, 0),
(172, 'More volunteer involvement', 161, 0),
(173, 'Supporting workload', 162, 0),
(174, 'Classes for 4 weeks with full teacher attendance', 166, 0),
(175, 'Supportive reviews from them regarding child behavior at the end of year meeting', 167, 0),
(176, 'Permission for us to take classes for grade 9 and 10 students', 167, 0),
(177, 'Permission for Propel next year.', 167, 0),
(178, 'Conduct minimum one round of tests by end of December.', 168, 0),
(179, 'Document all the activities and sessions conducted this year in Drive folders and journals to be giv', 169, 0),
(180, '100% pass percentage', 170, 0),
(181, 'Less than 20% attrition', 170, 0),
(182, '90% attendence for last cct', 170, 0),
(183, 'document kids progress reports,challenges faced etc by feb  ', 171, 0),
(184, 'Talk to at least 5 people who could assume my role next year ', 171, 0),
(185, 'Have at least 3 classes (2 hours each) of both the subjects in a month.', 172, 0),
(186, 'Not exceeding any deadline regarding any work', 173, 0),
(187, 'Talk to parents at least twice everyday', 174, 0),
(188, 'Spend at least 1 hour everyday just with friends', 174, 0),
(189, 'To attend 2-3 activities/vertical every month.', 179, 0),
(190, 'To make friends with atleast 2-3 volunteers per vertical.', 180, 0),
(191, 'To attend 2-3 activities/vertical every month.', 179, 0),
(192, 'To make friends with atleast 2-3 volunteers per vertical.', 180, 0),
(193, '2 events/month apart from center work . ', 184, 0),
(194, '1 Cfr/month.', 184, 0),
(195, '1 Event ownership.', 184, 0),
(196, 'Atleast 1 ideas per month.', 185, 0),
(197, 'Conducting one Town Hall in CMO B group/month.', 185, 0),
(198, 'Confirm attendance to meetings', 186, 0),
(199, 'Be at the meeting 10 minutes early', 186, 0),
(200, 'Inform a day early incase unable to attend the meeting.', 186, 0),
(201, 'Come prepared to meetings.', 186, 0),
(202, 'The next time you have a concern about a co fellow write it down.', 187, 0),
(203, 'If the same concern repeats more than 3 times have a conversation with the co fellow.', 187, 0),
(204, 'If the same concern still repeats for more than 3 times inform the strat', 187, 0),
(205, 'If the concern still repeats inform vertical head.', 187, 0),
(206, 'Confirm on a time slot to speak to your strat.', 188, 0),
(207, 'Every time you miss a slot give yourself one tight slap.', 188, 0),
(208, 'Give yourself a target ', 189, 0),
(209, 'List current opportunities where funds can be generated.', 189, 0),
(210, 'Put down every meeting you attend with the city', 190, 0),
(211, 'Make atleast 3 comments a day on the whatsapp group', 190, 0),
(212, 'Take atleast 1 role in every city activity', 190, 0),
(213, 'Mark every time you speak to someone about a problem', 191, 0),
(214, 'Give atleast 3 solutions yourself before you speak to some one.', 191, 0),
(215, 'Take up a target ', 192, 0),
(216, 'List the current opportunities', 192, 0),
(217, 'Attend a Discover Volunteers meet.', 193, 0),
(218, 'Attend minimum one discover activity a month.', 193, 0),
(219, 'Invite Discover volunteers to ACTT Center Circle.', 193, 0),
(220, 'Have a successful and positive CA meet on 19th December.', 194, 0),
(221, 'Have an expectation setting with CA.', 194, 0),
(222, 'Have instant responses to ACTT Needs.', 194, 0),
(223, 'Have ACTT Townhall with volunteers once a month.', 195, 0),
(224, 'Have a feedback form ready for kids to be given to teachers on Center Circle. (28th December)', 195, 1),
(227, 'I would visit the Center six times a month at least.', 196, 0),
(228, ' A call with a Warden of the Center every 2 weeks to be updated completely about the ongoing events ', 196, 0),
(229, ' I will attend and support at least two Inter-Vertical activities every month (Other than Dream Camp', 196, 0),
(230, ' I will devote an hour to online activities per day.', 197, 0),
(231, ' I will like the posts as well as share my views on every post throughout the week. ', 197, 0),
(232, 'I will assure the active online presence and involvement of at least 6-7 volunteers from CMOG.  ', 197, 0),
(233, ' Arranging for two desktops for CMOG at the earliest.', 198, 0),
(234, 'Starting a Library Project by 20th January, 2015 at the Center.', 198, 0),
(235, 'Bi Weekly Calls', 175, 0),
(236, '8 hours per week for clearing backlog ', 176, 0),
(237, 'Number of events the interns are Pro-chas / team leads for.', 204, 0),
(238, 'Documents updated in Drive. ', 205, 0),
(239, 'Getting maths also in DKS by May.', 206, 0),
(240, '10 Discover activities till May.', 206, 0),
(241, '1 substitute appearance/month.', 207, 0),
(242, '+1 Credit should come from attending five classes in a row.', 207, 0),
(243, 'Organising 2 outings for saturday volunteers in the next two months.', 208, 0),
(244, 'Ensuring DKS farewell has 90% attendance.', 208, 0),
(245, 'hvkjbbkh', 211, 0),
(246, 'Expected Bounce Rate :<= 50%', 212, 1);

-- --------------------------------------------------------

--
-- Table structure for table `OKR_Objective`
--

CREATE TABLE `OKR_Objective` (
  `id` int(11) UNSIGNED NOT NULL,
  `subject` varchar(100) NOT NULL,
  `type` enum('personal','organization') DEFAULT NULL,
  `grade` float DEFAULT '0',
  `cycle` int(2) NOT NULL DEFAULT '0',
  `status` enum('0','1') NOT NULL DEFAULT '1',
  `user_id` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `OKR_Objective`
--

INSERT INTO `OKR_Objective` (`id`, `subject`, `type`, `grade`, `cycle`, `status`, `user_id`) VALUES
(1, 'Get a designer for the tech team', 'personal', 8, 5, '1', 1),
(3, 'Create a pool of tech interns', 'personal', 2, 5, '1', 1),
(4, 'Obj 1', 'personal', 2, 5, '1', 23068),
(5, 'Obj 2', 'personal', 4, 5, '1', 23068),
(6, 'Obj 3', 'personal', 5.5, 5, '1', 23068),
(7, 'Have a server in the office', 'personal', 0, 5, '1', 1),
(8, 'Bring my system from home', 'personal', 0, 5, '1', 1),
(9, 'Complete Recruitment', 'personal', 7.5, 5, '1', 19317),
(10, 'Create Diversity Metrics', 'personal', 7, 5, '1', 19317),
(11, 'Improve Induction training', 'personal', 10, 5, '1', 19317),
(12, 'Improve Communication', 'personal', 2, 5, '1', 19317),
(13, 'Support verticals to freeze LC Sessionssdasd', 'personal', 0, 5, '1', 4),
(14, 'Support verticals to freeze Review parameters', 'personal', 0, 5, '1', 4),
(15, 'LC Logistics', 'personal', 9, 5, '1', 8276),
(16, 'Create the new feature requests', 'personal', 10, 6, '1', 1),
(17, 'Build a testable version of Donut', 'personal', 8.25, 6, '1', 1),
(18, 'Get the bike back', 'personal', 10, 6, '1', 1),
(19, 'Get requirements from Rakesh', 'personal', 7.5, 6, '1', 1),
(20, 'Today', 'personal', 7.5, 5, '1', 8276),
(22, 'Showcase MADApp new look', 'personal', 0, 5, '1', 629),
(23, 'Freeze LC sessions', 'personal', 0, 5, '1', 35382),
(24, 'Finalise out LC Session', 'personal', 0, 5, '1', 20866),
(25, 'Finalize Review Parameters', 'personal', 0, 5, '1', 35382),
(26, 'Clear salary details', 'personal', 0, 5, '1', 20866),
(28, 'Freeze on the LC Session themes and have clarity on content of the session.', 'personal', 0, 5, '1', 42117),
(29, 'Meet brother/friends before leaving to Hyderabad.', 'personal', 0, 5, '1', 42117),
(30, 'Think through the eview parameters for centre heads', 'personal', 0, 5, '1', 42117),
(31, 'Confirm tickets with all the CTL for their cities.', 'personal', 0, 5, '1', 42117),
(32, 'Ensure Bros fill up the BRO TRIP form.', 'personal', 0, 5, '1', 42117),
(33, 'Freeze session list for LC', 'personal', 0, 5, '1', 17383),
(34, 'Help with OKR Adoption', 'personal', 10, 6, '1', 1),
(35, 'Finish unfinished bussinesses', 'personal', 0, 5, '1', 61137),
(36, 'Fine tune sessions and review parameters', 'personal', 0, 5, '1', 61137),
(37, 'Finalize LC Session Planning', 'personal', 0, 5, '1', 43880),
(38, 'Work on Apriciative Inquiry implementation in Propel', 'personal', 0, 5, '1', 106),
(39, 'Finalize Core Metrics', 'personal', 0, 5, '1', 43880),
(40, 'Complete Bank Setup for Stipend Release', 'personal', 0, 5, '1', 43880),
(41, 'Have to complete the  Cash Flow statement', 'personal', 0, 5, '1', 19444),
(42, 'Have to prepare the final list of Fellowship stipend', 'personal', 0, 5, '1', 19444),
(43, 'Have to Clear the Suspense in Tally', 'personal', 0, 5, '1', 19444),
(44, 'Have to Clear the Suspense in Tally', 'personal', 0, 7, '1', 19444),
(45, 'Have to complete the  Cash Flow Doc', 'personal', 0, 7, '1', 19444),
(46, 'Have to prepare the final list of Fellow stipend', 'personal', 0, 7, '1', 19444),
(48, 'Build-out the LC sessions for CTL and CH', 'personal', 0, 5, '1', 18269),
(49, 'Complete agreement process for the apt', 'personal', 0, 5, '1', 18269),
(50, 'Ensure a smooth and effective training for the team ', 'personal', 0, 5, '1', 1915),
(51, 'Adult Outcome characteristics ', 'personal', 0, 5, '1', 1915),
(52, ' Ensure everyone is stress free during the whole process', 'personal', 0, 5, '1', 4),
(53, 'Set up values session for LC', 'personal', 0, 5, '1', 9802),
(54, 'LC Sessions Design', 'personal', 0, 5, '1', 538),
(55, 'Discover Intern Interview Questionnaire Design', 'personal', 0, 5, '1', 538),
(56, 'Review Parameters, etc', 'personal', 0, 5, '1', 538),
(57, 'Fellow reflection mails for LC', 'personal', 0, 5, '1', 9802),
(58, 'Recruitment parameters', 'personal', 0, 5, '1', 9802),
(59, 'Help strats prep for the LC', 'personal', 0, 5, '1', 106),
(60, 'Ensure fellows are inducted a little before the LC', 'personal', 0, 5, '1', 106),
(61, 'Start working on Ed-Discover Collaboration - Deccan', 'personal', 1, 5, '1', 5208),
(62, 'finish child profiling', 'personal', 0, 5, '1', 53519),
(63, 'Recruitment 3 - Call 350 volunteers , Bigger venue , Plan Sheet transfer ', 'personal', 0, 5, '1', 37819),
(64, 'Organize Google Drive', 'personal', 0, 5, '1', 37819),
(65, 'Lose weight', 'personal', 0, 5, '1', 37819),
(66, 'Sourcing Fundraising -  Colleges -> College Campaigns', 'personal', 0, 5, '1', 37819),
(67, 'Sourcing Ed Support - Kannada Colleges/Schools', 'personal', 0, 5, '1', 37819),
(68, 'Mad App Cleaning', 'personal', 0, 5, '1', 37819),
(69, 'call new applicants - cover at least 200 candidates.', 'personal', 0, 5, '1', 53329),
(70, 'recruitment drive - at least 100 applicants.', 'personal', 0, 5, '1', 53329),
(71, 'receive a positive feedback', 'personal', 0, 5, '1', 53329),
(72, 'MAke fellows independent', 'personal', 0, 6, '1', 5208),
(73, 'Volunteer Sourcing for Propel', 'personal', 0, 5, '1', 4111),
(74, 'Volunteer Sourcing for Propel', 'personal', 0, 6, '1', 4111),
(76, 'Reliability', 'personal', 0, 5, '1', 15084),
(77, 'Be more reliable', 'personal', 0, 5, '1', 727),
(78, 'Honouring the word ', 'personal', 0, 5, '1', 727),
(79, 'Proactive communication ', 'personal', 0, 5, '1', 727),
(80, 'Assesments ', 'personal', 2, 5, '1', 8964),
(81, 'ensure yash understands OKR', 'personal', 0, 5, '1', 106),
(82, 'Complete mentor allocation by 5th October 14', 'personal', 0, 5, '1', 26142),
(83, 'FINAL MENTOR GROUPING', 'personal', 0, 6, '1', 45929),
(84, 'Mission Increase Reliability ', 'personal', 0, 5, '1', 31250),
(85, 'i', 'personal', 7.5, 6, '1', 8276),
(86, 'Milestones', 'personal', 0, 7, '1', 8276),
(87, 'Milestones', 'personal', 0, 7, '1', 8276),
(88, 'Go through all mails', 'personal', 0, 5, '1', 35439),
(89, 'To be more reliable, accessible and reach out to volunteers and fellows alike', 'personal', 0, 5, '1', 34622),
(90, 'To uplift the core Ed Support and finance certicals', 'personal', 0, 5, '1', 34622),
(91, 'Chakravyuh 3.0', 'personal', 0, 5, '1', 50857),
(92, 'Do center visits ', 'personal', 5, 6, '1', 4),
(93, 'Improve communication with city core team', 'personal', 2, 6, '1', 4),
(94, 'milestone completed maximum at level 2', 'personal', 3, 6, '1', 4),
(95, 'Help her deal with her family issues', 'personal', 0, 5, '1', 65770),
(96, 'Help her pass in her re-tests scheduled for this December', 'personal', 0, 5, '1', 65770),
(97, 'Test', 'personal', 0, 3, '1', 1),
(98, 'Yo', 'personal', 0, 3, '1', 42117),
(99, 'Test', 'personal', 0, 3, '1', 7413),
(100, 'Test', 'personal', 0, 3, '1', 538),
(101, 'Objective 1', 'personal', 0, 3, '1', 4),
(102, 'To improve my interaction with the Center Heads', 'personal', 0, 3, '1', 18269),
(103, 'Alignment with everyone in team', 'personal', 0, 3, '1', 16460),
(104, 'Empower fellows to take decisions', 'personal', 0, 3, '1', 16460),
(105, 'Talk to 1 RnD, 1 City Support Strat and vaibhav/shilpa once a week.', 'personal', 0, 1, '1', 37126),
(106, '1 town-hall revisiting Support and Expectation with fellows bi-weekly.', 'personal', 0, 1, '1', 37126),
(107, 'To seek help proactively within 3 days (in ideal conditions) after the problem is faced.', 'personal', 0, 3, '1', 45922),
(108, 'To finish all the documentation before 5 hours of the given deadline.', 'personal', 0, 3, '1', 45922),
(109, 'take more objective decisions', 'personal', 0, 3, '1', 14906),
(110, 'Improve my level of involvement internally', 'personal', 0, 3, '1', 6531),
(111, 'Improve my level of involvement in terms of external communication', 'personal', 0, 3, '1', 6531),
(112, 'Improve communication with my fellows', 'personal', 0, 3, '1', 6531),
(113, 'work on being more balanced ( personal work + professional work) ', 'personal', 0, 3, '1', 14906),
(114, 'work on being more balanced ( personal work + professional work) ', 'personal', 0, 3, '1', 14906),
(115, 'work on being more balanced ( personal work + professional work) ', 'personal', 0, 3, '1', 14906),
(116, 'increase interaction with volunteers', 'personal', 0, 3, '1', 14906),
(117, 'increase interaction with volunteers', 'personal', 0, 3, '1', 14906),
(118, 'increase interaction with volunteers', 'personal', 0, 3, '1', 14906),
(119, 'To build a good rapport with my team by facilitating two way communication flow and taking feedbacks', 'personal', 0, 4, '1', 15571),
(120, 'To have a detailed structure plan for everything.', 'personal', 0, 4, '1', 15571),
(121, 'To prioritise things by making a proper time schedule.', 'personal', 0, 4, '1', 15571),
(122, 'To build a good rapport with my team by facilitating two way communication flow and taking feedbacks', 'personal', 0, 4, '1', 15571),
(123, 'To have a detailed structure plan for everything.', 'personal', 0, 4, '1', 15571),
(124, 'To prioritise things by making a proper time schedule.', 'personal', 0, 4, '1', 15571),
(125, 'Pro-activeness', 'personal', 0, 3, '1', 51851),
(126, 'Honoring the word', 'personal', 0, 3, '1', 51851),
(127, 'Team bonding', 'personal', 0, 3, '1', 51851),
(128, 'Team bonding', 'personal', 0, 3, '1', 51851),
(129, 'One Calcutta Town Hall every two weeks, at least.', 'personal', 0, 3, '1', 17554),
(130, 'A call with each of the six Wingmen, every week.', 'personal', 0, 3, '1', 17554),
(131, 'Increase level of involvement with kids.', 'personal', 0, 3, '1', 35222),
(132, 'Increase level of involvement with kids.', 'personal', 0, 3, '1', 35222),
(133, 'Manage time more efficiently', 'personal', 0, 3, '1', 72772),
(134, 'Implement stakeholder engagement', 'personal', 0, 3, '1', 72772),
(135, 'Research aftercare', 'personal', 0, 3, '1', 72772),
(136, 'Working more systematically ', 'personal', 0, 3, '1', 72771),
(137, 'Improvement of wingmen morale', 'personal', 0, 3, '1', 72771),
(138, 'Improve availability to fellows and strats', 'personal', 0, 3, '1', 72771),
(139, 'Increase innovation among fellows', 'personal', 0, 3, '1', 11752),
(140, 'Work on Propel After-care', 'personal', 0, 3, '1', 11752),
(141, 'Propel HR-peice', 'personal', 0, 3, '1', 11752),
(145, 'Honouring my word.', 'personal', 0, 3, '1', 36896),
(146, 'Ensuring proactive communication.', 'personal', 0, 3, '1', 36896),
(147, 'Having delicate conversations.', 'personal', 0, 3, '1', 36896),
(148, 'Have one on ones with all my fellows and ensure that they feel supported. ', 'personal', 0, 3, '1', 45482),
(149, 'To set small achievable goals', 'personal', 0, 3, '1', 3898),
(150, 'Identify at least 3 fellows who need help and work with them closer. ', 'personal', 0, 3, '1', 45482),
(151, 'Ok', 'personal', 0, 3, '1', 72714),
(152, 'Visit every center in Bangalore for hearing out the volunteers on improvements / suppport they would', 'personal', 0, 3, '1', 23466),
(153, 'Discuss with at least 10 Fundraising volunteers about the improvements / support they would like to ', 'personal', 0, 3, '1', 23466),
(154, 'Conduct center circles before mid December', 'personal', 0, 3, '1', 23466),
(155, 'Improve the level of involvement with Volunteers.', 'personal', 0, 3, '1', 46488),
(156, 'To work on maintaining my personal and professional levels.', 'personal', 0, 3, '1', 46488),
(157, 'Reduction in Attrition', 'personal', 0, 3, '1', 22191),
(158, 'Increase in the level of understanding if the children', 'personal', 0, 3, '1', 22191),
(159, 'Volunteers feel more supported', 'personal', 0, 3, '1', 35060),
(160, 'Volunteers come and discuss the problems so that we can solve the issues which they are facing', 'personal', 0, 3, '1', 35060),
(161, 'Onground Fellowship', 'personal', 0, 3, '1', 41333),
(162, 'Positive Fellowship Experience', 'personal', 0, 3, '1', 41333),
(163, 'Balancing MADness-following timelines to work on reliability', 'personal', 0, 3, '1', 41333),
(164, 'Hello world', 'personal', 0, 3, '1', 1661),
(165, 'Test', 'personal', 0, 3, '1', 1661),
(166, 'Stable classes', 'personal', 0, 3, '1', 21830),
(167, 'Improve relations with the caretakers at the center', 'personal', 0, 3, '1', 21830),
(168, 'Proper Evaluation system for students ', 'personal', 0, 3, '1', 21830),
(169, 'Establish a stable structure for GL to build on next year', 'personal', 0, 3, '1', 21830),
(170, 'Ensure maximum stakeholder satisfaction', 'personal', 0, 3, '1', 24427),
(171, 'Ensure proper documentation of all progress made to help in smooth transition', 'personal', 0, 3, '1', 24427),
(172, 'Minimum class cancellation', 'personal', 0, 4, '1', 22730),
(173, 'Being more organized', 'personal', 0, 4, '1', 22730),
(174, 'To keep in touch with parents and friends', 'personal', 0, 4, '1', 22730),
(175, 'Improve support provided at regional level by reaching out to CHs of different cities', 'personal', 0, 4, '1', 1661),
(176, 'Increase bandwidth support for National Tech Team', 'personal', 0, 4, '1', 1661),
(177, 'Work on improving communication with my strat', 'personal', 0, 4, '1', 39807),
(178, 'Intern Engagement Activities', 'personal', 0, 4, '1', 39065),
(179, 'To give 2-3 hours per week to every vertical.', 'personal', 0, 4, '1', 36185),
(180, 'To be more aware of volunteer morale and fellow-volunteer relationship.', 'personal', 0, 4, '1', 36185),
(181, 'To be more organised and stick to deadlines.', 'personal', 0, 4, '1', 36185),
(182, 'Inculcating reliability among mentors', 'personal', 0, 4, '1', 7402),
(183, 'Improve communication and frequency of exchange of ideas and information with South ESFs and Mentors', 'personal', 0, 4, '1', 7402),
(184, 'Level of Involvement', 'personal', 0, 4, '1', 16651),
(185, 'Ideation', 'personal', 0, 4, '1', 16651),
(186, 'To be more organised', 'personal', 0, 4, '1', 49190),
(187, 'Voice out concerns', 'personal', 0, 4, '1', 37970),
(188, 'Proactive communication', 'personal', 0, 4, '1', 19789),
(189, 'Be more result oriented', 'personal', 0, 4, '1', 35924),
(190, 'Active involvement in city requirements', 'personal', 0, 4, '1', 17470),
(191, 'Reduce panic Problem solve', 'personal', 0, 4, '1', 68798),
(192, 'Be more result oriented', 'personal', 0, 4, '1', 76436),
(193, 'More Discover involvement', 'personal', 0, 4, '1', 22332),
(194, 'Improve Center Relations.', 'personal', 0, 4, '1', 22332),
(195, 'Increase Reliability', 'personal', 1, 4, '1', 22332),
(196, ':Level of Involvement', 'personal', 0, 4, '1', 44529),
(197, 'To increase the active online presence  ', 'personal', 0, 4, '1', 44529),
(198, ' Improving CA relations  and benefitting Center Environment', 'personal', 0, 4, '1', 44529),
(199, 'career counselling and path sheet ', 'personal', 0, 4, '1', 51937),
(200, 'life skills', 'personal', 0, 4, '1', 51937),
(201, 'Brainstorming session on support required at every center', 'personal', 0, 4, '1', 23466),
(202, 'Brainstorming session with 10 Fundraisers', 'personal', 0, 4, '1', 23466),
(203, 'Ensure Center Circles are conducted before December', 'personal', 0, 4, '1', 23466),
(204, 'Succession Planning - Interns take the front seat to drive the activities ', 'personal', 0, 4, '1', 68122),
(205, 'All documents cleaned up and ready for next team\\''s use', 'personal', 0, 4, '1', 68122),
(206, 'DKS should have a proper foundation laid out.', 'personal', 0, 5, '1', 34066),
(207, '.I want to make sure that have the maximum credit as EdSupport Volunteer.', 'personal', 0, 5, '1', 34066),
(208, 'DKS Volunteers should bond better', 'personal', 0, 5, '1', 34066),
(209, 'Guide a child in a good manner ', 'personal', 0, 5, '1', 62523),
(210, 'hkjhkhikh', 'personal', 0, 5, '1', 39787),
(211, 'fyufgkhkhgg', 'personal', 0, 5, '1', 39787),
(212, 'Launch Fellowship Results Website (19/4/15)', 'personal', 1, 1, '1', 57184),
(213, 'Enable every fellow to be self sustaining with minimal support from national team, thus improving ci', 'personal', 0, 1, '1', 36765),
(214, 'To promotr MAD as much as psosible as to complete volunteer requirement. ', 'personal', 0, 1, '1', 48366);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `OKR_Archive`
--
ALTER TABLE `OKR_Archive`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `OKR_Grade`
--
ALTER TABLE `OKR_Grade`
  ADD PRIMARY KEY (`id`),
  ADD KEY `region_id` (`region_id`),
  ADD KEY `city_id` (`city_id`),
  ADD KEY `vertical_id` (`vertical_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `OKR_Key_Result`
--
ALTER TABLE `OKR_Key_Result`
  ADD PRIMARY KEY (`id`),
  ADD KEY `objective_id` (`objective_id`);

--
-- Indexes for table `OKR_Objective`
--
ALTER TABLE `OKR_Objective`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `OKR_Archive`
--
ALTER TABLE `OKR_Archive`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;
--
-- AUTO_INCREMENT for table `OKR_Grade`
--
ALTER TABLE `OKR_Grade`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `OKR_Key_Result`
--
ALTER TABLE `OKR_Key_Result`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=247;
--
-- AUTO_INCREMENT for table `OKR_Objective`
--
ALTER TABLE `OKR_Objective`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=215;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
