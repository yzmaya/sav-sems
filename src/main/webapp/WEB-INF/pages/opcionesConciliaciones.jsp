<%-- 
    Document   : opcionesConciliaciones
    Created on : 26/06/2017, 04:52:24 PM
    Author     : brayan.padilla
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <style>
            #panel-default{
                height: 100px;
            }
        </style>

        <title>Opciones para generar conciliacion</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

        <link rel="stylesheet" type="text/css" href="resources/css/jquery-ui-1.7.2.custom.css" />
        <!-- <link rel="stylesheet" type="text/css" href="resources/css/web.css" /> -->
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.2/jquery-ui.min.js"></script>

        <script>
            function ir(){
                window.location='/SAV/tablaConciliacion';
            }
            
            function irInicio(){
                window.location='/SAV';
            }
            
        </script>

    </head>
    <body>
        <div class="container">
            <h2>Generador de Conciliaciones.</h2>
            <div class="row">
                <form method="POST" action="cargarArchivoExcel" enctype="multipart/form-data">
                    <div class="panel panel-default col-md-6" style="height:300px">
                        <div class="panel-heading text-center">CARGAR BASE DE DATOS EN EXCEL</div>
                        <div class="panel-body">
                            <p>Cargar base de datos en formato Excel para generar las conciliaciones.</p><br>
                            <p>1.- Selecciona el archivo de Excel correspondiente a la base de datos.</p>
                            <p>2.- Click en el boton "Cargar Archivo".</p><br>

                            <center>
                                <label>${respuesta}</label>
                                <input type="file" id="file" name="file" accept="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"/><br>
                                <input class="btn btn-info" type="submit" value="Cargar Archivo"/>
                            </center>
                        </div>
                    </div>
                </form>

                <div class="panel panel-default col-md-6" style="height:300px">
                    <div class="panel-heading text-center">LISTA DE COMISIONADOS</div>
                    <div class="panel-body">
                        <p>Mostrar la lista de los comisionados para generar la conciliacion correspondiente.</p><br>
                        <p>1.- Una vez cargado el archivo, dar click en el boton "Mostrar Lista".</p>
                        <p>2.- Click en "Generar Conciliacion" para generar la conciliacion correspondiente al comisionado.</p><br><br><br>
                        <center><button class="btn btn-info" onclick="ir()">Mostrar Lista</button></center>
                    </div>
                </div>

            </div>
            <div class="row">
                <center><button class="btn btn-danger" onclick="irInicio()">Cancelar</button></center>
            </div>
        </div>

    </body>
</html>