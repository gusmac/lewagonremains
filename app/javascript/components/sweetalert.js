import swal from 'sweetalert';

function changeSoldToBuy(){
  const paragraph = document.querySelector("#btn-buy");
  paragraph.innerText = "Buy";
}

function bindSweetAlertButtonDemo() {
  const swalButton = document.getElementById('btn-buy');
  if (swalButton) { // protect other pages
    swalButton.addEventListener('click', () => {
      swal({
        title: "Item successfully ordered",
        icon: "success"
      });
    setTimeout(function(){
      swalButton.innerText = "Sold";
      swalButton.style.color='black';
      swalButton.style.borderColor='#e2e2e2';
    }, 3000);
    //setTimeout(function(){swalButton.remove(); }, 3000);
    //swalButton.remove();
    //setTimeout(function(){window.location.href = '/for-sale';  }, 3000);
    //swalButton.innerText = "Sold";

    });
  }
  // const buybutton = document.getElementById('btn-buy');
  // buybutton.innerText = "Sold";
  // console.log(buybutton.classlist)
  // buybutton.classlist.remove("btn-medium");
  // buybutton.classlist.add("btn-medium-black");
  // console.log(`Paragraph selected: "${paragraph.innerText}"`);
}

export { changeSoldToBuy };
export { bindSweetAlertButtonDemo };
