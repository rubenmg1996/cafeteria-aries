<?php require_once('accesoBD.php'); ?>

<?php
    session_start();

    $_SESSION['pedidos'] = obtenerPedidos();

    if (isset($_POST['usuario']) && isset($_POST['clave'])) {

        $res_login = login();
        $mensaje_error = '';

        if ($res_login == false) {
            $mensaje_error = 'Usuario o contraseña incorrectos';
            header('Location: index.php');
            $_SESSION['msg'] = $mensaje_error;
        }else{
            $nombreusuario = $res_login['usuario']; 
            $admin = $res_login['admin'];
            $_SESSION['admin'] = $admin;
            $_SESSION['userid'] = $res_login['codigo'];

        if($admin == '0')
        {
            $mensaje_error = 'No tienes permiso de administración de la web';
            header('Location: index.php');
            $_SESSION['user'] = $nombreusuario;
            $_SESSION['msg'] = $mensaje_error;

        }else{

            $_SESSION['user'] = $nombreusuario;

            header('Location: productos.php');

        }
        }
    }

function login()
{
   $bbdd = conectar();
   $usuario = filter_input(INPUT_POST, 'usuario');
   $contrasena = filter_input(INPUT_POST, 'clave');

   $mi_consulta = mysqli_prepare($bbdd,"SELECT * FROM usuarios WHERE usuario = ? AND clave = md5(?)");
   mysqli_stmt_bind_param($mi_consulta, 'ss', $usuario, $contrasena);
   mysqli_stmt_execute($mi_consulta);
   $result = mysqli_stmt_get_result($mi_consulta);


   return mysqli_fetch_assoc($result);

}
?>