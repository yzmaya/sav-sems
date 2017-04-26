<!DOCTYPE html>
<html lang="en">
<head>
<title>Omvi</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link rel="stylesheet" type="text/css"
	href="css/jquery-ui-1.7.2.custom.css" />
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
<script type="text/javascript"
	src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.2/jquery-ui.min.js"></script>

<script>
            function ir(){
                window.location='/SAV/omvi';
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
        </script>
</head>
<body>

	
        
        
        <!--Lo siguiente contiene el menu desplegable-->
      
                                      
  <div class="dropdown">
      <!-- boton para cancelar-->
      <button class="btn btn-danger" onclick="ir()">Cancelar</button>
      <!---->
    <button class="btn btn-info dropdown-toggle" type="button" id="menu1" data-toggle="dropdown">Imprimir
    <span class="caret"></span></button>
    <ul class="dropdown-menu" role="menu" aria-labelledby="menu1">
        <li role="presentation"><a role="menuitem" tabindex="-1" href="lComperco" target="_blank">Comperco</a></li>
      <li role="presentation"><a role="menuitem" tabindex="-1" href="lPasajes" target="_blank">Pasajes Nacionales</a></li>
      <li role="presentation"><a role="menuitem" tabindex="-1" href="lViaticos" target="_blank">Viaticos Nacionales</a></li>
      <li role="presentation" class="divider"></li>
      <li role="presentation"><a role="menuitem" tabindex="-1" href="lComprobante" target="_blank">Comprobante de Viaticos</a></li>
    </ul>
  </div>

        
        <!--aqui empieza el contenedor de pestañas-->

	<div class="container">
		<h2>Modificar Viaticos</h2>
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
								value="${omvi.ID_OMVI}" disabled>
						</div>
						<div class="col-md-8">
							<input type="text" class="form-control" id="datepicker" 
							value="${natTour.NT_DATE1}">
						</div>
					</div>
				</div>
			</div>
		</div>
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
							<input type="text" class="form-control" id="nombre" name="nombre"
								value="${user.FULL_NAME}" disabled>
						</div>
						<div class="col-md-4">
							<input type="text" class="form-control" id="rfc" name="rfc"
								value="${user.RFC}" disabled>
						</div>
						<div class="col-md-4">
							<input type="text" class="form-control" id="puesto" name="puesto"
								value="${user.POSITION}" disabled>
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
							<input type="text" class="form-control" id="clave" name="clave"
								value="${user.KEY_SAV}" disabled>
						</div>
						<div class="col-md-8">
							<input type="text" class="form-control" id="area_adsc"
								name="area_adsc"
								value="${user.AREA_OF_ASCRIPTION}" disabled>
						</div>
					</div>
					<br>
					<div class="row">
						<div class="col-md-1">
							<label class="control-label">DOMICILIO:</label>
						</div>
						<div class="col-md-11">
							<input type="text" class="form-control" id="" name=""
								value="${user.ADDRESS}" disabled>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div class="tab-content">
			<!--INICIA CONTENEDOR PRINCIPAL-->
			<div id="comisionado" class="tab-pane fade in active">
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
										name="punto_partida" value="${natTour.PLACE1}">
								</div>
								<div class="col-md-6">
									<input type="text" class="form-control" id="punto_llegada"
										name="punto_llegada" value="${natTour.PLACE2}">
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
										name="otro_destino" value="${natTour.PLACE3}">
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
								<textarea class="form-control" id="obj_comision" rows="8">${natTour.MOT_COMISION}</textarea>
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
								<textarea class="form-control" id="observacione" rows="5">${natTour.OBSERVACIONES}</textarea>
							</div>
						</div>
					</div>
				</div>
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
			<form name="op" method="POST" oninput="importe.value=parseFloat(cuotaDiaria.value)*parseFloat(dias.value)">
				<div class="row">
					<div class="panel panel-default col-md-6">
						<div class="panel-heading text-center">LUGAR(ES) Y
							PERIODO(S) DE LA COMISION</div>
						<div class="panel-body">
							<div class="col-md-6">
								<input type="text" class="form-control" id="lugarComision" 
								name="" value="${natTour.PLACE1}">
							</div>
							<div class="col-md-6">
								<input type="text" class="form-control" id="periodoComision" name="">
							</div>
						</div>
					</div>
					<div class="panel panel-default col-md-2">
						<div class="panel-heading text-center">CUOTA DIARIA</div>
						<div class="panel-body">
							<div>
								<input type="text" class="form-control" id="cuotaDiaria" name="cuotaDiaria">
							</div>
						</div>
					</div>
					<div class="panel panel-default col-md-2">
						<div class="panel-heading text-center">DIAS</div>
						<div class="panel-body">
							<div>
								<input type="text" class="form-control" id="dias" name="dias">
							</div>
						</div>
					</div>
					<div class="panel panel-default col-md-2">
						<div class="panel-heading text-center">IMPORTE</div>
						<div class="panel-body">
							<div>
								<output class="form-control" id="importe" name="importe" for="cuotaDiaria dias" ></output>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="panel panel-default col-md-offset-10">
						<div class="panel-heading text-center">TOTAL</div>
						<div class="panel-body">
							<input type="text" class="form-control" id="total" name="total" value="" disabled>
						</div>
					</div>
				</div>
				</form>
				<div class="row">
					<div class="panel panel-default col-md-6">
						<div class="panel-heading text-center">MOTIVO DE LA COMISION</div>
						<div class="panel-body">
							<div class="row">
								<textarea class="form-control" id="motivo_comis_anexo2" rows="5">${natTour.MOT_COMISION}</textarea>
							</div>
						</div>
					</div>
					<div class="panel panel-default col-md-6">
						<div class="panel-heading text-center">OBSERVACIONES</div>
						<div class="panel-body">
							<div class="row">
								<textarea class="form-control" id="observ_anexo2" rows="5">${natTour.MOT_COMISION}</textarea>
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
							<textarea class="form-control" id="observaciones" rows="5">${natTour.MOT_COMISION}</textarea>
						</div>
					</div>
					<div class="panel panel-default col-md-6">
						<div class="panel-heading">OFICIO DE COMISION</div>
						<div class="panel-body">
							<div class="panel panel-default col-md-6">
								<div class="panel-heading">NUMERO</div>
								<div class="panel-body">
									<input type="text" class="form-control" id="numOficio" name="numOficio" value="${omvi.ID_OMVI}">
								</div>
							</div>
							<div class="panel panel-default col-md-6">
								<div class="panel-heading">FECHA</div>
								<div class="panel-body">
									<input type="text" class="form-control" id="datepicker2" value="${natTour.NT_DATE1}"
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


	<div class="form-group">
		<div class="col-md-offset-1 ">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

			<button type="submit" class="btn btn-success" id="btn_GeneraOmvi">Generar Omvi</button>
			<!--<a href="#menu1" class="btn btn-primary btn-info" data-toggle="pill">Siguiente</a>-->
		</div>
	</div>

	</form>

</body>
</html>
