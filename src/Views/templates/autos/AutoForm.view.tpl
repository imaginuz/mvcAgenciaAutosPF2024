<section class="grid">
    <section class="row">
        <h2 class="col-12 col-m-6 offset-m-3 depth-1 p-4">{{modes_dsc}}</h2>
    </section>
</section>
<section class="grid">
    <section class="row my-4">
    <form class="col-12 col-m-6 offset-m-3 depth-1" action="index.php?page=Autos-AutosForm&mode={{mode}}&id_auto={{id_auto}}" method="POST" >
        
        <input type="hidden" name="id_auto" value="{{id_auto}}">
        <input type="hidden" name="xssToken" value="{{~xssToken}}">
        <input type="hidden" name="mode" value="{{mode}}">
        {{with auto}}
        <div class="row my-4">
            <label class="col-4" for="marca">Marca:</label>
            <input class="col-8" type="text" name="marca" id="marca" value="{{marca}}"   >
            {{if ~marca_haserror}}
                <div class = "error">
                    <ul>
                        {{foreach ~marca_error}}
                            <li>{{this}}</li>
                        {{endfor ~marca_error}}
                    </ul>
                </div>
            {{endif ~marca_haserror}}
        </div>
        <div class="row my-4">
            <label class="col-4" for="modelo">Modelo:</label>
            <input class="col-8" type="text" name="modelo" id="modelo" value="{{modelo}}"   >
            {{if ~modelo_haserror}}
                <div class = "error">
                    <ul>
                        {{foreach ~modelo_error}}
                            <li>{{this}}</li>
                        {{endfor ~modelo_error}}
                    </ul>
                </div>
            {{endif ~modelo_haserror}}
        </div>
        <div class="row my-4">
            <label class="col-4" for="anio">Año:</label>
            <input class="col-8" type="text" name="anio" id="anio" value="{{anio}}"   >
            {{if ~anio_haserror}}
                <div class = "error">
                    <ul>
                        {{foreach ~anio_error}}
                            <li>{{this}}</li>
                        {{endfor ~anio_error}}
                    </ul>
                </div>
            {{endif ~anio_haserror}}
        </div>

        <div class="row my-4">
            <label class="col-4" for="registro">Registro:</label>
            <input class="col-8" type="text" name="registro" id="registro" value="{{registro}}"   >
            {{if ~registro_haserror}}
                <div class = "error">
                    <ul>
                        {{foreach ~registro_error}}
                            <li>{{this}}</li>
                        {{endfor ~registro_error}}
                    </ul>
                </div>
            {{endif ~registro_haserror}}
        </div>


        <div class="row my-4">
            <label class="col-4" for="estado">Estado:</label>
            <input class="col-8" type="text" name="estado" id="estado" value="{{estado}}"   >
            {{if ~estado_haserror}}
                <div class = "error">
                    <ul>
                        {{foreach ~estado_error}}
                            <li>{{this}}</li>
                        {{endfor ~estado_error}}
                    </ul>
                </div>
            {{endif ~estado_haserror}}
        </div>

        <div class="row my-4">
            <label class="col-4" for="precio">Precio:</label>
            <input class="col-8" type="number" name="precio" id="precio" value="{{precio}}"   >
            {{if ~precio_haserror}}
                <div class = "error">
                    <ul>
                        {{foreach ~precio_error}}
                            <li>{{this}}</li>
                        {{endfor ~precio_error}}
                    </ul>
                </div>
            {{endif ~precio_haserror}}
        </div>


        <div class="row my-4">
            <label class="col-4" for="precio_min">Precio Min:</label>
            <input class="col-8" type="text" name="precio_min" id="precio_min" value="{{precio_min}}"   >
            {{if ~precio_min_haserror}}
                <div class = "error">
                    <ul>
                        {{foreach ~precio_min_error}}
                            <li>{{this}}</li>
                        {{endfor ~precio_min_error}}
                    </ul>
                </div>
            {{endif ~precio_min_haserror}}
        </div>

        <div class="row my-4">
            <label class="col-4" for="autoImgUrl">Imagen Auto:</label>
            <input class="col-8" type="text" name="autoImgUrl" id="autoImgUrl" value="{{autoImgUrl}}"   >
            {{if ~autoImgUrl_haserror}}
                <div class = "error">
                    <ul>
                        {{foreach ~autoImgUrl_error}}
                            <li>{{this}}</li>
                        {{endfor ~autoImgUrl_error}}
                    </ul>
                </div>
            {{endif ~autoImgUrl_haserror}}
        </div>

        <div class="row flex-end">
            {{ifnot isDisplay}}
                <button type="submit" class="primary mx-2">
                    <i class="fa-solid fa-check"></i>&nbsp;
                    Guardar
                </button>
            {{endifnot isDisplay}}
            <button type="button" onclick="window.location='index.php?page=Autos-AutosList'">
                <i class="fa-solid fa-xmark"></i>
                Cancelar
            </button>
        </div>
        <div class="row col-6 offset-3 flex-end">
            {{if ~showConfirm}}
                <button type="submit" class="primary">Confirmar</button>&nbsp;
            {{endif ~showConfirm}}
        </div>
        {{endwith auto}}
    </form>
    </section>
</section>