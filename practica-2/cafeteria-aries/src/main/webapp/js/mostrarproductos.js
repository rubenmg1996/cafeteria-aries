const $novedades = document.getElementById('novedades');
const $bebidas = document.getElementById('bebidas');
const $aperitivos = document.getElementById('aperitivo');
const $platos = document.getElementById('plato');
const $ensaladas = document.getElementById('ensaladas');
const $pizzas = document.getElementById('pizzas');
const $hamburguesas = document.getElementById('hamburguesas');
const $bocadillos = document.getElementById('bocadillos');
const $postres = document.getElementById('postres');

mostrar($novedades);

function mostrar($elemento)
{
    $novedades.style.display = 'none';
    $bebidas.style.display = 'none';
    $aperitivos.style.display = 'none';
    $platos.style.display = 'none';
    $ensaladas.style.display = 'none';
    $pizzas.style.display = 'none';
    $hamburguesas.style.display = 'none';
    $bocadillos.style.display = 'none';
    $postres.style.display = 'none';

    $elemento.style.display = 'block';
}