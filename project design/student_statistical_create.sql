USE `test`;

# 删除数据库 student_statistical
drop DATABASE `student_statistical`;

# 创建数据库 student_statistical
CREATE DATABASE `student_statistical`;

# 引用数据库
USE `student_statistical`;

# 创建jurisdiction 权限表
CREATE TABLE `jurisdiction`
(
	`jurisdiction_id` INT PRIMARY KEY AUTO_INCREMENT COMMENT "权限ID",
	`jurisdiction_name` VARCHAR(30) NOT NULL COMMENT "权限名称"
);

SELECT * FROM `jurisdiction`;


# 创建 role 角色表
CREATE TABLE `role`
(
	`role_id` INT PRIMARY KEY AUTO_INCREMENT COMMENT "角色ID",
	`role_name` VARCHAR(30) NOT NULL COMMENT "角色名称"
);

SELECT * FROM `role`;

# 创建 jurisdiction_role 权限角色中间表
CREATE TABLE `jurisdiction_role`
(
	`jurisdiction_role_id` INT PRIMARY KEY AUTO_INCREMENT,
	`role_id` INT COMMENT "外键引用角色表",
	`jurisdiction_id` INT COMMENT "外键引用权限表",
	FOREIGN KEY (`role_id`) REFERENCES `role`(`role_id`),
	FOREIGN KEY (`jurisdiction_id`) REFERENCES `jurisdiction`(`jurisdiction_id`)
);

SELECT * FROM `jurisdiction_role`;


# 创建 constellation 星座表
CREATE TABLE `constellation`
(
	`constellation_id` INT PRIMARY KEY AUTO_INCREMENT,
	`constellation_head_portrait` VARCHAR(100) COMMENT "星座头像图片地址",
	`constellation_name` VARCHAR(20) COMMENT "星座名称",
	`constellation_date` VARCHAR(30) COMMENT "星座日期",
	`constellation_gender` VARCHAR(5) COMMENT "星座性别",
	`constellation_trait` VARCHAR(300) COMMENT "星座特点",
	`constellation_weakness` VARCHAR(100) COMMENT "星座弱点",
	`constellation_affection` VARCHAR(100) COMMENT "星座爱情",
	`constellation_describe` VARCHAR(300) COMMENT "星座描述",
	`constellation_show_img` VARCHAR(100) COMMENT "星座图片"
);

SELECT * FROM `constellation`;


# 创建 ethnic 名族表
CREATE TABLE `ethnic`
(
	`ethnic_id` INT PRIMARY KEY AUTO_INCREMENT,
	`ethnic_name` VARCHAR(20) NOT NULL COMMENT "名族名称"
); 

SELECT * FROM `ethnic`;


# 创建 province 省表 
CREATE TABLE `province`
(
	`province_id` INT PRIMARY KEY ,
	`province_name` VARCHAR(20) NOT NULL 
);


# 创建 city 城市表
create table city (
	`city_id` INT  PRIMARY KEY AUTO_INCREMENT,
	`city_order` INT NOT NULL ,
	`city_name` VARCHAR(50) NOT NULL ,
	`province_id` INT,
	FOREIGN KEY (`province_id`) REFERENCES `province`(`province_id`)
);

# 创建 student 学生表
CREATE TABLE `student`
(
	`student_id` INT PRIMARY KEY AUTO_INCREMENT,
	`student_number` VARCHAR(20) NOT NULL COMMENT "登录账号",
	`student_password` VARCHAR(20) NOT NULL COMMENT "登录密码",
	`student_signature` VARCHAR(200) NULL COMMENT "用户签名",
	`student_name` VARCHAR(10) NOT NULL COMMENT "用户姓名",
	`student_identity_card` VARCHAR(20) NOT NULL COMMENT "身份证号",
	`student_head_portrait` VARCHAR(100) NULL COMMENT "用户头像",
	`province_id` INT COMMENT "外键引用省份表",
	`city_id` INT COMMENT "外键引用城市表",
	`ethnic_id` INT COMMENT "外键引用民族表",
	`student_gender` VARCHAR(5) NOT NULL DEFAULT '男' COMMENT "用户性别",
	`student_age` INT  COMMENT "用户年龄",
	`student_birthday` DATE NOT NULL COMMENT "生日",
	`constellation_id` INT COMMENT "外键引用星座表",
	`student_introduce` VARCHAR(200) NULL COMMENT "介绍",
	`student_mailbox` VARCHAR(20) NULL COMMENT "邮箱地址",
	`student_phone` VARCHAR(15) NULL COMMENT "手机号码",
	`role_id` INT COMMENT "外键引用角色表",
	`student_status` INT DEFAULT 0 COMMENT "账号状态",
	FOREIGN KEY (`province_id`) REFERENCES `province`(`province_id`),
	FOREIGN KEY (`city_id`) REFERENCES `city`(`city_id`),
	FOREIGN KEY (`ethnic_id`) REFERENCES `ethnic`(`ethnic_id`),
	FOREIGN KEY (`constellation_id`) REFERENCES `constellation`(`constellation_id`),
	FOREIGN KEY (`role_id`) REFERENCES `role`(`role_id`),
	 CHECK (`student_age` > 0)
);

SELECT * FROM `student`;


