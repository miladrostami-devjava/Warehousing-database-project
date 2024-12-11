-- Create table
create table CONTACTS
(
  contact_id              NUMBER not null,
  hr_c_bpartner_id        NUMBER,
  ad_client_id            NUMBER,
  first_name              VARCHAR2(255) not null,
  last_name               VARCHAR2(255) not null,
  email                   VARCHAR2(255) not null,
  phone                   VARCHAR2(20),
  customer_id             NUMBER,
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
alter table CONTACTS
  add primary key (CONTACT_ID)
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
alter table CONTACTS
  add constraint FK_AD_CLIENT_ID_CONTACTS foreign key (AD_CLIENT_ID)
  references AD_CLIENT (AD_CLIENT_ID);
alter table CONTACTS
  add constraint FK_CONTACTS_CUSTOMERS foreign key (CUSTOMER_ID)
  references CUSTOMERS (CUSTOMER_ID) on delete cascade;
alter table CONTACTS
  add constraint FK_HR_C_ID_CONTACTS foreign key (HR_C_BPARTNER_ID)
  references HR_C_BPARTNERS (HR_C_BPARTNER_ID);
-- Create/Recreate check constraints 
alter table CONTACTS
  add check (ad_isActive in ('Y','N'));
alter table CONTACTS
  add check (ad_isChecked in (1,0));
alter table CONTACTS
  add check (ad_isRole in ('True','False'));
alter table CONTACTS
  add check (ad_isSecurity in ('IsSecurity','NotSecurity'));
