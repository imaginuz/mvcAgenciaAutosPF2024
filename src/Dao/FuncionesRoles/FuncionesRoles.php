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

    public static function actualizarFuncionesRoles($rolescod, $fncod, $fnrolest, $fnexp){
	
        $sqlstr = "UPDATE funciones_roles SET rolescod = :rolescod, fncod = :fncod, fnrolest = :fnrolest, fnexp = :fnexp WHERE rolescod = :rolescod";
        $params = ['rolescod' => $rolescod, 'fncod' => $fncod, 'fnrolest' => $fnrolest, 'fnexp' => $fnexp];
        $registros = self::executeNonQuery($sqlstr, $params);
        return $registros;
    
	}

    public static function elimianarFuncionesRoles($id){
        $sqlstr= "DELETE  FROM funciones_roles WHERE rolescod = :id";
            $params = ['id'=>$id];
            $registros = self::executeNonQuery($sqlstr, $params);
            return $registros;
        }
}