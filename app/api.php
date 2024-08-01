<?php
session_start();

include 'includes/_config.php';
include 'includes/_functions.php';
include 'includes/_database.php';
include 'includes/_message.php';

header('Content-Type: application/json');

$products = fetchProducts($dbCo);

echo json_encode($products);

// $inputData = json_decode(file_get_contents('php://input'), true);

