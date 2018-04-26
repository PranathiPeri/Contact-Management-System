 USE ContactManager;

DROP VIEW IF EXISTS vw_update_contact_details;
 
 create VIEW  vw_update_contact_details as 
 select c.contactid,c.firstname,c.middlename,c.lastname,c.dateofbirth,
 c.gender,e.emailId,e.emailType,p.phonenumber,p.areacode,p.phonetype,
 a.street,a.houseno,a.city,a.state,a.country,a.addresstype,f.familyname,ap.apptdate,ap.appttime,ap. place 
 from contactperson c join emailaddress e on c.contactid=e.contactid
 join phonenumber p  on c.contactid=p.contactid join address a on c.contactid=a.contactid join family f on c.contactid=f.contactid join  appointment ap on c.contactid=ap.contactid;
  
 
 
 select * from vw_update_contact_details