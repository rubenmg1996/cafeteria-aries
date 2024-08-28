class Cabecera extends HTMLElement {
    constructor() {
        super()
        this.innerHTML = `<div class="container-fluid">
        <div class="row">
            <div class="col-sm-2 p-4 titulo text-center">
                <div class="fakelogo">
                <img width=70 height=70 alt="Logo" src="./media/icono.png">
                </div>
            </div>
            <div class="col-sm-10 p-4 text-center titulo">
                <h1>Cafeter&iacute;a Aries</h1>
                
            </div>
            </div>
        </div> 
        `
    }
}
window.customElements.define('mi-cabecera', Cabecera);

class CabeceraAdmin extends HTMLElement {
    constructor() {
        super()
        this.innerHTML = `<div class="container-fluid">
        <div class="row">
            <div class="col-sm-2 p-4 titulo text-center">
                <div class="fakelogo">
                <img width=70 height=70 alt="Logo" src="../media/icono.png">
                </div>
            </div>
            <div class="col-sm-10 p-4 text-center titulo">
                <h1>Cafeter&iacute;a Aries</h1>
                
            </div>
            </div>
        </div> 
        `
    }
}
window.customElements.define('mi-cabecera-admin', CabeceraAdmin);

class BotonEditar extends HTMLElement{
    constructor(){
        super()
        this.innerHTML = `<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-fill" viewBox="0 0 16 16">
        <path d="M12.854.146a.5.5 0 0 0-.707 0L10.5 1.793 14.207 5.5l1.647-1.646a.5.5 0 0 0 0-.708zm.646 6.061L9.793 2.5 3.293 9H3.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.207zm-7.468 7.468A.5.5 0 0 1 6 13.5V13h-.5a.5.5 0 0 1-.5-.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.5-.5V10h-.5a.5.5 0 0 1-.175-.032l-.179.178a.5.5 0 0 0-.11.168l-2 5a.5.5 0 0 0 .65.65l5-2a.5.5 0 0 0 .168-.11z"/>
      </svg>`
    }
}
window.customElements.define('boton-editar', BotonEditar);  

class MenuNav extends HTMLElement{
    constructor(){
        super()
        this.innerHTML = `  <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
        <div class="container-fluid">
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
              </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav col-md-12">
                    <li class="nav-item col-md-2">
                    <a class="nav-link d-flex justify-content-center" href= "inicio.html" > Inicio</a>
                    </li>
                    <li class="nav-item col-md-2">
                    <a class="nav-link d-flex justify-content-center" href= "empresa.html" > Empresa</a>
                    </li>
                    <li class="nav-item col-md-2">
                    <a class="nav-link d-flex justify-content-center" href= "Contacto.html" >Contacto</a>
                    </li>
                    <li class="nav-item col-md-2">
                    <a class="nav-link d-flex justify-content-center" href= "productos.html" >Men&uacute;</a>
                    </li>
                    <li class="nav-item col-md-2">
                    <a class="nav-link d-flex justify-content-center" href= "carrito.html" )">Carrito</a>
                    </li>
                    <li class="nav-item col-md-2">
                    <a class="nav-link d-flex justify-content-center" href= "login.html" )">Usuario</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
        `
    }
}
window.customElements.define('mi-menu', MenuNav);

class MenuNavAdmin extends HTMLElement{
    constructor(){
        super()
        this.innerHTML = `  <nav class="navbar navbar-expand-sm bg-dark navbar-dark">
        <div class="container-fluid">
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
              </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav col-md-12">
                    <li class="nav-item col-md-4">
                        <a class="nav-link d-flex justify-content-center" href= "verusuarios.html" > Usuarios</a>
                    </li>
                    <li class="nav-item col-md-4">
                        <a class="nav-link d-flex justify-content-center" href= "modificarproductos.html" > Productos</a>
                    </li>
                    <li class="nav-item col-md-4">
                        <a class="nav-link d-flex justify-content-center" href= "verpedidos.html" >Pedidos</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
        `
    }
}
window.customElements.define('mi-menu-admin', MenuNavAdmin);

class Pie extends HTMLElement {
    constructor() {
        super()
        this.innerHTML = '<footer>&copy; 2024 - Desarrollado por Rub&eacute;n Mart&iacute;nez Gonz&aacute;lez</footer>'
        
    }
}
window.customElements.define('mi-pie', Pie);
//this.innerHTML = '<footer>&copy; 2024 - Desarrollado por Rub&eacute;n Mart&iacute;nez Gonz&aacute;lez</footer>'
