

--Current User Tables command in plsql

select table_name from user_tables;

TABLE_NAME:
HR_C_BPARTNERS
AD_CLIENT
INVENTORIES
REGIONS
COUNTRIES
LOCATIONS
WAREHOUSES
EMPLOYEES
PRODUCT_CATEGORIES
PRODUCTS
CUSTOMERS
CONTACTS
ORDERS
ORDER_ITEMS


--All Accessible Tables command in plsql
select owner,table_name from all_tables;

--All Database Tables command in plsql
select owner,table_name from dba_tables;

-- find the table name by filter name

/*پیدا کردن جداولی که با EMP شروع می‌شوند

like 'emp%'
*/
select table_name from user_tables where table_name like 'emp%';

/*پیدا کردن جداولی که EMP در هر جایی از نام آن‌ها وجود دارد
like '%EM%';
*/
select table_name from user_tables where table_name like '%EM%';

/*پیدا کردن جداولی که با EMP تمام می‌شوند

like '%emp'
*/
select table_name from user_tables where table_name like '%emp';


/*پیدا کردن جداولی که دقیقاً EMP نام دارند

like 'emp'
*/

select table_name from user_tables where table_name = 'emp';

/*
پیدا کردن جداولی که حرف اول آن‌ها E و حرف دوم M است و بقیه هر چیزی می‌تواند باشد

like 'em_'
*/

select table_name from user_tables where table_name like 'em_';


/*
پیدا کردن جداولی که شامل حروف مشخصی هستند اما ترتیب یا تعداد خاصی ندارند
*/

select table_name from user_tables where table_name like '%e%m%p%';





