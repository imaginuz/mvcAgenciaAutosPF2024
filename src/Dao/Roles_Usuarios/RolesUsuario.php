<?php

namespace Dao\Roles;

use Dao\Table;

class  Roles extends Table{
    public static function obtenerRolUsuario()
    {
        $sqlstr = 'SELECT * FROM roles_usuarios;';
        $rolusuarios = self ::obtenerRegistros($sqlstr, []);
        return $rolusuarios;
    }

    public static function obenerRolUsuarioPorId($id){
        $sqlstr = 'SELECT * FROM roles_usuarios where usercod =:usercod;';
        $rolusuario= self:: obtenerUnRegistro($sqlstr, ["usercod"=> $id]);
        return $rolusuario;
    }
    public static function agregarRolUsuario($rolusuario){
        
            $sqlstr = ' insert into roles_usuarios (
            usercod, rolescod, roleuserest, roleuserfch, roleuserexp)
            values
            (
            :usercod, :rolescod, :roleuserest, :roleuserfch, :roleuserexp
            );';
            return self::executeNonQuery($sqlstr, $rolusuario);
    }

    public static function actualizarRolusurio($rolusuario){
      
        $sqlstr = "update roles_usuarios set
         usercod = :usercod, rolescod = :rolescod,roleuserest = :roleuserest, roleuserfch = :roleuserfch,
         roleuserexp = :roleuserexp
         where usercod = :usercod;";
            return self::executeNonQuery($sqlstr, $rolusuario);
        }

    public static function eliminarRolusuario($rolusuario){
        $sqlstr = "delete from roles_usuarios where usercod = :usercod;";
        return self::executeNonQuery($sqlstr, ["usercod"=>$rolusuario]);
    }
}