<?php

global $dbCo;

/**
 * Redirect to the given URL or to the previous page if no URL is provided.
 *
 * @param string|null $url URL to redirect to. If null, redirect to the previous page.
 * @return void
 */
function redirectTo(?string $url = null): void
{
    if ($url === null) {
        if (isset($_SERVER['HTTP_REFERER'])) {
            $url = $_SERVER['HTTP_REFERER'];
        } else {
            $url = 'defaultPage.php'; // Fallback URL if HTTP_REFERER is not set
        }
    }
    header('Location: ' . $url);
    exit;
}

function getAllProducts (PDO $dbCo) {

    $query = $dbCo->query("SELECT id_product, stock, product_name, price, id_tax, id_category, image_url
    FROM product");

    $query->execute();

    while ($product = $query->fetch()) {

        echo '<li>
                <img src="img/'.$product["image_url"].'" alt="">
                <h3>'.$product["product_name"].'</h3>
                <p>'.$product["price"].'</p>
                <p>'.$product["stock"].'</p>

            </li>';
    }
}

