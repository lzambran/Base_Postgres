/*==============================================================*/
/* DBMS name:      PostgreSQL 9.x                               */
/* Created on:     02/03/2021 3:16:17                           */
/*==============================================================*/


drop index CLIENTE_PK;

drop table CLIENTE;

drop index PAGO_EMPLEADO_FK;

drop index EMPRESA_EMPLEADO_FK;

drop index EMPLEADO_PK;

drop table EMPLEADO;

drop index EMPRESA_PK;

drop table EMPRESA;

drop index PAGO_PK;

drop table PAGO;

drop index SERVICIO_POBLACION_FK;

drop index POBLACION_PROVINCIA_FK;

drop index POBLACION_PK;

drop table POBLACION;

drop index PROVINCIA_PK;

drop table PROVINCIA;

drop index SOLICITUD_SERVICIO_FK;

drop index SERVICIO_PK;

drop table SERVICIO;

drop index EMPLEADO_SOLICITUD_FK;

drop index CLIENTE_SOLICITUD_FK;

drop index EMPRESA_SOLICITUD_FK;

drop index SOLICITUD_PK;

drop table SOLICITUD;

drop index SERVICIO_VEHICULO_FK;

drop index VEHICULO_PK;

drop table VEHICULO;

/*==============================================================*/
/* Table: CLIENTE                                               */
/*==============================================================*/
create table CLIENTE (
   ID_CLIENTE           INT4                 not null,
   NOMBRE_CLIENTE       VARCHAR(25)          not null,
   APELLIDO_CLIENTE     VARCHAR(25)          not null,
   DIRECCION_CLIENTE    VARCHAR(25)          not null,
   TELEFONO_CLIENTE     VARCHAR(25)          not null,
   CEDULA_CLIENTE       VARCHAR(10)          not null,
   constraint PK_CLIENTE primary key (ID_CLIENTE)
);

/*==============================================================*/
/* Index: CLIENTE_PK                                            */
/*==============================================================*/
create unique index CLIENTE_PK on CLIENTE (
ID_CLIENTE
);

/*==============================================================*/
/* Table: EMPLEADO                                              */
/*==============================================================*/
create table EMPLEADO (
   ID_EMPLEADO          INT4                 not null,
   ID_EMPRESA           INT4                 null,
   ID_PAGO              INT4                 null,
   NOMBRE_EMPLEADO      VARCHAR(25)          not null,
   APELLIDO_EMPLEADO    VARCHAR(25)          not null,
   DIRECCION_EMPLEADO   VARCHAR(25)          not null,
   TELEFONO_EMPLEADO    VARCHAR(25)          not null,
   TIPO_EMPLEADO        VARCHAR(25)          not null,
   CEDULA_EMPLEADO      VARCHAR(10)          not null,
   constraint PK_EMPLEADO primary key (ID_EMPLEADO)
);

--Datos

insert into Empleado values (8,1,1,'Luis','Zambrano','Las Gilces','0978716971','chofer','1314487222');
insert into Empleado values (2,1,2,'Juan','Alcivar','Crucita','0998751423','Maquinista','1309874532');
insert into Empleado values (1,1,3,'Pedro','Demera','Portoviejo','0987563214','Embalador','1308964781');


/*==============================================================*/
/* Index: EMPLEADO_PK                                           */
/*==============================================================*/
create unique index EMPLEADO_PK on EMPLEADO (
ID_EMPLEADO
);

/*==============================================================*/
/* Index: EMPRESA_EMPLEADO_FK                                   */
/*==============================================================*/
create  index EMPRESA_EMPLEADO_FK on EMPLEADO (
ID_EMPRESA
);

/*==============================================================*/
/* Index: PAGO_EMPLEADO_FK                                      */
/*==============================================================*/
create  index PAGO_EMPLEADO_FK on EMPLEADO (
ID_PAGO
);

/*==============================================================*/
/* Table: EMPRESA                                               */
/*==============================================================*/
create table EMPRESA (
   ID_EMPRESA           INT4                 not null,
   NOMBRE_EMPRESA       VARCHAR(25)          not null,
   DIRECCION_EMPRESA    VARCHAR(25)          not null,
   TELEFONO_EMPRESA     VARCHAR(25)          not null,
   constraint PK_EMPRESA primary key (ID_EMPRESA)
);
--Datos
insert into Empresa values (1,'Pandora','Portoviejo','0928756412');

/*==============================================================*/
/* Index: EMPRESA_PK                                            */
/*==============================================================*/
create unique index EMPRESA_PK on EMPRESA (
ID_EMPRESA
);

/*==============================================================*/
/* Table: PAGO                                                  */
/*==============================================================*/
create table PAGO (
   ID_PAGO              INT4                 not null,
   PAGO                 INT4                 not null,
   FECHA_PAGO           DATE                 not null,
   constraint PK_PAGO primary key (ID_PAGO)
);
 --Datos
