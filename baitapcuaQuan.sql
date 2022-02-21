create database excercise1;
use excercise1;
create table students (
    id int auto_increment not null primary key ,
    name varchar(50) not null,
    address varchar(50) not null ,
    sex bit default 1 not null ,
    age int not null check ( age between 18 and 25),
    email varchar(50) not null unique ,
    phone varchar(10) not null

);
create table classes(
    id int auto_increment primary key,
    name varchar(50) not null unique
);
alter table students add classid int not null ;
alter table students add foreign key (classid) references classes(id);
insert into classes (name)
values ('A1'),
       ('A2'),
       ('A3'),
       ('A4'),
       ('A5');
select classes.* from classes;
insert into students(name, address,sex,age,email,phone,classid)
            values ('Thang', 'Ha Noi', 1, 20, 'nguyenthang29tbdl@gmail.com','0394910426',1),
                   ('Cuong', 'Ha Noi', 1, 21, 'nguyencuong29tbdl@gmail.com','0394910427',2),
                   ('Thuy', 'Nam Dinh', 1, 24, 'nguyenthuy29tbdl@gmail.com','0394910428',1),
                   ('Tinh', 'Ninh Binh', 1, 23, 'nguyentinh29tbdl@gmail.com','0394910429',1),
                   ('Hoa', 'Ha Noi', 0, 22, 'nguyenhoa29tbdl@gmail.com','0394910430',2),
                   ('Tu', 'Bac Ninh', 1, 19, 'nguyentu29tbdl@gmail.com','0394910431',3),
                   ('Minh', 'Ha Noi', 1, 22, 'nguyenMinh29tbdl@gmail.com','0394913426',4),
                   ('Toan', 'Ha Noi', 1, 19, 'nguyentoan78tbdl@gmail.com','0393910426',5),
                   ('Viet', 'Nam Dinh', 1, 22, 'nguyenviet29tbdl@gmail.com','0394940426',1),
                   ('Quoc', 'Ha Tinh', 1, 22, 'nguyenquoc29tbdl@gmail.com','0394910436',4);
select students.* from students;
select students.* from students where sex = 1;
select students.* from students where age < 20;
select students.* from students where address = 'Ha Noi' or 'Da Nang' or 'Ho Chi Minh' ;
select students.* from students where address <> 'HA Noi';
select students.* from students where name like 'h%';
select students.* from students where name = 'Anh';
# Hien thi danh sach hoc vien theo ten giam dan
select students.* from students order by name desc;
# theo tuoi tang dan
select students.* from students order by age;
select students.* from students;
# tong so luong hoc vien cua moi lop
select s.classid , c.name, count(s.classid) "So Luong Hoc Sinh"
from students s join classes c on s.classid = c.id
group by s.classid;
# hien thi lop co so luong hoc vien la dong nhat
select s.classid , c.name, count(s.classid) "So Luong Hoc Sinh"
from students s join classes c on s.classid = c.id
group by s.classid
having count(s.classid) >= all (select count(classid) from students group by students.classid);
# hien thi lop co so hoc sinh it nhat
select s.classid , c.name, count(s.classid) "So Luong Hoc Sinh"
from students s join classes c on s.classid = c.id
group by s.classid
order by count(s.classid) limit 1;
# having count(s.classid) = all (select count(classid) from students group by students.classid);
# thong ke so luong hoc vien theo dia chi
select  address, count(address) "So luong hoc vien"
from students
group by address;
# hien thi nhung lop co so luong hoc vien > 3
select s.classid , c.name, count(s.classid) "So Luong Hoc Sinh"
from students s join classes c on s.classid = c.id
group by s.classid
having count(s.classid) > 3;
# hien thi thanh pho co so luong hoc vien lon hon 5
select  address, count(address) "So luong hoc vien"
from students
group by address
having count(address) >=5;
# hien thi hoc vien lon tuoi nhat
select students.*, max(age) from students where age = (select max(age) from students);

# hien thi hoc vien nho tuoi nhat
select students.*, min(age) from students where age = (select min(age) from students);
# xoa hoc vien que ha noi
delete from students where address = 'Ha Noi';
# cap nhat thong tin hoc vien que ha noi thanh gioi tinh nu
update students
set sex = 0
where address = 'Ha Noi';
# Hien thi hoc vien co so tuoi lon thu 2
select students.* from students where age = (select max(age) from students
where age < (select max(age) from students));
# Hien thi hoc vien nho tuoi thu 2
select students.* from students where age = (select min(age) from students
                                             where age > (select min(age) from students));