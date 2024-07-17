CREATE DATABASE FoodInspections
GO
USE FoodInspections
GO
/*
Creacion de las tablas
*/
CREATE TABLE Establecimientos(estNumero int identity not null, 
                              estNombre varchar(40) not null, 
							  estDireccion varchar(60) not null, 
							  estTelefono varchar(50), 
							  estLatitud money, 
							  estLongitud money,
							  constraint pk_Estab primary key(estNumero))
GO
CREATE TABLE Licencias(licNumero int identity not null, 
                       estNumero int not null, 
					   licFchEmision date, 
					   licFchVto date, 
					   licStatus character(3) not null,
					   constraint pk_Licencia primary key(licNumero),
					   constraint fk_EstLic foreign key(estNumero) references Establecimientos(estNumero),
					   constraint ck_StatusLic check(licStatus in ('APR','REV')))
GO
CREATE TABLE TipoViolacion(violCodigo int identity not null, 
                           violDescrip varchar(30) not null,
						   constraint pk_TipoViol primary key(violCodigo))
GO
CREATE TABLE Inspecciones(inspID int identity not null, 
                          inspFecha datetime, 
						  estNumero int not null, 
						  inspRiesgo varchar(5) not null, 
						  inspResultado varchar(25) not null, 
						  violCodigo int not null, 
						  inspComents varchar(100),
						  constraint pk_Inspect primary key(inspID),
						  constraint fk_EstabInsp foreign key(estNumero) references Establecimientos(estNumero),
						  constraint fk_ViolInsp foreign key(violCodigo) references TipoViolacion(violCodigo),
						  constraint ck_Riesgo check(inspRiesgo IN('Bajo','Medio','Alto')),
						  constraint ck_Result check(inspResultado IN('Pasa', 'Falla', 'Pasa con condiciones', 'Oficina no encontrada')))
GO

-- Inserts para Establecimientos
INSERT INTO Establecimientos (estNombre, estDireccion, estTelefono, estLatitud, estLongitud) VALUES ('Restaurante El Buen Sabor', 'Av. Libertador 123', '123-456-789', -34.901234, -56.123456);
INSERT INTO Establecimientos (estNombre, estDireccion, estTelefono, estLatitud, estLongitud) VALUES ('Pizzería Bella Napoli', 'Calle Italia 456', '987-654-321', -34.912345, -56.134567);
INSERT INTO Establecimientos (estNombre, estDireccion, estTelefono, estLatitud, estLongitud) VALUES ('Cafetería Aroma Fresco', 'Av. Brasil 789', '456-789-123', -34.923456, -56.145678);
INSERT INTO Establecimientos (estNombre, estDireccion, estTelefono, estLatitud, estLongitud) VALUES ('Bar El Encuentro', 'Calle Uruguay 1011', '321-654-987', -34.934567, -56.156789);
INSERT INTO Establecimientos (estNombre, estDireccion, estTelefono, estLatitud, estLongitud) VALUES ('Comedor Las Delicias', 'Av. España 1213', '789-123-456', -34.945678, -56.167890);
INSERT INTO Establecimientos (estNombre, estDireccion, estTelefono, estLatitud, estLongitud) VALUES ('Restaurante Mar y Tierra', 'Av. Costanera 1415', '159-357-258', -34.956789, -56.178901);
INSERT INTO Establecimientos (estNombre, estDireccion, estTelefono, estLatitud, estLongitud) VALUES ('Hamburguesería Don Manolo', 'Av. Italia 1617', '753-951-456', -34.967890, -56.189012);
INSERT INTO Establecimientos (estNombre, estDireccion, estTelefono, estLatitud, estLongitud) VALUES ('Parrillada El Fogón', 'Calle Argentina 1819', '246-802-468', -34.978901, -56.190123);
INSERT INTO Establecimientos (estNombre, estDireccion, estTelefono, estLatitud, estLongitud) VALUES ('Café Expresso', 'Av. del Libertador 2021', '357-913-579', -34.989012, -56.201234);
INSERT INTO Establecimientos (estNombre, estDireccion, estTelefono, estLatitud, estLongitud) VALUES ('Pizzería Rápida', 'Calle Bolivia 2223', '468-024-680', -34.990123, -56.212345);


