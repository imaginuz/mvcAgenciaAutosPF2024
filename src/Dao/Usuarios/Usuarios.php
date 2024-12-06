<?php

namespace Dao\Usuarios;

use Dao\Table;

class Usuarios extends Table {

    public static function obtenerUsuarios()
    {
        $sqlstr = 'SELECT * FROM usuario;';
        return self::obtenerRegistros($sqlstr, []);
    }

    public static function obtenerUsuarioPorId($usercod)
    {
        $sqlstr = 'SELECT * FROM usuario WHERE usercod = :usercod;';
        return self::obtenerUnRegistro($sqlstr, ['usercod' => $usercod]);
    }

    public static function agregarUsuario($usuario)
    {
        unset($usuario['usercod']);
        $rolecod = '';
        $sqlstr = 'INSERT INTO usuario (
            useremail, username, userpswd, userfching, 
            userpswdest, userpswdexp, userest, useractcod, 
            userpswdchg, usertipo
        ) VALUES (
            :useremail, :username, :userpswd, :userfching, 
            :userpswdest, :userpswdexp, :userest, :useractcod, 
            :userpswdchg, :usertipo
        );';
        switch($usuario['usertipo']){
            case 'PBL':
                $rolecod = 'Publico';
                break;
            case 'ADM';
                $rolecod = 'Admin';
                break;
            default:
                $rolecod = 'Publico';
                break;
        }
        $sqlstrRolUsuario = 'INSERT INTO roles_usuarios (
            usercod, rolescod, roleuserest, roleuserfch, roleuserexp
        ) VALUES (
            :usercod, :rolescod, :roleuserest, :roleuserfch, :roleuserexp
        );';
        $fechaActual = new \DateTime();
        $fechaExpiracion = $fechaActual->modify('+1 year')->format('Y-m-d H:i:s');
        $parametrosRolUsuario = [
            'usercod' => $usuario['usercod'],
            'rolescod' => $rolecod,
            'roleuserest' => 'ACT',
            'roleuserfch' => (new \DateTime())->format('Y-m-d H:i:s'),
            'roleuserexp' => $fechaExpiracion
        ];
        return self::executeNonQuery($sqlstrRolUsuario, $parametrosRolUsuario , $usuario);

    }

    public static function actualizarUsuario($usuario)
    {
        $sqlstr = 'UPDATE usuario SET 
            useremail = :useremail, 
            username = :username, 
            userpswd = :userpswd, 
            userfching = :userfching, 
            userpswdest = :userpswdest, 
            userpswdexp = :userpswdexp, 
            userest = :userest, 
            useractcod = :useractcod, 
            userpswdchg = :userpswdchg, 
            usertipo = :usertipo
        WHERE usercod = :usercod;';
        return self::executeNonQuery($sqlstr, $usuario);
    }

    public static function eliminarUsuario($usercod)
    {
        $sqlstr = 'DELETE FROM usuario WHERE usercod = :usercod;';
        return self::executeNonQuery($sqlstr, ['usercod' => $usercod]);
    }
}
