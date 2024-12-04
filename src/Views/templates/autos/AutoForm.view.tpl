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
                {{if error_marca}}
                    {{foreach error_marca}}
                        <div class="col-12 error">{{this}}</div>
                    {{endfor error_marca}}
                {{endif error_marca}}
            {{endwith errors}}

        </div>
        <div class="row my-4">
            <label class="col-4" for="modelo">Modelo:</label>
            <input class="col-8" type="text" name="modelo" id="modelo" value="{{modelo}}" required {{isReadOnly}}>
            {{with errors}}
                {{if error_modelo}}
                    {{foreach error_modelo}}
                        <div class="col-12 error">{{this}}</div>
                    {{endfor error_modelo}}
                {{endif error_modelo}}
            {{endwith errors}}
        </div>
        <div class="row my-4">
            <label class="col-4" for="anio">Año:</label>
            <input class="col-8" type="text" name="anio" id="anio" value="{{anio}}" required {{isReadOnly}}>
            {{with errors}}
                {{if error_anio}}
                    {{foreach error_anio}}
                        <div class="col-12 error">{{this}}</div>
                    {{endfor error_anio}}
                {{endif error_anio}}
            {{endwith errors}}
        </div>

  <div class="row my-4">
            <label class="col-4" for="registro">Registro:</label>
            <input class="col-8" type="text" name="registro" id="registro" value="{{registro}}" required {{isReadOnly}}>
            {{with errors}}
                {{if error_registro}}
                    {{foreach error_registro}}
                        <div class="col-12 error">{{this}}</div>
                    {{endfor error_registro}}
                {{endif error_registro}}
            {{endwith errors}}
        </div>


<div class="row my-4">
            <label class="col-4" for="estado">Estado:</label>
            <input class="col-8" type="text" name="estado" id="estado" value="{{estado}}" required {{isReadOnly}}>
            {{with errors}}
                {{if error_estado}}
                    {{foreach error_estado}}
                        <div class="col-12 error">{{this}}</div>
                    {{endfor error_estado}}
                {{endif error_estado}}
            {{endwith errors}}
        </div>

<div class="row my-4">
            <label class="col-4" for="precio">Precio:</label>
            <input class="col-8" type="number" name="precio" id="precio" value="{{precio}}" required {{isReadOnly}}>
            {{with errors}}
                {{if error_precio}}
                    {{foreach error_precio}}
                        <div class="col-12 error">{{this}}</div>
                    {{endfor error_precio}}
                {{endif error_precio}}
            {{endwith errors}}
        </div>


<div class="row my-4">
            <label class="col-4" for="precio_min">Precio Min:</label>
            <input class="col-8" type="text" name="precio_min" id="precio_min" value="{{precio_min}}" required {{isReadOnly}}>
            {{with errors}}
                {{if error_precio_min}}
                    {{foreach error_precio_min}}
                        <div class="col-12 error">{{this}}</div>
                    {{endfor error_precio_min}}
                {{endif error_precio_min}}
            {{endwith errors}}
        </div>

<div class="row my-4">
            <label class="col-4" for="autoImgUrl">Imagen Auto:</label>
            <input class="col-8" type="text" name="autoImgUrl" id="autoImgUrl" value="{{autoImgUrl}}" required {{isReadOnly}}>
            {{with errors}}
                {{if error_autoImgUrl}}
                    {{foreach error_autoImgUrl}}
                        <div class="col-12 error">{{this}}</div>
                    {{endfor error_autoImgUrl}}
                {{endif error_autoImgUrl}}
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