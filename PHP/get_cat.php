<?php
// Aseguramos que la respuesta siempre sea JSON
header('Content-Type: application/json');

// --- 1. CONEXIÓN A NEON (Render) ---
$host = getenv('PGHOST');
$dbname = getenv('PGDATABASE');
$user = getenv('PGUSER');
$pass = getenv('PGPASSWORD');
$port = getenv('PGPORT');

try {
    $dsn = "pgsql:host=$host;port=$port;dbname=$dbname;sslmode=require";
    $pdo = new PDO($dsn, $user, $pass);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // --- 2. LÓGICA DE LA API ---
    
    $accion = $_GET['accion'] ?? '';

    // A) Obtener Tamaños
    if ($accion == 'obtenerTamanos') {
        $stmt = $pdo->prepare("SELECT id_tamano, nom_tamano FROM cat_tamano 
                               WHERE nom_tamano NOT ILIKE 'No aplica' 
                               ORDER BY id_tamano ASC");
        $stmt->execute();
        echo json_encode($stmt->fetchAll(PDO::FETCH_ASSOC));
    }

    // B) Obtener Razas (Subtipos)
    if ($accion == 'obtenerRazas') {
        $id_esp = $_GET['id_especie'];
        $id_tam = $_GET['id_tamano'] ?? null; // Usamos null coalescing por seguridad

        // A veces JS envía la palabra "null" como texto, validamos ambos casos
        if (empty($id_tam) || $id_tam === "null") {
            // Caso: No tiene tamaño (ej. Gatos o Hurones)
            $stmt = $pdo->prepare("SELECT id_subtipo, nom_subtipo FROM cat_subtipos 
                                   WHERE id_especie = :esp AND id_tamano IS NULL");
            $stmt->execute([':esp' => $id_esp]);
        } else {
            // Caso: Tiene tamaño (Perros)
            $stmt = $pdo->prepare("SELECT id_subtipo, nom_subtipo FROM cat_subtipos 
                                   WHERE id_especie = :esp AND id_tamano = :tam");
            $stmt->execute([':esp' => $id_esp, ':tam' => $id_tam]);
        }
        echo json_encode($stmt->fetchAll(PDO::FETCH_ASSOC));
    }

    // C) Obtener Vacunas
    if ($accion == 'obtenerVacunas') {
        $id_esp = $_GET['id_especie'];
        $stmt = $pdo->prepare("SELECT id_vacuna, nombre_vacuna, importancia, tipo_vacuna 
                               FROM vacunas 
                               WHERE id_especie = :esp 
                               ORDER BY importancia DESC, nombre_vacuna ASC");
        $stmt->execute([':esp' => $id_esp]);
        echo json_encode($stmt->fetchAll(PDO::FETCH_ASSOC));
    }

} catch (PDOException $e) {
    // Si falla la conexión, devolvemos un JSON de error para que JS no se rompa
    echo json_encode(['error' => 'Error de conexión: ' . $e->getMessage()]);
}
?>
