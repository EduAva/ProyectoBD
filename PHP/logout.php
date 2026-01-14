<?php
    session_start();
    session_unset();
    session_destroy();
    header('Location: ../HTML/Pagina-Principal.html');
    exit;
?>
