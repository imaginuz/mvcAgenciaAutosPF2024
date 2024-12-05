<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        .grid-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
            gap: 25px;
            padding: 20px;
            justify-content: center;
            max-width: 1300px;
            margin: 0 auto;
        }

        .row {
            text-align: center;

        }

        .car-details {
            display: flex;
            flex-wrap: wrap;
            gap: 20px;
            justify-content: center;
            background-color: #fff;
            padding: 20px;
            border-radius: 12px;
        }

        .car-image img {
             width: 100%;
            height: 220px;
            object-fit: cover;
            border-radius: 10px;

        }

        .car-image {
            justify-content: center;
            align-items: center;
            

        }


        .car-info {
            max-width: 500px;
            padding: 10px;
            text-align: justify;
        }

        .car-info h2 {
            font-size: 2rem;
            color: #333;
            margin-bottom: 15px;
        }

        .car-info p {
            font-size: 1.2rem;
            margin: 8px 0;
            color: #555;
        }

        .price,
        .price-min {
            font-size: 1.6rem;
            font-weight: bold;
            color: #28a745;
        }

        .add-to-cart button,
        .back-btn a {

            border: none;
            background-color: #007bff;
            color: rgb(255, 255, 255);
            padding: 12px 25px;
            border-radius: 8px;
            cursor: pointer;
            font-size: 1.2rem;
            display: inline-block;
            margin-top: 20px;
            text-align: center;
        }

        .add-to-cart button:hover,
        .back-btn a:hover {
            background-color: #0056b3;
        }

        .back-btn {
            margin-top: 20px;
            text-align: center;
        }

        .add-to-cart {
            margin-top: 20px;
            text-align: center;
        }
    </style>
</head>

<body>
    <section class="grid-container">
        <section class="row">
            <h2 class="col-12 col-m-6 offset-m-3 depth-1 p-4">Detalles de Auto</h2>
        </section>
    </section>
    <section class="grid-container">
        <section class="row my-4">
            <form class="col-12 col-m-6 offset-m-3 depth-1" action="index.php?page=Tienda-TiendaDetalles&id={{id}}"
                method="POST">
                {{with auto}}
                <div class="container">
                    <div class="car-details">
                        <div class="car-image">
                            <img src="{{autoImgUrl}}" alt="Imagen del {{marca}} {{modelo}}" width="300">
                        </div>
                        <div class="car-info">
                            <h2>{{marca}} {{modelo}}</h2>
                            <p><strong>Año:</strong> {{anio}}</p>
                            <p><strong>Registro:</strong> {{registro}}</p>
                            <p><strong>Estado:</strong> {{estado}}</p>
                            <p><strong>Precio:</strong> ${{precio}}</p>
                            <p class="price-min"><strong>Precio Mínimo:</strong> ${{precio_min}}</p>
                        </div>
                    </div>
                    {{endwith auto}}

                    <div class="add-to-cart">
                        <button type="submit" class="btn" name="agregar_carrito">Agregar al carrito</button>
                    </div>
            </form>
            <div class="back-btn">
                <a href="index.php?page=Tienda-TiendaPage" class="btn">Regresar a la lista de autos</a>
            </div>
            </div>
        </section>
</body>