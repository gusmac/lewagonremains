function initDropdownClick(){
  document.querySelectorAll("input[type='radio']").forEach(function(element) {
    element.addEventListener("click", (e) => { activateElement(e); }, false);;
  });

  function activateElement(selectedElement) {
    document.querySelectorAll("input[type='radio']").forEach(function(element) {
      element.parentNode.classList.remove("active");
      selectedElement.target.parentNode.classList.add("active");
    });
  }
}

export {initDropdownClick}
