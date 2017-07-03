<%-- 
    Document   : conciliacion
    Created on : 5/06/2017, 01:42:54 PM
    Author     : brayan.padilla
--%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html lang="es">
    <head>
        <title>CONCILIACION</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link rel="stylesheet" type="text/css" href="resources/css/web.css"/>

        <script>
            function modificar(code){
                document.getElementById("aqui").innerHTML = code;
            }

        </script>
    </head>
    <body id="myPage" data-spy="scroll" data-target=".navbar"
          data-offset="60">

        <nav class="navbar navbar-default navbar-fixed-top">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse"
                            data-target="#myNavbar">
                        <span class="icon-bar"></span> <span class="icon-bar"></span> <span
                            class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#myPage">SAV</a>
                </div>
                <div class="collapse navbar-collapse" id="myNavbar">
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="index.html">INICIO</a></li>
                        <li><a href="opcionesConciliaciones">CONCILIACIONES</a></li>
                        <li><a href="comissioner">COMISIONADOS</a></li>
                        <li><a href="omvi">OMVI</a></li>
                        <li><a href="#"><span class="glyphicon glyphicon-user"></span>
                                Sign Up</a></li>
                        <li><a href="#"><span class="glyphicon glyphicon-log-in"></span>
                                Login</a></li>
                    </ul>
                </div>
            </div>
        </nav>

        <div class="container-fluid">
            <h2>COMISIONADOS</h2>
            <!--Aqui tenemos el buscador-->
            <div class="input-group">
                <span class="input-group-addon"> 
                    <i class="glyphicon glyphicon-user"></i> Buscar
                </span> 
                <input id="filtrar" type="text" class="form-control" placeholder="Ingresa la palabra clave a buscar">
            </div>
            <table class="table table-hover">
                <thead>
                    <tr class="info">
                        <th>NOMBRE</th>
                        <th>ACCIONES</th>
                    </tr>
                </thead>
                <tbody class="buscar">
                    <c:forEach var="user" items="${listaUsersConciliacion}">
                        <tr>
                            <td>${user.nombre_s} ${user.ap_Paterno} ${user.ap_Materno} </td>
                            <td><a href="generarExcelConciliacion?pat=${user.ap_Paterno}&mat=${user.ap_Materno}&nom=${user.nombre_s}">Generar Conciliacion</a></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

        </div>

        <footer class="container-fluid text-center">
            <a href="#myPage" title="To Top"> <span
                    class="glyphicon glyphicon-chevron-up"></span>
            </a>
        </footer>

        <script>

            //buscar en la tabla

            $(document).ready(function () {

                (function ($) {

                    $('#filtrar').keyup(function () {

                        var rex = new RegExp($(this).val(), 'i');
                        $('.buscar tr').hide();
                        $('.buscar tr').filter(function () {
                            return rex.test($(this).text());
                        }).show();

                    })

                }(jQuery));

            });


            //termina
            $(document).ready(function(){
                // Add smooth scrolling to all links in navbar + footer link
                $(".navbar a, footer a[href='#myPage']").on('click', function(event) {
                    // Make sure this.hash has a value before overriding default behavior
                    if (this.hash !== "") {
                        // Prevent default anchor click behavior
                        event.preventDefault();

                        // Store hash
                        var hash = this.hash;

                        // Using jQuery's animate() method to add smooth page scroll
                        // The optional number (900) specifies the number of milliseconds it takes to scroll to the specified area
                        $('html, body').animate({
                            scrollTop: $(hash).offset().top
                        }, 900, function(){
   
                            // Add hash (#) to URL when done scrolling (default click behavior)
                            window.location.hash = hash;
                        });
                    } // End if
                });
  
                $(window).scroll(function() {
                    $(".slideanim").each(function(){
                        var pos = $(this).offset().top;

                        var winTop = $(window).scrollTop();
                        if (pos < winTop + 600) {
                            $(this).addClass("slide");
                        }
                    });
                });
            })
        </script>

    </body>
</html>