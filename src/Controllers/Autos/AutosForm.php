<?php

namespace Controllers\Autos;

use Controllers\PublicController;
use Views\Renderer;
use Utilities\Site;
use Dao\Autos\Autos;
use Utilities\Validators;

class AutosForm extends PublicController
{

    private $viewData = [];
    private $mode = '';
    private $modeArr = [
        "INS" => "Crear nuevo Auto",
        "UPD" => "Editando %s (%s)",
        "DSP" => "Detalle de %s (%s)",
        "DEL" => "Eliminado %s (%s)"
    ];

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

    private $errors = [];

    private $xssToken = '';

    private function addError($error, $context = '')
    {
        if (isset($this->errors[$context])) {
            $this->errors[$context][] = $error;
        }
        $this->errors[$context] = [$error];
    }

    public function run(): void
    {
        $this->inicializarForm();
        if ($this->isPostBack()) {
            $this->cargarDatosFormulario();
            if ($this->validarDatos()) {
                $this->procesarAccion();
            }
        }
        $this->generarViewData();
        Renderer::render('autos/AutoForm', $this->viewData);
    }

    private function inicializarForm()
    {
        if (isset($_GET["mode"]) && isset($this->modeArr[$_GET["mode"]])) {
            $this->mode = $_GET["mode"];
        } else {
            Site::redirectToWithMsg("index.php?page=Autos-AutosList", "Hubo un error en el guardado, Reintente");
            die();
        }
        if ($this->mode !== 'INS' && isset($_GET["id_auto"])) {
            $this->auto["id_auto"] = $_GET["id_auto"];
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
        $this->viewData["modes_dsc"] = sprintf(
            $this->modeArr[$this->mode],
            $this->auto["marca"],
            $this->auto["id_auto"]
        );
        $this->viewData["mode"] = $this->mode;
        $this->viewData["auto"] = $this->auto;
        $this->viewData["readonly"] =
            ($this->viewData["mode"] === 'DEL'
                || $this->viewData["mode"] === 'DSP'
            ) ? 'readonly' : '';
            foreach($this->errors as $context=>$errores){
                $this->viewData[$context. '_error'] = $errores;
                $this->viewData[$context. '_haserror']=count($errores);
            }
        $this->viewData["showConfirm"] = ($this->viewData["mode"] != 'DSP');
        $this->generateAntiXSSToken();
        $this->viewData["xssToken"] = $this->xssToken;
    }

    private function cargarDatosFormulario()
    {
        $this->auto["marca"] = $_POST["marca"];
        $this->auto["modelo"] = $_POST["modelo"];
        $this->auto["anio"] = $_POST["anio"];
        $this->auto["registro"] = $_POST["registro"];
        $this->auto["estado"] = $_POST["estado"];
        $this->auto["precio"] = $_POST["precio"];
        $this->auto["precio_min"] = $_POST["precio_min"];
        $this->auto["autoImgUrl"] = $_POST["autoImgUrl"];

        $this->xssToken = $_POST["xssToken"];
    }

    private function validarDatos()
    {
        if (!$this->validarAntiXSSToken()) {
            Site::redirectToWithMsg('index.php?page=Autos-Autos-List', "Error al procesar la solicitud.");
        }
        if (Validators::IsEmpty($this->auto["modelo"])) {
            $this->addError("Modelo no puede venir vacio", "modelo");
        }
        if (Validators::IsEmpty($this->auto["marca"])) {
            $this->addError("Marca no puede venir vacio", "marca");
        }
        if ($this->auto["anio"] < 1886 || $this->auto["anio"] > date("Y")) {
            $this->addError("Año no valido", "anio");
        }
        if (Validators::IsEmpty($this->auto["registro"])) {
            $this->addError("Registro no puede venir vacio", "registro");
        }
        if (Validators::IsEmpty($this->auto["estado"])) {
            $this->addError("Estado no puede venir vacio", "estado");
        }
        if ($this->auto["precio"] <= 0) {
            $this->addError("Precio no valido", "precio");
        }
        if ($this->auto["precio_min"] <= 0) {
            $this->addError("Precio minimo no valido", "precio_min");
        }
        if (Validators::IsEmpty($this->auto["autoImgUrl"])) {
            $this->addError("Imagen del auto no puede venir vacio", "autoImgUrl");
        }

        return count($this->errors) === 0;
    }

    private function procesarAccion()
    {
        switch ($this->mode) {
            case 'INS':
                $result = Autos::agregarAutos($this->auto);
                if ($result) {
                    Site::redirectToWithMsg("index.php?page=Autos-AutosList", "Auto Registrado satisfactoriamente");
                }
                break;
            case 'UPD':
                $result = Autos::actualizarAuto($this->auto);
                if ($result) {
                    Site::redirectToWithMsg("index.php?page=Autos-AutosList", "Auto Actualizado satisfactoriamente");
                }
                break;
            case 'DEL':
                $result = Autos::eliminarAuto($this->auto['id_auto']);
                if ($result) {
                    Site::redirectToWithMsg("index.php?page=Autos-AutosList", "Auto Eliminado satisfactoriamente");
                }
                break;
        }
    }

    private function generateAntiXSSToken()
    {
        $_SESSION["Autos_Form_XSST"] = hash("sha256", time() . "AUTO_FORM");
        $this->xssToken = $_SESSION["Autos_Form_XSST"];
    }

    private function validarAntiXSSToken()
    {
        if (isset($_SESSION["Autos_Form_XSST"])) {
            if ($this->xssToken === $_SESSION["Autos_Form_XSST"]) {
                return true;
            } else {
                return false;
            }
        }
    }
}
