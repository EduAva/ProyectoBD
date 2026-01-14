<?php
session_start();

// 1. Verificar sesión
if (!isset($_SESSION['email_usu'])) {
    header("Location: ../HTML/Login.html");
    exit();
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

    // Iniciar transacción (Importante para guardar Mascota + Chip o nada)
    $pdo->beginTransaction();

    // 3. Obtener ID del Dueño
    $stmtUser = $pdo->prepare("SELECT id_usuario FROM usuarios WHERE email_usu = :email");
    $stmtUser->execute([':email' => $_SESSION['email_usu']]);
    $dueno = $stmtUser->fetch(PDO::FETCH_ASSOC);
    
    if (!$dueno) {
        throw new Exception("Usuario no encontrado.");
    }
    $id_dueno = $dueno['id_usuario'];

    // 4. Manejo de la FOTO
    $ruta_foto = null;
    // Verificamos si se subió un archivo y no hubo errores
    if (isset($_FILES['foto']) && $_FILES['foto']['error'] === UPLOAD_ERR_OK) {
        $nombre_archivo = time() . "_" . basename($_FILES['foto']['name']);
        // Asegúrate de que esta carpeta exista en tu proyecto o el código la creará
        $directorio_destino = "../IMG/mascotas/";
        $ruta_destino = $directorio_destino . $nombre_archivo;
        
        if (!is_dir($directorio_destino)) {
            mkdir($directorio_destino, 0777, true);
        }

        if (move_uploaded_file($_FILES['foto']['tmp_name'], $ruta_destino)) {
            // Guardamos la ruta relativa para la base de datos
            $ruta_foto = $ruta_destino; 
        }
    }

    // 5. Recibir datos del formulario
    $nombre = $_POST['nombre'];
    $edad = $_POST['edad'];
    $subtipo = $_POST['id_subtipo'];
    $genero = $_POST['genero'];
    $peso = $_POST['peso'];
    // PostgreSQL usa 't'/'f' o true/false para booleanos
    $esterilizado = isset($_POST['esterilizado']) ? 'true' : 'false';

    // 6. Insertar Mascota
    $sqlMascota = "INSERT INTO Mascota (nombre_mascota, id_subtipo, edad_mascota, genero_mascota, peso_mascota, esterilizado, url_foto, id_usuario_fk) 
                   VALUES (:nombre, :subtipo, :edad, :genero, :peso, :esterilizado, :foto, :id_dueno) 
                   RETURNING id_Mascota";

    $stmtM = $pdo->prepare($sqlMascota);
    $stmtM->execute([
        ':nombre' => $nombre,
        ':subtipo' => $subtipo,
        ':edad' => $edad,
        ':genero' => $genero,
        ':peso' => $peso,
        ':esterilizado' => $esterilizado,
        ':foto' => $ruta_foto,
        ':id_dueno' => $id_dueno
    ]);
    
    // Obtenemos el ID de la mascota recién creada
    $id_mascota_nueva = $stmtM->fetchColumn();

    // 7. Lógica del CHIP
    if (isset($_POST['chip']) && $_POST['chip'] === 'Si') {
        $protocolo = $_POST['protocolo_chip']; 
        $id_central = $_POST['id_chip']; // Número del chip
        
        // Validación básica
        if (empty($id_central)) {
            throw new Exception("El ID del chip es obligatorio si seleccionaste 'Si'.");
        }

        $sqlChip = null;
        $params = [];

        switch ($protocolo) {
            case 'ISO':
                $id_pais = $_POST['pais_chip'];
                if (empty($id_pais)) throw new Exception("Falta el país para protocolo ISO.");

                $sqlChip = "INSERT INTO chipISO (id_chipISO, bitheader, Pais_chipISO, Identificador_animal, Contador_etiquetado, Info_usuario, Futuro_uso, id_pais_fk, id_mascota_fk) 
                            VALUES (:id, 1, :p_chip, :id_an, :cont, :info, :futu, :p_cat, :id_m)";
                $params = [
                    ':id'    => $id_central,
                    ':p_chip'=> $id_pais, 
                    ':id_an' => $_POST['id_animal'], // Ojo: ¿Esto viene del form o es el id_mascota? Asumo form.
                    ':cont'  => $_POST['contador'] ?? 0,
                    ':info'  => $_POST['info_usr'] ?? 0,
                    ':futu'  => $_POST['futuro'] ?? 0,
                    ':p_cat' => $id_pais,
                    ':id_m'  => $id_mascota_nueva
                ];
                break;

            case 'AVID':
                $sqlChip = "INSERT INTO chipAVID (Id_animalAVID, Header_AVID, Codigo_Rebano_AVID, ID_Animal_AVID, B_Reservados_AVID, B_Control_CRC_AVID, B_Stop_AVID, B_Control_Adicional_AVID, Seguridad_AVID, id_mascota_fk) 
                            VALUES (:id, 0, :rebano, :id_an, :reser, 1, 1, :cont_ad, :seg, :id_m)";
                $params = [
                    ':id'      => $id_central,
                    ':rebano'  => $_POST['rebano'],
                    ':id_an'   => $id_central, // Aquí usabas el mismo id del chip
                    ':reser'   => $_POST['reservados'],
                    ':cont_ad' => $_POST['control_ad'],
                    ':seg'     => $_POST['seguridad'],
                    ':id_m'    => $id_mascota_nueva
                ];
                break;

            case 'ICAR':
                $sqlChip = "INSERT INTO chipICAR (Id_animalICAR, Header_ICAR, Codigo_Control_ICAR, ID_Animal_ICAR, B_Reservados_ICAR, B_Control_CRC_ICAR, B_Stop_ICAR, B_Control_Val_ICAR, id_mascota_fk) 
                            VALUES (:id, 0, :control, :id_an, :reser, 1, 1, :val, :id_m)";
                $params = [
                    ':id'      => $id_central,
                    ':control' => $_POST['cod_control'],
                    ':id_an'   => $id_central,
                    ':reser'   => $_POST['reservados'],
                    ':val'     => $_POST['val_icar'],
                    ':id_m'    => $id_mascota_nueva
                ];
                break;
        }

        if ($sqlChip) {
            $stmtC = $pdo->prepare($sqlChip);
            $stmtC->execute($params);
        }
    }

    // Si todo salió bien, guardamos cambios
    $pdo->commit();
    
    // Redirigir al perfil del usuario
    header("Location: ../HTML/user.php");
    exit();

} catch (Exception $e) {
    // Si algo falló, deshacemos todo (no se guarda ni la mascota ni el chip)
    if ($pdo->inTransaction()) {
        $pdo->rollBack();
    }
    die("Error al registrar mascota: " . $e->getMessage());
}
?>
