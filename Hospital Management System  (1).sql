/*==============================================================*/
/* DBMS name:      Microsoft SQL Server 2005                    */
/* Created on:     1/1/2022 11:32:22 AM                         */
/*==============================================================*/


if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('DOCTOR') and o.name = 'FK_DOCTOR_BELONGS_T_DEPARTME')
alter table DOCTOR
   drop constraint FK_DOCTOR_BELONGS_T_DEPARTME
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('PATIENT') and o.name = 'FK_PATIENT_RESURVES_ROOM')
alter table PATIENT
   drop constraint FK_PATIENT_RESURVES_ROOM
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('ROOM') and o.name = 'FK_ROOM_RESURVES2_PATIENT')
alter table ROOM
   drop constraint FK_ROOM_RESURVES2_PATIENT
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('SUPERVISES') and o.name = 'FK_SUPERVIS_SUPERVISE_DOCTOR')
alter table SUPERVISES
   drop constraint FK_SUPERVIS_SUPERVISE_DOCTOR
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('SUPERVISES') and o.name = 'FK_SUPERVIS_SUPERVISE_PATIENT')
alter table SUPERVISES
   drop constraint FK_SUPERVIS_SUPERVISE_PATIENT
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('SURVED_BY') and o.name = 'FK_SURVED_B_SURVED_BY_NURSE')
alter table SURVED_BY
   drop constraint FK_SURVED_B_SURVED_BY_NURSE
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('SURVED_BY') and o.name = 'FK_SURVED_B_SURVED_BY_PATIENT')
alter table SURVED_BY
   drop constraint FK_SURVED_B_SURVED_BY_PATIENT
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TAKE') and o.name = 'FK_TAKE_TAKE_PATIENT')
alter table TAKE
   drop constraint FK_TAKE_TAKE_PATIENT
go

if exists (select 1
   from sys.sysreferences r join sys.sysobjects o on (o.id = r.constid and o.type = 'F')
   where r.fkeyid = object_id('TAKE') and o.name = 'FK_TAKE_TAKE2_MEDICINE')
alter table TAKE
   drop constraint FK_TAKE_TAKE2_MEDICINE
go

if exists (select 1
            from  sysobjects
           where  id = object_id('DEPARTMENT')
            and   type = 'U')
   drop table DEPARTMENT
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('DOCTOR')
            and   name  = 'BELONGS_TO_FK'
            and   indid > 0
            and   indid < 255)
   drop index DOCTOR.BELONGS_TO_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('DOCTOR')
            and   type = 'U')
   drop table DOCTOR
go

if exists (select 1
            from  sysobjects
           where  id = object_id('MEDICINE')
            and   type = 'U')
   drop table MEDICINE
go

if exists (select 1
            from  sysobjects
           where  id = object_id('NURSE')
            and   type = 'U')
   drop table NURSE
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('PATIENT')
            and   name  = 'RESURVES_FK'
            and   indid > 0
            and   indid < 255)
   drop index PATIENT.RESURVES_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('PATIENT')
            and   type = 'U')
   drop table PATIENT
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('ROOM')
            and   name  = 'RESURVES2_FK'
            and   indid > 0
            and   indid < 255)
   drop index ROOM.RESURVES2_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('ROOM')
            and   type = 'U')
   drop table ROOM
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('SUPERVISES')
            and   name  = 'SUPERVISES2_FK'
            and   indid > 0
            and   indid < 255)
   drop index SUPERVISES.SUPERVISES2_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('SUPERVISES')
            and   name  = 'SUPERVISES_FK'
            and   indid > 0
            and   indid < 255)
   drop index SUPERVISES.SUPERVISES_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('SUPERVISES')
            and   type = 'U')
   drop table SUPERVISES
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('SURVED_BY')
            and   name  = 'SURVED_BY2_FK'
            and   indid > 0
            and   indid < 255)
   drop index SURVED_BY.SURVED_BY2_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('SURVED_BY')
            and   name  = 'SURVED_BY_FK'
            and   indid > 0
            and   indid < 255)
   drop index SURVED_BY.SURVED_BY_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('SURVED_BY')
            and   type = 'U')
   drop table SURVED_BY
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('TAKE')
            and   name  = 'TAKE2_FK'
            and   indid > 0
            and   indid < 255)
   drop index TAKE.TAKE2_FK
go

if exists (select 1
            from  sysindexes
           where  id    = object_id('TAKE')
            and   name  = 'TAKE_FK'
            and   indid > 0
            and   indid < 255)
   drop index TAKE.TAKE_FK
go

if exists (select 1
            from  sysobjects
           where  id = object_id('TAKE')
            and   type = 'U')
   drop table TAKE
go

/*==============================================================*/
/* Table: DEPARTMENT                                            */
/*==============================================================*/
create table DEPARTMENT (
   DEPTID               int                  not null,
   DEPNAME              varchar(20)          not null,
   constraint PK_DEPARTMENT primary key nonclustered (DEPTID)
)
go

/*==============================================================*/
/* Table: DOCTOR                                                */
/*==============================================================*/
create table DOCTOR (
   DOCTORID             int                  not null,
   DEPTID               int                  not null,
   DOCTORNAME           varchar(50)          not null,
   DOCTOREMAIL          varchar(50)          null,
   DOCTORADDRESS        varchar(255)         null,
   DOCTORTEL            numeric(10)          not null,
   constraint PK_DOCTOR primary key nonclustered (DOCTORID)
)
go

/*==============================================================*/
/* Index: BELONGS_TO_FK                                         */
/*==============================================================*/
create index BELONGS_TO_FK on DOCTOR (
DEPTID ASC
)
go

