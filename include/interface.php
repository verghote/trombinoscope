<!DOCTYPE HTML>
<html lang="fr">
<head>
    <title>Formation Web</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <?php
    // chargement des composants bootstrap et jquery
    require RACINE . '/composant/bootstrap.html';
    ?>
    <link rel="stylesheet" href="/css/style.css">
    <?php
    // récupération du nom du script php appelé afin de charger le fichier js de même nom
    $file = pathinfo($_SERVER['PHP_SELF'], PATHINFO_FILENAME);
    if (file_exists("$file.js")) {
        echo "<script type='module' src='$file.js' ></script>";
    }
    // chargement des données et composants spécifiques de la page si nécessaire
    if (isset($head)) {
        echo $head;
    }
    ?>
    <script>
        window.addEventListener('load', () => {
            document.querySelectorAll('[data-bs-toggle="popover"]').forEach(element => new bootstrap.Popover(element));
            document.querySelectorAll('[data-bs-toggle="tooltip"]').forEach(element => new bootstrap.Tooltip(element));
            document.getElementById('pied').style.visibility = 'visible';
        });
    </script>
</head>
<body>
<div class="container-fluid d-flex flex-column p-0 h-100">
    <header>
        <?php require __DIR__ . '/header.php' ?>
    </header>
    <main>
        <?php
        // chargement de l'interface de la page
        if (file_exists("$file.html")) {
            require "$file.html";
        }
        ?>
    </main>
    <footer id="pied">
        <?php require __DIR__ . '/footer.php' ?>
    </footer>
</div>
</body>
</html>
