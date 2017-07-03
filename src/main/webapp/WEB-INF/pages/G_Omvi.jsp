<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html lang="en">
    <head>
        <title>GENERAR OMVI</title>
        <style>
            #selOGComp,#selOG,#selPP{
                width:90px;
            }
            #importeDCComp,#importeLiq{
                width:120px;
            }
            .modal {
                display: none;
                position: fixed;
                z-index: 1;
                left: 0;
                top: 0;
                width: 100%;
                height: 100%;
                overflow: auto;
                background-color: rgb(0,0,0);
                background-color: rgba(0,0,0,0.4);
            }

            .modal-content {
                background-color: #fefefe;
                margin: 15% auto;
                padding: 20px;
                border: 1px solid #888;
                width: 40%;
            }

            .modal-footer{
                background-color: #fefefe;
                margin: 15% auto;
                padding: 20px;
                border: 1px solid #888;
                width: 40%;
            }

            .close {
                color: #aaa;
                float: right;
                font-size: 28px;
                font-weight: bold;
            }

            .close:hover,
            .close:focus {
                color: black;
                text-decoration: none;
                cursor: pointer;
            }
        </style>

        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

        <link rel="stylesheet" type="text/css" href="resources/css/jquery-ui-1.7.2.custom.css" />
        <!-- <link rel="stylesheet" type="text/css" href="resources/css/web.css" /> -->
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js"></script>
        <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.2/jquery-ui.min.js"></script>

        <script>
            function ir(){
                window.location='/SAV/comissioner';
            }

        </script>

        <script type="text/javascript">
            
            window.addEventListener("load", inicio);
       
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
                $("#fecha1Itinerario").datepicker();
                $("#fecha2Itinerario").datepicker();
                //$("#datepicker2").datepicker();
            });
            
            function inicio(){
                //alert(document.getElementById("ultOmvi").value);
                
                if(document.getElementById("ultOmvi").value == "" || document.getElementById("ultOmvi").value == null){
                    omvi.value = parseInt(1);
                    
                }else if(document.getElementById("ultOmvi").value >=1){
                    omvi.value = parseInt(document.getElementById("ultOmvi").value) + 1;
                }
                                
                var datosOMVI = $('#formOMVI').serialize();
                if (omvi.value.match(/^[0-9]+$/)) {
                    $.ajax({
                        type:"POST",
                        url:"setIdOMVI",
                        data: datosOMVI,
                        success: function(){
                            alert('succes');
                        }});
                }
            }
            
            function validaDecimal(num){
                
                if(num != ""){
                    if(!num.value.match(/^[0-9]+(\.[0-9]{1,2})?$/)){                        
                        alert('El campo solo acepta numeros enteros y decimales.');
                        num.value="";
                    }
                }
                
            }
            
            function pasaOmvi(){
                omviOficioComision.value = omvi.value;
            }
            
            function pasaFecha(fecha){
                datepicker2.value = fecha;
            }
            
            function pasaValorLugar(){
                Lugar.value = punto_llegada.value;
            }

            function pasaValorMotivo(){
                motivo_comis_anexo2.value = Motivo_Comision.value;
                motivoComisCOMPERCO.value = Motivo_Comision.value;
            }
            
            function pasaValorObservaciones(){
                observ_anexo2.value = Observaciones.value;
            }
            
            function pasaValoresDCCompAViatNac(){
                alert('Entro a pasaValoresDCCompAViatNac');
                rs3.value = rsComp.value;
                ur3.value = urComp.value;
                gf3.value = gfComp.value;
                fn3.value = fnComp.value;
                sf3.value = sfComp.value;
                rg3.value = rgComp.value;
                ai3.value = aiComp.value;
                pp3.value = ppComp.value;
                og3.value = selOGComp.value;
                tg3.value = tgComp.value;
                ff3.value = ffComp.value;
                importeDC3.value = importeDCComp.value;
            }
            
            function realizaCalculosMinViatNac(){
                Importe.value = parseFloat(Cuota_Diaria.value) * parseFloat(Dias.value);
                Total_Importe.value = Importe.value;
            }
            
            function desactivaCOMPERCO(){
                var sel = document.getElementById("selectClase");
                if(sel.value == "Economico"){
                    var fields = document.getElementById("formCOMPERCO").getElementsByTagName('*');
                    for(var i = 0; i < fields.length; i++)
                    {
                        fields[i].disabled = true;
                    }
                    
                    omviOficioComision.value="";
                    datepicker2.value="";

                }else if(sel.value == "Terrestre"){
                    var fields = document.getElementById("formCOMPERCO").getElementsByTagName('*');
                    for(var i = 0; i < fields.length; i++)
                    {
                        fields[i].disabled = false;
                    }
                }
            }
            
            function activaOpcionesDC(){
                console.log('Se van a agregar las opciones al select...');
                var sel = document.getElementById("selectClase");
                var x = document.getElementById("selOG");
                var option1 = document.createElement("option");
                var option2 = document.createElement("option");
                
                
                if(sel.value == "Economico"){
                    x.remove(option1);
                    x.remove(option2);
                    option1.text = "37104";
                    option2.text = "37101";
                    x.add(option1);
                    x.add(option2);
                }
                
                if(sel.value == "Terrestre"){
                    x.remove(option1);
                    x.remove(option2);
                    option1.text = "37204";
                    option2.text = "37201";
                    x.add(option1);
                    x.add(option2);
                }
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
                importeDCComp.value = importeTotalGas.value;
            }
            
            function generaOmvi(){
                var datosDestinoOrdSer = $('#formDestinoOrdSer').serialize();
                var datosObjComision = $('#formObjComision').serialize();
                var datosDestViatNac = $('#formDestinos_Viat_Nac').serialize();
                var datosCOMPERCO = $('#formCOMPERCO').serialize();
                var datosOMVI = $('#formOMVI').serialize();
                var datosDocumentoContabilizador = $('#formDocumentoContabilizador').serialize();
                var modalDestino = document.getElementById('modalDestOrdSer');
                var modalDCDestino = document.getElementById('modalDCDestOrdSer');
                var modalDCCompercoViatNac = document.getElementById('modalDCCOMPViatNac');
                var modalObjCom = document.getElementById('modalObjetoComision');
                var modalViatNac= document.getElementById('modalDestViatNac');
                var modalComperco = document.getElementById('modalCOMPERCO');
                var modalOmvi = document.getElementById('modalOMVI');
                var modalSel = document.getElementById('modalSelect');
                var modalOmviOk = document.getElementById('modalOmviOk');
        
                if(punto_llegada.value == "" || punto_llegada.value ==  null || selectClase.value == "" || selectClase.value == null){
                    modalDestino.style.display = "block";
                    spOrdSer.onclick = function() {
                        modalDestino.style.display = "none";
                    }
                    window.onclick = function(event) {
                        if (event.target == modalDestino) {
                            modalDestino.style.display = "none";
                        }
                    }
                    return;
            
                }else{
                    $.ajax({
                        type: "POST",
                        url: "addDestinoOrdSer",
                        data: datosDestinoOrdSer,
                        success: function() {
                            alert('succes');
                            //alert('Datos serializados: '+datosDestinoOrdSer);
                        }
                    });
                }
        
                if(Motivo_Comision.value == ""){
                    modalObjCom.style.display = "block";
                    spObjCom.onclick = function() {
                        modalObjCom.style.display = "none";
                    }
                    window.onclick = function(event) {
                        if (event.target == modalObjCom) {
                            modalObjCom.style.display = "none";
                        }
                    }
                    return;
                }else{
                    $.ajax({
                        type: "POST",
                        url: "addObjComision",
                        data: datosObjComision,
                        success: function() {
                            alert('succes');
                            //alert('Datos serializados: '+datosObjComision);
                        }
                    });
                }
                
                
                var fieldsDCOrdSer = document.getElementById("formDCOrdSer").getElementsByTagName('*');
                var contDCOrdSer = 0;
                for(var i = 0 ; i < parseInt(fieldsDCOrdSer.length); i++){
                    if(fieldsDCOrdSer[i].value == ""){
                        contDCOrdSer+=1;
                    }
                }
                //---------------------------------------------------------------------------------------------------------------------------
                if(rs1.value == "" || ur1.value=="" || gf1.value=="" ||fn1.value=="" || sf1.value=="" || rg1.value=="" || ai1.value=="" || 
                    selPP.value=="" || selOG.value=="" || tg1.value=="" || ff1.value=="" || importeLiq.value==""){
                    modalDCDestino.style.display = "block";
                    spDCOrdSer.onclick = function() {
                        modalDCDestino.style.display = "none";
                    }
                    window.onclick = function(event) {
                        if (event.target == modalDCDestino) {
                            modalDCDestino.style.display = "none";
                        }
                    }
                    return;
                }
                //---------------------------------------------------------------------------------------------------------------------------
                if(rs2.value == "" || ur2.value=="" || gf2.value=="" ||fn2.value=="" || sf2.value=="" || rg2.value=="" || ai2.value=="" || 
                       pp2.value=="" || og2.value=="" || tg2.value=="" || ff2.value=="" || importeDC2.value==""){
                        modalDCDestino.style.display = "block";
                        spDCOrdSer.onclick = function() {
                            modalDCDestino.style.display = "none";
                        }
                        window.onclick = function(event) {
                            if (event.target == modalDCDestino) {
                            modalDCDestino.style.display = "none";
                            }
                        }
                        return;
                }
                //---------------------------------------------------------------------------------------------------------------------------
                if(rsComp.value == "" || urComp.value=="" || gfComp.value=="" ||fnComp.value=="" || sfComp.value=="" || rgComp.value=="" ||
                   aiComp.value=="" || pp3.value=="" || og3.value=="" || tgComp.value=="" || ffComp.value=="" || importeDC3.value==""){
                        modalDCCompercoViatNac.style.display = "block";
                        spDCOrdSer.onclick = function() {
                            modalDCCompercoViatNac.style.display = "none";
                        }
                        window.onclick = function(event) {
                            if (event.target == modalDCCompercoViatNac) {
                            modalDCCompercoViatNac.style.display = "none";
                            }
                        }
                        return;
                }
                //---------------------------------------------------------------------------------------------------------------------------
                if(rs3.value == "" || ur3.value=="" || gf3.value=="" ||fn3.value=="" || sf3.value=="" || rg3.value=="" || ai3.value=="" || 
                       pp3.value=="" || og3.value=="" || tg3.value=="" || ff3.value=="" || importeDC3.value==""){
                        modalDCCompercoViatNac.style.display = "block";
                        spDCOrdSer.onclick = function() {
                            modalDCCompercoViatNac.style.display = "none";
                        }
                        window.onclick = function(event) {
                            if (event.target == modalDCCompercoViatNac) {
                            modalDCCompercoViatNac.style.display = "none";
                            }
                        }
                        return;
                }
                
                //---------------------------------------------------------------------------------------------------------------------------
                var fields = document.getElementById("formDestinos_Viat_Nac").getElementsByTagName('*');
                var ind=0;
                for(var i = 0; i < parseInt(fields.length)-parseInt(1); i++){
                    if(fields[i].value==""){
                        ind+=1;
                    }
                }
        
                if(ind > 0){
                    modalViatNac.style.display = "block";
                    spViatNac.onclick = function() {
                        modalViatNac.style.display = "none";
                    }
                    window.onclick = function(event) {
                        if (event.target == modalViatNac) {
                            modalViatNac.style.display = "none";
                        }
                    }
                    return;
                }
                if(Caracteristicas_Viat1.checked == false && Caracteristicas_Viat2.checked == false && Caracteristicas_Viat3.checked == false && Caracteristicas_Viat4.checked == false){
            
                    modalSel.style.display = "block";
                    spSelect.onclick = function() {
                        modalSel.style.display = "none";
                    }
                    window.onclick = function(event) {
                        if (event.target == modalSel) {
                            modalSel.style.display = "none";
                        }
                    }
                    return;
                } else{
                    $.ajax({
                        type: "POST",
                        url: "addDestViatNac",
                        data: datosDestViatNac,
                        success: function() {
                            alert('succes');
                            //alert('Datos serializados: '+datosDestViatNac);
                        }
                    });
                    
                    $.ajax({
                        type: "POST",
                        url: "addDocumentoContabilizador",
                        data: datosDocumentoContabilizador,
                        success: function() {
                            alert('succes');
                            //alert('Datos serializados: '+datosDestViatNac);
                        }
                    });
                    
                }
        
                if(selectClase.value == "Terrestre"){
                    //alert('Va a validar comperco');
            
                    var fieldsComperco = document.getElementById("formCOMPERCO").getElementsByTagName('*');
                    var indCom=0;
                    for(var i = 0; i < parseInt(fieldsComperco.length); i++){
                        if(fieldsComperco[i].value==""){
                            console.log(fieldsComperco[i].name+": "+fieldsComperco[i].value);
                            indCom+=1;
                        }
                    }
                    console.log("Indice comperco: "+indCom);
            
                    if(indCom > 0){
                        console.log("Entro en if de indCom > 0: "+indCom);
                        modalComperco.style.display = "block";
                        spComperco.onclick = function() {
                            modalComperco.style.display = "none";
                        }
                        window.onclick = function(event) {
                            if (event.target == modalComperco) {
                                modalComperco.style.display = "none";
                            }
                        }
                        return;
                    }else{
                        $.ajax({
                            type:"POST",
                            url:"addCOMPERCO",
                            data: datosCOMPERCO,
                            success: function(){
                                alert('succes');
                            }
                        });
                    }
                }
        
                if(omvi.value=="" || datepicker.value == ""){
            
                    modalOmvi.style.display = "block";
                    spOmvi.onclick = function() {
                        modalOmvi.style.display = "none";
                    }
                    window.onclick = function(event) {
                        if (event.target == modalOmvi) {
                            modalOmvi.style.display = "none";
                        }
                    }
                    return;
                }else{
                    $.ajax({
                        type: "POST",
                        url: "addOMVI",
                        data: datosOMVI,
                        success: function() {
                            alert('succes');
                            //alert('Datos serializados: '+datosObjComision);
                        }/*,error: function(err){
                        alert(err.responseText);
                        alert('Datos: '+datosOMVI);
                    }*/
                    });
                }
                modalOmviOk.style.display = "block";
                spOmviOk.onclick = function() {
                    modalOmviOk.style.display = "none";
                }
                window.onclick = function(event) {
                    if (event.target == modalOmviOk) {
                        modalOmviOk.style.display = "none";
                    }
                }
            }
        </script>


    </head>
    <body>
        <!-- -------------------------------------------------------- -->
        <div id='modalDCDestOrdSer' class='modal'>
            <div class='modal-content'>
                <span id='spDCOrdSer' class='close'>&times;</span>
                <p>Documento Contabilizador de <strong>"Orden de servicio para Pasajes Nacionales"</strong> incompleto.</p>
            </div>
        </div>
        <!-- -------------------------------------------------------- -->
        <div id='modalDestOrdSer' class='modal'>
            <div class='modal-content'>
                <span id='spOrdSer' class='close'>&times;</span>
                <p>Datos incompletos en <strong>"Orden de servicio para Pasajes Nacionales"</strong>.</p>
            </div>
        </div>
        <!-- -------------------------------------------------------- -->
        <div id='modalObjetoComision' class='modal'>
            <div class='modal-content'>
                <span id='spObjCom' class='close'>&times;</span>
                <p>Falta Objeto de la Comision.</p>
            </div>
        </div>
        <!-- -------------------------------------------------------- -->
        <div id='modalDestViatNac' class='modal'>
            <div class='modal-content'>
                <span id="spViatNac" class='close'>&times;</span>
                <p>Datos incompletos en <strong>"Oficio de Comision/Orden de Ministracion de Viaticos Nacionales"</strong>.</p>
            </div>
        </div>
        <!-- -------------------------------------------------------- -->
        <div id='modalCOMPERCO' class='modal'>
            <div class='modal-content'>
                <span id="spComperco" class='close'>&times;</span>
                <p>Datos incompletos en <strong>"Gastos de Combustible para el Personal Comisionado"</strong>.</p>
            </div>
        </div>
        <!-- -------------------------------------------------------- -->
        <div id='modalDCCOMPViatNac' class='modal'>
            <div class='modal-content'>
                <span id="spDCCompViatNac" class='close'>&times;</span>
                <p>Documento contabilizador de <strong>"COMPERCO"</strong> incompleto.</p>
            </div>
        </div>
        <!-- -------------------------------------------------------- -->
        <div id='modalOMVI' class='modal'>
            <div class='modal-content'>
                <span id="spOmvi" class='close'>&times;</span>
                <p><strong>Ingresa fecha del OMVI.</strong></p>
            </div>
        </div>
        <!-- -------------------------------------------------------- -->
        <div id='modalSelect' class='modal'>
            <div class='modal-content'>
                <span id="spSelect" class='close'>&times;</span>
                <p><strong>Elige caracteristicas de los Viaticos.</strong></p>
            </div>
        </div>
        <!-- -------------------------------------------------------- -->
        <div id='modalOmviOk' class='modal'>
            <div class='modal-content'>
                <p><strong>Se genero correctamente el OMVI.</strong></p><br>
                <center><a href="omvi" class="btn btn-info">Aceptar</a></center>
            </div>
        </div>
        <!-- -------------------------------------------------------- -->
        <input type="hidden" id="ultOmvi" name="ultOmvi" value="${ultOmvi}">

        <!-- <form id="generaOmvi" name="generaOmvi" method="post"> -->
        <div class="container">
            <h2>Generación de Viaticos</h2>
            <ul class="nav nav-pills">
                <li class="active"><a data-toggle="pill" href="#comisionado">Orden de Servicio para Pasajes Nacionales</a></li>
                <li><a data-toggle="pill" href="#menu1">Oficio de Comision/Orden de Ministracion de Viaticos Nacionales</a></li>
                <li><a data-toggle="pill" href="#menu2">COMPERCO</a></li>
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
                    <form id="formOMVI" name="formOMVI" method="post"><div class="panel-body">
                            <div class="row">
                                <label class=" control-label col-md-6"> NUMERO</label> <label
                                    class=" control-label col-md-6"> FECHA</label>
                            </div>
                            <div class="row">
                                <div class="col-md-4">
                                    <input type="text" class="form-control" id="omvi" name="omvi" readonly>
                                </div>
                                <div class="col-md-8">
                                    <input type="text" class="form-control" id="datepicker" name="datepicker" onclick="pasaOmvi()" onchange="pasaFecha(datepicker.value)" readonly>
                                </div>
                            </div>
                        </div></form>
                </div>
            </div>
            <form id="formUser" name="user" method="post">		
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
                                           value="${puesto.denominacion_Puesto}" disabled>
                                </div>
                            </div>
                            <br>
                            <div class="row">
                                <label class="control-label col-md-4 text-center">CLAVE</label> <label
                                    class="control-label col-md-8 text-center">AREA DE ADSCRIPCION</label>
                            </div>
                            <div class="row">
                                <div class="col-md-4">
                                    <input type="text" class="form-control" id="KEY_SAV" name="KEY_SAV"
                                           value="${puesto.cve_Nivel_Puesto}" disabled>
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
                                                   name="punto_partida" value="CIUDAD DE MEXICO" readonly>
                                        </div>
                                        <div class="col-md-6">
                                            <input type="text" class="form-control" id="punto_llegada"
                                                   name="punto_llegada" value="" onkeyup="pasaValorLugar()" required>
                                        </div>
                                    </div>
                                    <br>
                                    <div class="row">
                                        <label class="control-label col-md-6 text-center">OTRO DESTINO</label> 
                                        <label class="control-label col-md-6 text-center">CLASE DE SERVICIO</label>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <input type="text" class="form-control" id="otro_destino" name="otro_destino" value="">
                                        </div>
                                        <div class="col-md-6">
                                            <select class="form-control" id="selectClase" name="selectClase" onchange="desactivaCOMPERCO()" onblur="activaOpcionesDC()">
                                                <option value=""></option>
                                                <option value="Economico">Economico</option>
                                                <option value="Terrestre">Terrestre</option>
                                            </select>
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
                                        <textarea class="form-control" id="Motivo_Comision" name="Motivo_Comision" rows="8" onkeyup="pasaValorMotivo()"></textarea>
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
                                        <textarea class="form-control" id="Observaciones" name="Observaciones" rows="5" onkeyup="pasaValorObservaciones()"></textarea>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                    <!-- ----------------------------------------- Termina National tour ---------------------------------------  -->
                    <!-- ------------------------- INICIA FORM DEL DOCUMENTO CONTABILIZADOR ORDEN DE SERVICIO----------------------  -->
                    <form id="formDCOrdSer" name="formDCOrdSer">
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
                                                <th>IMPORTE LIQUIDO</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td><input type="text" class="form-control col-md-1" id="rs1"  readonly ></td>
                                                <td><input type="text" class="form-control col-md-1" id="ur1"   readonly></td>
                                                <td><input type="text" class="form-control col-md-1" id="gf1"  readonly></td>
                                                <td><input type="text" class="form-control col-md-1" id="fn1" readonly></td>
                                                <td><input type="text" class="form-control col-md-1" id="sf1"  readonly></td>
                                                <td><input type="text" class="form-control col-md-1" id="rg1"  readonly></td>
                                                <td><input type="text" class="form-control col-md-1" id="ai1"  readonly></td>
                                                <td>
                                                    <div class="form-group">
                                                        <select class="form-control col-md-1" id="selPP" name="selPP" onchange="secc1()">
                                                            <option></option>
                                                            <option>U079</option>
                                                            <option>U006</option>
                                                            <option>P001</option>
                                                        </select>
                                                    </div> 
                                                </td>
                                                <td>
                                                    <div class="form-group" >
                                                        <select class="form-control col-md-1" id="selOG" name="selOG" onchange="secc1()">
                                                            <option></option>
                                                            <option>37504</option>
                                                            <option>26104</option>
                                                            <option>39202</option>
                                                            <option>37204</option>
                                                        </select>
                                                    </div>
                                                </td>
                                                <td><input type="text" class="form-control col-md-1" id="tg1"  readonly></td>
                                                <td><input type="text" class="form-control col-md-1" id="ff1"  readonly></td>
                                                <td><input type="text" class="form-control col-md-1" id="importeLiq" name="importeLiq" value="0"></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </form>
                    <!-- ------------------------- TERMINA FORM DEL DOCUMENTO CONTABILIZADOR ORDEN DE SERVICIO----------------------  -->
                </div>

                <div id="menu1" class="tab-pane fade">
                    <form id="formDestinos_Viat_Nac" name="formDestinos_Viat_Nac" method="post"><!-- Inicia formDestinosViaticosNacionales -->
                        <div class="row">
                            <div class="panel panel-default col-md-6">
                                <div class="panel-heading text-center">LUGAR(ES) Y PERIODO(S) DE LA COMISION</div>
                                <div class="panel-body">
                                    <div class="col-md-6">
                                        <input type="text" class="form-control" id="Lugar" name="Lugar">
                                    </div>
                                    <div class="col-md-6">
                                        <input type="text" class="form-control" id="Periodo" name="Periodo">
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default col-md-2">
                                <div class="panel-heading text-center">CUOTA DIARIA</div>
                                <div class="panel-body">
                                    <div>
                                        <input type="text" class="form-control" id="Cuota_Diaria" name="Cuota_Diaria">
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default col-md-2">
                                <div class="panel-heading text-center">DIAS</div>
                                <div class="panel-body">
                                    <div>
                                        <input type="text" class="form-control" id="Dias" name="Dias" onkeyup="realizaCalculosMinViatNac()">
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default col-md-2">
                                <div class="panel-heading text-center">IMPORTE</div>
                                <div class="panel-body">
                                    <div>
                                        <input type="text" class="form-control" id="Importe" name="Importe">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="panel panel-default col-md-offset-10">
                                <div class="panel-heading text-center">TOTAL</div>
                                <div class="panel-body">
                                    <input type="text" class="form-control" id="Total_Importe" name="Total_Importe">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="panel panel-default col-md-6">
                                <div class="panel-heading text-center">MOTIVO DE LA COMISION</div>
                                <div class="panel-body">
                                    <div class="row">
                                        <textarea class="form-control" id="motivo_comis_anexo2" name="motivo_comis_anexo2" rows="5" readonly></textarea>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default col-md-6">
                                <div class="panel-heading text-center">OBSERVACIONES</div>
                                <div class="panel-body">
                                    <div class="row">
                                        <textarea class="form-control" id="observ_anexo2" name="observ_anexo2" rows="5" readonly></textarea>
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
                    <form name="formDocumentoContabilizador" id="formDocumentoContabilizador" method="post"><!--Inicia formDocumentoContabilizador -->
                        <div class="row">
                            <div class="panel panel-default">
                                <div class="panel-heading text-center">DOCUMENTO CONTABILIZADOR</div>
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
                                                <td><input type="text" class="form-control col-md-1" id="rs2" name="rs2" value="" readonly></td>
                                                <td><input type="text" class="form-control col-md-1" id="ur2" name="ur2" value="" readonly></td>
                                                <td><input type="text" class="form-control col-md-1" id="gf2" name="gf2" value="" readonly></td>
                                                <td><input type="text" class="form-control col-md-1" id="fn2" name="fn2" value="" readonly></td>
                                                <td><input type="text" class="form-control col-md-1" id="sf2" name="sf2" value="" readonly></td>
                                                <td><input type="text" class="form-control col-md-1" id="rg2" name="rg2" value="" readonly></td>
                                                <td><input type="text" class="form-control col-md-1" id="ai2" name="ai2" value="" readonly></td>
                                                <td><input type="text" class="form-control col-md-1" id="pp2" name="pp2" value="" readonly></td>
                                                <td><input type="text" class="form-control col-md-1" id="og2" name="og2" value="" readonly></td>
                                                <td><input type="text" class="form-control col-md-1" id="tg2" name="tg2" value="" readonly></td>
                                                <td><input type="text" class="form-control col-md-1" id="ff2" name="ff2" value="" readonly></td>
                                                <td><input type="text" class="form-control col-md-1" id="importeDC2" name="importeDC2" value="" readonly></td>
                                            </tr>
                                            <tr>
                                                <td><input type="text" class="form-control col-md-1" id="rs3" name="rs3" value="" readonly></td>
                                                <td><input type="text" class="form-control col-md-1" id="ur3" name="ur3" value="" readonly></td>
                                                <td><input type="text" class="form-control col-md-1" id="gf3" name="gf3" value="" readonly></td>
                                                <td><input type="text" class="form-control col-md-1" id="fn3" name="fn3" value="" readonly></td>
                                                <td><input type="text" class="form-control col-md-1" id="sf3" name="sf3" value="" readonly></td>
                                                <td><input type="text" class="form-control col-md-1" id="rg3" name="rg3" value="" readonly></td>
                                                <td><input type="text" class="form-control col-md-1" id="ai3" name="ai3" value="" readonly></td>
                                                <td><input type="text" class="form-control col-md-1" id="pp3" name="pp3" value="" readonly></td>
                                                <td><input type="text" class="form-control col-md-1" id="og3" name="og3" value="" readonly></td>
                                                <td><input type="text" class="form-control col-md-1" id="tg3" name="tg3" value="" readonly></td>
                                                <td><input type="text" class="form-control col-md-1" id="ff3" name="ff3" value="" readonly></td>
                                                <td><input type="text" class="form-control col-md-1" id="importeDC3" name="importeDC3" value="" readonly></td>
                                            </tr>
                                            <tr>
                                                <td><input type="text" class="form-control col-md-1" id="rs4" name="rs4" value="" readonly></td>
                                                <td><input type="text" class="form-control col-md-1" id="ur4" name="ur4" value="" readonly></td>
                                                <td><input type="text" class="form-control col-md-1" id="gf4" name="gf4" value="" readonly></td>
                                                <td><input type="text" class="form-control col-md-1" id="fn4" name="fn4" value="" readonly></td>
                                                <td><input type="text" class="form-control col-md-1" id="sf4" name="sf4" value="" readonly></td>
                                                <td><input type="text" class="form-control col-md-1" id="rg4" name="rg4" value="" readonly></td>
                                                <td><input type="text" class="form-control col-md-1" id="ai4" name="ai4" value="" readonly></td>
                                                <td><input type="text" class="form-control col-md-1" id="pp4" name="pp4" value="" readonly></td>
                                                <td><input type="text" class="form-control col-md-1" id="og4" name="og4" value="" readonly></td>
                                                <td><input type="text" class="form-control col-md-1" id="tg4" name="tg4" value="" readonly></td>
                                                <td><input type="text" class="form-control col-md-1" id="ff4" name="ff4" value="" readonly></td>
                                                <td><input type="text" class="form-control col-md-1" id="importeDC4" name="importeDC4" value="" readonly></td>
                                            </tr>
                                            <tr>
                                                <td><input type="text" class="form-control col-md-1" id="rs5" name="rs5" value="" readonly></td>
                                                <td><input type="text" class="form-control col-md-1" id="ur5" name="ur5" value="" readonly></td>
                                                <td><input type="text" class="form-control col-md-1" id="gf5" name="gf5" value="" readonly></td>
                                                <td><input type="text" class="form-control col-md-1" id="fn5" name="fn5" value="" readonly></td>
                                                <td><input type="text" class="form-control col-md-1" id="sf5" name="sf5" value="" readonly></td>
                                                <td><input type="text" class="form-control col-md-1" id="rg5" name="rg5" value="" readonly></td>
                                                <td><input type="text" class="form-control col-md-1" id="ai5" name="ai5" value="" readonly></td>
                                                <td><input type="text" class="form-control col-md-1" id="pp5" name="pp5" value="" readonly></td>
                                                <td><input type="text" class="form-control col-md-1" id="og5" name="og5" value="" readonly></td>
                                                <td><input type="text" class="form-control col-md-1" id="tg5" name="tg5" value="" readonly></td>
                                                <td><input type="text" class="form-control col-md-1" id="ff5" name="ff5" value="" readonly></td>
                                                <td><input type="text" class="form-control col-md-1" id="importeDC5" name="importeDC5" value="" readonly></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </form><!--Termina formDocumentoContabilizador -->
                </div>

                <div id="menu2" class="tab-pane fade">
                    <!-- ******************************Inicia form COMPERCO************************************************* -->
                    <form id="formCOMPERCO" name="formCOMPERCO" method="post">
                        <div class="row">
                            <div class="panel panel-default col-md-6">
                                <div class="panel-heading">COMISION O TRABAJO A DESARROLLAR</div>
                                <div class="panel-body">
                                    <textarea class="form-control" id="motivoComisCOMPERCO" name="motivoComisCOMPERCO" rows="5" readonly></textarea>
                                </div>
                            </div>
                            <div class="panel panel-default col-md-6">
                                <div class="panel-heading">OFICIO DE COMISION</div>
                                <div class="panel-body">
                                    <div class="panel panel-default col-md-6">
                                        <div class="panel-heading">NUMERO</div>
                                        <div class="panel-body">
                                            <input type="text" class="form-control" id="omviOficioComision" name="omviOficioComision" readonly>
                                        </div>
                                    </div>
                                    <div class="panel panel-default col-md-6">
                                        <div class="panel-heading">FECHA</div>
                                        <div class="panel-body">
                                            <input type="text" class="form-control" id="datepicker2" name="datepicker2"
                                                   readonly="readonly">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="panel panel-default">
                                <div class="panel-heading text-center">DOCUMENTO CONTABILIZADOR</div>
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
                                                <td><input type="text" class="form-control col-md-1" id="rsComp" name="rsComp" value="" readonly></td>
                                                <td><input type="text" class="form-control col-md-1" id="urComp" name="urComp" value="" readonly></td>
                                                <td><input type="text" class="form-control col-md-1" id="gfComp" name="gfComp" value="" readonly></td>
                                                <td><input type="text" class="form-control col-md-1" id="fnComp" name="fnComp" value="" readonly></td>
                                                <td><input type="text" class="form-control col-md-1" id="sfComp" name="sfComp" value="" readonly></td>
                                                <td><input type="text" class="form-control col-md-1" id="rgComp" name="rgComp" value="" readonly></td>
                                                <td><input type="text" class="form-control col-md-1" id="aiComp" name="aiComp" value="" readonly></td>
                                                <td><input type="text" class="form-control col-md-1" id="ppComp" name="ppComp" value="" readonly></td>
                                                <td><select id="selOGComp" name="selOGComp" class="form-control col-md-1" height="30px" line-height="30px" onChange="secc1COMPERCO()" onblur="pasaValoresDCCompAViatNac()">
                                                        <option></option>
                                                        <option>26104</option>
                                                        <option>26103</option>
                                                    </select></td>
                                                <td><input type="text" class="form-control col-md-1" id="tgComp" name="tgComp" value="" readonly></td>
                                                <td><input type="text" class="form-control col-md-1" id="ffComp" name="ffComp" value="" readonly></td>
                                                <td><input type="text" class="form-control col-md-1" id="importeDCComp" name="importeDCComp" value="" readonly></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div> 

                        <div class="row">
                            <div class="panel panel-default">
                                <div class="panel-heading text-center">ITINERARIO</div>
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
                                                           id="fecha1Itinerario" name="fecha1Itinerario" value="" readonly></td>
                                                <td><input type="text" class="form-control col-md-1"
                                                           id="de1Itinerario" name="de1Itinerario" value=""></td>
                                                <td><input type="text" class="form-control col-md-1"
                                                           id="a1Itinerario" name="a1Itinerario" value=""></td>
                                                <td><input type="text" class="form-control col-md-1"
                                                           id="km1Itinerario" name="km1Itinerario" value="" onblur="validaDecimal(km1Itinerario)"></td>
                                            </tr>
                                            <tr>
                                                <td><input type="text" class="form-control col-md-1"
                                                           id="fecha2Itinerario" name="fecha2Itinerario" value="" readonly></td>
                                                <td><input type="text" class="form-control col-md-1"
                                                           id="de2Itinerario" name="de2Itinerario" value=""></td>
                                                <td><input type="text" class="form-control col-md-1"
                                                           id="a2Itinerario" name="a2Itinerario" value=""></td>
                                                <td><input type="text" class="form-control col-md-1"
                                                           id="km2Itinerario" name="km2Itinerario" value="" onblur="validaDecimal(km2Itinerario)"></td>
                                            </tr>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="panel panel-default col-md-2">
                                <div class="panel-heading text-center">PRECIO VIGENTE DEL LITRO DE
                                    GASOLINA</div>
                                <div class="panel-body">
                                    <div class="row">
                                        <label class="control-label col-md-2">$</label>
                                        <div class="col-md-9">
                                            <input type="text" class="form-control" id="precioVigenteGasolina1" name="precioVigenteGasolina1" onblur="validaDecimal(precioVigenteGasolina1)" 
                                                   onkeyup="realizaCalculosCOMPERCO()">
                                        </div>
                                    </div>


                                </div>
                            </div>
                            <div class="panel panel-default col-md-4">
                                <div class="panel-heading text-center">LITROS DE GASOLINA (KM/5)</div>
                                <div class="panel-body">
                                    <div class="row">
                                        <label class="control-label col-md-6 text-center">KM
                                            RECORRIDOS /5=</label> <label class="control-label col-md-6  ">LITROS
                                            DE GASOLINA</label>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-6">
                                            <input type="text" class="form-control" id="kmRecorridos" name="kmRecorridos">
                                        </div>
                                        <div class="col-md-6">
                                            <input type="text" class="form-control" id="litrosGas1" name="litrosGas1">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default col-md-6">
                                <div class="panel-heading text-center">IMPORTE</div>
                                <div class="panel-body">
                                    <div class="row">
                                        <label class="control-label col-md-4 text-center">LTS.
                                            DE GAS X</label> <label class="control-label col-md-4  ">PREC.
                                            VIGENTE DEL LTO. DE GAS.</label> <label
                                            class="control-label col-md-4  ">= IMPORTE</label>
                                    </div>
                                    <div class="row">
                                        <div class="col-md-4">
                                            <input type="text" class="form-control" id="litrosGas2" name="litrosGas2">
                                        </div>
                                        <div class="col-md-4">
                                            <input type="text" class="form-control" id="precioVigenteGasolina2" name="precioVigenteGasolina2">
                                        </div>
                                        <div class="col-md-4">
                                            <input type="text" class="form-control" id="importeTotalGas" name="importeTotalGas">
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
                            <input class="form-control" type="text" id="omviCompViaicos" name="omviCompViaicos" readonly>
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
                                            <td><input class="form-control" type="text" id="cveURCompViat" name="cveURCompViat"></td>
                                            <td><input class="form-control" type="text" id="denomURCompViat" name="denomURCompViat"></td>
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
                                            <td><input class="form-control" type="text" id="omvi2CompViaicos" name="omvi2CompViaicos"></td>
                                            <td><input class="form-control" type="text" id="fechaOMVICompViat" name="fechaOMVICompViat"></td>
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
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                <button id="btn_GeneraOmvi" name="btn_GeneraOmvi" onClick="generaOmvi()" class="btn btn-success">Generar Omvi</button>

                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                <button class="btn btn-danger" onclick="ir()">Cancelar</button>
            </div>
        </div>

        <script type="text/javascript">
            
            var text = '{"contabilizador":[' +
                '{"RS":"11","UR":"600","GF":"2","FN":"5","SF":"02","RG":"00","AI":"004","TG":"7","FF":"1" },' +
                '{"SF":"06","AI":"010","TG":"1" }]}';
            
            function secc1(){
                obj = JSON.parse(text);
                document.getElementById("rs1").value = obj.contabilizador[0].RS;
                document.getElementById("ur1").value = obj.contabilizador[0].UR;
                document.getElementById("gf1").value = obj.contabilizador[0].GF;
                document.getElementById("fn1").value = obj.contabilizador[0].FN;
                document.getElementById("sf1").value = obj.contabilizador[0].SF;
                document.getElementById("rg1").value = obj.contabilizador[0].RG;
                document.getElementById("ai1").value = obj.contabilizador[0].AI;
                document.getElementById("tg1").value = obj.contabilizador[0].TG;
                document.getElementById("ff1").value = obj.contabilizador[0].FF;
                
                //se duplica en oficio de comision/orden de ministracion
                
                if(document.getElementById("selPP").value==""){
                    alert("El campo PP esta vacio.");
                } 
                
                
                document.getElementById("rs2").value = obj.contabilizador[0].RS;
                document.getElementById("ur2").value = obj.contabilizador[0].UR;
                document.getElementById("gf2").value = obj.contabilizador[0].GF;
                document.getElementById("fn2").value = obj.contabilizador[0].FN;
                document.getElementById("sf2").value = obj.contabilizador[0].SF;
                document.getElementById("rg2").value = obj.contabilizador[0].RG;
                document.getElementById("ai2").value = obj.contabilizador[0].AI;
                document.getElementById("pp2").value = document.getElementById("selPP").value;
                document.getElementById("og2").value = document.getElementById("selOG").value;
                document.getElementById("tg2").value = obj.contabilizador[0].TG;
                document.getElementById("ff2").value = obj.contabilizador[0].FF;
                document.getElementById("importeDC2").value = document.getElementById("importeLiq").value;
                
                if(document.getElementById("selPP").value == "P001"){
                    secc2();
                }
                
            }
            
            function secc2(){
                document.getElementById("sf1").value = obj.contabilizador[1].SF;
                document.getElementById("ai1").value = obj.contabilizador[1].AI;
                document.getElementById("tg1").value = obj.contabilizador[1].TG;
            }
            
            function secc1COMPERCO(){
                obj = JSON.parse(text);
                document.getElementById("rsComp").value = obj.contabilizador[0].RS;
                document.getElementById("urComp").value = obj.contabilizador[0].UR;
                document.getElementById("gfComp").value = obj.contabilizador[0].GF;
                document.getElementById("fnComp").value = obj.contabilizador[0].FN;
                document.getElementById("sfComp").value = obj.contabilizador[0].SF;
                document.getElementById("rgComp").value = obj.contabilizador[0].RG;
                document.getElementById("aiComp").value = obj.contabilizador[0].AI;
                document.getElementById("tgComp").value = obj.contabilizador[0].TG;
                document.getElementById("ffComp").value = obj.contabilizador[0].FF;
                document.getElementById("ppComp").value = "U600";
                
                //se duplica en oficio de comision/orden de ministracion
                
                if(document.getElementById("ppComp").value==""){
                    alert("El campo PP esta vacio.");
                } 
                
                if(document.getElementById("selPPComp").value == "P001"){
                    secc2COMPERCO();
                }
                
            }
            
            function secc2COMPERCO(){
                document.getElementById("sfComp").value = obj.contabilizador[1].SF;
                document.getElementById("aiComp").value = obj.contabilizador[1].AI;
                document.getElementById("tgComp").value = obj.contabilizador[1].TG;
            }
            
        </script>
        <script src="http://code.jquery.com/jquery-1.0.4.js"></script>
    </body>
</html>
