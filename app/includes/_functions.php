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
function getAllProducts(PDO $dbCo)
{

    $query = $dbCo->query("SELECT id_product, stock, product_name, price, id_tax, id_category, image_url
    FROM product");

    $query->execute();

    while ($product = $query->fetch()) {

        echo '
        <li class="product__card">
            <button class="product__btn" data-product-card="' . $product["id_product"] . '" data-product-name="' . $product["product_name"] . '" data-product-price="' . $product["price"] . '" data-product-image="' . $product["image_url"] . '">
            <img class="product__card-img" src="' . $product["image_url"] . '" alt="">
                <div class="product__card-infos">
                    <h3 class= "product__card-title">' . $product["product_name"] . '</h3>
                    <div class="product__infosPrice">
                        <div            class="product__price-content">                      
                            <p class="product__price">' . $product["price"] . '</p><img src="./img/coin.svg" alt="pièce d\'or">
                        </div>
                            <p>stock : ' . $product["stock"] . ' </p>
                    </div>
                </div>
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
function sumSale(PDO $dbCo)
{

    $query = $dbCo->query("SELECT SUM(price*quantity) as total_price, id_ticket, COUNT(id_ticket) AS total_tickets

    FROM product
        JOIN sales USING (id_product)
        JOIN ticket USING (id_ticket)
    WHERE id_ticket = 238
    GROUP by id_ticket;");


    $infoTotal = $query->execute();

    return
        '<span>' . $infoTotal . '<span>';
}

function getSumReceipt(PDO $dbCo)
{
    $query = $dbCo->query(
        'SELECT SUM(price*quantity) AS no_tax_price, SUM(price * quantity * 1.13) AS tax_price, id_ticket
        FROM product
            JOIN sales USING (id_product)
            JOIN ticket USING (id_ticket)
        WHERE id_ticket = 238
        GROUP BY id_ticket;'
    );
}


//////////////////////////////// TICKETS CREATION /////////////////////////////////////


/**
 * Adds a new ticket to the database with products info and quantity.
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

            $queryTicket = $dbCo->prepare('INSERT INTO ticket (ticket_date) VALUES (CURDATE());');
            $queryTicket->execute();
            $ticketId = $dbCo->lastInsertId();

            $querySale = $dbCo->prepare(
                'INSERT INTO sales (id_product, id_ticket, quantity)
                VALUES (:idProduct, :idTicket, :quantity)'
            );


            foreach ($_REQUEST['id_product'] as $key => $idProduct) {

                if (!is_numeric($idProduct) || !isset($_REQUEST['quantity'][$key]) || !isset($_REQUEST['id_product'][$key]) || !is_numeric($_REQUEST['quantity'][$key]) || !is_numeric($_REQUEST['id_product'][$key])) {
                    addError('invalid_product_data');
                    $dbCo->rollBack();
                    return false;
                }

                $bindValues = [
                    'idProduct' => intval($idProduct),
                    'idTicket' => intval($ticketId),
                    'quantity' => intval($_REQUEST['quantity'][$key])
                ];

                $isSaleInsertOk = $querySale->execute($bindValues);

                if (!$isSaleInsertOk) {
                    addError('sale_ko');
                    $dbCo->rollBack();
                    return false;
                }
            }

            addMessage('sale_ok');
            $dbCo->commit();
            return true;
        } catch (Exception $error) {
            var_dump('PDO exception: ' . $error->getMessage());
            $_SESSION['errors'] = "sale_fail: " . $error->getMessage();
            $dbCo->rollBack();
            return false;
        }
    }

    return false;
}


/**
 * Checks input errors fot a new ticket.
 *
 * @return void
 */
function checkSaleErrors()
{
    if (!isset($_POST['id_product']) || !is_array($_POST['id_product'])) {
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

/**
 * Fetch all products datas from database
 *
 * @param PDO $dbCo - The connection to database.
 * @return void
 */
function fetchProducts(PDO $dbCo)
{
    $query = $dbCo->prepare("SELECT *
    FROM product;");

    $datas = $query->fetchAll(PDO::FETCH_ASSOC);

    return $datas;
}
