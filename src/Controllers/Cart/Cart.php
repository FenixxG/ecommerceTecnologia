<?php

namespace Controller\Cart;
use Controllers\PrivateController;
use Views\Renderer;
use Dao\Cart\Cart as CartDao;

class CartController extends PrivateController
{
    public function agregarAlCarrito($productId)
    {
        // Verificar si el productId es válido (por ejemplo, si es un entero positivo)
        if (!is_numeric($productId) || $productId <= 0) {
            // Manejar el error de productId inválido, por ejemplo, redirigir a una página de error.
            // Por simplicidad, aquí se asume que hay una función 'mostrarError' para mostrar errores.
            return $this->mostrarError("Producto no válido.");
        }

        // Obtener información del producto a agregar al carrito
        $producto = CartDao::getProductoDisponible($productId);

        // Verificar si se encontró el producto y si está disponible
        if (empty($producto) || $producto['productStock'] <= 0) {
            // Manejar el caso en que el producto no está disponible, por ejemplo, mostrar un mensaje de error.
            return $this->mostrarError("El producto no está disponible en stock.");
        }

        // Agregar el producto al carrito (puedes implementar esta función en tu DAO Cart)
        // Aquí se asume que hay una función 'agregarProductoAlCarrito' en el DAO Cart.
        CartDao::agregarProductoAlCarrito($productId);

        // Redirigir a la página del carrito de compras
        header("Location: /carrito");
        exit;
    }

    private function mostrarError($mensaje)
    {
        // Aquí puedes implementar cómo deseas manejar y mostrar los errores en tu aplicación.
        // Por ejemplo, mostrar un mensaje de error en una página específica o redirigir a una página de error.
        echo "<p>Error: $mensaje</p>";
        exit;
    }
}
