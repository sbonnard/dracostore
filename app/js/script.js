import './../scss/style.scss';

// Hamburger Navigation //

const burgerMenu = document.getElementById('hamburger-menu-icon');
const overlay = document.getElementById('menu');

burgerMenu.addEventListener('click', function () {
    this.classList.toggle("close");
    overlay.classList.toggle("overlay");
});

// FETCH PRODUCTS FROM DATABASE

async function fetchProductDatas() {
    try {
        const url = '../api.php';
        const response = await fetch(url);

        if (!response.ok) {
            throw new Error('Network response was not ok');
        }

        const data = await response.json();
        return data.map(product => ({ id: product.id_product, name: product.product_name, price: product.price }));
    } catch (error) {
        console.error('Failed to fetch RPG data:', error);
        return [];
    }
}


// CART //

const cartItems = [];
const productCards = document.querySelectorAll('[data-product-card]');
const cart = document.getElementById('cart');
const template = document.getElementById('cart-itm');

console.log(productCards, cart);

productCards.forEach(card => {
    card.addEventListener('click', function () {
        const productId = card.dataset.productId;
        const productName = card.dataset.productName;
        const productPrice = card.dataset.productPrice;

        // if (cartItems.find(item => item.id === productId)) {
        //     console.log('Item is already in the cart');
        //     return;
        // }

        const item = { id: productId, name: productName, price: productPrice };
        cartItems.push(item);

        const clone = document.importNode(template.content, true);

        const refProduct = clone.querySelector('[data-product-ref]');
        refProduct.value = item.id;

        const nameProduct = clone.querySelector('[data-product-name]');
        nameProduct.innerText = item.name;

        const priceProduct = clone.querySelector('[data-product-price]');
        priceProduct.innerText = item.price;

        cart.appendChild(clone);
    });
});
// addEventListener.productCard('click', function(){
//     const clone = document.importNode(template.content, true)
// })

// sale //

const btnDelete = document.querySelectorAll('[data-product-delete]');
const itemLst = document.querySelectorAll('[data-item]');
// const btn = btnDelete.closest('[data-item]');



btnDelete.forEach(btn => {
    
    console.log(btn);
 
    btn.addEventListener('click', function(e) {
        console.log("hello");
        btn.closest('[data-item]').remove();
    })
});


