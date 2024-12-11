

-- switch system schema to my schema of milad
alter session set current_schema = milad;
HR_C_BPARTNERS

SELECT DBMS_METADATA.GET_DDL('TABLE', 'HR_C_BPARTNERS', 'MILAD') FROM DUAL;
