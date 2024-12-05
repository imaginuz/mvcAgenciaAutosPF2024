<?php

namespace Controllers\Usuarios;

use Controllers\PrivateController;
use Views\Renderer;
use Dao\Usuarios\Usuarios;

class UsuariosList extends PrivateController {
    public function run() : void 
    {
        $search = isset($_POST['search']) ? $_POST['search'] : '';
        if ($search) {
            $UsuariosDao = Usuarios::obtenerUsuarioPorId($search);
            $viewUsuarios = ($UsuariosDao) ? [$UsuariosDao] : [];
        } else {
            $UsuariosDao = Usuarios::obtenerUsuarios();
            $viewUsuarios = [];
            if ($UsuariosDao) {
                foreach ($UsuariosDao as $usuario) {
                    $viewUsuarios[] = $usuario;
                }
            }
        }

        $viewData = [
            "usuarios" => $viewUsuarios,
            "search" => $search,
            "INS_enable" => $this->isFeatureAutorized('usuarios_INS_enabled'),
            "UPD_enable" => $this->isFeatureAutorized('usuarios_UPD_enabled'),
            "DEL_enable" => $this->isFeatureAutorized('usuarios_DEL_enabled')
        ];

        Renderer::render('usuarios/usuarioslist', $viewData);
    }
}
