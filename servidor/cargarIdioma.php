<?php
	// Conectamos coa base de datos
	require("conexion.php");

	// Collemos os textos no idioma seleccionado
   	$consulta = "SELECT * 
				   FROM idiomas
				  WHERE idioma = '".$_GET['idioma']."'";

	$saida = array();
	if ($datos = $conexion->query($consulta))
	{   		
		$idioma = $datos->fetch_object();
		$datos->close();
		$conexion->close();
		echo json_encode($idioma);
	}	
?>