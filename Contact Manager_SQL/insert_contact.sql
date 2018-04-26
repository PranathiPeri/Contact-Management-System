DELIMITER $$

USE ContactManager$$

DROP PROCEDURE IF EXISTS sp_insertuser$$

CREATE PROCEDURE sp_insertuser(
  IN firstname varchar(20)
, IN middlename varchar(20)
, IN lastname varchar(20)
, IN phonenumber varchar(10)
, IN areacode varchar(5)
, IN phonetype varchar(20)
, IN emailId  varchar(50)
, IN emailType varchar(50)
,IN  street varchar(50)
,IN  houseno varchar(50)
,IN  city varchar(50)
,IN  state varchar(50)
,In  country varchar(50)
,IN  addresstype varchar(50)
, IN gender char
, IN dateofbirth date
,IN apptdate date
,IN appttime time
,IN place varchar(50)
, IN familyname varchar(50)

)
BEGIN

INSERT INTO CONTACTPERSON
(firstname,middlename,lastname,dateofbirth,gender) values
  (firstname,middlename,lastname,dateofbirth,gender);
  
  INSERT INTO EMAILADDRESS
(contactid,emailId,emailType) values
  (last_insert_id(),emailId,emailType);
  
   INSERT INTO PHONENUMBER
(contactid,phonenumber,areacode,phonetype) values
  (last_insert_id(),phonenumber,areacode,phonetype);
  
 INSERT INTO ADDRESS
 (contactid,street,houseno,city,state,country,addresstype) values
 (last_insert_id(),street,houseno,city,state,country,addresstype);
 
 INSERT INTO  FAMILY
 (contactid ,familyname ) values
 (last_insert_id(),familyname );
 

 
 INSERT INTO  APPOINTMENT
 (contactid , place ,apptdate,appttime) values
 (last_insert_id(),place,apptdate,appttime);
 
 
    
END$$
# change the delimiter back to semicolon
DELIMITER ;


select * from contactperson;
select * from appointment;
select * from  phonenumber;
