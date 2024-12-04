<?php

namespace Controllers\Autos;

use Controllers\PublicController;
use Views\Renderer;
use Dao\Autos\Autos;

class AutosList extends PublicController{
    public function run() :void 
    {
        $AutosDao = Autos::obtenerAutos();
        $viewAutos = [];
        $estados = [
            "DSP" => "Disponible",
            "RSV" => "Reservado",
            "SLD" => "Vendido"
        ];
        foreach ($AutosDao as $autos){
            $autos["estado"] = $estados[$autos["estado"]];
            $viewAutos[] = $autos;
        }
        $viewData = [
            "autos" => $viewAutos
        ];

        Renderer::render('autos/AutosList',$viewData);
    }

}