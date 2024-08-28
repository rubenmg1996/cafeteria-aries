/**
 * 
 */
var carrito = []; // Array que contendrá los objetos.

class Producto
{
	constructor(codigo=null, nombre=null, cantidad = 0, precio = 0) 
	{
		if(codigo==null || nombre == null || cantidad == 0 || precio == 0)
		{
			throw new Error('Algún parámetro es nulo')
		}
		this.codigo = codigo;
		this.nombre = nombre;
		this.cantidad = cantidad;
		this.precio = precio;
	}
}

let cadena = localStorage.getItem('carrito');
if (cadena !== null) {
  carrito = JSON.parse(cadena);
}



function anyadirProd(codigo, nombre, cantidad, precio, stock) {
  console.log("cantidad: " + cantidad + " stock: " + stock );
  if (stock >= cantidad) 
  {
    let cadena = localStorage.getItem("carrito");

    if (cadena !== null) {
      carrito = JSON.parse(cadena);
    }

    let encontrado = false;

    for (let i = 0; i < carrito.length; i++) {
      if (carrito[i].codigo === codigo) {
        carrito[i].cantidad += +cantidad;
        encontrado = true;
        break;
      }
    }

    if (!encontrado) {
      let prod = {
        codigo: codigo,
        nombre: nombre,
        cantidad: +cantidad,
        precio: precio
      };
      carrito.push(prod);
    }

    cadena = JSON.stringify(carrito);
    localStorage.setItem("carrito", cadena);
    alert("Producto a&ntilde;adido al carrito");
  }else{
    alert("No hay suficiente stock, solo disponemos de "+ stock + " unidades.");
  }
  

}

function incrementarProd(codigo) {

  let cadena = localStorage.getItem("carrito");
  let carrito = JSON.parse(cadena);
  for (let i = 0; i < carrito.length; i++) {
    if (carrito[i].codigo == codigo) {
      carrito[i].cantidad++;
      encontrado = true;
      break;
    }
  }

  cadena = JSON.stringify(carrito);
  localStorage.setItem("carrito", cadena);

  mostrarCarrito();
}

function decrementarProd(codigo) {
  let cadena = localStorage.getItem("carrito");
  let carrito = JSON.parse(cadena);

  for (let i = 0; i < carrito.length; i++) {
    if (carrito[i].codigo == codigo) {
      if (carrito[i].cantidad > 1) {
        carrito[i].cantidad--;
      } else {
        carrito.splice(i, 1);
      }
      break;
    }
  }

  cadena = JSON.stringify(carrito);
  localStorage.setItem("carrito", cadena);

  mostrarCarrito();
}

function borrarProd(codigo)
{
	  let cadena = localStorage.getItem("carrito");
  let carrito = JSON.parse(cadena);

  for (let i = 0; i < carrito.length; i++) {
    if (carrito[i].codigo == codigo) {
      
        carrito.splice(i, 1);
      
      break;
    }

	}
	localStorage.setItem("carrito", JSON.stringify(carrito));
	mostrarCarrito();
}


function mostrarCarrito() {

  let cadena = localStorage.getItem("carrito");
  let cuerpo = document.getElementById('tablaCarrito');
  let tabla = document.getElementById('tablaCompleta');
  let cuerpoHTML = document.getElementById('cuerpoCarrito');
    
  cuerpo.innerHTML = ''; // Limpiamos el contenido de la tabla

  let productos = JSON.parse(cadena);
  let total = 0;
  

  if(productos)
  {
    for (let item of productos) { // Recorremos los productos
      let row = cuerpo.insertRow(0);
      let cell1 = row.insertCell(0);
      let cell2 = row.insertCell(1);
      let cell3 = row.insertCell(2);
      let cell4 = row.insertCell(3);
      let cell5 = row.insertCell(4);
  
      cell1.innerHTML = item.nombre;
      cell2.innerHTML = item.precio + " &euro;";
      cell3.innerHTML = item.cantidad;
      cell4.innerHTML = item.precio * item.cantidad + " &euro;";
      cell5.innerHTML = createIncreaseButton(item.codigo) + createDecreaseButton(item.codigo) + createDeleteButton(item.codigo);
  
      total += item.precio * item.cantidad;
    }
  }
  
  let pie = document.getElementById('TotalCarrito');
  pie.innerHTML = total + " &euro;";
}

 function limpiarCarrito() {
  
    const tablaCarrito = document.getElementById('tablaCarrito');
    tablaCarrito.innerHTML = '<tr><td></td><td></td><td></td><td></td></tr>';

    const totalCarrito = document.getElementById('TotalCarrito');
    totalCarrito.innerText = '0';
  

    carrito = [];

    localStorage.removeItem('carrito');
  }

function createDeleteButton(codigo) {
  return '<a class="botonMas" href="javascript:void(0);" onclick="borrarProd(\'' + codigo + '\')"><img  src="./media/borrar.png"></a>';
}

function createIncreaseButton(codigo) {
  return '<a class="botonMas" href="javascript:void(0);" onclick="incrementarProd(\'' + codigo + '\')"><img  src="./media/boton-agregar.png"></a>';
}

function createDecreaseButton(codigo)
{
	return '<a class="botonMas" href="javascript:void(0);" onclick="decrementarProd(\'' + codigo +'\')"><img src="./media/cerca.png"></a>';
}
