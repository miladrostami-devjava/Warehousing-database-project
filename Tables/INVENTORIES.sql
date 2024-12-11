-- Create table
create table INVENTORIES
(
  hr_c_bpartner_id         NUMBER,
  ad_client_id             NUMBER,
  product_id               NUMBER(12) not null,
  warehouse_id             NUMBER(12) not null,
  quantity                 NUMBER(8) not null,
  inventories_created_by   VARCHAR2(300) not null,
  inventories_updated_by   VARCHAR2(300) not null,
  inventories_created_date DATE not null,
  inventories_updated_date DATE not null,
  inventories_created_sys  DATE default sysdate not null,
  inventories_updated_sys  DATE default sysdate not null,
  inventories_isactive     CHAR(1) not null,
  inventories_ischecked    NUMBER(1) not null,
  inventories_isrole       VARCHAR2(5) not null,
  inventories_issecurity   VARCHAR2(11) not null
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
alter table INVENTORIES
  add constraint PK_INVENTORIES primary key (PRODUCT_ID, WAREHOUSE_ID)
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
alter table INVENTORIES
  add constraint FK_AD_CLIENT_ID_INVENTORIES foreign key (AD_CLIENT_ID)
  references AD_CLIENT (AD_CLIENT_ID);
alter table INVENTORIES
  add constraint FK_HR_ID_INVENTORIES foreign key (HR_C_BPARTNER_ID)
  references HR_C_BPARTNERS (HR_C_BPARTNER_ID);
alter table INVENTORIES
  add constraint FK_INVENTORIES_PRODUCTS foreign key (PRODUCT_ID)
  references PRODUCTS (PRODUCT_ID) on delete cascade;
alter table INVENTORIES
  add constraint FK_INVENTORIES_WAREHOUSES foreign key (WAREHOUSE_ID)
  references WAREHOUSES (WAREHOUSE_ID) on delete cascade;
-- Create/Recreate check constraints 
alter table INVENTORIES
  add check (inventories_isActive in ('Y','N'));
alter table INVENTORIES
  add check (inventories_isChecked in (1,0));
alter table INVENTORIES
  add check (inventories_isRole in ('True','False'));
alter table INVENTORIES
  add check (inventories_isSecurity in ('IsSecurity','NotSecurity'));
