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

        console.log(data);

        return data.map(product => ({
            id: product.id_product,
            name: product.product_name,
            price: product.price,
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
const template = document.getElementById('cart-itm');

console.log(productCards, cart);

productCards.forEach(card => {
    card.addEventListener('click', function () {
        
        const productId = card.dataset.productCard;
        const productName = card.dataset.productName;
        const productPrice = card.dataset.productPrice;
        const productImage = card.dataset.productImage;
        
        if (cartItems.find(item => item.id === productId)) {
            console.log('Item is already in the cart');
            return;
        }
        
        const item = { id: productId, name: productName, price: productPrice, image: productImage };
        cartItems.push(item);
        
        console.log(item.id, item.name, item.price);

        const clone = document.importNode(template.content, true);

        const refProduct = clone.querySelector('[data-product-ref]');
        refProduct.value = item.id;

        const nameProduct = clone.querySelector('[data-product-name]');
        nameProduct.innerText = item.name;

        // const priceProduct = clone.querySelector('[data-product-price]');
        // priceProduct.innerText = item.price;

        const imageProduct = clone.querySelector('[data-product-image]');
        imageProduct.srcset = item.image;

        cart.appendChild(clone);

        updateDeleteButtons(); // Mettre à jour les boutons de suppression après l'ajout
    });
});

// Mise à jour des boutons de suppression

function updateDeleteButtons() {
    const btnDelete = document.querySelectorAll('[data-product-delete]');
    const itemLst = document.querySelectorAll('[data-item]');

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
        }
    }
});

// Initialiser les boutons de suppression au chargement
updateDeleteButtons();
