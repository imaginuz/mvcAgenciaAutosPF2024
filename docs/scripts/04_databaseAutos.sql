
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
