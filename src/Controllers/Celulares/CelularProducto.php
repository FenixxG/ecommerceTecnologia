<?php

namespace Controllers\Celulares;

use Controllers\PublicController;
use \Dao\Productos\Productos as CelularesDao;
use \Views\Renderer as Renderer;
use \Utilities\Site as Site;

class CelularProducto extends PublicController
{
    public function run(): void
    {
        Site::addLink("public/css/products.css");

        $viewData = [];
        $viewData["celularesPr"] = CelularesDao::getProductsInRange(0);
        Renderer::render("celulares/celulares", $viewData);
    }
}
?>