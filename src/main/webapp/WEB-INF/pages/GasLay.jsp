<%-- 
    Document   : GasLay
    Created on : 26/04/2017, 02:11:31 PM
    Author     : nestor.yzmaya
--%>

<%@page contentType="text/html" pageEncoding="windows-1252"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
        <title>COMPERCO</title>
        <link rel="stylesheet"  href="<c:url value="/resources/css/layout.css"/>">
        <link rel="stylesheet" media="print"  href="<c:url  value="/resources/css/imprimir.css"/>">
    </head>
    <body>
        <center>
<!--Encabezado-->
<table>
	<tr>
            <td rowspan="2" class="e"><img src="<c:url value="/resources/img/logo.jpg"/>"/></td>
	<th class="e">GASTOS DE COMBUSTIBLE PARA EL PERSONAL COMISIONADO</th>
	</tr>
</table>

<!-- Datos Oficialia Mayor -->
<table>
	<tr>
		<td style="text-align: left;" class="e">Oficialia Mayor</td>
		<td class="e" style="width: 120px;"></td>
		<th colspan="2">FORMATO</th>
	</tr>
	<tr>
		<td class="e" style="text-align: left;">DIR GRAL DE PRESUPUESTO Y RECURSOS FINANCIEROS</td>
		<td class="e"></td>
		<th>No</th>
		<th>CLAVE</th>
	</tr>
	<tr>
		<td class="e" colspan="2"></td>
		<td>IV</td>
		<td>COMPERCO</td>
	</tr>
</table>


<!--Descripci�n general del oficio-->
<br>
<table>
	<tr>
		<th colspan="2" >UNIDAD RESPONSABLE</th>
		<td class="e"></td>
		<th colspan="4">COMPERCO</th>
	</tr>
	<tr>
		<th>CLAVE</th>
		<th>DENOMINACI�N</th>
		<td class="e" style="width: 60px;"></td>
		<th>NUMERO</th>
		<th colspan="3">FECHA</th>
	</tr>
	<tr>
		<td>600</td>
		<td>SECRETARIA DE EDUCACI�N MEDIA SUPERIOR</td>
		<td class="e"></td>
		<td class="t"><input type="text" id="" name="" value="" size="8" disabled></td>
		<td class="t"><input type="text" id="" name="" value="" size="12" disabled></td></td>
	</tr>
</table>

<!-- Datos del servidor publico-->


<br>
<table>
	<tr>
		<th>DATOS DEL SERVIDOR P�BLICO</th>
	</tr>
	<tr>
		<td><br>
			NOMBRE: <input type="text" id="" name="" value="" size="58" disabled> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			R.F.C: <input type="text" id="" name="" value="" size="20" disabled>
			<br><br>
			PUESTO O CATEGORIA: &nbsp;&nbsp;<input type="text" id="" name="" value="" size="46" disabled>&nbsp;
			CLAVE:&nbsp; <input type="text" id="" name="" value="" size="20" disabled>
			<br><br>
			AREA DE ADSCRIPCI�N: <input type="text" id="" name="" value="" size="79" disabled>&nbsp;
			
			<br><br>
		</td>
	</tr>

</table>
<br>


<!-- COMISI�N O TRABAJO A DESARROLLAR-->



<table>
	<tr>
		<th>COMISI�N O TRABAJO A DESARROLLAR</th>
		<th colspan="3">OFICIO DE COMISI�N</th>
	</tr>
	<TR>
		<td class="t" rowspan="2"><textarea rows="2" cols="77" disabled></textarea></td>
		<th>NUMERO</th>
		<th>FECHA</th>
	</TR>
	<tr>
		<td class="t"><input type="text" id="" name="" value="" size="9" disabled></td>
		<td class="t"><input type="text" id="" name="" value="" size="13" disabled></td></td>
	</tr>
</table>
<br>

<!-- Doc CONTABILIZADOR -->

<table>
	<tr>
		<th colspan="12">DOCUMENTO CONTABILIZADOR</th>
	</tr>
	<tr>
		<th colspan="11">CLAVE PRESUPUESTARIA</th>
		<th rowspan="2">IMPORTE</th>
	</tr>
	<tr>
		<td>R/S</td>
		<td>UR</td>
		<td>GF</td>
		<td>FN</td>
		<td>SF</td>
		<td>RG</td>
		<td>AI</td>
		<td>PP</td>
		<td>OG</td>
		<td>TG</td>
		<td>FF</td>
	
	</tr>
	<tr>
		<td class="t"><input type="text" id="" name="" value="" size="2" disabled></td>
		<td class="t"><input type="text" id="" name="" value="" size="2" disabled></td>
		<td class="t"><input type="text" id="" name="" value="" size="2" disabled></td>
		<td class="t"><input type="text" id="" name="" value="" size="2" disabled></td>
		<td class="t"><input type="text" id="" name="" value="" size="2" disabled></td>
		<td class="t"><input type="text" id="" name="" value="" size="2" disabled></td>
		<td class="t"><input type="text" id="" name="" value="" size="2" disabled></td>
		<td class="t"><input type="text" id="" name="" value="" size="2" disabled></td>
		<td class="t"><input type="text" id="" name="" value="" size="2" disabled></td>
		<td class="t"><input type="text" id="" name="" value="" size="2" disabled></td>
		<td class="t"><input type="text" id="" name="" value="" size="2" disabled></td>
		<td class="t"><input type="text" id="" name="" value="" size="29" disabled></td>
	</tr>
