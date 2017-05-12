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


<!--Descripción general del oficio-->
<br>
<table>
	<tr>
		<th colspan="2" >UNIDAD RESPONSABLE</th>
		<td class="e"></td>
		<th colspan="4">COMPERCO</th>
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
		<td class="t"><input type="text" id="omviComp" name="" value="${omvi.id_OMVI}" size="8" disabled></td>
		<td class="t"><input type="text" id="fechaComp" name="" value="${omvi.fecha_OMVI}" size="12" disabled></td>
	</tr>
</table>

<!-- Datos del servidor publico-->


<br>
<table>
	<tr>
		<th>DATOS DEL SERVIDOR PÚBLICO</th>
	</tr>
	<tr>
		<td><br>
			NOMBRE: <input type="text" id="nomUsrComp" name="" value="${user.nombre_s} ${user.ap_Paterno} ${user.ap_Materno}" size="58" disabled> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			R.F.C: <input type="text" id="rfcUsrComp" name="" value="${user.RFC}" size="20" disabled>
			<br><br>
			PUESTO O CATEGORIA: &nbsp;&nbsp;<input type="text" id="puestoUsrComp" name="" value="${user.puesto}" size="46" disabled>&nbsp;
			CLAVE:&nbsp; <input type="text" id="cveUsrComp" name="" value="${user.clave_SAV}" size="20" disabled>
			<br><br>
			AREA DE ADSCRIPCIÓN: <input type="text" id="areaUsrComp" name="" value="${user.area_Adscripcion}" size="79" disabled>&nbsp;
			
			<br><br>
		</td>
	</tr>

</table>
<br>


<!-- COMISIÓN O TRABAJO A DESARROLLAR-->



<table>
	<tr>
		<th>COMISIÓN O TRABAJO A DESARROLLAR</th>
		<th colspan="3">OFICIO DE COMISIÓN</th>
	</tr>
	<TR>
		<td class="t" rowspan="2"><textarea rows="2" cols="77" disabled>${motComision.motivo_Comision}</textarea></td>
		<th>NUMERO</th>
		<th>FECHA</th>
	</TR>
	<tr>
		<td class="t"><input type="text" id="numComp" name="" value="${omvi.id_OMVI}" size="9" disabled></td>
		<td class="t"><input type="text" id="fechaComp2" name="" value="${omvi.fecha_OMVI}" size="13" disabled></td>
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
		<td class="t"><input type="text" id="fecha1" name="" value="${itinerario.fecha_Itinerario}" size="11" disabled></td>
		<td class="t"><input type="text" id="de1" name="" value="${itinerario.origenDe}" size="35" disabled></td>
		<td class="t"><input type="text" id="a1" name="" value="${itinerario.destinoA}" size="35" disabled></td>
		<td class="t"><input type="text" id="distKM1" name="" value="${itinerario.distancia_Km}" size="11" disabled></td>
	</tr>
	<tr>
		<td class="t"><input type="text" id="fecha2" name="" value="" size="11" disabled></td>
		<td class="t"><input type="text" id="de2" name="" value="" size="35" disabled></td>
		<td class="t"><input type="text" id="a2" name="" value="" size="35" disabled></td>
		<td class="t"><input type="text" id="distKM2" name="" value="" size="11" disabled></td>
	</tr>
	<tr>
		<td class="t"><input type="text" id="fecha3" name="" value="" size="11" disabled></td>
		<td class="t"><input type="text" id="de3" name="" value="" size="35" disabled></td>
		<td class="t"><input type="text" id="a3" name="" value="" size="35" disabled></td>
		<td class="t"><input type="text" id="distKM3" name="" value="" size="11" disabled></td>
	</tr>
	<tr>
		<td class="t"><input type="text" id="fecha4" name="" value="" size="11" disabled></td>
		<td class="t"><input type="text" id="de4" name="" value="" size="35" disabled></td>
		<td class="t"><input type="text" id="a4" name="" value="" size="35" disabled></td>
		<td class="t"><input type="text" id="distKM4" name="" value="" size="11" disabled></td>
	</tr>
	<tr>
		<td class="t"><input type="text" id="fecha5" name="" value="" size="11" disabled></td>
		<td class="t"><input type="text" id="de5" name="" value="" size="35" disabled></td>
		<td class="t"><input type="text" id="a5" name="" value="" size="35" disabled></td>
		<td class="t"><input type="text" id="distKM5" name="" value="" size="11" disabled></td>
	</tr>
		<tr>
		<td class="e" colspan="2"></td>
		<td style="text-align: right;" class="e"><strong>TOTAL</strong></td>
		<td class="t"><input type="text" id="totalKM" name="" value="${itinerario.distancia_Km}" size="11" disabled></td>
	</tr>

	
</table>
<br>
<!-- Calculo de Gasolina -->

<table>
	<tr>
		<th>PRECIO VIGENTE DEL LITRO DE GASOLINA</th>
		<th style="width: 320px;">LITROS DE GASOLINA(KM/5)</th>
		<th style="width: 320px;">IMPORTE</th>
	</tr>
	<tr>
		<td class="t"><input type="text" id="precVigGasComp" name="" value="${comperco.precio_Vigente_Gasolina}" size="14" disabled>
		<br>
		</td>

		<td class="t"><input type="text" id="kmRecComp" name="" value="${itinerario.distancia_Km}" size="17" disabled> = 
		<input type="text" id="ltsGas" name="" value="${comperco.litros_Gasolina}" size="17" disabled>
		<br>KM RECORRIDOS &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; LITROS DE GAS
		</td>


		<td class="t"><input type="text" id="ltsGasOp" name="" value="${comperco.litros_Gasolina}" size="9" disabled> * 
		<input type="text" id="precVigOP" name="" value="${comperco.precio_Vigente_Gasolina}" size="9" disabled> = 
		<input type="text" id="importeGas" name="" value="${comperco.importe_Gasolina}" size="9" disabled>
		<br>LTS. DE GAS &nbsp;&nbsp;&nbsp; $ VIGENTE LT/GAS  &nbsp;&nbsp;&nbsp;&nbsp; IMPORTE

		</td>

	</tr>
</table>



<!-- Firmas -->
<br>
<table>
	<tr>
		<th style="width: 400px;">RECIBI LA CANTIDAD DE: $</th>
		<th>TITULAR DE LA UR O SERVIDOR PÚBLICO FACULTADO</th>
	</tr>
	<tr>
		<td>
			<br><br><br><br>
			<input type="text" id="nombFirmaUsr" name="" value="${user.nombre_s} ${user.ap_Paterno} ${user.ap_Materno}" size="40" disabled>
			<BR><article>NOMBRE Y FIRMA DEL SERVIDOR PÚBLICO O COMISIONADO</article>
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
