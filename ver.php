<?php
echo "<h1>Explorador de Archivos</h1>";
echo "<pre>";
// Este comando le pide al sistema Linux que liste TODOS los archivos y carpetas
system("ls -R");
echo "</pre>";
?>
