<h1>Carrito de compras</h1>
<style>
    table tbody tr td {
        text-align: center;
    }

    table thead th {
        background-color: black;
    }

    section h3 {
        text-align: center;
    }

    .box {
        width: 50%;
        border-width: 1px;
        border-style: double;
        border-color: black;
        padding: 20px;
        border-radius: 1%;
    }

    section div label {
        margin: 15px;
    }

    section div button {
        background-color: black;
        border-radius: 20px;
        margin: 10px;
    }

    img {
        width: 50px;
    }

    button {
        border: none;
        padding: 10px 15px;
        border-radius: 10px;
        font-size: 16px;
        background-color: rgb(6, 3, 84);
        color: #fff;
        cursor: pointer;
    }
</style>

<section class="WWList">
    <table>
        <thead>
            <tr>
                <th>Artículo</th>
                <th>Descripción</th>
                <th>Precio</th>
                <th>Cant.</th>
                <th>Opciones</th>
            </tr>
        </thead>
        <tbody>
            {{foreach productsInCart}}
            <tr>
                <td>
                    <img src="src al Imagen"
                        class="product-image">
                </td>
                <td>{{productDescription}}</td>
                <td class="precio">{{productPrice}}</td>
                <td>{{cantidad}}</td>
                <td>
                    <a href="#"></a>&nbsp;
                    <form action="index.php?page=Carrito_Carritolist&productId={{productId}}" method="post">
                        <input type="hidden" name="productId" value="{{productId}}">
                        <button type="submit" name="removetoCart">Eliminar</button>
                    </form>
                </td>
            </tr>
            {{endfor productsInCart}}
        </tbody>
    </table>
</section>

<section class="fullCenter">
    
    <section class="box">
        <h3>Resumen del pedido</h3>
    </section>

    <section class="box">
        <div class="row">
            <label id="subtotalLabel" class="col-12">Subtotal: L. {{subtotal}}</label>
            <label id="impuestoLabel" class="col-12">Impuesto (15%): L. {{impuesto}}</label>
            <label id="totalLabel" class="col-12">Total: L. {{total}}</label>
            <a href="index.php?page=Checkout_Checkout"><button class="col-12" type="button">Pagar con PayPal</button></a>
            <a href="index.php?page=HomeController"><button class="col-12">Elegir más productos</button></a>
        </div>
    </section>
</section>


