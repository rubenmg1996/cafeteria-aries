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
            <div class="col-sm-8 p-4 text-center titulo">
                <h1>Cafeter&iacute;a Aries</h1>
            </div>
            <div class="col-sm-2 p-4 text-center titulo"> 
                <form>
                    <button class="botonLogout" type=submit formaction="./logout.php">
                    <img width="40" height="40" style="background-color: #E96B6B;" src="./media/cerrar-sesion.png">
                    </button>
                </form>
            </div>
            </div>
        </div> 
        <div class="container-fluid">
        <div class="row bg-warning">
            <div class="col-12 text-center">
            <h5>Zona de administraci&oacute;n</h5>
        </div>
        </div>
                </div>
        `
    }
}
window.customElements.define('mi-cabecera-admin', CabeceraAdmin);


class CabeceraAdminLogin extends HTMLElement {
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
        <div class="container-fluid">
        <div class="row bg-warning">
            <div class="col-12 text-center">
            <h5>Zona de administraci&oacute;n</h5>
        </div>
        </div>
                </div>
        `
    }
}
window.customElements.define('mi-cabecera-admin-login', CabeceraAdminLogin);

class BotonEditar extends HTMLElement{
    constructor(){
        super()
        this.innerHTML = `<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-fill" viewBox="0 0 16 16">
        <path d="M12.854.146a.5.5 0 0 0-.707 0L10.5 1.793 14.207 5.5l1.647-1.646a.5.5 0 0 0 0-.708zm.646 6.061L9.793 2.5 3.293 9H3.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.5h.5a.5.5 0 0 1 .5.5v.207zm-7.468 7.468A.5.5 0 0 1 6 13.5V13h-.5a.5.5 0 0 1-.5-.5V12h-.5a.5.5 0 0 1-.5-.5V11h-.5a.5.5 0 0 1-.5-.5V10h-.5a.5.5 0 0 1-.175-.032l-.179.178a.5.5 0 0 0-.11.168l-2 5a.5.5 0 0 0 .65.65l5-2a.5.5 0 0 0 .168-.11z"/>
      </svg>`
    }
}
window.customElements.define('boton-editar', BotonEditar);  

class BotonOk extends HTMLElement {
    constructor() {
        super();
        this.innerHTML = `<svg version="1.1"
        id="svg2" inkscape:version="0.48.4 r9939" sodipodi:docname="ok-sign.svg" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:cc="http://creativecommons.org/ns#" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#" xmlns:svg="http://www.w3.org/2000/svg" xmlns:sodipodi="http://sodipodi.sourceforge.net/DTD/sodipodi-0.dtd" xmlns:inkscape="http://www.inkscape.org/namespaces/inkscape"
        xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
        viewBox="0 0 1200 1200" enable-background="new 0 0 1200 1200" xml:space="preserve"
        width="16px" height="16px" fill="currentColor">
   <path id="path15313" inkscape:connector-curvature="0" d="M600,0C268.629,0,0,268.629,0,600s268.629,600,600,600
       s600-268.629,600-600S931.371,0,600,0z M857.446,281.03l124.658,124.658L592.749,795.117L468.823,918.97L344.165,794.312
       l-126.27-126.343l123.853-123.853l126.27,126.343L857.446,281.03z"/>
   </svg>`;
    }
}
window.customElements.define('boton-ok', BotonOk);

class BotonAnadir extends HTMLElement {
    constructor() {
        super();
        this.innerHTML = `
        <svg xmlns="http://www.w3.org/2000/svg" width="32" height="32" fill="currentColor" viewBox="0 0 14 14">
          <path fill-rule="evenodd" d="M7,13 C3.6862915,13 1,10.3137085 1,7 C1,3.6862915 3.6862915,1 7,1 C10.3137085,1 13,3.6862915 13,7 C13,10.3137085 10.3137085,13 7,13 Z M8,8 L10,8 C10.5522847,8 11,7.55228475 11,7 C11,6.44771525 10.5522847,6 10,6 L8,6 L8,4 C8,3.44771525 7.55228475,3 7,3 C6.44771525,3 6,3.44771525 6,4 L6,6 L4,6 C3.44771525,6 3,6.44771525 3,7 C3,7.55228475 3.44771525,8 4,8 L6,8 L6,10 C6,10.5522847 6.44771525,11 7,11 C7.55228475,11 8,10.5522847 8,10 L8,8 Z"/>
        </svg>
        `;
    }
}
window.customElements.define('boton-anadir', BotonAnadir);

