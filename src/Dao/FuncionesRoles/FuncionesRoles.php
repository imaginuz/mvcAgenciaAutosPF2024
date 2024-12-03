<?php

namespace Dao\FuncionesRoles;

use Dao\Table;

class FuncionesRoles extends Table
{
    public static function obtenerFuncionesRoles()
    {
        $sqlstr = "SELECT * FROM funciones_roles";
        $params = [];
        $registros = self::obtenerRegistros($sqlstr, $params);
        return $registros;
    }
        
    public static function obtenerPorId($id)
    {
        $sqlstr = "SELECT * FROM funciones_roles WHERE id = :id";
        $params = ['id' => $id];
        $registros = self::obtenerUnRegistro($sqlstr, $params);
        return $registros;
    }

    public static function agregarFuncionesRoles($rolescod, $fncod, $fnrolest, $fnexp)
    {
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

        public static function actualizarFunciones_Roles($rolescod, $fncod, $fnrolest, $fnexp)
        {
            $sqlstr = "UPDATE funciones_roles SET 
            rolescod = :rolescod, 
            fncod = :fncod, 
            fnrolest = :fnrolest, 
            fnexp = :fnexp 
            WHERE rolescod = :rolescod";
            $params = [
                'rolescod' => $rolescod, 
                'fncod' => $fncod, 
                'fnrolest' => $fnrolest, 
                'fnexp' => $fnexp];
            $registros = self::executeNonQuery($sqlstr, $params);
            return $registros;
        }
}