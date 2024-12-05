<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Tienda de Autos</title>
    <style>
        .grid-container {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(250px, 1fr));
            gap: 20px;
            padding: 20px;
        }
        .card {
            border: 1px solid #ddd;
            border-radius: 8px;
            padding: 10px;
            text-align: center;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .card img {
            max-width: 100%;
            height: auto;
            border-radius: 8px;
            cursor: pointer;
        }
        .card h3 {
            margin: 10px 0;
            cursor: pointer;
        }
        .button {
            border: none;
            background: none;
            padding: 0;
            margin: 0;
            cursor: pointer;
            text-decoration: none;
            color: inherit;
            font-size: inherit;
        }
        .card a {
            text-decoration: none;
            color: inherit;
        }
    </style>
</head>
<section class="container-l WWList">
    <section class="depth-1 px-4 py-4">
        <h2>Lista de Autos</h2>
        <section class="grid">
            <form action="index.php?page=Tienda-TiendaPage" method="post" class="row">
                <input class="col-8" type="text" name="search" placeholder="Buscar por descripcion" value="{{search}}">
                <button class="col-4" type="submit"><i class="fa-solid fa-magnifying-glass"></i> &nbsp;Buscar</button>
            </form>
        </section>
    </section>
        {{foreach autos}}
        <div class="card">
            <!-- Imagen como botón -->
            <form method="GET" action="index.php">
                <input type="hidden" name="controller" value="AutoDetail">
                <input type="hidden" name="id" value="{{id_auto}}">
                <button type="submit" class="button">
                    <img src="{{autoImgUrl}}" alt="{{marca}} {{modelo}}">
                </button>
            </form>
            <!-- Nombre como botón -->
            <form method="GET" action="index.php">
                <input type="hidden" name="controller" value="AutoDetail">
                <input type="hidden" name="id" value="{{id_auto}}">
                <button type="submit" class="button">
                    <h3>{{marca}} {{modelo}}</h3>
                </button>
            </form>
            <p>Año: {{anio}}</p>
            <p>Precio: LP. {{precio}}</p>
        </div>
        {{endfor autos}}
    </div>
</body>
</html>
