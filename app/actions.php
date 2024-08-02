<?php
session_start();

require_once 'includes/_config.php';
require_once 'includes/_functions.php';
require_once 'includes/_database.php';
require_once 'includes/_message.php';
require_once 'includes/_security.php';

// var_dump($_REQUEST);
if (!isset($_REQUEST['action'])) {
    redirectTo();
}


// Check CSRF
preventFromCSRF();


if (!empty($_POST)) {

    if ($_POST['action'] === 'create-ticket') {
        addNewTicket($dbCo);
    }
}


redirectTo();