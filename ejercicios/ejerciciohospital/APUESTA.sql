/*==============================================================*/
/* DBMS name:      PostgreSQL 9.x                               */
/* Created on:     1/11/2024 10:28:46 p. m.                     */
/*==============================================================*/


drop table ADMINISTRADOR;

drop table CITA;

drop table DOCTOR;

drop table HABITACION;

drop table HISTORIAL_MEDICO;

drop table INVENTARIO;

drop table PACIENTE;

drop table PREESCRIPCION;

drop table REGISTROEMPLEADOS;

/*==============================================================*/
/* Table: ADMINISTRADOR                                         */
/*==============================================================*/
create table ADMINISTRADOR (
   ID_ADMINISTRADOR     VARCHAR(10)          not null,
   NOMBRE               VARCHAR(20)          null,
   CARGO                VARCHAR(50)          null,
   TELEFONO             DECIMAL(15)          null,
   EMAIL                VARCHAR(100)         null,
   constraint PK_ADMINISTRADOR primary key (ID_ADMINISTRADOR)
);

/*==============================================================*/
/* Table: CITA                                                  */
/*==============================================================*/
create table CITA (
   ID_CITA              NUMERIC(10)          not null,
   ID_PACIENTE          NUMERIC(10)          null,
   ID_DOCTOR            NUMERIC(10)          null,
   FECHA_CITA           TIMESTAMP            null,
   MOTIVO               TEXT                 null,
   constraint PK_CITA primary key (ID_CITA)
);

/*==============================================================*/
/* Table: DOCTOR                                                */
/*==============================================================*/
create table DOCTOR (
   ID_DOCTOR            NUMERIC(10)          not null,
   NOMBRE               VARCHAR(20)          null,
   ESPECIALIDAD         VARCHAR(50)          null,
   TELEFONO             DECIMAL(15)          null,
   EMAIL                VARCHAR(100)         null,
   constraint PK_DOCTOR primary key (ID_DOCTOR)
);

/*==============================================================*/
/* Table: HABITACION                                            */
/*==============================================================*/
create table HABITACION (
   ID_HABITACION        NUMERIC(10)          not null,
   ID_ADMINISTRADOR     VARCHAR(10)          null,
   NUMERO_HABITACION    DECIMAL              null,
   PISO                 NUMERIC(10)          null,
   TIPO                 VARCHAR(50)          null,
   ESTADO               BOOL                 null,
   constraint PK_HABITACION primary key (ID_HABITACION)
);

/*==============================================================*/
/* Table: HISTORIAL_MEDICO                                      */
/*==============================================================*/
create table HISTORIAL_MEDICO (
   ID_HISTORIAL_MEDICO  NUMERIC(10)          not null,
   ID_PACIENTE          NUMERIC(10)          null,
   ID_DOCTOR            NUMERIC(10)          null,
   FECHA_CREACION       DATE                 not null,
   DESCRIPCION          TEXT                 not null,
   DIAGNOSTICO          TEXT                 not null,
   TRATAMIENTO          TEXT                 not null,
   constraint PK_HISTORIAL_MEDICO primary key (ID_HISTORIAL_MEDICO)
);

/*==============================================================*/
/* Table: INVENTARIO                                            */
/*==============================================================*/
create table INVENTARIO (
   ID_INVENTARIO        NUMERIC(10)          not null,
   ID_ADMINISTRADOR     VARCHAR(10)          null,
   NOMBRE_ARTICULO      VARCHAR(100)         null,
   CANTIDAD             NUMERIC(10)          null,
   DESCRIPCION          TEXT                 null,
   FECHA_INGRESO        DATE                 null,
   constraint PK_INVENTARIO primary key (ID_INVENTARIO)
);

/*==============================================================*/
/* Table: PACIENTE                                              */
/*==============================================================*/
create table PACIENTE (
   ID_PACIENTE          NUMERIC(10)          not null,
   NOMBRE               VARCHAR(50)          not null,
   FECHA_NACIMIENTO     DATE                 not null,
   DIRECCION            VARCHAR(255)         null,
   TELEFONO             NUMERIC(10)          not null,
   EMAIL                VARCHAR(100)         not null,
   constraint PK_PACIENTE primary key (ID_PACIENTE)
);

/*==============================================================*/
/* Table: PREESCRIPCION                                         */
/*==============================================================*/
create table PREESCRIPCION (
   ID_PREESCRIPCION     NUMERIC(10)          not null,
   ID_HISTORIAL_MEDICO  NUMERIC(10)          null,
   MEDICAMENTO          VARCHAR(100)         null,
   DOSIS                VARCHAR(50)          null,
   FECHA_EMISION        DATE                 null,
   constraint PK_PREESCRIPCION primary key (ID_PREESCRIPCION)
);

/*==============================================================*/
/* Table: REGISTROEMPLEADOS                                     */
/*==============================================================*/
create table REGISTROEMPLEADOS (
   ID_REGISTRO_EMPLEADOS NUMERIC(10)          not null,
   ID_ADMINISTRADOR     VARCHAR(10)          null,
   FECHA_REGISTRO       DATE                 null,
   CARGO                VARCHAR(50)          null,
   OBSERVACIONES        TEXT                 null,
   constraint PK_REGISTROEMPLEADOS primary key (ID_REGISTRO_EMPLEADOS)
);

alter table CITA
   add constraint FK_CITA_REFERENCE_PACIENTE foreign key (ID_PACIENTE)
      references PACIENTE (ID_PACIENTE)
      on delete restrict on update restrict;

alter table CITA
   add constraint FK_CITA_REFERENCE_DOCTOR foreign key (ID_DOCTOR)
      references DOCTOR (ID_DOCTOR)
      on delete restrict on update restrict;

alter table HABITACION
   add constraint FK_HABITACI_REFERENCE_ADMINIST foreign key (ID_ADMINISTRADOR)
      references ADMINISTRADOR (ID_ADMINISTRADOR)
      on delete restrict on update restrict;

alter table HISTORIAL_MEDICO
   add constraint FK_HISTORIA_REFERENCE_PACIENTE foreign key (ID_PACIENTE)
      references PACIENTE (ID_PACIENTE)
      on delete restrict on update restrict;

alter table HISTORIAL_MEDICO
   add constraint FK_HISTORIA_REFERENCE_DOCTOR foreign key (ID_DOCTOR)
      references DOCTOR (ID_DOCTOR)
      on delete restrict on update restrict;

alter table INVENTARIO
   add constraint FK_INVENTAR_REFERENCE_ADMINIST foreign key (ID_ADMINISTRADOR)
      references ADMINISTRADOR (ID_ADMINISTRADOR)
      on delete restrict on update restrict;

alter table PREESCRIPCION
   add constraint FK_PREESCRI_REFERENCE_HISTORIA foreign key (ID_HISTORIAL_MEDICO)
      references HISTORIAL_MEDICO (ID_HISTORIAL_MEDICO)
      on delete restrict on update restrict;

alter table REGISTROEMPLEADOS
   add constraint FK_REGISTRO_REFERENCE_ADMINIST foreign key (ID_ADMINISTRADOR)
      references ADMINISTRADOR (ID_ADMINISTRADOR)
      on delete restrict on update restrict;

