<section class="container-l WWList">
    <section class="depth-1 px-4 py-4">
        <h2>Lista de Autos</h2>
        <section class="grid">
            <form action="index.php?page=Carrito-CarritoList" method="post" class="row">
            </form>
        </section>
    </section>
    <table class="my-4">
        <thead>
            <tr>
                <th>Auto</th>
                <th>Imagen</th>
                <th>Cantidad</th>
                <th>Precio Unitario</th>
                <th>Total</th>
                <th>Fecha Agregado</th>
                <th>Estado</th>
                <th><i class="fa-solid fa-file-circle-plus"></i> Acciones</th>
            </tr>
        </thead>
        <tbody>
            {{foreach carrito}}
                <tr>
                    <td>{{marca}} {{modelo}}</td>
                    <td><img src="{{imagen_auto}}" alt="Imagen del auto" style="width: 50px;"></td>
                    <td>{{cantidad}}</td>
                    <td>LP.{{precio_auto}}</td>
                    <td>LP.{{precio_total}}</td>
                    <td>{{fecha_agregado}}</td>
                    <td>{{estado}}</td>
                    <td class="center">
                        <a href="index.php?page=Carrito-CarritoAgregar&id_carrito={{id_carrito}}">
                            <i class="fa-solid fa-plus-circle"></i> &nbsp; Agregar
                        </a>
                        &nbsp; &nbsp;
                        <a href="index.php?page=Carrito-CarritoEliminar&id_carrito={{id_carrito}}">
                            <i class="fa-solid fa-trash-can"></i> &nbsp; Eliminar
                        </a>
                    </td>
                </tr>
            {{endfor carrito}}
        </tbody>
        <tfoot>
            <tr>
                <td colspan="8">Total a pagar: LP. {{total}}</td>
            </tr>
        </tfoot>
    </table>
</section>
