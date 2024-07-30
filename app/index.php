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

    <header>
        <div class="hamburger">
            <a href="#menu" id="hamburger-menu-icon">
                <img src="img/hamburger.svg" alt="Menu Hamburger">
            </a>
        </div>
        <nav class="nav hamburger__menu" id="menu" aria-label="Navigation principale du site">
            <ul id="nav-list">
                <li>
                    <a href="index.php" aria-current="page">Accueil</a>
                </li>
            </ul>
        </nav>
        </div>
    </header>

    <main>

        <h1>Hello</h1>
        <ul>
            <?= getAllProducts($dbCo) ?>
        </ul>

        <form action="actions.php" method="post">
            <ul id="cart"></ul>
            <input type="submit" value="Valider encaissement">
            <input type="hidden" name="token" value="<?= $_SESSION['token'] ?>">
            <input type="hidden" name="action" value="new-ticket">
        </form>

    </main>

    <template id="cart-itm">
        <li>
            <h2 data-product-name="">Produit</h2>
            <p data-product-price="">1.1</p>
            <button>X</button>
            <input type="number" name="quantity" id="quantity" value="1">
            <input type="hidden" name="" value="id_product">
        </li>
    </template>

    <script type="module" src="js/script.js"></script>
</body>

</html>