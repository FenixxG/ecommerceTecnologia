<?php
namespace Dao\Productos;
use Dao\Table;

class Productos extends Table {
    public static function getFeaturedProducts() {
        $sqlstr = "SELECT p.productId, p.productName, p.productDescription, p.productPrice, p.productImgUrl, p.productStatus FROM productos p INNER JOIN highlights h ON p.productId = h.productId WHERE h.highlightStart <= NOW() AND h.highlightEnd >= NOW()";
        $params = [];
        $registros = self::obtenerRegistros($sqlstr, $params);
        return $registros;
    }

    public static function getNewProducts() {
        $sqlstr = "SELECT p.productId, p.productName, p.productDescription, p.productPrice, p.productImgUrl, p.productStatus FROM productos p WHERE p.productStatus = 'ACT' ORDER BY p.productId DESC LIMIT 4";
        $params = [];
        $registros = self::obtenerRegistros($sqlstr, $params);
        return $registros;
    }

    public static function getDailyDeals() {
        $sqlstr = "SELECT p.productId, p.productName, p.productDescription, s.salePrice as productPrice, p.productImgUrl, p.productStatus FROM productos p INNER JOIN sales s ON p.productId = s.productId WHERE s.saleStart <= NOW() AND s.saleEnd >= NOW()";
        $params = [];
        $registros = self::obtenerRegistros($sqlstr, $params);
        return $registros;
    }

    //Metodo para retornar la lista de productos
    public static function getProducts(
        string $partialName = "",
        string $status = "",
        string $orderBy = "",
        bool $orderDescending = false,
        int $page = 0,
        int $itemsPerPage = 10
      ) {
        $sqlstr = "SELECT p.productId, p.productName, p.productDescription, p.productPrice, p.productImgUrl, p.productStatus, case when p.productStatus = 'ACT' then 'Activo' when p.productStatus = 'INA' then 'Inactivo' else 'Sin Asignar' end as productStatusDsc 
        FROM productos p";
        $sqlstrCount = "SELECT COUNT(*) as count FROM productos p";
        $conditions = [];
        $params = [];

        if ($partialName != "") {
          $conditions[] = "p.productName LIKE :partialName";
          $params["partialName"] = "%" . $partialName . "%";
        }
        if (!in_array($status, ["ACT", "INA", ""])) {
          throw new \Exception("Error Processing Request Status has invalid value");
        }
        if ($status != "") {
          $conditions[] = "p.productStatus = :status";
          $params["status"] = $status;
        }
        if (count($conditions) > 0) {
          $sqlstr .= " WHERE " . implode(" AND ", $conditions);
          $sqlstrCount .= " WHERE " . implode(" AND ", $conditions);
        }
        if (!in_array($orderBy, ["productId", "productName", "productPrice", ""])) {
          throw new \Exception("Error Processing Request OrderBy has invalid value");
        }
        if ($orderBy != "") {
          $sqlstr .= " ORDER BY " . $orderBy;
          if ($orderDescending) {
            $sqlstr .= " DESC";
          }
        }

        $numeroDeRegistros = self::obtenerUnRegistro($sqlstrCount, $params)["count"];
        $pagesCount = ceil($numeroDeRegistros / $itemsPerPage);
        if ($page > $pagesCount - 1) {
          $page = $pagesCount - 1;
        }
        $sqlstr .= " LIMIT " . $page * $itemsPerPage . ", " . $itemsPerPage;
    
        $registros = self::obtenerRegistros($sqlstr, $params);
        return ["productos" => $registros, "total" => $numeroDeRegistros, "page" => $page, "itemsPerPage" => $itemsPerPage];
    }

    //Metodo para obtener un producto por su identificador
    public static function getProductById(int $productId)
    {
      $sqlstr = "SELECT p.productId, p.productName, p.productDescription, p.productPrice, p.productImgUrl, p.productStatus FROM productos p WHERE p.productId = :productId";
      $params = ["productId" => $productId];
      return self::obtenerUnRegistro($sqlstr, $params);
    }

    //Metodo para insertar un producto
    public static function insertProduct(
        string $productName,
        string $productDescription,
        float $productPrice,
        string $productImgUrl,
        string $productStatus
      ) {
        $sqlstr = "INSERT INTO productos (productName, productDescription, productPrice, productImgUrl, productStatus) VALUES (:productName, :productDescription, :productPrice, :productImgUrl, :productStatus)";
        $params = [
          "productName" => $productName,
          "productDescription" => $productDescription,
          "productPrice" => $productPrice,
          "productImgUrl" => $productImgUrl,
          "productStatus" => $productStatus
        ];
        return self::executeNonQuery($sqlstr, $params);
    }

    //Metodo para actualizar un producto
    public static function updateProduct(
        int $productId,
        string $productName,
        string $productDescription,
        float $productPrice,
        string $productImgUrl,
        string $productStatus
      ) {
        $sqlstr = "UPDATE productos SET productName = :productName, productDescription = :productDescription, productPrice = :productPrice, productImgUrl = :productImgUrl, productStatus = :productStatus WHERE productId = :productId";
        $params = [
          "productId" => $productId,
          "productName" => $productName,
          "productDescription" => $productDescription,
          "productPrice" => $productPrice,
          "productImgUrl" => $productImgUrl,
          "productStatus" => $productStatus
        ];
        return self::executeNonQuery($sqlstr, $params);
    }

    //Metodo para eliminar un producto
    public static function deleteProduct(int $productId)
    {
      $sqlstr = "DELETE FROM productos WHERE productId = :productId";
      $params = ["productId" => $productId];
      return self::executeNonQuery($sqlstr, $params);
    }

    public static function getProductsInRange(int $start, int $limit = 4) {
      $sqlstr = "SELECT p.productId, p.productName, p.productDescription, p.productPrice, p.productImgUrl, p.productStatus, 
                 CASE 
                     WHEN p.productStatus = 'ACT' THEN 'Activo' 
                     WHEN p.productStatus = 'INA' THEN 'Inactivo' 
                     ELSE 'Sin Asignar' 
                 END AS productStatusDsc 
                 FROM productos p LIMIT :start, :limit";
      $params = ["start" => $start, "limit" => $limit];
      $registros = self::obtenerRegistros($sqlstr, $params);
      return $registros;
  }
}
?>