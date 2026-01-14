// 1. CONSTANTES GLOBALES
// IMPORTANTE: Verifica en tu base de datos (tabla cat_especies) qué ID tiene cada uno.
// Aquí asumo: 1=Perro, 2=Gato, 3=Ave, 4=Reptil. Si en tu base es diferente, cámbialo aquí.
const ESPECE_IDS = { 
    "Perro": 1, 
    "Gato": 2, 
    "Ave": 3, 
    "Reptil": 4 
};

// 2. FUNCIÓN PRINCIPAL: SELECCIÓN DE ESPECIE
async function actualizarOpciones() {
    const tipoEspecie = document.getElementById("tipo").value;
    const tamanoSelect = document.getElementById("tamano");
    const razaSelect = document.getElementById("raza");
    
    // Obtenemos el ID numérico
    const idEsp = ESPECE_IDS[tipoEspecie];

    if (!idEsp) return;

    // A) Cargar Vacunas
    await cargarVacunas(idEsp);

    // B) Lógica de Tamaños
    // Si es Ave (3) o Reptil (4), no tienen tamaño
    if (idEsp === 3 || idEsp === 4) {
        tamanoSelect.innerHTML = '<option value="">No aplica</option>';
        tamanoSelect.disabled = true;
        // Cargamos las razas/subtipos directamente enviando null como tamaño
        await cargarRazas(idEsp, null); 
    } 
    else {
        // Si es Perro (1) o Gato (2), activamos tamaño
        tamanoSelect.disabled = false;
        tamanoSelect.innerHTML = '<option value="">Cargando tamaños...</option>';
        
        try {
            // Asegúrate de que el archivo PHP se llame 'get_cat.php'
            const respTam = await fetch(`../PHP/get_cat.php?accion=obtenerTamanos`);
            const tamanos = await respTam.json();
            
            tamanoSelect.innerHTML = '<option value="">Selecciona tamaño</option>';
            tamanos.forEach(t => {
                tamanoSelect.innerHTML += `<option value="${t.id_tamano}">${t.nom_tamano}</option>`;
            });
            razaSelect.innerHTML = '<option value="">Selecciona primero el tamaño</option>';
        } catch (error) {
            console.error("Error cargando tamaños:", error);
        }
    }
}

// 3. CARGAR RAZAS (SUBTIPOS)
async function cargarRazas(idEsp, idTam) {
    const razaSelect = document.getElementById("raza");
    // Convertimos null a string 'null' para que la URL sea válida
    const tamParam = (idTam === null) ? 'null' : idTam;
    
    try {
        const resp = await fetch(`../PHP/get_cat.php?accion=obtenerRazas&id_especie=${idEsp}&id_tamano=${tamParam}`);
        const razas = await resp.json();

        razaSelect.innerHTML = '<option value="">Selecciona una opción</option>';
        razas.forEach(r => {
            razaSelect.innerHTML += `<option value="${r.id_subtipo}">${r.nom_subtipo}</option>`;
        });
    } catch (error) {
        console.error("Error al cargar razas:", error);
    }
}

// 4. CARGAR VACUNAS
async function cargarVacunas(idEsp) {
    const vacunasContainer = document.getElementById("contenedorVacunas");
    
    try {
        const resp = await fetch(`../PHP/get_cat.php?accion=obtenerVacunas&id_especie=${idEsp}`);
        const vacunas = await resp.json();

        vacunasContainer.innerHTML = '';

        if (vacunas.length === 0) {
            vacunasContainer.innerHTML = '<p style="font-size: 0.9em; color: grey;">No hay vacunas para esta especie.</p>';
            return;
        }

        vacunas.forEach(v => {
            let divLine = document.createElement("div");
            divLine.className = "fila-vacuna";
            
            // Estilos visuales
            let isEsencial = (v.importancia && v.importancia.trim().toUpperCase() === 'ESENCIAL');
            let statusClass = isEsencial ? 'text-danger' : 'text-muted';
            let labelText = isEsencial ? ' (Obligatoria)' : ' (Opcional)';

            divLine.innerHTML = `
                <input type="checkbox" id="vac_${v.id_vacuna}" name="vacunas[]" value="${v.id_vacuna}">
                <label for="vac_${v.id_vacuna}">
                    ${v.nombre_vacuna} <small>${v.tipo_vacuna || ''}</small> 
                    <b class="${statusClass}">${labelText}</b>
                </label>
            `;
            vacunasContainer.appendChild(divLine);
        });
    } catch (error) {
        console.error("Error al cargar vacunas:", error);
    }
}

// 5. LÓGICA DE CHIPS
function mostrarCamposChip() {
    const chip = document.getElementById("chip").value;
    const chipDatos = document.getElementById("chipDatos");
    
    if (chip === "Si") {
        chipDatos.style.display = "block";
    } else {
        chipDatos.style.display = "none";
        deshabilitarTodosLosCamposChip(); 
    }
}

function mostrarChips() {
    const protocolo = document.getElementById("protocolo_chip").value;
    ocultarTodosLosCamposTecnicos();

    if (protocolo !== "") {
        const contenedorActivo = document.getElementById("campos" + protocolo);
        if (contenedorActivo) {
            contenedorActivo.style.display = "block";
            const inputs = contenedorActivo.getElementsByTagName("input");
            for (let i = 0; i < inputs.length; i++) {
                inputs[i].disabled = false;
            }
        }
    }
}

function ocultarTodosLosCamposTecnicos() {
    ["camposISO", "camposAVID", "camposICAR"].forEach(id => {
        const elemento = document.getElementById(id);
        if (elemento) {
            elemento.style.display = "none";
            const inputs = elemento.getElementsByTagName("input");
            for (let i = 0; i < inputs.length; i++) inputs[i].disabled = true;
        }
    });
}

function deshabilitarTodosLosCamposChip() {
    const protocoloSelect = document.getElementById("protocolo_chip");
    if(protocoloSelect) protocoloSelect.value = "";
    ocultarTodosLosCamposTecnicos();
}

// 6. EVENT LISTENERS (Unificados y limpios)

// Listener para cambio de Tamaño (Solo para Perros y Gatos)
document.getElementById("tamano").addEventListener("change", function() {
    const tipoEspecie = document.getElementById("tipo").value;
    const idEsp = ESPECE_IDS[tipoEspecie];
    
    // Solo recargamos razas si es Perro(1) o Gato(2) y se seleccionó un tamaño
    if ((idEsp === 1 || idEsp === 2) && this.value) {
        cargarRazas(idEsp, this.value);
    }
});

// Listener para habilitar el select antes de enviar (para que vaya en el POST)
const formBox = document.querySelector(".box-formulario");
if (formBox) {
    formBox.onsubmit = function() {
        document.getElementById("tamano").disabled = false;
    };
}
