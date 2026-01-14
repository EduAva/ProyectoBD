<?php
session_start();
$host = 'localhost';
$dbname = 'garritasfelices';
$user = 'postgres';
$pass = '1234';

header('Content-Type: application/json');
try {
    $pdo = new PDO("pgsql:host=$host;port=5432;dbname=$dbname;",$user,$pass);
    
    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        $email = $_POST['email'];
        $passw = $_POST['password'];

        $sql = "SELECT * FROM usuarios WHERE email_usu = '$email'";
        error_log("Buscando este correo: " . $email);
        $res = $pdo->query($sql);
        $usuario = $res->fetch(PDO::FETCH_ASSOC);

        if ($usuario) {
            if ($usuario['passw_usu'] === $passw) {
                $_SESSION['email_usu'] = $email;
                echo json_encode(['success' => true]);
            } else {
                echo json_encode(['success' => false, 'message' => 'Contrasena incorrecta.']);
            }
        } else {
            echo json_encode(['success' => false, 'message' => 'El correo no esta registrado.']);
        }
    }
} catch (PDOException $e) {
    echo json_encode(['success' => false, 'message' => 'Error de base de datos.']);
}
?>
