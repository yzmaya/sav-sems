<%@page pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.io.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

        <title>GENERAR CONCILIACION</title>
    </head>
    <body>

        <br><br><br><br>
        <div class="container">
            <div class="row">
                <div class="panel panel-default">
                    <div class="panel-heading text-center">GENERACION DE CONCICLIACIONES</div>
                    <div class="panel-body">
                        <div class="row">
                            <label class=" control-label col-md-6">1.- Selecciona el archivo excel correspondiente a tu base de datos.</label>
                        </div>

                        <div class="row">
                            <label class=" control-label col-md-6">2.- Da click en el boton <strong>Generar</strong>.</label>
                        </div>
                        <br><br><br>
                        <div class="row">
                            <center>
                                <form method="POST" action="generarExcelConciliacion" enctype="multipart/form-data">
                                    <input type="hidden" id="nombre" name="nombre" value="${nombre}">
                                    <input type="hidden" id="paterno" name="paterno" value="${paterno}">
                                    <input type="hidden" id="materno" name="materno" value="${materno}">
                                    <div class="panel panel-default col-md-8 col-md-offset-2">
                                        <div class="panel-heading">DATOS PARA GENERAR LA CONCILIACIÓN</div>
                                        <div class="panel-body">
                                            <input type="file" name="file" accept="application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"/><br><br>
                                            <label class="control-label">Usted va a generar la conciliacion correspondiente a: ${nombre} ${paterno} ${materno}</label><br><br><br>
                                            <input type="submit" value="Generar" />
                                        </div>
                                    </div>
                                </form>
                            </center>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>