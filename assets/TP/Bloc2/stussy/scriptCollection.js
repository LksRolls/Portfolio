document.addEventListener("DOMContentLoaded", function () {
    console.log("DOM Loaded");
    var filterSidebar = document.getElementById("filterSidebar");
    var applyFiltersButton = document.getElementById("applyFiltersButton");
    var resetFiltersButton = document.getElementById("resetFiltersButton");

    document.querySelector(".filtrer").addEventListener("click", function () {
        console.log("Filter button clicked");
        var body = document.body;
        if (filterSidebar.style.display === "none" || filterSidebar.style.display === "") {
            filterSidebar.style.display = "block";
            body.classList.add("sidebar-open");
        } else {
            filterSidebar.style.display = "none";
            body.classList.remove("sidebar-open");
        }
    });

    applyFiltersButton.addEventListener("click", function () {
        console.log("Apply Filters button clicked");
        console.log("Filters applied!");
        filterSidebar.style.display = "none";
        document.body.classList.remove("sidebar-open");
    });

    resetFiltersButton.addEventListener("click", function () {
        console.log("Reset Filters button clicked");
        console.log("Filters reset!");
        filterSidebar.style.display = "none";
        document.body.classList.remove("sidebar-open");
    });
});

