//VENDOR 
create table Vendor (
v_code int not null unique, 
v_name varchar(35) not null,
v_contact varchar(15) not null,
v_areacode char(3) not null,
v_phone char(8) not null,
v_state char(2) not null,
v_order char(1) not null,
primary key (v_code));

INSERT INTO VENDOR (V_CODE, V_NAME, V_CONTACT, V_AREACODE, V_PHONE, V_STATE, V_ORDER) VALUES
  ('21225','Bryson, Inc.','Smithson','615','223-3234','TN','Y'),
  ('21226','SuperLoo, Inc.','Flushing','904','215-8995','FL','N'),
  ('21231','D&E Supply','Singh','615','228-3245','TN','Y'),
  ('21344','Gomez Bros.','Ortega','615','889-2546','KY','N'),
  ('22567','Dome Supply','Smith','901','678-1419','GA','N'),
  ('23119','Randsets Ltd.','Anderson','901','678-3998','GA','Y'),
  ('24004','Brackman Bros.','Browning','615','228-1410','TN','N'),
  ('24288','ORDVA, Inc.','Hakford','615','898-1234','TN','Y'),
  ('25443','B&K, Inc.','Smith','904','227-0093','FL','N'),
  ('25501','Damal Supplies','Smythe','615','890-3529','TN','N'),
  ('25595','Rubicon Systems','Orton','904','456-0092','FL','Y');


//PRODUCT
create table Product(
p_code varchar(10) not null unique,
p_descript varchar(35) not null,
p_indate date not null,
p_qoh smallint not null,
p_min smallint not null, 
p_price number(8,2) not null,
p_discount number(5,2) not null,
v_code integer,
primary key (p_code),
foreign key (v_code) references vendor (v_code) on update cascade);

INSERT INTO PRODUCT(P_CODE, P_DESCRIPT, P_INDATE, P_QOH, P_MIN, P_PRICE, P_DISCOUNT, V_CODE) VALUES
  ('11QER/31','Power painter, 15 psi., 3-nozzle','2015-11-3','8','5','109.99','0','25595'),
  ('13-Q2/P2','7.25-in. pwr. saw blade',         '2015-12-13','32','15', '14.99','0.05','21344'),
  ('14-Q1/L3','9.00-in. pwr. saw blade',         '2015-11-13','18','12','17.49','0','21344'),
  ('1546-QQ2','Hrd. cloth, 1/4-in., 2x50',       '2016-1-15','15','8','39.95','0','23119'),
  ('1558-QW1','Hrd. cloth, 1/2-in., 3x50',       '2016-1-15','23','5','43.99','0','23119'),
  ('2232/QTY','B\&D jigsaw, 12-in. blade',       '2015-12-30','8','5','109.92','0.05','24288'),
  ('2232/QWE','B\&D jigsaw, 8-in. blade',        '2015-12-24','6','5','99.87','0.05','24288'),
  ('2238/QPD','B\&D cordless drill, 1/2-in.',    '2016-1-20','12','5','38.95','0.05','25595'),
  ('23109-HB','Claw hammer',                     '2016-1-20','23','10','9.95','0.1','21225'),
  ('23114-AA','Sledge hammer, 12 lb.',           '2016-1-2','8','5','14.40','0.05', NULL),
  ('54778-2T','Rat-tail file, 1/8-in. fine',     '2015-12-15','43','20','4.99','0','21344'),
  ('89-WRE-Q','Hicut chain saw, 16 in.',         '2016-2-7','11','5','256.99','0.05','24288'),
  ('PVC23DRT','PVC pipe, 3.5-in., 8-ft',         '2016-2-20','188','75','5.87','0', NULL),
  ('SM-18277','1.25-in. metal screw, 25',        '2016-3-1','172','75','6.99','0','21225'),
  ('SW-23116','2.5-in. wd. screw, 50',           '2016-2-24','237','100','8.45','0','21231'),
  ('WR3/TT3','Steel matting, 4''x8''x1/6", .5" mesh','2016-1-17','18','5','119.95','0.1','25595');


//ANSWERS TO QUESTIONS

//1-a
SELECT * from VENDOR

//1-b
SELECT p_code, p_descript, p_indate from product where YEAR(p_indate) > 2009


//2 - a
SELECT V_CODE, V_NAME, V_CONTACT, V_AREACODE, V_PHONE, V_STATE, V_ORDER FROM Vendor WHERE V_ORDER = 'N';

//2-b
SELECT V_CODE, V_NAME, V_CONTACT, V_AREACODE, V_PHONE, V_STATE, V_ORDER FROM Vendor WHERE V_ORDER = 'N' AND V_AREACODE in ('901' , '615');

//2-c

//2-d
SELECT P_CODE, P_DESCRIPT, P_INDATE, P_QOH, P_MIN, P_PRICE, P_DISCOUNT, V_CODE FROM Product where P_INDATE > '2009-12-30';

//2-e
SELECT P_CODE, P_DESCRIPT, P_QOH, P_PRICE FROM Product where P_QOH < '40';


//3	
CREATE TABLE EMPLOYEE(
ID varchar(4) not null unique,
lastName varchar(20) not null,
firstName varchar(20),
middleInitial char(1),
birthdate date not null,
departmentCode smallint(3) not null,	
salary numeric(7,2) default = 20000.00,
primary key (ID),
foreign key departmentCode REFERENCES DEPARTMENT(departmentCode);

CREATE TABLE Department (
    departmentCode SMALLINT(3) NOT NULL PRIMARY KEY
);

INSERT INTO Department (departmentCode) VALUES (222), (312), (412);

insert into employee values( ID, lastName, firstName, middleInitial, birthdate, departmentCode, salary) VALUES 
	('E001', 'Smith', 'John', 'A', '1980-05-15', 222, 25000.00),
	('E002', 'Johnson', 'Emily', 'B', '1990-07-22', 312, 30000.00),
	( 'E003', 'Williams', 'Michael', 'C', '1985-03-30', 412, default);
