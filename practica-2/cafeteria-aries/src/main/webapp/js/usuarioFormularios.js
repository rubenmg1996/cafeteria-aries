var formulariosVisibles = false;
var pedidosVisibles = false;

function verForms() {
    formulariosVisibles = true;
    if(pedidosVisibles) ocultarPedidos();
    var formularios = document.querySelectorAll('.formularioUsuario');
    formularios.forEach(function(formulario) {
        formulario.classList.remove('formulario-oculto');
        var boton = document.getElementById("botonFormularios");
        boton.onclick = ocultarForms;
        boton.textContent = "Ocultar";
      });
      
    }

function ocultarForms(){
    formulariosVisibles = false;
    var formularios = document.querySelectorAll('.container');
    formularios.forEach(function(formulario) {
        formulario.classList.add('formulario-oculto');
        var boton = document.getElementById("botonFormularios");
        boton.onclick = verForms;
        boton.textContent = "Modificar datos";
      });
      console.log("Ejecutando ocultarForms");
}

function verPedidos()
{
    pedidosVisibles = true;
    if(formulariosVisibles) ocultarForms();
    var tabla = document.getElementById("pedidos");
    tabla.style.display = "flex";
    var boton = document.getElementById("botonPedidos");
    boton.onclick = ocultarPedidos;
    boton.textContent = "Ocultar";
    

}

function ocultarPedidos()
{
    pedidosVisibles = false;
    var tabla = document.getElementById("pedidos");
    tabla.style.display = "none";
    var boton = document.getElementById("botonPedidos");
    boton.onclick = verPedidos;
    boton.textContent = "Ver pedidos";
}