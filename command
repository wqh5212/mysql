 show variables like 'character_set_client';#查询字符集
 2 show databases;#列出所有的服务器上的数据库alter
 3 create database if not exists test;#创建一个数据库
 4 drop database fk;#删除数据库
 5 show tables from test;#显示一个数据库中的表
 6 use test;

create table tb_dept(
Id int primary key auto_increment,#部门编号 整形 主键 自增长
Name varchar(18),#部门名称
description varchar(100)#描述
 );

14 show tables from test;
15 
16 desc tb_dept;#查看表信息
17 
18 show create table tb_dept;

use test;
员工表
create table tb_emp(
 id int primary key auto_increment,#auto_increment只是MySQL特有的
Name varchar(18),
sex varchar(2),
age int,
address varchar(200),
 email varchar(100)
);
30 
31 drop table tb_dept;
32 #修改列类型
33 #注意：不是任何情况下都可以去修改的，
34 #只有当字段只包含空值时才可以修改。
35 alter table tb_emp modify sex  varchar(4);
36 #增加列
37 alter table tb_emp add tel varchar(12);
38 #删除列
39 alter table tb_emp drop tel;
40 alter table tb_emp drop column tel;
41 #列改名
42 alter table tb_emp change Name emp_Name varchar(18);
43 #更改表名
44 alter table tb_emp rename emp;
45 rename table emp to tb_emp;
46 
47 insert into dept_emp (Name,sex,age,address,email)values('','','','','');
48 
49 #约束
50 #是在表上强制执行地数据校验规则，主要用于保证数据库地完整性
51 /*
52 not null 
53 unique 唯一键tb_depttb_dept
54 primary key 
55 foreign key 外键
56 check 检查
57 */
58 
59 create table tb_emp(
60 id int primary key auto_increment,
61 Name varchar(18),
62 sex varchar(2) default'男' check(sex='男'or sex='女'),#表级写法check 在mysql中不起作用
63 age int,
64 address varchar(200),
65 email varchar(100) unique,
66 dept_id int,#references tb_dept(id) #表级写法外键不起作用
67 constraint foreign key fk_emp(dept_id) references tb_dept(id)
68 );
69 
70 #创建表之后在添加
71 alter table tb_emp add constraint foreign key fk_emp(dept_id) references tb_dept(id);
