<section class="container">
  <style>
    .container {
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

    .table {
        width: 100%;
        border-collapse: collapse;
        margin-bottom: 20px;
    }

    .table thead tr {
        background-color: #f8f9fa;
        text-align: left;
        font-weight: bold;
    }

    .table th, .table td {
        padding: 10px;
        border-bottom: 1px solid #ddd;
    }

    .table tfoot td {
        padding: 10px;
        font-weight: bold;
        border-top: 2px solid #ddd;
    }

    .table tfoot td:first-child {
        text-align: right;
    }

    .table img {
        width: 100px;
        height: auto;
        border-radius: 8px;
        display: block;
        margin: 0 auto;
    }

    .btn {
        background-color: #28a745;
        color: white;
        padding: 10px 20px;
        font-size: 1rem;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        text-align: center;
    }

    .btn:hover {
        background-color: #218838;
    }

    .btn i {
        margin-right: 5px;
    }
  </style>

  <h2>Finalizar Compra</h2>
  <table class="table">
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
          <img src="{{imagen_auto}}" alt="Imagen del auto">
        </td>
        <td>{{marca}} {{modelo}}</td>
        <td style="text-align: center;">{{cantidad}}</td>
        <td style="text-align: center;">$ {{precio_auto}}</td>
        <td style="text-align: center;">$ {{subtotal}}</td>
      </tr>
      {{endfor carrito}}
    </tbody>
    <tfoot>
      <tr>
        <td colspan="4" style="text-align: right;"><strong>Total:</strong></td>
        <td style="text-align: center;"><strong>$ {{totalPagar}}</strong></td>
      </tr>
    </tfoot>
  </table>

  <form action="index.php?page=checkout_checkout" method="post" style="text-align: center;">
    <button type="submit" class="btn">
      <i class="fa-solid fa-credit-card"></i> Realizar Pedido
    </button>
  </form>
</section>
