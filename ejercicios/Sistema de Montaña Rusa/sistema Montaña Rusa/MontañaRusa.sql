/*==============================================================*/
/* DBMS name:      PostgreSQL 9.x                               */
/* Created on:     6/11/2024 10:27:49 p. m.                     */
/*==============================================================*/


drop table ADMINISTRADOR;

drop table FILA;

drop table MANTENIMIENTO;

drop table MONTANARUSA;

drop table NOTIFICACION;

drop table OPERADOR;

drop table VISITANTE;

/*==============================================================*/
/* Table: ADMINISTRADOR                                         */
/*==============================================================*/
create table ADMINISTRADOR (
   ID_ADMINISTRADOR     NUMERIC(10)          not null,
   ID_OPERADOR          NUMERIC(10)          null,
   ID_MANTENIMIENTO     NUMERIC(10)          null,
   NOMBRE               VARCHAR(20)          null,
   NIVELACCESO          DECIMAL(10)          null,
   DEPARTAMENTO         VARCHAR(30)          null,
   FECHA_INGRESO        DATE                 null,
   constraint PK_ADMINISTRADOR primary key (ID_ADMINISTRADOR)
);

/*==============================================================*/
/* Table: FILA                                                  */
/*==============================================================*/
create table FILA (
   ID_FILA              NUMERIC(10)          not null,
   ID_MONTANARUSA       NUMERIC(10)          null,
   LISTAVISITANTES      VARCHAR(100)         null,
   ESTADOFILA           BOOL                 null,
   HORAINICIO           TIME                 null,
   TIEMPOESTIMADOESPERA TIME                 null,
   constraint PK_FILA primary key (ID_FILA)
);

/*==============================================================*/
/* Table: MANTENIMIENTO                                         */
/*==============================================================*/
create table MANTENIMIENTO (
   ID_MANTENIMIENTO     NUMERIC(10)          not null,
   ID_MONTANARUSA       NUMERIC(10)          null,
   FECHA_MANTENIMIENTO  DATE                 null,
   DETALLESERVICIO      VARCHAR(50)          null,
   PROXIMOMANTENIMIENTO DATE                 null,
   RESPONSABLE          VARCHAR(30)          null,
   constraint PK_MANTENIMIENTO primary key (ID_MANTENIMIENTO)
);

/*==============================================================*/
/* Table: MONTANARUSA                                           */
/*==============================================================*/
create table MONTANARUSA (
   ID_MONTANARUSA       NUMERIC(10)          not null,
   ID_VISITANTE         NUMERIC(10)          null,
   NOMBRE               VARCHAR(20)          null,
   CAPACIDADMAXIMA      DECIMAL(20)          null,
   ESTADO               BOOL                 null,
   DURACIONVIAJE        TIME                 null,
   ALTURAREQUERIDA      DECIMAL(15,2)        null,
   constraint PK_MONTANARUSA primary key (ID_MONTANARUSA)
);

/*==============================================================*/
/* Table: NOTIFICACION                                          */
/*==============================================================*/
create table NOTIFICACION (
   ID_NOTIFICACION      NUMERIC(10)          not null,
   ID_VISITANTE         NUMERIC(10)          null,
   MENSAJE              VARCHAR(20)          null,
   FECHAHORA            DATE                 null,
   TIPONOTIFICACION     TEXT                 null,
   ESTADOLECTURA        TEXT                 null,
   constraint PK_NOTIFICACION primary key (ID_NOTIFICACION)
);

/*==============================================================*/
/* Table: OPERADOR                                              */
/*==============================================================*/
create table OPERADOR (
   ID_OPERADOR          NUMERIC(10)          not null,
   ID_MONTANARUSA       NUMERIC(10)          null,
   NOMBRE               VARCHAR(20)          null,
   ESTADOOPERACION      BOOL                 null,
   TURNO                TIME                 null,
   TELEFONO             NUMERIC(10)          null,
   constraint PK_OPERADOR primary key (ID_OPERADOR)
);

/*==============================================================*/
/* Table: VISITANTE                                             */
/*==============================================================*/
create table VISITANTE (
   ID_VISITANTE         NUMERIC(10)          not null,
   ID_OPERADOR          NUMERIC(10)          null,
   ID_FILA              NUMERIC(10)          null,
   ID_NOTIFICACION      NUMERIC(10)          null,
   NOMBRE               VARCHAR(20)          null,
   ESTADO               BOOL                 null,
   CORREO               VARCHAR(100)         null,
   FECHA_REGISTRO       DATE                 null,
   constraint PK_VISITANTE primary key (ID_VISITANTE)
);

alter table ADMINISTRADOR
   add constraint FK_ADMINIST_REFERENCE_OPERADOR foreign key (ID_OPERADOR)
      references OPERADOR (ID_OPERADOR)
      on delete restrict on update restrict;

alter table ADMINISTRADOR
   add constraint FK_ADMINIST_REFERENCE_MANTENIM foreign key (ID_MANTENIMIENTO)
      references MANTENIMIENTO (ID_MANTENIMIENTO)
      on delete restrict on update restrict;

alter table FILA
   add constraint FK_FILA_REFERENCE_MONTANAR foreign key (ID_MONTANARUSA)
      references MONTANARUSA (ID_MONTANARUSA)
      on delete restrict on update restrict;

alter table MANTENIMIENTO
   add constraint FK_MANTENIM_REFERENCE_MONTANAR foreign key (ID_MONTANARUSA)
      references MONTANARUSA (ID_MONTANARUSA)
      on delete restrict on update restrict;

alter table MONTANARUSA
   add constraint FK_MONTANAR_REFERENCE_VISITANT foreign key (ID_VISITANTE)
      references VISITANTE (ID_VISITANTE)
      on delete restrict on update restrict;

alter table NOTIFICACION
   add constraint FK_NOTIFICA_REFERENCE_VISITANT foreign key (ID_VISITANTE)
      references VISITANTE (ID_VISITANTE)
      on delete restrict on update restrict;

alter table OPERADOR
   add constraint FK_OPERADOR_REFERENCE_MONTANAR foreign key (ID_MONTANARUSA)
      references MONTANARUSA (ID_MONTANARUSA)
      on delete restrict on update restrict;

alter table VISITANTE
   add constraint FK_VISITANT_REFERENCE_NOTIFICA foreign key (ID_NOTIFICACION)
      references NOTIFICACION (ID_NOTIFICACION)
      on delete restrict on update restrict;

alter table VISITANTE
   add constraint FK_VISITANT_REFERENCE_OPERADOR foreign key (ID_OPERADOR)
      references OPERADOR (ID_OPERADOR)
      on delete restrict on update restrict;

alter table VISITANTE
   add constraint FK_VISITANT_REFERENCE_FILA foreign key (ID_FILA)
      references FILA (ID_FILA)
      on delete restrict on update restrict;

