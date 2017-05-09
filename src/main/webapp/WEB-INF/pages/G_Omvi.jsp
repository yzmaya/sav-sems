<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html lang="en">
<head>
<title>OMVI</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link rel="stylesheet" type="text/css" href="css/jquery-ui-1.7.2.custom.css" />
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.2/jquery-ui.min.js"></script>

<script>
            function ir(){
                window.location='/SAV/comissioner';
            }

        </script>

<script type="text/javascript">
            jQuery(function($){
                $.datepicker.regional['es'] = {
                    closeText: 'Cerrar',
                    prevText: '&#x3c;Ant',
                    nextText: 'Sig&#x3e;',
                    currentText: 'Hoy',
                    monthNames: ['Enero','Febrero','Marzo','Abril','Mayo','Junio',
                        'Julio','Agosto','Septiembre','Octubre','Noviembre','Diciembre'],
                    monthNamesShort: ['Ene','Feb','Mar','Abr','May','Jun',
                        'Jul','Ago','Sep','Oct','Nov','Dic'],
                    dayNames: ['Domingo','Lunes','Martes','Mi&eacute;rcoles','Jueves','Viernes','S&aacute;bado'],
                    dayNamesShort: ['Dom','Lun','Mar','Mi&eacute;','Juv','Vie','S&aacute;b'],
                    dayNamesMin: ['Do','Lu','Ma','Mi','Ju','Vi','S&aacute;'],
                    weekHeader: 'Sm',
                    dateFormat: 'dd/mm/yy',
                    firstDay: 1,
                    isRTL: false,
                    showMonthAfterYear: false,
                    yearSuffix: ''};
                $.datepicker.setDefaults($.datepicker.regional['es']);
            });    

            $(document).ready(function() {
            	$("#datepicker").datepicker();
                $("#datepicker2").datepicker();
            });
            
            function addOmvi(){
                 <!--Inicia serialize -->
                $('#btn_GeneraOmvi').click(function(){

                    var dataString = $('#user').serialize();

                    $.ajax({
                        type: "POST",
                        url: "addOmvi",
                        data: dataString,
                        success: function(data) {
							alert('succes');
							alert('Datos serializados: '+dataString);
							
                        },
                        error: function(dataStr){     
                            alert("error"+dataStr.responseText);
                            alert('Datos serializados: '+dataString);
                        }
                    });
                });
                <!--Termina serialize -->
            }
        </script>
</head>
<body>

	<button class="btn btn-danger" onclick="ir()">Cancelar</button>
<!-- <form id="generaOmvi" name="generaOmvi" method="post"> -->
	<div class="container">
		<h2>Generación de Viaticos</h2>
		<ul class="nav nav-pills">
			<li class="active"><a data-toggle="pill" href="#comisionado">Orden
					de Servicio para Pasajes Nacionales</a></li>
			<li><a data-toggle="pill" href="#menu1">Orden de
					Ministracion de Viaticos Nacionales</a></li>
			<li><a data-toggle="pill" href="#menu2">Gastos de
					Combustible</a></li>
			<li><a data-toggle="pill" href="#menu3">Comprobacion de
					Viaticos</a></li>
		</ul>
		<br> <br> <br>
		<div class="row">
			<div class="panel panel-default col-md-7">
				<div class="panel-heading text-center">UNIDAD RESPONSABLE</div>
				<div class="panel-body">
					<div class="row">
						<label class=" control-label col-md-6"> CLAVE</label> <label
							class=" control-label col-md-6"> DENOMINACION</label>
					</div>
					<div class="row">
						<div class="col-md-3">
							<input type="text" class="form-control" id="cve_ur"
								name="clave_ur" value="600" disabled>
						</div>
						<div class="col-md-9">
							<input type="text" class="form-control" id="denominacion_ur"
								name="denom_ur"
								value="SUBSECRETARIA DE EDUCACION MEDIA SUPERIOR" disabled>
						</div>
					</div>
				</div>
			</div>
			<div class="panel col-md-1"></div>
			<div class="panel panel-default col-md-4">
				<div class="panel-heading text-center">ORDSER</div>
				<div class="panel-body">
					<div class="row">
						<label class=" control-label col-md-6"> NUMERO</label> <label
							class=" control-label col-md-6"> FECHA</label>
					</div>
					<div class="row">
						<div class="col-md-4">
							<input type="text" class="form-control" id="omvi" name="omvi"
								value="" disabled>
						</div>
						<div class="col-md-8">
							<input type="text" class="form-control" id="datepicker"
								readonly="readonly">
						</div>
					</div>
				</div>
			</div>
		</div>
