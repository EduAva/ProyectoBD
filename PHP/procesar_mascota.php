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

    $pdo->beginTransaction();

    $stmtUser = $pdo->prepare("SELECT id_usuario FROM usuarios WHERE email_usu = :email");
    $stmtUser->execute(['email' => $_SESSION['email_usu']]);
    $dueno = $stmtUser->fetch(PDO::FETCH_ASSOC);
    $id_dueno = $dueno['id_usuario'];

    $ruta_foto = null;
    if (isset($_FILES['foto']) && $_FILES['foto']['error'] === UPLOAD_ERR_OK) {
        $nombre_archivo = time() . "_" . basename($_FILES['foto']['name']);
        $ruta_destino = "../IMG/mascotas/" . $nombre_archivo;
        
        if (!is_dir("../IMG/mascotas/")) {
            mkdir("../IMG/mascotas/", 0777, true);
        }

        if (move_uploaded_file($_FILES['foto']['tmp_name'], $ruta_destino)) {
            $ruta_foto = $ruta_destino;
        }
    }

    $nombre = $_POST['nombre'];
    $edad = $_POST['edad'];
    $subtipo = $_POST['id_subtipo'];
    $genero = $_POST['genero'];
    $peso = $_POST['peso'];
    $esterilizado = isset($_POST['esterilizado']) ? 't' : 'f';

    // 6. Insertar Mascota y obtener su ID con RETURNING
    $sqlMascota = "INSERT INTO Mascota (nombre_mascota, id_subtipo, edad_mascota, genero_mascota, peso_mascota, esterilizado, url_foto, id_usuario_fk) 
                   VALUES (:nombre, :subtipo, :edad, :genero, :peso, :esterilizado, :foto, :id_dueno) 
                   RETURNING id_Mascota";

    $stmtM = $pdo->prepare($sqlMascota);
    $stmtM->execute([
        'nombre' => $nombre,
        'subtipo' => $subtipo,
        'edad' => $edad,
        'genero' => $genero,
        'peso' => $peso,
        'esterilizado' => $esterilizado,
        'foto' => $ruta_foto,
        'id_dueno' => $id_dueno
    ]);
    $id_mascota_nueva = $stmtM->fetchColumn();

    if ($_POST['chip'] === 'Si') {
        $protocolo = $_POST['protocolo_chip']; 
        $id_central = $_POST['id_chip'];
        $id_pais = $_POST['pais_chip'];
                if (empty($id_pais) ||empty($id_central)) {
                throw new PDOException("Faltan campos obligatorios para el protocolo ISO.");
            }

        switch ($protocolo) {
            case 'ISO':
                $codigo_pais = $_POST['pais_chip']; 
                $sqlChip = "INSERT INTO chipISO (id_chipISO, bitheader, Pais_chipISO, Identificador_animal, Contador_etiquetado, Info_usuario, Futuro_uso, id_pais_fk, id_mascota_fk) 
                            VALUES (:id, 1, :p_chip, :id_an, :cont, :info, :futu, :p_cat, :id_m)";
                $params = [
                    'id'    => $id_central,
                    'p_chip'=> $codigo_pais, 
                    'id_an' => $_POST['id_animal'], 
                    'cont'  => $_POST['contador'] ?? 0,
                    'info'  => $_POST['info_usr'] ?? 0,
                    'futu'  => $_POST['futuro'] ?? 0,
                    'p_cat' => $codigo_pais,
                    'id_m'  => $id_mascota_nueva
                ];
                break;

            case 'AVID':
                $sqlChip = "INSERT INTO chipAVID (Id_animalAVID, Header_AVID, Codigo_Rebano_AVID, ID_Animal_AVID, B_Reservados_AVID, B_Control_CRC_AVID, B_Stop_AVID, B_Control_Adicional_AVID, Seguridad_AVID, id_mascota_fk) 
                            VALUES (:id, 0, :rebano, :id_an, :reser, 1, 1, :cont_ad, :seg, :id_m)";
                $params = [
                    'id'     => $id_central,
                    'rebano' => $_POST['rebano'],
                    'id_an'  => $id_central,
                    'reser'  => $_POST['reservados'],
                    'cont_ad'=> $_POST['control_ad'],
                    'seg'    => $_POST['seguridad'],
                    'id_m'   => $id_mascota_nueva
                ];
                break;

            case 'ICAR':
                $sqlChip = "INSERT INTO chipICAR (Id_animalICAR, Header_ICAR, Codigo_Control_ICAR, ID_Animal_ICAR, B_Reservados_ICAR, B_Control_CRC_ICAR, B_Stop_ICAR, B_Control_Val_ICAR, id_mascota_fk) 
                            VALUES (:id, 0, :control, :id_an, :reser, 1, 1, :val, :id_m)";
                $params = [
                    'id'      => $id_central,
                    'control' => $_POST['cod_control'],
                    'id_an'   => $id_central,
                    'reser'   => $_POST['reservados'],
                    'val'     => $_POST['val_icar'],
                    'id_m'    => $id_mascota_nueva
                ];
                break;
        }

        if (isset($sqlChip)) {
            $stmtC = $pdo->prepare($sqlChip);
            $stmtC->execute($params);
        }
    }

    $pdo->commit();
    header("Location: ../HTML/user.php");
    exit();

} catch (PDOException $e) {
    if ($pdo->inTransaction()) {
        $pdo->rollBack();
    }
    echo "Error técnico. " . $e->getMessage();
}
?>
