




/*Command to get the complete CREATE TABLE script*/

select * from all_tables where table_name = 'HR_C_BPARTNERS';

select dbms_metadata.get_ddl('table','HR_C_BPARTNERS','milad') from dual;



select dbms_metadata.get_ddl('table','HR_C_BPARTNERS') from dual;
