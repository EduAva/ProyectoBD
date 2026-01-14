document.getElementById('cp').addEventListener('input', function() {
    const cp = this.value;
    const selectColonia = document.getElementById('col');
    if (cp.length === 5) {
        fetch(`../PHP/Register.php?cp=${cp}`) 
            .then(response => response.json())
            .then(data => {
                selectColonia.innerHTML = '<option value="">Selecciona una colonia...</option>';

                if (data.length > 0) {
                    selectColonia.disabled = false;
                    document.getElementById('municipio').value = data[0].d_mnpio;
                    document.getElementById('entidad').value = data[0].d_estado;
                    data.forEach(item => {
                        const option = document.createElement('option');
                        option.value = item.id_asenta; 
                        option.textContent = item.d_asenta;
                        selectColonia.appendChild(option);
                    });
                } else {
                    alert('No se encontraron datos para ese Código Postal');
                }
            })
            .catch(error => console.error('Error:', error));
    }
});

const pass1 = document.getElementById('password');
const pass2 = document.getElementById('confirm_password');
const errorMsg = document.getElementById('e_pass');
const btnEnviar = document.getElementById('btn-registrarse');

function validarContrasenas() {
    if (pass1.value !== pass2.value && pass2.value !== "") {
        errorMsg.style.display = 'block';
        btnEnviar.disabled = true;
    } else {
        errorMsg.style.display = 'none';
        btnEnviar.disabled = false;
    }
}
pass1.addEventListener('input', validarContrasenas);
pass2.addEventListener('input', validarContrasenas);
