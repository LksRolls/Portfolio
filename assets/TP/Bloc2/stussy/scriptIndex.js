document.addEventListener("DOMContentLoaded", function () {
    var supportButton = document.querySelector('.left-buttons li:nth-child(3) a');
    var secondHeader = document.querySelector('.second-header');
    var originalSecondHeaderContent = secondHeader.innerHTML;

    supportButton.addEventListener('mouseover', function () {
        secondHeader.innerHTML = `
            <nav class="additional-buttons">
                <ul>
                    <li><a href="#">CUSTOMER SUPPORT</a></li>
                    <li><a href="#">SHIPPING & RETURNS</a></li>
                    <li><a href="#">SIZE GUIDE</a></li>
                    <li><a href="#">CAREERS</a></li>
                    <li><a href="#">LEGAL</a></li>
                    <li><a href="#">ACCESSIBILITY</a></li>
                </ul>
            </nav>
        `;
    });

    supportButton.addEventListener('click', function (event) {
        event.preventDefault();
        secondHeader.innerHTML = `
            <nav class="additional-buttons">
                <ul>
                    <li><a href="#">CUSTOMER SUPPORT</a></li>
                    <li><a href="#">SHIPPING & RETURNS</a></li>
                    <li><a href="#">SIZE GUIDE</a></li>
                    <li><a href="#">CAREERS</a></li>
                    <li><a href="#">LEGAL</a></li>
                    <li><a href="#">ACCESSIBILITY</a></li>
                </ul>
            </nav>
        `;
    });

    secondHeader.addEventListener('mouseleave', function () {
        secondHeader.innerHTML = originalSecondHeaderContent;
    });
});
