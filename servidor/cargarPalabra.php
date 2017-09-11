<?php
	// Conectamos coa base de datos
	require("conexion.php");

	// Collemos ao chou a palabra para o captcha
	$consulta = "SELECT idTraducion, ".$_GET['idioma']." AS palabra, solucion  
				   FROM traducions 
			   ORDER BY RAND()
				  LIMIT 1";
	
	$saida = array('idTraducion' => '111','palabra' => '','imaxe0' => '','imaxe1' => '','imaxe2' => '','imaxe3' => '','imaxe4' => '','imaxe5' => '');

	if ($datos = $conexion->query($consulta))
	{   		
		$palabra = $datos->fetch_object(); 
		$saida['idTraducion'] = $palabra->idTraducion;
		$saida['palabra'] = $palabra->palabra;
		$imaxes[] = $palabra->solucion;
		$datos->close();
	}
	
	// Collemos outras cinco imaxes ao chou
	$consulta = "SELECT solucion  
				   FROM traducions
				  WHERE	solucion != ".$palabra->solucion."			   
			   ORDER BY RAND()
				  LIMIT 5";
				 
	if ($datos = $conexion->query($consulta))
	{   		
		while ($imaxe = $datos->fetch_object()) 
		{
			$imaxes[] = $imaxe->solucion;
		}
		$datos->close();
	}		
	
	shuffle($imaxes);
	for ($i = 0; $i < count($imaxes); $i++) {
		$saida['imaxe'.$i] = $imaxes[$i];
	}
	$conexion->close();
	echo json_encode($saida);
?>