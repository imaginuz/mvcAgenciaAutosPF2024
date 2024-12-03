<?php

namespace Dao\FuncionesRoles;

use Dao\Table;

class FuncionesRoles extends Table
{
    public static function getFuncionesRoles()
    {
        $sqlstr = "SELECT * FROM funciones_roles";
        $params = [];
        $registros = self::obtenerRegistros($sqlstr, $params);
        return $registros;
    }
        
    public static function obtenerPorId($fncod)
    {
        $sqlstr = "SELECT * FROM funciones_roles WHERE fncod = :fncod";
        $params = ['fncod' => $fncod];
        $registros = self::obtenerUnRegistro($sqlstr, $params);
        return $registros;
    }

    public static function agregarFuncionesRoles($rolescod, $fncod, $fnrolest, $fnexp){
	
        $sqlstr = "INSERT INTO funciones_roles (
            rolescod, 
            fncod, 
            fnrolest, 
            fnexp) 
            VALUES (
            :rolescod, 
            :fncod, 
            :fnrolest, 
            :fnexp)";
        $params = ['rolescod' => $rolescod, 'fncod' => $fncod, 'fnrolest' => $fnrolest, 'fnexp' => $fnexp];
        $registros = self::executeNonQuery($sqlstr, $params);
        return $registros;
    
        }
}