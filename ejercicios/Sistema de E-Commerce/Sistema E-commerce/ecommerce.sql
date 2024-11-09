/*==============================================================*/
/* DBMS name:      PostgreSQL 9.x                               */
/* Created on:     6/11/2024 2:27:47 p. m.                      */
/*==============================================================*/


drop table ADMINISTRADOR;

drop table CARRITO;

drop table CLIENTE;

drop table ENVIO;

drop table FACTURA;

drop table PAGO;

drop table PRODUCTO;

/*==============================================================*/
/* Table: ADMINISTRADOR                                         */
/*==============================================================*/
create table ADMINISTRADOR (
   ID_ADMIN             NUMERIC(20)          not null,
   ID_CLIENTE           NUMERIC(10)          null,
   NOMBRE               VARCHAR(30)          null,
   CORREO               VARCHAR(100)         null,
   TELEFONO             NUMERIC(50)          null,
   constraint PK_ADMINISTRADOR primary key (ID_ADMIN)
);

/*==============================================================*/
/* Table: CARRITO                                               */
/*==============================================================*/
create table CARRITO (
   ID_CARRO             NUMERIC(10)          not null,
   ID_CLIENTE           NUMERIC(10)          null,
   ID_PRODUCTO          NUMERIC(10)          null,
   TOTAL                DECIMAL(20)          null,
   constraint PK_CARRITO primary key (ID_CARRO)
);

/*==============================================================*/
/* Table: CLIENTE                                               */
/*==============================================================*/
create table CLIENTE (
   ID_CLIENTE           NUMERIC(10)          not null,
   NOMBRE               VARCHAR(20)          null,
   CORREO               VARCHAR(50)          null,
   DIRECCION            VARCHAR(1o0)         null,
   TELEFONO             NUMERIC(10)          null,
   constraint PK_CLIENTE primary key (ID_CLIENTE)
);

/*==============================================================*/
/* Table: ENVIO                                                 */
/*==============================================================*/
create table ENVIO (
   ID_ENVIO             NUMERIC(10)          not null,
   ID_CLIENTE           NUMERIC(10)          null,
   DESTINO              VARCHAR(50)          null,
   FECHA_ENVIO          DATE                 null,
   ESTADO               BOOL                 null,
   constraint PK_ENVIO primary key (ID_ENVIO)
);

/*==============================================================*/
/* Table: FACTURA                                               */
/*==============================================================*/
create table FACTURA (
   ID_FACTURA           NUMERIC(10)          not null,
   ID_PAGO              NUMERIC(10)          null,
   FECHA                DATE                 null,
   TOTAL_PAGADO         NUMERIC(20)          null,
   ID_COMPRA            DECIMAL(300)         null,
   DETALLES             VARCHAR(100)         null,
   constraint PK_FACTURA primary key (ID_FACTURA)
);

/*==============================================================*/
/* Table: PAGO                                                  */
/*==============================================================*/
create table PAGO (
   ID_PAGO              NUMERIC(10)          not null,
   ID_CARRO             NUMERIC(10)          null,
   ID_CLIENTE           NUMERIC(10)          null,
   FECHA                DATE                 null,
   PAGADO               DECIMAL(15,2)        null,
   ESTADO               BOOL                 null,
   constraint PK_PAGO primary key (ID_PAGO)
);

/*==============================================================*/
/* Table: PRODUCTO                                              */
/*==============================================================*/
create table PRODUCTO (
   ID_PRODUCTO          NUMERIC(10)          not null,
   NOMBRE               VARCHAR(20)          null,
   DESCRIPCION          VARCHAR(50)          null,
   PRECIO               DECIMAL(15,2)        null,
   CATEGORIA            VARCHAR(30)          null,
   constraint PK_PRODUCTO primary key (ID_PRODUCTO)
);

alter table ADMINISTRADOR
   add constraint FK_ADMINIST_REFERENCE_CLIENTE foreign key (ID_CLIENTE)
      references CLIENTE (ID_CLIENTE)
      on delete restrict on update restrict;

alter table CARRITO
   add constraint FK_CARRITO_REFERENCE_CLIENTE foreign key (ID_CLIENTE)
      references CLIENTE (ID_CLIENTE)
      on delete restrict on update restrict;

alter table CARRITO
   add constraint FK_CARRITO_REFERENCE_PRODUCTO foreign key (ID_PRODUCTO)
      references PRODUCTO (ID_PRODUCTO)
      on delete restrict on update restrict;

alter table ENVIO
   add constraint FK_ENVIO_REFERENCE_CLIENTE foreign key (ID_CLIENTE)
      references CLIENTE (ID_CLIENTE)
      on delete restrict on update restrict;

alter table FACTURA
   add constraint FK_FACTURA_REFERENCE_PAGO foreign key (ID_PAGO)
      references PAGO (ID_PAGO)
      on delete restrict on update restrict;

alter table PAGO
   add constraint FK_PAGO_REFERENCE_CARRITO foreign key (ID_CARRO)
      references CARRITO (ID_CARRO)
      on delete restrict on update restrict;

alter table PAGO
   add constraint FK_PAGO_REFERENCE_CLIENTE foreign key (ID_CLIENTE)
      references CLIENTE (ID_CLIENTE)
      on delete restrict on update restrict;

