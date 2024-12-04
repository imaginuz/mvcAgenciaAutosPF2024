<section class="grid">
    <section class="row">
        <h2 class="col-12 col-m-6 offset-m-3 depth-1 p-4">{{modeArr}}</h2>
    </section>
</section>
<section class="grid">
    <section class="row my-4">
    <form class="col-12 col-m-6 offset-m-3 depth-1" action="index.php?page=Autos-AutosForm&mode={{mode}}&id_auto={{id_auto}}" method="POST" >
        <input type="hidden" name="id_auto" value="{{id_auto}}">
        <input type="hidden" name="xssToken" value="{{~xssToken}}">
        <input type="hidden" name="mode" value="{{mode}}">
        
        <div class="row my-4">
            <label class="col-4" for="id_auto">Código Auto:</label>
            <input class="col-8" type="text" name="id_auto" id="id_auto" value="{{id_auto}}" required {{isReadOnly}}>
        </div>

        <div class="row my-4">
            <label class="col-4" for="marca">Marca:</label>
            <input class="col-8" type="text" name="marca" id="marca" value="{{marca}}" required {{isReadOnly}}>
            {{with errors}}
                {{if error_dsc}}
                    {{foreach error_dsc}}
                        <div class="col-12 error">{{this}}</div>
                    {{endfor error_dsc}}
                {{endif error_dsc}}
            {{endwith errors}}
        </div>
        <div class="row my-4">
            <label class="col-4" for="modelo">Modelo:</label>
            <input class="col-8" type="text" name="modelo" id="modelo" value="{{modelo}}" required {{isReadOnly}}>
            {{with errors}}
                {{if error_est}}
                    {{foreach error_est}}
                        <div class="col-12 error">{{this}}</div>
                    {{endfor error_est}}
                {{endif error_est}}
            {{endwith errors}}
        </div>
        <div class="row my-4">
            <label class="col-4" for="anio">Añio:</label>
            <input class="col-8" type="text" name="anio" id="anio" value="{{anio}}" required {{isReadOnly}}>
            {{with errors}}
                {{if error_typ}}
                    {{foreach error_typ}}
                        <div class="col-12 error">{{this}}</div>
                    {{endfor error_typ}}
                {{endif error_typ}}
            {{endwith errors}}
        </div>

  <div class="row my-4">
            <label class="col-4" for="anio">Registro:</label>
            <input class="col-8" type="text" name="registro" id="registro" value="{{registro}}" required {{isReadOnly}}>
            {{with errors}}
                {{if error_typ}}
                    {{foreach error_typ}}
                        <div class="col-12 error">{{this}}</div>
                    {{endfor error_typ}}
                {{endif error_typ}}
            {{endwith errors}}
        </div>


<div class="row my-4">
            <label class="col-4" for="anio">Estado:</label>
            <input class="col-8" type="text" name="estado" id="estado" value="{{estado}}" required {{isReadOnly}}>
            {{with errors}}
                {{if error_typ}}
                    {{foreach error_typ}}
                        <div class="col-12 error">{{this}}</div>
                    {{endfor error_typ}}
                {{endif error_typ}}
            {{endwith errors}}
        </div>

<div class="row my-4">
            <label class="col-4" for="anio">Precio:</label>
            <input class="col-8" type="number" name="precio" id="precio" value="{{precio}}" required {{isReadOnly}}>
            {{with errors}}
                {{if error_typ}}
                    {{foreach error_typ}}
                        <div class="col-12 error">{{this}}</div>
                    {{endfor error_typ}}
                {{endif error_typ}}
            {{endwith errors}}
        </div>


<div class="row my-4">
            <label class="col-4" for="anio">Precio Min:</label>
            <input class="col-8" type="text" name="precio_min" id="precio_min" value="{{precio_min}}" required {{isReadOnly}}>
            {{with errors}}
                {{if error_typ}}
                    {{foreach error_typ}}
                        <div class="col-12 error">{{this}}</div>
                    {{endfor error_typ}}
                {{endif error_typ}}
            {{endwith errors}}
        </div>

<div class="row my-4">
            <label class="col-4" for="anio">Imagen Auto:</label>
            <input class="col-8" type="text" name="autoImgUrl" id="autoImgUrl" value="{{autoImgUrl}}" required {{isReadOnly}}>
            {{with errors}}
                {{if error_typ}}
                    {{foreach error_typ}}
                        <div class="col-12 error">{{this}}</div>
                    {{endfor error_typ}}
                {{endif error_typ}}
            {{endwith errors}}
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
    </form>
    </section>
</section>