<style>
    .hero {
        background: url('https://www.comunicare.es/wp-content/uploads/2021/07/agencia-de-marketing-coches.jpg') no-repeat center center/cover;
        color: #fff;
        text-align: center;
        padding: 5rem 1rem;
    }

    .hero h2 {
        font-size: 2.5rem;
        margin-bottom: 1rem;
    }

    .content {
        display: flex;
        align-items: center;
        justify-content: space-between;
        padding: 2rem;
        text-align: left;
    }

    .content img {
        width: 40%;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);

    }

    .content .text {
        width: 55%;
    }

    .content h3 {
        font-size: 2rem;
        margin-bottom: 1rem;
    }

    .content p {
        font-size: 1rem;
        text-align: justify;
    }

    .content h1 {
        font-size: 25px;
        text-align: center;
    }

    .cta {
        text-align: center;
        padding: 2rem 1rem;
        background: #f4f4f4;
    }

    .cta a {
        background: #333;
        color: #fff;
        padding: 1rem 2rem;
        text-decoration: none;
        font-size: 1rem;
        border-radius: 5px;
    }

    .cta a:hover {
        background: #555;
    }


.valores ul {
        padding-left: 0;
         align-items: center;
    
    }

    .valores li {
        background: #d8d3d3;
        margin: 5px;
        padding: 10px;
        border-radius: 5px;
       display: block;
       flex-wrap: wrap;
       height: auto;
       text-align: center;
       align-items: center;
       
    }

.valores h2{
    text-align: center;
}


     /* Sección "Nuestros Productos" */
.productos {
    padding: 40px 20px;
    background-color: #f9f9f9;
    text-align: center;
}

.productos h2 {
    font-size: 2rem;
    margin-bottom: 20px;
    color: #333;
}

.productos-container {
    display: flex;
    justify-content: space-around;
    gap: 20px;
    flex-wrap: wrap;
}

/* Tarjetas de producto */
.producto-card {
    background-color: white;
    border: 1px solid #ddd;
    border-radius: 8px;
    width: 300px;
    text-align: center;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    overflow: hidden;
    transition: transform 0.3s ease;
}

.producto-card:hover {
    transform: translateY(-10px);
}

.producto-card img {
    width: 100%;
    object-fit: cover;
}

.producto-card h3 {
    font-size: 1.5rem;
    margin: 10px 0;
    color: #444;
}

.producto-card p {
    font-size: 1rem;
    color: #777;
    margin: 10px 0;
}

.producto-card .btn {
    background-color: #333;
    color: white;
    padding: 10px 15px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 1rem;
    transition: background-color 0.3s ease;
}

.producto-card .btn:hover {
    background-color: #ffa500;
}



</style>
</head>

<body>


    <section class="hero">
    </section>

    <section class="content" id="sobre-nosotros">
        <img src="https://www.portalautomotriz.com/sites/portalautomotriz.com/files/media/photos/agencia_401170123.jpg"
            alt="Sobre Nosotros">
        <div class="text">
            <h1>Sobre Nosotros</h1>
            <p> Somos una empresa apasionada por la movilidad, la tecnología y el servicio al cliente. Nos dedicamos a
                conectar a las personas con los vehículos que mejor se adaptan a sus necesidades, garantizando calidad,
                seguridad y confianza. Con años de experiencia en la industria automotriz, ofrecemos una amplia gama de
                vehículos nuevos y seminuevos, respaldados por un servicio profesional y personalizado.

                Nuestro compromiso es no solo ser un lugar donde encuentres tu próximo auto, sino también tu aliado en
                cada kilómetro del camino.</p>
        </div>
    </section>
<br>
<br>
<br>

    <section class="content" id="mision">
        <img src="https://www.autoasesor.com/blog/wp-content/uploads/2021/01/auto-agencia-min.jpg" alt="Misión">
        <div class="text">
            <h1>Misión</h1>
            <p>Proveer soluciones de movilidad innovadoras que mejoren la vida de nuestros clientes, a través de una experiencia de compra única, un servicio excepcional y vehículos de alta calidad que cumplan con los estándares más exigentes del mercado.</p>
        </div>
    </section>

    <section class="content" id="vision">
        <img src="https://www.autoasesor.com/blog/wp-content/uploads/2021/03/auto-nuevo-1-min.jpg" alt="Visión">
        <div class="text">
            <h1>Visión</h1>
            <p>Ser reconocidos como la agencia automotriz líder en el mercado, destacándonos por nuestra excelencia en el servicio al cliente, nuestra innovación tecnológica y nuestra contribución al desarrollo sostenible de la movilidad.</p>
        </div>
    </section>

<section id="valores" class="valores">
        <h2>Valores</h2>
        <ul>
            <li><strong>Integridad:</strong> Actuar siempre con honestidad y ética.</li>
            <li><strong>Calidad:</strong> Ofrecer productos y servicios de excelencia.</li>
            <li><strong>Innovación:</strong> Buscar constantemente nuevas formas de mejorar.</li>
            <li><strong>Compromiso:</strong> Priorizar las necesidades de nuestros clientes.</li>
        </ul>
    </section>
<br>
<br>
<br>
<section id="productos" class="productos">
    <h2>Nuestros Productos</h2>
    <div class="productos-container">

        <div class="producto-card">
            <img src="https://www.autoasesor.com/chevrolet/imagenes/blazer2023.png" alt="Auto">
            <h3>AUTOS DEPORTIVOS</h3>
            <p>Ideal para tu comodidad</p>
             <form method="GET" action="index.php">
                    <input type="hidden" name="page" value="Tienda_TiendaPage">
                    <button type="submit">Ver Detalles</button>
                </form>
        </div>

        <div class="producto-card">
            <img src="https://www.autoasesor.com/hyundai/imagenes/elantra2023.png" alt="Auto">
            <h3>AUTOS TIPO TURISMO</h3>
            <p>Excelente para la ciudad</p>
             <form method="GET" action="index.php">
                    <input type="hidden" name="page" value="Tienda_TiendaPage">
                    <button type="submit">Ver Detalles</button>
                </form>
        </div>
    
        <div class="producto-card">
            <img src="https://www.autoasesor.com/ford/img/mustang.png" alt="Auto">
            <h3>AUTOS DE LUJO</h3>
            <p>El mejor para lucir</p>

            <form method="GET" action="index.php">
                    <input type="hidden" name="page" value="Tienda_TiendaPage">
                    <button type="submit">Ver Detalles</button>
                </form>
        </div>

        <div class="producto-card">
            <img src="https://imagenes.eleconomista.com.mx/files/image_853_480/uploads/2019/03/07/66e8b0276ea3a.jpeg" alt="Auto">
            <h3>AUTOS USADOS</h3>
            <p>Al mejor precio</p>
             <form method="GET" action="index.php">
                    <input type="hidden" name="page" value="Tienda_TiendaPage">
                    <button type="submit">Ver Detalles</button>
                </form>
        </div>
    </div>
</section>


    <section class="cta">
        <h3>¿Listo para encontrar tu próximo auto?</h3>
    </section>

</body>

</html>