select * from Establecimientos


-- Inserts para Licencias
INSERT INTO Licencias (estNumero, LicFchEmision, LicFchVto, LicStatus) VALUES (1, '2023-01-15', '2024-01-15', 'APR');
INSERT INTO Licencias (estNumero, LicFchEmision, LicFchVto, LicStatus) VALUES (2, '2023-02-20', '2024-02-20', 'APR');
INSERT INTO Licencias (estNumero, LicFchEmision, LicFchVto, LicStatus) VALUES (3, '2023-03-10', '2024-03-10', 'APR');
INSERT INTO Licencias (estNumero, LicFchEmision, LicFchVto, LicStatus) VALUES (4, '2023-04-25', '2024-04-25', 'APR');
INSERT INTO Licencias (estNumero, LicFchEmision, LicFchVto, LicStatus) VALUES (5, '2023-05-05', '2024-05-05', 'APR');
INSERT INTO Licencias (estNumero, LicFchEmision, LicFchVto, LicStatus) VALUES (6, '2023-06-18', '2024-06-18', 'APR');
INSERT INTO Licencias (estNumero, LicFchEmision, LicFchVto, LicStatus) VALUES (7, '2023-07-29', '2024-07-29', 'APR');


select * from Licencias


-- Inserts para TipoViolacion
INSERT INTO TipoViolacion (violDescrip) VALUES ('Insectos en la cocina');
INSERT INTO TipoViolacion (violDescrip) VALUES ('Mal manejo de alimentos');
INSERT INTO TipoViolacion (violDescrip) VALUES ('Mala Higiene');
INSERT INTO TipoViolacion (violDescrip) VALUES ('Mal estado Instalaciones');
INSERT INTO TipoViolacion (violDescrip) VALUES ('Personal no capacitado');

select * from TipoViolacion


