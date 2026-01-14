<?php
session_start();

// 1. Verificar si el usuario inició sesión
if (!isset($_SESSION['email_usu'])) {
    header("Location: ../HTML/Login.html");
    exit();
}

// 2. CONEXIÓN A NEON (Render)
$host = getenv('PGHOST');
$dbname = getenv('PGDATABASE');
$user = getenv('PGUSER');
$pass = getenv('PGPASSWORD');
$port = getenv('PGPORT');

try {
    $dsn = "pgsql:host=$host;port=$port;dbname=$dbname;sslmode=require";
    $pdo = new PDO($dsn, $user, $pass);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // 3. Obtener el ID del usuario logueado
    $stmtUser = $pdo->prepare("SELECT id_usuario FROM usuarios WHERE email_usu = :email");
    $stmtUser->execute([':email' => $_SESSION['email_usu']]);
    $usuario = $stmtUser->fetch(PDO::FETCH_ASSOC);

    // Verificamos que el usuario exista (por si acaso se borró de la BD pero sigue la sesión abierta)
    if (!$usuario) {
        // Cerramos sesión y mandamos al login
        session_destroy();
        header("Location: ../HTML/Login.html");
        exit();
    }
    
    $id_usuario = $usuario['id_usuario'];

    // 4. Recibir datos del formulario
    $fecha_entrada = $_POST['fecha_entrada'];
    $fecha_salida = $_POST['fecha_salida'];
    $habitacion = $_POST['habitacion'];
    $notas = $_POST['notas'] ?? ''; // Usamos '' si no escribieron notas para evitar error

    // 5. Guardar la reserva
    $sql = "INSERT INTO reservaciones (id_usuario_fk, fecha_entrada, fecha_salida, tipo_habitacion, notas_especiales, estado_reservacion) 
            VALUES (:id_usuario, :entrada, :salida, :habitacion, :notas, 'Pendiente')";
    
    $stmt = $pdo->prepare($sql);
    $stmt->execute([
        ':id_usuario' => $id_usuario,
        ':entrada' => $fecha_entrada,
        ':salida' => $fecha_salida,
        ':habitacion' => $habitacion,
        ':notas' => $notas
    ]);

    // Redireccionar al éxito
    header("Location: ../HTML/exito.html");
    exit();

} catch (PDOException $e) {
    // Mostrar error si falla la conexión o el guardado
    echo "Error al procesar la reserva: " . $e->getMessage();
}
?>
