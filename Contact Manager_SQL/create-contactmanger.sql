DROP DATABASE IF EXISTS ContactManager;
CREATE DATABASE ContactManager;

-- Creating Company Schema
USE ContactManager;

DROP TABLE IF EXISTS CONTACTPERSON;
CREATE TABLE CONTACTPERSON (
  contactid int  AUTO_INCREMENT,
  firstname varchar(20) NOT NULL,
  middlename varchar(20),
  lastname varchar(20) NOT NULL,
  dateofbirth date ,
  gender char,
  constraint pk_contactperson primary key(contactid),
  constraint check_date_of_birth CHECK (dateofbirth between DATE'1900-01-01' and sysdate),
  CHECK (gender IN('F','M'))
);

CREATE INDEX index_contactperson on CONTACTPERSON (FirstName,LastName);


DROP TABLE IF EXISTS EMAILADDRESS;
CREATE TABLE EMAILADDRESS (
  contactid int ,
  emailId  varchar(50) NOT NULL ,
  emailType varchar(50),
  CONSTRAINT pk_emailaddress primary key (contactid,emailId),
  CONSTRAINT fk_emailaddress_contactperson  foreign key (contactid) references CONTACTPERSON (contactid) ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS PHONENUMBER;
CREATE TABLE PHONENUMBER(
  contactid int ,
  phonenumber varchar(10) NOT NULL ,
  areacode varchar(5),
  phonetype varchar(20),
  CONSTRAINT pk_phonenumber primary key (contactid,phonenumber,phonetype),
  CONSTRAINT fk_phonenumber_contactperson  foreign key (contactid) references CONTACTPERSON (contactid) ON DELETE CASCADE ON UPDATE CASCADE
);

DROP TABLE IF EXISTS ADDRESS;
CREATE TABLE ADDRESS(
  contactid int ,
  street varchar(50),
  houseno varchar(50),
  city varchar(50),
  state varchar(50),
  country varchar(50),
  addresstype varchar(50) NOT NULL,
  CONSTRAINT pk_address primary key (contactid,addresstype),
  CONSTRAINT fk_address_contactperson  foreign key (contactid) references CONTACTPERSON (contactid) ON DELETE CASCADE ON UPDATE CASCADE
);


DROP TABLE IF EXISTS FAMILY;
CREATE TABLE  FAMILY(
  contactid int ,
  familyname varchar(50) NOT NULL ,
  constraint pk_family primary key(contactid,familyname) ,
  constraint fk_family_contactperson foreign key (contactid) references CONTACTPERSON(contactid) ON DELETE CASCADE ON UPDATE CASCADE
);



DROP TABLE IF EXISTS APPOINTMENT;
CREATE TABLE APPOINTMENT(
  contactid int ,
  place varchar(50),
  apptdate date,
  appttime time,
  CONSTRAINT pk_appointment primary key (contactid,apptdate,appttime),
  CONSTRAINT fk_appointment_contactperson  foreign key (contactid) references CONTACTPERSON (contactid) ON DELETE CASCADE ON UPDATE CASCADE
);

