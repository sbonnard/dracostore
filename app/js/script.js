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


