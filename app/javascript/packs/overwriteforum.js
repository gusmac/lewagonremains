function overwrite (){
  let textforum = document.querySelectorAll(".thredded--messageboard--title")
  if (textforum.length > 0 ){
    textforum.forEach(function(element){
      element.style.color = "#F75555";
    })
  }
}


export{
  overwrite
}