-- Inserts para Inspecciones
INSERT INTO Inspecciones (inspFecha, estNumero, inspRiesgo, inspResultado, violCodigo, inspComents) VALUES ('2023-01-20', 1, 'Bajo', 'Pasa', 2, 'Inspección de rutina.');
INSERT INTO Inspecciones (inspFecha, estNumero, inspRiesgo, inspResultado, violCodigo, inspComents) VALUES ('2023-02-25', 2, 'Medio', 'Pasa con condiciones', 3, 'Se requiere mejorar la limpieza en la cocina.');
INSERT INTO Inspecciones (inspFecha, estNumero, inspRiesgo, inspResultado, violCodigo, inspComents) VALUES ('2023-03-30', 3, 'Alto', 'Falla', 1, 'Presencia de cucarachas en el área de almacenamiento.');
INSERT INTO Inspecciones (inspFecha, estNumero, inspRiesgo, inspResultado, violCodigo, inspComents) VALUES ('2023-04-05', 4, 'Bajo', 'Pasa', 5, 'Todo en orden, personal capacitado.');
INSERT INTO Inspecciones (inspFecha, estNumero, inspRiesgo, inspResultado, violCodigo, inspComents) VALUES ('2023-05-10', 5, 'Medio', 'Pasa con condiciones', 2, 'Se detectaron algunas deficiencias en el manejo de alimentos.'); 
INSERT INTO Inspecciones (inspFecha, estNumero, inspRiesgo, inspResultado, violCodigo, inspComents) VALUES ('2023-06-15', 6, 'Alto', 'Oficina no encontrada', 4, 'El establecimiento se encontraba cerrado durante el horario de la inspección.');
INSERT INTO Inspecciones (inspFecha, estNumero, inspRiesgo, inspResultado, violCodigo, inspComents) VALUES ('2023-07-20', 7, 'Bajo', 'Pasa', 4, 'Se realizó mantenimiento preventivo de las instalaciones.'); 
INSERT INTO Inspecciones (inspFecha, estNumero, inspRiesgo, inspResultado, violCodigo, inspComents) VALUES ('2023-08-25', 8, 'Medio', 'Falla', 3, 'Se encontraron múltiples violaciones a las normas de higiene.'); 
INSERT INTO Inspecciones (inspFecha, estNumero, inspRiesgo, inspResultado, violCodigo, inspComents) VALUES ('2023-09-30', 9, 'Alto', 'Pasa con condiciones', 2, 'Se requiere mejorar la limpieza en las áreas de preparación de alimentos.');
INSERT INTO Inspecciones (inspFecha, estNumero, inspRiesgo, inspResultado, violCodigo, inspComents) VALUES ('2023-10-05', 10, 'Bajo', 'Pasa', 3, 'Todo en orden, personal capacitado.');
INSERT INTO Inspecciones (inspFecha, estNumero, inspRiesgo, inspResultado, violCodigo, inspComents) VALUES ('2023-11-10', 1, 'Medio', 'Pasa con condiciones', 1, 'Se detectó la presencia de moscas en el área de preparación.'); 
INSERT INTO Inspecciones (inspFecha, estNumero, inspRiesgo, inspResultado, violCodigo, inspComents) VALUES ('2023-12-15', 2, 'Alto', 'Falla', 4, 'Se detectaron fugas de gas en la cocina.'); 
INSERT INTO Inspecciones (inspFecha, estNumero, inspRiesgo, inspResultado, violCodigo, inspComents) VALUES ('2024-01-20', 3, 'Bajo', 'Pasa', 5, 'Todo en orden, personal capacitado.');
INSERT INTO Inspecciones (inspFecha, estNumero, inspRiesgo, inspResultado, violCodigo, inspComents) VALUES ('2024-02-25', 4, 'Medio', 'Pasa con condiciones', 3, 'Se requiere mejorar la higiene en las áreas comunes.'); 
INSERT INTO Inspecciones (inspFecha, estNumero, inspRiesgo, inspResultado, violCodigo, inspComents) VALUES ('2024-03-30', 5, 'Alto', 'Oficina no encontrada', 1, 'El establecimiento se encontraba cerrado durante el horario de la inspección.');
INSERT INTO Inspecciones (inspFecha, estNumero, inspRiesgo, inspResultado, violCodigo, inspComents) VALUES ('2024-04-05', 6, 'Bajo', 'Pasa', 1, 'Se realizó fumigación para eliminar insectos.'); 
INSERT INTO Inspecciones (inspFecha, estNumero, inspRiesgo, inspResultado, violCodigo, inspComents) VALUES ('2024-05-10', 7, 'Medio', 'Falla', 2, 'Se encontró un mal manejo de alimentos.'); 
INSERT INTO Inspecciones (inspFecha, estNumero, inspRiesgo, inspResultado, violCodigo, inspComents) VALUES ('2024-06-15', 8, 'Alto', 'Pasa con condiciones', 3, 'Se requiere mejorar la limpieza en las áreas de preparación de alimentos.');
INSERT INTO Inspecciones (inspFecha, estNumero, inspRiesgo, inspResultado, violCodigo, inspComents) VALUES ('2024-07-20', 9, 'Bajo', 'Pasa', 5, 'Todo en orden, personal capacitado.');
INSERT INTO Inspecciones (inspFecha, estNumero, inspRiesgo, inspResultado, violCodigo, inspComents) VALUES ('2024-08-25', 10, 'Medio', 'Pasa con condiciones', 4, 'Se detectaron problemas de mantenimiento en las instalaciones.');
INSERT INTO Inspecciones (inspFecha, estNumero, inspRiesgo, inspResultado, violCodigo, inspComents) VALUES ('2024-05-10', 3, 'Alto', 'Falla', 2, 'No saben cocinar pollo al curry');
INSERT INTO Inspecciones (inspFecha, estNumero, inspRiesgo, inspResultado, violCodigo, inspComents) VALUES ('2024-03-23', 3, 'Alto', 'Falla', 3, 'Cocinas totalmente sucias');
INSERT INTO Inspecciones (inspFecha, estNumero, inspRiesgo, inspResultado, violCodigo, inspComents) VALUES ('2024-09-12', 3, 'Alto', 'Falla', 4, 'Cocinas no funcionan correctamente');
INSERT INTO Inspecciones (inspFecha, estNumero, inspRiesgo, inspResultado, violCodigo, inspComents) VALUES ('2024-12-12', 3, 'Alto', 'Falla', 5, 'Personal no esta para nada capacitado.');

