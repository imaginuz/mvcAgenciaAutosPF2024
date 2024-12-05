<?php

namespace Controllers\Checkout;

use Controllers\PrivateController;
use Dao\Carrito\Carrito;
use Dao\Autos\Autos;

class Checkout extends PrivateController
{
    public function run(): void
    {
        $viewData = [];

        $carritoItems = Carrito::obtenerCarritoPendiente();
        $totalPagar = 0;

        foreach ($carritoItems as &$item) {
            $item['subtotal'] = $item['cantidad'] * $item['precio_auto'];
            $totalPagar += $item['subtotal'];
        }

        $viewData = [
            "carrito" => $carritoItems,
            "totalPagar" => $totalPagar
        ];

        if ($this->isPostBack()) {
            $carritoItems = Carrito::obtenerCarritoPendiente();
            if (empty($carritoItems)) {
                \Utilities\Site::redirectToWithMsg(
                    "index.php?page=Carrito-CarritoList",
                    "No hay artículos en el carrito."
                );
            }

            $PayPalOrder = new \Utilities\Paypal\PayPalOrder(
                "order_" . (time() - 10000000),
                "http://localhost/nw/AgenciaAutosPF2024/index.php?page=Checkout-Error",
                "http://localhost/nw/AgenciaAutosPF2024/index.php?page=Checkout-Accept"
            );
            foreach ($carritoItems as $carrito) {
                $auto = Autos::obenerAutoPorId($carrito['id_auto']);
                if (!$auto) {
                    continue;
                }
                $PayPalOrder->addItem(
                    $auto['marca'] . ' ' . $auto['modelo'],
                    "CarritoItem" . $carrito['id_carrito'],
                    "AUTO" . $carrito['id_auto'],
                    $auto['precio'],
                    round($auto['precio'] * 0., 2),
                    $carrito['cantidad'],
                    "PHYSICAL_GOODS"
                );
            }
            $PayPalRestApi = new \Utilities\PayPal\PayPalRestApi(
                \Utilities\Context::getContextByKey("PAYPAL_CLIENT_ID"),
                \Utilities\Context::getContextByKey("PAYPAL_CLIENT_SECRET")
            );
            $PayPalRestApi->getAccessToken();
            $response = $PayPalRestApi->createOrder($PayPalOrder);
            $_SESSION["orderid"] = $response->id;
            foreach ($response->links as $link) {
                if ($link->rel == "approve") {
                    \Utilities\Site::redirectTo($link->href);
                }
            }
            die();
        }
        \Views\Renderer::render("paypal/checkout", $viewData);
    }
}
