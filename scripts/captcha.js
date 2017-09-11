$(function() {
    var idioma = "galego";
    var palabra = "";
    //cambia o desenrolador
    $("p:contains('2015')").text("2017 Desenvolvido por Nicolás Cortizo");
    //carga o idioma Galego de inicio
    $.getJSON("servidor/cargarIdioma.php", {
        idioma: idioma
    }).done(function(datos) {
        $("#tituloInstrucion").text(datos.tituloInstrucion);
        $("#textoInstrucion").text(datos.textoInstrucion);

    }).fail(function(jqXHR, textStatus, error) {
        alert("non conecta a taboa idiomas");
    });

    cargarPalabra();

    /******************************************************************************************
     *** cambiarIdioma 	      																***
     ***	Cambia o idioma desactivando a icona correspondente									***
     *******************************************************************************************/
    $(document).on("click", "figure.idioma img", function() {
        //mete en idioma o id da figura idioma
        idioma = $(this).attr("id");

        //engade a cada figure a imaxe
        $("figure.idioma img").each(function() {
            $(this).attr("src", "./imaxes/bandeiras/" + $(this).attr("id") + ".png");
        });

        //desactiva a imaxe seleccionada
        $("#" + idioma).attr("src", "./imaxes/bandeiras/" + idioma + "-inactivo.png");
        //usa a funcion pa cambiar idioma
        cambiarIdioma();
    });

    function cambiarIdioma() {

        $.getJSON("servidor/cargarIdioma.php", {
            idioma: idioma
        }).done(function(datos) {
            $("#tituloInstrucion").text(datos.tituloInstrucion);
            $("#textoInstrucion").text(datos.textoInstrucion);

        }).fail(function(jqXHR, textStatus, error) {
            alert("non conecta a taboa idiomas");
        });
        //traducir palabra do cadrado
        traducirPalabra();
    }

    /******************************************************************************************
     *** cargarPalabra 	      																***
     ***	Amosar a palabra a buscar e as 6 imaxes relacionadas								***
     *******************************************************************************************/
    function cargarPalabra() {
        $.getJSON("servidor/cargarPalabra.php", {
                idioma: idioma
            }).done(function(datos) {
                im = '';

								//dalle un valor a cada imaxe dentro do rango de numeros
                $.each(datos, function(indice, numero) {

                    switch (indice) {
                        //colle na base de datos a columna idTraduccion
                        case "idTraducion":
                            palabra = numero;
                            break;
                        case "palabra":
                            $("#palabra").text(numero);
                            break;
                            //carga as imaxes a escoller
                        default:
                            im += "<figure class='animal'>" +
                                "<img codigo='" + numero + "' class='animal' src='./imaxes/animais/" + numero + ".png'></figure>";
                            break;
                    }
                });
                //ponlle as imaxes o id #imaxes
                $("#imaxes").html(im);

                //imaxe podese arrastrar
                $("img.animal").draggable({
                    helper: 'clone'
                });

                //zona de recepción da imaxe activada con drop
                $("#solucion").droppable({
                    accept: "img.animal",
										//mira que o codigo sexa igual
                    drop: function(event, ui) {
                        codigo = ui.draggable.attr('codigo');


                        $.getJSON("servidor/comprobarPalabra.php", {
                                palabra: palabra
                            }).done(function(datos) {
                                //Comproba que a imaxe sexa correcta
                                if (datos.solucion == codigo) {
                                    //Inclue unha imaxe de correcto
                                    $("#solucion").append("<figure id='N'><img src='./imaxes/correcto.png'></figure>");

                                } else {
                                    //Inclue unha imaxe de incorrecto
                                    $("#solucion").append("<figure id='borra'><img src='./imaxes/incorrecto.png'></figure>");
																		//cambia as imaxes e a palabra despois de 2 segundos
																		setTimeout(function() {
																				$("#borra").remove();
																				cargarPalabra();
																		}, 2000);
																}


                            })
                            .fail(function(jqXHR, textStatus, error) {
                                alert("non conecta a taboa traduccions");
                            });
                    }
                });
            })
            .fail(function(jqXHR, textStatus, error) {
                alert("non conecta a taboa traduccions");
            });
    }

    //traduce a palabra a buscar
    function traducirPalabra() {
        $.getJSON("servidor/traducirPalabra.php", {
                idioma: idioma,
                palabra: palabra
            }).done(function(datos) {
                $("#palabra").text(datos.palabra);
            })
            .fail(function(jqXHR, textStatus, error) {
                alert("non conecta a taboa traduccions");
            });
    }
});
