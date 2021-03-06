create database Hospital;

use Hospital;

CREATE TABLE Pacientes (
Id_paciente int identity,
NumeroHistorialClinico int primary key,
Nombre_Paciente varchar(50)NOT NULL,
Apellido_Paciente varchar(50)NOT NULL,
Observaciones varchar(150)NOT NULL
);

CREATE TABLE Medico (
Id_Medico int identity,
Codigo_Identificacion_Medico int primary key,
Nombre_Medico varchar(50)NOT NULL,
Apellido_Medico varchar(50)NOT NULL,
NumeroDeColegiado varchar(50)NOT NULL,
Cargo varchar(150)NOT NULL
);

CREATE TABLE Ingreso (
 Id_Ingreso INT PRIMARY KEY identity,
 Tipo_Consulta VARCHAR(150) NOT NULL,
 FechaIngreso date default getdate(),
 Numero_Planta int NOT NULL,
 Numero_Cama int NOT NULL,
 Observaciones varchar(50),
 NumeroHistorialClinico INT NOT NULL,
 Codigo_Identificacion_Medico int NOT NULL

 FOREIGN KEY (NumeroHistorialClinico) REFERENCES Pacientes(NumeroHistorialClinico),
 FOREIGN KEY (Codigo_Identificacion_Medico) REFERENCES Medico(Codigo_Identificacion_Medico)
);

create table Datospac(
 Id_Datos INT PRIMARY KEY identity,
 NumeroHistorialClinico int,
 Sexo_Paciente varchar(50)NOT NULL,
 Departamento_Paciente varchar(50)NOT NULL,
 Municipio_Paciente varchar(50)NOT NULL,
 Cod_Postal varchar(50)NOT NULL,
 Tel_Paciente Int,
 FOREIGN KEY (NumeroHistorialClinico) REFERENCES Pacientes(NumeroHistorialClinico),
);

create table DatosMed(
 Id_Dato INT PRIMARY KEY identity,
 Codigo_Identificacion_Medico int,
 Sexo_Medico varchar (50)NOT NULL,
 Tel_Medico int NOT NULL,

  FOREIGN KEY (Codigo_Identificacion_Medico) REFERENCES Medico(Codigo_Identificacion_Medico),
);

create table Especialidad(
 Id_Especialidad INT PRIMARY KEY identity,
 Codigo_Identificacion_Medico int,
 Especializacion varchar (50)NOT NULL,

  FOREIGN KEY (Codigo_Identificacion_Medico) REFERENCES Medico(Codigo_Identificacion_Medico),
);

-----Insercion de datos en un d?a de Consulta en el Hospital----

INSERT INTO Pacientes VALUES( 321, 'Juan','Vasquez','Dolor de cabeza');
INSERT INTO Pacientes VALUES( 322, 'Pedro','Henriquez','Dolor de estomago');
INSERT INTO Pacientes VALUES( 323, 'Joaquin','Lopez','Cortadura brazo');
INSERT INTO Pacientes VALUES( 324, 'Alex','Quijano','Vomito');
INSERT INTO Pacientes VALUES( 325, 'Caty','Flores','COVID');
INSERT INTO Pacientes VALUES( 326, 'Erving','Echeverria','Mareo');
INSERT INTO Pacientes VALUES( 327, 'Ignacio','Posada','Fiebre');
INSERT INTO Pacientes VALUES( 328, 'Adolfo','Quezada','Fiebre');
INSERT INTO Pacientes VALUES( 329, 'Alexandra','Alvarenga','Cita');
INSERT INTO Pacientes VALUES( 330, 'Leonora','Mancia','Dolor de muelas');

