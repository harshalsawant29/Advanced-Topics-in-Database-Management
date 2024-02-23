--------------- project one ---------------





------------------------- Project two --------------

-----------Step one --------------

---------1 -----------
CREATE TABLE countries
 			(COUNTRY_ID CHAR(2) NOT NULL,
 			COUNTRY_NAME VARCHAR2(40),
 			REGION_ID NUMBER);
Commit;

------------ 2 ------------
INSERT INTO countries(COUNTRY_ID, COUNTRY_NAME, REGION_ID)
		VALUES ('CA','Canada', 2);

		INSERT INTO countries(COUNTRY_ID, COUNTRY_NAME, REGION_ID)
		VALUES ('DE','Germany', 1);

		INSERT INTO countries(COUNTRY_ID, COUNTRY_NAME, REGION_ID)
		VALUES ('UK','United Kingdom', 1);

		INSERT INTO countries(COUNTRY_ID, COUNTRY_NAME, REGION_ID)
		VALUES ('US','United States of America', 2);

		INSERT INTO countries(COUNTRY_ID, COUNTRY_NAME, REGION_ID)
		VALUES ('IN','India', 3);
        Commit;
        
---------------- 3 ---------------

Commit; 
    SELECT * FROM countries;

---------------- 3a ----------

INSERT INTO countries(COUNTRY_ID, COUNTRY_NAME, REGION_ID)
    VALUES ('GR', 'Greece',1);
	Commit;

------------- 3b ------------

SAVEPOINT  HS_countries_1;

------------- 3c -------------

INSERT INTO countries(COUNTRY_ID, COUNTRY_NAME, REGION_ID)
		VALUES ('MX', 'Mexico',2); 

		SELECT * FROM countries;

		ROLLBACK to HS_countries_1;

		SELECT * FROM countries;

		INSERT INTO countries(COUNTRY_ID, COUNTRY_NAME, REGION_ID)
		VALUES ('MX', 'Mexico', 2); 

		Commit;

--------------- 4 ---------------

INSERT INTO countries(COUNTRY_ID, COUNTRY_NAME, REGION_ID)
		VALUES ('SP', 'Spain', 1); 

SAVEPOINT  HS_countries_2;

SELECT * FROM countries;

---------------- 5 ------------

INSERT INTO countries(COUNTRY_ID,COUNTRY_NAME,REGION_ID)
		VALUES ('NT', 'Netherlands',1); 
        
-------------- 5a -----------------

Rollback to HS_countries_2;

	SELECT * FROM countries;

--------------- 5b -------------

Rollback to HS_countries_1;

---------------- Project three -------------

---------- 1 ----------

ALTER TABLE employees RENAME TO employ;

------ 2 ---------

CREATE TABLE backup_employ AS
    SELECT * FROM employ;
    
---------- 3 -----------

CREATE SYNONYM emp_data for employ;


------------Project 4 -----

------------- a -----------

PURGE recyclebin;

--------------------- b ---------------

SHOW RECYCLEBIN;

------------- c -------------

CREATE TABLE TEST_RBIN(VAL   NUMBER);

INSERT INTO TEST_RBIN(VAL) VALUES(10);

COMMIT;

SELECT * FROM TEST_RBIN;

DROP TABLE TEST_RBIN;

SELECT * FROM recyclebin;


----------------- d -------------

FLASHBACK TABLE TEST_RBIN TO BEFORE DROP;

SELECT * FROM TEST_RBIN;

--------------- e ---------------

-------------- 1 ---------

CREATE table abcTab 
(numID number(3),
 name varchar2(15));
     INSERT INTO abcTab
      Values (10, 'Kay');
     INSERT INTO abcTab
      Values (11, 'Luke');
     INSERT INTO abcTab
      Values (12, 'Jim');
      
------------- 2 -----------

Drop Table abcTab;

------------ 3 -------------

CREATE table abcTab 
(numID number(3),
 name varchar2(15));
     INSERT INTO abcTab
      Values (10, 'Kay');
     INSERT INTO abcTab
      Values (11, 'Luke');
     INSERT INTO abcTab
      Values (12, 'Jim');

---------- 4 ----------------

Drop Table abcTab;


------------ 5 ----------

SELECT * FROM recyclebin;

