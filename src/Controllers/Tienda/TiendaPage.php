<?php

namespace Controllers\Tienda;

use Controllers\PublicController;
use Views\Renderer;
use Dao\Autos\Autos;

class TiendaPage extends PublicController{
    public function run() :void 
    {
        $AutosDao = Autos::obtenerAutos();
        $viewAutos = [];
        foreach ($AutosDao as $autos){
            $viewAutos[] = $autos;
        }
        $viewData = [
            "autos" => $viewAutos
        ];

        Renderer::render('tienda/tienda',$viewData);
    }

}