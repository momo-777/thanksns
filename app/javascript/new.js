const colorpicker = document.querySelector('.arrow-icon-color-selector');
  const arrowicon = document.getElementById('arrow-icon');

  colorpicker.addEventListener('input', function(e) {
    document.body.style.color = e.target.value;
  });