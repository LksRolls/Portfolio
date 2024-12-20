//Effet de défilement
document.addEventListener("DOMContentLoaded", function () {
    const options = {
        strings: ["Developpeur", "Apprenti", "Langatte"],
        typeSpeed: 100,
        backSpeed: 50,
        backDelay: 1000,
        loop: true,
    };
    new Typed("#typed-text", options);
});