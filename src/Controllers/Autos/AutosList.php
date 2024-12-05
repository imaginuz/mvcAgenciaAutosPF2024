<?php

namespace Controllers\Autos;

use Controllers\PrivateController;
use Views\Renderer;
use Dao\Autos\Autos;

class AutosList extends PrivateController{
    public function run() :void 
    {
        $search = isset($_POST['search']) ? $_POST['search'] : '';
        if ($search) {
            $AutosDao = Autos::obenerAutoPorId($search);
            $viewAutos = ($AutosDao) ? [$AutosDao] : [];
        } else {
            $AutosDao = Autos::obtenerAutos();
            $viewAutos = [];
            if ($AutosDao) {
                foreach ($AutosDao as $autos) {
                    $viewAutos[] = $autos;
                }
            }
        }

        $viewData = [
            "autos" => $viewAutos,
            "search" => $search,
            "INS_enable" => $this->isFeatureAutorized('autos_INS_enabled'),
            "UPD_enable" => $this->isFeatureAutorized('autos_UPD_enabled'),
            "DEL_enable" => $this->isFeatureAutorized('autos_DEL_enabled')
        ];

        Renderer::render('autos/AutosList', $viewData);
    }
}
