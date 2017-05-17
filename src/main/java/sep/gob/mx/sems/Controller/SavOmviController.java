package sep.gob.mx.sems.Controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import sep.gob.mx.sems.Model.*;
import sep.gob.mx.sems.Service.*;

@Controller
public class SavOmviController {

//    private static final Logger logger = Logger.getLogger(Sav_omvi.class);
    public SavOmviController() {
        System.out.println("Sav Omvi Controller()");
    }

    @Autowired
    private OmviServ omviServ;
    @Autowired
    private COMPERCO3Service compServ;
    @Autowired
    private UsersService usrServ;
    @Autowired
    private OCMVN2Service MVN2Service;
    @Autowired
    OSPN1Service OSPN1Serv;
    
    
    Destino_ordser destinoOrdSer = new Destino_ordser();
    Objeto_comision objCom = new Objeto_comision();
    Destinos_viat_nac destViatNac = new Destinos_viat_nac();
    Viaticos_nacionales viatNac = new Viaticos_nacionales();
    Viaticos_Destinos_Nacionales viatDestNac = new Viaticos_Destinos_Nacionales();
    COMPERCO comperco = new COMPERCO();
    Itinerario itinerario1 = new Itinerario();
    Itinerario itinerario2 = new Itinerario();
    CompercoItinerario compItin1 = new CompercoItinerario();
    CompercoItinerario compItin2 = new CompercoItinerario();
    OMVI omvi = new OMVI();

    @RequestMapping(value = "/")
    public ModelAndView showInicio(HttpServletRequest request)
            throws IOException {
//        logger.info("Entro en SaOmviController-showInicio-INDEX");
        return new ModelAndView("index");
    }

    @RequestMapping(value = "/index")
    public ModelAndView showIndex(HttpServletRequest request)
            throws IOException {
        return new ModelAndView("index");
    }

    @RequestMapping(value = "/omvi")
    public ModelAndView showOmvis(ModelAndView model, HttpServletRequest request)
            throws IOException {
        List<TablaOmvi> listaTablaOmvi = new ArrayList<TablaOmvi>();
        try {
            listaTablaOmvi = omviServ.listaTablaOmvi();
//            System.out.println("Tamaño lista TRY: " + listaTablaOmvi.size());
        } catch (Exception e) {
            System.out.println("Error OMVI controller: " + e.getMessage());
            System.out.println("Tamaño lista CATCH: " + listaTablaOmvi.size());
        }

        @SuppressWarnings("rawtypes")
        Iterator itr = listaTablaOmvi.iterator();

        List<TablaOmvi> newTab = new ArrayList<TablaOmvi>();
        TablaOmvi tab;

//        System.out.println("Cargando info...");
        while (itr.hasNext()) {
            Object[] obj = (Object[]) itr.next();

            tab = new TablaOmvi();
            tab.setId_OMVI(Integer.valueOf(obj[0].toString()));
            tab.setAp_Paterno(obj[1].toString());
            tab.setAp_Materno(obj[2].toString());
            tab.setNombre_s(obj[3].toString());
            tab.setArea_Adscripcion(obj[4].toString());
            tab.setMotivo_Comision(obj[5].toString());
            tab.setTotal_Importe(Double.valueOf(obj[6].toString()));
            newTab.add(tab);

        }

        int a = newTab.size();
//        System.out.println("Tamaño newTab " + a);
//
//        System.out.println("Info cargada...");
        model.addObject("tablaOmvi", newTab);
        model.setViewName("omvi");

        return model;
    }
    