</table>

<!-- Itinerario -->
<br>
<table >
	<tr>
		<th colspan="4">ITINERARIO</th>
	</tr>
	<tr>
		<th>FECHA</th>
		<th>DE</th>
		<th>A</th>
		<th>DISTANCIA EN KM</th>
	</tr>
	<tr>
		<td class="t"><input type="text" id="" name="" value="" size="11" disabled></td>
		<td class="t"><input type="text" id="" name="" value="" size="35" disabled></td>
		<td class="t"><input type="text" id="" name="" value="" size="35" disabled></td>
		<td class="t"><input type="text" id="" name="" value="" size="11" disabled></td>
	</tr>
	<tr>
		<td class="t"><input type="text" id="" name="" value="" size="11" disabled></td>
		<td class="t"><input type="text" id="" name="" value="" size="35" disabled></td>
		<td class="t"><input type="text" id="" name="" value="" size="35" disabled></td>
		<td class="t"><input type="text" id="" name="" value="" size="11" disabled></td>
	</tr>
	<tr>
		<td class="t"><input type="text" id="" name="" value="" size="11" disabled></td>
		<td class="t"><input type="text" id="" name="" value="" size="35" disabled></td>
		<td class="t"><input type="text" id="" name="" value="" size="35" disabled></td>
		<td class="t"><input type="text" id="" name="" value="" size="11" disabled></td>
	</tr>
	<tr>
		<td class="t"><input type="text" id="" name="" value="" size="11" disabled></td>
		<td class="t"><input type="text" id="" name="" value="" size="35" disabled></td>
		<td class="t"><input type="text" id="" name="" value="" size="35" disabled></td>
		<td class="t"><input type="text" id="" name="" value="" size="11" disabled></td>
	</tr>
	<tr>
		<td class="t"><input type="text" id="" name="" value="" size="11" disabled></td>
		<td class="t"><input type="text" id="" name="" value="" size="35" disabled></td>
		<td class="t"><input type="text" id="" name="" value="" size="35" disabled></td>
		<td class="t"><input type="text" id="" name="" value="" size="11" disabled></td>
	</tr>
		<tr>
		<td class="e" colspan="2"></td>
		<td style="text-align: right;" class="e"><strong>TOTAL</strong></td>
		<td class="t"><input type="text" id="" name="" value="" size="11" disabled></td>
	</tr>

	
</table>
<br>
<!-- Calculo de Gasolina -->

<table>
	<tr>
		<th>PRECIO VIGENTE LITRO DE GASOLINA</th>
		<th style="width: 320px;">LITROS DE GASOLINA</th>
		<th style="width: 320px;">IMPORTE</th>
	</tr>
	<tr>
		<td class="t"><input type="text" id="" name="" value="" size="14" disabled>
		<br>LTS DE GAS
		</td>

		<td class="t"><input type="text" id="" name="" value="" size="17" disabled> / 
		<input type="text" id="" name="" value="" size="17" disabled>
		<br>KM RECORRIDOS &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; LITROS DE GAS
		</td>


		<td class="t"><input type="text" id="" name="" value="" size="9" disabled> * 
		<input type="text" id="" name="" value="" size="9" disabled> = 
		<input type="text" id="" name="" value="" size="9" disabled>
		<br>LTS. DE GAS &nbsp;&nbsp;&nbsp; $ VIGENTE LT/GAS  &nbsp;&nbsp;&nbsp;&nbsp; IMPORTE

		</td>

	</tr>
</table>



<!-- Firmas -->
<br>
<table>
	<tr>
		<th style="width: 400px;">RECIBI LA CANTIDAD DE: $</th>
		<th>TITULAR DE LA UR O SERVIDOR P�BLICO FACULTADO</th>
	</tr>
	<tr>
		<td>
			<br><br><br><br>
			<input type="text" id="" name="" value="" size="40" disabled>
			<BR><article>NOMBRE Y FIRMA DEL SERVIDOR P�BLICO O COMISIONADO</article>
			<br>
		</td>
		<td>
		<br><br><br><br>
		<article>LIC. DANIEL AVILA FERNANDEZ
		<br>NOMBRE Y FIRMA
		</article>	
		</td>
	</tr>
</table>


</center>
    </body>
</html>