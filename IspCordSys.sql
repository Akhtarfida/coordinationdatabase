/* drop database*/

 DROP DATABASE IF EXISTS`ISPCORDSYS`;

/* create datbase*/

CREATE DATABASE IF NOT EXISTS `ISPCORDSYS`
  DEFAULT CHARSET utf8mb4;

/* use database for further tables*/

USE `ISPCORDSYS`;

/* create login table*/

CREATE TABLE IF NOT EXISTS `ISPCORDSYS`.`USER`
(
      userid INT PRIMARY KEY AUTO_INCREMENT,
      userfullname VARCHAR(100) NOt Null,
      userpassword VARCHAR(50) NOt Null,
      created_at DATETIME DEFAULT current_timestamp,
      modified_at DATETIME DEFAULT current_timestamp

);
INSERT INTO `ISPCORDSYS`.`USER` (userfullname,userpassword)
  VALUES
  ('ShoaibZahid','officalaccount'),
  ('MuhammadSaim','myaccount'),
  ('FahadKhan','openaccount');

  /* create class table*/

  CREATE TABLE IF NOT EXISTS `ISPCORDSYS`.`CLASS`
  (
      classid INT PRIMARY KEY AUTO_INCREMENT,
      classname VARCHAR(100) NOT NULL,
      userid INT,
      FOREIGN KEY (userid) REFERENCES USER(userid)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
       created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
       modified_at DATETIME DEFAULT CURRENT_TIMESTAMP


  );

  INSERT INTO `ISPCORDSYS`.`CLASS`(classname,userid)
    VALUES
    ('BSCS',1),
    ('MCS',3),
    ('BSIT',1),
    ('ADPIT',2),
    ('MIT',1);

    /* create semester table*/

    CREATE TABLE IF NOT EXISTS `ISPCORDSYS`.`SEMESTER`
    (
        semesterid INT PRIMARY KEY AUTO_INCREMENT,
        semestername VARCHAR(50) NOT NULL,
        userid INT,
        classid INT,
        FOREIGN KEY (userid) REFERENCES USER(userid)
         ON UPDATE CASCADE
         ON DELETE CASCADE ,
        FOREIGN KEY (classid) REFERENCES CLASS(classid)
         ON UPDATE CASCADE
          ON DELETE CASCADE,
         created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
         modified_at DATETIME DEFAULT CURRENT_TIMESTAMP


    );
    /* insert values in semester table*/
    INSERT INTO `ISPCORDSYS`.`SEMESTER`(semestername,userid,classid)
      VALUES
      ('1',1,3),
      ('2',2,2),
      ('3',3,1),
      ('4',1,3),
      ('5',1,2),
      ('6',1,1),
      ('7',1,2),
      ('8',1,1);



/* create subject table*/

CREATE TABLE IF NOT EXISTS `ISPCORDSYS`.`SUBJECT`
(
      subjectid INT PRIMARY KEY AUTO_INCREMENT,
      subjectname VARCHAR(100) NOT NULL,
      subjectcode VARCHAR(50) NOT NULL,
      userid INT,
      FOREIGN KEY (userid) REFERENCES USER (userid)
      ON UPDATE CASCADE
      ON DELETE CASCADE,
      created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
      modified_at DATETIME DEFAULT CURRENT_TIMESTAMP


);

INSERT INTO `ISPCORDSYS`.`SUBJECT`(subjectname,subjectcode,userid)
  VALUES
  ('NumericalComputing','cs-208',2),
  ('WebEngineering','cs-209', 3),
  ('Human Resource Managment','cs-210', 1),
  ('Design and Algorithum','cs-88',1),
  ('Advance Database','cs-66',1),
  ('Database','cs-33',1),
  ('Software Engineering','cs-88',1),
  ('Advance Opp','cs-44',1),
  ('Object Oriented Programming','cs-121',1),
  ('Introduction to C','cs-13',1);





  /* create semester block*/
   CREATE TABLE IF NOT EXISTS `ISPCORDSYS`.`BLOCK`
    (

        blockid INT PRIMARY KEY AUTO_INCREMENT,
        blockname VARCHAR(50) NOT NULL,
        userid INT,
        FOREIGN KEY (userid) REFERENCES USER(userid)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
        created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
        modified_at DATETIME DEFAULT CURRENT_TIMESTAMP


  );

