<%-- 
    Document   : ViatLay
    Created on : 26/04/2017, 04:52:42 PM
    Author     : nestor.yzmaya
--%>

<%@page contentType="text/html" pageEncoding="windows-1252"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
         <title>Viaticos Nacionales</title>
        <link rel="stylesheet" href="<c:url value="/resources/css/layout.css"/>">
        <link rel="stylesheet" media="print" href="<c:url value="/resources/css/imprimir.css"/>">
       
    </head>
    <body>
  
        <center>
<!--Encabezado-->
<table>
	<tr>
		<td rowspan="2" class="e"><img src="<c:url value="/resources/img/logo.jpg"/>"/></td>
		<th class="e">ANEXO II Oficio No.710.2016.2853/2016</th>
	</tr>
	<tr>
		<th class="e">OFICIO DE COMISIÓN/ORDEN DE MINISTRACIÓN DE VIÁTICOS NACIONALES</th>
	</tr>
</table>

<br>

<!--Descripción general del oficio-->
        
<table>
	<tr>
		<th colspan="2" >UNIDAD RESPONSABLE</th>
		<td class="e"></td>
		<th colspan="4">OC/OMVI</th>
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
		<td class="t"><input type="text" id="numOMVI" name="" value="${omvi.id_OMVI}" size="8" disabled></td>
		<td class="t"><input type="text" id="fechaOMVI" name="" value="${omvi.fecha_OMVI}" size="12" disabled></td>
	</tr>
</table>

<!-- Datos del comisionado-->


<br>
<table>
	<tr>
		<th>DATOS DEL COMISIONADO</th>
	</tr>
	<tr>
		<td><br>
			C. <input type="text" id="nombreComisionado" name="" value="${user.nombre_s} ${user.ap_Paterno} ${user.ap_Materno}" size="65" disabled> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			R.F.C <input type="text" id="rfcComisionado" name="" value="${user.RFC}" size="20" disabled>
			<br><br>
			AREA DE ADSCRIPCIÓN: <input type="text" id="areaAdscrip" name="" value="${user.area_Adscripcion}" size="78" disabled>
			<br><br>
			DOMICILIO:&nbsp; <input type="text" id="domicAreaAdscrip" name="" value="${user.direccion_Area_Adscripcion}" size="88" disabled>
			<br><br>
			PUESTO O CATEGORIA: <input type="text" id="puestoComis" name="" value="${user.puesto}" size="41" disabled>&nbsp;
			CLAVE: <input type="text" id="claveSAV" name="" value="${user.clave_SAV}" size="25" disabled>
			<br><br>
		</td>
	</tr>

</table>
<br>


<!-- Detalles del oficio-->
<table >
	<tr>
		<th colspan="2">LUGARES Y PERIODO DE LA COMISIÓN</th>
		<th>CUOTA DIARIA</th>
		<th>DIAS</th>
		<th>IMPORTE</th>
	</tr>
	<tr>
		<td class="t"><input type="text" id="lugarComision1"       name="" value="${destViatNac.lugar}" size="30" disabled></td>
		<td class="t"><input type="text" id="periodoComision1"     name="" value="${destViatNac.periodo}" size="30" disabled></td>
		<td class="t"><input type="text" id="cuotaDiariaComision1" name="" value="${destViatNac.cuota_Diaria}" size="10" disabled></td>
		<td class="t"><input type="text" id="diasComision1"        name="" value="${destViatNac.dias}" size="5" disabled></td>
		<td class="t"><input type="text" id="importeComision1"     name="" value="${destViatNac.importe}" size="11" disabled></td>
	</tr>
	<tr>
		<td class="t"><input type="text" id="lugarComision2"       name="" value="" size="30" disabled></td>
		<td class="t"><input type="text" id="periodoComision2"     name="" value="" size="30" disabled></td>
		<td class="t"><input type="text" id="cuotaDiariaComision2" name="" value="" size="10" disabled></td>
		<td class="t"><input type="text" id="diasComision2"        name="" value="" size="5" disabled></td>
		<td class="t"><input type="text" id="importeComision2"     name="" value="" size="11" disabled></td>
	</tr>
	<tr>
		<td class="t"><input type="text" id="lugarComision3"       name="" value="" size="30" disabled></td>
		<td class="t"><input type="text" id="periodoComision3"     name="" value="" size="30" disabled></td>
		<td class="t"><input type="text" id="cuotaDiariaComision3" name="" value="" size="10" disabled></td>
		<td class="t"><input type="text" id="diasComision3"        name="" value="" size="5" disabled></td>
		<td class="t"><input type="text" id="importeComision3"     name="" value="" size="11" disabled></td>
	</tr>
	<tr>
		<td class="t"><input type="text" id="lugarComision4"       name="" value="" size="30" disabled></td>
		<td class="t"><input type="text" id="periodoComision4"     name="" value="" size="30" disabled></td>
		<td class="t"><input type="text" id="cuotaDiariaComision4" name="" value="" size="10" disabled></td>
		<td class="t"><input type="text" id="diasComision4"        name="" value="" size="5" disabled></td>
		<td class="t"><input type="text" id="importeComision4"     name="" value="" size="11" disabled></td>
	</tr>
	<tr>
		<td colspan="3"></td>
		<tH>Total</TH>
		<td class="t"><input type="text" id="totalComision" name="" value="${viatNac.total_Importe}" size="11" disabled></td>
	</tr>
</table>

<!-- Motivo y Observaciones -->
<br>
<table >
	<tr>
		<th>MOTIVO DE LA COMISIÓN</th>
		<td class="e" style="width: 20px;"></td>
		<th>OBSERVACIONES</th>
	</tr>

	<tr>
		<td class="t"><textarea rows="4" cols="50" disabled>${motComision.motivo_Comision}</textarea></td>
		<td class="e"></td>
		<td class="t"><textarea rows="4" cols="50" disabled>${motComision.observaciones}</textarea></td>
	</tr>
