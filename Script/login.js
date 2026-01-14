<?php
session_start();
header('Content-Type: application/json'); // ¡Vital para que JS entienda!

// Conexión a Neon
$host = getenv('PGHOST');
$dbname = getenv('PGDATABASE');
$user = getenv('PGUSER');
$pass = getenv('PGPASSWORD');
$port = getenv('PGPORT');

try {
    $dsn = "pgsql:host=$host;port=$port;dbname=$dbname;sslmode=require";
    $pdo = new PDO($dsn, $user, $pass);
    
    // Recibir datos
    $email = $_POST['email']; 
    $password = $_POST['password'];

    // Buscar usuario
    $stmt = $pdo->prepare("SELECT id_usuario, passw_usu FROM usuarios WHERE email_usu = :email");
    $stmt->execute([':email' => $email]);
    $usuario = $stmt->fetch(PDO::FETCH_ASSOC);

    if ($usuario && $usuario['passw_usu'] === $password) { // Nota: Idealmente usar password_verify() si usaras hash
        $_SESSION['email_usu'] = $email;
        // RESPONDER ÉXITO EN JSON (El JS se encarga de redirigir)
        echo json_encode(['success' => true]);
    } else {
        // RESPONDER ERROR EN JSON
        echo json_encode(['success' => false, 'message' => 'Correo o contraseña incorrectos']);
    }

} catch (PDOException $e) {
    echo json_encode(['success' => false, 'message' => 'Error de conexión']);
}
?>
