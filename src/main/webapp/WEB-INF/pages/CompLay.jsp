<%-- 
    Document   : CompLay
    Created on : 26/04/2017, 04:53:43 PM
    Author     : nestor.yzmaya
--%>

<%@page contentType="text/html" pageEncoding="windows-1252"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<html>
<head>
	<title>COMPROBACIÓN DE VIATICOS</title>
	 <link rel="stylesheet"  href="<c:url value="/resources/css/layout.css"/>">
        <link rel="stylesheet" media="print"  href="<c:url  value="/resources/css/imprimir.css"/>">
</head>
<body>

<center>
<!--Encabezado-->
<table>
	<tr>
		<td rowspan="2" class="e"><img src="<c:url value="/resources/img/logo.jpg"/>"/></td>
	<th class="e">ANEXO III Oficio No. 710.2016.2853/2016
	<p>COMPROBACIÓN DE VIATICOS</p>
	</th>
	</tr>
</table>

<table>
	<tr>
		<th>OC/OMVI No. </th>
		<td class="t"><input type="text" id="omvi" name="omvi" value="${omvi.id_OMVI}" size="12" disabled></td>
		<td class="e" style="width: 541px"></td>
	</tr>
</table>

<br>
<!-- Datos Oficialia Mayor -->
<table>
	<tr>
		<th colspan="2">UNIDAD RESPONSABLE</tH>
		<td  style="width: 320px;"  class="e"></td>
		<th colspan="2" width="28%">FORMATO</th>
	</tr>
	<tr>
		<th >CLAVE</th>
		<th width="15%">DENOMINACIÓN</th>
		<td  class="e"></td>
		<th>NÚMERO</th>
		<th>FECHA</th>
	</tr>
	<tr>
		<td>600</td>
		<td>SEMS</td>
		<td class="e"></td>
		<td class="t"><input type="text" id="omviformato" name="omviformato" value="${omvi.id_OMVI}" size="10" disabled></td>
		<td class="t"><input type="text" id="fechaFormato" name="fechaFormato" value="${omvi.fecha_OMVI}" size="10" disabled></td>
	</tr>
</table>


<!--Descripción general del oficio-->
<br>
<table>
	<tr>
		<td style="width: 569px" class="e"></td>
		<th colspan="2">MINISTRACIÓN DE VIATICOS</th>
	</tr>
	<tr>
		<td class="e"></td>
		<th>TOTAL</th>
		<td class="t"><input type="text" id="totalMinViat" name="totalMinViat" value="" size="10" disabled></td>
	</tr>
</table>



<!-- Itinerario -->
<br>
<table>
<tr>
	<td class="e" colspan="4" style="text-align: left;">DOCUMENTACIÓN CON REQUISITOS FISCALES</td>
	<td class="e" style="width: 207px;"></td>
	<th>TOTAL</th>
	<td class="t"><input type="text" id="" name="" value="" size="10" ></td>
</tr>
<tr>
	<th>FECHA</th>
	<th>No FACTURA</th>
	<th>CONCEPTO</th>
	<th>PARTIDA</th>
	<th colspan="2">OBSERVACIONES</th>
	<th>IMPORTE</th>
</tr>
<tr>
	<td class="t"><input type="text" id="" name="" value="" size="7" ></td>
	<td class="t"><input type="text" id="" name="" value="" size="7" ></td>
	<td class="t"><input type="text" id="" name="" value="" size="10" ></td>
	<td class="t"><input type="text" id="" name="" value="" size="7" ></td>
	<td class="t" colspan="2"><input type="text" id="" name="" value="" size="41" ></td>
	<td class="t"><input type="text" id="" name="" value="" size="9" ></td>
</tr>
<tr>
	<td class="t"><input type="text" id="" name="" value="" size="7" ></td>
	<td class="t"><input type="text" id="" name="" value="" size="7" ></td>
	<td class="t"><input type="text" id="" name="" value="" size="10" ></td>
	<td class="t"><input type="text" id="" name="" value="" size="7" ></td>
	<td class="t" colspan="2"><input type="text" id="" name="" value="" size="41" ></td>
	<td class="t"><input type="text" id="" name="" value="" size="9" ></td>
