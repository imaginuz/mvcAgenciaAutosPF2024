<?php

namespace Controllers\Checkout;

use Controllers\PublicController;
use Utilities\Site;

class Error extends PublicController
{
    public function run(): void
    {
        echo "
            <div style='text-align: center;'>
                <h2>Hubo un error en el proceso de pago.</h2>
                <p>Por favor, intente nuevamente. Si el problema persiste, contacte con soporte.</p>
                <form action='index.php?page=Carrito-CarritoList' method='post'>
                    <button type='submit'>Aceptar</button>
                </form>
            </div>
        ";
        die();
    }
}
