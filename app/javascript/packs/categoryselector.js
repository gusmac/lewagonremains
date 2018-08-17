  function categorySelector(){
   let categories = document.querySelectorAll(".dropdown-cat input")

    if (categories.length > 0){
     categories.forEach(function(cat){
      cat.addEventListener("click", function(){
       document.querySelector("#dropdown").innerText = cat.value
      })
    })

    }

  }

  export {categorySelector}
