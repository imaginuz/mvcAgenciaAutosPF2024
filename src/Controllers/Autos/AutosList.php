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
        foreach ($AutosDao as $autos){
            $viewAutos[] = $autos;
        }
        $viewData = [
            "autos" => $viewAutos
        ];

        Renderer::render('autos/AutosList',$viewData);
    }

}