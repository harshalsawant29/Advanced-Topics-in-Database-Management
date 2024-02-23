create or replace PROCEDURE find_Lname
(i_employee_id IN NUMBER,
o_first_name OUT VARCHAR2,
o_last_name OUT VARCHAR2,
o_salary OUT NUMBER,
o_hiredate OUT DATE,
o_job_id OUT VARCHAR2)
AS 
BEGIN
 SELECT first_name, last_name, salary, hiredate, email
  INTO o_first_name, o_last_name, o_salary, o_hiredate, o_job_id
 FROM employees
 WHERE employee_id=i_employee_id;
EXCEPTION
 WHEN OTHERS
 THEN 
 DBMS_OUTPUT.PUT_LINE('Error in finding employee_id' || i_employee_id);
END find_Lname;

-- run procedure script as anonymous block
SET SERVEROUTPUT ON
SET VERIFY OFF
DECLARE
  v_local_first_name employees.first_name%TYPE;
  v_local_last_name employees.last_name%TYPE;
  v_local_salary employees.salary%TYPE;
  v_local_hiredate employees.hiredate%TYPE;
  v_local_job_id employees.job_id%TYPE;
BEGIN
 find_Lname
  (&employee_id, v_local_first_name, v_local_last_name, v_local_salary, v_local_hiredate, v_local_job_id);
  DBMS_OUTPUT.PUT_LINE
  ('Employee is: '||v_local_first_name||' '||v_local_last_name||'.' 
  || 'and their salary is: ' || v_local_salary || ' Employee hire date is: '||v_local_hiredate||' ' || 'Employee JOB ID: ' ||v_local_job_id);
END;
