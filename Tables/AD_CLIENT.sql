-- Create table
create table AD_CLIENT
(
  ad_clients_id                 NUMBER not null,
  hr_c_bpartner_id              NUMBER,
  ad_client_id                  NUMBER,
  client_created_by             VARCHAR2(300) not null,
  client_updated_by             VARCHAR2(300) not null,
  client_created_date           DATE not null,
  client_updated_date           DATE not null,
  client_created_sysdate_date   DATE default sysdate not null,
  client_updated_sysdate_date   DATE default sysdate not null,
  client_isactive               CHAR(1) not null,
  client_ischecked              NUMBER(1) not null,
  client_isrole                 VARCHAR2(5) not null,
  client_issecurity             VARCHAR2(11) not null,
  client_names_in_office        CLIENT_NAMES,
  client_peoples_numbers_id     NUMBER,
  client_doc_data               BLOB,
  client_image_data             BLOB,
  client_report_text            CLOB,
  client_book_text              CLOB,
  client_text_context_farsi     NCLOB,
  client_text_context_chinian   NCLOB,
  client_event_time             TIMESTAMP(6),
  client_meeting_time_with_zone DATE,
  client_deeparture             TIMESTAMP(6) WITH TIME ZONE,
  client_event_time_local       TIMESTAMP(6) WITH LOCAL TIME ZONE,
  client_binary_file            RAW(230),
  client_address                ADDRESS_TYPE,
  client_number_in_post         INTEGER,
  client_value_in_capacity      FLOAT,
  client_grade                  NUMBER(10,4),
  client_amount_binary          INTEGER,
  client_binary_double          BINARY_DOUBLE,
  client_email                  CHAR(30),
  client_security_email         NCHAR(25),
  client_nvarchar2_name         NVARCHAR2(1600),
  client_long_column            LONG,
  client_duration_year_to_month INTERVAL YEAR(2) TO MONTH,
  client_duration               INTERVAL DAY(2) TO SECOND(6),
  client_files_data             BFILE,
  client_xml_content            XMLTYPE,
  client_json_data              CLOB,
  client_my_decfloat            NUMBER
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
alter table AD_CLIENT
  add primary key (AD_CLIENTS_ID)
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
alter table AD_CLIENT
  add constraint UQ_AD_CLIENT_ID unique (AD_CLIENT_ID)
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
alter table AD_CLIENT
  add constraint FK_AD_CLIENT_ID foreign key (AD_CLIENT_ID)
  references AD_CLIENT (AD_CLIENT_ID) on delete set null;
alter table AD_CLIENT
  add constraint FK_HR_C_BPARTNER_ID_CLIENT foreign key (HR_C_BPARTNER_ID)
  references HR_C_BPARTNERS (HR_C_BPARTNER_ID) on delete cascade;
-- Create/Recreate check constraints 
alter table AD_CLIENT
  add check (client_isActive in ('Y','N'));
alter table AD_CLIENT
  add check (client_isChecked in (1,0));
alter table AD_CLIENT
  add check (client_isRole in ('True','False'));
alter table AD_CLIENT
  add check (client_isSecurity in ('IsSecurity','NotSecurity'));
