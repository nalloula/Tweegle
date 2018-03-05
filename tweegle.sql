-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  ven. 02 mars 2018 à 22:44
-- Version du serveur :  5.7.19
-- Version de PHP :  5.6.31

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `tweegle`
--

-- --------------------------------------------------------

--
-- Structure de la table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_group_id_b120cbf9` (`group_id`),
  KEY `auth_group_permissions_permission_id_84c5c92e` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  KEY `auth_permission_content_type_id_2f476e4b` (`content_type_id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can add permission', 2, 'add_permission'),
(5, 'Can change permission', 2, 'change_permission'),
(6, 'Can delete permission', 2, 'delete_permission'),
(7, 'Can add group', 3, 'add_group'),
(8, 'Can change group', 3, 'change_group'),
(9, 'Can delete group', 3, 'delete_group'),
(10, 'Can add user', 4, 'add_user'),
(11, 'Can change user', 4, 'change_user'),
(12, 'Can delete user', 4, 'delete_user'),
(13, 'Can add content type', 5, 'add_contenttype'),
(14, 'Can change content type', 5, 'change_contenttype'),
(15, 'Can delete content type', 5, 'delete_contenttype'),
(16, 'Can add session', 6, 'add_session'),
(17, 'Can change session', 6, 'change_session'),
(18, 'Can delete session', 6, 'delete_session'),
(19, 'Can add event', 7, 'add_event'),
(20, 'Can change event', 7, 'change_event'),
(21, 'Can delete event', 7, 'delete_event');

-- --------------------------------------------------------

