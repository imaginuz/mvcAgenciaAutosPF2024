<?php

namespace Controllers\Checkout;

use Controllers\PublicController;
use Dao\Carrito\Carrito;
use TCPDF;
use Utilities\Site;

class Accept extends PublicController
{
    public function run(): void
    {
        $dataview = array();
        $token = $_GET["token"] ?: "";
        $session_token = $_SESSION["orderid"] ?: "";

        if ($token !== "" && $token == $session_token) {
            $response = \Utilities\Paypal\PayPalCapture::captureOrder($session_token);
            if ($response->statusCode == 201) {
                $result = $response->result;

                $dataview["orderjson"] = json_encode($result, JSON_PRETTY_PRINT);
                $carritoItems = Carrito::obtenerCarritoPendiente();
                foreach ($carritoItems as $carritoItem) {
                    Carrito::vaciarCarrito($carritoItem['id_carrito']);
                }

                $this->generateInvoicePDF($result);
                Site::redirectToWithMsg('index.php?page=Checkout-Accept', "La compra fue exitosa");
                exit();

            } else {
                $dataview["orderjson"] = "No se pudo procesar la orden.";
            }

        } else {
            $dataview["orderjson"] = "No Order Available!!!";
        }

        \Views\Renderer::render("paypal/accept", $dataview);
    }

    private function generateInvoicePDF($result)
    {
        $pdf = new TCPDF();
        $pdf->SetCreator(PDF_CREATOR);
        $pdf->SetAuthor('Tu Empresa');
        $pdf->SetTitle('Factura de Compra');
        $pdf->SetSubject('Factura de Compra - Pedido PayPal');

        $pdf->AddPage();

        $pdf->SetFont('helvetica', '', 12);
        
        $pdf->Cell(0, 10, 'Factura de Compra', 0, 1, 'C');
        $pdf->Ln(5);
        
        $pdf->Cell(0, 10, 'ID de la orden: ' . $result->id, 0, 1);
        $pdf->Cell(0, 10, 'Estado del pago: ' . $result->status, 0, 1);
        $pdf->Cell(0, 10, 'Monto Total: ' . $result->purchase_units[0]->payments->captures[0]->amount->value . ' USD', 0, 1);
        
        $pdf->Ln(5);

        $payer = $result->payer;
        $pdf->Cell(0, 10, 'Detalles del cliente:', 0, 1);
        $pdf->Cell(0, 10, 'Nombre: ' . $payer->name->given_name . ' ' . $payer->name->surname, 0, 1);
        $pdf->Cell(0, 10, 'Email: ' . $payer->email_address, 0, 1);
        $pdf->Cell(0, 10, 'Dirección: ' . $payer->address->country_code, 0, 1);
        
        $shipping = $result->purchase_units[0]->shipping;
        $pdf->Ln(5);
        $pdf->Cell(0, 10, 'Dirección de envío:', 0, 1);
        $pdf->Cell(0, 10, 'Nombre: ' . $shipping->name->full_name, 0, 1);
        $pdf->Cell(0, 10, 'Dirección: ' . $shipping->address->address_line_1, 0, 1);
        $pdf->Cell(0, 10, 'Ciudad: ' . $shipping->address->admin_area_2, 0, 1);
        $pdf->Cell(0, 10, 'Código Postal: ' . $shipping->address->postal_code, 0, 1);
        $pdf->Cell(0, 10, 'País: ' . $shipping->address->country_code, 0, 1);
        $pdf->Output('factura_compra.pdf', 'D');
    }
}
