-- Create table
create table HR_C_BPARTNERS
(
  hr_c_bpartners_id             NUMBER not null,
  hr_c_bpartner_id              NUMBER,
  ad_client_id                  NUMBER,
  hr_c_bpartner_created_by      VARCHAR2(300) not null,
  hr_c_bpartner_updated_by      VARCHAR2(300) not null,
  hr_c_bpartner_created_date    DATE not null,
  hr_c_bpartner_updated_date    DATE not null,
  hr_c_bpartner_sysdate_date    DATE default sysdate not null,
  hr_updated_sysdate_date       DATE default sysdate not null,
  hr_c_bpartner_isactive        CHAR(1) not null,
  hr_c_bpartner_ischecked       NUMBER(1) not null,
  hr_c_bpartner_isrole          VARCHAR2(5) not null,
  hr_c_bpartner_issecurity      VARCHAR2(11) not null,
  hr_names_in_office            HR_C_BPARTNERS_NAMES,
  hr_c_bpartners_doc_data       BLOB,
  hr_c_bpartners_image_data     BLOB,
  hr_report_text                CLOB,
  hr_c_bpartners_book_text      CLOB,
  hr_text_context_farsi         NCLOB,
  hr_text_context_chinian       NCLOB,
  hr_event_time                 TIMESTAMP(6),
  hr_meeting_time_with_zone     DATE,
  hr_c_bpartners_deeparture     DATE,
  hr_event_time_local           DATE,
  hr_binary_file                RAW(200),
  hr_address                    ADDRESS_TYPE,
  hr_number_in_post             NUMBER,
  hr_value_in_capacity          FLOAT,
  hr_c_bpartners_grade          NUMBER(10,4),
  hr_amount_binary              NUMBER,
  hr_binary_double              BINARY_DOUBLE,
  hr_c_bpartners_email          CHAR(30),
  hr_c_bpartners_security_email NCHAR(25),
  hr_c_bpartners_nvarchar2_name NVARCHAR2(500),
  hr_long_column                LONG,
  hr_duration_year_to_month     INTERVAL YEAR(2) TO MONTH,
  hr_c_bpartners_duration       INTERVAL DAY(2) TO SECOND(6),
  hr_files_data                 BFILE,
  hr_c_bpartners_xml_content    XMLTYPE,
  hr_c_json_data                CLOB,
  hr_my_decfloat                NUMBER
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
alter table HR_C_BPARTNERS
  add primary key (HR_C_BPARTNERS_ID)
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
alter table HR_C_BPARTNERS
  add constraint UQ_HR_C_BPARTNER_ID unique (HR_C_BPARTNER_ID)
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
alter table HR_C_BPARTNERS
  add constraint FK_AD_CLIENT_ID_BPARTNERS foreign key (AD_CLIENT_ID)
  references AD_CLIENT (AD_CLIENT_ID) on delete set null;
alter table HR_C_BPARTNERS
  add constraint FK_HR_C_BPARTNER_ID foreign key (HR_C_BPARTNER_ID)
  references HR_C_BPARTNERS (HR_C_BPARTNER_ID) on delete cascade;
-- Create/Recreate check constraints 
alter table HR_C_BPARTNERS
  add check (hr_c_bpartner_isActive in ('Y','N'));
alter table HR_C_BPARTNERS
  add check (hr_c_bpartner_isChecked in (1,0));
alter table HR_C_BPARTNERS
  add check (hr_c_bpartner_isRole in ('True','False'));
alter table HR_C_BPARTNERS
  add check (hr_c_bpartner_isSecurity in ('IsSecurity','NotSecurity'));
