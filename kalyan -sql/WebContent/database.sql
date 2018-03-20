CREATE TABLE project(
pid INT(10) PRIMARY KEY NOT NULL AUTO_INCREMENT,
pname VARCHAR(100) NOT NULL,
pstatus boolean NOT NULL,
summary VARCHAR(500),
startdate DATE,
enddate DATE,
documentation VARCHAR(500)
);

CREATE TABLE projet_links(
plink VARCHAR(100) NOT NULL,
pid INT(10),
visibility boolean NOT NULL,
PRIMARY KEY(plink,pid),
FOREIGN KEY(pid) REFERENCES project(pid)
);

CREATE TABLE login(
mid INT(10) PRIMARY KEY NOT NULL AUTO_INCREMENT,
username VARCHAR(100) NOT NULL UNIQUE,
password VARCHAR(100) NOT NULL,
email VARCHAR(100) NOT NULL UNIQUE,
login_status boolean NOT NULL
);

CREATE TABLE member(
mid INT(10) NOT NULL,
fname VARCHAR(100) NOT NULL,
lname VARCHAR(100),
resume VARCHAR(500),
dp VARCHAR(500),
mobileno INT(10) UNIQUE,
dob DATE,
facebook VARCHAR(100),
linkedin VARCHAR(100),
twitter VARCHAR(100),
website VARCHAR(100),
FOREIGN KEY(mid) REFERENCES login(mid),
PRIMARY KEY(mid)
);

CREATE TABLE work_by(
pid INT(10),
mid INT(10),
isadmin boolean,
PRIMARY KEY(pid,mid),
FOREIGN KEY(pid) REFERENCES project(pid),
FOREIGN KEY(mid) REFERENCES member(mid)
);

CREATE TABLE tools(
tid INT(10) PRIMARY KEY AUTO_INCREMENT,
tname VARCHAR(100)
);

CREATE TABLE reference(
refid INT(10) PRIMARY KEY NOT NULL AUTO_INCREMENT,
tid INT(10),
level ENUM('Beginner','Intermediate','Advance'),
rlink VARCHAR(100),
mid INT(10),
docs VARCHAR(500),
FOREIGN KEY(mid) REFERENCES member(mid),
FOREIGN KEY(tid) REFERENCES tools(tid)
);

CREATE TABLE votes(
refid INT(10),
mid INT(10),
vote INT,
PRIMARY KEY(refid,mid),
FOREIGN KEY(refid) REFERENCES reference(refid),
FOREIGN KEY(mid) REFERENCES member(mid)
);

CREATE TABLE worked_with(
pid INT(10),
tid INT(10),
PRIMARY KEY(pid,tid),
FOREIGN KEY(pid) REFERENCES project(pid),
FOREIGN KEY(tid) REFERENCES tools(tid)
);

CREATE TABLE versions(
pid INT(10),
vid INT(10),
description VARCHAR(250),
dateupdated DATE NOT NULL,
PRIMARY KEY(pid,vid),
FOREIGN KEY(pid) REFERENCES project(pid)
);

CREATE TABLE skills(
sid INT(10) PRIMARY KEY NOT NULL AUTO_INCREMENT,
skill VARCHAR(100) NOT NULL
);

CREATE TABLE courses(
cid INT(10) NOT NULL AUTO_INCREMENT,
mid INT(10),
title VARCHAR(100) NOT NULL,
description VARCHAR(250),
cdate DATE,
certificate VARCHAR(500),
PRIMARY KEY(cid,mid),
FOREIGN KEY(mid) REFERENCES member(mid)
);

CREATE TABLE has_skills(
sid INT(10) NOT NULL,
mid INT(10) NOT NULL,
PRIMARY KEY(sid,mid),
FOREIGN KEY(sid) REFERENCES skills(sid),
FOREIGN KEY(mid) REFERENCES member(mid)
);

CREATE TABLE achievements(
aid INT(10) AUTO_INCREMENT,
mid INT(10),
title VARCHAR(100) NOT NULL,
description VARCHAR(250),
issuer VARCHAR(150),
adate DATE,
PRIMARY KEY(aid,mid),
FOREIGN KEY(mid) REFERENCES member(mid)
);

CREATE TABLE education(

eid INT(10) NOT NULL AUTO_INCREMENT,
mid INT(10),
degree VARCHAR(100),
grade float,
institute VARCHAR(150),
startdate DATE,
enddate DATE,
stream VARCHAR(100),
PRIMARY KEY(eid,mid),
FOREIGN KEY(mid) REFERENCES member(mid)
);

CREATE TABLE experience(

exid INT(10) AUTO_INCREMENT,
mid INT(10),
title VARCHAR(100),
description VARCHAR(500),
sdate DATE,
edate DATE,
company VARCHAR(250),
location VARCHAR(250),
tools VARCHAR(250),
PRIMARY KEY(exid,mid),
FOREIGN KEY(mid) REFERENCES member(mid)
);

CREATE TABLE admin(
adid INT PRIMARY KEY AUTO_INCREMENT,
username VARCHAR(50) UNIQUE,
password VARCHAR(50)
);

