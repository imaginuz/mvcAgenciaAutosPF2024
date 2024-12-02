<?php

namespace Dao\Roles;

use Dao\Table;

class  Roles extends Table{
    public static function obtenerRoles()
    {
        $sqlstr = 'SELECT * FROM roles;';
        $roles = self ::obtenerRegistros($sqlstr, []);
        return $roles;
    }

    public static function obenerRolesPorId($id){
        $sqlstr = 'SELECT * FROM roles where rolescod =:rolescod;';
        $role= self:: obtenerUnRegistro($sqlstr, ["rolescod"=> $id]);
        return $role;
    }
    public static function agregarRoles($role){
        
      
        unset($role['rolescod']);
            $sqlstr = ' insert into roles (
            rolesdsc, rolesest)
            values
            (
            :rolesdsc,:rolesest
            );';
            return self::executeNonQuery($sqlstr, $role);
    }

    public static function actualizarRol($role){
      
        $sqlstr = "update roles set rolesdsc = :rolesdsc, rolesest = :rolesest where rolescod = :rolescod;";
            return self::executeNonQuery($sqlstr, $role);
        }

    public static function eliminarRol($role){
        $sqlstr = "delete from roles where rolescod = :rolescod;";
        return self::executeNonQuery($sqlstr, ["rolescod"=>$role]);
    }
}