select * from Inspecciones


CREATE INDEX idx_estNumero ON Establecimientos(estNumero);
CREATE INDEX idx_estNombre ON Establecimientos(estNombre);
CREATE INDEX idx_estDireccion ON Establecimientos(estDireccion);

CREATE INDEX idx_lic_estNumero_LicStatus ON Licencias(estNumero, LicStatus);
CREATE INDEX idx_lic_LicFchVto ON Licencias(LicFchVto);

CREATE INDEX idx_violCodigo ON TipoViolacion(violCodigo);

CREATE INDEX idx_insp_estNumero_inspFecha ON Inspecciones(estNumero, inspFecha);
CREATE INDEX idx_insp_inspRiesgo ON Inspecciones(inspRiesgo);
CREATE INDEX idx_insp_inspResultado ON Inspecciones(inspResultado);
CREATE INDEX idx_insp_violCodigo ON Inspecciones(violCodigo);

/*
a.	Mostrar nombre, dirección y teléfono de los establecimientos que tuvieron la inspección fallida más reciente.
*/
select e.estNombre, e.estTelefono, e.estDireccion, i.inspFecha
from Establecimientos e, Inspecciones i
where i.estNumero = e.estNumero and 
	  i.inspFecha = (select MAX(inspFecha) from Inspecciones i
						where i.inspResultado LIKE 'falla')

/*
b.	Mostrar los 5 tipos de violaciones mas comunes, el informe debe mostrar código y descripción de la violación y cantidad de inspecciones en el año presente.
*/
select top 5 t.violCodigo, t.violDescrip, count(i.inspID) as cantidadInspeccion
from TipoViolacion t, Inspecciones i
where t.violCodigo = i.violCodigo and
		 YEAR(i.inspFecha) = '2024'
group by t.violCodigo, t.violDescrip

/*
c.	Mostrar número y nombre de los establecimientos que cometieron todos los tipos de violación que existen
*/
select e.estNumero, e.estNombre, i.violCodigo
from Establecimientos e, Inspecciones i
where e.estNumero = i.estNumero and
		i.inspResultado like 'Falla'



SELECT e.estNumero, e.estNombre
FROM Establecimientos e
WHERE (
    SELECT COUNT(DISTINCT violCodigo)
    FROM TipoViolacion
  ) = (
    SELECT COUNT(DISTINCT i.violCodigo)
    FROM Inspecciones i
    WHERE i.estNumero = e.estNumero
  );

/*
d.	Mostrar el porcentaje de inspecciones reprobadas por cada establecimiento,
	incluir dentro de la reprobación las categorías 'Falla', 'Pasa con condiciones'.
*/
SELECT 
    e.estNombre,
    e.estNumero,
    COUNT(i.inspID) AS total_inspecciones,
    SUM(CASE WHEN i.inspResultado IN ('Falla', 'Pasa con condiciones') THEN 1 ELSE 0 END) AS inspecciones_reprobadas,
    ROUND(
        (SUM(CASE WHEN i.inspResultado IN ('Falla', 'Pasa con condiciones') THEN 1 ELSE 0 END) * 100.0) /
        COUNT(i.inspID), 
        2
    ) AS porcentaje_reprobadas
FROM 
    Establecimientos e
LEFT JOIN 
    Inspecciones i ON e.estNumero = i.estNumero
GROUP BY 
    e.estNumero, e.estNombre
ORDER BY 
    porcentaje_reprobadas DESC;

