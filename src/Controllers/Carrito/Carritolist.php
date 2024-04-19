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
                echo "<script>alert('Producto removido del carrito.');</script>";
            } else {
                echo "<script>alert('Error: Producto no removido del carrito');</script>";
            }
        }

        // Manejar la adición de productos al carrito
        if (isset($_POST['addToCart']) && $_POST['productId'] === $this->productId) {
           
            $productDescription = \Dao\Cart\Cart::obtenerDescripcionProducto($this->productId);
            $productPrice = \Dao\Cart\Cart::obtenerPrecioProducto($this->productId);

            // Agregar el producto al carrito
            if ($this->addToCart($this->productId, $productDescription, $productPrice)) {
                echo "<script>alert('Producto agregado al carrito.');</script>";
            } else {
                echo "<script>alert('Error: Producto no agregado al carrito');</script>";
            }
        }

        // Array para almacenar los productos en el carrito
        $productsInCart = [];

        // Iterar sobre $_SESSION para buscar los productos en el carrito
        foreach ($_SESSION as $key => $value) {
            if (strpos($key, 'product_') !== false) {
                $productId = substr($key, strpos($key, '_') + 1);

                $subtotalProducto = $value['productPrice'] * ($value['cantidad']);

                // Agregar los detalles del producto al array de productos en el carrito
                $productsInCart[] = [
                    'productId' => $value['productId'],
                    'productDescription' => $value['productDescription'],
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

        \Views\Renderer::render('carrito/carritolist', [
            'productsInCart' => $productsInCart,
            'subtotal' => $subtotal,
            'impuesto' => $impuesto,
            'total' => $total,
        ]);
    }

    private function addToCart($productId, $productDescription, $productPrice)
    {
        // Verificar si la sesión ya está activa
        if (session_status() === PHP_SESSION_NONE) {
            session_start();
        }

        // Agregar el producto al carrito
        $_SESSION["product_$productId"] = [
            'productId' => $productId,
            'productDescription' => $productDescription,
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
        return false;
    }
}
