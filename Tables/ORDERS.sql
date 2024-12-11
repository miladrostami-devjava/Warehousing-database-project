-- Create table
create table ORDERS
(
  order_id                NUMBER not null,
  hr_c_bpartner_id        NUMBER,
  ad_client_id            NUMBER,
  customer_id             NUMBER(6) not null,
  status                  VARCHAR2(20) not null,
  salesman_id             NUMBER(6),
  order_date              DATE not null,
  ad_created_by           VARCHAR2(300) not null,
  ad_updated_by           VARCHAR2(300) not null,
  ad_created_date         DATE not null,
  ad_updated_date         DATE not null,
  ad_created_sysdate_date DATE default sysdate not null,
  ad_updated_sysdate_date DATE default sysdate not null,
  ad_isactive             CHAR(1) not null,
  ad_ischecked            NUMBER(1) not null,
  ad_isrole               VARCHAR2(5) not null,
  ad_issecurity           VARCHAR2(11) not null
)
tablespace SYSTEM
  pctfree 10
  pctused 40
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
-- Create/Recreate primary, unique and foreign key constraints 
alter table ORDERS
  add primary key (ORDER_ID)
  using index 
  tablespace SYSTEM
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table ORDERS
  add constraint FK_AD_CLIENT_ID_ORDERS foreign key (AD_CLIENT_ID)
  references AD_CLIENT (AD_CLIENT_ID);
alter table ORDERS
  add constraint FK_HR_C_ID_ORDERS foreign key (HR_C_BPARTNER_ID)
  references HR_C_BPARTNERS (HR_C_BPARTNER_ID);
alter table ORDERS
  add constraint FK_ORDERS_CUSTOMERS foreign key (CUSTOMER_ID)
  references CUSTOMERS (CUSTOMER_ID) on delete cascade;
alter table ORDERS
  add constraint FK_ORDERS_EMPLOYEES foreign key (SALESMAN_ID)
  references EMPLOYEES (EMPLOYEE_ID) on delete set null;
-- Create/Recreate check constraints 
alter table ORDERS
  add check (ad_isActive in ('Y','N'));
alter table ORDERS
  add check (ad_isChecked in (1,0));
alter table ORDERS
  add check (ad_isRole in ('True','False'));
alter table ORDERS
  add check (ad_isSecurity in ('IsSecurity','NotSecurity'));
