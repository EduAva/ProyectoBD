document.addEventListener('DOMContentLoaded', function() {
    let indiceSlide = 0;
    const slides = document.querySelectorAll('.slide');

    if (slides.length === 0) return;

    function mostrarSlide(n) {

        slides.forEach(slide => {
            slide.classList.remove('activo');
        });
        if (n >= slides.length) {
            indiceSlide = 0;
        } else if (n < 0) {
            indiceSlide = slides.length - 1;
        }
        slides[indiceSlide].classList.add('activo');
    }
    function pasarSlideAutomatico() {
        indiceSlide++;
        mostrarSlide(indiceSlide);
    }
    mostrarSlide(indiceSlide); 
    setInterval(pasarSlideAutomatico, 4000); 
});
