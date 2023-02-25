--insert data grupo_empresarial
insert into flota_vehiculo.grupo_empresarial
(id_grupo_empresarial, nombre)
values ('001', 'tata');

insert into flota_vehiculo.grupo_empresarial
(id_grupo_empresarial, nombre)
values ('002', 'hyundai');


--insert data aseguradora
insert into flota_vehiculo.aseguradora
(id_aseguradora, nombre, telefono, email)
values ('001', 'sura', '2469867', 'sura@sura.gov');

insert into flota_vehiculo.aseguradora
(id_aseguradora, nombre, telefono, email)
values ('002', 'soat', '2424405', 'soat@gmail.com');

-- insert data moneda
insert into flota_vehiculo.moneda
(id_moneda, nombre)
values ('001', 'USD');

insert into flota_vehiculo.moneda
(id_moneda, nombre)
values ('002', 'COL');

insert into flota_vehiculo.moneda
(id_moneda, nombre)
values ('003', 'EUR');

-- insert data marca
insert into flota_vehiculo.marca
(id_marca, grupo_empresarial, nombre)
values ('001', '001', 'kia');

insert into flota_vehiculo.marca
(id_marca, grupo_empresarial, nombre)
values ('002', '002', 'chevrolet');


-- insert data modelo
insert into flota_vehiculo.modelo
(id_modelo, marca, nombre)
values ('001', '002', 'aveo');

insert into flota_vehiculo.modelo
(id_modelo, marca, nombre)
values ('002', '001', 'spark');

-- insert data coche
insert into flota_vehiculo.coche
(matricula, modelo, marca, aseguradora, color, kilometro, num_poliza, fecha_compra)
values ('xhg045', '001', '002', '001', 'negro', 2000, '3-0000054342', '2010-03-18');

insert into flota_vehiculo.coche
(matricula, modelo, marca, aseguradora, color, kilometro, num_poliza, fecha_compra)
values ('kjh435', '001', '002', '001', 'rojo', 1200, '4-00299448', '2018-11-20');

insert into flota_vehiculo.coche
(matricula, modelo, marca, aseguradora, color, kilometro, num_poliza, fecha_compra)
values ('llvp321', '002', '001', '001', 'gris', 1500, '0-00003941', '2020-08-15');

insert into flota_vehiculo.coche
(matricula, modelo, marca, aseguradora, color, kilometro, num_poliza, fecha_compra)
values ('gfj446', '001', '002', '002', 'vinotinto', 3000, '8-00023883', '2021-04-18');

-- insert data revision
insert into flota_vehiculo.revision
(id_revision, kilometro_revision, fecha_revision, importe_valor, importe_tipo)
values ('001', 3000, '2021-11-20', 50000, '002');

insert into flota_vehiculo.revision
(id_revision, kilometro_revision, fecha_revision, importe_valor, importe_tipo)
values ('002', 3000, '2022-03-26', 65000, '002');

-- insert data historia_coche_revision
insert into flota_vehiculo.historia_coche_revision
(id_historia_revision, matricula_revision, revision_historia)
values ('001', 'kjh435', '001');

insert into flota_vehiculo.historia_coche_revision
(id_historia_revision, matricula_revision, revision_historia)
values ('002', 'gfj446', '002');


--Generate query for car list and information
select 
mo.nombre as "Modelo", 
mr.nombre as "Marca",
g.nombre as "Grupo de coches",
c.fecha_compra as "Fecha compra", 
c.matricula as "Matrícula", 
c.color as "Color", 
c.kilometro as "Total kilómetros", 
a.nombre as "Empresa aseguradora", 
c.num_poliza as "Número de poliza"
from flota_vehiculo.coche as c
inner join flota_vehiculo.modelo as mo 
on c.modelo = mo.id_modelo
inner join flota_vehiculo.marca as mr
on c.marca = mr.id_marca 
inner join flota_vehiculo.aseguradora as a
on c.aseguradora = a.id_aseguradora
inner join flota_vehiculo.grupo_empresarial as g
on mr.grupo_empresarial = g.id_grupo_empresarial








