<style>
    body {
        font-family: Arial, sans-serif;
        text-align: justify;
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        line-height: 1.6;
        background-color: #f3f3f3;
    }

    h1 {
        font-size: 3rem;
        font-weight: bold;
        text-align: center;
        background: linear-gradient(90deg, #ff7e5f, #feb47b);
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
        text-transform: uppercase;
        letter-spacing: 2px;
        text-shadow: 2px 2px 10px rgba(0, 0, 0, 0.5);
        margin: 20px 0;
        animation: glow 3s infinite;
    }


    @keyframes glow {
        0% {
            text-shadow: 2px 2px 10px rgba(0, 0, 0, 0.5);
        }

        50% {
            text-shadow: 2px 2px 20px rgba(255, 126, 95, 0.8);
        }

        100% {
            text-shadow: 2px 2px 10px rgba(0, 0, 0, 0.5);
        }
    }



    h2 {
        text-align: center;
        margin-top: 20px;
    }

    p,

    ul {
        max-width: 800px;
        margin: 10px auto;
        padding: 0 20px;
        color: #555;
    }

    a {
        text-decoration: none;
        color: white;
    }

    .about img {
        display: block;
        margin: 20px auto;
        max-width: 50%;
        height: auto;
        border-radius: 10px;
    }

    .images {
        text-align: center;
    }

    .images img {
        height: auto;
        border-radius: 10%;
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

/*tarjetas de mision

/* Tarjetas de producto */
.page-card {
    background-color: white;
    border: 1px solid #ddd;
    border-radius: 8px;
    width: 100%;
    text-align: justify;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    overflow: hidden;
    transition: transform 0.3s ease;
}

.page-card:hover {
    transform: translateY(-10px);
}

.page-card img {
    width: 100%;
    object-fit: cover;
}

.page-card h3 {
    font-size: 1.5rem;
    margin: 10px 0;
    color: #444;
}

.page-card p {
    font-size: 1rem;
    color: #777;
    margin: 10px 0;
}










/**/



    .valores ul {
        list-style: none;
        padding-left: 0;
    }

    .valores li {
        background: #eaeaea;
        margin: 5px 0;
        padding: 10px;
        border-radius: 5px;
    }

    .contact form {
        max-width: 600px;
        margin: 20px auto;
        padding: 20px;
        background: #f1f1f1;
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }

    .contact label {
        display: block;
        margin: 10px 0 5px;
    }

    .contact input,
    .contact textarea {
        width: 100%;
        padding: 10px;
        margin-bottom: 15px;
        border: 1px solid #ddd;
        border-radius: 5px;
    }

    .contact button {
        display: block;
        width: 100%;
        background: #333;
        color: white;
        padding: 10px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }

    .contact button:hover {
        background: #ffa500;
    }





    footer {
        background: #333;
        color: white;
        text-align: center;
        padding: 10px 0;
        margin-top: 20px;
    }
</style>

<body>

    <section id="nosotros" class="about">
        <div>
        <h1>Nosotros</h1>
       
              <div class="page-card">
                <h2>Mision</h2>
            <img src="https://www.portalautomotriz.com/sites/portalautomotriz.com/files/media/photos/agencia_401170123.jpg" alt="Auto">
             <p>En NOVACAR una empresa apasionada por la movilidad, la tecnología y el servicio al cliente. Nos dedicamos a
            conectar a las personas con los vehículos que mejor se adaptan a sus necesidades, garantizando calidad,
            seguridad y confianza. Nuestro compromiso es no solo ser un lugar donde encuentres tu próximo auto, sino
            también tu aliado en
            cada kilómetro del camino.</p>
        </div>


    </section>

    <section id="mision" class="mision">
        <h2>Nuestra Misión</h2>
        <p>NOVA CAR es una empresa apasionada por la movilidad, la tecnología y el servicio al cliente. Nos dedicamos a
            conectar a las personas con los vehículos que mejor se adaptan a sus necesidades, garantizando calidad,
            seguridad y confianza. Con años de experiencia en la industria automotriz, ofrecemos una amplia gama de
            vehículos nuevos y seminuevos, respaldados por un servicio profesional y personalizado.

            Nuestro compromiso es no solo ser un lugar donde encuentres tu próximo auto, sino también tu aliado en
            cada kilómetro del camino</p>
    </section>

    <section id="vision" class="vision">
        <h2>Nuestra Visión</h2>
        <p>Ser reconocidos como la agencia automotriz líder en el mercado, destacándonos por nuestra excelencia en el
            servicio al cliente, nuestra innovación tecnológica y nuestra contribución al desarrollo sostenible de la
            movilidad.</p>
    </section>

    <section class="images">
        <img src="https://www.autoasesor.com/blog/wp-content/uploads/2021/01/auto-agencia-min.jpg" alt="img">
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

    <section id="productos" class="productos">
    <h2>Nuestros Productos</h2>
    <div class="productos-container">

        <div class="producto-card">
            <img src="https://www.autoasesor.com/chevrolet/imagenes/blazer2023.png" alt="Auto">
            <h3>AUTOS DEPORTIVOS</h3>
            <p>Ideal para tu comodidad</p>
            <button class="btn">Ver Detalles</button>
        </div>

        <div class="producto-card">
            <img src="https://www.autoasesor.com/hyundai/imagenes/elantra2023.png" alt="Auto">
            <h3>AUTOS TIPO TURISMO</h3>
            <p>Excelente para la ciudad</p>
            <button class="btn">Ver Detalles</button>
        </div>
    
        <div class="producto-card">
            <img src="https://www.autoasesor.com/ford/img/mustang.png" alt="Auto">
            <h3>AUTOS DE LUJO</h3>
            <p>El mejor para lucir</p>
            <button class="btn">Ver Detalles</button>
        </div>

        <div class="producto-card">
            <img src="https://imagenes.eleconomista.com.mx/files/image_853_480/uploads/2019/03/07/66e8b0276ea3a.jpeg" alt="Auto">
            <h3>AUTOS USADOS</h3>
            <p>Al mejor precio</p>
            <button class="btn">Ver Detalles</button>
        </div>
    </div>
</section>


    <section id="contacto" class="contact">
        <h2>Contáctanos</h2>
        <form action="#" method="POST">
            <label for="nombre">Nombre:</label>
            <input type="text" id="nombre" name="nombre" placeholder="Tu Nombre" required>

            <label for="email">Correo Electrónico:</label>
            <input type="email" id="email" name="email" placeholder="Tu Correo" required>

            <label for="mensaje">Mensaje:</label>
            <textarea id="mensaje" name="mensaje" placeholder="Tu Mensaje" rows="5" required></textarea>

            <button type="submit" class="btn">Enviar</button>
        </form>
    </section>
</body>