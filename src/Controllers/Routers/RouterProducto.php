<?php

namespace Controllers\Routers;

use Controllers\PublicController;
use \Dao\Productos\Productos as RoutersDao;
use \Views\Renderer as Renderer;
use \Utilities\Site as Site;

class RouterProducto extends PublicController
{
    public function run(): void
    {
        Site::addLink("public/css/products.css");

        $viewData = [];
        $viewData["routersPr"] = RoutersDao::getProductsInRange(16);
        Renderer::render("routers/routers", $viewData);
    }
}
?>