insert into Pago values (1,300,'17/2/2021');
insert into Pago values (2,400,'17/2/2021');
insert into Pago values (3,300,'17/2/2021');

/*==============================================================*/
/* Index: PAGO_PK                                               */
/*==============================================================*/
create unique index PAGO_PK on PAGO (
ID_PAGO
);

/*==============================================================*/
/* Table: POBLACION                                             */
/*==============================================================*/
create table POBLACION (
   ID_POBLACION         INT4                 not null,
   ID_PROVINCIA         INT4                 null,
   ID_SERVICIO          INT4                 null,
   NOMBRE_POBLACION     VARCHAR(25)          not null,
   constraint PK_POBLACION primary key (ID_POBLACION)
);

--Datos

insert into Poblacion values (1,1,1,'Jipijapa');
insert into Poblacion values (2,2,2,'Jaramijo');
insert into Poblacion values (3,3,3,'Charapoto');
/*==============================================================*/
/* Index: POBLACION_PK                                          */
/*==============================================================*/
create unique index POBLACION_PK on POBLACION (
ID_POBLACION
);

/*==============================================================*/
/* Index: POBLACION_PROVINCIA_FK                                */
/*==============================================================*/
create  index POBLACION_PROVINCIA_FK on POBLACION (
ID_PROVINCIA
);

/*==============================================================*/
/* Index: SERVICIO_POBLACION_FK                                 */
/*==============================================================*/
create  index SERVICIO_POBLACION_FK on POBLACION (
ID_SERVICIO
);

/*==============================================================*/
/* Table: PROVINCIA                                             */
/*==============================================================*/
create table PROVINCIA (
   ID_PROVINCIA         INT4                 not null,
   NOMBRE_PROVINCIA     VARCHAR(25)          not null,
   constraint PK_PROVINCIA primary key (ID_PROVINCIA)
);

-Datos 

insert into Provincia values (1,'Manabi');
insert into Provincia values (2,'Guayas');
insert into Provincia values (3,'Santa Elena');
/*==============================================================*/
/* Index: PROVINCIA_PK                                          */
/*==============================================================*/
create unique index PROVINCIA_PK on PROVINCIA (
ID_PROVINCIA
);

/*==============================================================*/
/* Table: SERVICIO                                              */
/*==============================================================*/
create table SERVICIO (
   ID_SERVICIO          INT4                 not null,
   ID_SOLICITUD         INT4                 null,
   TIPO_SERVICIO        VARCHAR(25)          not null,
   PRECIO_SERVICIO      INT4                 not null,
   HORA_SERVICIO        TIME                 not null,
   PESO_SERVICIO_KG     VARCHAR(25)          not null,
   FECHA_SERVICIO       DATE                 not null,
   TOTAL_SERVICIO       INT4                 not null,
   IVA_SERVICIO         VARCHAR(15)          not null,
   constraint PK_SERVICIO primary key (ID_SERVICIO)
);

--Datos

insert into Servicio values (1,1,'Embalaje',100,'10:30','null','10-12-2020',100,'null');
insert into Servicio values (2,2,'Desmontaje',300,'10:30','null','16-08-0215',300,'null');
insert into Servicio values (3,3,'Montaje',150,'14:30','null','18-09-2019',150,'null');
insert into Servicio values (4,4,'Limpieza',70,'13:30','null','25-12-2019',70,'null');
insert into Servicio values (5,5,'Embalaje',100,'11:30','null','10-5-2019',100,'null');


/*==============================================================*/
/* Index: SERVICIO_PK                                           */
/*==============================================================*/
create unique index SERVICIO_PK on SERVICIO (
ID_SERVICIO
);

/*==============================================================*/
/* Index: SOLICITUD_SERVICIO_FK                                 */
/*==============================================================*/
create  index SOLICITUD_SERVICIO_FK on SERVICIO (
ID_SOLICITUD
);

/*==============================================================*/
/* Table: SOLICITUD                                             */
/*==============================================================*/
create table SOLICITUD (
   ID_SOLICITUD         INT4                 not null,
   ID_EMPRESA           INT4                 null,
   ID_CLIENTE           INT4                 null,
   ID_EMPLEADO          INT4                 null,
   ACEPTACION_SOLICITUD VARCHAR(25)          not null,
   INICIO_SOLICITUD     VARCHAR(25)          not null,
   DESTINO_SOLICITUD    VARCHAR(25)          not null,
   FECHA_SOLICITUD      DATE                 not null,
   TIPO_SOLICITUD       VARCHAR(25)          not null,
   NUMERO_SOLICITUD     VARCHAR(25)          not null,
   HORA_SOLICITUD       TIME                not null,
   PESOKG_SOLICITUD     VARCHAR(25)          not null,
   VALORPESO_SOLICITUD  INT4                 not null,
   constraint PK_SOLICITUD primary key (ID_SOLICITUD)
);