<form id="user" name="user" method="post">		
		<div class="row">

			<div class="panel panel-default">
				<div class="panel-heading text-center">DATOS DE LA COMISION</div>
				<div class="panel-heading text-center">BENEFICIARIO</div>
				<div class="panel-body">
					<div class="row">
						<label class="control-label col-md-4 text-center">NOMBRE</label> <label
							class="control-label col-md-4 text-center">R.F.C.</label> <label
							class="control-label col-md-4 text-center">PUESTO</label>
					</div>
					<div class="row">
						<div class="col-md-4">
							<input type="text" class="form-control" id="FULL_NAME" name="FULL_NAME"
								value="${user.ap_Paterno} ${user.ap_Materno} ${user.nombre_s}" disabled>
						</div>
						<div class="col-md-4">
							<input type="text" class="form-control" id="RFC" name="RFC"
								value="${user.RFC}" disabled>
						</div>
						<div class="col-md-4">
							<input type="text" class="form-control" id="POSITION" name="POSITION"
								value="${user.puesto}" disabled>
						</div>
					</div>
					<br>
					<div class="row">
						<label class="control-label col-md-4 text-center">CLAVE</label> <label
							class="control-label col-md-8 text-center">AREA DE
							ADSCRIPCION</label>
					</div>
					<div class="row">
						<div class="col-md-4">
							<input type="text" class="form-control" id="KEY_SAV" name="KEY_SAV"
								value="¿Clave SAV?" disabled>
						</div>
						<div class="col-md-8">
							<input type="text" class="form-control" id="AREA_OF_ASCRIPTION"
								name="AREA_OF_ASCRIPTION"
								value="${user.area_Adscripcion}" disabled>
						</div>
					</div>
					<br>
					<div class="row">
						<div class="col-md-1">
							<label class="control-label">DOMICILIO:</label>
						</div>
						<div class="col-md-11">
							<input type="text" class="form-control" id="dom" name=""
								value="${user.direccion_Area_Adscripcion}" disabled>
						</div>
					</div>
				</div>
			</div>
		</div>
</form>
<!-- ------------------------------------------------- Inicia Nationals_tour ---------------------------------------------------- -->

		<div class="tab-content">
			<!--INICIA CONTENEDOR PRINCIPAL-->
			<div id="comisionado" class="tab-pane fade in active">
			<form id="natTour" name="natTour" method="post">
				<div class="row">
					<div class="panel panel-default">
						<div class="panel-heading text-center">DESTINO</div>
						<div class="panel-body">
							<div class="row">
								<label class="control-label col-md-6 text-center">PUNTO
									DE PARTIDA</label> <label class="control-label col-md-6 text-center">PUNTO
									DE LLEGADA</label>
							</div>
							<div class="row">
								<div class="col-md-6">
									<input type="text" class="form-control" id="punto_partida"
										name="punto_partida" value="">
								</div>
								<div class="col-md-6">
									<input type="text" class="form-control" id="punto_llegada"
										name="punto_llegada" value="">
								</div>
							</div>
							<br>
							<div class="row">
								<label class="control-label col-md-6 text-center">OTRO
									DESTINO</label> <label class="control-label col-md-6 text-center">CLASE
									DE SERVICIO</label>
							</div>
							<div class="row">
								<div class="col-md-6">
									<input type="text" class="form-control" id="otro_destino"
										name="otro_destino" value="">
								</div>
								<div class="col-md-6">
									<select class="form-control">
										<option value=""></option>
										<option value="economico">Economico</option>
										<option value="terrestre">Terrestre</option>
									</select>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="panel panel-default col-md-7">
						<div class="panel-heading">OBJETO DE LA COMISION</div>
						<div class="panel-body">
							<div class="row">
								<textarea class="form-control" id="obj_comision" rows="8"></textarea>
							</div>
						</div>
					</div>
					<div class="panel col-md-1"></div>
					<div class="panel panel-default col-md-4">
						<div class="panel-heading">SELLO DE LA U.A.</div>
						<div class="panel-body">
							<div class="row col-md-10">
								<img src="" class="img-rounded"
									alt="Imagen del sello escaneado. " width="304" height="173">
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="panel panel-default">
						<div class="panel-heading">OBSERVACIONES</div>
						<div class="panel-body">
							<div class="row">
								<textarea class="form-control" id="observaciones" rows="5"></textarea>
							</div>
						</div>
					</div>
				</div>
