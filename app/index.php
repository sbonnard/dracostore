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

            <section>
                <ul class="product__container">
                    <?= getAllProducts($dbCo) ?>
                </ul>
            </section>



            <!-- <select class="button--filter" name="pets" id="pet-select">
                <option value="">Filtres</option>
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
                <option value="nourriture">Nourriture</option>
            </select> -->
        </div>

        <div class="cart__container">
            <section class="cart hidden" id="cart">
                <input type="text" class="border-searchbar search-title" placeholder="Rechercher.."></input>


                <form action="actions.php" method="post">
                    <h3 class="title">Panier</h3>
                    <div class="separator"></div>
                    <ul class="cart"></ul>
                    <input type="hidden" name="token" value="<?= $_SESSION['token'] ?>">
                    <input type="hidden" name="action" value="create-ticket">
                    <section class="receipt">
                        <div class="receipt_content">
                            <div class="receipt_sum">
                                <p class="receipt_sum flex-row">Sous total</p>
                                <div class="flex-row receipt_sum">
                                    <div id="total-price">Total: 0</div>
                                    <img src="./img/coin.svg" alt="pièce d\'or">
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
                                <input type="submit" name="action" value="" class="button--valid-sale">Valider encaissement</input>
                            </div>
                        </div>
                    </section>

                </form>
            </section>
        </div>



    </main>

    <button id="cart-button-display" class="cart__button">ACCÉDER AU PANIER</button>

    <header class="header">
        <div class="hamburger">
            <a href="#menu" id="hamburger-menu-icon">
                <img src="img/hamburger.svg" alt="Menu Hamburger">
            </a>
        </div>
        <nav id="menu" class="nav hamburger__menu" aria-label="Navigation principale du site">
            <ul id="nav-list">
                <li>
                    <a href="index.php" aria-current="page">Accueil</a>
                </li>
            </ul>
        </nav>
        </div>
        <img src="img/dracostore-logo-text.webp" alt="Logo du Dracostore">
        <button class="button--hood"></button>
    </header>

    <template id="cart-itm">
        <div class="cart__item-container">
            <li class="cart__itm" data-item="">
                <img class="cart__image" data-product-image="" src="" alt="">
                <div class="flex-column">
                    <h2 class="cart__product-name" data-product-name="">Produit</h2>
                    <div class="cart__small-container">
                        <input class="input--number" type="number" name="quantity" class="quantity" value="1">
                        <input type="hidden" name="" data-product-ref="" value="id_product">
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