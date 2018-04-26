DELIMITER $$

USE ContactManager$$

DROP PROCEDURE IF EXISTS sp_updateuser$$

CREATE PROCEDURE sp_updateuser(
 IN cid integer
 , IN fname varchar(20)
, IN mname varchar(20)
, IN lname varchar(20)
, IN phnum varchar(10)
, IN arcd varchar(5)
, IN phty varchar(20)
, IN emlId  varchar(50)
, IN emlTyp varchar(50)
,IN  stret varchar(50)
,IN  hno varchar(50)
,IN  cty varchar(50)
,IN  stat varchar(50)
,In  county varchar(50)
,IN  addrtype varchar(50)
, IN sex char
, IN dob date
,IN aptdate date
,IN apttime time
,IN plce varchar(50)
, IN flyname varchar(50)

)
BEGIN
update CONTACTPERSON 
set firstname=fname,middlename=mname,lastname=lname ,dateofbirth=dob,gender=sex
where contactid=cid;

update EMAILADDRESS
set  emailId=emlId ,emailType= emlTyp
where contactid=cid;

update  PHONENUMBER
set phonenumber=phnum ,areacode=arcd ,phonetype=phty
where contactid=cid;


update ADDRESS
set street=stret ,houseno= hno,city=cty ,state=stat,country=county,addresstype=addrtype
where contactid=cid;
 
 update  FAMILY
 set familyname=flyname
 where contactid=cid;
 
  update  APPOINTMENT
  set   place=plce,apptdate=aptdate,appttime=apttime
  where contactid=cid;

 
 
    
END$$
# change the delimiter back to semicolon
DELIMITER ;