class BotonX extends HTMLElement {
    constructor() {
        super();
        this.innerHTML = `
        
            <svg xmlns="http://www.w3.org/2000/svg" width="18px" height="18px" focusable="false" viewBox="0 0 12 12">
            <path fill="currentColor" d="M5.5 1C2.46 1 0 3.46 0 6.5S2.46 12 5.5 12 11 9.54 11 6.5 8.54 1 5.5 1zm2.44 7.06c.24.24.24.64 0 .88-.12.12-.28.18-.44.18s-.32-.06-.44-.18L5.5 7.38 3.94 8.94c-.12.12-.28.18-.44.18s-.32-.06-.44-.18a.628.628 0 010-.88L4.62 6.5 3.06 4.94c-.24-.24-.24-.64 0-.88s.64-.24.88 0L5.5 5.62l1.56-1.56c.24-.24.64-.24.88 0s.24.64 0 .88L6.38 6.5l1.56 1.56z"/>
            </svg>

        `;
    }
}
window.customElements.define('boton-x', BotonX);

class BotonBorrar extends HTMLElement {
    constructor() {
        super();
        this.innerHTML = `<svg version="1.1" id="Capa_1" width="16" height="16" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
        viewBox="0 0 268.476 268.476" style="enable-background:new 0 0 268.476 268.476;" xml:space="preserve">
   <g id="Delete__x2F__Trash" fill="currentColor">
       <path style="fill-rule:evenodd;clip-rule:evenodd;" d="M63.119,250.254c0,0,3.999,18.222,24.583,18.222h93.072
           c20.583,0,24.582-18.222,24.582-18.222l18.374-178.66H44.746L63.119,250.254z M170.035,98.442c0-4.943,4.006-8.949,8.949-8.949
           c4.943,0,8.95,4.006,8.95,8.949l-8.95,134.238c0,4.943-4.007,8.949-8.949,8.949c-4.942,0-8.949-4.007-8.949-8.949L170.035,98.442z
            M125.289,98.442c0-4.943,4.007-8.949,8.949-8.949c4.943,0,8.949,4.006,8.949,8.949v134.238c0,4.943-4.006,8.949-8.949,8.949
           c-4.943,0-8.949-4.007-8.949-8.949V98.442z M89.492,89.492c4.943,0,8.949,4.006,8.949,8.949l8.95,134.238
           c0,4.943-4.007,8.949-8.95,8.949c-4.942,0-8.949-4.007-8.949-8.949L80.543,98.442C80.543,93.499,84.55,89.492,89.492,89.492z
            M218.36,35.811h-39.376V17.899C178.984,4.322,174.593,0,161.086,0L107.39,0C95.001,0,89.492,6.001,89.492,17.899v17.913H50.116
           c-7.914,0-14.319,6.007-14.319,13.43c0,7.424,6.405,13.431,14.319,13.431H218.36c7.914,0,14.319-6.007,14.319-13.431
           C232.679,41.819,226.274,35.811,218.36,35.811z M161.086,35.811h-53.695l0.001-17.913h53.695V35.811z"/>
   </g>
   <g>
   </g>
   <g>
   </g>
   <g>
   </g>
   <g>
   </g>
   <g>
   </g>
   <g>
   </g>
   <g>
   </g>
   <g>
   </g>
   <g>
   </g>
   <g>
   </g>
   <g>
   </g>
   <g>
   </g>
   <g>
   </g>
   <g>
   </g>
   <g>
   </g>
   </svg>
   
        `;
    }
}
window.customElements.define('boton-borrar', BotonBorrar);





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
                    <a class="nav-link d-flex justify-content-center" href= "menu.html" >Men&uacute;</a>
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
                        <a class="nav-link d-flex justify-content-center" href= "./usuarios.php" > Usuarios</a>
                    </li>
                    <li class="nav-item col-md-4">
                        <a class="nav-link d-flex justify-content-center" href= "./productos.php" > Productos</a>
                    </li>
                    <li class="nav-item col-md-4">
                        <a class="nav-link d-flex justify-content-center" href= "./pedidos.php" >Pedidos</a>
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
        this.innerHTML = '<footer>&copy; 2024 - Desarrollado por Rubén Martínez González</footer>'
        
    }
}
window.customElements.define('mi-pie', Pie);
//this.innerHTML = '<footer>&copy; 2024 - Desarrollado por Rubén Martínez González</footer>'
