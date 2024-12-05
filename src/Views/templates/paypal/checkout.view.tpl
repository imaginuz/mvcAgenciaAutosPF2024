<section class="container">
  <h2>Carrito de Compras</h2>
  <table class="table table-bordered table-striped">
    <thead>
      <tr>
        <th>Imagen</th>
        <th>Nombre del Producto</th>
        <th>Cantidad</th>
        <th>Precio Unitario</th>
        <th>Subtotal</th>
      </tr>
    </thead>
    <tbody>
      {{foreach carrito}}
      <tr>
        <td>
          <img src="{{imagen_auto}}" alt="Imagen del auto" style="width: 100px; height: auto;">
        </td>
        <td>{{marca}} {{modelo}}</td>
        <td>{{cantidad}}</td>
        <td>$ {{precio_auto}}</td>
        <td>$ {{subtotal}}</td>
      </tr>
      {{endfor carrito}}
    </tbody>
    <tfoot>
      <tr>
        <td colspan="4" class="text-end"><strong>Total:</strong></td>
        <td><strong>$ {{totalPagar}}</strong></td>
      </tr>
    </tfoot>
  </table>

  <form action="index.php?page=checkout_checkout" method="post" class="text-center mt-4">
    <button type="submit" class="btn btn-success">
      <i class="fa-solid fa-credit-card"></i> &nbsp; Realizar Pedido
    </button>
  </form>
</section>
