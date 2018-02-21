import swal from 'sweetalert';

function bindSweetAlertButtonDemo() {
  document.querySelector('#rum-order').addEventListener('click', () => {
    swal({
      title: "Ajouté à ton panier",
      text: "Le Joël doit désormais accepter ta commande",
      icon: "success"
    })
  });
}
export { bindSweetAlertButtonDemo };
