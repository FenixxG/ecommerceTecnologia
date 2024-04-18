<!-- Encabezado -->
<h1>Computadoras De Escritorio</h1>

<!-- Lista de productos -->
<div class="product-list">
    {{foreach pcescritorioPr}}
    <div class="product" data-productId="{{productId}}">
        <img src="{{productImgUrl}}" alt="{{productName}}">
        <h2>{{productName}}</h2>
        <p>{{productDescription}}</p>
        <span class="price">{{productPrice}}</span>
        <button class="add-to-cart">Agregar al Carrito</button>
    </div>
    {{endfor pcescritorioPr}}
</div>