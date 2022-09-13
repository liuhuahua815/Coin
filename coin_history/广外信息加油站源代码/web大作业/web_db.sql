

CREATE DATABASE IF NOT EXISTS `web_db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `web_db`;

CREATE TABLE `course` (
  `id` int(100) NOT NULL,
  `course_name` varchar(20) NOT NULL,
  `course_grade` varchar(20) NOT NULL,
  `course_img` varchar(20) NOT NULL,
  `course_intro` varchar(255) NOT NULL,
  `course_teachers` varchar(20) NOT NULL
 
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `teacher` (
  `teacher_id` int(100) NOT NULL,
  `teacher_name` varchar(20) NOT NULL,
  `teacher_intro` varchar(255) NOT NULL,
  `teacher_img` varchar(20) NOT NULL
 
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

INSERT INTO course VALUES(1,'程序设计基础','大一','程序设计基础.jpg','【参考书目】:（1）面向对象程序设计与Visual C++6.0教程 陈天华 编著，清华大学出版社，（2）The C++ Programming Language (Third Edition and Special Edition) Addison-Wesley, ISBN:0-201-88954-4 and 0-201-70073-5.
【考核方式】:期终考试（40%） + 平时成绩（60%）。       
【教学目的与要求】:
1）掌握三种基本程序结构；
2）熟悉面向对象程序设计编程环境；
3）理解面向对象程序设计的基本概念；
4）学会利用面向对象方法分析问题并能进行类的设计；
5）能够根据实际问题、作出一个完整的项目设计（大作业）','林华，龚永义');
INSERT INTO course VALUES(2,'计算机科学导论','大一','计算机科学导论.jpg','使用教材： Computer Science: An Overview 12E, J. Glenn Brookshear著，人民邮电出版社，2017年第1版  考核方式：机考（120分钟）  成绩分布：总评成绩由两部分组成：平时成绩（含考勤、作业、课堂测验）占60%，期末机考成绩占40%。','王娟');
    
INSERT INTO course VALUES(3,'高等数学（1）','大一','高等数学（1）.jpg','必修课程','李俏杰');
INSERT INTO course VALUES(4,'计算机科学导论','大一','计算机科学导论.jpg','必修课程','王娟');
INSERT INTO course VALUES(5,'计算机科学导论','大一','计算机科学导论.jpg','必修课程','王娟');
INSERT INTO course VALUES(6,'计算机科学导论','大一','计算机科学导论.jpg','必修课程','王娟');
INSERT INTO course VALUES(7,'计算机科学导论','大一','计算机科学导论.jpg','必修课程','王娟');
INSERT INTO course VALUES(8,'计算机科学导论','大一','计算机科学导论.jpg','必修课程','王娟');
INSERT INTO course VALUES(9,'计算机科学导论','大一','计算机科学导论.jpg','必修课程','王娟');
INSERT INTO course VALUES(10,'计算机科学导论','大一','计算机科学导论.jpg','必修课程','王娟');

INSERT INTO teacher VALUES(1,'林华','好老师','林华.jpg');
INSERT INTO teacher VALUES(2,'龚永义','好老师','龚永义.jpg');


ALTER TABLE `course`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id` (`id`);

ALTER TABLE `teacher`
  ADD PRIMARY KEY (`teacher_id`),
  ADD KEY `teacher_id` (`teacher_id`);