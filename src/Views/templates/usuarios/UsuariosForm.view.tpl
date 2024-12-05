<section class="grid">
    <section class="row">
        <h2 class="col-12 col-m-6 offset-m-3 depth-1 p-4">{{modes_dsc}}</h2>
    </section>
</section>

<section class="grid">
    <section class="row my-4">
        <form class="col-12 col-m-6 offset-m-3 depth-1" action="index.php?page=Usuarios-UsuariosForm&mode={{mode}}&usercod={{usercod}}" method="POST">
            <input type="hidden" name="usercod" value="{{usercod}}">
            <input type="hidden" name="xssToken" value="{{~xssToken}}">
            <input type="hidden" name="mode" value="{{mode}}">
            {{with usuario}}

            <div class="row my-4">
                <label class="col-4" for="useremail">Email:</label>
                <input class="col-8" type="email" name="useremail" id="useremail" value="{{useremail}}">
                {{if ~useremail_haserror}}
                    <div class="error">
                        <ul>
                            {{foreach ~useremail_error}}
                                <li>{{this}}</li>
                            {{endfor ~useremail_error}}
                        </ul>
                    </div>
                {{endif ~useremail_haserror}}
            </div>

            <div class="row my-4">
                <label class="col-4" for="username">Nombre:</label>
                <input class="col-8" type="text" name="username" id="username" value="{{username}}">
                {{if ~username_haserror}}
                    <div class="error">
                        <ul>
                            {{foreach ~username_error}}
                                <li>{{this}}</li>
                            {{endfor ~username_error}}
                        </ul>
                    </div>
                {{endif ~username_haserror}}
            </div>

            <div class="row my-4">
                <label class="col-4" for="userpswd">Contraseña:</label>
                <input class="col-8" type="password" name="userpswd" id="userpswd" value="{{userpswd}}">
                {{if ~userpswd_haserror}}
                    <div class="error">
                        <ul>
                            {{foreach ~userpswd_error}}
                                <li>{{this}}</li>
                            {{endfor ~userpswd_error}}
                        </ul>
                    </div>
                {{endif ~userpswd_haserror}}
            </div>

            <div class="row my-4">
                <label class="col-4" for="userpswdest">Estado Contraseña:</label>
                <input class="col-8" type="text" name="userpswdest" id="userpswdest" value="{{userpswdest}}">
                {{if ~userpswdest_haserror}}
                    <div class="error">
                        <ul>
                            {{foreach ~userpswdest_error}}
                                <li>{{this}}</li>
                            {{endfor ~userpswdest_error}}
                        </ul>
                    </div>
                {{endif ~userpswdest_haserror}}
            </div>

            <div class="row my-4">
                <label class="col-4" for="userpswdexp">Expiración Contraseña:</label>
                <input class="col-8" type="datetime-local" name="userpswdexp" id="userpswdexp" value="{{userpswdexp}}">
                {{if ~userpswdexp_haserror}}
                    <div class="error">
                        <ul>
                            {{foreach ~userpswdexp_error}}
                                <li>{{this}}</li>
                            {{endfor ~userpswdexp_error}}
                        </ul>
                    </div>
                {{endif ~userpswdexp_haserror}}
            </div>

            <div class="row my-4">
                <label class="col-4" for="userest">Estado Usuario:</label>
                <input class="col-8" type="text" name="userest" id="userest" value="{{userest}}">
                {{if ~userest_haserror}}
                    <div class="error">
                        <ul>
                            {{foreach ~userest_error}}
                                <li>{{this}}</li>
                            {{endfor ~userest_error}}
                        </ul>
                    </div>
                {{endif ~userest_haserror}}
            </div>

            <div class="row my-4">
                <label class="col-4" for="usertipo">Tipo de Usuario:</label>
                <input class="col-8" type="text" name="usertipo" id="usertipo" value="{{usertipo}}">
                {{if ~usertipo_haserror}}
                    <div class="error">
                        <ul>
                            {{foreach ~usertipo_error}}
                                <li>{{this}}</li>
                            {{endfor ~usertipo_error}}
                        </ul>
                    </div>
                {{endif ~usertipo_haserror}}
            </div>

            <div class="row my-4">
                <label class="col-4" for="useractcod">Código de Activación:</label>
                <input class="col-8" type="text" name="useractcod" id="useractcod" value="{{useractcod}}">
                {{if ~useractcod_haserror}}
                    <div class="error">
                        <ul>
                            {{foreach ~useractcod_error}}
                                <li>{{this}}</li>
                            {{endfor ~useractcod_error}}
                        </ul>
                    </div>
                {{endif ~useractcod_haserror}}
            </div>

            <div class="row my-4">
                <label class="col-4" for="userpswdchg">Fecha de Cambio de Contraseña:</label>
                <input class="col-8" type="datetime-local" name="userpswdchg" id="userpswdchg" value="{{userpswdchg}}">
                {{if ~userpswdchg_haserror}}
                    <div class="error">
                        <ul>
                            {{foreach ~userpswdchg_error}}
                                <li>{{this}}</li>
                            {{endfor ~userpswdchg_error}}
                        </ul>
                    </div>
                {{endif ~userpswdchg_haserror}}
            </div>

            <div class="row flex-end">
                {{ifnot isDisplay}}
                    <button type="submit" class="primary mx-2">
                        <i class="fa-solid fa-check"></i>&nbsp; Guardar
                    </button>
                {{endifnot isDisplay}}
                <button type="button" onclick="window.location='index.php?page=Usuarios-UsuariosList'">
                    <i class="fa-solid fa-xmark"></i> Cancelar
                </button>
            </div>

            <div class="row col-6 offset-3 flex-end">
                {{if ~showConfirm}}
                    <button type="submit" class="primary">Confirmar</button>&nbsp;
                {{endif ~showConfirm}}
            </div>
            
            {{endwith usuario}}
        </form>
    </section>
</section>
