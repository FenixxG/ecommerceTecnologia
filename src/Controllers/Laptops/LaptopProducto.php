<?php

namespace Controllers\Laptops;

use Controllers\PublicController;
use \Dao\Productos\Productos as LaptopsDao;
use \Views\Renderer as Renderer;
use \Utilities\Site as Site;

class LaptopProducto extends PublicController
{
    public function run(): void
    {
        Site::addLink("public/css/products.css");

        $viewData = [];
        $viewData["laptopsPr"] = LaptopsDao::getProductsInRange(12);
        Renderer::render("laptops/laptops", $viewData);
    }
}
?>