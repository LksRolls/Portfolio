// script.js

document.addEventListener("DOMContentLoaded", function () {
    var supportButton = document.getElementById("support-button");
    var shopButton = document.getElementById("shop-button");
    var headerOriginal = document.getElementById("header-original");
    var headerSupport = document.getElementById("header-support");

    supportButton.addEventListener("click", function () {
        headerOriginal.style.display = "none";
        headerSupport.style.display = "grid";
    });

    shopButton.addEventListener("click", function () {
        headerOriginal.style.display = "grid";
        headerSupport.style.display = "none";
    });
});