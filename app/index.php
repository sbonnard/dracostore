<?php
session_start();

require_once 'includes/_database.php';
require_once 'includes/_config.php';
require_once 'includes/_functions.php';
require_once 'includes/_message.php';
require_once 'includes/_security.php';
require_once 'includes/components/_htmlTemplates.php';

generateToken();
?>

<!DOCTYPE html>
<html lang="fr">

<head>
    <?= fetchHTMLHead('Dracostore') ?>
</head>

<body>


    <main>
        <div class="container">
            <input type="text" class="border-searchbar search-title" placeholder="Rechercher.."></input>

            <button class="button button--filter" name="pets" id="pet-select">Filtres
                <img src="./img/bow-down.svg" alt="">
            </button>
            <!-- <option value="">Filtres</option>
                <option value="magique">Magique</option>
                <option value="potion">Potion</option>
                <option value="arme">Arme</option>
                <option value="armure">Armure</option>
                <option value="bouclier">Bouclier</option>
                <option value="ingrédient">Ingrédient</option>
                <option value="déco">Déco</option>
                <option value="services">Services</option>
                <option value="artefact">Artefact</option>
                <option value="familier">Familier</option>
                <option value="vêtement">Vêtement</option>
                <option value="nourriture">Nourriture</option> -->

            <section>
                <div>
                    <?= getSuccessMessage($messages) ?>
                    <?= getErrorMessage($errors) ?>
                </div>
                <ul class="product__container">
                    <?= getAllProducts($dbCo) ?>
                </ul>
            </section>




        </div>

        <section class="cart hidden" id="see-cart">
            <form class="cart__stuff" action="actions.php" method="post">
                <div class="cart__container">
                    <h3 class="title">Panier</h3>
                    <div class="separator"></div>
                    <ul class="cart" id="cart">
                        <p class="cart__empty" id="cart-empty"></p>
                    </ul>
                </div>
                <div class="receipt_content">
                    <div class="receipt_sum">
                        <p class="receipt_sum flex-row">Sous total</p>
                        <div class="flex-row receipt_sum">
                            <div id="total-price">0</div>
                            <img src="./img/coin.svg" alt="pièce d'or">
                        </div>
                        <p class="receipt_sum">Sous total</p>
                    </div>
                    <div class="receipt_separator"></div>
                    <div class="receipt_sum_tax">
                        <p class="text--tax">Total taxe 13% incluse</p>
                        <p class="text--tax" id="total-taxed">0</p>
                        <img src="./img/coin.svg" alt="pièce d'or">
                    </div>
                    <div class="validation-content">
                        <input type="hidden" name="token" value="<?= $_SESSION['token'] ?>">
                        <input type="hidden" name="action" value="create-ticket">
                        <div id="products-container"></div>
                        <input type="submit" class="button--valid-sale" value="VALIDER ENCAISSEMENT">
                    </div>
                </div>
            </form>
        </section>
    </main>

    <div class="cart__button__container">
        <img class="cart__icon" src="./img/chest.svg" alt="icone panier">
        <button id="cart-button-display" class="button cart__button">Accéder au panier</button>
    </div>


    <header class="header">
        <section class="main-nav">
            <div class="hamburger">
                <a href="#menu" id="hamburger-menu-icon">
                    <img src="img/hamburger.svg" alt="Menu Hamburger">
                </a>
            </div>
            <img src="img/dracostore-logo-text.webp" alt="Logo du Dracostore">
            <button class="button--hood"></button>
            <nav class="nav hamburger__menu" id="menu" aria-label="Navigation principale du site">
                <ul>
                    <div class="nav__container">
                        <li class="nav__item">
                            <a class="nav__link" href="index.php" aria-current="page">Encaissement</a>
                        </li>
                        <li class="nav__item">
                            <a class="nav__link" href="index.php" aria-current="page">Livraison</a>
                        </li>
                        <li class="nav__item">
                            <a class="nav__link" href="index.php" aria-current="page">Base client</a>
                        </li>
                    </div>
                </ul>
            </nav>
        </section>
    </header>

    <template id="cart-itm">
        <div class="cart__item-container">
            <li class="cart__itm" data-item="">
                <img class="cart__image" data-product-image="" src="" alt="">
                <div class="flex-column">
                    <h2 class="cart__product-name" data-product-name="">Produit</h2>
                    <div class="cart__small-container">
                        <input class="input--number js-input-number" type="number" name="quantity[]" class="quantity" value="1">
                        <input type="hidden" name="id_product[]" data-product-ref="" value="id_product">
                        <div class="flex-row">
                            <p class="product__price cart__product-price" data-product-price=""></p>
                            <img src="./img/coin.svg" alt="pièce d\'or">
                        </div>
                        <button class="cart__delete-button" type="button" data-product-delete=""></button>
                    </div>
                </div>
            </li>
            <div class="separator"></div>
        </div>
    </template>


    <script type="module" src="js/script.js"></script>
</body>

</html>