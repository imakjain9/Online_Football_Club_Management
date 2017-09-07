create database Boca;
use Boca;
drop table claims;
delete from matchdetails;
select * from claims;
delete from userinfo where email = 'abhi1@gmail.com';
use boca;
create table UserInfo(
email varchar(40) primary key,
username varchar(30),
password varchar(30),
name varchar(30),
dob datetime,
experience varchar(15),
mobile long,
playertype varchar(40),
city varchar(40),
state varchar(40)
);

delete from playerbonus where email = 'abhi1@gmail.com';
create table playerbonus(
email varchar(40),
numofmatch int,
matchPlayingBonus int,
goalbonus int,
cornergoalbonus int,
totalbonus int,
increment int,
salary int,
FOREIGN KEY (email) REFERENCES UserInfo(email)
);

create table matchdetails(
matchid int primary key,
matchdate datetime,
opponent varchar(50)
);

create table playerPerformance(
matchid int,
playerEmail varchar(50),
totalgoals int,
cornergoals int
);

create table sportApparels(
orderid int primary key auto_increment,
email varchar(40),
productname varchar(40),
quantity int,
cost int,
requestdate datetime,
status varchar(30),
FOREIGN KEY (email) REFERENCES UserInfo(email)
);


create table claims(
claimid int primary key auto_increment,
playeremail varchar(40),
claimdate datetime,
claimtype varchar(40),
claimamount int,
claimstatus varchar(30),
remarks varchar(200),
FOREIGN KEY (playeremail) REFERENCES UserInfo(email)
);

create table maintenance(
id int primary key AUTO_INCREMENT,
maintenancetype varchar(40),
maintenancedate datetime,
maintenanceexpense int,
maintenanceprovider varchar(40)
);