INSERT INTO Datospac VALUES( 321,'M','Chalatenango', 'Chalatenago','1fre3',78654327);
INSERT INTO Datospac VALUES( 322,'M','San Vicente', 'Las Flores','7yre3',78344357);
INSERT INTO Datospac VALUES( 323,'M','Usulutan', 'Las Cumbres','hsbj3',76543892);
INSERT INTO Datospac VALUES( 324,'M','San Miguel', 'San Isidro','bga6s',76539830);
INSERT INTO Datospac VALUES( 325,'F','San Salvador', 'Santa Tecla','8usua',65234532);
INSERT INTO Datospac VALUES( 326,'M','Santa Ana', 'Metapan','89yse',60078965);
INSERT INTO Datospac VALUES( 327,'M','Chalatenango', 'La Palma','bsy6s',78922537);
INSERT INTO Datospac VALUES( 328,'M','Ahuachapan', 'Cruces','wy63e',78654321);
INSERT INTO Datospac VALUES( 329,'F','Sonsonate', 'Santo Tomas','lso92',73247642);
INSERT INTO Datospac VALUES( 330,'F','Caba?as', 'Cojutepeque','nus7',76549080);

INSERT INTO Medico VALUES( 23, 'Ricardo','Benitez', '3r87te','Doctor');
INSERT INTO Medico VALUES( 24, 'Angela','Arrua', '387te','Doctora');
INSERT INTO Medico VALUES( 25, 'Vladimir','Manriquez', '3t5e4','Asistente');
INSERT INTO Medico VALUES( 26, 'Irma','Flores', '365rt','Doctora');
INSERT INTO Medico VALUES( 27, 'Antonio','Aguilar', '3y654','Enfermero');
INSERT INTO Medico VALUES( 28, 'Fernanda','Rivas', '3765t','Doctora');


INSERT INTO DatosMed VALUES(23,'M',78654327);
INSERT INTO DatosMed VALUES(24,'F',78654327);
INSERT INTO DatosMed VALUES(25,'M',78654327);
INSERT INTO DatosMed VALUES(26,'F',78654327);
INSERT INTO DatosMed VALUES(27,'M',78654327);
INSERT INTO DatosMed VALUES(28,'F',78654327);

INSERT INTO Especialidad VALUES(23,'Pediatra');
INSERT INTO Especialidad VALUES(24,'General');
INSERT INTO Especialidad VALUES(25,'Cirujano');
INSERT INTO Especialidad VALUES(26,'Odontologa');
INSERT INTO Especialidad VALUES(27,'Enfermero');
INSERT INTO Especialidad VALUES(28,'Ginecologa');


INSERT INTO Ingreso VALUES( 'General','',1,10, 'Paciente Grave',321,23);
INSERT INTO Ingreso VALUES( 'General','',2,12, 'Observacion',325,27);
INSERT INTO Ingreso VALUES( 'Especializada','',1,1, 'Cirujia',323,25);
INSERT INTO Ingreso VALUES( 'Especializada','',1,6, 'Estable',321,23);
INSERT INTO Ingreso VALUES( 'General','',1,9, 'Grave',324,26);
INSERT INTO Ingreso VALUES( 'General','',2,4, 'Cita',329,28);
INSERT INTO Ingreso VALUES( 'Especializada','',1,45, 'Grave',330,26);
INSERT INTO Ingreso VALUES( 'Especializada','',2,7, 'Estable',322,24);
INSERT INTO Ingreso VALUES( 'General','',2,12, 'Estable',325,27);
INSERT INTO Ingreso VALUES( 'Especializada','',1,8, 'Estable',326,27);
INSERT INTO Ingreso VALUES( 'General','',2,5, 'Estable',327,24);
INSERT INTO Ingreso VALUES( 'General','',2,2, 'Estable',328,25);
INSERT INTO Ingreso VALUES( 'Especializada','',1,8, 'Estable',326,27);
INSERT INTO Ingreso VALUES( 'General','',2,5, 'Grave',327,24);
INSERT INTO Ingreso VALUES( 'General','',2,2, 'Grave',328,25);
INSERT INTO Ingreso VALUES( 'General','',2,5, 'Grave',327,24);
INSERT INTO Ingreso VALUES( 'General','',2,2, 'Estable',328,25);


select * from Pacientes;
select * from Datospac;

select * from Medico;
select * from DatosMed;
select * from Especialidad;

select * from Ingreso;

