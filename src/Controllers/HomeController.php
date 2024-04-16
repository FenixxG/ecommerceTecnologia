<?php

namespace Controllers;

use \Dao\Productos\Productos as ProductosDao;
use \Views\Renderer as Renderer;
use \Utilities\Site as Site;

class HomeController extends PublicController
{
  public function run(): void
  {
    Site::addLink("public/css/products.css");
    $viewData = [];
    $viewData["productsOnSale"] = ProductosDao::getDailyDeals();
    $viewData["productsHighlighted"] = ProductosDao::getFeaturedProducts();
    $viewData["productsNew"] = ProductosDao::getNewProducts();
    Renderer::render("inicio", $viewData);
  }
}
?>