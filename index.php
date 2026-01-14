<?php
session_start();

// --- ZONA DE REDIRECCIÓN (LO QUE TÚ QUIERES) ---

// Si el usuario entra a la raíz "/" o a "/index.php" sin enviar datos...
if ($_SERVER['REQUEST_METHOD'] === 'GET') {
    // ... lo mandamos directo a tu Página Principal.
    // OJO: Asegúrate de que en GitHub la carpeta se llame "HTML" (mayúsculas)
    // y el archivo "Pagina-Principal.html".
    header("Location: HTML/Pagina-Principal.html");
    exit();
}

// --- ZONA DE LOGIN (API PARA CUANDO ENVÍAS EL FORMULARIO) ---
// Esto se ejecuta solo cuando el formulario envía los datos con POST

$host = getenv('PGHOST');
$dbname = getenv('PGDATABASE');
$user = getenv('PGUSER');
$pass = getenv('PGPASSWORD');
$port = getenv('PGPORT');

header('Content-Type: application/json');

try {
    $dsn = "pgsql:host=$host;port=$port;dbname=$dbname;sslmode=require";
    $pdo = new PDO($dsn, $user, $pass);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    
    $email = $_POST['email'] ?? '';
    $passw = $_POST['password'] ?? '';

    // Consulta segura
    $sql = "SELECT * FROM usuarios WHERE email_usu = :email";
    $stmt = $pdo->prepare($sql);
    $stmt->execute([':email' => $email]);
    $usuario = $stmt->fetch(PDO::FETCH_ASSOC);

    if ($usuario && $usuario['passw_usu'] === $passw) {
        $_SESSION['email_usu'] = $email;
        echo json_encode(['success' => true]);
    } else {
        echo json_encode(['success' => false, 'message' => 'Credenciales incorrectas']);
    }

} catch (PDOException $e) {
    echo json_encode(['success' => false, 'message' => 'Error BD: ' . $e->getMessage()]);
}
?>
