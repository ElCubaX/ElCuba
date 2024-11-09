/*==============================================================*/
/* DBMS name:      PostgreSQL 9.x                               */
/* Created on:     2/11/2024 1:51:25 a. m.                      */
/*==============================================================*/


drop table ADMINISTRADOR;

drop table FACTURA;

drop table PAGO;

drop table RESERVA;

drop table USUARIO;

drop table VEHICULO;

/*==============================================================*/
/* Table: ADMINISTRADOR                                         */
/*==============================================================*/
create table ADMINISTRADOR (
   ID_ADMINISTRADOR     NUMERIC(10)          not null,
   NOMBRE               VARCHAR(100)         null,
   EMAIL                VARCHAR(100)         null,
   constraint PK_ADMINISTRADOR primary key (ID_ADMINISTRADOR)
);

/*==============================================================*/
/* Table: FACTURA                                               */
/*==============================================================*/
create table FACTURA (
   ID_FACTURA           NUMERIC(10)          not null,
   ID_PAGO              NUMERIC(10)          null,
   FECHA_EMISION        TIMESTAMP            null,
   TOTAL                DECIMAL(10,2)        null,
   constraint PK_FACTURA primary key (ID_FACTURA)
);

/*==============================================================*/
/* Table: PAGO                                                  */
/*==============================================================*/
create table PAGO (
   ID_PAGO              NUMERIC(10)          not null,
   ID_RESERVA           NUMERIC(10)          null,
   MONTO                DECIMAL(15,2)        null,
   FECHA                DATE                 null,
   constraint PK_PAGO primary key (ID_PAGO)
);

/*==============================================================*/
/* Table: RESERVA                                               */
/*==============================================================*/
create table RESERVA (
   ID_RESERVA           NUMERIC(10)          not null,
   ID_USUARIO           NUMERIC(10)          null,
   ID_VEHICULO          NUMERIC(10)          null,
   FECHA_INICIO         TIMESTAMP            null,
   FECHA_FIN            TIMESTAMP            null,
   constraint PK_RESERVA primary key (ID_RESERVA)
);

/*==============================================================*/
/* Table: USUARIO                                               */
/*==============================================================*/
create table USUARIO (
   ID_USUARIO           NUMERIC(10)          not null,
   NOMBRE               VARCHAR(20)          null,
   EMAIL                VARCHAR(100)         null,
   TELEFONO             NUMERIC(20)          null,
   constraint PK_USUARIO primary key (ID_USUARIO)
);

/*==============================================================*/
/* Table: VEHICULO                                              */
/*==============================================================*/
create table VEHICULO (
   ID_VEHICULO          NUMERIC(10)          not null,
   ID_ADMINISTRADOR     NUMERIC(10)          null,
   MARCA                VARCHAR(50)          null,
   MODELO               VARCHAR(50)          null,
   ANO                  NUMERIC(10)          null,
   DISPONIBILIDAD       BOOL                 null,
   constraint PK_VEHICULO primary key (ID_VEHICULO)
);

alter table FACTURA
   add constraint FK_FACTURA_REFERENCE_PAGO foreign key (ID_PAGO)
      references PAGO (ID_PAGO)
      on delete restrict on update restrict;

alter table PAGO
   add constraint FK_PAGO_REFERENCE_RESERVA foreign key (ID_RESERVA)
      references RESERVA (ID_RESERVA)
      on delete restrict on update restrict;

alter table RESERVA
   add constraint FK_RESERVA_REFERENCE_USUARIO foreign key (ID_USUARIO)
      references USUARIO (ID_USUARIO)
      on delete restrict on update restrict;

alter table RESERVA
   add constraint FK_RESERVA_REFERENCE_VEHICULO foreign key (ID_VEHICULO)
      references VEHICULO (ID_VEHICULO)
      on delete restrict on update restrict;

alter table VEHICULO
   add constraint FK_VEHICULO_REFERENCE_ADMINIST foreign key (ID_ADMINISTRADOR)
      references ADMINISTRADOR (ID_ADMINISTRADOR)
      on delete restrict on update restrict;

