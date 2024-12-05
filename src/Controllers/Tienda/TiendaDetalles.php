<?php

namespace Controllers\Tienda;

use Controllers\PublicController;
use Views\Renderer;
use Dao\Autos\Autos;
use Dao\Carrito\Carrito;
use Utilities\Site;

class TiendaDetalles extends PublicController
{
    private $viewData = [];
    private $id_auto ='';
    private $cantidad = 0;
    private $auto = [
        "id_auto" => 0,
        "marca" => '',
        "modelo" => '',
        "anio" => 0,
        "registro" => '',
        "estado" => '',
        "precio" => 0,
        "precio_min" => 0,
        "autoImgUrl" => '',
    ];
    public function run(): void
    {
        $this->inicializarForm();
        if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['agregar_carrito'])) {
            $this->cantidad = 1;

            Carrito::agregarAlCarrito([
                'id_auto' => $this->id_auto,
                'cantidad' => $this->cantidad
            ]);
            Site::redirectToWithMsg("index.php?page=Tienda-TiendaPage", "Auto Agregado con exito al Carrito.");
            exit;
        }
        $this->generarViewData();
        Renderer::render('tienda/detalles', $this->viewData);
    }

    private function inicializarForm()
    {
        if (isset($_GET["id"])) {
            $this->id_auto = $_GET["id"];
        } else {
            Site::redirectToWithMsg("index.php?page=Tienda-TiendaPage", "Hubo un error en el guardado, Reintente");
            die();
        }
        if (isset($_GET["id"])) {
            $this->auto["id_auto"] = $_GET["id"];
            $this->cargarDatosAuto();
        }
    }

    private function cargarDatosAuto()
    {
        $tmpAuto = Autos::obenerAutoPorId($this->auto["id_auto"]);
        $this->auto = $tmpAuto;
    }

    private function generarViewData()
    {
        $this->viewData["id"] = $this->id_auto;
        $this->viewData["auto"] = $this->auto;
    }

}
