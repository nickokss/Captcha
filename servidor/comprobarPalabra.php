<?php
	// Conectamos coa base de datos
	require("conexion.php");

	// Comprobamos que a imaxe é correcta
	$consulta = "SELECT solucion  
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