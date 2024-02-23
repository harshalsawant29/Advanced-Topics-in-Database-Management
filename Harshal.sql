CREATE TABLE tblNewData
		(
	 	  dataID NUMBER(10, 0) NOT NULL,
		  month VARCHAR2(50) NOT NULL,
		  xValue Number(5),
	 	  yValue Number(5),
		  CONSTRAINT tblNewData_pk PRIMARY KEY(dataID)
		);

INSERT INTO tblNewData(dataID, month, xValue, yValue)
		VALUES (10, 'January', 5, 7);
		INSERT INTO tblNewData(dataID, month, xValue, yValue)
		VALUES (20, 'February', 9, 11);
		INSERT INTO tblNewData(dataID, month, xValue, yValue)
		VALUES (30, 'March', 12, 17);
		INSERT INTO tblNewData(dataID, month, xValue, yValue)
		VALUES (40, 'April', 11, 16);
		INSERT INTO tblNewData(dataID, month, xValue, yValue)
		VALUES (50, 'May', 13, 21);
		INSERT INTO tblNewData(dataID, month, xValue, yValue)
		VALUES (60, 'June', 21, 14);
commit;

------script 1--------------


set serveroutput on;
		set verify off;
		DECLARE
		 v_count    Number := 0;
		 v_name     VARCHAR(50) := '&Harshal';	
		BEGIN
		-- record count
		  SELECT COUNT(*)
		  INTO v_count
		  FROM tblNewData;  	
    		  dbms_output.put_line('database report by : ' || v_name);
		  dbms_output.put_line('record count: ' || v_count);
		END;		



------script 2----

set serveroutput on;
		DECLARE
		 v_count   Number := 0;
		 v_num Number := 0;
		 v_xVal  tblNewData.xValue%type;
		BEGIN
		-- record count
		  SELECT COUNT(*)
		  INTO v_count
		  FROM tblNewData;

		-- record test
		   For i IN 1 .. v_count LOOP
		    SELECT xValue
		    INTO v_xVal 
		    FROM tblNewData
		    where dataID = i * 10;
		    if v_xVal > 11 then
		     v_num  := v_num + 1;
		   end if;
		   end LOOP;
		  -- output
    		  dbms_output.put_line('# of matching records ' || v_num);			  
              dbms_output.put_line('report by : ' || 'Harshal');
		END;


--------------------script 3 ------------------

set serveroutput on;
		DECLARE
		 v_count Number := 0;
		 v_num Number := 0;
		 v_xVal tblNewData.xValue%type;
		 v_avgX Number := 0;
		 v_avgY Number := 0;

		BEGIN
		-- average xValue
		  SELECT avg(xValue)
		  INTO v_avgX
		  FROM tblNewData;

		-- average yValue
		  SELECT avg(yValue)
		  INTO v_avgY
		  FROM tblNewData;

		  -- output
    		dbms_output.put_line('average of xValue field ' || ROUND(v_avgX,2));
		dbms_output.put_line('average of yValue field ' || ROUND(v_avgY,2));
    EXCEPTION
        WHEN ZERO_DIVIDE THEN
            dbms_output.put_line('CANNOT DIVIDE BY ZERO.');
		END;


------------ script 4 -----------------

DECLARE
  v_avgX NUMBER;
  v_avgY NUMBER;
  result VARCHAR2(50);
BEGIN
  SELECT AVG(xValue) INTO v_avgX FROM tblNewData;
  SELECT AVG(yValue) INTO v_avgY FROM tblNewData;

  IF v_avgX > v_avgY THEN
    result := 'xValue';
  ELSIF v_avgX < v_avgY THEN
    result := 'yValue';
  ELSE
    result := 'Equal Average';
  END IF;

  DBMS_OUTPUT.PUT_LINE('Average of xValue: ' || v_avgX);
  DBMS_OUTPUT.PUT_LINE('Average of yValue: ' || v_avgY);
  DBMS_OUTPUT.PUT_LINE('The greater average is in column ' || result);
END;


---------------------script 5 ------------------

DECLARE
  v_avgY NUMBER;
BEGIN
  SELECT AVG(yValue) INTO v_avgY FROM tblNewData;
  
  FOR y_row IN (SELECT yValue FROM tblNewData) LOOP
    IF y_row.yValue > v_avgY THEN
      DBMS_OUTPUT.PUT_LINE('Value ' || y_row.yValue || ' is greater than the average.');
    END IF;
  END LOOP;
END;



-------------------------- script 6 ---------------------

DECLARE
  v_weighted_sum NUMBER := 0;
  v_total_weight NUMBER := 0;