</table>
<br>
<!-- Caractetisticas y Contabilizador -->

<table>
	<tr>
		<th width="385px">CARACTERISTICAS DE LOS VIATICOS</th>
		<td class="e" style="width: 20px;"></td>
		<th colspan="12">DOCUMENTO CONTABILIZADOR</th>

	
	</tr>

	<tr>
		<td rowspan="4">

			<p><input type="checkbox" name="" value=""><strong>Zona Marginada</strong></p>
			<strong>Grupos Jerarquicos</strong>
			<p>
			<input type="checkbox" name="" value="">J Hasta G
			<input type="checkbox" name="" value="">P Hasta K
			<input type="checkbox" name="" value="">Personal O
			</p>
			
		</td>
		<td class="e"></td>
		<th>R/S</th>
		<th>UR</th>
		<th>GF</th>
		<th>FN</th>
		<th>SF</th>
		<th>RG</th>
		<th>AI</th>
		<th>PP</th>
		<th>OG</th>
		<th>TG</th>
		<th>FF</th>
		<th>IMPORTE</th>
	</tr>

	<tr>
		<td class="e"></td>
		<td class="t"><input type="text" id="rs1" name="" value="" size="1" disabled></td>
		<td class="t"><input type="text" id="ur1" name="" value="" size="1" disabled></td>
		<td class="t"><input type="text" id="gf1" name="" value="" size="1" disabled></td>
		<td class="t"><input type="text" id="fn1" name="" value="" size="1" disabled></td>
		<td class="t"><input type="text" id="sf1" name="" value="" size="1" disabled></td>
		<td class="t"><input type="text" id="rg1" name="" value="" size="1" disabled></td>
		<td class="t"><input type="text" id="ai1" name="" value="" size="1" disabled></td>
		<td class="t"><input type="text" id="pp1" name="" value="" size="1" disabled></td>
		<td class="t"><input type="text" id="og1" name="" value="" size="1" disabled></td>
		<td class="t"><input type="text" id="tg1" name="" value="" size="1" disabled></td>
		<td class="t"><input type="text" id="ff1" name="" value="" size="1" disabled></td>
		<td class="t"><input type="text" id="importe1" name="" value="" size="4" disabled></td>
	</tr>
	<tr>
		<td class="e"></td>
		<td class="t"><input type="text" id="rs2" name="" value="" size="1" disabled></td>
		<td class="t"><input type="text" id="ur2" name="" value="" size="1" disabled></td>
		<td class="t"><input type="text" id="gf2" name="" value="" size="1" disabled></td>
		<td class="t"><input type="text" id="fn2" name="" value="" size="1" disabled></td>
		<td class="t"><input type="text" id="sf2" name="" value="" size="1" disabled></td>
		<td class="t"><input type="text" id="rg2" name="" value="" size="1" disabled></td>
		<td class="t"><input type="text" id="ai2" name="" value="" size="1" disabled></td>
		<td class="t"><input type="text" id="pp2" name="" value="" size="1" disabled></td>
		<td class="t"><input type="text" id="og2" name="" value="" size="1" disabled></td>
		<td class="t"><input type="text" id="tg2" name="" value="" size="1" disabled></td>
		<td class="t"><input type="text" id="ff2" name="" value="" size="1" disabled></td>
		<td class="t"><input type="text" id="importe2" name="" value="" size="4" disabled></td>
	</tr>
	<tr>
		<td class="e"></td>
		<td class="t"><input type="text" id="rs3" name="" value="" size="1" disabled></td>
		<td class="t"><input type="text" id="ur3" name="" value="" size="1" disabled></td>
		<td class="t"><input type="text" id="gf3" name="" value="" size="1" disabled></td>
		<td class="t"><input type="text" id="fn3" name="" value="" size="1" disabled></td>
		<td class="t"><input type="text" id="sf3" name="" value="" size="1" disabled></td>
		<td class="t"><input type="text" id="rg3" name="" value="" size="1" disabled></td>
		<td class="t"><input type="text" id="ai3" name="" value="" size="1" disabled></td>
		<td class="t"><input type="text" id="pp3" name="" value="" size="1" disabled></td>
		<td class="t"><input type="text" id="og3" name="" value="" size="1" disabled></td>
		<td class="t"><input type="text" id="tg3" name="" value="" size="1" disabled></td>
		<td class="t"><input type="text" id="ff3" name="" value="" size="1" disabled></td>
		<td class="t"><input type="text" id="importe3" name="" value="" size="4" disabled></td>
	</tr>
	<tr>
		<td colspan="10" class="e"></td>
		<th colspan="3">TOTAL</th>
		<td class="t"><input type="text" id="totalDC" name="" value="" size="4" disabled></td>
	</tr>

</table>



<!-- Firmas -->
<br>
<table>
	<tr>
		<th style="width: 400px;">TITULAR DE LA UNIDAD RESPONSABLE O SERVIDOR PÚBLICO FACULTADO</th>
		<th>COMISIONADO</th>
	</tr>
	<tr>
		<td>
			<br><br><br><br>
			LIC. DANIEL AVILA FERNANDEZ
			<br>
			NOMBRE Y FIRMA
			<br><br>

		</td>

		<td>
		<br><br><br>
		<br>
			<input type="text" id="nombFirma" name="" value="${user.nombre_s} ${user.ap_Paterno} ${user.ap_Materno}" size="40" disabled>
			<BR>NOMBRE Y FIRMA
			<br><br>
		</td>
	</tr>
</table>


</center>

    </body>
</html>
