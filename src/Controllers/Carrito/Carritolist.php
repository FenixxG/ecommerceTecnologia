<?php

namespace Controllers\Carrito;

use Controllers\PublicController;

class Carritolist extends PublicController
{
    private $productId = "";

    public function run(): void
    {
        // Obtener el ID del producto si está presente en la URL
        $this->productId = isset($_GET["productId"]) ? $_GET["productId"] : "";

        // Iniciar la sesión si no está iniciada
        if (session_status() === PHP_SESSION_NONE) {
            session_start();
        }

        // Manejar la eliminación de productos del carrito
        if (isset($_POST['removetoCart']) && $_POST['productId'] === $this->productId) {
            // Remover el producto del carrito
            if ($this->removeFromCart($this->productId)) {
                // Si se removió correctamente, mostrar un mensaje de confirmación
                echo "<script>alert('Producto removido del carrito.');</script>";
            } else {
                // Si no se pudo remover, mostrar un mensaje de error
                echo "<script>alert('Error: Producto no removido del carrito');</script>";
            }
        }

        // Manejar la adición de productos al carrito
        if (isset($_POST['addToCart']) && $_POST['productId'] === $this->productId) {
           
            $productName = \Dao\Cart\Cart::obtenerNombreProducto($this->productId);
            $productPrice = \Dao\Cart\Cart::obtenerPrecioProducto($this->productId);

            // Agregar el producto al carrito
            if ($this->addToCart($this->productId, $productName, $productPrice)) {
                // Si se agregó correctamente, mostrar un mensaje de confirmación
                echo "<script>alert('Producto agregado al carrito.');</script>";
            } else {
                // Si no se pudo agregar, mostrar un mensaje de error
                echo "<script>alert('Error: Producto no agregado al carrito');</script>";
            }
        }

        // Array para almacenar los productos en el carrito
        $productsInCart = [];

        // Iterar sobre $_SESSION para buscar los productos en el carrito
        foreach ($_SESSION as $key => $value) {
            // Verificar si la clave corresponde a un producto en el carrito (las claves de los productos tienen el formato 'product_productId')
            if (strpos($key, 'product_') !== false) {
                // Extraer el ID del producto de la clave
                $productId = substr($key, strpos($key, '_') + 1);

                // Calcular el subtotal del producto
                $subtotalProducto = $value['productPrice'] * ($value['cantidad']);

                // Agregar los detalles del producto al array de productos en el carrito
                $productsInCart[] = [
                    'productId' => $value['productId'],
                    'productName' => $value['productName'],
                    'productPrice' => $value['productPrice'],
                    'cantidad' => $value['cantidad'],
                    'subtotalProducto' => $subtotalProducto,
                ];
            }
        }

        // Calcular el subtotal, impuesto y total
        $subtotal = array_reduce($productsInCart, function ($carry, $product) {
            return $carry + $product['subtotalProducto'];
        }, 0);
        $impuesto = $subtotal * 0.15;
        $total = $subtotal + $impuesto;

        // Renderizar la vista del carrito y pasar los productos en el carrito, subtotal, impuesto y total como datos de la vista
        \Views\Renderer::render('carrito/carritolist', [
            'productsInCart' => $productsInCart,
            'subtotal' => $subtotal,
            'impuesto' => $impuesto,
            'total' => $total,
        ]);
    }

    private function addToCart($productId, $productName, $productPrice)
    {
        // Verificar si la sesión ya está activa
        if (session_status() === PHP_SESSION_NONE) {
            session_start();
        }

        // Agregar el producto al carrito
        $_SESSION["product_$productId"] = [
            'productId' => $productId,
            'productName' => $productName,
            'productPrice' => $productPrice
        ];

        return true;
    }

    private function removeFromCart($productId)
    {
        // Verificar si la sesión ya está activa
        if (session_status() === PHP_SESSION_NONE) {
            session_start();
        }

        // Verificar si el producto está en el carrito
        if (isset($_SESSION["product_$productId"])) {
            // Eliminar el producto del carrito
            unset($_SESSION["product_$productId"]);
            // Producto eliminado con éxito
            return true;
        }

        // Si el producto no estaba en el carrito, retornar false
        return false;
    }
}
