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

        echo '
        <li>
            <button data-product-card="">
                <img class="product__img" src="img/' . $product["image_url"] . '" alt="">
                <h3>' . $product["product_name"] . '</h3>
                <p>' . $product["price"] . '</p>
                <p>' . $product["stock"] . '</p>
            </button>
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

// function addProduct(PDO $dbCo) {
//     $query = $dbCo->prepare('
//     UPDATE product
//     SET product_name = :name, price = :price, image_url = :url;');

//     $bindValues = [
//         'name' => 
//     ]
// }


//////////////////////////////// TICKETS CREATION /////////////////////////////////////


/**
 * Adds a new ticket to database with products infos and quantity.
 *
 * @param PDO $dbCo - Connection to database.
 * @return bool - isInsertOk true or false.
 */
function addNewTicket(PDO $dbCo): bool
{
    $errorsList = [];

    checkSaleErrors();

    if (empty($errorsList)) {
        try {
            $dbCo->beginTransaction();

            $queryTicket = $dbCo->prepare(
                'INSERT INTO ticket (ticket_date) VALUES (CURDATE())'
            );
            $queryTicket->execute();
            $ticketId = $dbCo->lastInsertId();

            $querySale = $dbCo->prepare(
                'INSERT INTO sale (id_product, id_ticket, quantity)
                VALUES (:idProduct, :idTicket, :quantity)'
            );

            $bindValues = [
                'idProduct' => intval($_REQUEST['id_product']),
                'idTicket' => intval($ticketId),
                'quantity' => intval($_REQUEST['quantity'])
            ];

            $isInsertOk = $querySale->execute($bindValues);

            if ($isInsertOk) {
                addMessage('sale_ok');
            } else {
                addError('sale_ko');
            }

            $dbCo->commit();

            return $isInsertOk;
        } catch (Exception $error) {
            $_SESSION['errors'] = "sale_fail: " . $error->getMessage();
            $dbCo->rollBack();
            return false;
        }
    }
}


/**
 * Checks input errors fot a new ticket.
 *
 * @return void
 */
function checkSaleErrors()
{
    if (!isset($_POST['id_product']) || !intval($_POST['id_product'])) {
        $errorsList[] = 'product ko';
        addError('id_product_ko');
    }

    if (!isset($_POST['quantity']) || !intval($_POST['quantity']) || $_POST['quantity'] <= 0) {
        $errorsList[] = 'quantity ko';
        addError('quantity_ko');
    }

    if (!isset($_POST['id_ticket']) || !intval($_POST['id_ticket'])) {
        $errorsList[] = 'ticket ko';
        addError('id_ticket_ko');
    }
}

function fetchProducts(PDO $dbCo) {
    $query = $dbCo->query("SELECT *
    FROM product;");

    $products = $query->execute();

    $datas = $query->fetchAll(PDO::FETCH_ASSOC);

    return $datas;
}