# 创建 exam_type 考试类别表
CREATE TABLE `exam_type`
(
	`exam_type_id` INT PRIMARY KEY AUTO_INCREMENT,
	`exam_type_name` VARCHAR(20) NOT NULL COMMENT "类别名称"
);

SELECT * FROM `exam_type`;

# 创建 subject 科目表
CREATE TABLE `subject`
(
	`subject_id` INT PRIMARY KEY AUTO_INCREMENT,
	`subject_name` VARCHAR(30) NOT NULL COMMENT "科目名称",
	`subject_describe` VARCHAR(200) NOT NULL COMMENT "科目描述"
);

SELECT * FROM `subject`;

# 创建 score 成绩表
CREATE TABLE `score`
(
	`score_id` INT PRIMARY KEY AUTO_INCREMENT,
	`student_id` INT COMMENT "外键引用学生表",
	`exam_type_id` INT COMMENT "外键引用考试类别表",
	`subject_id` INT COMMENT "外键引用科目表",
	`score_grade` DECIMAL(5,2) DEFAULT 0.00 COMMENT "分数",
	FOREIGN KEY (`student_id`) REFERENCES `student`(`student_id`),
	FOREIGN KEY (`exam_type_id`) REFERENCES `exam_type`(`exam_type_id`),
	FOREIGN KEY (`subject_id`) REFERENCES `subject`(`subject_id`)
);

SELECT * FROM `score`;

# 创建 class 班级表
CREATE TABLE `class`
(
	`class_id` INT PRIMARY KEY AUTO_INCREMENT,
	`class_number` VARCHAR(10) UNIQUE NOT NULL COMMENT "班级编号",
	`class_head_portrait` VARCHAR(100) NULL COMMENT "班级头像",
	`class_name` VARCHAR(20) NOT NULL COMMENT "班级名称",
	`class_create_date` DATE DEFAULT NOW() COMMENT "班级建立时间",
	`class_slogan` VARCHAR(50) NULL COMMENT "班级口号"
);


SELECT * FROM `class`;

# 创建 student_class 学生班级中间表
CREATE TABLE `student_class`
(
	`student_class_id` INT PRIMARY KEY AUTO_INCREMENT,
	`class_id` INT COMMENT "外键引用班级表",
	`student_id` INT COMMENT "外键引用学生表",
	FOREIGN KEY (`class_id`) REFERENCES `class`(`class_id`),
	FOREIGN KEY (`student_id`) REFERENCES `student`(`student_id`)
);


SELECT * FROM `student_class`;


# 创建 teacher 教师表
CREATE TABLE `teacher`
(
	`teacher_id` INT PRIMARY KEY AUTO_INCREMENT,
	`teacher_number` VARCHAR(20) NOT NULL COMMENT "登录账号",
	`teacher_password` VARCHAR(20) NOT NULL COMMENT "登录密码",
	`teacher_signature` VARCHAR(200) NULL COMMENT "用户签名",
	`teacher_name` VARCHAR(10) NOT NULL COMMENT "用户姓名",
	`teacher_identity_card` VARCHAR(20) NOT NULL COMMENT "身份证号",
	`teacher_head_portrait` VARCHAR(100) NULL COMMENT "用户头像",
	`province_id` INT COMMENT "外键引用省份表",
	`city_id` INT COMMENT "外键引用城市表",
	`ethnic_id` INT COMMENT "外键引用民族表",
	`teacher_gender` VARCHAR(5) NOT NULL DEFAULT '男' COMMENT "用户性别",
	`teacher_age` INT COMMENT "用户年龄",
	`teacher_birthday` DATE NOT NULL COMMENT "生日",
	`constellation_id` INT COMMENT "外键引用星座表",
	`teacher_introduce` VARCHAR(200) NULL COMMENT "介绍",
	`teacher_mailbox` VARCHAR(20) NULL COMMENT "邮箱地址",
	`teacher_phone` VARCHAR(15) NULL COMMENT "手机号码",
	`role_id` INT COMMENT "外键引用角色表",
	`subject_id` INT COMMENT "外键引用科目表",
	`teacher_status` INT DEFAULT 0 COMMENT "账号状态",
	FOREIGN KEY (`subject_id`) REFERENCES `subject`(`subject_id`),
	FOREIGN KEY (`ethnic_id`) REFERENCES `ethnic`(`ethnic_id`),
	FOREIGN KEY (`constellation_id`) REFERENCES `constellation`(`constellation_id`),
	FOREIGN KEY (`role_id`) REFERENCES `role`(`role_id`),
	CHECK (`teacher_age` > 0),
	FOREIGN KEY (`province_id`) REFERENCES `province`(`province_id`),
	FOREIGN KEY (`city_id`) REFERENCES `city`(`city_id`)
);

SELECT * FROM `teacher`;

# 创建 teacher_class 教师班级中间表
CREATE TABLE `teacher_class`
(
	`teacher_class_id` INT PRIMARY KEY AUTO_INCREMENT,
	`teacher_id` INT COMMENT "外键引用教师表",
	`class_id` INT COMMENT "外键引用班级表",
	FOREIGN KEY (`teacher_id`) REFERENCES `teacher`(`teacher_id`),
	FOREIGN KEY (`class_id`) REFERENCES `class`(`class_id`)
);


SELECT * FROM `teacher_class`;








