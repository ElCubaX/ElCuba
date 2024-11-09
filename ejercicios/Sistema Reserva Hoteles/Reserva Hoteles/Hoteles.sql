/*==============================================================*/
/* DBMS name:      PostgreSQL 9.x                               */
/* Created on:     6/11/2024 5:16:51 p. m.                      */
/*==============================================================*/


drop table ADMINISTRADOR;

drop table CLIENTE;

drop table FACTURA;

drop table HABITACION;

drop table RESERVA;

/*==============================================================*/
/* Table: ADMINISTRADOR                                         */
/*==============================================================*/
create table ADMINISTRADOR (
   ID_ADMINISTRADOR     NUMERIC(10)          not null,
   ID_CLIENTE           NUMERIC(10)          null,
   NOMBRE               VARCHAR(20)          null,
   CORREO               VARCHAR(100)         null,
   constraint PK_ADMINISTRADOR primary key (ID_ADMINISTRADOR)
);

/*==============================================================*/
/* Table: CLIENTE                                               */
/*==============================================================*/
create table CLIENTE (
   ID_CLIENTE           NUMERIC(10)          not null,
   NOMBRE               VARCHAR(20)          null,
   CORREO               VARCHAR(100)         null,
   TELEFONO             NUMERIC(10)          null,
   constraint PK_CLIENTE primary key (ID_CLIENTE)
);

/*==============================================================*/
/* Table: FACTURA                                               */
/*==============================================================*/
create table FACTURA (
   ID_FACTURA           NUMERIC(10)          not null,
   ID_RESERVA           NUMERIC(10)          null,
   FECHA_SALIDA         DATE                 null,
   MONTO                DECIMAL(15,2)        null,
   constraint PK_FACTURA primary key (ID_FACTURA)
);

/*==============================================================*/
/* Table: HABITACION                                            */
/*==============================================================*/
create table HABITACION (
   ID_HABITACION        NUMERIC(20)          not null,
   NUMERO               NUMERIC(10)          null,
   TIPO                 VARCHAR(20)          null,
   PRECIO               DECIMAL(15,2)        null,
   ESTADO               BOOL                 null,
   constraint PK_HABITACION primary key (ID_HABITACION)
);

/*==============================================================*/
/* Table: RESERVA                                               */
/*==============================================================*/
create table RESERVA (
   ID_RESERVA           NUMERIC(10)          not null,
   ID_HABITACION        NUMERIC(20)          null,
   ID_CLIENTE           NUMERIC(10)          null,
   FECHA_INICIO         DATE                 null,
   FECHA_FINAL          DATE                 null,
   ESTADO               BOOL                 null,
   constraint PK_RESERVA primary key (ID_RESERVA)
);

alter table ADMINISTRADOR
   add constraint FK_ADMINIST_REFERENCE_CLIENTE foreign key (ID_CLIENTE)
      references CLIENTE (ID_CLIENTE)
      on delete restrict on update restrict;

alter table FACTURA
   add constraint FK_FACTURA_REFERENCE_RESERVA foreign key (ID_RESERVA)
      references RESERVA (ID_RESERVA)
      on delete restrict on update restrict;

alter table RESERVA
   add constraint FK_RESERVA_REFERENCE_HABITACI foreign key (ID_HABITACION)
      references HABITACION (ID_HABITACION)
      on delete restrict on update restrict;

alter table RESERVA
   add constraint FK_RESERVA_REFERENCE_CLIENTE foreign key (ID_CLIENTE)
      references CLIENTE (ID_CLIENTE)
      on delete restrict on update restrict;

