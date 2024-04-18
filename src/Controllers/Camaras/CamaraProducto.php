<?php

namespace Controllers\Camaras;

use Controllers\PublicController;
use \Dao\Productos\Productos as CamaraDao;
use \Views\Renderer as Renderer;
use \Utilities\Site as Site;

class CamaraProducto extends PublicController
{
    public function run(): void
    {
        Site::addLink("public/css/products.css");

        $viewData = [];
        $viewData["camarasPr"] = CamaraDao::getProductsInRange(4);
        Renderer::render("camaras/camaras", $viewData);
    }
}
?>