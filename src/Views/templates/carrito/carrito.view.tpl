<section class="container-l WWList">
  <style>
    .container-l {
        max-width: 1000px;
        margin: 0 auto;
        font-family: Arial, sans-serif;
    }

    h2 {
        text-align: center;
        font-size: 2rem;
        margin-bottom: 20px;
        font-weight: bold;
    }

    .my-4 {
        width: 100%;
        border-collapse: collapse;
        margin-bottom: 20px;
        font-size: 1rem;
    }

    .my-4 thead tr {
        background-color: #f8f9fa;
        text-align: left;
        font-weight: bold;
    }

    .my-4 th, .my-4 td {
        padding: 10px;
        border-bottom: 1px solid #ddd;
        text-align: center;
    }

    .my-4 tfoot td {
        padding: 10px;
        font-weight: bold;
        text-align: right;
        border-top: 2px solid #ddd;
    }

    .my-4 img {
        width: 50px;
        height: auto;
        border-radius: 5px;
    }

    .center a {
        text-decoration: none;
        color: #007bff;
        font-weight: bold;
    }

    .center a:hover {
        color: #0056b3;
    }

    .btn-primary {
        background-color: #007bff;
        color: white;
        padding: 10px 20px;
        font-size: 1rem;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        text-decoration: none;
        display: inline-block;
    }

    .btn-primary:hover {
        background-color: #0056b3;
    }

    .btn-primary i {
        margin-right: 5px;
    }

    .text-right {
        text-align: right;
    }

    .text-center {
        text-align: center;
    }
  </style>

  <section class="depth-1 px-4 py-4">
      <h2>Carrito De Compras</h2>
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
              <td><img src="{{imagen_auto}}" alt="Imagen del auto"></td>
              <td>{{cantidad}}</td>
              <td>${{precio_auto}}</td>
              <td>${{precio_total}}</td>
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
              <td colspan="8" class="text-right">Total a pagar: ${{total}}</td>
          </tr>
      </tfoot>
  </table>
  <!-- Botón para realizar la compra -->
  <div class="text-center mt-4">
      <a href="index.php?page=Checkout-Checkout" class="btn-primary">
          <i class="fa-solid fa-credit-card"></i> &nbsp; Realizar la compra
      </a>
  </div>
</section>
