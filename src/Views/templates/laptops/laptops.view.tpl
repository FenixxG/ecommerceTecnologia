<h1>Laptops</h1>

<div class="product-list">
    {{foreach laptopsPr}}
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
    {{endfor laptopsPr}}
</div>