--
-- Structure de la table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_user_id_6a12ed8b` (`user_id`),
  KEY `auth_user_groups_group_id_97559544` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_user_id_a95ead1b` (`user_id`),
  KEY `auth_user_user_permissions_permission_id_1fbb5f2c` (`permission_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(1, 'admin', 'logentry'),
(2, 'auth', 'permission'),
(3, 'auth', 'group'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session'),
(7, 'tweegle', 'event');

-- --------------------------------------------------------

--
-- Structure de la table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE IF NOT EXISTS `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2018-02-05 15:32:10.797926'),
(2, 'auth', '0001_initial', '2018-02-05 15:32:11.114433'),
(3, 'admin', '0001_initial', '2018-02-05 15:32:11.197587'),
(4, 'admin', '0002_logentry_remove_auto_add', '2018-02-05 15:32:11.214225'),
(5, 'contenttypes', '0002_remove_content_type_name', '2018-02-05 15:32:11.261100'),
(6, 'auth', '0002_alter_permission_name_max_length', '2018-02-05 15:32:11.276727'),
(7, 'auth', '0003_alter_user_email_max_length', '2018-02-05 15:32:11.298876'),
(8, 'auth', '0004_alter_user_username_opts', '2018-02-05 15:32:11.298876'),
(9, 'auth', '0005_alter_user_last_login_null', '2018-02-05 15:32:11.330134'),
(10, 'auth', '0006_require_contenttypes_0002', '2018-02-05 15:32:11.330134'),
(11, 'auth', '0007_alter_validators_add_error_messages', '2018-02-05 15:32:11.345798'),
(12, 'auth', '0008_alter_user_username_max_length', '2018-02-05 15:32:11.377609'),
(13, 'auth', '0009_alter_user_last_name_max_length', '2018-02-05 15:32:11.398387'),
(14, 'sessions', '0001_initial', '2018-02-05 15:32:11.429728'),
(15, 'tweegle', '0001_initial', '2018-02-05 15:32:11.445356'),
(16, 'tweegle', '0002_auto_20180204_0031', '2018-02-05 15:32:11.460983'),
(17, 'tweegle', '0003_auto_20180204_0032', '2018-02-05 15:32:11.476607'),
(18, 'tweegle', '0004_auto_20180204_0035', '2018-02-05 15:32:11.498065'),
(19, 'tweegle', '0005_auto_20180204_0224', '2018-02-05 15:32:11.498567'),
(20, 'tweegle', '0006_auto_20180301_1220', '2018-03-02 21:35:21.881573');

-- --------------------------------------------------------

--
-- Structure de la table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `tweegle_event`
--

DROP TABLE IF EXISTS `tweegle_event`;
CREATE TABLE IF NOT EXISTS `tweegle_event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `description` (`title`)
) ENGINE=MyISAM AUTO_INCREMENT=506 DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `tweegle_event`
--

INSERT INTO `tweegle_event` (`id`, `title`) VALUES
(1, 'Chinese author Mo Yan, famous for working in the style of writing known as hallucinatory realism, wins the Nobel Prize in Litera'),
(2, 'tweets are about Nobel peace Prize and about EU and wining the same prize???AAre the have to win?'),
(3, 'St. Louis Cardinals win their National League Divisional Series agains the Washington Nationals.'),
(4, 'LSU beats South Carolina 23-21 in a football game.'),
(5, 'Ray Lewis tore a tricep muscle out for possibly a year and maybe career.'),
(6, 'Reactions to the Denver Broncos big comeback win over the San Diego Chargers.'),
(7, 'Goal scoring during a Germany-Sweden soccer match where Germany went ahead 4-0, but Sweden battled back for a 4-4 tie.'),
(8, '\"During US presidential debate, President Barack Obama tells candidate Mitt Romney he is the last person to get tough on China.\"'),
(9, 'The event is Justin Timberlake\'s marriage to Jessica Biel.'),
(10, 'Former United States Senator and 1972 Democratic presidential nominee George McGovern dies '),
(11, 'Barack Obama And Mitt Romney Went Head-To-Head In The Final Presidential Debate romney said not government that makes businesses'),
(12, 'The event is the last game of the NLCS championship, where the Detroit Tigers lost to the San Francisco Giants.'),
(13, 'JPSI Motor Sport, Jaypee Sports Motor Sport, Indian Formula 1 Motor Sport'),
(14, 'In Major League Baseball, the San Francisco Giants defeat the Detroit Tigers in game four '),
(15, 'The tweets discuss the Pride of Britain awards.'),
(16, 'In the aftermath of Hurricane Sandy, the death toll rises to over 60 in the Mid-Atlantic states of the United States'),
(17, '2 Nov 2012 â€“ NEW YORK -- The National Hockey League today announced the cancellation of the 2013 Bridgestone NHL Winter Classi'),
(18, 'It is about TV show by Keshya cole and her Husband.'),
(19, ' is about an Award function. The nominees can be KENDRIK LAMAR'),
(20, ' earthquake strikes Hollis Center, Maine, roughly 20 miles west of Portland, Maine'),
(21, 'Jason Werth hitting a walkoff home run for the Nationals during the playoff game against the Cardinals.'),
(22, 'The Redbull Stratos jump was a space diving event.  Felix Baumgartner flew many miles into the air above the southwestern U.S. a'),
(23, 'New York Yankees losing a playoff baseball game in which Derek Jeter was injured.'),
(24, 'Beyonce is scheduled to perform at the Super Bowl XLVII Halftime Show.'),
(25, 'The event is a college football game between LSU and Texas A&M. Many tweets refer to the loss by A&M and the players who contrib'),
(26, ' UK\'s Lancashire Police apologises after an officer used a Taser on a blind man whose white cane was mistaken for a samurai swor'),
(27, 'Nike ended the promotonal agreemends they had with Lance Armstrong when he was accused of using performance enhancing drugs. '),
(28, 'A man arrest by the FBI for alleged terrorist plot involving the US Federal Reserve in New York'),
(29, 'Ohio State winning the game it followers were so pleased '),
(30, 'Patriots Beat Jets 29-26 In Overtime: New England Recovers Mark Sanchez Fumble To Win Game'),
(31, 'Soccer game between Tottenham Spurs and Chelsea.  Not sure which team is playing at home.'),
(32, 'Big Tex was a 52-foot (16 m) tall statue and marketing icon of the annual State Fair of Texas held at Fair Park in Dallas, Texas'),
(33, 'a ref got hit during a sporting event by fans.'),
(34, 'Cowboys beating the Redskins in football.'),
(35, 'Yash Chopra, one of India\'s most influential film-makers, dies from dengue fever in Mumbai. '),
(36, 'the tweets are about the world series games. World Series is the annual championship series of North American-based Major League'),
(37, 'Soccer player Georgios Samaras scores a goal for Barcelona, tying the match at 1-1.'),
(38, 'The iPad Mini (stylized and marketed as iPad mini) is a mini tablet computer designed, developed, and marketed by Apple Inc. It '),
(39, 'Thte tweets discuss the release of new Apple products.'),
(40, 'A soccer game between Manchester United and Liverpool. Someone scored but they were offsides.'),
(41, 'Emanuel Steward, International Boxing Hall of Fame inducted trainer,dies at the age of 68. '),
(42, 'The East Coast of the United States prepares for Hurricane Sandy, which has killed at least 67 people and caused widespread dama'),
(43, 'Hurricane Sandy makes landfall near Atlantic City, New Jersey, with widespread flooding and at least 29 deaths in the Northeaste'),
(44, 'Former Italian Prime Minister Silvio Berlusconi has been sentenced to four years in prison for tax fraud.'),
(45, 'Notre Dame and Alabama, two schools that are rumored to care a little bit about their football teams, will meet Jan. 7 in a BCS '),
(46, 'purchase of  Lucasfilm Ltd. from George Lucas by Walt Disney Company '),
(47, 'Marcus Lattimore was hurt playing football'),
(48, 'A 7.7 magnitude earthquake strikes off the coast of British Columbia near Haida Gwaii, triggering a tsunami warning in the North'),
(49, 'They are discussing the Cowboys vs Giants game.  Apparently the Cowboys almost came back to win, but lost in the closing seconds'),
(50, 'The tweets are about The Los Angeles Lakers are an American professional basketball team based in Los Angeles and The Dallas Mav'),
(51, 'Suicide Silence frontman Mitch Lucker commits suicide.'),
(52, 'People react to incoming election results, threatening to leave the country if their favored candidate does not win.'),
(53, 'In the fourth round of the 2012â€“13 Football League Cup, Arsenal and Reading participate in a twelve-goal thriller (7-5) at the'),
(54, 'Soccer match between Chelsea and Manchester United in which Chelsea wins'),
(55, 'Tweets discuss Tony Parker from the San Antonio Spurs shooting a buzzer beater shot over Russell Westbrook from the Oklahoma Cit'),
(56, 'The cancelation of the New York City Marathon by the mayor due to Hurricane Sandy'),
(57, 'a college football game involving alabama and probably auburn'),
(58, 'These tweets are talking about tne basketball team the Knicks.'),
(59, 'They discuss the fact that Notre Dame is going to play in the event of the national championship game.'),
(60, 'The United States Department of Labor says hiring picked up in October, with 171,000 jobs being added'),
(61, 'Arsenal vs Manchester United football (soccer) game, whether or not Robin van Persie would score'),
(62, 'Cowboys are a professional American football franchise that plays in the Eastern Division of the National Football Conference'),
(63, 'Euro sport. Liverpool vs Newcastle United match and the result.'),
(64, 'Chicago Bears absolutely destroying Tennessee Titans in an NFL game'),
(65, 'About Suarez who is a good player and has great control.'),
(66, 'People talking about the Ajax and Manchester City soccer game'),
(67, 'Voters in the states of Colorado and Washington approve the legalization of recreational use of marijuana in voter ballot initia'),
(68, '\"Scotland Yard launches a formal criminal investigation\"\" into Savile after 200 potential sexual abuse victims come forward.\"\"\"'),
(69, 'The death toll in the U.S. attributed to Hurricane Sandy rises to at least 90'),
(70, 'Authorities in Tripoli announce the capture of Muammar Gaddafi\'s former spokesman '),
(71, 'President of Mauritania Mohamed Ould Abdel Aziz, shot by troops yesterday, is flown to France. '),
(72, 'Hundreds of protesters in Libya storm the grounds of the country\'s parliament building in Bani Walid. '),
(73, '\"The UK doubles its number of RAF armed drones\"\" operating in Afghanistan\"\"\"'),
(74, 'A Syrian Air Force commander is assassinated by opposition forces in Damascus.'),
(75, 'Penn State scandal involving imprisoned former football coach Jerry Sandusky'),
(76, 'The family of disgraced disc jockey and television presenter Jimmy Savile makes its first public statement '),
(77, 'Yankees win a playoff with a walkoff over the Orioles.'),
(78, 'This is about a yankees/orioles game that went extra innings.'),
(79, 'discussion of that night\'s Homecoming Game, Saints vs. ? (do not see who other team is)'),
(80, 'Match between Manchester united and Sanmarino'),
(81, 'HP and  Lenovo battle for top spot in PC market of  Computerworld'),
(82, 'A Cleveland bus driver punched a female passenger in the face.'),
(83, 'Buster Posey grand slam leads SF Giants to historic Division Series'),
(84, 'Discussing the show Honey Boo Boo about the beauty pageant little girl.'),
(85, 'WAR AMERIA VS IRAN'),
(86, 'DALLAS (AP) â€” A Dallas woman who beat her 2-year-old daughter and glued the toddler\'s hands to a wall was sentenced Friday to '),
(87, 'UFC middleweight contender Vitor Belfort doesn\'t see the point in having divisional top dog Anderson Silva fight welterweight ch'),
(88, 'Microsoft Office 2013 reaches release to manufacturing status.'),
(89, 'Space Shuttle Endeavour makes a final trip to a Los Angeles museum.'),
(90, 'Release of Taylor Swift\'s album, Red.'),
(91, 'Tweets about football match in which player walcott is playing.'),
(92, 'Results of a soccer match being discussed'),
(93, 'Discussing an Eagle game. '),
(94, 'Everybody tweets about the sports event of MLB'),
(95, 'U.N. mulls military intervention in Mali'),
(96, 'A tornado is outside Walsh'),
(97, 'They discuss about the American football team Seahawks.'),
(98, 'All about Aaron Rodgers\' six touchdown performance.'),
(99, 'Spain versus France in a World Cup qualifying game'),
(100, 'Nobel Prize for economics awarded to two U.S. economists: Alvin E. Roth of Harvard University and Lloyd Shapley .'),
(101, 'The annoucement of Tina Fey and Amy Poehler hosting the 70th Golden Globes Awards.'),
(102, 'Reactions to Jub Jub being found guilty.'),
(103, 'Comments on the Philadelphia Eagles firing Defensive Coordinator Juan Castillo.'),
(104, 'The tweets are about the decline in EU car sales.'),
(105, 'Apple Computer is sending out invites to a media event on Oct. 23. They will probably announce the new iPad Mini at this event.'),
(106, 'Ryan Bertrand has had to pull out of the England Squad with a sore throat'),
(107, 'Polish not closing roof causing England game to be canceled'),
(108, 'The Detriot Tigers being one win away from going to the World Series during the playoff series against the New York Yankees.'),
(109, 'sports match is tweeted about.'),
(110, 'Manchester United 2-1  against Stoke City'),
(111, 'Newsweek is getting rid of the print edition and switching to an all digital format.'),
(112, 'Texas A & M University bomb threat'),
(113, 'Nadarkhani\'s attorney remains in prison in Iran.'),
(114, 'Stand Up To Cancer (SU2C) is a charitable program of the Entertainment Industry Foundation (EIF) established by media'),
(115, '20 Oct 2012 â€“ Stoke City\'s Ryan Shawcross doing just enough to force Wayne Rooney to face his own goal'),
(116, '\"The event discussed is an episode of the TV show Strictly Come Dancing\"\" in which contestant Bruce Forsyth dances to the song \"'),
(117, 'Cancellation of NHL regular-season 2012-2013 through November 1.'),
(118, 'Kelantan defeated ATM in the Malaysia Cup'),
(119, 'boxer special k brook wins fight'),
(120, 'About Arsenal losing to Norwich, mostly comment about Arsenal playing poorly.'),
(121, 'They duiscuss the football game between Shane long and West Brom'),
(122, 'Tweets about player Joe\'s performance in the game.'),
(123, 'Braxton Miller, Ohio State\'s starting quarterback, is taken to the hospital due to an injury in-game.'),
(124, 'Artical or statements concerning the USA and Iran agreement to have a one on one negotiation about nuclear programs.'),
(125, 'They were discussing about PPL'),
(126, 'Tweets about \'The Iron Man 3 trailer\''),
(127, '\"Obama\'s so called Apology Tour\"\"  2012 elections.\"\"\"'),
(128, 'Soccer game between Ajax and Manchester City'),
(129, 'Dortmund scores to take the lead, but Real Madrid quickly brings it to a tie.'),
(130, 'about champion league'),
(131, 'Hurricane Sandy in the Bahamas'),
(132, 'Duck Dynasty is a reality television series on A&E. It shows the lives of the Robertson family'),
(133, 'Donald Trump offered 5 million dollars if President Obama would provide some records. '),
(134, 'sports match is being discussed.'),
(135, 'CIA operators denied request for help during Benghazi attack'),
(136, 'Colin Powell endorses Barack Obama for President of the USA.'),
(137, 'Lil Wayne has suffered another seizure, making this his 2nd one within a 24 hour period'),
(138, 'Tweets about a match between florida vs georgia.'),
(139, '26 Oct 2012 â€“ Doug Fister takes hard liner off head and loss'),
(140, 'about foot ballmatch between Everton and Liverpool '),
(141, 'The Eagles and the Falcons football game.'),
(142, 'racing: Mark webber,  Fernando Alons, Lewis Hamilton'),
(143, 'Most of the Tweets talk about the Heat basketball game, but some talk about the Celtics basketball game.'),
(144, 'Tweets about Arsenal team\'s football match victory.'),
(145, 'They all discuss about Sandy Storm'),
(146, 'Suarez celebration during Liverpool game.'),
(147, 'In anticipation of the arrival of Hurricane Sandy, New York Governor Mario Cuomo announced the suspension of all MTA (mass trans'),
(148, 'Fight brewing in the EU over Greek austerity measures'),
(149, '\"Nittanyville was originally known as Paternoville,\"\" in honor of the head coach Joe Paterno.\"\"\"'),
(150, 'It is Halloween night and they are talking about passing out candy.'),
(151, 'Georgia football team defenseman Jarvis Jones makes a play, cleanly stripping the ball away from the other team.'),
(152, 'James Harden being moved from the Oklahoma City Thunder to the Husten Rockets.'),
(153, 'scoccer....free kick'),
(154, 'They discuss about Pitts burgh steelers uniform, professional football team'),
(155, 'The tweets discussa game betweens the Packers and the Bears.'),
(156, 'Tweets for Praying for people affected by the hurricane sandy'),
(157, 'They were discussing about Rondo'),
(158, 'Dez Bryant\'s catch being ruled out-of-bounds due to his hand touching the white line.  Also, fans wondering why he was in time-o'),
(159, 'The Celtics won a basketball game. '),
(160, 'Goal scoring between Liverpool and Swansea in soccer.'),
(161, 'The event is an NBA game between the Bucks and Celtics.  The Celtics had a bad game and lost to the Bucks.'),
(162, 'Twitter users\' sentiment towards the Country Music Awards.'),
(163, 'it refers to a sporting event '),
(164, 'Lebron and the Heat getting their NBA championship rings.'),
(165, 'Miami Heat: Ranking LeBron James become 5 Best Commercials'),
(166, 'Anticipation for the Lakers and Clippers basketball game.'),
(167, 'Taylor swift at the CMA awards'),
(168, 'Superstorm Sandy hits the east coast of the USA.'),
(169, 'Carrie Marie Underwood is an American country music singer she participate for The Country Music Association Awards, also known '),
(170, 'They are discussing about  country singer Blake Shelton and Mirinda Lambert'),
(171, 'Eric Church winning at the CMA awards.'),
(172, 'someone winning \'male vocalist of the year\' at some music awards show'),
(173, 'These tweets discuss Day Lights Saving time. Most of the tweets are complaining about it.'),
(174, 'People are excited about a bonfire night and waiting to watch the fireworks.'),
(175, 'This was about the presidential election, and reasoning for voting for Obama-Biden'),
(176, 'Tweets about a sports event.'),
(177, 'The TCU and West Virginia game.'),
(178, 'Kyrie Irving\'s great performance in game'),
(179, 'The event was on West Ham Vs Man City.'),
(180, 'Tweets about a penalty in a football match.'),
(181, 'Football match between USC and Oregon'),
(182, 'Atlanta Falcons missing  a field goal against Dallas.'),
(183, 'Mike Wallace scoring a touchdown during the Giants and Pittsburgh football game.'),
(184, 'Real Madrid vs Borussia Dortmund Champions League football 6 Nov 2012'),
(185, 'Yaya Toure and his fantastic goal.'),
(186, 'Opposition activists report at least 128 deaths around the country,'),
(187, 'Greek journalist Kostas Vaxevanis is arrested over the publication of a list of Greeks with Swiss bank accounts'),
(188, 'suicide is not our life'),
(189, 'Syrian military airstrikes kill at least 40 people, including civilians, in the rebel-held '),
(190, 'A fictional feature film, called South of Sanity, is shot in Antarctica for the first time. '),
(191, 'IN WHICH YEAR DUTCH ACTRESSDutch actress Sylvia Kristel  FRENCH FILM Emmanuelle was released ?'),
(192, 'Veteran Irish writer Gene Kerrigan wins the Golden Dagger. '),
(193, 'American weekly news magazine Newsweek announces it will cease print publication on December 31 and will move to an online-only '),
(194, 'Trading of Google stock on NASDAQ is temporarily suspended after it drops 9%'),
(195, 'Why did tens of thousands of workers participate in anti-austerity protests in Greece?'),
(196, 'when did the Boy Scouts of America release documents containing over 15,000 pages relating to allegations of sexual abuse by ove'),
(197, 'who is killed by A car bomb in Damascus?'),
(198, 'gunman opens fire in northeast Moscow, killing five and injuring two.'),
(199, 'how many people killed in  northern Guatemala earthquake ?'),
(200, 'Voters in the state of California effect in increase to fund public schools, community colleges and state universities.'),
(201, 'Celtic shock Barcelona in the 2012â€“13 UEFA Champions League group stage. '),
(202, 'British cyclist Bradley Wiggins is hospitalized following a collision with a vehicle. '),
(203, 'A car bomb explodes at Sassine Square in the Lebanese capital of Beirut, killing at least eight people and wounding up to 78 oth'),
(204, 'Former Lebanese Prime Minister Saad al-Hariri accuses Syrian president Assad in killing of top intelligence official '),
(205, 'The March 14th Alliance blames Syrian President Bashar al-Assad and the Syrian government for the attack. '),
(206, 'The Libyan Army launches a new full-scale assault against the town of Bani Walid, '),
(207, 'Faddy Abboud says an episode of the popular U.S. TV series Homeland misrepresented Beirut and is set to pursue legal action agai'),
(208, 'bus crash ,near Willow Beach, Arizona and the Nevada state line, southeast of Las Vegas. '),
(209, 'Taxicab driver Christopher Halliwell is sentenced to life imprisonment for murdering Sian O\'Callaghan.'),
(210, 'Remains of missing young oregon wohan whitney heichel larch mountain DNA test jonathan holt'),
(211, 'A woman is killed and 12 other people injured in a series of hit and run incidents in Cardiff, south Wales. A 31-year-old van dr'),
(212, '\"Theresa May  was working as an agent\"\" for a Metropolitan police counterterrorism officer \"\"\"'),
(213, 'hief Whip of the British Conservative Party Andrew Mitchell resigns over remarks he made to police officers in Downing Street, a'),
(214, 'how many civilians have died under artillery shelling attacks from militia forces.'),
(215, 'Israel targets rocket launching sites in Gaza in response to over 80 rockets being fired into Israeli territory by militants, ca'),
(216, 'which country  blames the explosion at a munition factory south of Khartoum on an Israeli airstrike.'),
(217, 'The UN peace envoy Lakhdar Brahimi states in Cairo that the Syrian government has agreed to a ceasefire during the four-day Musl'),
(218, 'A journalist based in Somaliland is killed by gunmen while returning home from work. '),
(219, 'The analogue television service in the Republic of Ireland is switched off at 10.00am. '),
(220, 'An administrative law judge with the U.S. International Trade Commission issues a preliminary decision on a long-running Samsung'),
(221, 'Germany\'s rejection of asylum applications by Roma from Kosovo'),
(222, 'who resigns as Chief Constable of West Yorkshire Police as his role in the aftermath of the 1989 Hillsborough disaster is being '),
(223, '74 women formerly employed by Birmingham City Council are given permission to seek compensation'),
(224, 'The UK\'s Director of Public Prosecutions is to review a 2009 decision by the Crown Prosecution Service not to prosecute Jimmy Sa'),
(225, 'JÃ©rÃ´me Kerviel loses his appeal against a five-year prison sentence '),
(226, 'A former maintenance worker at Creflo Dollar\'s World Changers Church International in the Atlanta suburb of College Park, Georgi'),
(227, 'arrest a 17-year-old resident who was allegedly involved in an attempted abduction in the killing of 10-year-old Jessica Ridgewa'),
(228, 'America\'s Gun Violence continue, 3 more dead in Los Angeles shooting by unidentify Gunman.'),
(229, 'British government giving Wales limited powers to borrow money to finance major projects'),
(230, 'Pope Benedict XVI announces a 24 November 2012 Consistory for the creation of six new Cardinals'),
(231, 'Dozens of young men are shot dead by the military in Maiduguri.'),
(232, 'i which year  Ayatollah Ruhollah Khomeini and Iran permits more sex-change operations than any country except Thailand'),
(233, 'Arts leaders voice deep concerns over lack of cultural subjects in Ebacc'),
(234, 'Canada and Australia launch women\'s literary prizes. '),
(235, 'William Faulkner sues over the use of the writer\'s quote'),
(236, 'Albanian former political prisoner  set himself on fire in protest at delays in government compensation'),
(237, 'Former British Labour Party minister Denis MacShane resigns his House of Commons seat after he wrongfully claimed at least Â£7,5'),
(238, 'What is the benefit of Syrian rebels claiming control of strategic town at the cost of human blood shed & property loss ?'),
(239, 'A Syrian passenger plane is forced by Turkish fighter jets to land in Ankara due to the allegations of carrying weapons.'),
(240, 'BAE and EADS announce their merger talks are cancelled over political disagreements. '),
(241, 'A court in Moscow, Russia, frees one of the three Pussy Riot members at an appeal hearing.'),
(242, 'General Joseph Dunford nominated to be the new ISAF Commander (COMISAF). #afghanistan'),
(243, 'Two American scientists, Robert Lefkowitz and Brian Kobilka, win the 2012 Nobel Prize'),
(244, 'an unexpected spiral structure around carbon star R Sculptoris discovered by ESO astronomers'),
(245, 'Pope Benedict XVI adds Arabic to weekly Vatican address in front of pilgrims. '),
(246, 'The USADA details witness-based doping claims against Lance Armstrong in its long-due report to the UCI. George Hincapie admits '),
(247, 'how many soldiers in attacks on military checkpoints near the town of Saraqeb in northern Idlib province'),
(248, 'Internet analytics company ComScore says Google\'s Gmail has edged out Microsoft\'s Hotmail as the world\'s top e-mail service. '),
(249, 'A fuel tank truck crashes and explodes in the Saudi Arabian capital Riyadh '),
(250, 'yellow fever effect in sudan'),
(251, 'who receives a medal of Knighthood of the Order of the Bath from Queen Elizabeth II?'),
(252, 'Parents kill their 15-year-old daughter  Azad Kashmir, Pakistan pouring acid'),
(253, 'Nine female political prisoners begin a hunger strike to protest their conditions in Tehran\'s Evin prison. '),
(254, 'Charges of perjury and child endangerment, among others, are filed against former Penn State President Graham Spanier'),
(255, 'A prison officer is killed in an ambush by dissident Irish republicans as he drive'),
(256, 'New York Mayor Michael Bloomberg endorses U.S. President Barack Obama over Mitt Romney.'),
(257, 'Astronomers detect what appears to be light from the first stars in the universe '),
(258, 'Is there any person or peace keeping force not available in Burma to stop secterian clashes protecting for the loss of human lif'),
(259, 'Fighting in Syria continues as the ceasefire agreement mediated by U.N. special envoy Lakhdar Brahimi to occur during the Muslim'),
(260, 'A car bomb explodes in the capital Damascus, killing an unknown number of people and injuring many. '),
(261, 'A suicide bombing at a mosque in Maymana, Afghanistan, kills at least 41 peoples'),
(262, 'who reject Writer Javier MarÃ­as rejects the Spanish government\'s National Novel Prize, awarded'),
(263, 'which country block  the website of the New York Times and searches on social media?'),
(264, 'Russia charges dissenter Sergei Udaltsov in crackdown'),
(265, 'Chinese politician Bo Xilai is stripped of his membership of the National People\'s Congress. '),
(266, 'why was meet UN and Arab League special envoy Lakhdar Brahimi meets with Syrian Foreign Minister Walid Muallem in Damascus '),
(267, 'The United Nations Security Council announces plans to impose sanctions on the leaders of Democratic Republic of the Congo\'s M23'),
(268, 'Suspected members of Boko Haram attack the northern Nigerian city of Potiskum'),
(269, 'how many people dead in Overnight clashes in southeastern Turkey'),
(270, 'Worst flood in 40 years, force to evacuated hundreds of pilgrims from one of the respected Roman Catholic\'s Shrine site at Lourd'),
(271, 'schooner attempting to breach the Israeli blockade of Gaza claiming to deliver humanitarian aid'),
(272, 'Noam Chomsky visits Gaza  attends a seminar alongside Gazan thinkers and intellectuals. '),
(273, 'Tens of thousands of protesters march through London, Glasgow and Belfast in a series of demonstrations against UK government au'),
(274, 'multiple rockets being fired across the border, Israel launched four air strikes. Two militants from a Salafist jihadist group a'),
(275, 'Peace one step move back Taliban\'s suicide bomber target peace supported millitant group office at Darra Adam Khel in FATA area '),
(276, 'Mexican army kills manuel felix leader sinaloa cartel'),
(277, 'skirmish in the North Caucasus republic of Dagestan. '),
(278, 'An oil painting by the German artist Gerhard Richter has sold for Â£21m ($34m) - an auction record for a work by a living artist'),
(279, 'U.S. Federal Trade Commission is close to bringing an antitrust lawsuit against Google.'),
(280, 'Endeavour began its journey from Los Angeles international airport on Friday and finally arrived at the California Science Cente'),
(281, 'Syria announces Turkish civilian flights over Syrian territory are banned.'),
(282, 'The UK\'s Department of Health is to investigate the decision to appoint the broadcaster Sir James Savile as head of a taskforce '),
(283, 'why the Africa Cup of Nations qualification match between Senegal and Ivory Coast is abandoned'),
(284, 'Ireland soccer manager Giovanni Trapattoni refuses to resign following last night\'s humiliation at the hands of Germany in 2014 '),
(285, 'Sligo Rovers claim their first league title in nearly forty years'),
(286, ' Israeli air force strikes a rocket launching squad in the northern Gaza Strip'),
(287, 'Jordanian soldier dies during a gunfight between Jordanian troops and Islamic militants '),
(288, 'The Lebanese Army launches an operation to quell the sectarian violence in Beirut triggered by the assassination of Wissam al-Ha'),
(289, 'south africa shooting miners'),
(290, 'account wiped and all her paid-for books deleted by Amazon.com.'),
(291, 'A former Goldman Sachs employee blows the whistle on the investment bank having routinely taken advantage of charities and pensi'),
(292, 'The chairman of the U.S. central bank not for re-election?'),
(293, 'Six Italian scientists and an ex-government official are convicted of multiple manslaughter'),
(294, 'Maria Alyokhina and Nadezhda Tolokonnikova are exiled to remote prison camps located in Perm and Mordovia'),
(295, 'the BBC Newsnight editor responsible for dropping an investigation into allegations of sexual abuse against Jimmy Savile'),
(296, 'missing 12-year-old girl Autumn Pasquale  found late Monday in a recycling container in Clayton,'),
(297, 'Okinawa legislators protest alleged US rape '),
(298, 'Lance Armstrong is banned for life from participating in UCI-sanctioned events.'),
(299, 'A football fan is jailed after a attack on former England international goalkeeper Chris Kirkland '),
(300, 'Syrian opposition groups hold a meeting in Doha, Qatar, to discuss reforming the structure of the group'),
(301, 'Rebels capture a strategic oilfield in eastern Deir ez-Zor Governorate. '),
(302, 'One more innocent child killed in bomb blast in turkey, belived to target Turkey army vehicle by Kurdish Terrorist group.'),
(303, 'A policeman is killed and 11 others are injured in a grenade attack on a church in the Kenyan town of Garissa near the border wi'),
(304, 'Iran\'s Revolutionary Guard Corps establish and inaugurate a new naval base on the Strait of Hormuz'),
(305, 'Danny Boyle and Nicholas Serota write a letter criticising the decision by a Tower Hamlets London '),
(306, 'Somalia\'s first female Foreign Minister, Fowsiyo Yussuf Haji Aadan. '),
(307, 'Bishop Tawadros is selected as the new 118th pope '),
(308, 'Finnish racing driver Kimi RÃ¤ikkÃ¶nen wins Formula One\'s 2012 Abu Dhabi Grand Prix'),
(309, 'In women\'s tennis, the Czech Republic defeats Serbia 3-1 to win the 2012 Fed Cup.'),
(310, ' People\'s Liberation Army Navy warships are spotted'),
(311, 'a hand grenade explosion at the King Abdulaziz military academy in Riyadh kills one cadet '),
(312, 'Several structures were set ablaze and as many as 24 militants were killed after suspected bombing Boko Haram attacks rocked the'),
(313, 'Shootout between Yemen\'s army and Al-Qaeda militants killed four in ongoing fight to clear the Al-queda infested southern Yemen '),
(314, 'United Nations expert panel reports that although the two governments deny it, Rwanda and Uganda continue to support the March 2'),
(315, 'Hilary Mantel wins the 2012 Man Booker Prize for her novel Bring Up the Bodies'),
(316, 'Foxconn, Apple\'s main supplier in China, admits it employs interns as young as 14 years old. '),
(317, 'The CEO of Citigroup, Vikram Pandit, announces his resignation from that post, and is immediately succeeded by Michael Corbat'),
(318, 'ford recalls fiestas due to airbag issue'),
(319, 'A report on St. Patrick\'s Institution in Dublin finds a culture of human rights abuse. '),
(320, 'BBC two seperate inquiries sexual abbuse jimmy savile high court judge dame janet'),
(321, 'United Kingdom announces its intention to close its consulate in Basra'),
(322, 'The British computer hacker Gary McKinnon wins his ten-year legal battle to avoid extradition to the United States '),
(323, 'The captain of the Prestige oil tanker goes on trial in Spain. '),
(324, 'The Brazilian jurisprudence system upholds the convictions of two United States pilots for their roles in the 2006 Gol Transport'),
(325, '. The European Commissioner for Health and Consumer Policy, John Dalli of Malta, resigns amid corruption charges that he denies.'),
(326, 'The Israeli Knesset has been unanimously dissolved. '),
(327, '\"Pope Benedict XVI will send a delegation to Damascus to express his brotherly solidarity with the entire population\"\". \"\"\"'),
(328, 'Senegal are disqualified from the 2013 Africa Cup of Nations after last Saturday\'s stadium riot in the game with Ivory Coast. '),
(329, 'A major assault by rebel forces in Syria takes place against the Taftanaz airbase. '),
(330, 'Two suicide bombers attack a restaurant in the Somali capital.'),
(331, 'The city of Turin, Italy, is chosen as 2015 European Capital of Sport'),
(332, ' brother of the Syrian parliament speaker is shot and killed by gunmen '),
(333, 'British PM broaches \'safe passage\' for al-Assad'),
(334, 'Charcoal shipments continue in the Somali port of Kismayo '),
(335, 'AFP reports on Israel\'s plans to counter a Palestinian bid for enhanced United Nations status later this month. '),
(336, 'Prime Minister of Spain Mariano Rajoy criticises Catalonia\'s drive for independence on radio,'),
(337, 'African land locked national Malawi suspend his anti homosexual and gay law to improve national image of Malawi towards the deve'),
(338, ' five people are reported shot at a workplace (Apple Valley Farms, a poultry and meat processing plant with about 50 employees) '),
(339, 'In the United States Congress, the Senate is projected to maintain a Democratic majority '),
(340, 'Voters in Palau go to the polls with incumbent President Johnson Toribiong and former President Tommy Remengesau both competing '),
(341, 'Russian President Vladimir Putin sacks the defence minister Anatoly Serdyukov amid a corruption scandal. '),
(342, 'Nadine Dorries is suspended from the party after her decision to become the first serving politician to appear on a reality tele'),
(343, 'Bulgarian Orthodox Church dies at age 98'),
(344, 'Green Moon, trained by Robert Hickmott and ridden by Brett Prebble, wins the 2012 Emirates Melbourne Cup '),
(345, 'One UNAMID peacekeeper is killed and three are wounded during an ambush in Hashaba, Sudan. '),
(346, 'Turkish artillery retaliates after a Syrian bomb landed on Turkish territory in Hatay Province. '),
(347, 'Two U.S. sailors are arrested over an alleged rape of a Japanese woman on Okinawa. '),
(348, 'UK\'s Department of Health appoints former barrister Kate Lampard to head an NHS inquiry '),
(349, 'THE DEAD BODY OF THE KING NORODOM FROM WHERE WAS BROUGHT TO CAMBODIA ?'),
(350, 'Benigno Fitial is defeated in the Northern Mariana Islands House of Representatives with 9 votes'),
(351, 'Alpha Centauri Bb, an exoplanet, is discovered orbiting around Alpha Centauri,'),
(352, 'Anheuser-Busch states it will allow Armstrong\'s contract with them to expire at the end of the year'),
(353, 'complaint with UEFA over allegations that midfielder Danny Rose was subjected to racial abuse '),
(354, 'Armenian plane destined for the Syrian city of Aleppo is searched by Turkish authorities '),
(355, 'UK for further treatment after being shot in the head by a Taliban gunman.'),
(356, '5 aid workers abducted in south-eastern #Niger '),
(357, 'The Philippine governmen  & he Moro Islamic Liberation Front, sign a peace pact.  Related Article: http://www.aljazeera.com/vide'),
(358, 'Sir John Kiszely resigns as president of the Royal British Legion '),
(359, 'The Portuguese government announces details of its draft budget for 2013, as protests continue against austerity. '),
(360, 'Seven peoples injured in a bus carrying 56 college students crashes'),
(361, 'Burma agianst liaison office of Islamic Cooperation Group'),
(362, 'No winner is announced for the Mo Ibrahim Prize for Achievement in African Leadership. '),
(363, 'Former King of Cambodia Norodom Sihanouk dies in Beijing at the age of 89. '),
(364, 'British Prime Minister David Cameron and Scottish First Minister Alex Salmond agree a deal '),
(365, 'Ontario premier Dalton McGuinty announces his resignation. '),
(366, 'Virgin Trains is asked to continue running the rail franchise for UK\'s West Coast Main Line.'),
(367, 'Fears Arabs uprising, Bahrain bans all types of protests gatherings, as per order of interior ministry of Bahrain.'),
(368, 'Police deal tough with Anglo American platinum mine workers, during their month long strike at outside of Johansburg, South Afri'),
(369, 'Fernando Vidal is set on fire live on radio. '),
(370, 'where did Somali poet, playwright and songwriter Warsame Shire Awale is killed?'),
(371, 'Dutch writer J Bernlef'),
(372, 'Qatar urged to free poet Mohammed Ibn al-Dheeb al-Ajami'),
(373, '\" Alan Bennett reveals it emerged as a result of disquiet at the National Trust and laments a nation turned into a captive marke'),
(374, 'Tamasin and Daniel Day-Lewis donate poet laureate Cecil Day-Lewis\'s archive - including manuscripts and a letter from W. H. Aude'),
(375, 'Stone Roses announce a series of performances in 2013'),
(376, 'Rwandaâ€™s high court sentences opposition leader, Victoire Ingabire, to eight years in prison'),
(377, '\"Organisers of a proposed free public event on Homo floresiensis are forced to change the event\'s title after use of the word ho'),
(378, 'allegedly fatally stabbing her 7-year-old son, Justin, Tuesday night 100 times, and then killing a 5-year-old girl, Olivia Dwora'),
(379, 'Afghanistan hosts its first professional men\'s boxing match - Hamid Rahimi versus Said Mbelwa - in Kabul. '),
(380, 'A suicide bomb attack takes place on an intelligence agency building in Damascus, reportedly killing dozens of people'),
(381, ' Islamist insurgents kill 11 southern Thailand'),
(382, 'Heriberto Lazcano Lazcano, the top leader of the criminal organization Los Zetas, was killed'),
(383, 'Malala Yousafzai, a 14 year old activist for women\'s education rights is shot by Taliban gunmen in the Swat Valley. '),
(384, 'An estimated 25,000 protest in Athens as German Chancellor Angela Merkel visits Greece. '),
(385, 'Three North Korean soldiers have defected to South Korea through the militarised border since August. '),
(386, 'Serge Haroche and David Wineland win the 2012 Nobel Prize in Physics'),
(387, 'protesters attempt to breach government offices of prime minister Mikati '),
(388, 'Six killed in Guinea Bissau firefight'),
(389, 'Car bombs explode in predominately Christian neighborhoods in Damascus and Aleppo.'),
(390, 'Pope Benedict XVI names seven new saints, including Kateri Tekakwitha etc.'),
(391, 'A shooting at a spa in Brookfield, Wisconsin, USA, leaves four people dead, including the shooter.'),
(392, 'Sharmeka moffit burning set fire herself relatives hate crime'),
(393, 'Fidel casto appears in public photo cuban revolutionary leader show him doing very well'),
(394, 'They are discussing a televised award show for the BET network.'),
(395, 'At least one person is killed and two others are wounded in an Israeli artillery attack in the northern Gaza Strip. '),
(396, 'Continuation of violance against Iraqi\'s Shia community Car bomb exploded in shia dominant city of Shula, nine dead and many wou'),
(397, 'A young Pakistani man, whose father was killed by drones alongside 40 others in March 2011, seeks to block the sharing of Britis'),
(398, 'Skyfall, the 23rd James Bond film, receives its Royal premiere at London\'s Royal Albert Hall. '),
(399, 'Which prominent Bengal poet and novelist died from a heart attack in the West Bengal capital Kolkata?'),
(401, 'European Parliament to accept a 40 per cent quota for women on corporate boards. '),
(402, 'A fire at a hospital in the southern Taiwanese city of Tainan kills at least 12 people and injures up to 60 others.'),
(403, '\"A very loud explosion\"\" and a \"\"huge fire\"\" at a military factory in Khartoum are being treated as suspicious. \"\"\"'),
(404, 'Following yesterday\'s conviction of scientists Luciano Maiani resigns in protest at the harsh treatment of his colleagues. '),
(405, 'A surfer is killed in southern California following an attack by a great white shark. '),
(406, 'The analogue TV signal in Northern Ireland is turned off permanently at 23:30 BST, completing the final stage of the UK digital '),
(407, 'Sheikh Hamad bin Khalifa Al Thani - first Arab head of state to visit Gaza since Hamas came into power'),
(408, 'BBC Boss Aanswers Questions About Jimmy Savile Sexual Abuse Scandal in British Parliament '),
(409, 'Four civil cases are filed against Trinity Mirror, publishers of the UK newspaper the Daily Mirror, over allegations of phone ha'),
(410, 'Four third-party U.S. presidential election candidates - representing the Libertarian, Green, Constitution, and Justice parties,'),
(411, 'Japanese Justice Minister Keishu Tanaka, who took office on October 1, resigns amid a scandal'),
(412, 'Two MSPs John Finnie and Jean Urquhart  resigned from the Scottish National Party '),
(413, 'A series of attacks across Iraq kill 46 and injured 123 others. '),
(414, 'rubber-coated steel bullets-Olympia Stadium in Rustenburg, South Africa.'),
(415, 'Thousands of people join protests against budget cuts in Madrid and ask that the government quit'),
(416, 'No ending of self immolation in Tibet region-one more Tibetan set himself on fire to protest against the Chinese rule in Tibet.'),
(417, 'Ireland defeat Scotland to claim the International Series. '),
(418, 'Karl Lacey of Donegal is named the GAA All Stars Footballer of the Year, alongside which he picks up his fourth All Star.'),
(419, 'A gunman kills Qassem M. Aqlan, the Yemeni chief of security employed at the U.S. embassy in the capital, Sana\'a. '),
(420, '83 civilians were killed throughout Syria by the Syrian army. '),
(421, 'ezbollah leader Hassan Nasrallah confirms that the drone aircraft shot down over Israel\'s Negev Desert on 6 October belonged to '),
(422, 'Oil giant Shell is sued by Niger Delta farmers in a civil court in The Hague.'),
(423, 'Heavy rain in the United Kingdom causes flash flooding in the coastal village of Clovelly'),
(424, 'The Marie Stopes organisation is to open the first private clinic to offer abortions to women in Northern Ireland from 18 Octobe'),
(425, '\"Seven prisoners from Amasya Prison  indefinite and irreversible\"\" hunger strikes\"\"\"'),
(426, 'Russian-made ammunition and military communications equipment in a Syrian passenger plane heading to Damascus from Moscow.'),
(427, 'A U.S. appeals court has overturned a district court order that had banned the sale of Samsung\'s Galaxy Nexus in the US, deliver'),
(428, 'Englishman Barry Thew is sentenced to four months in jail after a t-shirt he wore '),
(429, 'Egypt\'s President Mohammed Mursi fires general prosecutor Abdel Maguid Mahmoud. '),
(430, '\"Syrian President Bashar al-Assad-live and die\"\"\"\"\"'),
(431, 'Leaders of the rebel Free Syrian Army and Kurdish representatives begin negotiations'),
(432, 'NY stock exchange open after 2 day hurricane sandy trading at lower'),
(433, 'Barclays plc says that it is the subject of two new regulatory probes after a series of scandals'),
(434, 'Five thousand people are evacuated from low-lying areas off the coast of Tamil Nadu state in India '),
(435, 'An electrical fire at a Saudi wedding kills 25 people in a courtyard of a home in the village of Al Badr in the Abqaiq region.'),
(436, 'In how many times Former Penn State assistant coach Jerry Sandusky was found guilty in his child sex abuse trial ? '),
(437, 'Two Iranian warships leave Port Sudan on the Red Sea, after a four-day stay. '),
(438, 'UK government is defeated in the House of Commons over its negotiating position on the EU budget,'),
(439, 'The government of Bahrain defends its decision to impose a ban on all public protests and demonstrations.'),
(440, 'The Syrian government announces via its state media that it will suspend military operations from Friday to Monday, during this '),
(441, 'How much GDP growth did the 2012 Summer Olympics help the UK economy? '),
(442, 'Costa Coffee - the world\'s second-largest coffeehouse chain'),
(443, 'Hurricane Sandy heads towards The Bahamas after making landfall in Cuba and Jamaica. '),
(444, 'A rape claim against a major Irish celebrity is investigated. The victim was made pregnant during her ordeal. '),
(445, 'jury fails to reach a verdict in the retrial of a policeman '),
(446, 'Scotland Yard says that the number of potential victims in the Jimmy Savile sexual abuse scandal has risen to 300'),
(447, '6-year employee Gilberto Valle III along with an unnamed co-conspirator, is charged with allegedly conspiring to cross state lin'),
(448, 'U.S. presidential candidate Mitt Romney\'s campaign is linked to Hart InterCivic a firm providing the voting machines to be used '),
(449, 'order to clear paris neighborhood of homeless by france interior minister'),
(450, 'Prime Minister Bidzina Ivanishvili and his cabinet are approved by the Parliament of Georgia'),
(451, 'Israeli Prime Minister and Likud chairman Benjamin Netanyahu and the Israeli Foreign Minister and Yisrael Beiteinu chairman Avig'),
(452, 'Society of Saint Pius X (SSPX) by its superior, Bishop Bernard Fellay'),
(453, 'Two deadly car bombings rock Damascus.'),
(454, 'Anti-government protests are banned and legal action is threatened against those backing the protests. '),
(455, 'Police attack demonstrators tear gas water cannons ankara anniversary foundation republic of turkey'),
(456, 'Penguin and Random House agree to merge to form Penguin Random House, the world\'s largest publisher. '),
(457, 'Human Rights Watch and other rights groups issue a report rejecting the Israeli governmentâ€™s arguments against accepting Afric'),
(458, 'Activists descend on the city of Paju to float 50,000 propaganda leaflets.'),
(459, 'Damian Rzeszowski is sentenced to 30 years in prison for killing six people.'),
(460, 'The U.S. Supreme Court declines to take on the review of an abortion-related appeal.'),
(461, '\"child sex offenders in Simi Valley will not have to post a sign outside their home this Halloween reading in part no candy,\"\" \"'),
(462, 'Fernando Haddad is elected mayor of SÃ£o Paulo,'),
(463, 'successors to the Coptic Pope is drawn up a blindfolded child is then expected to pick from a list of three. '),
(464, 'Gunmen open fire at a mosque in the village of Dogo Dawa in the Nigerian state of Kaduna, killing at least 20 people. '),
(465, 'Occupy activists chain themselves to the pulpit of St Paul\'s Cathedral in an action of solidarity with Pussy Riot.'),
(466, 'collection of manuscripts by Franz Kafka and Max Brod must be handed over to the National Library'),
(467, 'UK\'s Ministry of Defence says that five Royal Marines have been charged with murder '),
(468, 'The search for a missing 19-year-old from the University of New Hampshire '),
(469, 'The UK\'s Ministry of Defence will hold an investigation after journalists from The Sunday Times posed as lobbyists for a defence'),
(470, 'Former United States Senator Arlen Specter, who was vital in several United States Supreme Court nominations, dies at the age of'),
(471, 'WHO WAS THE PERSON TO FALL FROM 102,800 FEET AS PART OF THE US AIRFORCE MISSION  BREAKING THE RECORD IN 1960 ?'),
(472, 'Rebels capture an air base east of Aleppo. '),
(473, 'Police fire tear gas and stun grenades at anti-government protesters in the capital Manama. '),
(474, 'Supporters and opponents of president Mohamed Morsi clash in Tahrir Square.'),
(475, 'United Nations Security Council unanimously passes a resolution approving an African-led force'),
(476, 'Standard & Poor\'s downgrades South Africa\'s long-term foreign currency sovereign credit rating '),
(477, 'The British government is dragged into the nationwide scandal,Jimmy Savile'),
(478, 'UK Largest investigation police wrongdoing damning report 1989 hillsborough disaster'),
(479, 'The high court of Botswana overturns a customary law.'),
(480, '2014 FIFA World Cup qualification   Calls increase for the removal of manager Giovanni Trapattoni. '),
(481, 'The tweets discuss a sports event.'),
(482, 'Al Qaeda\'s leader Ayman al-Zawahiri pledges support for the rebels in a new video uploaded to a jihadist website'),
(483, 'Car bombings in and around Baghdad kill 15 and injure 33 others. '),
(484, 'Ten people are killed and over 100 injured in reprisal attacks close to a Catholic church in Kaduna, Northern Nigeria'),
(485, 'United Nations involved in Buddhist and Muslim hostilities'),
(486, 'The SpaceX Dragon capsule on a re-supply mission to the International Space Station returns to Earth. '),
(487, 'Tweets about 2 chainz musical performance.'),
(488, 'Former pop star Gary Glitter is arrested on suspicion of sex offences '),
(489, 'The Euromillions lottery website is hacked its homepage is replaced by a Quran passage which condemns gambling. '),
(490, 'Chelsea lose their unbeaten league record against Manchester United as Manchester United wins 3-2 at Stamford Bridge.'),
(491, 'Heavy fighting is reported in the Palestinian neighborhoods of southern Damascus '),
(492, 'A suicide car bomber detonates a bomb in the Hama province of Syria killing 50 Syrian military personnel'),
(493, 'Five bombs go off in the neighborhoods of Gudaibiya and Adliya in Manama, Bahrain, killing two foreign workers and injuring anot'),
(494, 'floods in nigeria, number of people affected '),
(495, 'he biennial naval training exercise Keen Sword between the United States Navy and the Japan Maritime Self-Defense Force commence'),
(496, 'Asian and European leaders meet at the Ninth Asiaâ€“Europe Meeting in Vientiane.'),
(497, 'British Prime Minister David Cameron orders a fresh investigation into allegations of sexual abuse involving a senior Conservati'),
(498, 'Judge in Australia rules that Standard & Poor\'s misled investors in its rating of two pre-crisis issues of structured debt'),
(499, 'housands of people protest against alleged fraud in the recent parliamentary elections in Ukraine.'),
(500, 'The topic is about a rally known as Pep iRallyin the town'),
(501, 'They all like to watch Meek Millz show'),
(502, 'They all discuss about fat joe'),
(503, 'Detroit and Oakland played a postseason game. The winner was surprising.'),
(504, 'Some guy named omarion dancing on stage'),
(505, 'Talking about the world series');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
