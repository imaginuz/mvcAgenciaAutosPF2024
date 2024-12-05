<section class="container-l WWList">
    <section class="depth-1 px-4 py-4">
        <h2>Lista de Usuarios</h2>
        <section class="grid">
            <form action="index.php?page=Usuarios-UsuariosList" method="post" class="row">
                <input class="col-8" type="text" name="search" placeholder="Buscar por ID" value="{{search}}">
                <button class="col-4" type="submit"><i class="fa-solid fa-magnifying-glass"></i> &nbsp;Buscar</button>
            </form>
        </section>
    </section>
        <table class="my-4">
            <thead>
                <tr>
                    <th>ID Usuario</th>
                    <th>Email</th>
                    <th>Nombre</th>
                    <th>Contraseña</th>
                    <th>Fecha Ingreso</th>
                    <th>Estado</th>
                    <th>Tipo</th>
                    <th>
                        {{if INS_enable}}
                        <a href="index.php?page=Usuarios-UsuariosForm&mode=INS">
                        <i class="fa-solid fa-file-circle-plus"></i>
                        &nbsp; Nuevo Usuario</a>
                        {{endif INS_enable}}
                    </th>
                </tr>
            </thead>
            <tbody>
                {{foreach usuarios}}
                    <tr>
                        <td>{{usercod}}</td>
                        <td><a href="index.php?page=Usuarios-UsuariosForm&mode=DSP&usercod={{usercod}}"><i class="fa-solid fa-eye"></i> &nbsp;{{useremail}}</a></td>
                        <td>{{username}}</td>
                        <td>{{userpswd}}</td>
                        <td>{{userfching}}</td>
                        <td>{{userest}}</td>
                        <td>{{usertipo}}</td>
                        <td class="center">
                            {{if ~UPD_enable}}
                            <a href="index.php?page=Usuarios-UsuariosForm&mode=UPD&usercod={{usercod}}">
                                <i class="fa-solid fa-pen"></i> &nbsp; Editar
                            </a>
                            {{endif ~UPD_enable}}

                            &nbsp;
                            &nbsp;
                            {{if ~DEL_enable}}
                            <a href="index.php?page=Usuarios-UsuariosForm&mode=DEL&usercod={{usercod}}">
                                <i class="fa-solid fa-trash-can"></i> &nbsp;
                                Eliminar
                            </a>
                            {{endif ~DEL_enable}}
                        </td>
                    </tr>
                {{endfor usuarios}}
            </tbody>
            <tfoot>
                <tr>
                    <td colspan="8">Total de registros: {{total}}</td>
                </tr>
            </tfoot>
        </table>
</section>
