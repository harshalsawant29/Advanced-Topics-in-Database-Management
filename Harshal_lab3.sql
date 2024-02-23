SELECT extnum, SUM(dbms_lob.getlength(awlob)) bytes 
FROM EXPRESS.aw$global
GROUP BY extnum;


select * from ALL_AWS;




SELECT owner, object_name, created, status FROM ALL_objects 
WHERE object_name LIKE 'AW$%' AND object_name!='AW$' 	
GROUP BY owner, object_name, created, status 
ORDER BY owner, object_name;





SELECT comp_name, version, status FROM dba_REGISTRY 
WHERE comp_name LIKE '%OLAP%';
