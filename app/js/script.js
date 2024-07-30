import './../scss/style.scss';

// Hamburger Navigation //

const burgerMenu = document.getElementById('hamburger-menu-icon');

const overlay = document.getElementById('menu');

burgerMenu.addEventListener('click', function () {
    this.classList.toggle("close");
    overlay.classList.toggle("overlay");
});


// CART //

const productCard = document.querySelectorAll('[data-product-card]');
const cart = document.getElementById('cart');

console.log(productCard, cart);

addEventListener.productCard('click', function(){
    const clone = document.importNode(template.content, true)
})