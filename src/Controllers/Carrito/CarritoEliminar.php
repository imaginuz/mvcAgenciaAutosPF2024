<?php
namespace Controllers\Carrito;

use Controllers\PublicController;
use Dao\Carrito\Carrito;

class CarritoEliminar extends PublicController
{
    public function run(): void
    {
        $id_carrito = $_GET['id_carrito'] ?? null;

        if ($id_carrito) {
            $carrito = Carrito::obtenerCarritoPendientePorId($id_carrito);
            
            if ($carrito) {
                if ($carrito['cantidad'] > 1) {
                    $nuevaCantidad = $carrito['cantidad'] - 1;
                    Carrito::actualizarCantidad($id_carrito, $nuevaCantidad);
                } else {
                    Carrito::eliminarDelCarrito($id_carrito);
                }
            }
        }
        header('Location: index.php?page=Carrito-CarritoList');
    }
}
