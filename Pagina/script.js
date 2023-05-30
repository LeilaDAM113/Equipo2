document.addEventListener('DOMContentLoaded', function() {
  console.log('El JavaScript se está cargando correctamente.');

  const loanSlider = document.getElementById('loanSlider');
  const loanAmount = document.getElementById('loanAmount');
  const buttonSlider = document.querySelector('.button-slider a');

  let loanValue = 0;

  loanSlider.addEventListener('input', function(event) {
    loanValue = event.target.value;
    loanAmount.textContent = loanValue;
  });

  buttonSlider.addEventListener('click', function(event) {
    event.preventDefault();
    console.log('¡Pide tu préstamo!');
  });
});