/* insert values in block table*/
 INSERT INTO `ISPCORDSYS`.`BLOCK`(blockname,userid)
  VALUES
  ('Block-A',3),
  ('Block-B',2);

  /*create flour table*/
CREATE TABLE IF NOT EXISTS`ISPCORDSYS`.`FLOOR`
(
     floorid INT PRIMARY KEY AUTO_INCREMENT,
     floorname VARCHAR(50) NOT NULL,
     userid INT,
     FOREIGN KEY (userid) REFERENCES USER(userid)
     ON UPDATE CASCADE
     ON DELETE CASCADE,
     created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
     modified_at DATETIME DEFAULT CURRENT_TIMESTAMP
);
  /*insert values into flour table*/

  INSERT INTO `ISPCORDSYS`.`FLOOR`(floorname,userid)
  VALUES
  ('GF',1),
  ('FF',1),
  ('SF',1),
  ('TF',1);

  /*create room table*/
CREATE TABLE IF NOT EXISTS`ISPCORDSYS`.`ROOM`
(
   roomid INT PRIMARY KEY AUTO_INCREMENT,
   roomname VARCHAR(50) NOT NULL,
   userid INT,
   FOREIGN KEY (userid) REFERENCES USER(userid)
   ON UPDATE CASCADE
   ON DELETE CASCADE,
   created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
   modified_at DATETIME DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO `ISPCORDSYS`.`ROOM`(roomname,userid)
VALUES
('1',1),
('2',1),
('3',1),
('4',1),
('5',1),
('6',1),
('7',1),
('8',1),
('9',1);


/* create section table*/
CREATE TABLE IF NOT EXISTS `ISPCORDSYS`.`SECTION`
 (

     sectionid INT PRIMARY KEY AUTO_INCREMENT,
     sectionname VARCHAR(50) NOT NULL,
     userid INT,
     FOREIGN KEY (userid) REFERENCES USER(userid)
     ON UPDATE CASCADE
     ON DELETE CASCADE,
     created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
     modified_at DATETIME DEFAULT CURRENT_TIMESTAMP


);
 /* insert values in section table*/
INSERT INTO `ISPCORDSYS`.`SECTION`(sectionname,userid)
  VALUES
  ('A',1),
  ('B',2),
  ('c',3);

    /* create table gender*/
CREATE TABLE IF NOT EXISTS `ISPCORDSYS`.`GENDER`
(
     genderid INT PRIMARY KEY AUTO_INCREMENT,
     gender VARCHAR(50) NOT NULL,
     userid INT ,
     foreign key (userid) REFERENCES USER(userid)
     ON UPDATE CASCADE
     ON DELETE CASCADE,
     created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
     modified_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO `ISPCORDSYS`.`GENDER`(gender,userid)
  VALUES
  ('Male',1),
  ('FeMale',2);




/* create teacher table*/

CREATE TABLE IF NOT EXISTS `ISPCORDSYS`.`TEACHER`
(
    teacherid INT PRIMARY KEY AUTO_INCREMENT,
    teachername VARCHAR(100) NOT NULL,
    teacherstatus VARCHAR(30) NOT NULL,
    userid INT,
    genderid INT,
    FOREIGN KEY (userid) REFERENCES USER(userid)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
    FOREIGN KEY (genderid) REFERENCES GENDER(genderid)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    modified_at DATETIME DEFAULT CURRENT_TIMESTAMP


);






/* insert values in teacher table*/
INSERT INTO `ISPCORDSYS`.`TEACHER`(teachername,userid,genderid)
  VALUES
  ('SIR zia-ur-rehman',1,1),
  ('SIR Nouman Farooq',1,1),
  ('SIR Zeeshan Ali',1,1),
  ('SIR Haris',1,1),
  ('SIR Abdullah Shah',1,1);


  create table `ISPCORDSYS`.`TEACHERSTATUS`
  (
    
     statusid INT PRIMARY KEY AUTO_INCREMENT,
     status VARCHAR(100),
     userid INT,
    FOREIGN key (userid) REFERENCES USER(userid)
    ON UPDATE CASCADE
    on DELETE CASCADE,
    created_at DATETIME DEFAULT current_timestamp,
    modified_at DATETIME DEFAULT current_timestamp
);

  INSERT INTO `ISPCORDSYS`.`TEACHERSTATUS`
  (status,userid)
  VALUES
  ('permanent',1),
  ('visiting',1);





/* create table day*/

CREATE TABLE IF NOT EXISTS `ISPCORDSYS`.`DAY`
(
      dayid INT PRIMARY KEY AUTO_INCREMENT,
     dayname VARCHAR(50) NOT NULL,
     userid INT,
    FOREIGN KEY (userid) REFERENCES USER(userid)
    ON UPDATE CASCADE
    ON DELETE CASCADE,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    modified_at DATETIME DEFAULT CURRENT_TIMESTAMP


);
/* insert values in day table*/
INSERT INTO `ISPCORDSYS`.`DAY`(dayname,userid)
  VALUES

  ('Monday',1),
  ('Tuesday',3),
  ('Wednesday',2),
  ('Thrusday',1),
  ('Friday',3),
  ('Saturday',3),
  ('Sunday',2);

  /* create table time */

  CREATE TABLE IF NOT EXISTS `ISPCORDSYS`.`LECTURE_TIME`
    (
        lecturetimeid INT PRIMARY KEY AUTO_INCREMENT,
        starttime VARCHAR(50) NOT NULL,
        endtime VARCHAR(50) NOT NULL,
        userid INT,
        FOREIGN KEY (userid) REFERENCES USER(userid)
        ON UPDATE CASCADE
        ON DELETE CASCADE,
        created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
        modified_at DATETIME DEFAULT CURRENT_TIMESTAMP

);

    /* insert values into time table*/

    INSERT INTO `ISPCORDSYS`.`LECTURE_TIME`(starttime,endtime,userid)
      VALUES
      ('9:00AM','11:30PM',2),
      ('1:00pm','3:30PM',3),
      ('4:00PM','6:00PM',1),
      ('6:00PM','8:00PM',1),
      ('9:00AM','11:00AM',1),
      ('11:00AM','1:00PM',1),
      ('1:00PM','3:00PM',1),
      ('3:00PM','5:00PM',1);


CREATE TABLE IF NOT EXISTS `ISPCORDSYS`.`TIMETABLE`
(
            userid INT,
            subjectid INT,
            classid INT,
            sectionid INT,
            blockid INT,
            floorid INT,
            roomid INT,
            semesterid INT,
            teacherid INT,
            dayid INT,
            lecturetimeid INT,
             FOREIGN KEY (userid) REFERENCES USER (userid),
             FOREIGN KEY (subjectid) REFERENCES SUBJECT (subjectid),
             FOREIGN KEY (classid) REFERENCES CLASS (classid),
             FOREIGN KEY (sectionid) REFERENCES SECTION (sectionid),
             FOREIGN KEY (blockid) REFERENCES BLOCK (blockid),
             FOREIGN KEY (floorid) REFERENCES FLOOR (floorid),
             FOREIGN KEY (roomid) REFERENCES ROOM (roomid),
             FOREIGN KEY (semesterid) REFERENCES SEMESTER (semesterid),
             FOREIGN KEY (teacherid) REFERENCES TEACHER (teacherid),
             FOREIGN KEY (dayid) REFERENCES DAY (dayid),
            FOREIGN KEY (lecturetimeid) REFERENCES LECTURE_TIME (lecturetimeid),
            created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
            modified_at DATETIME DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO `ISPCORDSYS`.`TIMETABLE`
(userid,subjectid,classid,sectionid,blockid,floorid,roomid,semesterid,teacherid,dayid,lecturetimeid)
VALUES
(1,1,1,1,1,3,2,1,1,1,1),
(2,2,2,2,2,2,3,2,2,2,2),
(1,3,1,1,1,3,4,2,2,2,2),
(1,4,1,2,1,1,6,4,4,4,2);

