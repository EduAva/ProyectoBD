<?php 
    session_start();
    header('Content-Type: application/json');

    // 1. Verificar sesión
    if(!isset($_SESSION['email_usu'])){
        echo json_encode(['logged' => false]);
        exit;
    }

    // 2. CONEXIÓN A NEON (Variables de Entorno)
    $host = getenv('PGHOST');
    $dbname = getenv('PGDATABASE');
    $user = getenv('PGUSER');
    $pass = getenv('PGPASSWORD');
    $port = getenv('PGPORT');
    
    try {
        $dsn = "pgsql:host=$host;port=$port;dbname=$dbname;sslmode=require";
        $pdo = new PDO($dsn, $user, $pass);
        $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

        $email_ss = $_SESSION['email_usu'];

        // 3. CONSULTA SEGURA (Corregida)
        // Agregué 'email_usu' al SELECT para que no falle al devolver el JSON
        $sql = "SELECT nombre_usu, tel_usu, email_usu
                FROM usuarios 
                WHERE email_usu = :email";

        $stmt = $pdo->prepare($sql);
        $stmt->execute([':email' => $email_ss]);
        $datos = $stmt->fetch(PDO::FETCH_ASSOC);

        if($datos) {
            echo json_encode([
                'logged' => true, 
                'nombre' => $datos['nombre_usu'], 
                'correo' => $datos['email_usu'], // Ahora sí existe este dato
                'tel' => $datos['tel_usu']
            ]);
        } else {
            echo json_encode(['logged' => false, 'error' => 'Usuario no encontrado']);
        }

    } catch (PDOException $e) {
        echo json_encode(['logged' => false, 'error' => 'Error de conexión: ' . $e->getMessage()]);
    }
?>
