<?php 
    session_start();
    header('Content-Type: application/json');
    if(!isset($_SESSION['email_usu'])){
        echo json_encode(['logged' => false]);
        exit;
    }

    $host = 'localhost';
    $dbname = 'garritasfelices';
    $user = 'postgres';
    $pass = '1234';
    
    try {
        $pdo = new PDO("pgsql:host=$host; dbname=$dbname", $user, $pass);
        $email_ss = $_SESSION['email_usu'];

        $sql = "SELECT u.nombre_usu, u.tel_usu
                FROM usuarios u
                WHERE u.email_usu= '$email_ss'";

        $res = $pdo->query($sql);
        $datos = $res->fetch(PDO::FETCH_ASSOC);

        if($datos) {
            echo json_encode(['logged' => true, 'nombre' => $datos['nombre_usu'], 'correo' => $datos['email_usu'],'tel' => $datos['tel_usu']
            ]);
        } else {
            echo json_encode(['logged' => false, 'error' => 'Usuario no encontrado']);
        }

    } catch (PDOException $e) {
        echo json_encode(['logged' => false, 'error' => $e->getMessage()]);
    }
?>
