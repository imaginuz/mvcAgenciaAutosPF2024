
Create DATABASE agenciadb;
CREATE TABLE autos (
    id_auto INT AUTO_INCREMENT PRIMARY KEY,  
    marca VARCHAR(50) NOT NULL,             
    modelo VARCHAR(50) NOT NULL,            
    anio YEAR NOT NULL,                      
    registro VARCHAR(20) UNIQUE NOT NULL,    
    estado ENUM('nuevo', 'usado') NOT NULL,  
    precio DECIMAL(10,2) NOT NULL,           
    precio_min DECIMAL(10,2) NOT NULL,       
    autoImgUrl VARCHAR(255) NULL          
);

CREATE TABLE factura (
    id_factura INT AUTO_INCREMENT PRIMARY KEY,  -- ID único de la factura
    fecha_factura DATETIME NOT NULL,             -- Fecha de la factura
    total DECIMAL(10,2) NOT NULL,                -- Total de la factura
    detalles TEXT NULL,                          -- Detalles adicionales de la factura
    usercod BIGINT(10) NOT NULL,                 -- Código del usuario (cliente o vendedor)
    pagos VARCHAR(50) NOT NULL,                  -- Método de pago o información sobre pagos
    FOREIGN KEY (usercod) REFERENCES usuario(usercod) -- Relación con la tabla usuario
);


CREATE TABLE facturadetalle (
    id_factura INT NOT NULL,                 -- ID de la factura (relación con la tabla factura)
    id_item INT NOT NULL,                    -- ID del ítem o producto en la factura
    cantidad INT NOT NULL,                   -- Cantidad de productos o ítems en la factura
    precio_unitario DECIMAL(10,2) NOT NULL,  -- Precio unitario del ítem o producto
    PRIMARY KEY (id_factura, id_item),       -- Clave primaria compuesta por id_factura y id_item
    FOREIGN KEY (id_factura) REFERENCES factura(id_factura), -- Llave foránea a la tabla factura
    FOREIGN KEY (id_item) REFERENCES autos(id_auto)           -- Llave foránea a la tabla autos (o productos)
);

CREATE TABLE
    usuario (
        usercod bigint(10) NOT NULL AUTO_INCREMENT,
        useremail varchar(80) DEFAULT NULL,
        username varchar(80) DEFAULT NULL,
        userpswd varchar(128) DEFAULT NULL,
        userfching datetime DEFAULT NULL,
        userpswdest char(3) DEFAULT NULL,
        userpswdexp datetime DEFAULT NULL,
        userest char(3) DEFAULT NULL,
        useractcod varchar(128) DEFAULT NULL,
        userpswdchg varchar(128) DEFAULT NULL,
        usertipo char(3) DEFAULT NULL COMMENT 'Tipo de Usuario, Normal, Consultor o Cliente',
        PRIMARY KEY (usercod),
        UNIQUE KEY useremail_UNIQUE (useremail),
        KEY usertipo (
            usertipo,
            useremail,
            usercod,
            userest
        )
    ) ENGINE = InnoDB AUTO_INCREMENT = 1 DEFAULT CHARSET = utf8;

