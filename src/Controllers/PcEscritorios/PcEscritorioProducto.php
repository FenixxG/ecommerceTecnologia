<?php

namespace Controllers\PcEscritorios;

use Controllers\PublicController;
use \Dao\Productos\Productos as EscritorioDao;
use \Views\Renderer as Renderer;
use \Utilities\Site as Site;

class PcEscritorioProducto extends PublicController
{
    public function run(): void
    {
        Site::addLink("public/css/products.css");

        $viewData = [];
        $viewData["pcescritorioPr"] = EscritorioDao::getProductsInRange(8);
        Renderer::render("pcescritorios/pcescritorios", $viewData);
    }
}
?>