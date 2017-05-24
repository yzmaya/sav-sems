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
            
        window.addEventListener("load", inicio);
    
        function inicio(){
            var x = document.getElementById("selectClase");
            var optionEc = document.createElement("option");
                var optionTe = document.createElement("option");
                optionEc.text = "Economico";
                optionTe.text = "Terrestre";

            if(claseServ.value == "Economico"){
                x.add(optionEc);
                x.add(optionTe);
            }
            
            if(claseServ.value == "Terrestre"){
                x.add(optionTe);
                x.add(optionEc);
            }
            
            if(caractViat.value == "Zona-Marginada"){
            document.getElementById("Caracteristicas_Viat1").checked = true;
            }
            if(caractViat.value == "J-hasta-G"){
            document.getElementById("Caracteristicas_Viat2").checked = true;
            }
            if(caractViat.value == "P-hasta-K"){
            document.getElementById("Caracteristicas_Viat3").checked = true;
            }
            if(caractViat.value == "Personal-Operativo"){
            document.getElementById("Caracteristicas_Viat4").checked = true;
            }
            
            
                if(idCOMPERCO.value == null || idCOMPERCO.value == ""){
                   
                    var fields = document.getElementById("formCOMPERCO").getElementsByTagName('*');
                    for(var i = 0; i < fields.length; i++)
                    {
                        fields[i].disabled = true;
                        fields[i].value="";
                    }
                    omviOficioComision.value="";
                    datepicker2.value="";
                }else if(idCOMPERCO.value != "" || idCOMPERCO.value != null){
                    
                    var fields = document.getElementById("formCOMPERCO").getElementsByTagName('*');
                    for(var i = 0; i < fields.length; i++)
                    {
                        fields[i].disabled = false;
                    }
                }
        }
        
        function desactivaCOMPERCO(){
            var sel = document.getElementById("selectClase");
                if(sel.value == "Economico"){
                    var fields = document.getElementById("formCOMPERCO").getElementsByTagName('*');
                    for(var i = 0; i < fields.length; i++)
                    {
                        fields[i].disabled = true;
                        fields[i].value="";
                    }
                }else if(sel.value == "Terrestre"){
                    var fields = document.getElementById("formCOMPERCO").getElementsByTagName('*');
                    for(var i = 0; i < fields.length; i++)
                    {
                        fields[i].disabled = false;
                    }
                   location.reload(true);
                }
        }
            
            function pasaOmviFecha(){
                omviOficioComision.value = omvi.value;
                datepicker2.value = datepicker.value;
            }

            function pasaValorMotivo(){
                motivo_comis_anexo2.value = Motivo_Comision.value;
                motivoComisCOMPERCO.value = Motivo_Comision.value;
            }
            
            function pasaValorObservaciones(){
                observ_anexo2.value = Observaciones.value;
            }
            
            function realizaCalculosMinViatNac(){
                Importe.value = parseFloat(Cuota_Diaria.value) * parseFloat(Dias.value);
                Total_Importe.value = Importe.value;
            }

            function realizaCalculosCOMPERCO(){
                var km1 =km1Itinerario.value;
                var km2 = km2Itinerario.value;
                if(km1 == null || km1 ==""){
                    km1 = 0;
                }
                if(km2 == null || km2 ==""){
                    km2 = 0;
                }
                var totalKM = parseFloat(km1) + parseFloat(km2);
                var precioVigGas = parseFloat(precioVigenteGasolina1.value).toFixed(2);
                kmRecorridos.value = parseFloat(totalKM).toFixed(2);
                litrosGas1.value = parseFloat(totalKM / 5).toFixed(2);
                litrosGas2.value = litrosGas1.value;
                precioVigenteGasolina2.value = precioVigGas;
                importeTotalGas.value = parseFloat(parseFloat(litrosGas2.value) * precioVigGas).toFixed(2);
            }
            
            function setIdOMVI(){
                var datosOMVI = $('#formOMVI').serialize();
                $.ajax({
                    type:"POST",
                    url:"setIdOMVI",
                    data: datosOMVI,
                    success: function(){
                        alert('succes');
                    }/*,error:function(err){
                        alert('Error: '+err.responseText);
                    }*/
                });
            }
            
            function updateOMVI(){

                var datosDestinoOrdSer = $('#formDestinoOrdSer').serialize();
                var datosObjComision = $('#formObjComision').serialize();
                var datosDestViatNac = $('#formDestinos_Viat_Nac').serialize();
                var datosCOMPERCO = $('#formCOMPERCO').serialize();
                var datosOMVI = $('#formOMVI').serialize();
                
                $.ajax({
                    type: "POST",
                    url: "updateDestinoOrdSer",
                    data: datosDestinoOrdSer,
                    success: function() {
                        alert('succes');
                        //alert('Datos serializados: '+datosDestinoOrdSer);
                    }
                });
                
                $.ajax({
                    type: "POST",
                    url: "updateObjComision",
                    data: datosObjComision,
                    success: function() {
                        alert('succes');
                        //alert('Datos serializados: '+datosObjComision);
                    }
                });
                
                $.ajax({
                    type: "POST",
                    url: "updateDestViatNac",
                    data: datosDestViatNac,
                    success: function() {
                        alert('succes');
                        //alert('Datos serializados: '+datosDestViatNac);
                    }
                });
                
                $.ajax({
                    type:"POST",
                    url:"updateCOMPERCO",
                    data: datosCOMPERCO,
                    success: function(){
                        alert('succes');
                    }
                });
                
                $.ajax({
                    type: "POST",
                    url: "updateOMVI",
                    data: datosOMVI,
                    success: function() {
                        alert('succes');
                        //alert('Datos serializados: '+datosOMVI);
                    }/*,error: function(err){
                        alert(err.responseText);
                        alert('Datos: '+datosOMVI);
                    }*/
                });
                
                alert("OMVI Actualizado");
            }
            
        </script>
    </head>