--Datos
insert into Solicitud values (1,1,1,1,'si','Portoviejo','Manta','28-05-2020','Mudanza','1','11:00','300kg',300);
insert into Solicitud values (2,1,2,2,'si','Jipijapa','Manta','15-05-2020','Mudanza','2','14:00','200kg',200);
insert into Solicitud values (3,1,3,3,'si','Portoviejo','Manta','28-05-2020','Mudanza','3','16:00','300kg',300);
insert into Solicitud values (4,1,4,4,'si','Portoviejo','Manta','28-05-2020','Mudanza','4','09:00','400kg',400);

/*==============================================================*/
/* Index: SOLICITUD_PK                                          */
/*==============================================================*/
create unique index SOLICITUD_PK on SOLICITUD (
ID_SOLICITUD
);

/*==============================================================*/
/* Index: EMPRESA_SOLICITUD_FK                                  */
/*==============================================================*/
create  index EMPRESA_SOLICITUD_FK on SOLICITUD (
ID_EMPRESA
);

/*==============================================================*/
/* Index: CLIENTE_SOLICITUD_FK                                  */
/*==============================================================*/
create  index CLIENTE_SOLICITUD_FK on SOLICITUD (
ID_CLIENTE
);

/*==============================================================*/
/* Index: EMPLEADO_SOLICITUD_FK                                 */
/*==============================================================*/
create  index EMPLEADO_SOLICITUD_FK on SOLICITUD (
ID_EMPLEADO
);

/*==============================================================*/
/* Table: VEHICULO                                              */
/*==============================================================*/
create table VEHICULO (
   ID_VEHICULO          INT4                 not null,
   ID_SERVICIO          INT4                 null,
   TIPO_VEHICULO        VARCHAR(25)          not null,
   ALTURA_VEHICULO      VARCHAR(25)          not null,
   PLACA_VEHICULO       VARCHAR(25)          not null,
   constraint PK_VEHICULO primary key (ID_VEHICULO)
);
--Datos

insert into Vehiculo values (1,1,'Camion','3 metros','GP-5856');
insert into Vehiculo values (2,2,'Grua','5 metros','GW-5848');
insert into Vehiculo values (3,3,'Camioneta','2 metros','GQ-5863');

/*==============================================================*/
/* Index: VEHICULO_PK                                           */
/*==============================================================*/
create unique index VEHICULO_PK on VEHICULO (
ID_VEHICULO
);

/*==============================================================*/
/* Index: SERVICIO_VEHICULO_FK                                  */
/*==============================================================*/
create  index SERVICIO_VEHICULO_FK on VEHICULO (
ID_SERVICIO
);

alter table EMPLEADO
   add constraint FK_EMPLEADO_EMPRESA_E_EMPRESA foreign key (ID_EMPRESA)
      references EMPRESA (ID_EMPRESA)
      on delete restrict on update restrict;

alter table EMPLEADO
   add constraint FK_EMPLEADO_PAGO_EMPL_PAGO foreign key (ID_PAGO)
      references PAGO (ID_PAGO)
      on delete restrict on update restrict;

alter table POBLACION
   add constraint FK_POBLACIO_POBLACION_PROVINCI foreign key (ID_PROVINCIA)
      references PROVINCIA (ID_PROVINCIA)
      on delete restrict on update restrict;

alter table POBLACION
   add constraint FK_POBLACIO_SERVICIO__SERVICIO foreign key (ID_SERVICIO)
      references SERVICIO (ID_SERVICIO)
      on delete restrict on update restrict;

alter table SERVICIO
   add constraint FK_SERVICIO_SOLICITUD_SOLICITU foreign key (ID_SOLICITUD)
      references SOLICITUD (ID_SOLICITUD)
      on delete restrict on update restrict;

alter table SOLICITUD
   add constraint FK_SOLICITU_CLIENTE_S_CLIENTE foreign key (ID_CLIENTE)
      references CLIENTE (ID_CLIENTE)
      on delete restrict on update restrict;

alter table SOLICITUD
   add constraint FK_SOLICITU_EMPLEADO__EMPLEADO foreign key (ID_EMPLEADO)
      references EMPLEADO (ID_EMPLEADO)
      on delete restrict on update restrict;

alter table SOLICITUD
   add constraint FK_SOLICITU_EMPRESA_S_EMPRESA foreign key (ID_EMPRESA)
      references EMPRESA (ID_EMPRESA)
      on delete restrict on update restrict;

alter table VEHICULO
   add constraint FK_VEHICULO_SERVICIO__SERVICIO foreign key (ID_SERVICIO)
      references SERVICIO (ID_SERVICIO)
      on delete restrict on update restrict;

