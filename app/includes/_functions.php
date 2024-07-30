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


/**
 * Get the list of all products
 *
 * @param PDO $dbCo data base
 * @return void
 */
function getAllProducts (PDO $dbCo) {

    $query = $dbCo->query("SELECT id_product, stock, product_name, price, id_tax, id_category, image_url
    FROM product");

    $query->execute();

    while ($product = $query->fetch()) {

        echo '<li>
                <img src="img/'.$product["image_url"].'" alt="">
                <h3>'.$product["product_name"].'</h3>
                <p>prix : '.$product["price"].'</p>
                <p>en stock : '.$product["stock"].'</p>

            </li>';
    }
}


/**
 * Calculed sum of products of sale
 *
 * @param PDO $dbCo
 * @return void
 */
function sumSale (PDO $dbCo, $idTicket) {

    $query = $dbCo->query("SELECT SUM(price*quantity) as total_price, id_ticket
FROM product
   JOIN sales USING (id_product)
   JOIN ticket USING (id_ticket)
WHERE id_ticket = $idTicket
GROUP by id_ticket;");

$infoTotal =  $query->fetch();

return 
    '<p>' .$infoTotal["id_ticket"]. '</p>
    <p>' .$infoTotal["total_price"]. '</p>';

}

