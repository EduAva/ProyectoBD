<?php
session_start();

// 1. CONFIGURACIÓN PARA RENDER (Variables de entorno)
$host = getenv('PGHOST');
$dbname = getenv('PGDATABASE');
$user = getenv('PGUSER');
$pass = getenv('PGPASSWORD');
$port = getenv('PGPORT');

try {
    // Cadena de conexión segura para Neon
    $dsn = "pgsql:host=$host;port=$port;dbname=$dbname;sslmode=require";
    $pdo = new PDO($dsn, $user, $pass);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    // --- PARTE 1: BUSCAR CÓDIGO POSTAL (API) ---
    if (isset($_GET['cp'])) {
        header('Content-Type: application/json');
        $cp = $_GET['cp'];

        // Consulta segura
        $sql = "SELECT a.id_asenta, a.d_asenta, m.d_mnpio, e.d_estado 
                FROM cat_asentamientos a
                JOIN cat_cp_base c ON a.codigoP_fk = c.codigoP
                JOIN cat_municipios m ON c.id_mnpio_fk = m.id_mnpio AND c.id_estado_fk = m.id_estado_fk
                JOIN cat_estados e ON m.id_estado_fk = e.id_estado
                WHERE c.codigoP = :cp";

        $stmt = $pdo->prepare($sql);
        $stmt->execute([':cp' => $cp]);
        echo json_encode($stmt->fetchAll(PDO::FETCH_ASSOC));
        exit;
    }

    // --- PARTE 2: REGISTRAR USUARIO (POST) ---
    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        // Recibir datos
        $nombre = $_POST['nombre'];
        $apater = $_POST['apellidop'];
        $amater = $_POST['apellidom'];
        $nac_date = $_POST['edad'];
        $email = $_POST['correo'];
        $tel = $_POST['phone'];
        $pass_usu = $_POST['password'];
        
        // Datos de domicilio
        $cp = $_POST['cp'];
        $calle = $_POST['calle'];
        $noe = $_POST['noe']; // Número exterior
        $noi = $_POST['noi']; // Número interior
        $id_asenta = $_POST['col']; // ID de la colonia seleccionada

        // 1. Insertar Domicilio (Usando Prepared Statements)
        $sql_dom = "INSERT INTO domicilio (nom_calle, num_calleINT, num_calleEXT, cp, id_asenta) 
                    VALUES (:calle, :noi, :noe, :cp, :id_asenta) RETURNING id_domicilio";
        
        $stmt_dom = $pdo->prepare($sql_dom);
        $stmt_dom->execute([
            ':calle' => $calle,
            ':noi' => $noi,
            ':noe' => $noe,
            ':cp' => $cp,
            ':id_asenta' => $id_asenta
        ]);
        
        $id_domicilio_fk = $stmt_dom->fetchColumn();
  
        // 2. Insertar Usuario vinculado al domicilio
        $sql_usu = "INSERT INTO usuarios (nombre_usu, apellido_pa_usu, apellido_ma_usu, email_usu, tel_usu, passw_usu, fec_nac_usu, id_domicilio_fk) 
                    VALUES (:nombre, :apater, :amater, :email, :tel, :pass_usu, :nac_date, :domicilio)";
        
        $stmt_usu = $pdo->prepare($sql_usu);
        $stmt_usu->execute([
            ':nombre' => $nombre,
            ':apater' => $apater,
            ':amater' => $amater,
            ':email' => $email,
            ':tel' => $tel,
            ':passw_usu' => $pass_usu,
            ':nac_date' => $nac_date,
            ':domicilio' => $id_domicilio_fk
        ]);
        
        // Redireccionar al éxito
        header("Location: ../HTML/Pagina-Principal.html");
        exit();
    }

} catch (PDOException $e) {
    // En caso de error, mostramos qué pasó (útil para depurar)
    echo json_encode(["error" => "Error de conexión o base de datos: " . $e->getMessage()]);
}
?>
