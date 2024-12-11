-- Create table
create table REGIONS
(
  region_id               NUMBER not null,
  hr_c_bpartner_id        NUMBER,
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
  ad_client_id            NUMBER,
  region_name             VARCHAR2(50) not null
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
alter table REGIONS
  add primary key (REGION_ID)
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
alter table REGIONS
  add constraint FK_AD_ID_REGIONS foreign key (AD_CLIENT_ID)
  references AD_CLIENT (AD_CLIENT_ID);
alter table REGIONS
  add constraint FK_HR_C_ID_REGIONS foreign key (HR_C_BPARTNER_ID)
  references HR_C_BPARTNERS (HR_C_BPARTNER_ID);
-- Create/Recreate check constraints 
alter table REGIONS
  add check (ad_isActive in ('Y','N'));
alter table REGIONS
  add check (ad_isChecked in (1,0));
alter table REGIONS
  add check (ad_isRole in ('True','False'));
alter table REGIONS
  add check (ad_isSecurity in ('IsSecurity','NotSecurity'));
