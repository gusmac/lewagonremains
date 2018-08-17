import swal from 'sweetalert';

function bindSweetAlertButtonDemo() {
  const swalButton = document.getElementById('btn-buy');
  if (swalButton) { // protect other pages
    swalButton.addEventListener('click', () => {
      swal({
        title: "Item successfully ordered",
        icon: "success"
      });
    });
  }
}

export { bindSweetAlertButtonDemo };
