-- Create table
create table ORDER_ITEMS
(
  hr_c_bpartner_id        NUMBER,
  ad_client_id            NUMBER,
  order_id                NUMBER(12) not null,
  item_id                 NUMBER(12) not null,
  product_id              NUMBER(12) not null,
  quantity                NUMBER(8,2) not null,
  unit_price              NUMBER(8,2) not null,
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
alter table ORDER_ITEMS
  add constraint PK_ORDER_ITEMS primary key (ORDER_ID, ITEM_ID)
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
alter table ORDER_ITEMS
  add constraint FK_AD_CLIENT_ID_ORDER_ITEMS foreign key (AD_CLIENT_ID)
  references AD_CLIENT (AD_CLIENT_ID);
alter table ORDER_ITEMS
  add constraint FK_HR_C_ID_ORDER_ITEMS foreign key (HR_C_BPARTNER_ID)
  references HR_C_BPARTNERS (HR_C_BPARTNER_ID);
alter table ORDER_ITEMS
  add constraint FK_ORDER_ITEMS_ORDERS foreign key (ORDER_ID)
  references ORDERS (ORDER_ID) on delete cascade;
alter table ORDER_ITEMS
  add constraint FK_ORDER_ITEMS_PRODUCTS foreign key (PRODUCT_ID)
  references PRODUCTS (PRODUCT_ID) on delete cascade;
-- Create/Recreate check constraints 
alter table ORDER_ITEMS
  add check (ad_isActive in ('Y','N'));
alter table ORDER_ITEMS
  add check (ad_isChecked in (1,0));
alter table ORDER_ITEMS
  add check (ad_isRole in ('True','False'));
alter table ORDER_ITEMS
  add check (ad_isSecurity in ('IsSecurity','NotSecurity'));
