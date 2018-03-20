
CREATE TABLE project(
pid INTEGER(10) PRIMARY KEY NOT NULL primary key,
pname VARCHAR(100),
pstatus boolean,
summary VARCHAR(500),
startdate DATE,
enddate DATE,
documentation VARCHAR(500)
);
CREATE SEQUENCE pid_seq; 

CREATE TABLE project_links(
plink VARCHAR(100) NOT NULL,
pid INTEGER(10) NOT NULL,
visibility boolean,
Constraint pklink PRIMARY KEY(plink,pid)
);



CREATE TABLE login(
mid INTEGER(10) NOT NULL PRIMARY KEY,
username VARCHAR(100),
password VARCHAR(100),
email VARCHAR(100),
login_status boolean
);
CREATE SEQUENCE mid_seq; 


CREATE TABLE member(
mid INTEGER(10) NOT NULL PRIMARY KEY,
fname VARCHAR(100),
lname VARCHAR(100),
resume VARCHAR(500),
dp VARCHAR(500),
mobileno INTEGER(10),
dob DATE,
facebook VARCHAR(100),
linkedin VARCHAR(100),
twitter VARCHAR(100),
website VARCHAR(100)
);

CREATE TABLE work_by(
pid INTEGER(10) NOT NULL,
mid INTEGER(10) NOT NULL,
isadmin boolean,
Constraint pkwork PRIMARY KEY(pid,mid)
);


CREATE TABLE tools(
tid INTEGER(10) PRIMARY KEY,
tname VARCHAR(100)
);
CREATE SEQUENCE tid_seq; 

CREATE TABLE reference(
refid INTEGER(10) NOT NULL PRIMARY KEY,
tid INTEGER(10),
level ENUM('Beginner','Intermediate','Advance'),
rlink VARCHAR(100),
mid INTEGER(10),
docs VARCHAR(500),
);


CREATE TABLE votes(
refid INTEGER(10) NOT NULL,
mid INTEGER(10) NOT NULL,
vote INTEGER,
Constraint pkvotes PRIMARY KEY(refid,mid)
);

CREATE TABLE worked_with(
pid INTEGER(10) NOT NULL,
tid INTEGER(10) NOT NULL,
Constraint workwithvotes PRIMARY KEY(pid,tid)
);


CREATE TABLE versions(
pid INTEGER(10) NOT NULL,
vid INTEGER(10) NOT NULL,
description VARCHAR(250),
dateupdated DATE,
Constraint versionvotes PRIMARY KEY(pid,vid)
);

CREATE TABLE skills(
sid INTEGER(10) NOT NULL PRIMARY KEY,
skill VARCHAR(100)
);
CREATE SEQUENCE sid_seq; 

CREATE TABLE courses(
cid INTEGER(10) NOT NULL,
mid INTEGER(10) NOT NULL,
title VARCHAR(100),
description VARCHAR(250),
cdate DATE,
certificate VARCHAR(500),
Constraint pkcourse PRIMARY KEY(cid,mid)
);
CREATE SEQUENCE cid_seq; 


CREATE TABLE has_skills(
sid INTEGER(10) NOT NULL,
mid INTEGER(10) NOT NULL,
Constraint pkskill PRIMARY KEY(sid,mid)
);

CREATE TABLE achievements(
aid INTEGER(10) NOT NULL,
mid INTEGER(10)  NOT NULL,
title VARCHAR(100),
description VARCHAR(250),
issuer VARCHAR(150),
adate DATE,
Constraint pkachieve PRIMARY KEY(aid,mid)
);
CREATE SEQUENCE aid_seq; 


CREATE TABLE education(

eid INTEGER(10) NOT NULL,
mid INTEGER(10) NOT NULL,
degree VARCHAR(100),
grade float,
institute VARCHAR(150),
startdate DATE,
enddate DATE,
stream VARCHAR(100),
Constraint pkeducate PRIMARY KEY(eid,mid)
);
CREATE SEQUENCE eid_seq; 


CREATE TABLE experience(

exid INTEGER(10) NOT NULL,
mid INTEGER(10) NOT NULL,
title VARCHAR(100),
description VARCHAR(500),
sdate DATE,
edate DATE,
company VARCHAR(250),
location VARCHAR(250),
tools VARCHAR(250),
Constraint pkexp PRIMARY KEY(exid,mid)
);
CREATE SEQUENCE exid_seq; 

CREATE TABLE admin( 
adid INTEGER NOT NULL PRIMARY KEY,
username VARCHAR(50) ,
password VARCHAR(50)
);
CREATE SEQUENCE adid_seq; 
