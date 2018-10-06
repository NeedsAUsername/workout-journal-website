
function hideElement(element) {
  element.style.display = 'none';
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
