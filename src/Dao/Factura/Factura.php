<?php

namespace Dao\PFactura; 
use Dao\Table; 

class Factura extends Table
{
    protected $table = "factura";
    protected $primary_key = "id";
    protected $fields = [
        "id",
        "id_cliente",
        "fecha",
        "total",
        "estado"
    ];
}