<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tienda de Autos</title>
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

        .card {
            border: 1px solid #ddd;
            border-radius: 12px;
            overflow: hidden;
            text-align: center;
            background-color: #fff;
            box-shadow: 0 6px 10px rgba(0, 0, 0, 0.1);
            transition: transform 0.2s ease-in-out;
            padding: 15px;
        }

        .card:hover {
            transform: translateY(-5px);
        }

        .card img {
            width: 100%;
            height: 220px;
            object-fit: cover;
            border-radius: 10px;
        }

        .card h3 {
            font-size: 1.5rem;
            color: #333;
            margin: 15px 0;
        }

        .card p {
            margin: 8px 0;
            font-size: 1.2rem;
            color: #666;
        }

        .card .price {
            font-size: 1.8rem;
            color: #28a745;
            font-weight: bold;
            margin: 10px 0;
        }

        .card-buttons {
            margin-top: 15px;
        }

        .card-buttons button {
            border: none;
            background-color: #007bff;
            color: white;
            padding: 12px 25px;
            border-radius: 8px;
            cursor: pointer;
            font-size: 1rem;
        }

        .card-buttons button:hover {
            background-color: #0056b3;
        }
    </style>
</head>

<body>
    <section class="grid-container">
        {{foreach autos}}
        <div class="card">
            <form method="GET" action="index.php">
                <input type="hidden" name="page" value="Tienda-TiendaDetalles">
                <input type="hidden" name="id" value="{{id_auto}}">
                <button type="submit" class="button">
                    <img src="{{autoImgUrl}}" alt="{{marca}} {{modelo}}">
                </button>
            </form>
            <h3>{{marca}} {{modelo}}</h3>
            <p>Año: {{anio}}</p>
            <p class="price">LP. {{precio}}</p>
            <div class="card-buttons">
                <form method="GET" action="index.php">
                    <input type="hidden" name="page" value="Tienda-TiendaDetalles">
                    <input type="hidden" name="id" value="{{id_auto}}">
                    <button type="submit">Ver Detalles</button>
                </form>
            </div>
        </div>
        {{endfor autos}}
    </section>
</body>