/*==============================================================*/
/* Table: MEDICINE                                              */
/*==============================================================*/
create table MEDICINE (
   MEDICINEID           int                  not null,
   MEDICINENAME         varchar(50)          not null,
   MEDICINEPRICE        numeric(5)           null,
   constraint PK_MEDICINE primary key nonclustered (MEDICINEID)
)
go

/*==============================================================*/
/* Table: NURSE                                                 */
/*==============================================================*/
create table NURSE (
   NURSEID              int                  not null,
   NURSENAME            varchar(50)          not null,
   NURSEEMAIL           varchar(50)          null,
   NURSEADDRESS         varchar(255)         null,
   NURSETEL             numeric(10)          not null,
   constraint PK_NURSE primary key nonclustered (NURSEID)
)
go

/*==============================================================*/
/* Table: PATIENT                                               */
/*==============================================================*/
create table PATIENT (
   PATIENTID            int                  not null,
   ROOMNO               int                  not null,
   PATIENTNAME          varchar(50)          not null,
   PATIENTADDRESS       varchar(255)         null,
   PATIENTEMAIL         varchar(50)          null,
   PATIENTTEL           numeric(10)          not null,
   constraint PK_PATIENT primary key nonclustered (PATIENTID)
)
go

/*==============================================================*/
/* Index: RESURVES_FK                                           */
/*==============================================================*/
create index RESURVES_FK on PATIENT (
ROOMNO ASC
)
go

/*==============================================================*/
/* Table: ROOM                                                  */
/*==============================================================*/
create table ROOM (
   ROOMNO               int                  not null,
   PATIENTID            int                  null,
   ROOMTYPE             varchar(20)          not null,
   ROOMPRICE            numeric(5)           null,
   constraint PK_ROOM primary key nonclustered (ROOMNO)
)
go

/*==============================================================*/
/* Index: RESURVES2_FK                                          */
/*==============================================================*/
create index RESURVES2_FK on ROOM (
PATIENTID ASC
)
go

/*==============================================================*/
/* Table: SUPERVISES                                            */
/*==============================================================*/
create table SUPERVISES (
   DOCTORID             int                  not null,
   PATIENTID            int                  not null,
   constraint PK_SUPERVISES primary key (DOCTORID, PATIENTID)
)
go

/*==============================================================*/
/* Index: SUPERVISES_FK                                         */
/*==============================================================*/
create index SUPERVISES_FK on SUPERVISES (
DOCTORID ASC
)
go

/*==============================================================*/
/* Index: SUPERVISES2_FK                                        */
/*==============================================================*/
create index SUPERVISES2_FK on SUPERVISES (
PATIENTID ASC
)
go

/*==============================================================*/
/* Table: SURVED_BY                                             */
/*==============================================================*/
create table SURVED_BY (
   NURSEID              int                  not null,
   PATIENTID            int                  not null,
   constraint PK_SURVED_BY primary key (NURSEID, PATIENTID)
)
go

/*==============================================================*/
/* Index: SURVED_BY_FK                                          */
/*==============================================================*/
create index SURVED_BY_FK on SURVED_BY (
NURSEID ASC
)
go

/*==============================================================*/
/* Index: SURVED_BY2_FK                                         */
/*==============================================================*/
create index SURVED_BY2_FK on SURVED_BY (
PATIENTID ASC
)
go

/*==============================================================*/
/* Table: TAKE                                                  */
/*==============================================================*/
create table TAKE (
   PATIENTID            int                  not null,
   MEDICINEID           int                  not null,
   constraint PK_TAKE primary key (PATIENTID, MEDICINEID)
)
go

/*==============================================================*/
/* Index: TAKE_FK                                               */
/*==============================================================*/
create index TAKE_FK on TAKE (
PATIENTID ASC
)
go

/*==============================================================*/
/* Index: TAKE2_FK                                              */
/*==============================================================*/
create index TAKE2_FK on TAKE (
MEDICINEID ASC
)
go

alter table DOCTOR
   add constraint FK_DOCTOR_BELONGS_T_DEPARTME foreign key (DEPTID)
      references DEPARTMENT (DEPTID)
go

alter table PATIENT
   add constraint FK_PATIENT_RESURVES_ROOM foreign key (ROOMNO)
      references ROOM (ROOMNO)
go

alter table ROOM
   add constraint FK_ROOM_RESURVES2_PATIENT foreign key (PATIENTID)
      references PATIENT (PATIENTID)
go

alter table SUPERVISES
   add constraint FK_SUPERVIS_SUPERVISE_DOCTOR foreign key (DOCTORID)
      references DOCTOR (DOCTORID)
go

alter table SUPERVISES
   add constraint FK_SUPERVIS_SUPERVISE_PATIENT foreign key (PATIENTID)
      references PATIENT (PATIENTID)
go

alter table SURVED_BY
   add constraint FK_SURVED_B_SURVED_BY_NURSE foreign key (NURSEID)
      references NURSE (NURSEID)
go

alter table SURVED_BY
   add constraint FK_SURVED_B_SURVED_BY_PATIENT foreign key (PATIENTID)
      references PATIENT (PATIENTID)
go

alter table TAKE
   add constraint FK_TAKE_TAKE_PATIENT foreign key (PATIENTID)
      references PATIENT (PATIENTID)
go

alter table TAKE
   add constraint FK_TAKE_TAKE2_MEDICINE foreign key (MEDICINEID)
      references MEDICINE (MEDICINEID)
go

