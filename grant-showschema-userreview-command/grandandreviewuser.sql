


-- show command for schema db owner
select user from dual;

select username from all_users;


username in ('XS$NULL', 'MILAD', 'APEX_040000', 'APEX_PUBLIC_USER', 'FLOWS_FILES', 'HR', 'MDSYS', 'ANONYMOUS', 'XDB', 'CTXSYS', 'APPQOSSYS', 'DBSNMP')


-- review all grant for a schema 


grant connect , dba , resource to milad;

SELECT * FROM DBA_SYS_PRIVS WHERE GRANTEE = 'MILAD';


SELECT * FROM USER_SYS_PRIVS;


SELECT * FROM DBA_SYS_PRIVS WHERE GRANTEE = 'MILAD';
SELECT * FROM DBA_ROLE_PRIVS WHERE GRANTEE = 'MILAD';
SELECT * FROM DBA_TAB_PRIVS WHERE GRANTEE = 'MILAD';



