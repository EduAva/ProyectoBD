<?php
session_start();

// 1. CAMBIO IMPORTANTE: Lectura de Variables de Entorno
// En la nube, no escribimos los datos fijos. El servidor nos los da.
$host = getenv('PGHOST');
$dbname = getenv('PGDATABASE');
$user = getenv('PGUSER');
$pass = getenv('PGPASSWORD');
$port = getenv('PGPORT');

header('Content-Type: application/json');

try {
    // Usamos las variables que obtuvimos arriba
    $dsn = "pgsql:host=$host;port=$port;dbname=$dbname;sslmode=require";
    $pdo = new PDO($dsn, $user, $pass);
    // Configuración para que PDO lance errores reales si algo falla
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    
    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        $email = $_POST['email'];
        $passw = $_POST['password'];

        // 2. CAMBIO DE SEGURIDAD: Sentencias Preparadas
        // Nunca pongas variables '$email' directo en el string SQL.
        // Usamos un marcador de posición (:email)
        $sql = "SELECT * FROM usuarios WHERE email_usu = :email";
        
        $stmt = $pdo->prepare($sql);
        // Aquí pasamos el valor real de forma segura
        $stmt->execute([':email' => $email]);
        
        // Obtenemos el resultado
        $usuario = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($usuario) {
            // Verificamos la contraseña
            // NOTA: Para producción real, deberías usar password_verify() y hashes, 
            // pero por ahora mantengo tu lógica de texto plano para que funcione con tus datos actuales.
            if ($usuario['passw_usu'] === $passw) {
                $_SESSION['email_usu'] = $email;
                echo json_encode(['success' => true]);
            } else {
                echo json_encode(['success' => false, 'message' => 'Contraseña incorrecta.']);
            }
        } else {
            echo json_encode(['success' => false, 'message' => 'El correo no está registrado.']);
        }
    }
} catch (PDOException $e) {
    // Es buena práctica guardar el error real en el log del servidor, no enviarlo al usuario
    error_log("Error de conexión: " . $e->getMessage());
    echo json_encode(['success' => false, 'message' => 'Error de conexión con el sistema.']);
}
?>
