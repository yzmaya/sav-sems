<%-- 
    Document   : ConciliacionOk
    Created on : 8/06/2017, 01:30:54 PM
    Author     : brayan.padilla
--%>

<%@page contentType="text/html" pageEncoding="windows-1252"%>
<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
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
            function ir(){
                window.location='/SAV/tablaConciliacion';
            }
        </script>
    </head>
    <body id="myPage" data-spy="scroll" data-target=".navbar"
          data-offset="60"><br>
    <center><button class="btn btn-danger" onclick="ir()">Salir</button></center>
    <h1><strong>Conciliación de : ${nombres} ${paterno} ${materno}</strong></h1><br>
    <div class="row">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Para descargar la informacion en formato Excel, da click en el siguiente boton:&nbsp;&nbsp;&nbsp;
        <c:url value="download/xls" var="downloadXls"/>
        <button><a href="${downloadXls}">Descargar Excel</a></button>

    </div>

    <br>

    <table class="table table-hover">
        <thead>
            <tr bgcolor="#33d6ff">
                <th></th>
                <th></th>
                <th></th>
                <th></th>
                <th></th>
                <th>ANTICIPO CHEQUE</th>
                <th>ANTICIPO CHEQUE</th>
                <th>ANTICIPO CHEQUE</th>
                <th>ANTICIPO CHEQUE</th>
                <th>ANTICIPO CHEQUE</th>
                <th>DEVENGADO</th>
                <th>DEVENGADO</th>
                <th>DEVENGADO</th>
                <th>DEVENGADO</th>
                <th></th>
                <th></th>
                <th></th>
                <th></th>
                <th></th>
            </tr>
        </thead>
        <thead>
            <tr class="info">
                <th>No.</th>
                <th>PAIS/POBLACION</th>
                <th>DEL</th>
                <th>AL</th>
                <th>No. DE CHEQUE</th>
                <th>VIATICOS</th>
                <th>GASOLINA</th>
                <th>PEAJE</th>
                <th>PASAJES TERRESTRES</th>
                <th>TOTAL</th>
                <th>VIATICOS</th>
                <th>GASOLINA</th>
                <th>PEAJE</th>
                <th>PASAJES TERRESTRES</th>
                <th>MONTO VIATICOS DEVENGADOS</th>
                <!--th>VIATICOS</th>
                <th>GASOLINA</th>
                <th>PEAJE</th>
                <th>PASAJES TERRESTRES</th>
                <th>CHEQUE CANCELADO</th>
                <th>RETIRO LA DGPyRF</th>-->
                <th>TOTAL REINTEGRADO</th>
                <th>SALDO A REINTEGRAR</th>
                <!--<th>SALDO PAGAR DEVENGADO</th>
                <th>CHEQUE 1</th>
                <th>CHEQUE 2</th>
                <th>CHEQUE 3</th>
                <th>SALDO</th>-->
                <th>OBSERVACIONES</th>
                <th>OMVI</th>
            </tr>
        </thead>
        <tbody class="buscar">

            <c:forEach var="conc" items="${valConc}">
                <tr>
                    <td>${conc.idViaje}</td>
                    <td>${conc.poblacion}</td>
                    <td>${conc.del}</td>
                    <td>${conc.al}</td>
                    <td>${conc.numCheque}</td>
                    <td>${conc.viaticosCheq}</td>
                    <td>${conc.gasolinaCheq}</td>
                    <td>${conc.peajeCheq}</td>
                    <td>${conc.pasajesTerrCheq}</td>
                    <td>${conc.totalCheq}</td>
                    <td>${conc.viaticosDev}</td>
                    <td>${conc.gasolinaDev}</td>
                    <td>${conc.peajeDev}</td>
                    <td>${conc.pasajesTerrDev}</td>
                    <td>${conc.montoViatDev}</td>
                    <td>${conc.totalReintegrado}</td>
                    <td>${conc.saldoAReintegrar}</td>
                    <!--<td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td></td>-->
                    <td>${conc.observaciones}</td>
                    <td>${conc.omvi}</td>
                </tr>
            </c:forEach>
        </tbody>

    </table>
    <center>
        <p>Para descargar la informacion en formato Excel, da click en el siguiente boton:</p>
        <br>
        <c:url value="download/xls" var="downloadXls"/>
        <button><a href="${downloadXls}">Descargar Excel</a></button><br><br>
        <button class="btn btn-danger" onclick="ir()">Salir</button>
        <br>
    </center>
</body>
</html>