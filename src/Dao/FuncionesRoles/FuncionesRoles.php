<?php

namespace Dao\FuncionesRoles;

use Dao\Table;

class FuncionesRoles extends Table
{
    public static function getFuncionesRoles($filter = '')
    {
        $sqlstr = "SELECT * FROM funciones_roles WHERE fncod like :filter;";
        $params = array('filter' => '%' . $filter . '%');
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
}