    @RequestMapping(value = "/editOmvi")
    public ModelAndView editOmvi(ModelAndView model, HttpServletRequest request) {

        UsuarioComisionado usuario = new UsuarioComisionado();
        COMPERCO comperco = new COMPERCO();
        Viaticos_nacionales viatNac = new Viaticos_nacionales();
        Destinos_viat_nac destViatNac = new Destinos_viat_nac();
        OMVI omvi = new OMVI();
        Destino_ordser destOrdSer = new Destino_ordser();
        Objeto_comision objComision = new Objeto_comision();
        Itinerario itinerario = new Itinerario();
        List<Viaticos_Destinos_Nacionales> listViatDN = new ArrayList<Viaticos_Destinos_Nacionales>();
        List<Destinos_viat_nac> listDestVN = new ArrayList<Destinos_viat_nac>();
        CompercoItinerario compItin = new CompercoItinerario();

        try {
            omvi = omviServ.getOMVIById(Integer.parseInt(request.getParameter("id")));
            usuario = usrServ.getUsuario(omvi.getId_UsrCom());//Aqui va el request del id del usuario
            compItin = compServ.getCompercoItinerarioById(omvi.getId_COMPERCO());
            comperco = compServ.getCOMPERCOById(compItin.getId_COMPERCO());
            itinerario = compServ.getItinerarioById(compItin.getID_Itinerario());
            destOrdSer = OSPN1Serv.getDestinoOrdserById(omvi.getId_Destino_OrdSer());
            objComision = OSPN1Serv.getObjetoComisionById(omvi.getId_Obj_Comision());
            listViatDN = MVN2Service.getListViaticos_Destinos_NacionalesByIdOMVI(omvi.getId_OMVI());
            listDestVN = MVN2Service.getListDestViatNacByIdOMVI(omvi.getId_OMVI());
            destViatNac = listDestVN.get(0);
//            System.out.println("*******************************************************Tamaño listDestVN: "+listDestVN.size());
//            System.out.println("Id: "+destViatNac.getId_Destino());
//            System.out.println("Lugar: "+destViatNac.getLugar());
//            System.out.println("Periodo: "+destViatNac.getPeriodo());
            viatNac = MVN2Service.getViaticos_nacionalesById(listViatDN.get(0).getId_Viaticos());
            
        } catch (NumberFormatException e) {
            System.out.println("Error Catch Number Format Exception: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("Error Exception Modifica OMVI: " + e.getMessage());
        }

        model.addObject("user", usuario);
        model.addObject("comperco", comperco);
        model.addObject("viatNac", viatNac);
        model.addObject("omvi", omvi);
        model.addObject("destOrdSer", destOrdSer);
        model.addObject("motComision", objComision);
        //------------------------------------------------------------------------------------------------------------------------------------------------
                                                     //En este punto hay que saber si hay un numero maximo de lugares y periodos que puede
         model.addObject("destViatNac", destViatNac);//tener un comisionado para ver de que manera podemos acomodar los objetos y pasarlos
                                                     //al JSP y los layouts para visualizar los datos. Por ahora solo muestra el primer registro 
                                                     //de la tabla, correspondiente al numero de omvi que se este modificando
        //------------------------------------------------------------------------------------------------------------------------------------------------
        model.addObject("itinerario", itinerario);
                
        model.setViewName("E_Omvi");

        return model;
    }
    
    @RequestMapping(value="/generaOmvi")
	public ModelAndView generaOmvi(ModelAndView model, HttpServletRequest request){
		
		UsuarioComisionado user = new UsuarioComisionado();
		Integer idUser = Integer.parseInt(request.getParameter("id"));
		try{
			user = usrServ.getUsuario(idUser);
                        omvi.setId_UsrCom(idUser);
		}catch(Exception e){
			System.out.println("Error en GeneraOmvi: "+e.getMessage());
		}
		model.addObject("user",user);
		model.setViewName("G_Omvi");
		return model;
	}
    
    @RequestMapping(value="/addDestinoOrdSer", method = RequestMethod.POST)
    public String addDestinoOrdSer(@RequestParam("punto_partida") String punto_partida,
                                   @RequestParam("punto_llegada") String punto_llegada,
                                   @RequestParam("otro_destino") String otro_destino, 
                                   @RequestParam("selectClase") String selectClase) {
        //System.out.println("***********************addDestinoOrdSer");
        
//        destinoOrdSer.setId_Destino_ORDSER(200);
        destinoOrdSer.setId_OMVI(omvi.getId_OMVI());
        destinoOrdSer.setPunto_Partida(punto_partida);
        destinoOrdSer.setPunto_Llegada(punto_llegada);
        destinoOrdSer.setOtro_Destino(otro_destino);
        destinoOrdSer.setClase_Servicio(selectClase);
//        System.out.println("destino ordser: "+destinoOrdSer.getId_Destino_ORDSER());
//        try {
//            OSPN1Serv.saveDestinoOrdser(destinoOrdSer);
//        } catch (Exception ex) {
//            System.out.println("error: "+ex.getMessage());
//        }
      
        return "Se guardo Destino Orden de Servicio correctamente";
    }
    
    
    @RequestMapping(value="/addObjComision", method = RequestMethod.POST)
    public String addObjComision(@RequestParam("Motivo_Comision") String Motivo_Comision, 
                                 @RequestParam("Observaciones") String Observaciones){
        
        //System.out.println("*******************addObjComision");

//        objCom.setId_Obj_Comision(200);
        objCom.setId_OMVI(omvi.getId_OMVI());
        objCom.setMotivo_Comision(Motivo_Comision);
        objCom.setObservaciones(Observaciones);

//        try {
//            OSPN1Serv.saveObjetoComision(objCom);
//        } catch (Exception ex) {
//            System.out.println("Error addObjComision: "+ex.getMessage());
//        }
        
        return "Se guardo Objeto Comision correctamente";
    }
    
    
    
    @RequestMapping(value="/addDestViatNac", method = RequestMethod.POST)
    public String addDestViatNac(@RequestParam("Lugar") String Lugar, 
                                 @RequestParam("Periodo") String Periodo, 
                                 @RequestParam("Cuota_Diaria") Double Cuota_Diaria, 
                                 @RequestParam("Dias") Double Dias, 
                                 @RequestParam("Importe") Double Importe,
                                 @RequestParam("Total_Importe") Double Total_Importe,
                                 @RequestParam("Caracteristicas_Viat") String Caracteristicas_Viat){
        
        //System.out.println("***********************addDestViatNac");

//        destViatNac.setId_Destino(200);
        destViatNac.setLugar(Lugar);
        destViatNac.setPeriodo(Periodo);
        destViatNac.setCuota_Diaria(Cuota_Diaria);
        destViatNac.setDias(Dias);
        destViatNac.setImporte(Importe);
        
//        viatNac.setId_Viaticos(200);
        viatNac.setTotal_Importe(Total_Importe);
        viatNac.setCaracteristicas_Viat(Caracteristicas_Viat);
        
//        viatDestNac.setId_Viat_Dest_Nac(200);
        viatDestNac.setId_OMVI(omvi.getId_OMVI());
        viatDestNac.setId_Destino(destViatNac.getId_Destino());
        viatDestNac.setId_Viaticos(viatNac.getId_Viaticos());
        
//        try{
//            MVN2Service.saveDestViatNac(destViatNac);
//            MVN2Service.saveViaticos_nacionales(viatNac);
//            MVN2Service.saveViaticos_Destinos_Nacionales(viatDestNac);
//        }catch(Exception e){
//            System.out.println("Error Destinos Viat Nac: "+e.getMessage());
//        }
        
        return "Se guardo Destinos viaticos Nacionales correctamente";
    }
    
     
    
    @RequestMapping(value="/addCOMPERCO", method= RequestMethod.POST)
    public String addCOMPERCO(@RequestParam("fecha1Itinerario") String fecha1Itinerario,
                              @RequestParam("de1Itinerario") String de1Itinerario,
                              @RequestParam("a1Itinerario") String a1Itinerario,
                              @RequestParam("km1Itinerario") Double km1Itinerario,
                              @RequestParam("fecha2Itinerario") String fecha2Itinerario,
                              @RequestParam("de2Itinerario") String de2Itinerario,
                              @RequestParam("a2Itinerario") String a2Itinerario,
                              @RequestParam("km2Itinerario") Double km2Itinerario,
                              @RequestParam("precioVigenteGasolina1") Double precioVigenteGasolina1,
                              @RequestParam("kmRecorridos") Double kmRecorridos,//OPCIONAL USARLO
                              @RequestParam("litrosGas1") Double litrosGas1,
                              @RequestParam("litrosGas2") Double litrosGas2,
                              @RequestParam("precioVigenteGasolina2") Double precioVigenteGasolina2,
                              @RequestParam("importeTotalGas") Double importeTotalGas,
                              @RequestParam("datepicker2") String datepicker2){
        //System.out.println("********************************************addCOMPERCO");

//        comperco.setId_COMPERCO(200);
        comperco.setFecha_COMPERCO(datepicker2);
        comperco.setImporte_Gasolina(importeTotalGas);
        comperco.setLitros_Gasolina(litrosGas1);
        comperco.setPrecio_Vigente_Gasolina(precioVigenteGasolina1);
        
//        itinerario1.setId_Itinerario(200);
        itinerario1.setFecha_Itinerario(fecha1Itinerario);
        itinerario1.setOrigenDe(de1Itinerario);
        itinerario1.setDestinoA(a1Itinerario);
        itinerario1.setDistancia_Km(km1Itinerario);
        
//        itinerario2.setId_Itinerario(201);
        itinerario2.setFecha_Itinerario(fecha2Itinerario);
        itinerario2.setOrigenDe(de2Itinerario);
        itinerario2.setDestinoA(a2Itinerario);
        itinerario2.setDistancia_Km(km2Itinerario);
        
        compItin1.setID_Itinerario(itinerario1.getId_Itinerario());
        compItin1.setId_COMPERCO(comperco.getId_COMPERCO());
        compItin1.setId_OMVI(omvi.getId_OMVI());
        compItin1.setId_COMPERCOItinerario(200);
        
        compItin2.setID_Itinerario(itinerario2.getId_Itinerario());
        compItin2.setId_COMPERCO(comperco.getId_COMPERCO());
        compItin2.setId_OMVI(omvi.getId_OMVI());
        compItin2.setId_COMPERCOItinerario(200);
        
        
        
//        try {
//            compServ.saveCOMPERCO(comperco);
//            compServ.saveItinerario(itinerario1);
//            compServ.saveItinerario(itinerario2);
//            compServ.saveCompercoItinerario(compItin1);
//            compServ.saveCompercoItinerario(compItin2);
//        } catch (Exception ex) {
//            System.out.println("Error al guardar COMPERCO: "+ex.getMessage());
//        }
        
        
    return "Se guardo COMPERCO correctamente";
    }
    
    @RequestMapping(value="/addOMVI", method= RequestMethod.POST)
    public String addOMVI(@RequestParam("omvi") Integer omviV,
                          @RequestParam("datepicker") String datepicker, HttpServletRequest request){
        
        //System.out.println("**********************addOMVI");
        
        Destino_ordser destOrdSer2 = new Destino_ordser();
        Objeto_comision objComision2 = new Objeto_comision();
        List<Viaticos_Destinos_Nacionales> listViatDN2 = new ArrayList<Viaticos_Destinos_Nacionales>();
        CompercoItinerario compItin22 = new CompercoItinerario();
        Viaticos_Destinos_Nacionales vdn = new Viaticos_Destinos_Nacionales();
        
           try{
               
                System.out.println("1");
                OSPN1Serv.saveDestinoOrdser(destinoOrdSer);
                System.out.println("2");
                OSPN1Serv.saveObjetoComision(objCom);
                System.out.println("3");
                MVN2Service.saveDestViatNac(destViatNac);
                System.out.println("4");
                MVN2Service.saveViaticos_nacionales(viatNac);
                System.out.println("5");
                viatDestNac.setId_Destino(destViatNac.getId_Destino());
                System.out.println("6");
                viatDestNac.setId_Viaticos(viatNac.getId_Viaticos());
                System.out.println("7");
                MVN2Service.saveViaticos_Destinos_Nacionales(viatDestNac);
                System.out.println("8");
                compServ.saveCOMPERCO(comperco);
                System.out.println("9");
                compServ.saveItinerario(itinerario1);
                System.out.println("10");
                compServ.saveItinerario(itinerario2);
                
                
                System.out.println("11");
                //System.out.println("Id comperco: "+comperco.getId_COMPERCO());
                compItin1.setId_COMPERCO(comperco.getId_COMPERCO());
                //System.out.println("setIdCOMPERCO compItin1");
                compItin1.setID_Itinerario(itinerario1.getId_Itinerario());
                //System.out.println("setIdItinerario compItin1");
                compServ.saveCompercoItinerario(compItin1);
                System.out.println("12");
                compItin2.setId_COMPERCO(comperco.getId_COMPERCO());
                //System.out.println("setIdCOMPERCO compItin2");
                compItin2.setID_Itinerario(itinerario2.getId_Itinerario());
                //System.out.println("setIdItinerario compItin2");
                compServ.saveCompercoItinerario(compItin2);
                System.out.println("13");
                
            
           }catch(Exception e){
               System.out.println("Error al guardar un objeto: "+e.getMessage());
               System.out.println("Detalle: "+e.getStackTrace());
           }
           
           
            try {
                
            //System.out.println("1 id_omvi: "+omvi.getId_OMVI());
            compItin22 = compServ.getCompercoItinerarioByIdOMVI(omvi.getId_OMVI()).get(0);
            //System.out.println("id comperco save omvi: "+compItin22.getId_COMPERCOItinerario());
            //System.out.println("2");
            destOrdSer2 = OSPN1Serv.getDestinoOrdserByIdOMVI(omvi.getId_OMVI());
            //System.out.println("3");
            objComision2 = OSPN1Serv.getObjetoComisionByIdOMVI(omvi.getId_OMVI());
            //System.out.println("4");
            listViatDN2 = MVN2Service.getListViaticos_Destinos_NacionalesByIdOMVI(omvi.getId_OMVI());
            //System.out.println("5");
            vdn = listViatDN2.get(0);
            
            omvi.setFecha_OMVI(String.valueOf(datepicker));
            omvi.setId_Destino_OrdSer(destOrdSer2.getId_Destino_ORDSER());
            omvi.setId_UR(1);
            omvi.setId_Obj_Comision(objComision2.getId_Obj_Comision());
            omvi.setId_Viaticos_Destino(vdn.getId_Viat_Dest_Nac());
            omvi.setId_COMPERCO(compItin22.getId_COMPERCOItinerario());
            
//            System.out.println("id omvi: "+omvi.getId_OMVI());
//            System.out.println("fecha: "+omvi.getFecha_OMVI());
//            System.out.println("usuario: "+omvi.getId_UsrCom());
//            System.out.println("destino ordser: "+omvi.getId_Destino_OrdSer());
//            System.out.println("ur: "+omvi.getId_UR());
//            System.out.println("obj comision: "+omvi.getId_Obj_Comision());
//            System.out.println("viat dest: "+omvi.getId_Viaticos_Destino());
//            System.out.println("comperco: "+omvi.getId_COMPERCO());
            
            omviServ.saveOMVI(omvi);
            System.out.println("Se genero correctamente el MOVI...");
        } catch (Exception ex) {
            System.out.println("Error al guardar OMVI : "+ex.getMessage());
        }
        return "Se guardo OMVI correctamente";
    }
    
    @RequestMapping(value="/setIdOMVI", method= RequestMethod.POST)
    public void setIdOMVI(@RequestParam("omvi")Integer omviV){
        omvi.setId_OMVI(omviV);
    }
}