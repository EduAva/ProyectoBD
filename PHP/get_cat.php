<?php
header('Content-Type: application/json');
$pdo = new PDO("pgsql:host=localhost;port=5432;dbname=garritasfelices;", "postgres", "1234");

$accion = $_GET['accion'] ?? '';

if ($accion == 'obtenerTamanos') {
    $stmt = $pdo->prepare("SELECT id_tamano, nom_tamano FROM cat_tamano 
                           WHERE nom_tamano NOT ILIKE 'No aplica' 
                           ORDER BY id_tamano ASC");
    $stmt->execute();
    echo json_encode($stmt->fetchAll(PDO::FETCH_ASSOC));
}

if ($accion == 'obtenerRazas') {
    $id_esp = $_GET['id_especie'];
    $id_tam = $_GET['id_tamano'];

    if ($id_tam === "null" || empty($id_tam)) {
        $stmt = $pdo->prepare("SELECT id_subtipo, nom_subtipo FROM cat_subtipos 
                               WHERE id_especie = :esp AND id_tamano IS NULL");
        $stmt->execute(['esp' => $id_esp]);
    } else {
        $stmt = $pdo->prepare("SELECT id_subtipo, nom_subtipo FROM cat_subtipos 
                               WHERE id_especie = :esp AND id_tamano = :tam");
        $stmt->execute(['esp' => $id_esp, 'tam' => $id_tam]);
    }
    echo json_encode($stmt->fetchAll(PDO::FETCH_ASSOC));
}

if ($accion == 'obtenerVacunas') {
    $id_esp = $_GET['id_especie'];
    $stmt = $pdo->prepare("SELECT id_vacuna, nombre_vacuna, importancia, tipo_vacuna 
                           FROM vacunas 
                           WHERE id_especie = :esp 
                           ORDER BY importancia DESC, nombre_vacuna ASC");
    $stmt->execute(['esp' => $id_esp]);
    echo json_encode($stmt->fetchAll(PDO::FETCH_ASSOC));
}
?>
