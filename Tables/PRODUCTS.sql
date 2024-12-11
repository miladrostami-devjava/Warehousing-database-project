-- Create table
create table PRODUCTS
(
  product_id              NUMBER not null,
  hr_c_bpartner_id        NUMBER,
  ad_client_id            NUMBER,
  product_name            VARCHAR2(255) not null,
  description             VARCHAR2(2000),
  standard_cost           NUMBER(9,2),
  list_price              NUMBER(9,2),
  ad_created_by           VARCHAR2(300) not null,
  ad_updated_by           VARCHAR2(300) not null,
  ad_created_date         DATE not null,
  ad_updated_date         DATE not null,
  ad_created_sysdate_date DATE default sysdate not null,
  ad_updated_sysdate_date DATE default sysdate not null,
  ad_isactive             CHAR(1) not null,
  ad_ischecked            NUMBER(1) not null,
  ad_isrole               VARCHAR2(5) not null,
  ad_issecurity           VARCHAR2(11) not null,
  category_id             NUMBER not null
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
alter table PRODUCTS
  add primary key (PRODUCT_ID)
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
alter table PRODUCTS
  add constraint FK_AD_CLIENT_ID_PRODUCTS foreign key (AD_CLIENT_ID)
  references AD_CLIENT (AD_CLIENT_ID);
alter table PRODUCTS
  add constraint FK_HR_C_ID_PRODUCTS foreign key (HR_C_BPARTNER_ID)
  references HR_C_BPARTNERS (HR_C_BPARTNER_ID);
alter table PRODUCTS
  add constraint FK_PRODUCTS_CATEGORIES foreign key (CATEGORY_ID)
  references PRODUCT_CATEGORIES (CATEGORY_ID) on delete cascade;
-- Create/Recreate check constraints 
alter table PRODUCTS
  add check (ad_isActive in ('Y','N'));
alter table PRODUCTS
  add check (ad_isChecked in (1,0));
alter table PRODUCTS
  add check (ad_isRole in ('True','False'));
alter table PRODUCTS
  add check (ad_isSecurity in ('IsSecurity','NotSecurity'));