/*
e.	Mostrar el ranking de inspecciones de establecimientos, dicho ranking debe mostrar número y nombre del establecimiento, 
	total de inspecciones, total de inspecciones aprobadas ('Pasa'), porcentaje de dichas inspecciones aprobadas, 
	total de inspecciones reprobadas ('Falla', 'Pasa con condiciones') y porcentaje de dichas inspecciones reprobadas,
	solo tener en cuenta establecimientos cuyo status de licencia es APR.
*/
SELECT 
    e.estNumero,
    e.estNombre,
    COUNT(i.inspID) AS total_inspecciones,
    SUM(CASE WHEN i.inspResultado = 'Pasa' THEN 1 ELSE 0 END) AS total_aprobadas,
    ROUND(
        (SUM(CASE WHEN i.inspResultado = 'Pasa' THEN 1 ELSE 0 END) * 100.0) / COUNT(i.inspID), 
        2
    ) AS porcentaje_aprobadas,
    SUM(CASE WHEN i.inspResultado IN ('Falla', 'Pasa con condiciones') THEN 1 ELSE 0 END) AS total_reprobadas,
    ROUND(
        (SUM(CASE WHEN i.inspResultado IN ('Falla', 'Pasa con condiciones') THEN 1 ELSE 0 END) * 100.0) / COUNT(i.inspID), 
        2
    ) AS porcentaje_reprobadas
FROM 
    Establecimientos e
JOIN 
    Licencias l ON e.estNumero = l.estNumero
LEFT JOIN 
    Inspecciones i ON e.estNumero = i.estNumero
WHERE 
    l.LicStatus = 'APR'
GROUP BY 
    e.estNumero, e.estNombre
ORDER BY 
    porcentaje_aprobadas DESC, total_inspecciones DESC;

/*
f.	Mostrar la diferencia de días en que cada establecimiento renovó su licencia
*/
WITH LicenciasOrdenadas AS (
    SELECT 
        estNumero,
        LicFchEmision,
        LicFchVto,
        ROW_NUMBER() OVER (PARTITION BY estNumero ORDER BY LicFchEmision DESC) AS rn
    FROM 
        Licencias
)
SELECT 
    lo1.estNumero,
    e.estNombre,
    lo1.LicFchEmision AS fecha_renovacion,
    lo2.LicFchVto AS fecha_vencimiento_anterior,
    DATEDIFF(DAY, lo1.LicFchEmision, lo2.LicFchVto) AS diferencia_dias
FROM 
    LicenciasOrdenadas lo1
LEFT JOIN 
    LicenciasOrdenadas lo2 ON lo1.estNumero = lo2.estNumero AND lo1.rn = lo2.rn - 1
JOIN 
    Establecimientos e ON lo1.estNumero = e.estNumero
WHERE 
    lo1.rn = 1
ORDER BY 
    lo1.estNumero;


--4 TSQL
/*
a.	Escribir un procedimiento almacenado que dado un tipo de riesgo ('Bajo','Medio','Alto'), 
	muestre los datos de las violaciones (violCodigo, violDescrip) para dicho tipo, no devolver datos repetidos.
*/
CREATE PROCEDURE ObtenerViolacionesPorRiesgo
    @Riesgo NVARCHAR(10)
AS
BEGIN
    SET NOCOUNT ON;

    SELECT DISTINCT
        tv.violCodigo,
        tv.violDescrip
    FROM
        Inspecciones i
    JOIN
        TipoViolacion tv ON i.violCodigo = tv.violCodigo
    WHERE
        i.inspRiesgo = @Riesgo
    ORDER BY
        tv.violCodigo;
END;

/*
b.	Mediante una función que reciba un código de violación, devolver cuantos 
	establecimientos con licencia vencida y nunca renovada tuvieron dicha violación
*/
CREATE FUNCTION CantidadEstablecimientosConViolacionLicenciaVencida
(
    @violCodigo INT
)
RETURNS INT
AS
BEGIN
    DECLARE @cantidad INT;

    SELECT @cantidad = COUNT(DISTINCT e.estNumero)
    FROM Establecimientos e
    JOIN Inspecciones i ON e.estNumero = i.estNumero
    JOIN Licencias l ON e.estNumero = l.estNumero
    WHERE i.violCodigo = @violCodigo
      AND l.LicFchVto < GETDATE() -- Licencia vencida
      AND l.LicNumero NOT IN (
          SELECT LicNumero
          FROM Licencias l2
          WHERE l2.estNumero = e.estNumero
            AND l2.LicFchEmision > l.LicFchVto
      );

    RETURN @cantidad;
