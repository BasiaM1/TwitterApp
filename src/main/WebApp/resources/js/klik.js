document.addEventListener("DOMContentLoaded", function()  {
    var buttons = document.querySelectorAll('button');
var counters = document.querySelectorAll('.counter');
for (var i = 0; i < buttons.length; i++) {
    // do przyciskow dodajemy informacje, ktory maja numerek - dzieki temu wiemy ktory counter inkrementowac
    buttons[i].dataset.identifier = i;
    buttons[i].addEventListener("click", function(event){
        // tu nie mozemy uzyc "i" bo ciagle bedzie ustawione na "3"
        counters[event.srcElement.dataset.identifier].innerHTML =
            parseInt(counters[event.srcElement.dataset.identifier].innerHTML) + 1;
});
}
});