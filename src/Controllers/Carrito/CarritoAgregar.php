<?php

namespace Controllers\Carrito;

use Controllers\PublicController;
use Dao\Carrito\Carrito;

class CarritoAgregar extends PublicController
{
    public function run(): void
    {
        $id_carrito = $_GET['id_carrito'] ?? null;

        if ($id_carrito) {
            $carrito = Carrito::obtenerCarritoPendientePorId($id_carrito);
            
            if ($carrito) {
                $nuevaCantidad = $carrito['cantidad'] + 1;
                Carrito::actualizarCantidad($id_carrito, $nuevaCantidad);
            }
        }
        header('Location: index.php?page=Carrito-CarritoList');
    }
}