</tr>
<tr>
	<td class="t"><input type="text" id="" name="" value="" size="7" ></td>
	<td class="t"><input type="text" id="" name="" value="" size="7" ></td>
	<td class="t"><input type="text" id="" name="" value="" size="10" ></td>
	<td class="t"><input type="text" id="" name="" value="" size="7" ></td>
	<td class="t" colspan="2"><input type="text" id="" name="" value="" size="41" ></td>
	<td class="t"><input type="text" id="" name="" value="" size="9" ></td>
</tr>
<tr>
	<td class="t"><input type="text" id="" name="" value="" size="7" ></td>
	<td class="t"><input type="text" id="" name="" value="" size="7" ></td>
	<td class="t"><input type="text" id="" name="" value="" size="10" ></td>
	<td class="t"><input type="text" id="" name="" value="" size="7" ></td>
	<td class="t" colspan="2"><input type="text" id="" name="" value="" size="41" ></td>
	<td class="t"><input type="text" id="" name="" value="" size="9" ></td>
</tr>
<tr>
	<td class="t"><input type="text" id="" name="" value="" size="7" ></td>
	<td class="t"><input type="text" id="" name="" value="" size="7" ></td>
	<td class="t"><input type="text" id="" name="" value="" size="10" ></td>
	<td class="t"><input type="text" id="" name="" value="" size="7" ></td>
	<td class="t" colspan="2"><input type="text" id="" name="" value="" size="41" ></td>
	<td class="t"><input type="text" id="" name="" value="" size="9" ></td>
</tr>
<tr>
	<td class="t"><input type="text" id="" name="" value="" size="7" ></td>
	<td class="t"><input type="text" id="" name="" value="" size="7" ></td>
	<td class="t"><input type="text" id="" name="" value="" size="10" ></td>
	<td class="t"><input type="text" id="" name="" value="" size="7" ></td>
	<td class="t" colspan="2"><input type="text" id="" name="" value="" size="41" ></td>
	<td class="t"><input type="text" id="" name="" value="" size="9" ></td>
</tr>
<tr>
	<td class="t"><input type="text" id="" name="" value="" size="7" ></td>
	<td class="t"><input type="text" id="" name="" value="" size="7" ></td>
	<td class="t"><input type="text" id="" name="" value="" size="10" ></td>
	<td class="t"><input type="text" id="" name="" value="" size="7" ></td>
	<td class="t" colspan="2"><input type="text" id="" name="" value="" size="41" ></td>
	<td class="t"><input type="text" id="" name="" value="" size="9" ></td>
</tr>
<tr>
	<td class="t"><input type="text" id="" name="" value="" size="7" ></td>
	<td class="t"><input type="text" id="" name="" value="" size="7" ></td>
	<td class="t"><input type="text" id="" name="" value="" size="10" ></td>
	<td class="t"><input type="text" id="" name="" value="" size="7" ></td>
	<td class="t" colspan="2"><input type="text" id="" name="" value="" size="41" ></td>
	<td class="t"><input type="text" id="" name="" value="" size="9" ></td>
</tr>
<tr>
	<td class="t"><input type="text" id="" name="" value="" size="7" ></td>
	<td class="t"><input type="text" id="" name="" value="" size="7" ></td>
	<td class="t"><input type="text" id="" name="" value="" size="10" ></td>
	<td class="t"><input type="text" id="" name="" value="" size="7" ></td>
	<td class="t" colspan="2"><input type="text" id="" name="" value="" size="41" ></td>
	<td class="t"><input type="text" id="" name="" value="" size="9" ></td>
</tr>
<tr>
	<td class="t"><input type="text" id="" name="" value="" size="7" ></td>
	<td class="t"><input type="text" id="" name="" value="" size="7" ></td>
	<td class="t"><input type="text" id="" name="" value="" size="10" ></td>
	<td class="t"><input type="text" id="" name="" value="" size="7" ></td>
	<td class="t" colspan="2"><input type="text" id="" name="" value="" size="41" ></td>
	<td class="t"><input type="text" id="" name="" value="" size="9" ></td>
