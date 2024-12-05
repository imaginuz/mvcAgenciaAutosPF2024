<section class="grid">
    <section class="row">
        <h2 class="col-12 col-m-6 offset-m-3 depth-1 p-4">Detalles de Auto</h2>
    </section>
</section>
<section class="grid">
    <section class="row my-4">
    <form class="col-12 col-m-6 offset-m-3 depth-1" action="index.php?page=Tienda-TiendaDetalles&id={{id}}" method="POST">
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
                    <p><strong>Precio Mínimo:</strong> ${{precio_min}}</p>
                </div>
            </div>
    {{endwith auto}}

            <form method="POST">
                <input type="hidden" name="id_auto" value="{{id_auto}}">
                <input type="hidden" name="agregar_carrito" value="1">
                <div class="add-to-cart">
                    <button type="submit" class="btn">Agregar al carrito</button>
                </div>
            </form>
        
        <div class="back-btn">
            <a href="index.php?page=Tienda-TiendaPage" class="btn">Regresar a la lista de autos</a>
        </div>
    </div>
    </section>
</section>