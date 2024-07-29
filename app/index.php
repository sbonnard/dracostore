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

        <h1>Hello</h1>
        <ul>
            <?= getAllProducts ($dbCo) ?>
        </ul>

    </main>
</body>

</html>