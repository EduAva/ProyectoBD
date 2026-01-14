<?php
// Iniciar sesión para poder guardar variables de usuario si el login es exitoso
session_start();

// 1. OBTENER CREDENCIALES DESDE RENDER
// Estas variables deben coincidir con las que pusiste en "Environment Variables"
$host = getenv('PGHOST');
$dbname = getenv('PGDATABASE');
$user = getenv('PGUSER');
$pass = getenv('PGPASSWORD');
$port = getenv('PGPORT');

// Definir que la respuesta será siempre en formato JSON
header('Content-Type: application/json');
// Permitir que cualquier origen se conecte (útil si tienes el frontend separado, opcional)
header("Access-Control-Allow-Origin: *");

try {
    // 2. CADENA DE CONEXIÓN CORREGIDA PARA NEON
    // Se agregó ";sslmode=require" al final. Sin esto, Neon rechaza la conexión.
    $dsn = "pgsql:host=$host;port=$port;dbname=$dbname;sslmode=require";
    
    // Crear la conexión PDO
    $pdo = new PDO($dsn, $user, $pass);
    // Configurar PDO para que lance errores reales si algo falla
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    
    // Verificar si la petición es POST (al enviar el formulario)
    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        
        // Recibir datos. Usamos el operador null coalescing (??) para evitar errores si vienen vacíos
        $email = $_POST['email'] ?? '';
        $passw = $_POST['password'] ?? '';

        // 3. CONSULTA SEGURA (Evita inyección SQL)
        $sql = "SELECT * FROM usuarios WHERE email_usu = :email";
        
        $stmt = $pdo->prepare($sql);
        $stmt->execute([':email' => $email]);
        
        // Obtener el usuario
        $usuario = $stmt->fetch(PDO::FETCH_ASSOC);

        if ($usuario) {
            // Verificar contraseña (comparación directa según tu lógica actual)
            if ($usuario['passw_usu'] === $passw) {
                $_SESSION['email_usu'] = $email;
                echo json_encode(['success' => true, 'message' => 'Login exitoso']);
            } else {
                echo json_encode(['success' => false, 'message' => 'Contraseña incorrecta.']);
            }
        } else {
            echo json_encode(['success' => false, 'message' => 'El correo no está registrado.']);
        }
    } else {
        // Si alguien entra directo al link sin enviar datos POST
        echo json_encode(['success' => false, 'message' => 'Método no permitido. Usa POST.']);
    }

} catch (PDOException $e) {
    // 4. MODO DEBUG ACTIVADO
    // Esto te mostrará el error exacto en la pantalla negra
    echo json_encode([
        'success' => false, 
        'message' => 'Error CRÍTICO de Base de Datos: ' . $e->getMessage()
    ]);
}
?>
