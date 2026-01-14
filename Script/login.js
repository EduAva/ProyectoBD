document.getElementById('loginForm').addEventListener('submit', function(e) {
    e.preventDefault();

    const formData = new FormData(this); 
    const mensajeDiv = document.getElementById('mensaje-error');

    fetch('../PHP/login.php', {
        method: 'POST',
        body: formData
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {

            window.location.href = '../HTML/Pagina-Principal.html';
        } else {
            mensajeDiv.textContent = data.message;
            mensajeDiv.style.display = 'block';
        }
    })
    .catch(error => {
        console.error('Error:', error);
        alert("Hubo un error al conectar con el servidor.");
    });
});