</tr>
<tr>
	<td class="t"><input type="text" id="" name="" value="" size="7" ></td>
	<td class="t"><input type="text" id="" name="" value="" size="7" ></td>
	<td class="t"><input type="text" id="" name="" value="" size="10" ></td>
	<td class="t"><input type="text" id="" name="" value="" size="7" ></td>
	<td class="t" colspan="2"><input type="text" id="" name="" value="" size="41" ></td>
	<td class="t"><input type="text" id="" name="" value="" size="9" ></td>
</tr>
<tr>
	<td class="t"><input type="text" id="" name="" value="" size="7" ></td>
	<td class="t"><input type="text" id="" name="" value="" size="7" ></td>
	<td class="t"><input type="text" id="" name="" value="" size="10" ></td>
	<td class="t"><input type="text" id="" name="" value="" size="7" ></td>
	<td class="t" colspan="2"><input type="text" id="" name="" value="" size="41" ></td>
	<td class="t"><input type="text" id="" name="" value="" size="9" ></td>
</tr>
	

	
</table>
<br>
<!-- Calculo de Gasolina -->

<table>
<tr>
	<td class="e" style="text-align: left;"><strong>GASTOS NO SUJETOS A COMPROBACIÓN</strong></td>
	<th>TOTAL</th>
	<td class="t"><input type="text" id="" name="" value="" size="10" ></td>
</tr>
<tr>
	<th colspan="2">CONCEPTO</th>
	<th>IMPORTE</th>
</tr>
<tr>
	<td colspan="2" style="text-align: left;">20% De acuerdo al Art. 152 del RLISR</td>
	<td class="t"><input type="text" id="" name="" value="" size="10" ></td>
</tr>

<tr>
	<td class="e" style="text-align: left;" colspan="2"><strong>RECURSOS REINTEGRADOS POR LA DGPYRF</strong></td>
	
</tr>
<tr>
	<th colspan="2">TOTAL</th>

<td class="t"><input type="text" id="" name="" value="" size="10" ></td>
</tr>

<tr>
	<td class="e" style="text-align: left;" colspan="2"><strong>RECURSOS REINTEGRADOS POR EL SERVIDOR PÚBLICO</strong></td>
	
</tr>
<tr>
	<th colspan="2">TOTAL</th>

<td class="t"><input type="text" id="" name="" value="" size="10" ></td>
</tr>

<tr>
<td class="e"></td>
	<td class="e"><strong>SALDO</strong></td>
<td class="t"><input type="text" id="" name="" value="" size="10" ></td>
</tr>

	
</table>




<table>

	
</table>


<!-- Firmas -->
<br>
<table>
<tr>
	<th style="width: 200px;">COMISIONADO</th>
	<td style="width: 45px;" class="e"></td>
	<th style="width: 200px;">ENLACE ADMINISTRATIVO</th>
	<td style="width: 45px;" class="e"></td>
	<th style="width: 200px;">TITULAR DE LA UNIDAD RESPONSABLE O SERVIDOR PÚBLICO FACULTADO
	</th>
	</tr>
	<tr>
		<td class="t">
			<br><br><br><br>
			<input type="text" id="user" name="user" value="${user.nombre_s} ${user.ap_Paterno} ${user.ap_Materno}" size="28" disabled>
			<BR><article>NOMBRE Y FIRMA</article>
			<br>
		</td>
		<td class="e"></td>
		<td class="t">
		<br><br><br><br>
			<input type="text" id="" name="" value="" size="28" disabled>
			<BR><article>NOMBRE Y FIRMA</article>
			<br>
		</td>
		<td class="e"></td>
		<td>
			<br><br><br><br>
			
			<article>LIC. DANIEL AVILA FERNANDEZ
		<br>NOMBRE Y FIRMA
		</article>
			<br>
		</td>
	</tr>
</table>
<br>
1/ 30% de acuerdo al Art. 152 del Reglamento de la Ley del Impuesto Sobre la Renta.
<br>
2/ Si saldo (+) existe un importe pendiente de reintegrar, si saldo (-) existe un importe a favor del Servidor Público.

</center>

</body>
</html>