<body>

	<input type="hidden" name="caractViat" id="caractViat" value="${viatNac.caracteristicas_Viat}">
        <input type="hidden" name="claseServ" id="claseServ" value="${destOrdSer.clase_Servicio}">
        <input type="hidden" name="idCOMPERCO" id="idCOMPERCO" value="${omvi.id_COMPERCO}">
        
        
        <!--Lo siguiente contiene el menu desplegable-->
      
                                      
  <div class="dropdown">
      <!-- boton para cancelar-->
        <button class="btn btn-danger" onclick="ir()">Cancelar</button>
      <!---->
    <button class="btn btn-info dropdown-toggle" type="button" id="menu1" data-toggle="dropdown">Imprimir
    <span class="caret"></span></button>
    <ul class="dropdown-menu" role="menu" aria-labelledby="menu1">
        <li role="presentation"><a role="menuitem" tabindex="-1" href="lComperco?id=${omvi.id_OMVI}" target="_blank">Comperco</a></li>
      <li role="presentation"><a role="menuitem" tabindex="-1" href="lPasajes?id=${omvi.id_OMVI}" target="_blank">Pasajes Nacionales</a></li>
      <li role="presentation"><a role="menuitem" tabindex="-1" href="lViaticos?id=${omvi.id_OMVI}" target="_blank">Viaticos Nacionales</a></li>
      <li role="presentation" class="divider"></li>
      <li role="presentation"><a role="menuitem" tabindex="-1" href="lComprobante?id=${omvi.id_OMVI}" target="_blank">Comprobante de Viaticos</a></li>
    </ul>
  </div>
        <!--aqui empieza el contenedor de pesta�as-->
        <div class="container">
		<h2>Modificar Viaticos</h2>
            <ul class="nav nav-pills">
                <li class="active"><a data-toggle="pill" href="#comisionado">Orden
                        de Servicio para Pasajes Nacionales</a></li>
                <li><a data-toggle="pill" href="#menuViatNac">Orden de
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
                    <form id="formOMVI" name="formOMVI" method="post">
                        <div class="panel-body">
                        <div class="row">
                            <label class=" control-label col-md-6"> NUMERO</label> <label
                                class=" control-label col-md-6"> FECHA</label>
                        </div>
                        <div class="row">
                            <div class="col-md-4">
                                <input type="text" class="form-control" id="omvi" name="omvi" value="${omvi.id_OMVI}">
                            </div>
                            <div class="col-md-8">
                                <input type="text" class="form-control" id="datepicker" name="datepicker" readonly="readonly" value="${omvi.fecha_OMVI}">
                            </div>
                        </div>
                        </div>
                    </form>
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
                                           value="${user.ap_Paterno} ${user.ap_Materno} ${user.nombre_s}" disabled>
                                </div>
                                <div class="col-md-4">
                                    <input type="text" class="form-control" id="rfc" name="rfc"
                                           value="${user.RFC}" disabled>
                                </div>
                                <div class="col-md-4">
							<input type="text" class="form-control" id="puesto" name="puesto"
                                           value="${puesto.denominacion_Puesto}" disabled>
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
                                           value="${puesto.cve_Nivel_Puesto}" disabled>
                                </div>
                                <div class="col-md-8">
							<input type="text" class="form-control" id="area_adsc"
								name="area_adsc"
                                           value="${user.area_Adscripcion}" disabled>
                                </div>
                            </div>
                            <br>
                            <div class="row">
                                <div class="col-md-1">
                                    <label class="control-label">DOMICILIO:</label>
                                </div>
                                <div class="col-md-11">
							<input type="text" class="form-control" id="domAA" name=""
                                           value="${user.direccion_Area_Adscripcion}" disabled>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>

            <div class="tab-content">
                <!--INICIA CONTENEDOR PRINCIPAL-->
                <div id="comisionado" class="tab-pane fade in active">
                    <form id="formDestinoOrdSer" name="formDestinoOrdSer" method="post">
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
                                                   name="punto_partida" value="${destOrdSer.punto_Partida}">
                                        </div>
                                        <div class="col-md-6">
                                            <input type="text" class="form-control" id="punto_llegada"
                                                   name="punto_llegada" value="${destOrdSer.punto_Llegada}" onclick="pasaOmviFecha()" onkeyup="pasaOmviFecha()">
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
                                                   name="otro_destino" value="${destOrdSer.otro_Destino}">
                                        </div>
                                        <div class="col-md-6">
                                            <select class="form-control" id="selectClase" name="selectClase" onchange="desactivaCOMPERCO()"></select>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                    <form id="formObjComision" name="formObjComision" method="post">
                        <div class="row">
                            <div class="panel panel-default col-md-7">
                                <div class="panel-heading">OBJETO DE LA COMISION</div>
                                <div class="panel-body">
                                    <div class="row">
                                        <textarea class="form-control" id="Motivo_Comision" name="Motivo_Comision" rows="8" onkeyup="pasaValorMotivo()">${motComision.motivo_Comision}</textarea>
                                    </div>
                                </div>
                            </div>
                            <div class="panel col-md-1"></div>
                            <div class="panel panel-default col-md-4">
                                <div class="panel-heading">SELLO DE LA U.A.</div>
                                <div class="panel-body">
                                    <div class="row col-md-10">
                                        <img src="" class="img-rounded" id="selloUA" name="selloUA" 
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
                                        <textarea class="form-control" id="Observaciones"  name="Observaciones" rows="5" onkeyup="pasaValorObservaciones()">${motComision.observaciones}</textarea>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
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

                <div id="menuViatNac" class="tab-pane fade">
                    <form id="formDestinos_Viat_Nac" name="formDestinos_Viat_Nac" method="post"><!-- Inicia formDestinosViaticosNacionales -->
                        <div class="row">
                            <div class="panel panel-default col-md-6">
                                <div class="panel-heading text-center">LUGAR(ES) Y
                                    PERIODO(S) DE LA COMISION</div>
                                <div class="panel-body">
                                    <div class="col-md-6">
                                        <input type="text" class="form-control" id="Lugar" name="Lugar" value="${destViatNac.lugar}">
                                    </div>
                                    <div class="col-md-6">
                                        <input type="text" class="form-control" id="Periodo" name="Periodo" value="${destViatNac.periodo}">
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default col-md-2">
                                <div class="panel-heading text-center">CUOTA DIARIA</div>
                                <div class="panel-body">
                                    <div>
                                        <input type="text" class="form-control" id="Cuota_Diaria" name="Cuota_Diaria" value="${destViatNac.cuota_Diaria}">
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default col-md-2">
                                <div class="panel-heading text-center">DIAS</div>
                                <div class="panel-body">
                                    <div>
                                        <input type="text" class="form-control" id="Dias" name="Dias" onkeyup="realizaCalculosMinViatNac()" value="${destViatNac.dias}">
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default col-md-2">
                                <div class="panel-heading text-center">IMPORTE</div>
                                <div class="panel-body">
                                    <div>
                                        <input type="text" class="form-control" id="Importe" name="Importe" value="${destViatNac.importe}">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="panel panel-default col-md-offset-10">
                                <div class="panel-heading text-center">TOTAL</div>
                                <div class="panel-body">
                                    <input type="text" class="form-control" id="Total_Importe" name="Total_Importe" value="${viatNac.total_Importe}">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="panel panel-default col-md-6">
                                <div class="panel-heading text-center">MOTIVO DE LA COMISION</div>
                                <div class="panel-body">
                                    <div class="row">
                                        <textarea class="form-control" id="motivo_comis_anexo2" name="motivo_comis_anexo2" rows="5">${motComision.motivo_Comision}</textarea>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default col-md-6">
                                <div class="panel-heading text-center">OBSERVACIONES</div>
                                <div class="panel-body">
                                    <div class="row">
                                        <textarea class="form-control" id="observ_anexo2" name="observ_anexo2" rows="5">${motComision.observaciones}</textarea>
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
                                            <label class="control-label col-md-4">
                                                <input type="radio" value="Zona-Marginada" id="Caracteristicas_Viat1" name="Caracteristicas_Viat"></label>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <label class="control-label col-md-3">GRUPOS JERARQUICOS</label>
                                        <div class="col-md-9">
                                            <label class="control-label col-md-4">
                                                <input type="radio" value="J-hasta-G" id="Caracteristicas_Viat2" name="Caracteristicas_Viat">J hasta G</label> 
                                            <label class="control-label col-md-4">
                                                <input type="radio" value="P-hasta-K" id="Caracteristicas_Viat3" name="Caracteristicas_Viat">P hasta K</label> 
                                            <label class="control-label col-md-4">
                                                <input type="radio" value="Personal-Operativo" id="Caracteristicas_Viat4" name="Caracteristicas_Viat">PERSONAL OPERATIVO</label>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form> <!-- Termina formDestinosViaticosNacionales -->
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
                                                       id="dc2-1" name="" value=""></td>
                                            <td><input type="text" class="form-control col-md-1"
                                                       id="dc2-2" name="" value=""></td>
                                            <td><input type="text" class="form-control col-md-1"
                                                       id="dc2-3" name="" value=""></td>
                                            <td><input type="text" class="form-control col-md-1"
                                                       id="dc2-4" name="" value=""></td>
                                            <td><input type="text" class="form-control col-md-1"
                                                       id="dc2-5" name="" value=""></td>
                                            <td><input type="text" class="form-control col-md-1"
                                                       id="dc2-6" name="" value=""></td>
                                            <td><input type="text" class="form-control col-md-1"
                                                       id="dc2-7" name="" value=""></td>
                                            <td><input type="text" class="form-control col-md-1"
                                                       id="dc2-8" name="" value=""></td>
                                            <td><input type="text" class="form-control col-md-1"
                                                       id="dc2-9" name="" value=""></td>
                                            <td><input type="text" class="form-control col-md-1"
                                                       id="dc2-10" name="" value=""></td>
                                            <td><input type="text" class="form-control col-md-1"
                                                       id="dc2-11" name="" value=""></td>
                                            <td><input type="text" class="form-control col-md-1"
                                                       id="dc2-12" name="" value=""></td>
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
                    <!-- ******************************Inicia form COMPERCO************************************************* -->
                    <form id="formCOMPERCO" name="formCOMPERCO" method="post">
                        <div class="row">
                            <div class="panel panel-default col-md-6">
                                <div class="panel-heading">COMISION O TRABAJO A DESARROLLAR</div>
                                <div class="panel-body">
                                    <textarea class="form-control" id="motivoComisCOMPERCO" name="motivoComisCOMPERCO" rows="5">${motComision.motivo_Comision}</textarea>
                                </div>
                            </div>
                            <div class="panel panel-default col-md-6">
                                <div class="panel-heading">OFICIO DE COMISION</div>
                                <div class="panel-body">
                                    <div class="panel panel-default col-md-6">
                                        <div class="panel-heading">NUMERO</div>
                                        <div class="panel-body">
                                            <input type="text" class="form-control" id="omviOficioComision" name="omviOficioComision" value="${omvi.id_OMVI}">
                                        </div>
                                    </div>
                                    <div class="panel panel-default col-md-6">
                                        <div class="panel-heading">FECHA</div>
                                        <div class="panel-body">
                                            <input type="text" class="form-control" id="datepicker2" name="datepicker2" value="${omvi.fecha_OMVI}"
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
                                                           id="fecha1Itinerario" name="fecha1Itinerario" value="${itinerario1.fecha_Itinerario}"></td>
                                                <td><input type="text" class="form-control col-md-1"
                                                           id="de1Itinerario" name="de1Itinerario" value="${itinerario1.origenDe}"></td>
                                                <td><input type="text" class="form-control col-md-1"
                                                           id="a1Itinerario" name="a1Itinerario" value="${itinerario1.destinoA}"></td>
                                                <td><input type="text" class="form-control col-md-1"
                                                           id="km1Itinerario" name="km1Itinerario" value="${itinerario1.distancia_Km}"></td>
                                            </tr>
                                            <tr>
                                                <td><input type="text" class="form-control col-md-1"
                                                           id="fecha2Itinerario" name="fecha2Itinerario" value="${itinerario2.fecha_Itinerario}"></td>
                                                <td><input type="text" class="form-control col-md-1"
                                                           id="de2Itinerario" name="de2Itinerario" value="${itinerario2.origenDe}"></td>
                                                <td><input type="text" class="form-control col-md-1"
                                                           id="a2Itinerario" name="a2Itinerario" value="${itinerario2.destinoA}"></td>
                                                <td><input type="text" class="form-control col-md-1"
                                                           id="km2Itinerario" name="km2Itinerario" value="${itinerario2.distancia_Km}"></td>
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
                                            <input type="text" class="form-control" id="precioVigenteGasolina1" name="precioVigenteGasolina1" onkeyup="realizaCalculosCOMPERCO()" value="${comperco.precio_Vigente_Gasolina}">
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
                                            <input type="text" class="form-control" id="kmRecorridos" name="kmRecorridos" value="${itinerario.distancia_Km}">
                                        </div>
                                        <div class="col-md-6">
                                            <input type="text" class="form-control" id="litrosGas1" name="litrosGas1" value="${comperco.litros_Gasolina}">
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
                                            <input type="text" class="form-control" id="litrosGas2" name="litrosGas2" value="${comperco.litros_Gasolina}">
                                        </div>
                                        <div class="col-md-4">
                                            <input type="text" class="form-control" id="precioVigenteGasolina2" name="precioVigenteGasolina2" value="${comperco.precio_Vigente_Gasolina}">
                                        </div>
                                        <div class="col-md-4">
                                            <input type="text" class="form-control" id="importeTotalGas" name="importeTotalGas" value="${comperco.importe_Gasolina}">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form> <!-- ******************************Termina form COMPERCO************************************************* -->
                </div>

                <div id="menu3" class="tab-pane fade">
                    <!--INICIA ULTIMO MENU-->
                    <div class="row">
                        <label class="control-label col-md-1">OC/OMVI No.</label>
                        <div class="col-md-2">
                            <input class="form-control" type="text" id="omviCompViaicos" name="omviCompViaicos" value="${omvi.id_OMVI}">
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
                                            <td><input class="form-control" type="text" id="cveURCompViat" name="cveURCompViat" value="600"></td>
                                            <td><input class="form-control" type="text" id="denomURCompViat" name="denomURCompViat" value="SEMS"></td>
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
                                            <td><input class="form-control" type="text" id="omvi2CompViaicos" name="omvi2CompViaicos" value="${omvi.id_OMVI}"></td>
                                            <td><input class="form-control" type="text" id="fechaOMVICompViat" name="fechaOMVICompViat" value="${omvi.fecha_OMVI}"></td>
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
                                            <td><input class="form-control" type="text" id="totalMinistViaticos" name="totalMinistViaticos"></td>
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
                                            class="form-control" type="text" id="totalDocReqFiscales" name="totalDocReqFiscales"></label>
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
                                            class="form-control" type="text" id="totalGastosNoComprob" name="totalGastosNoComprob"></label>
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
                                                <td><input class="form-control" type="text" id="conceptoGastosNoComprob"
                                                           name=""></td>
                                                <td><input class="form-control" type="text" id="importeGastosNoComprob"
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
                                        class="form-control" type="text" id="totalRecursosIntegDGPyRF" name="totalRecursosIntegDGPyRF"></label>
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
                                        class="form-control" type="text" id="totalRecIntServPub" name="totalRecIntServPub"></label>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <label class="control-label col-md-offset-10">Saldo:<input
                                class="form-control" type="text" id="saldoCompViat" name="saldoCompViat"></label>
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

                <button id="btn_updateOmvi" name="btn_updateOmvi" onClick="updateOMVI()" class="btn btn-success">Generar Omvi</button>
                <!--<a href="#menu1" class="btn btn-primary btn-info" data-toggle="pill">Siguiente</a>-->
            </div>
        </div>

    </body>
</html>
