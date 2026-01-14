<?php
session_start();

if (!isset($_SESSION['email_usu'])) {
    header("Location: ../HTML/Login.html");
    exit();
}

$host = 'localhost';
$dbname = 'garritasfelices';
$user = 'postgres';
$pass = '1234';

try {
    $pdo = new PDO("pgsql:host=$host;port=5432;dbname=$dbname;", $user, $pass);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $stmtUser = $pdo->prepare("SELECT id_usuario FROM usuarios WHERE email_usu = :email");
    $stmtUser->execute(['email' => $_SESSION['email_usu']]);
    $usuario = $stmtUser->fetch(PDO::FETCH_ASSOC);
    $id_usuario = $usuario['id_usuario'];

    $fecha_entrada = $_POST['fecha_entrada'];
    $fecha_salida = $_POST['fecha_salida'];
    $habitacion = $_POST['habitacion'];
    $notas = $_POST['notas'];

    $sql = "INSERT INTO reservaciones (id_usuario_fk, fecha_entrada, fecha_salida, tipo_habitacion, notas_especiales, estado_reservacion) 
            VALUES (:id_usuario, :entrada, :salida, :habitacion, :notas, 'Pendiente')";
    
    $stmt = $pdo->prepare($sql);
    $stmt->execute([
        'id_usuario' => $id_usuario,
        'entrada' => $fecha_entrada,
        'salida' => $fecha_salida,
        'habitacion' => $habitacion,
        'notas' => $notas
    ]);

    header("Location: ../HTML/exito.html");
    exit();

} catch (PDOException $e) {
    echo "Error al procesar la reserva: " . $e->getMessage();
}
?>