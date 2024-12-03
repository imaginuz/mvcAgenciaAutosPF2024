<?php

namespace Dao\Factura; 
use Dao\Table; 

class Factura extends Table
{
    public static function obtenerFactura()
    {
        $sqlstr = "SELECT * FROM factura";
        $params = [];
        $registros = self::obtenerRegistros($sqlstr, $params);
        return $registros;
    }

    public static function obtenerPorId($id)
    {
        $sqlstr = "SELECT * FROM factura WHERE id_factura = :id";
        $params = ['id' => $id];
        $registros = self::obtenerUnRegistro($sqlstr, $params);
        return $registros;
    }

    public static function insertarFactura($id_factura, $fecha_factura, $total, $detalles, $usercod, $pagos){
	
        $sqlstr = "INSERT INTO factura (
        id_factura, 
        fecha_factura, 
        total, 
        detalles, 
        usercod, 
        pagos) 
        VALUES (:id_factura , :fecha_factura , :total , :detalles , :usercod , :pagos)";
        $params = [
            'id_factura' => $id_factura, 
            'fecha_factura' => $fecha_factura, 
            'total' => $total, 
            'detalles' => $detalles, 
            'usercod' => $usercod, 
            'pagos' => $pagos];
        $registros = self::executeNonQuery($sqlstr, $params);
        return $registros;
    
        }

    public static function actualizarFactura($id_factura, $fecha_factura, $total, $detalles, $usercod, $pagos)
    {
        $sqlstr = "UPDATE factura SET 
        id_factura = :id_factura,
        fecha_factura = :fecha_factura,
        total = total, 
        detalles = :detalles, 
        usercod = :usercod, 
        pagos = :pagos
        WHERE facod = :facod";
        $params = [
            'id_factura' => $id_factura, 
            'fecha_factura' => $fecha_factura, 
            'total' => $total, 
            'detalles' => $detalles, 
            'usercod' => $usercod, 
            'pagos' => $pagos];
        $registros = self::executeNonQuery($sqlstr, $params);
        return $registros;
    }

    public static function eliminarFactura($id)
    {
        $sqlstr = "DELETE FROM factura WHERE id_factura = :id";
        $params = ['id' => $id];
        $registros = self::executeNonQuery($sqlstr, $params);
        return $registros;
    }
}