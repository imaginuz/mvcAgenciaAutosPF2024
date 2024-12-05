<?php

namespace Dao\Carrito;

use Dao\Table;

class Carrito extends Table
{
    public static function obtenerCarritoPendiente()
    {
        $sqlstr = "SELECT * FROM carrito WHERE estado = 'pendiente';";
        return self::obtenerRegistros($sqlstr, []);
    }

    public static function agregarAlCarrito($carrito)
    {
        $sqlstr = "INSERT INTO carrito (id_auto, cantidad) 
                   VALUES (:id_auto, :cantidad)
                   ON DUPLICATE KEY UPDATE 
                   cantidad = cantidad + :cantidad;";
        return self::executeNonQuery($sqlstr, $carrito);
    }

    public static function actualizarCantidad($id_carrito, $cantidad)
    {
        $sqlstr = "UPDATE carrito SET cantidad = :cantidad WHERE id_carrito = :id_carrito;";
        return self::executeNonQuery($sqlstr, ['cantidad' => $cantidad, 'id_carrito' => $id_carrito]);
    }

    public static function eliminarDelCarrito($id_carrito)
    {
        $sqlstr = "DELETE FROM carrito WHERE id_carrito = :id_carrito;";
        return self::executeNonQuery($sqlstr, ['id_carrito' => $id_carrito]);
    }

    public static function vaciarCarrito($id_carrito)
    {
        $sqlstr = "DELETE FROM carrito WHERE id_carrito = :id_carrito AND estado = 'pendiente';";
            return self::executeNonQuery($sqlstr, ['id_carrito' => $id_carrito]);
    }

    public static function marcarCarritoComoComprado($id_carrito)
    {
        $sqlstr = "UPDATE carrito SET estado = 'comprado' WHERE id_carrito = :id_carrito AND estado = 'pendiente';";
            return self::executeNonQuery($sqlstr, ['id_carrito' => $id_carrito]);
    }
}
