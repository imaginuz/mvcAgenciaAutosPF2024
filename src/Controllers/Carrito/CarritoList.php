<?php

namespace Controllers\Carrito;

use Controllers\PublicController;
use Views\Renderer;
use Dao\Carrito\Carrito;

class CarritoList extends PublicController
{
    private $viewData = [];

    public function run(): void
    {
        $CarritoDao = Carrito::obtenerCarritoPendiente();
        $viewCarritos = [];
        $totalPagar = 0;

        if ($CarritoDao) {
            foreach ($CarritoDao as $carrito) {
                $carrito['precio_total'] = $carrito['precio_auto'] * $carrito['cantidad'];
                $totalPagar += $carrito['precio_total'];
                $viewCarritos[] = $carrito;
            }
        }

        $this->viewData = [
            "carrito" => $viewCarritos,
            "total" => $totalPagar,
        ];

        Renderer::render('carrito/carrito', $this->viewData);
    }
}
