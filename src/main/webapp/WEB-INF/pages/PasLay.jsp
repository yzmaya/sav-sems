<%-- 
    Document   : PasLay
    Created on : 26/04/2017, 04:53:08 PM
    Author     : nestor.yzmaya
--%>

<%@page contentType="text/html" pageEncoding="windows-1252"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>PASAJES NACIONALES</title>
         <link rel="stylesheet"  href="<c:url value="/resources/css/layout.css"/>">
         <link rel="stylesheet" media="print"  href="<c:url  value="/resources/css/imprimir.css"/>">
               
        
    </head>
    <body>
        <center>
<!--Encabezado-->
<table>
	<tr>
		<td rowspan="2" class="e"><img src="<c:url value="/resources/img/logo.jpg"/>"/></td>
		<th class="e"><h2>ORDEN DE SERVICIO PARA PASAJES NACIONALES</h2></th>
	</tr>
	<tr>
		<th class="e"> </th>
	</tr>
</table>



<!--Descripción general del oficio-->
<br>
<table>
	<tr>
		<th colspan="2" id="th">UNIDAD RESPONSABLE</th>
		<td class="e"></td>
		<th colspan="4">ORDSER</th>
	</tr>
	<tr>
		<th>CLAVE</th>
		<th>DENOMINACIÓN</th>
		<td class="e" style="width: 60px;"></td>
		<th>NUMERO</th>
		<th colspan="3">FECHA</th>
	</tr>
	<tr>
		<td>600</td>
		<td>SECRETARIA DE EDUCACIÓN MEDIA SUPERIOR</td>
		<td class="e"></td>
		<td class="t"><input type="text" id="" name="" value="" size="8" disabled></td>
		<td class="t"><input type="text" id="" name="" value="" size="12" disabled></td></td>
		
	</tr>
</table>

<!-- Datos del comisionado-->


<br>
<table>
	<tr>
		<th>DATOS DE LA COMISIÓN</th>
	</tr>
	<tr>
		<th>BENEFICIARIO</th>
	</tr>
	<tr>
		<td>
		<br>
			<input type="text" id="" name="" value="" size="33" disabled>
			<input type="text" id="" name="" value="" disabled>
			<input type="text" id="" name="" value="" size="33" disabled>
			<p class="axion">NOMBRE R.F.C PUESTO</p>
			<br>
			<input type="text" id="" name="" value="" disabled>
			<input type="text" id="" name="" value="" size="70" disabled>
			<p class="axion">CLAVE AREA.DE.ADSCRIPCIÓN .</p>
		</td>
	</tr>

</table>
<br>


<!-- Detalles del oficio-->
<table >
	<tr>
		<th colspan="2">DESTINO</th>
	</tr>
	<tr>
		<td>
			<br>
			<input type="text" id="" name="" value="" size="45" disabled>
			<input type="text" id="" name="" value="" size="45" disabled>
			<p class="axion">PUNTO.DE.PARTIDA PUNTO.DE.LLEGADA </p>
			<br>
			<input type="text" id="" name="" value="" size="45" disabled>
			<input type="text" id="" name="" value="" size="45" disabled>
			<p class="axion">OTRO.DESTINO CLASE.DE.SERVICIO </p>
		</td>
	</tr>

	
</table>

<!-- Motivo y Observaciones -->

<br>
<!-- Caractetisticas y Contabilizador-->

<table>
	<tr>
		<th>OBJETO DE LA COMISIÓN</th>
		<th width="260px">SELLO DE LA UA</th>
	</tr>
	<tr>
		<td>
			<textarea rows="3" cols="71" disabled></textarea>
		</td>
		<td rowspan="3"></td>
	</tr>
	<tr>
		<th>OBSERVACIONES</th>
		
	</tr>
	<tr>
	<p></p>
		<td><textarea rows="3" cols="71" disabled></textarea></td>
		
	</tr>

</table>



<!-- Firmas -->
<br>
<table>
	<tr>
		<th colspan="6" width="480px">DOCUMENTO CONTABILIZADOR</th>
		<td class="e"></td>
		<th>TITULAR DE LA UNIDAD RESPONSABLE O SERVIDOR PÚBLICO FACULTADO</th>
	</tr>

	<tr>
		<th height="1px;">R/S</th>
		<th>UR</th>
		<th>GF</th>
		<th>FN</th>
		<th>SF</th>
		<th>RG</th>
		<td class="e"></td>
		<td rowspan="4">
			<br><br>
			LIC. DANIEL AVILA FERNANDEZ
			<br>
			NOMBRE Y FIRMA
			

		</td>
	</tr>
	<tr>
		<td class="t"><input type="text" id="" name="" value="" size="4" disabled></td>
		<td class="t"><input type="text" id="" name="" value="" size="4" disabled></td>
		<td class="t"><input type="text" id="" name="" value="" size="4" disabled></td>
		<td class="t"><input type="text" id="" name="" value="" size="4" disabled></td>
		<td class="t"><input type="text" id="" name="" value="" size="4" disabled></td>
		<td class="t"><input type="text" id="" name="" value="" size="4" disabled></td>
		<td class="e"></td>
		
	</tr>
	<tr>
		<th height="1px;">A1</th>
		<th>PP</th>
		<th colspan="2">OG</th>
		<th>TG</th>
		<th>FF</th>
		<td class="e"></td>
	
	</tr>

	<tr>
		<td class="t"><input type="text" id="" name="" value="" size="4" disabled></td>
		<td class="t"><input type="text" id="" name="" value="" size="4" disabled></td>
		<td class="t" colspan="2"><input type="text" id="" name="" value="" size="13" disabled></td>
		<td class="t"><input type="text" id="" name="" value="" size="4" disabled></td>
		<td class="t"><input type="text" id="" name="" value="" size="4" disabled></td>
		
		<td class="e"></td>
		
	</tr>
	<tr>
		<th colspan="6">IMPORTE LIQUIDO</th>

	<td class="e"></td>
	<th>COMISIONADO</th>
	
	
	</tr>

	<tr>
		<td colspan="6" height="1px"><textarea rows="5.5" cols="51" disabled></textarea></td>
		<td class="e"></td>
		<td>
		<br><br><br>
			<input type="text" id="" name="" value="" size="40" disabled>
			<BR>NOMBRE Y FIRMA

	</td>
	
	</tr>

</table>


</center>
    </body>
</html>
