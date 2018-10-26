
function hideElement(element) {
  element.style.display = 'none';
}
function toggleElement(element, style) {
  const mq = window.matchMedia( "(max-width: 1200px)" );
  if (mq.matches) {
    if (element.style.display === style) {
      element.style.display = 'none';
    } else {
      element.style.display = style;
    }
  }
}

function hideClass(className) {
  let classes = document.querySelectorAll(className);
  for (let i = 0; i < classes.length; i++) {
    classes[i].style.display = 'none';
  }
}

function showClass(className){
  let classes = document.querySelectorAll(className);
  for (let i = 0; i < classes.length; i++) {
    classes[i].style.display = 'block';
  }
}
