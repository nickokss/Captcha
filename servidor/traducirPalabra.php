<?php
	// Conectamos coa base de datos
	require("conexion.php");

	// Traducimos a palabra para o captcha

	$consulta = "SELECT ".$_GET['idioma']." AS palabra  
				   FROM traducions 
				  WHERE idTraducion = ".$_GET['palabra'];
				 
	if ($datos = $conexion->query($consulta))
	{   		
		$palabra = $datos->fetch_object();
		$datos->close();
		$conexion->close();
		echo json_encode($palabra);
	}	
?>