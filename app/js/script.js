import './../scss/style.scss';

// Hamburger Navigation //

const burgerMenu = document.getElementById('hamburger-menu-icon');
const overlay = document.getElementById('menu');

burgerMenu.addEventListener('click', function () {
    this.classList.toggle("close");
    overlay.classList.toggle("overlay");
});

// FETCH PRODUCTS FROM DATABASE

async function fetchProductDatas(params) {
    try {
        const url = '../api.php?' + params;
        const response = await fetch(url);

        if (!response.ok) {
            throw new Error('Network response was not ok');
        }

        const data = await response.json();

        return data.map(product => ({
            id: product.id_product,
            name: product.product_name,
            price: parseFloat(product.price),
            stock: product.stock,
            image_url: product.image_url
        }));
    } catch (error) {
        console.error('Failed to fetch product data:', error);
        return [];
    }
}

// CART //

const cartItems = [];
const productCards = document.querySelectorAll('[data-product-card]');
const cart = document.getElementById('cart');
const emptyCart = document.getElementById('cart-empty');
const template = document.getElementById('cart-itm');
const totalPriceElement = document.getElementById('total-price');
const allCart = document.getElementById('see-cart');

function updateEmptyCartMessage() {
    if (cartItems.length > 0) {
        emptyCart.innerHTML = '';
        emptyCart.classList.add('cart__empty--closed')
    } else {
        emptyCart.innerHTML = 'Le panier est vide Alaric !';
    }
}

productCards.forEach(card => {
    card.addEventListener('click', function (e) {
        const productId = card.dataset.productCard;
        const productName = card.dataset.productName;
        const productPrice = parseFloat(card.dataset.productPrice);
        const productImage = card.dataset.productImage;

        
        if (cartItems.find(item => item.id === productId)) {
            console.log('Item is already in the cart');
            return;
        }

        const item = { id: productId, name: productName, price: productPrice, image: productImage, quantity: 1 };
        cartItems.push(item);

        const clone = document.importNode(template.content, true);

        const refProduct = clone.querySelector('[data-product-ref]');
        refProduct.value = item.id;

        const nameProduct = clone.querySelector('[data-product-name]');
        nameProduct.innerText = item.name;

        const imageProduct = clone.querySelector('[data-product-image]');
        imageProduct.srcset = item.image;

        const quantityInput = clone.querySelector('.input--number');

        quantityInput.addEventListener('input', function () {
            item.quantity = parseInt(this.value, 10);
            updateTotalPrice(); // Update total price when quantity changes
        });

        if (e && cartItems.find(item => item.id === productId)) {
            item.quantity + 1;
        }

        cart.appendChild(clone);

        updateDeleteButtons();
        updateTotalPrice(); // Update total price
        updateEmptyCartMessage(); // Update empty cart message
    });
});

function updateDeleteButtons() {
    const btnDelete = document.querySelectorAll('[data-product-delete]');
    btnDelete.forEach(btn => {
        btn.addEventListener('click', function (e) {
            const itemContainer = btn.closest('.cart__item-container');
            if (itemContainer) {
                const productId = itemContainer.querySelector('[data-product-ref]').value;
                const index = cartItems.findIndex(i => i.id === productId);
                if (index !== -1) {
                    cartItems.splice(index, 1);
                }
                itemContainer.remove();
                updateTotalPrice(); // Update total price after removal
                updateEmptyCartMessage();
            }
        });
    });
}

cart.addEventListener('click', function (event) {
    if (event.target.matches('[data-product-delete]')) {
        const itemContainer = event.target.closest('.cart__item-container');
        if (itemContainer) {
            const productId = itemContainer.querySelector('[data-product-ref]').value;
            const index = cartItems.findIndex(i => i.id === productId);
            if (index !== -1) {
                cartItems.splice(index, 1);
            }
            itemContainer.remove();
            updateTotalPrice(); // Update total price after removal
        }
    }
});

// Function to calculate and update the total price
function updateTotalPrice() {
    const totalTaxed = document.getElementById('total-taxed');
    const totalPriceWithoutTax = cartItems.reduce((sum, item) => sum + (item.price * item.quantity), 0);
    const totalPriceWithTax = totalPriceWithoutTax * 1.13; // Calculating total price with 13% tax

    // Displaying both prices
    totalPriceElement.innerText = `${totalPriceWithoutTax.toFixed(1)}`;
    totalTaxed.innerText = `${totalPriceWithTax.toFixed(1)}`;
}

updateDeleteButtons();
updateEmptyCartMessage();

const displayCartBtn = document.getElementById('cart-button-display');
let isCartOpen = false;

displayCartBtn.addEventListener('click', function () {
    allCart.classList.toggle('hidden');
    isCartOpen = !isCartOpen;
    if (isCartOpen) {
        displayCartBtn.innerHTML = 'FERMER LE PANIER';
    } else {
        displayCartBtn.innerHTML = 'ACCÉDER AU PANIER';
    }
})

console.log(cartItems);
