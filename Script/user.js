document.addEventListener('DOMContentLoaded', function(){
function cerrarSesion() {
    fetch('../PHP/logout.php')
        .then(() => {
            window.location.href = '../HTML/Pagina-Principal.html';
        })
        .catch(error => console.error('Error al cerrar sesión: ', error));
}

});