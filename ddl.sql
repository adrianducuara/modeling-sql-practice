create schema flota_vehiculo authorization postgres

--grupo_empresarial table

create table flota_vehiculo.grupo_empresarial(
	id_grupo_empresarial varchar(15) not null,
	nombre varchar(20) not null,
	constraint id_grupo_empresarial_PK primary key(id_grupo_empresarial)
);

--aseguradora table

create table flota_vehiculo.aseguradora(
	id_aseguradora varchar(15) not null,
	nombre varchar(30) not null,
	telefono varchar(11) not null,
	email varchar(20) not null,
	constraint id_aseguradora_PK primary key(id_aseguradora)
);

--moneda table

create table flota_vehiculo.moneda(
	id_moneda varchar(15) not null,
	nombre varchar(10),
	constraint id_moneda_PK primary key(id_moneda)
);

--marca table

create table flota_vehiculo.marca(
	id_marca varchar(15) not null,
	grupo_empresarial varchar(15) not null,
	nombre varchar(20) not null,
	constraint id_marca_PK primary key(id_marca)
);

alter table flota_vehiculo.marca
add constraint grupo_empresarial_FK foreign key(grupo_empresarial)
references flota_vehiculo.grupo_empresarial(id_grupo_empresarial);

--modelo table

create table flota_vehiculo.modelo(
	id_modelo varchar(15) not null,
	marca varchar(15) not null,
	nombre varchar(20) not null,
	constraint id_modelo_PK primary key(id_modelo)
);

alter table flota_vehiculo.modelo
add constraint marca_FK foreign key(marca)
references flota_vehiculo.marca(id_marca);

--coche table

create table flota_vehiculo.coche(
	matricula varchar(15) not null,
	modelo varchar(15) not null,
	marca varchar(15) not null,
	aseguradora varchar(15) not null,
	color varchar(10) not null,
	kilometro integer not null,
	num_poliza varchar(30) not null,
	fecha_compra date not null,
	constraint matricula_PK primary key(matricula)
);

alter table flota_vehiculo.coche
add constraint marca_vechiculo_FK foreign key(marca)
references flota_vehiculo.marca(id_marca);

alter table flota_vehiculo.coche
add constraint modelo_FK foreign key(modelo)
references flota_vehiculo.modelo(id_modelo);

alter table flota_vehiculo.coche
add constraint aseguradora_FK foreign key(aseguradora)
references flota_vehiculo.aseguradora(id_aseguradora);

--revision table

create table flota_vehiculo.revision(
	id_revision varchar(15) not null,
	kilometro_revision integer not null,
	fecha_revision date not null,
	importe_valor integer not null,
	importe_tipo varchar(15) not null,
	constraint id_revision_PK primary key(id_revision)
);

alter table flota_vehiculo.revision
add constraint importe_tipo_FK foreign key(importe_tipo)
references flota_vehiculo.moneda(id_moneda);

--history hist_coche_revision table

create table flota_vehiculo.historia_coche_revision(
	id_historia_revision varchar(15) not null,
	matricula_revision varchar(15) not null,
	revision_historia varchar(15) not null,
	constraint id_historia_revision_PK primary key(id_historia_revision)
);

alter table flota_vehiculo.historia_coche_revision
add constraint matricula_revision_FK foreign key(matricula_revision)
references flota_vehiculo.coche(matricula);

alter table flota_vehiculo.historia_coche_revision
add constraint revision_historia_FK foreign key(revision_historia)
references flota_vehiculo.revision(id_revision);
