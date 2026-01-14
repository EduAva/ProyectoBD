const ESPECE_IDS = { "Perro": 1, "Gato": 2, "Reptil": 4, "Ave": 3 };

async function actualizarOpciones() {
    const tipoEspecie = document.getElementById("tipo").value;
    const tamanoSelect = document.getElementById("tamano");
    const razaSelect = document.getElementById("raza");
    const idEsp = ESPECE_IDS[tipoEspecie];

    if (!idEsp) return;
    await cargarVacunas(idEsp);

    if (idEsp === 3 || idEsp === 4) {
        tamanoSelect.innerHTML = '<option value="">No aplica</option>';
        tamanoSelect.disabled = true;
        await cargarRazas(idEsp, null); 
    } 
    else {
        tamanoSelect.disabled = false;
        tamanoSelect.innerHTML = '<option value="">Cargando tamaños...</option>';
        
        const respTam = await fetch(`../PHP/get_cat.php?accion=obtenerTamanos`);
        const tamanos = await respTam.json();
        
        tamanoSelect.innerHTML = '<option value="">Selecciona tamaño</option>';
        tamanos.forEach(t => {
            tamanoSelect.innerHTML += `<option value="${t.id_tamano}">${t.nom_tamano}</option>`;
        });
        razaSelect.innerHTML = '<option value="">Selecciona primero el tamaño</option>';
    }
}

async function cargarRazas(idEsp, idTam) {
    const razaSelect = document.getElementById("raza");
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
            
            let statusClass = (v.importancia && v.importancia.trim().toUpperCase() === 'ESENCIAL') ? 'text-danger' : 'text-muted';
            let labelText = (v.importancia && v.importancia.trim().toUpperCase() === 'ESENCIAL') ? ' (Obligatoria)' : ' (Opcional)';

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
        contenedorActivo.style.display = "block";
        
        const inputs = contenedorActivo.getElementsByTagName("input");
        for (let i = 0; i < inputs.length; i++) {
            inputs[i].disabled = false;
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
    document.getElementById("protocolo_chip").value = "";
    ocultarTodosLosCamposTecnicos();
}

// 5. EVENT LISTENERS
document.getElementById("tamano").addEventListener("change", function() {
    const tipoEspecie = document.getElementById("tipo").value;
    const idEsp = ESPECE_IDS[tipoEspecie];
    if ((idEsp === 1 || idEsp === 2) && this.value) {
        cargarRazas(idEsp, this.value);
    }
});

document.querySelector(".box-formulario").onsubmit = function() {
    document.getElementById("tamano").disabled = false;
};

document.getElementById("tamano").addEventListener("change", function() {
    const tipoEspecie = document.getElementById("tipo").value;
    
    const ESPECE_IDS = { "Perro": 1, "Gato": 2, "Reptil": 3, "Ave": 4 };
    const idEsp = ESPECE_IDS[tipoEspecie];
    
    if ((idEsp === 1 || idEsp === 2) && this.value) {
        cargarRazas(idEsp, this.value);
    }
});
