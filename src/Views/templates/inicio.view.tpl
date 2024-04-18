<h1>Ofertas del Día</h1>
<div class="product-list">
    {{foreach productsOnSale}}
    <div class="product" data-productId="{{productId}}">
        <form action="index.php?page=Carrito_Carritolist" method="post">
            <input type="hidden" name="productId" value="{{productId}}">
            <button type="submit" name="addToCart" class="add-to-cart">Agregar al Carrito</button>
        </form>

        <img src="{{productImgUrl}}" alt="{{productName}}">
        <h2>{{productName}}</h2>
        <p>{{productDescription}}</p>
        <span class="price">{{productPrice}}</span>
    </div>
    {{endfor productsOnSale}}
</div>
<h1>Destacados</h1>
<div class="product-list">
    {{foreach productsHighlighted}}
    <div class="product" data-productId="{{productId}}">
        <form action="index.php?page=Carrito_Carritolist" method="post">
            <input type="hidden" name="productId" value="{{productId}}">
            <button type="submit" name="addToCart" class="add-to-cart">Agregar al Carrito</button>
        </form>

        <img src="{{productImgUrl}}" alt="{{productName}}">
        <h2>{{productName}}</h2>
        <p>{{productDescription}}</p>
        <span class="price">{{productPrice}}</span>
    </div>
    {{endfor productsHighlighted}}
</div>
<h1>Novedades</h1>
<div class="product-list">
    {{foreach productsNew}}
    <div class="product" data-productId="{{productId}}">
        <form action="index.php?page=Carrito_Carritolist" method="post">
            <input type="hidden" name="productId" value="{{productId}}">
            <button type="submit" name="addToCart" class="add-to-cart">Agregar al Carrito</button>
        </form>
        
        <img src="{{productImgUrl}}" alt="{{productName}}">
        <h2>{{productName}}</h2>
        <p>{{productDescription}}</p>
        <span class="price">{{productPrice}}</span>
    </div>
    {{endfor productsNew}}
</div>
