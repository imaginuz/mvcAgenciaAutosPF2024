<?php

namespace Controllers\Checkout;

use Controllers\PublicController;
use Dao\Carrito\Carrito;  // Asegúrate de incluir el modelo Carrito

class Accept extends PublicController
{
    public function run(): void
    {
        $dataview = array();
        $token = $_GET["token"] ?: "";
        $session_token = $_SESSION["orderid"] ?: "";

        if ($token !== "" && $token == $session_token) {
            $result = \Utilities\Paypal\PayPalCapture::captureOrder($session_token);
            $dataview["orderjson"] = json_encode($result, JSON_PRETTY_PRINT);
            $carritoItems = Carrito::obtenerCarritoPendiente();
            foreach ($carritoItems as $carritoItem) {
                Carrito::vaciarCarrito($carritoItem['id_carrito']);
            }

        } else {
            $dataview["orderjson"] = "No Order Available!!!";
        }

        \Views\Renderer::render("paypal/accept", $dataview);
    }
}
