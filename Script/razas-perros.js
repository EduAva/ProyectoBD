// 1. CONSTANTES GLOBALES
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
    if (idEsp === 3 || idEsp === 4) {
        // Ave o Reptil: Sin tamaño
        tamanoSelect.innerHTML = '<option value="">No aplica</option>';
        tamanoSelect.disabled = true;
        await cargarRazas(idEsp, null); 
    } 
    else {
        // Perro o Gato: Con tamaño
        tamanoSelect.disabled = false;
        tamanoSelect.innerHTML = '<option value="">Cargando tamaños...</option>';
        
        try {
            const respTam = await fetch(`../PHP/get_cat.php?accion=obtenerTamanos`);
            const datos = await respTam.json();
            
            // --- CORRECCIÓN VITAL PARA EVITAR ERROR 'forEach' ---
            // Si PHP devuelve un objeto, lo convertimos a array. Si es array, lo dejamos igual.
            const listaTamanos = Array.isArray(datos) ? datos : Object.values(datos);

            tamanoSelect.innerHTML = '<option value="">Selecciona tamaño</option>';
            
            // --- AQUÍ FALTABA EL BUCLE PARA DIBUJAR LAS OPCIONES ---
            listaTamanos.forEach(t => {
                // Ajusta 't.id' y 't.nombre' según cómo se llamen en tu base de datos
                // Por ejemplo: t.id_tamano y t.nom_tamano
                tamanoSelect.innerHTML += `<option value="${t.id}">${t.nombre}</option>`;
            });

            razaSelect.innerHTML = '<option value="">Selecciona primero el tamaño</option>';

        } catch (error) {
            console.error("Error cargando tamaños:", error);
            tamanoSelect.innerHTML = '<option value="">Error al cargar</option>';
        }
    }
}

// 3. CARGAR RAZAS (SUBTIPOS)
async function cargarRazas(idEsp, idTam) {
    const razaSelect = document.getElementById("raza");
    const tamParam = (idTam === null) ? 'null' : idTam;
    
    try {
        const resp = await fetch(`../PHP/get_cat.php?accion=obtenerRazas&id_especie=${idEsp}&id_tamano=${tamParam}`);
        const datos = await resp.json();

        // Protección contra error de datos
        const listaRazas = Array.isArray(datos) ? datos : Object.values(datos);

        razaSelect.innerHTML = '<option value="">Selecciona una opción</option>';
        
        listaRazas.forEach(r => {
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
        const datos = await resp.json();

        // Protección contra error de datos
        const listaVacunas = Array.isArray(datos) ? datos : Object.values(datos);

        vacunasContainer.innerHTML = '';

        if (listaVacunas.length === 0) {
            vacunasContainer.innerHTML = '<p style="font-size: 0.9em; color: grey;">No hay vacunas para esta especie.</p>';
            return;
        }

        listaVacunas.forEach(v => {
            let divLine = document.createElement("div");
            divLine.className = "fila-vacuna";
            
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
            contenedorActivo.style.display = "
