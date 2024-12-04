<section class="container-l WWList">
    <section class="depth-1 px-4 py-4">
        <h2>Lista de Autos</h2>
        <section class="grid">
            <form action="index.php?page=Autos-AutosForm" method="post" class="row">
                <input class="col-8" type="text" name="search" placeholder="Buscar por descripcion" value="{{search}}">
                <button class="col-4" type="submit"><i class="fa-solid fa-magnifying-glass"></i> &nbsp;Buscar</button>
            </form>
        </section>
    </section>
    <table class="my-4">
        <thead>
            <tr>
                <th>Id Auto</th>
                <th>Marca</th>
                <th>Modelo</th>
                <th>Año</th>
                <th>Registro</th>
                <th>Estado</th>
                <th>Precio</th>
                <th>Precio_Min</th>
                <th>autoImgUrl</th>
                <th><a href="index.php?page=Autos-AutosForm&mode=INS">
                    <i class="fa-solid fa-file-circle-plus"></i>
                    &nbsp; Nueva Funcion</a></th>
            </tr>
        </thead>
        <tbody>
            {{foreach autos}}
                <tr>
                    <td>{{id_auto}}</td>
                    <td><a href="index.php?page=Autos-AutosForm&mode=DSP&id_auto={{id_auto}}"><i class="fa-solid fa-eye"></i> &nbsp;{{marca}}</a></td>
                    <td>{{estado}}</td>
                    <td class="center">
                        <a href="index.php?page=Autos-AutosForm&mode=UPD&id_auto={{id_auto}}">
                            <i class="fa-solid fa-pen"></i> &nbsp; Editar
                        </a>
                        &nbsp;
                        &nbsp;
                        <a href="index.php?page=Autos-AutosForm&mode=DEL&id_auto={{id_auto}}">
                            <i class="fa-solid fa-trash-can"></i> &nbsp;
                            Eliminar
                        </a>
                    </td>
                </tr>
            {{endfor autos}}

        </tbody>
        <tfoot>
            <tr>
                <td colspan="6">Total de registros: {{total}}</td>
            </tr>
        </tfoot>
    </table>
</section>