/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 8.0.23 : Database - web_homework
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`web_homework` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `web_homework`;

/*Table structure for table `admin` */

DROP TABLE IF EXISTS `admin`;

CREATE TABLE `admin` (
  `admin_id` bigint NOT NULL AUTO_INCREMENT,
  `nickname` varchar(15) NOT NULL DEFAULT '',
  `password` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `admin` */

insert  into `admin`(`admin_id`,`nickname`,`password`) values (1,'管理员1','333');

/*Table structure for table `answer` */

DROP TABLE IF EXISTS `answer`;

CREATE TABLE `answer` (
  `answer_id` bigint NOT NULL AUTO_INCREMENT,
  `content` text NOT NULL,
  `createtime` datetime(3) DEFAULT CURRENT_TIMESTAMP(3),
  `q_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `is_used` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`answer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

/*Data for the table `answer` */

insert  into `answer`(`answer_id`,`content`,`createtime`,`q_id`,`user_id`,`is_used`) values (1,'测试1的回答1','2022-06-29 21:13:43.153',25,46,0),(14,'222','2022-06-29 23:03:47.976',25,46,0),(15,'测试回答花泽类同学的问题','2022-06-29 23:06:24.257',27,40,0),(18,'<p>planet 尝试回答花泽类同学的问题\n<img src=\"http://127.0.0.1:5000/upload/questionImage/304de01d330781a52259586eff397a03.png\" alt=\"img\" /></p>\n<table>\n<thead>\n<tr>\n<th>表头</th>\n<th>表头</th>\n</tr>\n</thead>\n<tbody>\n<tr>\n<td>单元格</td>\n<td>单元格</td>\n</tr>\n<tr>\n<td>单元格</td>\n<td>单元格</td>\n</tr>\n</tbody>\n</table>','2022-07-02 18:03:05.308',27,45,0);

/*Table structure for table `blog` */

DROP TABLE IF EXISTS `blog`;

CREATE TABLE `blog` (
  `blog_id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(30) DEFAULT NULL,
  `intro` varchar(50) DEFAULT NULL,
  `img_path` varchar(40) DEFAULT NULL,
  `createtime` datetime(3) DEFAULT CURRENT_TIMESTAMP(3),
  `content` text,
  PRIMARY KEY (`blog_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `blog` */

insert  into `blog`(`blog_id`,`title`,`intro`,`img_path`,`createtime`,`content`) values (1,'mysql面试题','mysql面试题总结','mysql.jpg','2021-12-25 11:43:13.481','###为什么要使用数据库\r\n\r\n数据保存在内存\r\n\r\n优点： 存取速度快\r\n\r\n缺点： 数据不能永久保存\r\n\r\n###数据保存在文件\r\n\r\n优点： 数据永久保存\r\n\r\n缺点：1）速度比内存操作慢，频繁的IO操作。2）查询数据不方便\r\n\r\n###数据保存在数据库\r\n\r\n1）数据永久保存\r\n\r\n2）使用SQL语句，查询方便效率高。\r\n\r\n3）管理数据方便\r\n###什么是SQL？\r\n\r\n结构化查询语言(Structured Query Language)简称SQL，是一种数据库查询语言。\r\n\r\n作用：用于存取数据、查询、更新和管理关系数据库系统。\r\n什么是MySQL?\r\n\r\nMySQL是一个关系型数据库管理系统，由瑞典MySQL AB 公司开发，属于 Oracle 旗下产品。MySQL 是最流行的关系型数据库管理系统之一，在 WEB 应用方面，MySQL是最好的 RDBMS (Relational Database Management System，关系数据库管理系统) 应用软件之一。在Java企业级开发中非常常用，因为 MySQL 是开源免费的，并且方便扩展。\r\n###数据库三大范式是什么\r\n\r\n第一范式：每个列都不可以再拆分。\r\n\r\n第二范式：在第一范式的基础上，非主键列完全依赖于主键，而不能是依赖于主键的一部分。\r\n\r\n第三范式：在第二范式的基础上，非主键列只依赖于主键，不依赖于其他非主键。\r\n\r\n在设计数据库结构的时候，要尽量遵守三范式，如果不遵守，必须有足够的理由。比如性能。事实上我们经常会为了性能而妥协数据库的设计。\r\n\r\n'),(2,'CSS动画','CSS动画简介','css.jpg','2021-12-25 12:17:01.249','#css-动画（animation）。\r\n\r\n动画就是使元素从一种样式逐渐变化为另一种样式的效果。我们可以改变任意多的样式任意多的次数（很官方的回答）。\r\n\r\n为了方便大家和我自己理解这个概念，我们可以想像一下准备拍电影的时候，我们需要一个电影名吧，需要设置电影的时间吧。而且拍电影就是一帧一帧，叫做关键帧。所以我们设置动画的时候要讲清楚电影名（animation-name），电影时长（animation-duration），电影啥时候开始（animation-delay），播放或者暂停（animation-play-state）。关键帧（@keyframes）就是拍好了供我们调用，所以电影名就是要使用到关键帧。接下来细细讲解每个部分的具体内容：\r\n@keyframes\r\n\r\n###通过 @keyframes 规则，我们可以创建动画。\r\n\r\n\r\n创建动画的原理是，将一套 CSS 样式逐渐变化为另一套样式。在动画过程中我们能够多次改变这套 CSS 样式。以百分比来规定改变发生的时间，或者通过关键词 “from” 和 “to”，等价于 0% 和 100%。\r\n\r\n0% 是动画的开始时间，100% 动画的结束时间。为了获得最佳的浏览器支持，我们应该始终定义 0% 和 100% 选择器。这里面0%就是一帧，50%是一帧，100%也是一帧。\r\n\r\n最后,请使用动画属性来控制动画的外观，同时将动画与选择器绑定\r\n'),(3,'javaascript闭包概念的理解','javaascript闭包概念的理解','javascript.jpg','2021-12-25 13:31:27.320','闭包是js的一个难点也是它的一个特色，是我们必须掌握的js高级特性，那么什么是闭包呢？它又有什么用呢？\r\n\r\n>我们都知道，js的作用域分两种，全局和局部，基于我们所熟悉的作用域链相关知识，我们知道在js作用域环境中访问变量的权利是由内向外的，内部作用域可以获得当前作用域下的变量并且可以获得当前包含当前作用域的外层作用域下的变量，反之则不能，也就是说在外层作用域下无法获取内层作用域下的变量，同样在不同的函数作用域中也是不能相互访问彼此变量的，那么我们想在一个函数内部也有限权访问另一个函数内部的变量该怎么办呢？闭包就是用来解决这一需求的，闭包的本质就是在一个函数内部创建另一个函数。\r\n\r\n\r\n我们首先知道闭包有3个特性：\r\n①函数嵌套函数\r\n②函数内部可以引用函数外部的参数和变量\r\n③参数和变量不会被垃圾回收机制回收'),(4,'java泛型详解','java泛型详解','java.png','2021-12-25 13:35:02.688','<b>泛型在java中有很重要的地位，在面向对象编程及各种设计模式中有非常广泛的应用。</b>\r\n\r\n###什么是泛型？为什么要使用泛型？\r\n\r\n>泛型，即“参数化类型”。一提到参数，最熟悉的就是定义方法时有形参，然后调用此方法时传递实参。那么参数化类型怎么理解呢？顾名思义，就是将类型由原来的具体的类型参数化，类似于方法中的变量参数，此时类型也定义成参数形式（可以称之为类型形参），然后在使用/调用时传入具体的类型（类型实参）。\r\n\r\n>泛型的本质是为了参数化类型（在不创建新的类型的情况下，通过泛型指定的不同类型来控制形参具体限制的类型）。也就是说在泛型使用过程中，操作的数据类型被指定为一个参数，这种参数类型可以用在类、接口和方法中，分别被称为泛型类、泛型接口、泛型方法。\r\n\r\n2. 一个栗子\r\n\r\n一个被举了无数次的例子：\r\n\r\n```\r\nList arrayList = new ArrayList();\r\narrayList.add(\"aaaa\");\r\narrayList.add(100);\r\n\r\nfor(int i = 0; i< arrayList.size();i++){\r\n    String item = (String)arrayList.get(i);\r\n    Log.d(\"泛型测试\",\"item = \" + item);\r\n}\r\n\r\n\r\n```\r\n毫无疑问，程序的运行结果会以崩溃结束：\r\n\r\n```\r\njava.lang.ClassCastException: java.lang.Integer cannot be cast to java.lang.String\r\n\r\n\r\n```\r\n\r\n\r\nArrayList可以存放任意类型，例子中添加了一个String类型，添加了一个Integer类型，再使用时都以String的方式使用，因此程序崩溃了。为了解决类似这样的问题（在编译阶段就可以解决），泛型应运而生。\r\n\r\n我们将第一行声明初始化list的代码更改一下，编译器会在编译阶段就能够帮我们发现类似这样的问题。\r\n\r\n```\r\nList<String> arrayList = new ArrayList<String>();\r\n...\r\n//arrayList.add(100); 在编译阶段，编译器就会报错\r\n\r\n```\r\n'),(5,'算法---动态规划','动态规划讲解','算法.jpg','2021-12-25 13:44:30.422','一、动态规划的三大步骤\r\n\r\n动态规划，无非就是利用历史记录，来避免我们的重复计算。而这些历史记录，我们得需要一些变量来保存，一般是用一维数组或者二维数组来保存。下面我们先来讲下做动态规划题很重要的三个步骤，\r\n\r\n    如果你听不懂，也没关系，下面会有很多例题讲解，估计你就懂了。之所以不配合例题来讲这些步骤，也是为了怕你们脑袋乱了\r\n\r\n第一步骤：定义数组元素的含义，上面说了，我们会用一个数组，来保存历史数组，假设用一维数组 dp[] 吧。这个时候有一个非常非常重要的点，就是规定你这个数组元素的含义，例如你的 dp[i] 是代表什么意思？\r\n\r\n第二步骤：找出数组元素之间的关系式，我觉得动态规划，还是有一点类似于我们高中学习时的归纳法的，当我们要计算 dp[n] 时，是可以利用 dp[n-1]，dp[n-2]…..dp[1]，来推出 dp[n] 的，也就是可以利用历史数据来推出新的元素值，所以我们要找出数组元素之间的关系式，例如 dp[n] = dp[n-1] + dp[n-2]，这个就是他们的关系式了。而这一步，也是最难的一步，后面我会讲几种类型的题来说。\r\n\r\n    学过动态规划的可能都经常听到最优子结构，把大的问题拆分成小的问题，说时候，最开始的时候，我是对最优子结构一梦懵逼的。估计你们也听多了，所以这一次，我将换一种形式来讲，不再是各种子问题，各种最优子结构。所以大佬可别喷我再乱讲，因为我说了，这是我自己平时做题的套路。\r\n\r\n第三步骤：找出初始值。学过数学归纳法的都知道，虽然我们知道了数组元素之间的关系式，例如 dp[n] = dp[n-1] + dp[n-2]，我们可以通过 dp[n-1] 和 dp[n-2] 来计算 dp[n]，但是，我们得知道初始值啊，例如一直推下去的话，会由 dp[3] = dp[2] + dp[1]。而 dp[2] 和 dp[1] 是不能再分解的了，所以我们必须要能够直接获得 dp[2] 和 dp[1] 的值，而这，就是所谓的初始值。\r\n\r\n由了初始值，并且有了数组元素之间的关系式，那么我们就可以得到 dp[n] 的值了，而 dp[n] 的含义是由你来定义的，你想求什么，就定义它是什么，这样，这道题也就解出来了。\r\n\r\n不懂？没事，我们来看三四道例题，我讲严格按这个步骤来给大家讲解。');

/*Table structure for table `collect_n` */

DROP TABLE IF EXISTS `collect_n`;

CREATE TABLE `collect_n` (
  `collect_id` bigint NOT NULL AUTO_INCREMENT,
  `note_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `createTime` datetime(3) DEFAULT CURRENT_TIMESTAMP(3),
  PRIMARY KEY (`collect_id`),
  KEY `note_id` (`note_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `collect_n_ibfk_1` FOREIGN KEY (`note_id`) REFERENCES `note` (`note_id`),
  CONSTRAINT `collect_n_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

/*Data for the table `collect_n` */

/*Table structure for table `comment` */

DROP TABLE IF EXISTS `comment`;

CREATE TABLE `comment` (
  `comment_id` bigint NOT NULL AUTO_INCREMENT,
  `content` text,
  `createTime` datetime(3) DEFAULT CURRENT_TIMESTAMP(3),
  `updateTime` datetime(3) DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `user_name` bigint DEFAULT NULL,
  `user_img` varchar(30) DEFAULT NULL,
  `post_id` bigint DEFAULT NULL,
  PRIMARY KEY (`comment_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `comment` */

/*Table structure for table `course` */

DROP TABLE IF EXISTS `course`;

CREATE TABLE `course` (
  `course_id` int NOT NULL,
  `course_name` varchar(20) NOT NULL,
  `course_grade` varchar(20) NOT NULL,
  `course_img` varchar(30) NOT NULL,
  `course_intro` varchar(1000) NOT NULL,
  `course_teachers` varchar(20) NOT NULL,
  PRIMARY KEY (`course_id`),
  KEY `id` (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `course` */

insert  into `course`(`course_id`,`course_name`,`course_grade`,`course_img`,`course_intro`,`course_teachers`) values (1,'程序设计基础','大一','程序设计基础.jpg','【参考书目】:（1）面向对象程序设计与Visual C++6.0教程 陈天华 编著，清华大学出版社，（2）The C++ Programming Language (Third Edition and Special Edition) Addison-Wesley, ISBN:0-201-88954-4 and 0-201-70073-5.\r\n【考核方式】:期终考试（40%） + 平时成绩（60%）。       \r\n【教学目的与要求】:\r\n1）掌握三种基本程序结构；\r\n2）熟悉面向对象程序设计编程环境；\r\n3）理解面向对象程序设计的基本概念；\r\n4）学会利用面向对象方法分析问题并能进行类的设计；\r\n5）能够根据实际问题、作出一个完整的项目设计（大作业）','林华，龚永义'),(3,'高等数学（1）','大一','高等数学.jpg','上册以函数的知识作为过渡，以运动和变化的观点引出极限，再以极限研究函数的变化率，形成一元函数微分学;从面积问题引出定积分，并与微积分互为逆运算建立联系，形成微积分的基本定理，构成一元函数积分学。\r\n下册通过空间解析几何和向量代数，进一步把一元函数微积分学推广到多元函数微积分学上。','李俏杰'),(4,'计算机科学导论','大一','计算机科学导论.jpg','【使用教材】： Computer Science: An Overview 12E, J. Glenn Brookshear著，人民邮电出版社，2017年第1版\r\n【考核方式】：机考（120分钟）\r\n【成绩分布】：\r\n    总评成绩由两部分组成：平时成绩（含考勤、作业、课堂测验）占60%，期末机考成绩占40%。\r\n    1）考勤——10％（无故未能事先征得教师同意而缺席上课的情况，按考勤满分10分，缺勤一次扣1分记录成绩。）\r\n    2）作业——20％\r\n    3）课堂测验——30%（3次小测）\r\n    4）期末考试——40％','王娟'),(5,'离散数学','大一','离散数学.jpg','离散数学是计算机类专业大学本科的学科基础课程,旨在培养本类专业必须的数学素养,掌握相关知识.','李畅'),(6,'线性代数','大一','线性代数.jpg','本课程重点介绍线性代数的基本知识和矩阵理论，包括行列式、矩阵理论基础、方程组、向量空间、特征值、相似矩阵及正定矩阵。\r\n【使用教材】:\r\n《工程数学--线性代数》（第五版），同济大学应用数学系编,高等教育出版社，2007版\r\n【参考书目】:\r\n1.《线性代数》第五版，同济大学应用数学系 编\r\n2.《线性代数》，陈怡， 海南出版社\r\n3.《线性代数》，冯卫国，科学出版社','申宇铭，金功勋，龚永义'),(7,'综合英语','大一','综合英语.jpg','按大一新生周英语分级考试成绩分为AB班，授课老师不同，使用教材：新大学英语 综合教程2/4。','莫山，杨满珍，曹丽红'),(9,'电路与电子技术','大一','电路与电子技术.jpg','【授课内容】本书共分3篇：第1篇为电路分析基础，内容包括电路的基本概念和定律、电阻电路分析、动态电路分析和正弦电路分析。第2篇为模拟电子技术，内容包括放大器件、基本放大电路分析、负反馈放大电路、集成运算放大电路功率放大与直流电源。第3篇为数字电子技术，内容包括数字逻辑基础、集成逻辑门电路、组合逻辑电路分析与设计、触发器、时序逻辑电路分析与设计、脉冲波形的产生与整形以及现代电子电路分析与设计技术介绍。  【考核方式】:期终考试（40%） + 平时成绩（60%）。                  ','胡程'),(11,'数据结构','大一','数据结构.jpg','“数据结构”是计算机程序设计的重要理论技术基础，它不仅是计算机学科的核心课程，而且已成为其他理工专业的热门选修课。【授课内容】内容包括绪论，线性表，栈和队列，串、数组和广义表，树和二叉树，图，查找和排序。全书采用类C语言作为数据结构和算法的描述语言。第1章综述数据、数据结构和抽象数据类型等基本概念；第2章至第7章从抽象数据类型的角度，分别讨论线性表、栈、队列、串、数组、广义表、树和二叉树以及图等基本类型的数据结构及其应用；第8章综合介绍操作系统和编译程序中涉及的动态存储管理的基本技术；第9章至第11章讨论查找和排序，除了介绍各种实现方法之外，并着重从时间上进行定性或定量的分析和比较；第12章介绍常用的文件结构。\r\n','朱建华'),(12,'操作系统','大二','操作系统.jpg','【授课内容】讲解操作系统带有共性的基本原理：进程管理、中断与调度、死锁、存储管理、设备管理、文件系统等，然后以当今较为成熟和流行的操作系统如以Windows、UNIX、Linux为例，在相关章节介绍具体的实现技术和方法。此外，还介绍了近年来最新出现的云操作系统，苹果Mac OS、安卓Android等移动操作系统。','胡程'),(13,'概率论与数理统计','大二','概率论与数理统计.jpg','作为普通高等院校经济学学科门类和管理学学科门类的数学基础课教材之一。 【授课内容】随机事件与概率、随机变量的分布与数字特征、随机向量、数理统计的基础知识、参数估计与假设检验、方差分析以及回归分析等内容,并讨论相关的应用例子和经济数学模型。','罗海涛'),(14,'计算机系统组成','大二','计算机系统组成.jpg','【授课内容】第1篇为计算机系统组成基础，内容包括计算机系统概论、计算机中的信息表示与运算方法。第2篇为计算机系统分层结构，内容包括CPU组织、指令系统层、80x86汇编语言程序设计。第3篇为存储系统与输入/输出系统，内容包括存储系统介绍、输入/输出系统、计算机I/O设备。第4篇为计算机系统部件设计。','潘智刚'),(15,'软件工程导论','大二','软件工程导论.jpg','【授课内容】系统介绍软件工程的概念、原理、过程及主要方法，内容上覆盖ACM和IEEE制定的Computing Curricula中有关软件工程的主要知识点。在介绍软件工程的基本概念和基本原理的基础上，重点介绍软件开发方法和技术，包括经典的和常用的方法，如结构化方法、面向数据结构方法和面向对象方法，以及一些软件工程的新技术和新方法，如UML 2.0、基于构件的开发、敏捷软件开发、Web工程、CMM和CMMI等。【考核方式】期末笔试，期终考试（40%） + 平时成绩（60%）。','高东发'),(16,'算法分析与设计','大二','算法分析与设计.jpg','本课程在数据结构课程的基础上，进一步剖析各类主要算法的问题描述、主要思想、基本原理和应用场景，使得学生不仅能掌握当前主要算法技术的工作原理，而且能理解该算法产生的背景和设计理念，使其能灵活运用这些技术，结合实际情况设计合适的算法解决问题。\r\n同时，本课程注重算法复杂度分析，介绍各类算法复杂性分析技术，强化算法的性能指标，引导学生设计高效的算法解决实际问题。\r\n【教学大纲】：\r\n第一章 算法概述\r\n\r\n第二章 递归与分治策略\r\n\r\n第三章 动态规划\r\n\r\n第四章 贪心算法\r\n\r\n第五章 回溯法\r\n\r\n第六章 分支限界法\r\n\r\n第七章 概率算法\r\n\r\n第八章 网络流','任函，郑琪'),(17,'操作系统实践','大二','操作系统实践.jpg','【参考书目】：Linux the textbook.pdf; Linux Shells by Example.rar; 【教学资源平台】学者网； 【考核方式】期末机试，期终考试（40%） + 平时成绩（60%）。 ','郑琪'),(22,'中国近现代史纲要','思政','近代史.jpg','《中国近现代史纲要》分为上中下三篇共10章，上篇为从鸦片战争到五四运动前夜（1840-1919），中篇为从五四运动到新中国成立（1919-1949），下篇为从新中国成立到社会主义现代化建设新时期（1949-2015）；而十章中第一章为反对外国侵略的斗争，第二章为对国家出路的早期探索，第三章为辛亥革命与君主专制制度的终结，第四章为开天辟地的大事变，第五章为中国革命的新道路，第六章为中华民族的抗日战争，第七章为为新中国而奋斗，第八章为社会主义基本制度在中国的确立；第九章为社会主义建设在探索中曲折发展，第十章为改革开放与现代化建设新时期。\r\n【课程类型】:高等学校本科公共必修课。【考核方式】期末笔试，期终考试（40%） + 平时成绩（60%）。','崔艳红'),(23,'马克思主义基本原理','思政','马克思主义基本原理.jpg','1、【课程性质】:\r\n《马克思主义基本原理》是阐述马克思主义哲学、马克思主义政治经济学和科学社会主义基本原理的理论体系及其基本内容的重要课程，是普通高等学校对大学生系统进行思想理论教育的一门必修课程，是大学生学习和掌握马克思主义基本理论知识的主渠道。\r\n2、【课程学习目标和基本要求】:\r\n通过本课程教学，学生应达到下列学习目标:理解、掌握马克思主义基本原理。运用马克思主义世界观、方法论观察、分析和解决问题。帮助学生树立马克思主义的世界观、社会历史观、人生观和价值观，树立马克思主义信仰，坚定共产主义信念，增强对社会主义的信心和对共产党的信任，坚定走中国特色社会主义道路，自觉坚持党的基本路线打下扎实的马克思主义理论基础。\r\n3、【课程类型】:高等学校本科公共必修课\r\n4、【考核方式】期末笔试，期终考试（40%） + 平时成绩（60%）。','申波，练建玲'),(24,'思想道德修养与法律基础','思政','思想道德修养与法律基础.jpg','【课程内容】:\r\n思想道德修养与法律基础是以马克思主义为指导，以人生观、价值观、道德观教育为主线，综合运用相关学科知识，依据大学生成长的基本规律，教育引导大学生加强自身思想道德与法律修养的一门公共必修课程。\r\n本课程以三个代表重要思想为指导，从当代大学生面临和关心的实际问题出发，以正确的人生观、价值观、道德观和法制观教育为主线，通过理论学习和实践体验，帮助大学生形成崇高的理想信念，弘扬伟大的爱国主义精神，确立正确的人生观和价值观，牢固树立社会主义荣辱观，培养良好的思想道德素质和法律素质，进一步提高分辨是非、善恶、美丑和加强自我修养的能力，为逐渐成为有理想、有道德、有文化、有纪律的社会主义建设者和接班人，打下扎实的思想道德和法律基础。\r\n【教材】:\r\n《思想道德修养与法律基础》，高等教育出版社，马克思主义理论研究和建设工程重点教材《思想道德修养与法律基础》教材编写组，2010 年修订版。\r\n【参考书目】:\r\n1、《七个怎么办》，中共中央宣传部理论局。\r\n2、《中国文化要义》，上海世纪出版集团2005年第一版，梁漱溟著。\r\n3、《人生哲学》，复旦大学出版社，2005年第一版，陈根法著。\r\n4、《道德哲学》，复旦大学出版社，2005年第一版，高国希著。\r\n【考核方式】期末笔试，期终考试（40%） + 平时成绩（60%）。\r\n','韩娟美，雷艳芝'),(25,'毛概','思政','毛泽东思想和中国特色社会主义理论体系概论.jpg','1.【课程类型】:思想政治理论必修课\r\n2.【学分】:4学分\r\n3.【授课对象】:各专业二年级学生\r\n4.【前导课程】:《思想道德修养与法律基础》\r\n5.【课程教学目的】:本课程以中国化马克思主义为主题，以马克思主义中国化为主线，以中国特色社会主义为重点，着重讲授中国共产党把马克思主义基本原理与中国实际相结合的历史进程，充分反映马克思主义中国化的三大理论成果，帮助学生系统掌握毛泽东思想、邓小平理论、“三个代表”重要思想和科学发展观等重大战略理论的基本原理，坚定在党的领导下走中国特色社会主义道路的理想信念。培养学生运用马克思主义的立场、观点和方法分析和解决问题的能力，增强执行党的基本路线和基本纲领的自觉性和坚定性，积极投身于全面建设小康社会的伟大实践。\r\n6.【考核方式】：期末笔试，期终考试（40%） + 平时成绩（60%）。\r\n\r\n','李珠'),(26,'英语六级','四六级','英语六级.jpg','大学英语六级考试（又称CET-6，全称为“College English Test-6”）是由国家统一出题的，统一收费，统一组织考试，用来评定应试人英语能力的全国性的考试，每年各举行两次。\r\n大学英语六级考试作为一项全国性的教学考试由“国家教育部高教司”主办，每年各举行两次。从2005年1月起，成绩满分为710分，凡考试成绩在220分以上的考生，由国家教育部高教司委托“全国大学英语六级考试委员会”发给成绩单。2007年1月起，六级考试不再接受非在校生报名。\r\n【题型分布】\r\n1、写作：\r\n短文写作 15%；\r\n2、听力理解：\r\n长对话：选择题（单选题），8%；\r\n听力篇章：选择题（单选题），7%；\r\n讲话/报道/讲座：选择题（单选题），20%；\r\n3、阅读理解：\r\n词汇理解：选词填空，5%；\r\n长篇阅读：匹配，10%；\r\n仔细阅读：选择题（单选题），20%；\r\n4、翻译：\r\n翻译：段落翻译，15%；\r\n【考试时间】英语六级笔试在每年6月和12月各一次，口试在笔试前进行，每年5月和11月各一次．\r\n全国大学英语六级笔试每年开考两次，分别于6月和12月举行，具体考试时间全国大学英语四、六级考试中心将会在每年年初另行通知。\r\n【查询时间】每年2月下旬和八月下旬。','');

/*Table structure for table `course_resource` */

DROP TABLE IF EXISTS `course_resource`;

CREATE TABLE `course_resource` (
  `resource_id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `instroduction` text NOT NULL,
  `download_times` bigint DEFAULT '0',
  `coin_num` int NOT NULL,
  `createtime` datetime(3) DEFAULT CURRENT_TIMESTAMP(3),
  `course_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `is_checked` tinyint(1) DEFAULT '0',
  `is_del` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`resource_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

/*Data for the table `course_resource` */

insert  into `course_resource`(`resource_id`,`name`,`instroduction`,`download_times`,`coin_num`,`createtime`,`course_id`,`user_id`,`is_checked`,`is_del`) values (2,'高等上册_数学定理.docx','学霸总结的书本上的数学定理',0,1,'2022-07-06 16:47:40.780',1,43,0,0),(3,'高等上册_数学公式.docx','学霸总结的数学公式',0,1,'2022-07-06 16:48:51.521',1,40,0,0),(4,'D1习题课.ppt','老师复习函数与极限的课堂PPT',0,1,'2022-07-06 16:52:04.289',1,44,0,0),(5,'同济高数第七版上册_电子教材.pdf','同济高数第七版上册_电子教材',0,4,'2022-07-06 16:53:06.759',1,46,0,0),(6,'软工1904通讯录.xlsx','软工1904通讯录',0,1,'2022-07-13 16:49:15.582',1,44,0,0),(7,'「代码随想录」回溯算法精讲（v1.1）.pdf','1111',0,2,'2022-07-16 16:12:28.155',1,43,0,0);

/*Table structure for table `like_n` */

DROP TABLE IF EXISTS `like_n`;

CREATE TABLE `like_n` (
  `like_id` bigint NOT NULL AUTO_INCREMENT,
  `note_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `createTime` datetime(3) DEFAULT CURRENT_TIMESTAMP(3),
  PRIMARY KEY (`like_id`),
  KEY `note_id` (`note_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `like_n_ibfk_1` FOREIGN KEY (`note_id`) REFERENCES `note` (`note_id`),
  CONSTRAINT `like_n_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=115 DEFAULT CHARSET=utf8;

/*Data for the table `like_n` */

/*Table structure for table `note` */

DROP TABLE IF EXISTS `note`;

CREATE TABLE `note` (
  `note_id` bigint NOT NULL AUTO_INCREMENT,
  `note_title` varchar(30) NOT NULL,
  `note_intro` varchar(30) NOT NULL,
  `note_content` text NOT NULL,
  `createtime` datetime(3) DEFAULT CURRENT_TIMESTAMP(3),
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`note_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `note_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

/*Data for the table `note` */

/*Table structure for table `question` */

DROP TABLE IF EXISTS `question`;

CREATE TABLE `question` (
  `q_id` bigint NOT NULL AUTO_INCREMENT,
  `q_title` varchar(20) DEFAULT NULL,
  `q_content` text,
  `q_like_num` bigint DEFAULT NULL,
  `q_collect_num` bigint DEFAULT NULL,
  `createTime` datetime(3) DEFAULT CURRENT_TIMESTAMP(3),
  `updateTime` datetime(3) DEFAULT CURRENT_TIMESTAMP(3) ON UPDATE CURRENT_TIMESTAMP(3),
  `user_id` bigint NOT NULL,
  `nickname` varchar(20) NOT NULL,
  `img_path` varchar(100) DEFAULT NULL,
  `tagList` varchar(30) NOT NULL,
  PRIMARY KEY (`q_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

/*Data for the table `question` */

insert  into `question`(`q_id`,`q_title`,`q_content`,`q_like_num`,`q_collect_num`,`createTime`,`updateTime`,`user_id`,`nickname`,`img_path`,`tagList`) values (25,'测试1','<p>测试1的内容</p>',NULL,NULL,'2022-06-25 16:23:13.377','2022-06-25 16:23:13.377',40,'花花','http://localhost:5000/static/headPic/默认头像.png','计算机网络,c++'),(26,'vuex刷新数据丢失的问题','<p><strong>问题描述</strong><br />\n用户的头像路径存放在vuex仓库中，当刷新时，因为仓库数据清空导致导航栏<strong>图片不能正常展示</strong></p>',NULL,NULL,'2022-06-28 22:55:13.712','2022-06-28 22:55:13.712',46,'花泽类','http://127.0.0.1:5000/upload/userHeadPicImage/8645b00f5fef0beadf3f0cf9c16326d0.jpg','前端,vue'),(27,'刚刚的问题没提对啊','<h2 id=\"\">再来一遍</h2>\n<p><strong>问题描述</strong><br />\n用户的头像路径存放在vuex仓库中，当刷新时，因为仓库数据清空导致导航栏<strong>图片不能正常展示</strong>\n<img src=\"http://127.0.0.1:5000/upload/questionImage/bd6aede0e727d90d28ae5c13e8cc8ba0.png\" alt=\"img\" /></p>',NULL,NULL,'2022-06-28 22:57:53.460','2022-06-28 22:57:53.460',46,'花泽类','http://127.0.0.1:5000/upload/userHeadPicImage/8645b00f5fef0beadf3f0cf9c16326d0.jpg','WEB开发,vue'),(28,'这是一个问题','<p><strong>这是问题的内容</strong></p>\n<table>\n<thead>\n<tr>\n<th>表头</th>\n<th>表头</th>\n</tr>\n</thead>\n<tbody>\n<tr>\n<td>单元格</td>\n<td>单元格</td>\n</tr>\n<tr>\n<td>单元格</td>\n<td>单元格</td>\n</tr>\n</tbody>\n</table>',NULL,NULL,'2022-07-22 21:11:53.687','2022-07-22 21:11:53.687',40,'花花','http://127.0.0.1:5000/upload/userHeadPicImage/26d6ba48a467679c4c97772e9dcf234e.jpg','javascript,jquery');

/*Table structure for table `resource` */

DROP TABLE IF EXISTS `resource`;

CREATE TABLE `resource` (
  `course_id` int DEFAULT NULL,
  `resource_path` varchar(255) NOT NULL,
  `resource_type` varchar(20) DEFAULT NULL,
  `resource_id` int DEFAULT NULL,
  `display` int NOT NULL,
  `user_id` varchar(100) NOT NULL,
  PRIMARY KEY (`resource_path`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `resource` */

insert  into `resource`(`course_id`,`resource_path`,`resource_type`,`resource_id`,`display`,`user_id`) values (1,'20190223112220_yvuuq.jpg','13',NULL,1,'11'),(1,'timg (3).jpg',NULL,NULL,0,'1'),(3,'同济高数第七版上册_电子教材.pdf','32',6,1,'0'),(3,'同济高数第七版上册_第一章ppt.rar','31',7,1,'0'),(3,'同济高数第七版上册_第七章ppt.rar','31',13,1,'0'),(3,'同济高数第七版上册_第三章ppt.rar','31',9,1,'0'),(3,'同济高数第七版上册_第二章ppt.rar','31',8,1,'0'),(3,'同济高数第七版上册_第五章ppt.rar','31',11,1,'0'),(3,'同济高数第七版上册_第六章ppt.rar','31',12,1,'0'),(3,'同济高数第七版上册_第四章ppt.rar','31',10,1,'0'),(1,'啦啦啦',NULL,NULL,0,'2'),(3,'打钩.png',NULL,NULL,0,'24'),(1,'程序设计基础（C++）_ppt.rar','11',1,1,'0'),(1,'程序设计基础（C++）_样卷.rar','13',2,1,'0'),(2,'通用学术英语_unit 2B writing指导课件.pptx','21',3,1,'0'),(2,'通用学术英语_对于EAP.docx','23',5,1,'0'),(2,'通用学术英语_电子教材.pdf','22',4,1,'0'),(3,'高数上册_03考试试卷.doc','33',16,1,'0'),(3,'高数上册_试卷.doc','33',17,1,'0'),(3,'高等上册_数学公式.doc','33',15,1,'0'),(3,'高等上册_数学定理.doc','33',14,1,'0');

/*Table structure for table `tag` */

DROP TABLE IF EXISTS `tag`;

CREATE TABLE `tag` (
  `tag_id` int NOT NULL AUTO_INCREMENT,
  `tag_name` varchar(10) DEFAULT NULL,
  `tag_type` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`tag_id`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

/*Data for the table `tag` */

insert  into `tag`(`tag_id`,`tag_name`,`tag_type`) values (1,'html5','前端'),(2,'css3','前端'),(4,'java','编程语言'),(5,'python','编程语言'),(6,'计算机网络','课程'),(7,'算法','课程'),(8,'php','后端'),(9,'c++','编程语言'),(10,'WEB开发','课程'),(11,'jquery','前端'),(12,'bootrap','前端'),(13,'数据结构','课程'),(14,'操作系统','课程'),(15,'计算机组成','课程'),(16,'c#','编程语言'),(17,'后端','后端'),(18,'前端','前端'),(19,'javascript','前端'),(20,'vue','前端'),(23,'es6','前端'),(24,'Matlab','工具'),(25,'Pychram','工具'),(26,'IDEA','工具'),(27,'VSCode','工具');

/*Table structure for table `tag_question` */

DROP TABLE IF EXISTS `tag_question`;

CREATE TABLE `tag_question` (
  `table_id` bigint NOT NULL AUTO_INCREMENT,
  `q_id` bigint NOT NULL,
  `tags` varchar(30) NOT NULL,
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `tag_question` */

/*Table structure for table `teacher` */

DROP TABLE IF EXISTS `teacher`;

CREATE TABLE `teacher` (
  `teacher_id` int NOT NULL,
  `teacher_name` varchar(20) NOT NULL,
  `teacher_intro` varchar(10000) NOT NULL,
  `teacher_img` varchar(20) NOT NULL,
  `course_id` int NOT NULL,
  PRIMARY KEY (`teacher_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*Data for the table `teacher` */

insert  into `teacher`(`teacher_id`,`teacher_name`,`teacher_intro`,`teacher_img`,`course_id`) values (1,'林华','从2004年开始主讲C++语言程序设计课程，从2002年开始主讲数据结构课程，并且主讲过\r\n\r\n（计算机基础、电子商务技术、FLASH动画设计、管理信息系统、数据库原理及基础和数\r\n\r\n据库技术实践等）课程。并参与编写教材和专著。教学期间培养了一大批优秀的学生，教学质量一直得到学生们一致的好评和认可，在年度教学质量评比中获得优异的成绩。获得优秀教师称号并多次获得教学奖。曾经为相关政府部门成功建设的应用系统沿用至今，得到好评。','林华.jpg',1),(2,'龚永义','龚永义，硕士生导师，桂林电子科技大学（兼职）博士生导师，广东省图象图形学会理事，广东外语外贸大学智慧健康与可视计算（iHAVC）实验室负责人。近5年，主持国家自然科学基金项目1项，主持广东省自然科学基金项目、广州市科技计划项目等课题4项，在国内外期刊和会议发表图形图像处理方向论文20多篇，其中，SCI收录论文8篇，EI收录论文10多篇。  主要研究方向是：图像处理与可视计算。目前主要从事基于医学影像的三维建模与术前规划、立体图像处理等课题研究。  联系邮箱：gongyongyi@gdufs.edu.cn','龚永义.jpg',1),(3,'周静','【职称·学历】：讲师·博士\r\n【研究方向】：儿童文学理论、文艺美学\r\n【邮箱】： zhoujing@gdufs.edu.cn\r\n【所属系部】： 第二教学部\r\n【办公室】：院系楼256室\r\n \r\n【教育经历】\r\n2018.08-2019.08 受国家留学基金委资助,赴英国剑桥大学教育系访学\r\n2009.09-2012.06 暨南大学文艺学专业博士\r\n2003.09-2005.06 中山大学英语语言文学专业硕士\r\n \r\n【工作经历】\r\n2009年进入广外英语教育学院，担任过不同课程的授课教师，目前主要讲授《基础ESP》。\r\n \r\n【个人介绍】\r\n本人主要研究西方文艺美学、儿童文学理论等，已出版专著《再现：阿瑟·丹托的艺术哲学思想研究》，在《理论月刊》、《江西社会科学》、《广东外语外贸大学学报》等发表论文10余篇，主持或参与课题4项。目前本人正在进行儿童文学理论和美学的相关研究。','周静.jpg',2),(4,'李俏杰','【教育背景】：\r\n2003 – 2007年就读于南昌航空大学信息与计算科学专业，获理学学士学位；\r\n2007 -2012年就读于中南大学计算数学专业，硕博连读，获理学博士学位。\r\n【工作经历】：\r\n2012 – 2016年华为技术有限公司，研究工程师\r\n2017 – 至今 广东外语外贸大学\r\n【研究方向】：\r\n主要进行交叉学科研究，主要有：格子Boltzmann方法、元胞自动机理论在金融及通信领域的应用、大数据技术在金融及通信领域的应用等。','李俏杰.jpg',3),(5,'王娟','【研究领域方向】：网络信息资源利用及用户行为分析\r\n【联系邮箱】：wjgdufs@126.com\r\n【教育背景】：中大博士毕业\r\n【教学科研情况】：已完成一项教育部人文社科一般项目，一项广东省教育厅高校优秀青年创新人才培养计划项目和一项粤港关键领域重点突破项目，正主持一项国家社科基金一般项目，正参与一项国家社科重大基金项目，一项国家社科基金一般项目和一项国家自科基金一般项目。\r\n【学术成果】：已公开发表11篇论文，包括2篇2A论文，1篇2B论文，2篇3类论文，1篇EI检索论文','王娟.jpg',4),(6,'李畅','【职称/职务】：计算机科学与技术系讲师\r\n\r\n','默认.jpg',5),(7,'申宇铭','【个人简介】：\r\n博士，教授，硕士生导师。2010年7月于中国科学院计算技术研究所获博士学位，主要从事自然语言处理及人工智能技术研究，具体包括知识图谱，人工智能在金融数据分析中应用等方面。国家自然科学基金通讯评委、广东省自然科学基金通讯评委、广东省科技厅高层次人才评审专家、广东省商务厅电子商务咨询专家、广州市政务数据服务管理局咨询专家、广州市标准化研究院咨询专家，担任了多个国际学术会议：AAAI（人工智能国际顶级会议）、EMNLP（自然语言处理国际顶级会议）、CCKS（知识图谱国内著名会议）程序委员会委员，在国内外期刊、国际学术会议发表相关领域论文20余篇，主持或参与多项国家自然科学基金和省部级项目的研究。','申宇铭.jpg',6),(8,'金功勋','1）Kanoksak Wattanachote received the Ph.D. degree from the Department of Computer Science and Information Engineering, National Central University, Taiwan, the M.S. degree in information management from the School of Advanced Technologies, Asian Institute of Technology, Thailand, and the B.S. degree in statistics from the Faculty of Science, Srinakharinwirot University, Thailand. He is currently working for School of Information Science and Technology, as a faculty member at Guangdong University of Foreign Studies.\r\n2）His research interests are in the areas of computer vision, image processing, image forensics, JPEG analysis, video editing, and interactive multimedia but. In computer vision researches now, he emphasizes motion recognition on dynamic textures. Several kinds of motion data are extracted to study about: motion pattern, motion periodicity, covariance stationarity etc. Machine learning tools such as support vector machine (SVM) will be concern. For periodicity analysis, singular value decomposition (SVD) is concern for vector analysis. His fields of interest are also including Big Data technologies and Web security.','金功勋.jpg',6),(9,'龚永义','龚永义，硕士生导师，桂林电子科技大学（兼职）博士生导师，广东省图象图形学会理事，广东外语外贸大学智慧健康与可视计算（iHAVC）实验室负责人。近5年，主持国家自然科学基金项目1项，主持广东省自然科学基金项目、广州市科技计划项目等课题4项，在国内外期刊和会议发表图形图像处理方向论文20多篇，其中，SCI收录论文8篇，EI收录论文10多篇。  主要研究方向是：图像处理与可视计算。目前主要从事基于医学影像的三维建模与术前规划、立体图像处理等课题研究。  联系邮箱：gongyongyi@gdufs.edu.cn','龚永义.jpg',6),(10,'莫山','【职称·学历】：讲师·硕士研究生\r\n\r\n【研究方向】：英语教育\r\n【邮箱】： moreshine@gmail.com\r\n\r\n【所属系部】：英语教育学院第一教学部\r\n\r\n \r\n\r\n【教育经历】\r\n\r\n1995–1999  广州师范学院外语系\r\n\r\n1999–2002  广州大学外国语学院\r\n\r\n \r\n\r\n【工作经历】 \r\n\r\n2002-2005   广东外语外贸大学继续教育学院\r\n\r\n2005-至今   广东外语外贸大学英语教育学院\r\n\r\n \r\n【个人介绍】\r\n\r\n上课认真负责，涉及知识范围广，能帮助学生拓展视野，培养对英语学习的兴趣；钟爱利用各种多元素的多媒体设备帮助拓展课堂内容，让学生沉浸在较为真实的英语学习环境中。','莫山.jpg',7),(11,'杨满珍','毕业于广东外语外贸大学，最高学历在职研究生，获得硕士学位，现在职称副教授，研究领域语言测试与评估、教师发展等，主讲课程：《综合英语》、《英语视听说》、《影视英语视听说》、《中级英语写作》、《实用英语演讲与写作》、《实用商务英语》等，曾获广东外语外贸大学优秀教师奖、优秀教学一等奖、先进个人等奖励，主持省市级科研课题“基于网络信息技术的‘以评促学’大学英语教学模式的探索与创建等三项，主编或参编教材/论著《涉外级英语教程－听说训练》等三部，先后发表科研论文《听写测试方法对听写测试结果的影响》等十余篇。','杨满珍.jpg',7),(12,'曹丽红','【职称·学历】：讲师·硕士\r\n\r\n【研究方向】：认知语言学，形成性评估，网络情绪分析\r\n\r\n【邮箱】：201610130@oamail.gdufs.edu.cn\r\n\r\n【所属系部】：第一教学部\r\n\r\n【办公室】：南校区院系楼256\r\n\r\n【教育经历】\r\n\r\n2003.9-2007.7 湖南师范大学本科（英语教育专业）\r\n\r\n2007.9-2010.7 湖南师范大学硕士（外国语言学及应用语言学方向）\r\n\r\n【工作经历】\r\n\r\n2010.7-2016.7 肇庆学院外国语学院\r\n\r\n2016.7-至今   广东外语外贸大学教育学院\r\n\r\n【个人介绍】\r\n\r\n本人自加入形成性评估教学小组以来，努力探索并实践形成性教学评估的理念，贯彻融入教学并不断积极推进新措施的应用，并努力跟进同行的最新研究。对于教学效果的追求一直是我的工作重点。\r\n\r\n同时，协同语言工程与计算实验室开展对网络文本的情绪分析，开发软件与模型对重要网站中的负面情绪进行尽可能准确的识别，通过不断实验各种算法与改进计算模型，从而提高网络安全性。积极合作撰写论文与申报相关课题。\r\n\r\n做人做事，全力以赴，但求落幕无悔。教书育人，亦是如此。','曹丽红.jpg',7),(13,'罗海蛟','【学历/学位】：硕士研究生\r\n【职称/职务】：讲师\r\n【研究方向】：自然语言处理\r\n【联系邮箱】：luohaijiao@gdufs.edu.cn','罗海蛟.jpg',8),(14,'李月梅','【职称/职务】：网络空间安全系讲师','默认.jpg',8),(15,'胡程','【学历/学位】：博士\r\n【职称/职务】：讲师/硕士生导师\r\n【研究方向】：并行与分布式计算、绿色计算、资源自适应系统、系统性能评估等。\r\n不限于上述方向，欢迎优秀学生报读本人硕士研究生。\r\n【电子邮箱】：chenghu81@163.com\r\n【个人网页】：https://www.scholarmate.com/P/huchengcs\r\n【讲授课程】\r\n操作系统、电路与电子技术基础、计算机组成等。','胡程.jpg',9),(16,'王晋勋','【个人简介】：\r\n2003－2007：华南师范大学，学士；\r\n2007－2010：华南师范大学，硕士；\r\n2010－2014：澳门大学，博士\r\n2015年7月至今：广东外语外贸大学，教师\r\n【教授课程】：\r\n微积分、高等数学、数学分析（3）、解析几何','王晋勋.jpg',10),(17,'朱建华','【职称/职务】：计算机科学与技术系副教授','默认男.jpg',11),(18,'胡程','【学历/学位】：博士 【职称/职务】：讲师/硕士生导师 【研究方向】：并行与分布式计算、绿色计算、资源自适应系统、系统性能评估等。 不限于上述方向，欢迎优秀学生报读本人硕士研究生。 【电子邮箱】：chenghu81@163.com 【个人网页】：https://www.scholarmate.com/P/huchengcs 【讲授课程】 操作系统、电路与电子技术基础、计算机组成等。','胡程.jpg',12),(19,'罗海涛','【职称/职务】：计算机科学与技术系罗海涛工程师','默认男.jpg',13),(20,'潘智刚','【学历/学位】：博士研究生\r\n【职称/职务】：讲师\r\n【研究领域方向】：计算机算法设计\r\n【联系邮箱】：panzg@139.com\r\n【教育背景】 理学博士 中山大学理论物理专业\r\n【教学科研情况】 担任《电路与电子技术》、《汇编语言与计算机系统组成》等课程','潘智刚.jpg',14),(21,'高东发','【学历/学位】：博士\r\n【职称/职务】：副院长\r\n【研究领域】: 图像处理与模式识别,计算机视觉\r\n2002—2005年，华南理工大学计算机科学与工程学院，获博士学位','高东发.jpg',15),(22,'任函','【职称/职务】：任函副研究员','默认男.jpg',16),(23,'郑琪','【学历/学位】：博士研究生\r\n【职称/职务】：副教授\r\n【研究领域方向】：数据挖掘、自然语言处理、生物信息学\r\n【联系邮箱】：zq@gdufs.edu.cn\r\n【教育背景】 : 中山大学生物信息专业博士\r\n【教学科研情况】：本科生课程：算法分析与设计、操作系统实践、商务智能、数据挖据','郑琪.jpg',16),(24,'郑琪','【学历/学位】：博士研究生 【职称/职务】：副教授 【研究领域方向】：数据挖掘、自然语言处理、生物信息学 【联系邮箱】：zq@gdufs.edu.cn 【教育背景】 : 中山大学生物信息专业博士 【教学科研情况】：本科生课程：算法分析与设计、操作系统实践、商务智能、数据挖据','郑琪.jpg',17),(29,'崔艳红','【职称】   教授          【所属教学部】      “中国近现代史纲要”教学部\r\n\r\n【办公电话】（南校区）   020-39328995      北校区   020-36317187\r\n\r\n【崔艳红】，历史学专业博士，研究生学历，硕士生导师。高校思想政治理论课教师2015年度影响力提名人物，“新时代广州理论专家宣讲团”理论专家。现任马克思主义学院副院长、广东省基层党建工作研究基地副主任，广州市党的十九大精神宣讲团成员、新时代广州红色文化讲习所宣讲团成员、新时代广州理论专家宣讲团成员。\r\n\r\n【承担本科生公共政治课课程主要有】：《中国近现代史纲要》、《形势与政策》及《马克思主义中国化进程与青年学生使命担当》，指导学生社会实践课程。\r\n\r\n【承担研究生公共政治课课程有】：《中国特色社会主义理论与实践研究》、《中国马克思主义与当代》\r\n\r\n【承担研究生专业课程有】：《习近平新时代中国特色社会主义思想》、《马克思主义的国际传播与马克思主义中国化》\r\n\r\n【主要研究领域及成果】：本人主要研究方向为中国近现代史、中共党史、马克思主义中国化理论、国内外气候灾害治理、拜占庭史等。近年来主持国家社科基金项目、教育部重大攻关项目子项目、教育部专项项目、广东省社科规划项目、广东省高等教育教学改革项目、广东省教育厅项目、校级项目等十余项。在《史学月刊》、《中山大学学报》、《世界历史》、《历史教学》、《中国社会科学报》等著名学术期刊、报纸发表学术论文和教研论文数十篇。专著3部、译著4部、参编教材著作4部。\r\n\r\n【主要获奖情况】：\r\n\r\n1.2016年5月荣获教育部高校思想政治理论课教学指导委员会评选的“高校思想政治理论课教师2015年度影响力提名人物”称号。\r\n\r\n2. 2015-2016年广东外语外贸大学优秀党员。\r\n\r\n3. 被评为2016-2017学年度优秀研究生教育管理工作者。\r\n\r\n4. 荣获2017-2018年度广东外语外贸大学研究生课程教学质量优秀奖。\r\n\r\n5. 2019年4月4日获得2018年度广东外语外贸大学工会优秀职工之友称号。\r\n\r\n6. 2019年6月20日荣获广东外语外贸大学2018-2019学年度优秀研究生导师。\r\n\r\n7.荣获2018-2019年度广东外语外贸大学研究生课程教学质量优秀奖。\r\n\r\n8.2020年7月29日荣获广东外语外贸大学2019年度本科优秀教学奖二等奖。\r\n\r\n9.2021年1月28日荣获广东外语外贸大学惠妍卓越教学奖。\r\n\r\n10. 荣获2010年度广东外语外贸大学先进（优秀）教师称号。\r\n\r\n11. 2011年5月荣获广东外语外贸大学2010年优秀科研业绩奖二等奖。\r\n\r\n12. 2012年6月29日荣获2010—2012年广东外语外贸大学创先争优优秀共产党员称号。\r\n\r\n13. 2014-2015年度广东外语外贸大学科研业绩二等奖\r\n\r\n14. 2014-2015年度广东外语外贸大学优秀教师。\r\n\r\n15. 2014-2015年度广东外语外贸大学优秀教学奖二等奖。\r\n\r\n16. 荣获2007年广东省教育厅全省高校“中国近现代史纲要” 课程优秀教案一等奖。\r\n\r\n主要学术兼职：广东中共党史人物研究会理事。','崔艳红.jpg',22),(30,'申波','【职称】   教授          【所属教学部】   《马克思主义基本原理》教学部\r\n【办公电话】（南校区）   020-39328995      北校区   020-36317187\r\n【申波】  中山大学哲学系中国哲学专业毕业，哲学博士，研究生学历。\r\n\r\n【承担本科生公共政治课课程主要有】：《马克思主义基本原理概论》\r\n\r\n【承担研究生专业生课程有】：《中国传统文化与中国特色社会主义研究》\r\n\r\n【主要研究领域及成果】：本人主要从事中国哲学史和马克思主义中国化研究。近来年主持广东省哲学社会科学规划项目2项，在《中山大学学报（社会科学版）》、《孔子研究》等刊物发表论文30多篇。\r\n\r\n【主要获奖情况】：年度考核优秀若干\r\n\r\n主要学术兼职：广东省儒学研究会理事、广东省中华民族凝聚力研究会理事和特约研究员','申波.jpg',23),(31,'练建玲','【职称】   讲师         【所属教学部】     “马克思主义基本原理”教学部\r\n【办公电话】（南校区）   020-39328995      北校区   020-36317187\r\n【练建玲】  中山大学哲学系与德国法兰克福大学哲学系联合培养的哲学博士，研究生学历。\r\n\r\n【承担本科生公共政治课课程主要有】：《马克思主义基本原理概论》、《形势与政策》及《马克思主义中国化进程与青年学生使命担当》，指导学生社会实践课程。\r\n\r\n【承担研究生公共政治课课程有】：《自然辩证法》\r\n\r\n【主要研究领域及成果】：主要研究方向为实践哲学和社会主义运动史。近年来先后主持教育部社科青年项目和广东外语外贸大学精品翻译项目共2项，在《科学社会主义》、《实践哲学评论》等核心刊物上发表学术论文及译作数篇。','练建玲.jpg',23),(32,'韩娟美','【职称】   副教授         【所属教学部】  “思想道德修养与法律基础”教学部\r\n【办公电话】（南校区）   020-39328995      北校区   020-36317187\r\n【韩娟美】  法学硕士，研究生学历，硕士生导师。国家3级心理咨询师，广东省优秀咨询员，长期担任大学心理健康教育中心咨询老师。\r\n\r\n【承担本科生公共政治课课程】：《思想道德修养与法律基础》、《形势与政策》及《马克思主义中国化进程与青年学生使命担当》，指导学生社会实践课程。\r\n\r\n【承担通识教育选修课程】：《爱情心理学》、《婚恋心理学》、《性格管理之九型人格》等。\r\n\r\n【主要研究领域及成果】： 本人主要从事高校大学生思想政治教育研究。近年来，主持和参与省部级教研课题数十项，在《广东外语外贸大学学报》、《理论观察》、《青年与社会》等刊物发表论文20余篇。\r\n\r\n【主要获奖情况】：获评广东省教学优秀成果奖、省三下乡优秀个人。','韩娟美.jpg',24),(33,'雷艳芝','【职称】   副教授         【所属教学部】 “思想道德修养与法律基础”教学部\r\n【办公电话】（南校区）   020-39328995      北校区   020-36317187\r\n【雷艳芝】  法学硕士，研究生学历，华南师范大学在职博士生。现任思想道德修养与法律基础教学部主任和党支部书记。\r\n\r\n【承担本科生公共政治课课程主要有】：《思想道德修养与法律基础》、《形势与政策》及《马克思主义中国化进程与青年学生使命担当》，指导学生社会实践课程。\r\n\r\n【主要研究领域及成果】：主要从事中共党史党建、马克思主义中国化和思想政治理论课教学改革研究。近年来，主持国家社科基金项目1项，主持校级课题1项，参与国家社科基金、教育部人文社会科学研究课题、广东省哲学社会科学规划项目各1项；在《中国社会科学报》、《甘肃社会科学》、《广西社会科学》等刊物上发表学术论文十余篇，其中1篇学术论文被人大报刊复印资料全文转载。\r\n\r\n【主要获奖情况】：荣获广东省教育厅“高等学校思想政治理论课优秀教案评选”和“高校思政课青年教师基本功技能大赛”三等奖，2015年被评为“广东省百名优秀德育教师”，连续多年荣获广东外语外贸大学优秀教学奖。','雷艳芝.jpg',24),(34,'李珠','【职称】   讲  师          【所属教学部】      《毛泽东思想和中国特色社会主义理论体系概论》教学部\r\n【办公电话】： 020-39328995   本人邮箱： 201910030@oamail.gdufs.edu.cn\r\n【李珠】  中山大学管理学博士，研究生学历。\r\n\r\n【承担本科生公共政治课课程主要有】：《毛泽东思想和中国特色社会主义理论体系概论》、《形势与政策》及指导学生社会实践课程。\r\n\r\n【主要研究领域及成果】：主要从事政府治理、公共行政与行政体制改革、腐败与廉政问题的理论与实践研究。近年来，在《中国行政管理》、《公共行政评论》等CSSCI期刊发表学术论文多篇；主持广东省教育厅课题1项，参与国家社会科学基金重大项目、广东省委宣传部重点课题、广州市哲学社会科学规划课题多项。在服务地方经济社会发展方面，承担了多项广东省发改委、广东省委政策研究室及广东省公安厅等单位的委托研究项目，取得了良好效果。','李珠.jpg',25);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `user_id` bigint NOT NULL AUTO_INCREMENT,
  `nickname` varchar(20) NOT NULL DEFAULT '',
  `password` varchar(200) DEFAULT NULL,
  `school` varchar(20) DEFAULT NULL,
  `major` varchar(10) DEFAULT NULL,
  `grade` varchar(5) DEFAULT NULL,
  `sex` varchar(5) DEFAULT NULL,
  `age` int DEFAULT NULL,
  `img_path` varchar(100) DEFAULT 'http://localhost:5000/static/headPic/默认头像.png',
  `user_coin` int DEFAULT '10',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

/*Data for the table `user` */

insert  into `user`(`user_id`,`nickname`,`password`,`school`,`major`,`grade`,`sex`,`age`,`img_path`,`user_coin`) values (40,'花花','$2a$10$v5D7r1UXTLbEV5TeDIAa1OOdPQCt9NFyB/ZgOQzBNRd7BpFbInu0C','广外',NULL,'大二','男',22,'http://127.0.0.1:5000/upload/userHeadPicImage/26d6ba48a467679c4c97772e9dcf234e.jpg',10),(43,'狗子','$2a$10$Uz2Def9wWC8EMdol1s.Rj./3ytp6huaBWiIvPK2EEy56yBuJbHcHC',NULL,NULL,NULL,NULL,NULL,'http://localhost:5000/static/headPic/默认头像.png',10),(44,'小绿','$2a$10$H76sh8nsWhlt0Q/b/2m4NOEQALAEjbss14LYu7gh.74TfgCo/39pG',NULL,NULL,NULL,NULL,NULL,'http://localhost:5000/static/headPic/默认头像.png',10),(45,'planet','$2a$10$JXbpvib3GGW1cGNuhiui0eXYQet9rIbpUMQN6ZC5C0TEwqivJFOCK','广东外语外贸大学',NULL,NULL,NULL,NULL,'http://localhost:5000/static/headPic/默认头像.png',10),(46,'花泽类','$2a$10$F23rIZksfJuHG2j9FIs8zu8JeEp.YtI3NyqrANyC3nuB./SI2xD0C',NULL,NULL,NULL,NULL,NULL,'http://127.0.0.1:5000/upload/userHeadPicImage/8645b00f5fef0beadf3f0cf9c16326d0.jpg',10);

