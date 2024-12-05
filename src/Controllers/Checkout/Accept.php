<?php

namespace Controllers\Checkout;

use Controllers\PublicController;
use Dao\Carrito\Carrito;
use TCPDF;

class Accept extends PublicController
{
    public function run(): void
    {
        $dataview = array();
        $token = $_GET["token"] ?: "";
        $session_token = $_SESSION["orderid"] ?: "";

        if ($token !== "" && $token == $session_token) {
            // Capturar el pedido de PayPal
            $response = \Utilities\Paypal\PayPalCapture::captureOrder($session_token);

            // Verificar si la respuesta es correcta
            if ($response->statusCode == 201) {
                // Acceder directamente al resultado sin decodificar
                $result = $response->result;  // Ya es un objeto, no necesitas json_decode

                $dataview["orderjson"] = json_encode($result, JSON_PRETTY_PRINT);

                // Vaciar el carrito
                $carritoItems = Carrito::obtenerCarritoPendiente();
                foreach ($carritoItems as $carritoItem) {
                    Carrito::vaciarCarrito($carritoItem['id_carrito']);
                }

                // Generar PDF
                $this->generateInvoicePDF($result);

                // Redirigir a la vista de confirmación
                header("Location: /confirmation"); // Aquí la URL de la vista de confirmación
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
        // Crear una nueva instancia de TCPDF
        $pdf = new TCPDF();

        // Establecer las propiedades del documento
        $pdf->SetCreator(PDF_CREATOR);
        $pdf->SetAuthor('Tu Empresa');
        $pdf->SetTitle('Factura de Compra');
        $pdf->SetSubject('Factura de Compra - Pedido PayPal');

        // Añadir una página
        $pdf->AddPage();

        // Escribir el contenido
        $pdf->SetFont('helvetica', '', 12);
        
        $pdf->Cell(0, 10, 'Factura de Compra', 0, 1, 'C');
        $pdf->Ln(5);
        
        // Mostrar detalles del pago
        $pdf->Cell(0, 10, 'ID de la orden: ' . $result->id, 0, 1);
        $pdf->Cell(0, 10, 'Estado del pago: ' . $result->status, 0, 1);
        $pdf->Cell(0, 10, 'Monto Total: ' . $result->purchase_units[0]->payments->captures[0]->amount->value . ' USD', 0, 1);
        
        $pdf->Ln(5);

        // Detalles del cliente
        $payer = $result->payer;
        $pdf->Cell(0, 10, 'Detalles del cliente:', 0, 1);
        $pdf->Cell(0, 10, 'Nombre: ' . $payer->name->given_name . ' ' . $payer->name->surname, 0, 1);
        $pdf->Cell(0, 10, 'Email: ' . $payer->email_address, 0, 1);
        $pdf->Cell(0, 10, 'Dirección: ' . $payer->address->country_code, 0, 1);
        
        // Detalles de la dirección de envío
        $shipping = $result->purchase_units[0]->shipping;
        $pdf->Ln(5);
        $pdf->Cell(0, 10, 'Dirección de envío:', 0, 1);
        $pdf->Cell(0, 10, 'Nombre: ' . $shipping->name->full_name, 0, 1);
        $pdf->Cell(0, 10, 'Dirección: ' . $shipping->address->address_line_1, 0, 1);
        $pdf->Cell(0, 10, 'Ciudad: ' . $shipping->address->admin_area_2, 0, 1);
        $pdf->Cell(0, 10, 'Código Postal: ' . $shipping->address->postal_code, 0, 1);
        $pdf->Cell(0, 10, 'País: ' . $shipping->address->country_code, 0, 1);

        // Cerrar y generar el archivo PDF
        $pdf->Output('factura_compra.pdf', 'D'); // 'D' para forzar la descarga
    }
}
