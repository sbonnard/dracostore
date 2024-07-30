<?php
session_start();

include 'includes/_config.php';
include 'includes/_functions.php';
include 'includes/_database.php';
include 'includes/_message.php';

$product = fetchProducts($dbCo);
var_dump($product);
header('Content-type:application/json');



$inputData = json_decode(file_get_contents('php://input'), true);

if (!isset($inputData['action'])) {
    addError('no_action');
}

// Check CSRF
preventFromCSRFAPI($inputData);