CREATE TABLE
    roles (
        rolescod varchar(128) NOT NULL,
        rolesdsc varchar(45) DEFAULT NULL,
        rolesest char(3) DEFAULT NULL,
        PRIMARY KEY (rolescod)
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8;

CREATE TABLE
    roles_usuarios (
        usercod bigint(10) NOT NULL,
        rolescod varchar(128) NOT NULL,
        roleuserest char(3) DEFAULT NULL,
        roleuserfch datetime DEFAULT NULL,
        roleuserexp datetime DEFAULT NULL,
        PRIMARY KEY (usercod, rolescod),
        KEY rol_usuario_key_idx (rolescod),
        CONSTRAINT rol_usuario_key FOREIGN KEY (rolescod) REFERENCES roles (rolescod) ON DELETE NO ACTION ON UPDATE NO ACTION,
        CONSTRAINT usuario_rol_key FOREIGN KEY (usercod) REFERENCES usuario (usercod) ON DELETE NO ACTION ON UPDATE NO ACTION
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8;

CREATE TABLE
    funciones (
        fncod varchar(255) NOT NULL,
        fndsc varchar(255) DEFAULT NULL,
        fnest char(3) DEFAULT NULL,
        fntyp char(3) DEFAULT NULL,
        PRIMARY KEY (fncod)
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8;

CREATE TABLE
    funciones_roles (
        rolescod varchar(128) NOT NULL,
        fncod varchar(255) NOT NULL,
        fnrolest char(3) DEFAULT NULL,
        fnexp datetime DEFAULT NULL,
        PRIMARY KEY (rolescod, fncod),
        KEY rol_funcion_key_idx (fncod),
        CONSTRAINT funcion_rol_key FOREIGN KEY (rolescod) REFERENCES roles (rolescod) ON DELETE NO ACTION ON UPDATE NO ACTION,
        CONSTRAINT rol_funcion_key FOREIGN KEY (fncod) REFERENCES funciones (fncod) ON DELETE NO ACTION ON UPDATE NO ACTION
    ) ENGINE = InnoDB DEFAULT CHARSET = utf8;

CREATE TABLE
    bitacora (
        bitacoracod int(11) NOT NULL AUTO_INCREMENT,
        bitacorafch datetime DEFAULT NULL,
        bitprograma varchar(255) DEFAULT NULL,
        bitdescripcion varchar(255) DEFAULT NULL,
        bitobservacion mediumtext,
        bitTipo char(3) DEFAULT NULL,
        bitusuario bigint(18) DEFAULT NULL,
        PRIMARY KEY (bitacoracod)
    ) ENGINE = InnoDB AUTO_INCREMENT = 10 DEFAULT CHARSET = utf8;   

CREATE TABLE carrito (
    id_carrito INT AUTO_INCREMENT PRIMARY KEY,
    id_auto INT NOT NULL,
    cantidad INT NOT NULL DEFAULT 1,
    fecha_agregado DATETIME NOT NULL DEFAULT NOW(),
    estado ENUM('pendiente', 'comprado') DEFAULT 'pendiente',
    FOREIGN KEY (id_auto) REFERENCES autos(id_auto)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


INSERT INTO autos (marca, modelo, anio, registro, estado, precio, precio_min, autoImgUrl) 
VALUES
 ('Nissan', 'Altima', 2021, 'MNO123456', 'nuevo', 27000.00, 25000.00, 'https://hips.hearstapps.com/hmg-prod/images/2021-nissan-altima-mmp-1-1603227990.jpg?crop=0.845xw:0.714xh;0.0849xw,0.212xh&resize=1200:*'),
    ('Hyundai', 'Elantra', 2020, 'PQR789101', 'usado', 19000.00, 17000.00, 'https://fuelcarmagazine.com/wp-content/uploads/2021/07/%C2%A9-Hyundai-696x365.jpg'),
    ('Kia', 'Sportage', 2022, 'STU456789', 'nuevo', 30000.00, 28000.00, 'https://cdn.autobild.es/sites/navi.axelspringer.es/public/media/image/2021/11/kia-sportage-2022-2539817.jpg?tf=1200x'),
    ('Audi', 'A4', 2022, 'BCD667788', 'nuevo', 42000.00, 40000.00, 'https://hips.hearstapps.com/hmg-prod/images/2022-audi-a4-mmp-1-1621027611.jpg?crop=0.795xw:0.671xh;0.0849xw,0.178xh&resize=1200:*'),
    
    ('Subaru', 'Outback', 2020, 'HIJ556677', 'usado', 22000.00, 20000.00, 'https://hips.hearstapps.com/hmg-prod/images/2020-subaru-outback-touring-2p5l-103-1578936312.jpg?crop=0.757xw:0.694xh;0.0472xw,0.306xh&resize=2048:*')

INSERT INTO roles (rolescod, rolesdsc, rolesest) VALUES
('Publico', 'Para los que se registran de manera natural en la página', 'ACT'),
('Auditor', 'Para los empleados', 'ACT'),
('Admin', 'Para los administradores', 'ACT');

INSERT INTO funciones (fncod, fndsc, fnest, fntyp) VALUES
('Menu_Usuarios', 'Menú de usuarios - Acceso exclusivo para Administradores y Auditores', 'ACT', 'MNU'),
('usuarios_INS_enabled', 'Función para habilitar inserción de usuarios - Solo para Administradores', 'ACT', 'SEC'),
('usuarios_UPD_enabled', 'Función para habilitar actualización de usuarios - Solo para Administradores', 'ACT', 'SEC'),
('usuarios_DEL_enabled', 'Función para habilitar eliminación de usuarios - Solo para Administradores', 'ACT', 'SEC');
INSERT INTO funciones (fncod, fndsc, fnest, fntyp) VALUES
('Menu_Tienda', 'Acceso al menú de la tienda', 'ACT', 'GEN'),
('Menu_Carrito', 'Acceso al carrito de compras', 'ACT', 'GEN'),
('Menu_PaymentCheckout', 'Acceso al proceso de pago', 'ACT', 'GEN'),
('Menu_Autos', 'Acceso al menú de gestión de autos', 'ACT', 'ADM');

INSERT INTO funciones_roles (rolescod, fncod, fnrolest, fnexp) VALUES
('Publico', 'Menu_Tienda', 'ACT', DATE_ADD(NOW(), INTERVAL 1 YEAR)),
('Publico', 'Menu_Carrito', 'ACT', DATE_ADD(NOW(), INTERVAL 1 YEAR)),
('Publico', 'Menu_PaymentCheckout', 'ACT', DATE_ADD(NOW(), INTERVAL 1 YEAR)),
('Admin', 'Menu_Tienda', 'ACT', DATE_ADD(NOW(), INTERVAL 1 YEAR)),
('Admin', 'Menu_Carrito', 'ACT', DATE_ADD(NOW(), INTERVAL 1 YEAR)),
('Admin', 'Menu_PaymentCheckout', 'ACT', DATE_ADD(NOW(), INTERVAL 1 YEAR)),
('Admin', 'Menu_Autos', 'ACT', DATE_ADD(NOW(), INTERVAL 1 YEAR));

INSERT INTO funciones_roles (rolescod, fncod, fnrolest, fnexp) VALUES
('Auditor', 'Menu_Tienda', 'ACT', DATE_ADD(NOW(), INTERVAL 1 YEAR)),
('Auditor', 'Menu_Carrito', 'ACT', DATE_ADD(NOW(), INTERVAL 1 YEAR)),
('Auditor', 'Menu_PaymentCheckout', 'ACT', DATE_ADD(NOW(), INTERVAL 1 YEAR));

INSERT INTO funciones (fncod, fndsc, fnest, fntyp) VALUES
('Controllers\\Autos\\AutosList', 'Acceso a la lista de autos en el controlador', 'ACT', 'CTR');

INSERT INTO funciones_roles (rolescod, fncod, fnrolest, fnexp) VALUES
('Admin', 'Controllers\\Autos\\AutosList', 'ACT', DATE_ADD(NOW(), INTERVAL 1 YEAR));

INSERT INTO funciones (fncod, fndsc, fnest, fntyp) 
VALUES ('Controllers\\Checkout\\Checkout', 'Acceso al controlador de Checkout', 'ACT', 'CTR');

INSERT INTO funciones_roles (rolescod, fncod, fnrolest, fnexp) 
VALUES 
('Publico', 'Controllers\\Checkout\\Checkout', 'ACT', DATE_ADD(NOW(), INTERVAL 1 YEAR)),
('Auditor', 'Controllers\\Checkout\\Checkout', 'ACT', DATE_ADD(NOW(), INTERVAL 1 YEAR)),
('Admin', 'Controllers\\Checkout\\Checkout', 'ACT', DATE_ADD(NOW(), INTERVAL 1 YEAR));

INSERT INTO funciones (fncod, fndsc, fnest, fntyp) 
VALUES ('Controllers\\Autos\\AutosForm', 'Acceso al formulario de autos en el controlador', 'ACT', 'CTR');

INSERT INTO funciones_roles (rolescod, fncod, fnrolest, fnexp) 
VALUES ('Auditor', 'Controllers\\Autos\\AutosForm', 'ACT', DATE_ADD(NOW(), INTERVAL 1 YEAR));

INSERT INTO funciones (fncod, fndsc, fnest, fntyp) 
VALUES 
('autos_INS_enabled', 'Permite insertar autos', 'ACT', 'CTR'),
('autos_UPD_enabled', 'Permite actualizar autos', 'ACT', 'CTR'),
('autos_DEL_enabled', 'Permite eliminar autos', 'ACT', 'CTR');

INSERT INTO funciones_roles (rolescod, fncod, fnrolest, fnexp) 
VALUES 
('Admin', 'autos_INS_enabled', 'ACT', DATE_ADD(NOW(), INTERVAL 1 YEAR)),
('Admin', 'autos_UPD_enabled', 'ACT', DATE_ADD(NOW(), INTERVAL 1 YEAR)),
('Admin', 'autos_DEL_enabled', 'ACT', DATE_ADD(NOW(), INTERVAL 1 YEAR));

INSERT INTO funciones_roles (rolescod, fncod, fnrolest, fnexp) VALUES
('Admin', 'Menu_Usuarios', 'ACT', DATE_ADD(NOW(), INTERVAL 1 YEAR)),
('Admin', 'usuarios_INS_enabled', 'ACT', DATE_ADD(NOW(), INTERVAL 1 YEAR)),
('Admin', 'usuarios_UPD_enabled', 'ACT', DATE_ADD(NOW(), INTERVAL 1 YEAR)),
('Admin', 'usuarios_DEL_enabled', 'ACT', DATE_ADD(NOW(), INTERVAL 1 YEAR)),
('Auditor', 'Menu_Usuarios', 'ACT', DATE_ADD(NOW(), INTERVAL 1 YEAR));



