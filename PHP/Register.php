<?php
session_start();
$host = 'localhost';
$dbname = 'garritasfelices';
$user = 'postgres';
$pass = '1234';

try {
    $dsn = "pgsql:host=$host;port=5432;dbname=$dbname;";
    $pdo = new PDO($dsn, $user, $pass);

    if (isset($_GET['cp'])) {
        header('Content-Type: application/json');
        $cp = $_GET['cp'];

        $sql = "SELECT a.id_asenta, a.d_asenta, m.d_mnpio, e.d_estado 
                FROM cat_asentamientos a
                JOIN cat_cp_base c ON a.codigoP_fk = c.codigoP
                JOIN cat_municipios m ON c.id_mnpio_fk = m.id_mnpio AND c.id_estado_fk = m.id_estado_fk
                JOIN cat_estados e ON m.id_estado_fk = e.id_estado
                WHERE c.codigoP = '$cp'";

        $res = $pdo->query($sql);
        echo json_encode($res->fetchAll(PDO::FETCH_ASSOC));
        exit;
    }

    if ($_SERVER['REQUEST_METHOD'] === 'POST') {
        $nombre = $_POST['nombre'];
        $apater = $_POST['apellidop'];
        $amater = $_POST['apellidom'];
        $nac_date = $_POST['edad'];
        $email = $_POST['correo'];
        $tel = $_POST['phone'];
        $pass_usu = $_POST['password'];
        $cp = $_POST['cp'];
        $calle = $_POST['calle'];
        $noe = $_POST['noe'];
        $noi = $_POST['noi'];
        $id_asenta = $_POST['col'];

        $sql_dom = "INSERT INTO domicilio (nom_calle,num_calleINT,num_calleEXT,cp,id_asenta) 
                    VALUES ('$calle','$noi','$noe',$cp, $id_asenta) RETURNING id_domicilio";
        
        $res_dom = $pdo->query($sql_dom);
        $id_domicilio_fk = $res_dom->fetchColumn();
  
        $sql_usu = "INSERT INTO Usuarios (nombre_usu,apellido_pa_usu,apellido_ma_usu,email_usu,tel_usu,passw_usu, fec_nac_usu,id_domicilio_fk) 
                    VALUES ('$nombre','$apater','$amater','$email','$tel','$pass_usu','$nac_date', $id_domicilio_fk)";
        
        $pdo->exec($sql_usu);
        header("Location: ../HTML/Pagina-Principal.html");
        exit();
    }

} catch (PDOException $e) {
    echo json_encode(["error" => $e->getMessage()]);
}
?>