END;

/*
c.	Escribir un procedimiento almacenado que dado un rango de fechas, retorne por parámetros de salida la cantidad 
	de inspecciones que tuvieron un resultado 'Oficina no encontrada' y la cantidad de inspecciones que no tienen comentarios.
*/
CREATE PROCEDURE ObtenerInspeccionesPorFecha
(
    @FechaInicio DATE,
    @FechaFin DATE,
    @CantidadOficinaNoEncontrada INT OUTPUT,
    @CantidadSinComentarios INT OUTPUT
)
AS
BEGIN
    SET NOCOUNT ON;

    -- Calcular la cantidad de inspecciones con resultado 'Oficina no encontrada'
    SELECT @CantidadOficinaNoEncontrada = COUNT(*)
    FROM Inspecciones
    WHERE inspFecha BETWEEN @FechaInicio AND @FechaFin
      AND inspResultado = 'Oficina no encontrada';

    -- Calcular la cantidad de inspecciones sin comentarios
    SELECT @CantidadSinComentarios = COUNT(*)
    FROM Inspecciones
    WHERE inspFecha BETWEEN @FechaInicio AND @FechaFin
      AND (inspComents IS NULL OR inspComents = '');

END;


--5 Disparadores
/*
a.	Cada vez que se crea un nuevo establecimiento, se debe crear una licencia de aprobación 
	con vencimiento 90 días, el disparador debe ser escrito teniendo en cuenta la posibilidad 
	de ingresos múltiples.
*/
GO
CREATE TRIGGER trg_AfterInsertEstablecimiento
ON Establecimientos
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    -- Insertar una nueva licencia de aprobación con vencimiento a 90 días para cada nuevo establecimiento
    INSERT INTO Licencias (estNumero, LicFchEmision, LicFchVto, LicStatus)
    SELECT 
        i.estNumero,
        GETDATE() AS LicFchEmision,
        DATEADD(DAY, 90, GETDATE()) AS LicFchVto,
        'APR' AS LicStatus
    FROM 
        INSERTED i;
END;

/*
b.	No permitir que se ingresen inspecciones de establecimientos cuya licencia está próxima a vencer,
	se entiende por próxima a vencer a todas aquellas cuyo vencimiento esté dentro de los siguientes 5 días, 
	el disparador debe tener en cuenta la posibilidad de registros múltiples.
*/
GO
CREATE TRIGGER trg_BeforeInsertInspecciones
ON Inspecciones
INSTEAD OF INSERT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @FechaActual DATE = GETDATE();

    -- Verificar si alguno de los establecimientos tiene una licencia próxima a vencer
    IF EXISTS (
        SELECT 1
        FROM INSERTED i
        JOIN Licencias l ON i.estNumero = l.estNumero
        WHERE l.LicFchVto BETWEEN @FechaActual AND DATEADD(DAY, 5, @FechaActual)
          AND l.LicStatus = 'APR'
    )
    BEGIN
        -- Lanzar un error si se encuentra alguna licencia próxima a vencer
        RAISERROR ('No se puede ingresar inspecciones para establecimientos con licencias próximas a vencer en los próximos 5 días.', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END

    -- Si todas las validaciones pasan, realizar la inserción
    INSERT INTO Inspecciones (inspFecha, estNumero, inspRiesgo, inspResultado, violCodigo, inspComents)
    SELECT inspFecha, estNumero, inspRiesgo, inspResultado, violCodigo, inspComents
    FROM INSERTED;
END;

--6 Vista
/*
6.	Escribir una vista que muestre todos los datos de las licencias vigentes 
	y los días que faltan para el vencimiento de cada una de ellas.
*/
GO
CREATE VIEW LicenciasVigentes
AS
SELECT 
    LicNumero,
    estNumero,
    LicFchEmision,
    LicFchVto,
    LicStatus,
    DATEDIFF(DAY, GETDATE(), LicFchVto) AS DiasParaVencimiento
FROM 
    Licencias
WHERE 
    LicFchVto >= GETDATE() AND LicStatus = 'APR';