</form>				
<!-- ----------------------------------------- Termina National tour ---------------------------------------  -->
				<div class="row">
					<div class="panel panel-default">
						<div class="panel-heading">DOCUMENTO CONTABILIAZDOR</div>
						<div class="panel-body">
							<table class="table table-hover">
								<thead>
									<tr class="info text-center">
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
								</thead>
								<tbody>
									<tr>
										<td><input type="text" class="form-control col-md-1"
											id="" name="" value=""></td>
										<td><input type="text" class="form-control col-md-1"
											id="" name="" value=""></td>
										<td><input type="text" class="form-control col-md-1"
											id="" name="" value=""></td>
										<td><input type="text" class="form-control col-md-1"
											id="" name="" value=""></td>
										<td><input type="text" class="form-control col-md-1"
											id="" name="" value=""></td>
										<td><input type="text" class="form-control col-md-1"
											id="" name="" value=""></td>
										<td><input type="text" class="form-control col-md-1"
											id="" name="" value=""></td>
										<td><input type="text" class="form-control col-md-1"
											id="" name="" value=""></td>
										<td><input type="text" class="form-control col-md-1"
											id="" name="" value=""></td>
										<td><input type="text" class="form-control col-md-1"
											id="" name="" value=""></td>
										<td><input type="text" class="form-control col-md-1"
											id="" name="" value=""></td>
										<td><input type="text" class="form-control col-md-1"
											id="" name="" value=""></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="panel panel-default">
						<div class="panel-heading text-center">IMPORTE LIQUIDO</div>
						<div class="panel-body">
							<input type="text" class="form-control" id="" name="" disabled>
						</div>
					</div>
				</div>
			</div>

			<div id="menu1" class="tab-pane fade">
				<div class="row">
					<div class="panel panel-default col-md-6">
						<div class="panel-heading text-center">LUGAR(ES) Y
							PERIODO(S) DE LA COMISION</div>
						<div class="panel-body">
							<div class="col-md-6">
								<input type="text" class="form-control" id="" name="" disabled>
							</div>
							<div class="col-md-6">
								<input type="text" class="form-control" id="" name="">
							</div>
						</div>
					</div>
					<div class="panel panel-default col-md-2">
						<div class="panel-heading text-center">CUOTA DIARIA</div>
						<div class="panel-body">
							<div>
								<input type="text" class="form-control" id="cuotaDia" name="" disabled>
							</div>
						</div>
					</div>
					<div class="panel panel-default col-md-2">
						<div class="panel-heading text-center">DIAS</div>
						<div class="panel-body">
							<div>
								<input type="text" class="form-control" id="diasComp" name="">
							</div>
						</div>
					</div>
					<div class="panel panel-default col-md-2">
						<div class="panel-heading text-center">IMPORTE</div>
						<div class="panel-body">
							<div>
								<input type="text" class="form-control" id="imp" name="" disabled>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="panel panel-default col-md-offset-10">
						<div class="panel-heading text-center">TOTAL</div>
						<div class="panel-body">
							<input type="text" class="form-control" id="tot" name="" disabled>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="panel panel-default col-md-6">
						<div class="panel-heading text-center">MOTIVO DE LA COMISION</div>
						<div class="panel-body">
							<div class="row">
								<textarea class="form-control" id="motivo_comis_anexo2" rows="5"></textarea>
							</div>
						</div>
					</div>
					<div class="panel panel-default col-md-6">
						<div class="panel-heading text-center">OBSERVACIONES</div>
						<div class="panel-body">
							<div class="row">
								<textarea class="form-control" id="observ_anexo2" rows="5"></textarea>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="panel panel-default">
						<div class="panel-heading text-center">CARACTERISTICAS DE
							LOS VIATICOS</div>
						<div class="panel-body">
							<div class="row">
								<label class="control-label col-md-3">ZONA MARGINADA</label>
								<div class="col-md-9">
									<label class="control-label col-md-4"><input
										type="checkbox" value=""></label>
								</div>
							</div>
							<div class="row">
								<label class="control-label col-md-3">GRUPOS JERARQUICOS</label>
								<div class="col-md-9">
									<label class="control-label col-md-4"><input
										type="checkbox" value="">J hasta G</label> <label
										class="control-label col-md-4"><input type="checkbox"
										value="">P hasta K</label> <label
										class="control-label col-md-4"><input type="checkbox"
										value="">PERSONAL OPERATIVO</label>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="panel panel-default">
						<div class="panel-heading text-center">DOCUMENTO
							CONTABILIZADOR</div>
						<div class="panel-body">
							<table class="table table-hover">
								<thead>
									<tr class="info text-center">
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
								</thead>
								<tbody>
									<tr>
										<td><input type="text" class="form-control col-md-1"
											id="" name="" value=""></td>
										<td><input type="text" class="form-control col-md-1"
											id="" name="" value=""></td>
										<td><input type="text" class="form-control col-md-1"
											id="" name="" value=""></td>
										<td><input type="text" class="form-control col-md-1"
											id="" name="" value=""></td>
										<td><input type="text" class="form-control col-md-1"
											id="" name="" value=""></td>
										<td><input type="text" class="form-control col-md-1"
											id="" name="" value=""></td>
										<td><input type="text" class="form-control col-md-1"
											id="" name="" value=""></td>
										<td><input type="text" class="form-control col-md-1"
											id="" name="" value=""></td>
										<td><input type="text" class="form-control col-md-1"
											id="" name="" value=""></td>
										<td><input type="text" class="form-control col-md-1"
											id="" name="" value=""></td>
										<td><input type="text" class="form-control col-md-1"
											id="" name="" value=""></td>
										<td><input type="text" class="form-control col-md-1"
											id="" name="" value=""></td>
									</tr>
									<tr>
										<td><input type="text" class="form-control col-md-1"
											id="" name="" value=""></td>
										<td><input type="text" class="form-control col-md-1"
											id="" name="" value=""></td>
										<td><input type="text" class="form-control col-md-1"
											id="" name="" value=""></td>
										<td><input type="text" class="form-control col-md-1"
											id="" name="" value=""></td>
										<td><input type="text" class="form-control col-md-1"
											id="" name="" value=""></td>
										<td><input type="text" class="form-control col-md-1"
											id="" name="" value=""></td>
										<td><input type="text" class="form-control col-md-1"
											id="" name="" value=""></td>
										<td><input type="text" class="form-control col-md-1"
											id="" name="" value=""></td>
										<td><input type="text" class="form-control col-md-1"
											id="" name="" value=""></td>
										<td><input type="text" class="form-control col-md-1"
											id="" name="" value=""></td>
										<td><input type="text" class="form-control col-md-1"
											id="" name="" value=""></td>
										<td><input type="text" class="form-control col-md-1"
											id="" name="" value=""></td>
									</tr>
									<tr>
										<td><input type="text" class="form-control col-md-1"
											id="" name="" value=""></td>
										<td><input type="text" class="form-control col-md-1"
											id="" name="" value=""></td>
										<td><input type="text" class="form-control col-md-1"
											id="" name="" value=""></td>
										<td><input type="text" class="form-control col-md-1"
											id="" name="" value=""></td>
										<td><input type="text" class="form-control col-md-1"
											id="" name="" value=""></td>
										<td><input type="text" class="form-control col-md-1"
											id="" name="" value=""></td>
										<td><input type="text" class="form-control col-md-1"
											id="" name="" value=""></td>
										<td><input type="text" class="form-control col-md-1"
											id="" name="" value=""></td>
										<td><input type="text" class="form-control col-md-1"
											id="" name="" value=""></td>
										<td><input type="text" class="form-control col-md-1"
											id="" name="" value=""></td>
										<td><input type="text" class="form-control col-md-1"
											id="" name="" value=""></td>
										<td><input type="text" class="form-control col-md-1"
											id="" name="" value=""></td>
									</tr>
									<tr>
										<td><input type="text" class="form-control col-md-1"
											id="" name="" value=""></td>
										<td><input type="text" class="form-control col-md-1"
											id="" name="" value=""></td>
										<td><input type="text" class="form-control col-md-1"
											id="" name="" value=""></td>
										<td><input type="text" class="form-control col-md-1"
											id="" name="" value=""></td>
										<td><input type="text" class="form-control col-md-1"
											id="" name="" value=""></td>
										<td><input type="text" class="form-control col-md-1"
											id="" name="" value=""></td>
										<td><input type="text" class="form-control col-md-1"
											id="" name="" value=""></td>
										<td><input type="text" class="form-control col-md-1"
											id="" name="" value=""></td>
										<td><input type="text" class="form-control col-md-1"
											id="" name="" value=""></td>
										<td><input type="text" class="form-control col-md-1"
											id="" name="" value=""></td>
										<td><input type="text" class="form-control col-md-1"
											id="" name="" value=""></td>
										<td><input type="text" class="form-control col-md-1"
											id="" name="" value=""></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>

			<div id="menu2" class="tab-pane fade">

				<div class="row">
					<div class="panel panel-default col-md-6">
						<div class="panel-heading">COMISION O TRABAJO A DESARROLLAR</div>
						<div class="panel-body">
							<textarea class="form-control" id="observaciones" rows="5"></textarea>
						</div>
					</div>
					<div class="panel panel-default col-md-6">
						<div class="panel-heading">OFICIO DE COMISION</div>
						<div class="panel-body">
							<div class="panel panel-default col-md-6">
								<div class="panel-heading">NUMERO</div>
								<div class="panel-body">
									<input type="text" class="form-control" id="" name="">
								</div>
							</div>
							<div class="panel panel-default col-md-6">
								<div class="panel-heading">FECHA</div>
								<div class="panel-body">
									<input type="text" class="form-control" id="datepicker2"
										readonly="readonly">
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="panel panel-default">
						<div class="panel-heading text-center">DOCUMENTO
							CONTABILIZADOR</div>
						<div class="panel-heading text-center">CLAVE PRESUPUESTARIA</div>
						<div class="panel-body">
							<table class="table table-hover">
								<thead>
									<tr class="info text-center">
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
								</thead>
								<tbody>
									<tr>
										<td><input type="text" class="form-control col-md-1"
											id="" name="" value=""></td>
										<td><input type="text" class="form-control col-md-1"
											id="" name="" value=""></td>
										<td><input type="text" class="form-control col-md-1"
											id="" name="" value=""></td>
										<td><input type="text" class="form-control col-md-1"
											id="" name="" value=""></td>
										<td><input type="text" class="form-control col-md-1"
											id="" name="" value=""></td>
										<td><input type="text" class="form-control col-md-1"
											id="" name="" value=""></td>
										<td><input type="text" class="form-control col-md-1"
											id="" name="" value=""></td>
										<td><input type="text" class="form-control col-md-1"
											id="" name="" value=""></td>
										<td><input type="text" class="form-control col-md-1"
											id="" name="" value=""> <!--                                                <select class="form-control col-md-1">
                                                    <option value=""></option>
                                                    <option value="26104">26104</option>
                                                    <option value="26103">26103</option>
                                                </select>--></td>
										<td><input type="text" class="form-control col-md-1"
											id="" name="" value=""></td>
										<td><input type="text" class="form-control col-md-1"
											id="" name="" value=""></td>
										<td><input type="text" class="form-control col-md-1"
											id="" name="" value=""></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="panel panel-default">
						<div class="panel-heading">ITINERARIO</div>
						<div class="panel-body">
							<table class="table table-hover">
								<thead>
									<tr class="info">
										<th class="text-center">FECHA</th>
										<th class="text-center">DE</th>
										<th class="text-center">A</th>
										<th class="text-center">DISTANCIA EN KILOMETROS</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td><input type="text" class="form-control col-md-1"
											id="" name="" value=""></td>
										<td><input type="text" class="form-control col-md-1"
											id="" name="" value=""></td>
										<td><input type="text" class="form-control col-md-1"
											id="" name="" value=""></td>
										<td><input type="text" class="form-control col-md-1"
											id="" name="" value=""></td>
									</tr>
									<tr>
										<td><input type="text" class="form-control col-md-1"
											id="" name="" value=""></td>
										<td><input type="text" class="form-control col-md-1"
											id="" name="" value=""></td>
										<td><input type="text" class="form-control col-md-1"
											id="" name="" value=""></td>
										<td><input type="text" class="form-control col-md-1"
											id="" name="" value=""></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="panel panel-default col-md-2">
						<div class="panel-heading">PRECIO VIGENTE DEL LITRO DE
							GASOLINA</div>
						<div class="panel-body">
							<div class="row">
								<label class="control-label col-md-2">$</label>
								<div class="col-md-9">
									<input type="text" class="form-control" id="" name="">
								</div>
							</div>


						</div>
					</div>
					<div class="panel panel-default col-md-4">
						<div class="panel-heading">LITROS DE GASOLINA (KM/5)</div>
						<div class="panel-body">
							<div class="row">
								<label class="control-label col-md-6 text-center">KM
									RECORRIDOS /5=</label> <label class="control-label col-md-6  ">LITROS
									DE GASOLINA</label>
							</div>
							<div class="row">
								<div class="col-md-6">
									<input type="text" class="form-control" id="" name="">
								</div>
								<div class="col-md-6">
									<input type="text" class="form-control" id="" name="">
								</div>
							</div>
						</div>
					</div>
					<div class="panel panel-default col-md-6">
						<div class="panel-heading">IMPORTE</div>
						<div class="panel-body">
							<div class="row">
								<label class="control-label col-md-4 text-center">LTS.
									DE GAS X</label> <label class="control-label col-md-4  ">PREC.
									VIGENTE DEL LTO. DE GAS.</label> <label
									class="control-label col-md-4  ">= IMPORTE</label>
							</div>
							<div class="row">
								<div class="col-md-4">
									<input type="text" class="form-control" id="" name="">
								</div>
								<div class="col-md-4">
									<input type="text" class="form-control" id="" name="">
								</div>
								<div class="col-md-4">
									<input type="text" class="form-control" id="" name="">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

			<div id="menu3" class="tab-pane fade">
				<!--INICIA ULTIMO MENU-->
				<div class="row">
					<label class="control-label col-md-1">OC/OMVI No.</label>
					<div class="col-md-2">
						<input class="form-control" type="text" id="" name="">
					</div>
				</div>
				<div class="row">
					<div class="panel panel-default col-md-3">
						<div class="panel-heading">UNIDAD RESPONSABLE</div>
						<div class="panel-body">
							<table class="table table-hover">
								<thead>
									<tr class="info text-center">
										<th>CLAVE</th>
										<th>DENOMINACION</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td><input class="form-control" type="text" id="" name=""></td>
										<td><input class="form-control" type="text" id="" name=""></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<div class="panel panel-default col-md-offset-9">
						<div class="panel-heading">FORMATO</div>
						<div class="panel-body">
							<table class="table table-hover">
								<thead>
									<tr class="info text-center">
										<th>NUMERO</th>
										<th>FECHA</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td><input class="form-control" type="text" id="" name=""></td>
										<td><input class="form-control" type="text" id="" name=""></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<label class="control-label col-md-offset-12">A</label>
				</div>
				<div class="row">
					<div class="panel panel-default col-md-offset-9">
						<div class="panel-heading">MINISTRACION DE VIATICOS</div>
						<div class="panel-body">
							<table class="table table-hover">
								<thead>
									<tr class="info text-center">
										<th>TOTAL</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td><input class="form-control" type="text" id="" name=""></td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
					<label class="control-label col-md-offset-12">B</label>
				</div>
				<div class="row">
					<div class="panel panel-default">
						<div class="panel-heading">DOCUMENTACION CON REQUISITOS
							FISCALES</div>
						<div class="panel-body">
							<div class="row">
								<label class="control-label col-md-offset-10">TOTAL:<input
									class="form-control" type="text" id="" name=""></label>
							</div>
							<div class="row">
								<table class="table table-hover">
									<thead>
										<tr class="info text-center">
											<th>FECHA</th>
											<th>No. FACTURA</th>
											<th>CONCEPTO</th>
											<th>PARTIDA</th>
											<th>OBSERVACIONES</th>
											<th>IMPORTE</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td><input class="form-control" type="text" id=""
												name=""></td>
											<td><input class="form-control" type="text" id=""
												name=""></td>
											<td><input class="form-control" type="text" id=""
												name=""></td>
											<td><input class="form-control" type="text" id=""
												name=""></td>
											<td><input class="form-control" type="text" id=""
												name=""></td>
											<td><input class="form-control" type="text" id=""
												name=""></td>
										</tr>
										<tr>
											<td><input class="form-control" type="text" id=""
												name=""></td>
											<td><input class="form-control" type="text" id=""
												name=""></td>
											<td><input class="form-control" type="text" id=""
												name=""></td>
											<td><input class="form-control" type="text" id=""
												name=""></td>
											<td><input class="form-control" type="text" id=""
												name=""></td>
											<td><input class="form-control" type="text" id=""
												name=""></td>
										</tr>
										<tr>
											<td><input class="form-control" type="text" id=""
												name=""></td>
											<td><input class="form-control" type="text" id=""
												name=""></td>
											<td><input class="form-control" type="text" id=""
												name=""></td>
											<td><input class="form-control" type="text" id=""
												name=""></td>
											<td><input class="form-control" type="text" id=""
												name=""></td>
											<td><input class="form-control" type="text" id=""
												name=""></td>
										</tr>
										<tr>
											<td><input class="form-control" type="text" id=""
												name=""></td>
											<td><input class="form-control" type="text" id=""
												name=""></td>
											<td><input class="form-control" type="text" id=""
												name=""></td>
											<td><input class="form-control" type="text" id=""
												name=""></td>
											<td><input class="form-control" type="text" id=""
												name=""></td>
											<td><input class="form-control" type="text" id=""
												name=""></td>
										</tr>
										<tr>
											<td><input class="form-control" type="text" id=""
												name=""></td>
											<td><input class="form-control" type="text" id=""
												name=""></td>
											<td><input class="form-control" type="text" id=""
												name=""></td>
											<td><input class="form-control" type="text" id=""
												name=""></td>
											<td><input class="form-control" type="text" id=""
												name=""></td>
											<td><input class="form-control" type="text" id=""
												name=""></td>
										</tr>
										<tr>
											<td><input class="form-control" type="text" id=""
												name=""></td>
											<td><input class="form-control" type="text" id=""
												name=""></td>
											<td><input class="form-control" type="text" id=""
												name=""></td>
											<td><input class="form-control" type="text" id=""
												name=""></td>
											<td><input class="form-control" type="text" id=""
												name=""></td>
											<td><input class="form-control" type="text" id=""
												name=""></td>
										</tr>
										<tr>
											<td><input class="form-control" type="text" id=""
												name=""></td>
											<td><input class="form-control" type="text" id=""
												name=""></td>
											<td><input class="form-control" type="text" id=""
												name=""></td>
											<td><input class="form-control" type="text" id=""
												name=""></td>
											<td><input class="form-control" type="text" id=""
												name=""></td>
											<td><input class="form-control" type="text" id=""
												name=""></td>
										</tr>
										<tr>
											<td><input class="form-control" type="text" id=""
												name=""></td>
											<td><input class="form-control" type="text" id=""
												name=""></td>
											<td><input class="form-control" type="text" id=""
												name=""></td>
											<td><input class="form-control" type="text" id=""
												name=""></td>
											<td><input class="form-control" type="text" id=""
												name=""></td>
											<td><input class="form-control" type="text" id=""
												name=""></td>
										</tr>
										<tr>
											<td><input class="form-control" type="text" id=""
												name=""></td>
											<td><input class="form-control" type="text" id=""
												name=""></td>
											<td><input class="form-control" type="text" id=""
												name=""></td>
											<td><input class="form-control" type="text" id=""
												name=""></td>
											<td><input class="form-control" type="text" id=""
												name=""></td>
											<td><input class="form-control" type="text" id=""
												name=""></td>
										</tr>
										<tr>
											<td><input class="form-control" type="text" id=""
												name=""></td>
											<td><input class="form-control" type="text" id=""
												name=""></td>
											<td><input class="form-control" type="text" id=""
												name=""></td>
											<td><input class="form-control" type="text" id=""
												name=""></td>
											<td><input class="form-control" type="text" id=""
												name=""></td>
											<td><input class="form-control" type="text" id=""
												name=""></td>
										</tr>
										<tr>
											<td><input class="form-control" type="text" id=""
												name=""></td>
											<td><input class="form-control" type="text" id=""
												name=""></td>
											<td><input class="form-control" type="text" id=""
												name=""></td>
											<td><input class="form-control" type="text" id=""
												name=""></td>
											<td><input class="form-control" type="text" id=""
												name=""></td>
											<td><input class="form-control" type="text" id=""
												name=""></td>
										</tr>
										<tr>
											<td><input class="form-control" type="text" id=""
												name=""></td>
											<td><input class="form-control" type="text" id=""
												name=""></td>
											<td><input class="form-control" type="text" id=""
												name=""></td>
											<td><input class="form-control" type="text" id=""
												name=""></td>
											<td><input class="form-control" type="text" id=""
												name=""></td>
											<td><input class="form-control" type="text" id=""
												name=""></td>
										</tr>
										<tr>
											<td><input class="form-control" type="text" id=""
												name=""></td>
											<td><input class="form-control" type="text" id=""
												name=""></td>
											<td><input class="form-control" type="text" id=""
												name=""></td>
											<td><input class="form-control" type="text" id=""
												name=""></td>
											<td><input class="form-control" type="text" id=""
												name=""></td>
											<td><input class="form-control" type="text" id=""
												name=""></td>
										</tr>
										<tr>
											<td><input class="form-control" type="text" id=""
												name=""></td>
											<td><input class="form-control" type="text" id=""
												name=""></td>
											<td><input class="form-control" type="text" id=""
												name=""></td>
											<td><input class="form-control" type="text" id=""
												name=""></td>
											<td><input class="form-control" type="text" id=""
												name=""></td>
											<td><input class="form-control" type="text" id=""
												name=""></td>
										</tr>
										<tr>
											<td><input class="form-control" type="text" id=""
												name=""></td>
											<td><input class="form-control" type="text" id=""
												name=""></td>
											<td><input class="form-control" type="text" id=""
												name=""></td>
											<td><input class="form-control" type="text" id=""
												name=""></td>
											<td><input class="form-control" type="text" id=""
												name=""></td>
											<td><input class="form-control" type="text" id=""
												name=""></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<label class="control-label col-md-offset-12">C</label>
				</div>
				<div class="row">
					<div class="panel panel-default">
						<div class="panel-heading">GASTOS NO SUJETOS A COMPROBACION</div>
						<div class="panel-body">
							<div class="row">
								<label class="control-label col-md-offset-10">TOTAL:<input
									class="form-control" type="text" id="" name=""></label>
							</div>
							<div class="row">
								<table class="table table-hover">
									<thead>
										<tr class="info">
											<th class="text-center">CONCEPTO</th>
											<th class="text-center">IMPORTE</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td><input class="form-control" type="text" id=""
												name=""></td>
											<td><input class="form-control" type="text" id=""
												name=""></td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<label class="control-label col-md-offset-12">D</label>
				</div>
				<div class="row">
					<div class="panel panel-default">
						<div class="panel-heading">RECURSOS REINTEGRADOS POR LA
							DGPyRF</div>
						<div class="panel-body">
							<label class="control-label col-md-offset-10">TOTAL:<input
								class="form-control" type="text" id="" name=""></label>
						</div>
					</div>
					<label class="control-label col-md-offset-12">E</label>
				</div>
				<div class="row">
					<div class="panel panel-default">
						<div class="panel-heading">RECURSOS REINTEGRADOS POR EL
							SERVIDOR PUBLICO</div>
						<div class="panel-body">
							<label class="control-label col-md-offset-10">TOTAL:<input
								class="form-control" type="text" id="" name=""></label>
						</div>
					</div>
				</div>
				<div class="row">
					<label class="control-label col-md-offset-10">Saldo:<input
						class="form-control" type="text" id="" name=""></label>
				</div>
				<div class="row">
					<label class="control-label col-md-offset-10">(A-B-C-D-E)</label>
				</div>
			</div>
			<!--TERMINA ULTIMO MENU-->

		</div>
		<!--TERMINA CONTENEDOR PRINCIPAL-->
		
		<div class="row">
			<div class="panel panel-default col-md-6">
				<div class="panel-heading text-center">TITULAR DE LA UNIDAD
					RESPONSABLE O SERVIDOR PUBLICO FACULTADO</div>
				<div class="panel-body">
					<div class="row col-md-10">
						<img src="" class="img-rounded"
							alt="Imagen de la firma escaneada. " width="304" height="173">
					</div>
				</div>
			</div>
			<!--                <div class="panel panel-default col-md-1"></div>-->
			<div class="panel panel-default col-md-6">
				<div class="panel-heading text-center">COMISIONADO</div>
				<div class="panel-body">
					<div class="row col-md-10">
						<img src="" class="img-rounded"
							alt="Imagen de la firma escaneada. " width="304" height="173">
					</div>
				</div>
			</div>
		</div>
	</div>
<!-- </form> -->

	<div class="form-group">
		<div class="col-md-offset-1 ">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

			<button type="submit" class="btn btn-success" id="btn_GeneraOmvi" name="btn_GeneraOmvi">Generar Omvi</button>
			<!--<a href="#menu1" class="btn btn-primary btn-info" data-toggle="pill">Siguiente</a>-->
		</div>
	</div>

	</form>

</body>
</html>