BEGIN
  FOR x_row IN (SELECT xValue, month FROM tblNewData) LOOP
    -- Assign weights to months
    CASE x_row.month
      WHEN 'January' THEN v_weighted_sum := v_weighted_sum + (x_row.xValue * 1);
      WHEN 'February' THEN v_weighted_sum := v_weighted_sum + (x_row.xValue * 2);
      WHEN 'March' THEN v_weighted_sum := v_weighted_sum + (x_row.xValue * 3);
      WHEN 'April' THEN v_weighted_sum := v_weighted_sum + (x_row.xValue * 4);
      WHEN 'May' THEN v_weighted_sum := v_weighted_sum + (x_row.xValue * 5);
      WHEN 'June' THEN v_weighted_sum := v_weighted_sum + (x_row.xValue * 6);
    END CASE;
    v_total_weight := v_total_weight + 1;
  END LOOP;
  
  IF v_total_weight > 0 THEN
    DBMS_OUTPUT.PUT_LINE('Weighted Average of xValue: ' || v_weighted_sum / v_total_weight);
  ELSE
    DBMS_OUTPUT.PUT_LINE('No data to calculate the weighted average.');
  END IF;
END;


------------------same usinig only if-------------------

DECLARE
  v_weighted_sum NUMBER := 0;
  v_total_weight NUMBER := 0;
BEGIN
  FOR x_row IN (SELECT xValue, month FROM tblNewData) LOOP
    IF x_row.month = 'January' THEN
      v_weighted_sum := v_weighted_sum + (x_row.xValue * 1);
    ELSIF x_row.month = 'February' THEN
      v_weighted_sum := v_weighted_sum + (x_row.xValue * 2);
    ELSIF x_row.month = 'March' THEN
      v_weighted_sum := v_weighted_sum + (x_row.xValue * 3);
    ELSIF x_row.month = 'April' THEN
      v_weighted_sum := v_weighted_sum + (x_row.xValue * 4);
    ELSIF x_row.month = 'May' THEN
      v_weighted_sum := v_weighted_sum + (x_row.xValue * 5);
    ELSIF x_row.month = 'June' THEN
      v_weighted_sum := v_weighted_sum + (x_row.xValue * 6);
    END IF;
    v_total_weight := v_total_weight + 1;
  END LOOP;
  IF v_total_weight > 0 THEN
    DBMS_OUTPUT.PUT_LINE('Weighted Average of xValue: ' || v_weighted_sum / v_total_weight);
  ELSE
    DBMS_OUTPUT.PUT_LINE('No data to calculate the weighted average.');
  END IF;
END;


-------------------Script 7 ---------------------------

DEFINE key_increment = 10;
BEGIN
  FOR i IN 7..12 LOOP
    INSERT INTO tblNewData (dataId, month, xValue, yValue)
    VALUES (&key_increment * i, TO_CHAR(TO_DATE(i, 'MM'), 'Month'), &key_increment * i, &key_increment * (i + 1));
  END LOOP;
  COMMIT;
END;
-- Display existing records in tblNewData
BEGIN
  FOR rec IN (SELECT * FROM tblNewData) LOOP
    DBMS_OUTPUT.PUT_LINE('Key: ' || rec.dataID || ', Month: ' || rec.month || ', xValue: ' || rec.xValue || ', yValue: ' || rec.yValue);
  END LOOP;
END;


------------------------
select * from tblnewdata;



----------------------------script 8 ------------------------

CREATE TABLE tblOldData
		(
	 	  dataID NUMBER(10, 0) NOT NULL,
		  month VARCHAR2(50) NOT NULL,
		  xValue Number(5),
	 	  yValue Number(5),
		  CONSTRAINT tblOldData_pk PRIMARY KEY(dataID)
		);
    -- Insert data into tblOldData
INSERT INTO tblOldData (Month, dataID, xValue, yValue) VALUES ('January', 10, 6, 12);
INSERT INTO tblOldData (Month, dataID, xValue, yValue) VALUES ('February', 20, 7, 10);
INSERT INTO tblOldData (Month, dataID, xValue, yValue) VALUES ('March', 30, 9, 12);
INSERT INTO tblOldData (Month, dataID, xValue, yValue) VALUES ('April', 40, 9, 11);
INSERT INTO tblOldData (Month, dataID, xValue, yValue) VALUES ('May', 50, 10, 15);
INSERT INTO tblOldData (Month, dataID, xValue, yValue) VALUES ('June', 60, 12, 19);
INSERT INTO tblOldData (Month, dataID, xValue, yValue) VALUES ('July', 70, 16, 22);
INSERT INTO tblOldData (Month, dataID, xValue, yValue) VALUES ('August', 80, 10, 18);
INSERT INTO tblOldData (Month, dataID, xValue, yValue) VALUES ('September', 90, 10, 30);
INSERT INTO tblOldData (Month, dataID, xValue, yValue) VALUES ('October', 100, 11, 17);
INSERT INTO tblOldData (Month, dataID, xValue, yValue) VALUES ('November', 110, 14, 14);
INSERT INTO tblOldData (Month, dataID, xValue, yValue) VALUES ('December', 120, 16, 20);
Commit;
select * from tblolddata;





----------------script 9 ----------------

DECLARE
  v_xValOld NUMBER;
  v_xValNew NUMBER;
  v_yValOld NUMBER;
  v_yValNew NUMBER;
  v_month VARCHAR2(20);
