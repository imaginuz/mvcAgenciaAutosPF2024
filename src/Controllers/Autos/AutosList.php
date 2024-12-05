<?php

namespace Controllers\Autos;

use Controllers\PublicController;
use Views\Renderer;
use Dao\Autos\Autos;

class AutosList extends PublicController{
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
            "search" => $search
        ];

        Renderer::render('autos/AutosList', $viewData);
    }
}
