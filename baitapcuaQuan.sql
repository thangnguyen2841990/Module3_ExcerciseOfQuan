create database excercise1;
use excercise1;
create table students
(
    id int primary key auto_increment,
    name varchar(50) not null,
    address varchar(50) not null,
    sex bit default 1,
    age int check ( age between 18 and 25),
    email varchar(50) not null unique ,
    phone varchar(10) not null unique
);
create table class
(
    id int primary key auto_increment,
    name varchar(50) not null unique
);
alter table students add classid int not null;
alter table students add foreign key (classid) references class(id);
insert into class (name)
values ('A1'),
       ('A2'),
       ('A3'),
       ('A4'),
       ('A5');
insert into students (id,name, address, sex, age, email, phone,classid)
values (1,'Thang', 'Ha Noi', 1 , 25, 'nguyenthang@gmail.com','0394910426',1),
    (2,'Quan', 'Ha Noi', 1, 23, 'quannguyen@gmail.com','0981987678',1),
       (3,'Huy', 'Nam Dinh', 1,24,'huypham@gmail.com','0989765456',2),
       (4,'Hoang','Thai Binh',1,19,'hoangquy@gmail.com','0989738343',3),
       (5,'Binh', 'Nghe An',0,20,'binhnguyen@gmail.com','0989765432',4),
       (6,'Tuan','Ha Noi',0,21,'duytuan@gmail.com','098976545',5),
       (7,'Huyen','Thai Nguyen',0,22,'huyendo@gmail.com','012343243',5),
       (8,'Lan','Ha Noi',0,23,'lanlengonc@gmail.com','098976532',4),
       (9,'Huan', 'Nam Dinh', 1,24,'huandham@gmail.com','0989765436',2),
       (10,'Hang','Thai Binh',0,19,'hangquy@gmail.com','0989238343',3);
update students
set age = 25
where name = 'Huyen';
#Hien thi toan bo danh sach sinh vien
select * from students;
#Hien thi tat ca hoc vien nam
select * from students where sex = 1;
#Hien thi tat ca hoc vien nho tuoi hon 20
select * from students where age < 20;
#Hien thi hoc vien que ha noi, da nang, hcm
select * from students where address = 'Ha Noi' or address = 'Nghe An' or address = 'Ho Chi Minh';
#Hien thi tat ca hoc vien khong que o Ha Noi
select * from students where address <> 'Ha Noi';
#Hien thi hoc vien ten bat dau bang chu H
select * from students where name like 'h%';
#Hien thi hoc vien co ten la Anh
select * from students where  name = 'Anh';
#Hien thi danh sach hoc vien theo ten giam dan
select * from students order by name desc ;
# Hien thi danh sach hoc vien theo tuoi tang dan
select * from students order by age;
# Hien thi tong so luong hoc vien cua moi lop
select s.classid, c.name, count(s.classid)
from students s join class c on s.classid = c.id
group by s.classid, c.name;
# Hien thi lop co so luong hoc vien la dong nhat
select s.classid, c.name , count(s.classid) as totalstudent
from students s join class c on s.classid = c.id
group by s.classid, c.name
having totalstudent >= all (select count(classid) from students group by students.classid);
# Hien thi lop co so luong hoc vien it nhat
select s.classid, c.name , count(s.classid) as totalstudent
from students s join class c on s.classid = c.id
group by s.classid, c.name
having totalstudent <= all (select count(classid) from students group by students.classid);
#thong ke so luong hoc vien theo dia chi
select address, count(address) "Student quanlity"
from students
group by address;
# hien thi lop co so hoc vien >5
select s.classid, c.name , count(s.classid) as totalstudent
from students s join class c on s.classid = c.id
group by s.classid, c.name
having totalstudent > 5;
#hien thi nhung thanh pho co so luong hoc vien >5
select address , count(address) as totalStudent
from students
group by address
having totalStudent > 5;
# Hien thi hoc vien co tuoi lon nhat
select id, name, max(age) as maxAge
from students
group by name
having maxAge >= (select max(age) from students);

#Hien thi hoc vien nho tuoi nhat
select id, name, min(age) as minAge
from students
group by name
having minAge <= (select min(age) from students);

#Xoa hoc vien que ha noi
delete from students
where address = 'Ha Noi';
#cap nhat gioi tinh hoc vien que ha noi thanh nu
update students
set sex = 0
where address = 'Ha Noi';
select * from students;
# Hien thi hoc vien co so tuoi lon thu 2
select * from students where age = (select max(age) from students
                                             where age < (select max(age) from students));
# Hien thi hoc vien nho tuoi thu 2
select * from students where age = (select min(age) from students
                                             where age > (select min(age) from students));