BEGIN
  FOR rec IN (SELECT o.xValue AS xValOld, n.xValue AS xValNew, o.yValue AS yValOld, n.yValue AS yValNew, o.Month
              FROM tblOldData o
              JOIN tblNewData n ON o.dataID = n.dataID) LOOP

    v_xValOld := rec.xValOld;
    v_xValNew := rec.xValNew;
    v_yValOld := rec.yValOld;
    v_yValNew := rec.yValNew;
    v_month := rec.Month;
 IF v_xValOld > v_xValNew THEN
      DBMS_OUTPUT.PUT_LINE(v_month || ': Old table x (' || v_xValOld || ') exceeds new table x (' || v_xValNew || ')');
    ELSIF v_xValOld < v_xValNew THEN
      DBMS_OUTPUT.PUT_LINE(v_month || ': Old table x (' || v_xValOld || ') falls below new table x (' || v_xValNew || ')');
    ELSE
      DBMS_OUTPUT.PUT_LINE(v_month || ': Old table x (' || v_xValOld || ') is equal to new table x (' || v_xValNew || ')');
    END IF;
    IF v_yValOld > v_yValNew THEN
      DBMS_OUTPUT.PUT_LINE(v_month || ': Old table y (' || v_yValOld || ') exceeds new table y (' || v_yValNew || ')');
    ELSIF v_yValOld < v_yValNew THEN
      DBMS_OUTPUT.PUT_LINE(v_month || ': Old table y (' || v_yValOld || ') falls below new table y (' || v_yValNew || ')');
    ELSE
      DBMS_OUTPUT.PUT_LINE(v_month || ': Old table y (' || v_yValOld || ') is equal to new table y (' || v_yValNew || ')');
    END IF;
  END LOOP;
END;



--------------- script 10 ---------

PROMPT Enter your name:
ACCEPT v_me CHAR
DECLARE
  v_sum_of_squares_x_old NUMBER := 0;
  v_sum_of_squares_y_old NUMBER := 0;
  v_sum_of_squares_x_new NUMBER := 0;
  v_sum_of_squares_y_new NUMBER := 0;
BEGIN
  SELECT SUM(xValue * xValue) INTO v_sum_of_squares_x_old FROM tblOldData;
  SELECT SUM(yValue * yValue) INTO v_sum_of_squares_y_old FROM tblOldData;

  SELECT SUM(xValue * xValue) INTO v_sum_of_squares_x_new FROM tblNewData;
  SELECT SUM(yValue * yValue) INTO v_sum_of_squares_y_new FROM tblNewData;

  DBMS_OUTPUT.PUT_LINE('Sum of squares analysis performed by ' || '&v_me');
  DBMS_OUTPUT.PUT_LINE('Sum of squares for xValue in tblOldData: ' || v_sum_of_squares_x_old);
  DBMS_OUTPUT.PUT_LINE('Sum of squares for yValue in tblOldData: ' || v_sum_of_squares_y_old);
  DBMS_OUTPUT.PUT_LINE('Sum of squares for xValue in tblNewData: ' || v_sum_of_squares_x_new);
  DBMS_OUTPUT.PUT_LINE('Sum of squares for yValue in tblNewData: ' || v_sum_of_squares_y_new);
END;

-------------------------- Step 4 -----------

---------------1----------
ALTER SESSION SET PLSQL_WARNINGS='ENABLE:ALL';

------------ 2 ----------------
--done above in script 3---

--------------- 3 ----------
ALTER SESSION SET PLSQL_WARNINGS='DISABLE:ALL';

-------------- 4 -----------------

SET SERVEROUTPUT on; 
DECLARE
  starting_time  TIMESTAMP WITH TIME ZONE;
  ending_time    TIMESTAMP WITH TIME ZONE;
BEGIN
  -- Invokes SQRT for every row of employees table:
 
  SELECT SYSTIMESTAMP INTO starting_time FROM DUAL;
 
  FOR item IN (
    SELECT DISTINCT(SQRT(department_id)) col_alias
    FROM employees
    ORDER BY col_alias
  )
  LOOP
    DBMS_OUTPUT.PUT_LINE('Square root of dept. ID = ' || item.col_alias);
  END LOOP;
 
  SELECT SYSTIMESTAMP INTO ending_time FROM DUAL;
 
  DBMS_OUTPUT.PUT_LINE('Time = ' || TO_CHAR(ending_time - starting_time));
 
  -- Invokes SQRT for every distinct department_id of employees table:
 
  SELECT SYSTIMESTAMP INTO starting_time FROM DUAL;
 
  FOR item IN (
    SELECT SQRT(department_id) col_alias
    FROM (SELECT DISTINCT department_id FROM employees)
    ORDER BY col_alias
  )
  LOOP
    IF item.col_alias IS NOT NULL THEN
      DBMS_OUTPUT.PUT_LINE('Square root of dept. ID = ' || item.col_alias);
    END IF;
  END LOOP;
 
  SELECT SYSTIMESTAMP INTO ending_time FROM DUAL;
 
  DBMS_OUTPUT.PUT_LINE('Time = ' || TO_CHAR(ending_time - starting_time));
END;


