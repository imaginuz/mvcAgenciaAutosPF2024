<h1>{{modes_dsc}}</h1>
<section class="grid">
        <form action = "index.php?page=Autos-AutosForm&mode={{mode}}&id_auto={{id_auto}}" method="post" class="row">
        {{with factura}}
            <div class="row col-6 offset-3">
                <label class="col-4" for="id_factura">Codigo Factura</label>
                <input type="text" name="id_factura"  id="id_factura" value="{{id_factura}}" readonly  />
            </div>
             <div class="row col-6 offset-3">
                <label class="col-4" for="marca">fecha</label>
                <input class="col-8" type="text" name="marca"  id="marca" value="{{marca}}" {{~readonly}}/>
                {{if ~marca_haserror}}
                <div class="error">
                    <ul>
                    {{foreach ~marca_error}}
                        <li>{{this}}</li>
                    {{endfor ~marca_error}}
                    </ul>
                </div>
            {{endif ~marca_haserror}}
            </div>
             <div class="row col-6 offset-3">
                <label class="col-4" for="modelo">Modelo</label>
                <input class="col-8" type="text" name="modelo"  id="modelo" value="{{modelo}}" {{~readonly}}/>
                {{if ~modelo_haserror}}
            <div class="error">
                <ul>
                {{foreach ~modelo_error}}
                    <li>{{this}}</li>
                {{endfor ~modelo_error}}
                </ul>
            </div>
        {{endif ~modelo_haserror}}
            </div>
             
             <div class="row col-6 offset-3">
                <label class="col-4"  for="anio">Año</label>
                <input class="col-8" type="text" name="anio"  id="anio" value="{{anio}}" {{~readonly}}/>
            </div>
            <div class="row col-6 offset-3">
                <label class="col-4" for="kilometraje">Registro</label>
                <input class="col-8" type="text" name="registro"  id="registro" value="{{registro}}" {{~readonly}} />
            </div>
            <div class="row col-6 offset-3">
                <label class="col-4" for="chasis">Estado</label>
                <input class="col-8" type="text" name="estado"  id="estado" value="{{estado}}" {{~readonly}}/>
            </div>
            <div class="row col-6 offset-3">
                <label class="col-4" for="color">Precio</label>
                <input class="col-8" type="number" name="precio"  id="precio" value="{{precio}}" {{~readonly}}/>
            </div>
            <div class="row col-6 offset-3">
                <label class="col-4" for="Registro">PrecioMin</label>
                <input class="col-8" type="number" name="precio_min"  id="precio_min" value="{{precio_min}}" {{~readonly}}/>
            </div>
            <div class="row col-6 offset-3">
                <label class="col-4" for="cilindraje">Auto Imagen</label>
                <input class="col-8" type="text" name="autoImgUrl"  id="autoImgUrl" value="{{autoImgUrl}}" {{~readonly}} />
            </div>
            <div class="row col-6 offset-3 flex-end">
                {{if ~showConfirm}}
                <button type="submit" class="primary">Confirmar</button>&nbsp;
                {{endif ~showConfirm}}
                <button id="btnCancelar" class="btn"> Cancelar</button>
            </div>
            {{if ~global_haserror}}
            <div class="error">
                <ul>
                    {{foreach ~global_error}}
                        <li>{{this}}</li>
                    {{endfor ~global_error}}
                </ul>
            </div>
        {{endif ~global_haserror}}
            {{endwith carro}}
        </form>
</section>
<script>
    document.addEventListener("DOMContentLoaded", ()=>{
        document.getElementById("btnCancelar").addEventListener('click', (e)=>{
            e.preventDefault();
            e.stopPropagation();
            window.location.assign("index.php?page=Autos-autolist");
        })
    })
</script>