package sep.gob.mx.sems.Controller;

import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import sep.gob.mx.sems.Model.*;
import sep.gob.mx.sems.Service.*;

/**
 *
 * @author brayan.padilla
 */
@Controller
public class UpdateOmviController {

    @Autowired
    private OmviServ omviServUp;
    @Autowired
    private COMPERCO3Service compServUp;
    @Autowired
    private UsersService usrServUp;
    @Autowired
    private OCMVN2Service MVN2ServiceUp;
    @Autowired
    private OSPN1Service OSPN1ServUp;
    @Autowired
    private CatalogosService catServUp;
    
//    private Destino_ordser destinoOrdSerUp = new Destino_ordser();
//    private Objeto_comision objComUp = new Objeto_comision();
//    private Destinos_viat_nac destViatNacUp = new Destinos_viat_nac();
//    private Viaticos_nacionales viatNacUp = new Viaticos_nacionales();
//    private Viaticos_Destinos_Nacionales viatDestNacUp = new Viaticos_Destinos_Nacionales();
//    private COMPERCO compercoUp = new COMPERCO();
//    private Itinerario itinerario1Up = new Itinerario();
//    private Itinerario itinerario2Up = new Itinerario();
//    private CompercoItinerario compItin1Up = new CompercoItinerario();
//    private CompercoItinerario compItin2Up = new CompercoItinerario();
//    private OMVI omviUp = new OMVI();
        private OMVI omvi = new OMVI();
        private Integer idOMVI;
        private Destino_ordser destinoOrdSer = new Destino_ordser();
        private Objeto_comision objCom = new Objeto_comision();
        private Destinos_viat_nac destViatNac = new Destinos_viat_nac();
        private Viaticos_nacionales viatNac = new Viaticos_nacionales();
        private Cat_puesto catPuesto = new Cat_puesto();
        private COMPERCO comperco = new COMPERCO();
        private Itinerario itinerario1 = new Itinerario();
        private Itinerario itinerario2 = new Itinerario();
        private List<Viaticos_Destinos_Nacionales> listViaticos_Destinos_Nacionales = new ArrayList<Viaticos_Destinos_Nacionales>();
        private List<Destinos_viat_nac> listDestVN = new ArrayList<Destinos_viat_nac>();
        private List<CompercoItinerario> listCompItin = new ArrayList<CompercoItinerario>();
        private CompercoItinerario compItin = new CompercoItinerario();

    @RequestMapping(value = "/editOmvi")
    public ModelAndView editOmvi(ModelAndView model, HttpServletRequest request) {
        
        UsuarioComisionado usuario = new UsuarioComisionado();
       
        idOMVI = Integer.parseInt(request.getParameter("id"));
        try {
            omvi = omviServUp.getOMVIById(idOMVI);
            usuario = usrServUp.getUsuario(omvi.getId_UsrCom());
            catPuesto = catServUp.getPuestoById(usuario.getPuesto());
            System.out.println(omvi.getId_COMPERCO());
            
            if(omvi.getId_COMPERCO() != null){
                System.out.println("Va a traer datos de COMPERCO");
                compItin = compServUp.getCompercoItinerarioById(omvi.getId_COMPERCO());
                listCompItin = compServUp.getListCompercoItinerarioByIdComperco(compItin.getId_COMPERCO());
                comperco = compServUp.getCOMPERCOById(listCompItin.get(0).getId_COMPERCO());
                itinerario1 = compServUp.getItinerarioById(listCompItin.get(0).getID_Itinerario());
                itinerario2 = compServUp.getItinerarioById(listCompItin.get(1).getID_Itinerario());
            }
            
            destinoOrdSer = OSPN1ServUp.getDestinoOrdserById(omvi.getId_Destino_OrdSer());
            objCom = OSPN1ServUp.getObjetoComisionById(omvi.getId_Obj_Comision());
            listViaticos_Destinos_Nacionales = MVN2ServiceUp.getListViaticos_Destinos_NacionalesByIdOMVI(omvi.getId_OMVI());
            listDestVN = MVN2ServiceUp.getListDestViatNacByIdOMVI(omvi.getId_OMVI());
            destViatNac = listDestVN.get(0);
            viatNac = MVN2ServiceUp.getViaticos_nacionalesById(listViaticos_Destinos_Nacionales.get(0).getId_Viaticos());

        } catch (NumberFormatException e) {
            System.out.println("Error Catch Number Format Exception: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("Error Exception Modifica OMVI: " + e.getMessage());
        }

        model.addObject("user", usuario);
        model.addObject("puesto",catPuesto);
        model.addObject("comperco", comperco);
        model.addObject("viatNac", viatNac);
        model.addObject("omvi", omvi);
        model.addObject("destOrdSer", destinoOrdSer);
        model.addObject("motComision", objCom);
        //------------------------------------------------------------------------------------------------------------------------------------------------
                                                    //En este punto hay que saber si hay un numero maximo de lugares y periodos que puede
        model.addObject("destViatNac", destViatNac);//tener un comisionado para ver de que manera podemos acomodar los objetos y pasarlos
                                                    //al JSP y los layouts para visualizar los datos. Por ahora solo muestra el primer registro 
                                                    //de la tabla, correspondiente al numero de omvi que se este modificando
        //------------------------------------------------------------------------------------------------------------------------------------------------
        model.addObject("itinerario1", itinerario1);
        model.addObject("itinerario2", itinerario2);

        model.setViewName("E_Omvi");
        idOMVI = omvi.getId_OMVI();
        return model;
    }
    
    @RequestMapping(value="/updateDestinoOrdSer" , method = RequestMethod.POST)
    public void updateDestinoOrdSer(@RequestParam("punto_partida") String punto_partida,
                                      @RequestParam("punto_llegada") String punto_llegada,
                                      @RequestParam("otro_destino") String otro_destino, 
                                      @RequestParam("selectClase") String selectClase){
        System.out.println("inicio destinoOrdSer");
        
        destinoOrdSer.setId_OMVI(omvi.getId_OMVI());
        destinoOrdSer.setPunto_Partida(punto_partida);
        destinoOrdSer.setPunto_Llegada(punto_llegada);
        destinoOrdSer.setOtro_Destino(otro_destino);
        destinoOrdSer.setClase_Servicio(selectClase);
        System.out.println("Fin destinoOrdSer");
        
    }
    
    @RequestMapping(value="/updateObjComision", method = RequestMethod.POST)
    public void updateObjComision(@RequestParam("Motivo_Comision") String Motivo_Comision, 
                                 @RequestParam("Observaciones") String Observaciones){
        System.out.println("inicio objComision");
        objCom.setId_OMVI(omvi.getId_OMVI());
        objCom.setMotivo_Comision(Motivo_Comision);
        objCom.setObservaciones(Observaciones);
        System.out.println("fin objComision");

    }
    
    @RequestMapping(value="/updateDestViatNac", method = RequestMethod.POST)
    public void updateDestViatNac(@RequestParam("Lugar") String Lugar, 
                                 @RequestParam("Periodo") String Periodo, 
                                 @RequestParam("Cuota_Diaria") Double Cuota_Diaria, 
                                 @RequestParam("Dias") Double Dias, 
                                 @RequestParam("Importe") Double Importe,
                                 @RequestParam("Total_Importe") Double Total_Importe,
                                 @RequestParam("Caracteristicas_Viat") String Caracteristicas_Viat){
        System.out.println("inicio DestViatNac");
        destViatNac.setLugar(Lugar);
        destViatNac.setPeriodo(Periodo);
        destViatNac.setCuota_Diaria(Cuota_Diaria);
        destViatNac.setDias(Dias);
        destViatNac.setImporte(Importe);
        
        viatNac.setTotal_Importe(Total_Importe);
        viatNac.setCaracteristicas_Viat(Caracteristicas_Viat);
        
//        viatDestNac.setId_OMVI(omvi.getId_OMVI());
//        viatDestNac.setId_Destino(destViatNac.getId_Destino());
//        viatDestNac.setId_Viaticos(viatNac.getId_Viaticos());
        System.out.println("Fin destviatNac");

    }
    
    @RequestMapping(value="/updateCOMPERCO", method= RequestMethod.POST)
    public void updateCOMPERCO(@RequestParam("fecha1Itinerario") String fecha1Itinerario,
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
        System.out.println("Inicio Comperco");
        comperco.setFecha_COMPERCO(datepicker2);
        comperco.setImporte_Gasolina(importeTotalGas);
        comperco.setLitros_Gasolina(litrosGas1);
        comperco.setPrecio_Vigente_Gasolina(precioVigenteGasolina1);
        
        itinerario1.setFecha_Itinerario(fecha1Itinerario);
        itinerario1.setOrigenDe(de1Itinerario);
        itinerario1.setDestinoA(a1Itinerario);
        itinerario1.setDistancia_Km(km1Itinerario);
        
        itinerario2.setFecha_Itinerario(fecha2Itinerario);
        itinerario2.setOrigenDe(de2Itinerario);
        itinerario2.setDestinoA(a2Itinerario);
        itinerario2.setDistancia_Km(km2Itinerario);
        
        listCompItin.get(0).setId_COMPERCO(comperco.getId_COMPERCO());
        listCompItin.get(0).setId_OMVI(omvi.getId_OMVI());
        
        listCompItin.get(1).setId_COMPERCO(comperco.getId_COMPERCO());
        listCompItin.get(1).setId_OMVI(omvi.getId_OMVI());
        System.out.println("fin comperco");
    }
    
    @RequestMapping(value="/updateOMVI", method= RequestMethod.POST)
    public String updateOMVI(@RequestParam("omvi") Integer omviV,
                          @RequestParam("datepicker") String datepicker, HttpServletRequest request){
        System.out.println("inicio omvi");
        Destino_ordser destOrdSer2 = new Destino_ordser();
        Objeto_comision objComision2 = new Objeto_comision();
        List<Viaticos_Destinos_Nacionales> listViatDN2 = new ArrayList<Viaticos_Destinos_Nacionales>();
        CompercoItinerario compItin22 = new CompercoItinerario();
        Viaticos_Destinos_Nacionales vdn = new Viaticos_Destinos_Nacionales();
        
           try{
               
                System.out.println("1");
                System.out.println(destinoOrdSer);
                OSPN1ServUp.updateDestinoOrdser(destinoOrdSer);
                System.out.println("2");
                OSPN1ServUp.updateObjetoComision(objCom);
                System.out.println("3");
                MVN2ServiceUp.updateDestViatNac(destViatNac);
                System.out.println("4");
                MVN2ServiceUp.updateViaticos_nacionales(viatNac);
                System.out.println("5");
//                viatDestNac.setId_Destino(destViatNac.getId_Destino());
                System.out.println("6");
//                viatDestNac.setId_Viaticos(viatNac.getId_Viaticos());
                System.out.println("7");
//                MVN2ServiceUp.updateViaticos_Destinos_Nacionales(viatDestNac);
                System.out.println("8");
                
               if(comperco.getId_COMPERCO() != null){
                    compServUp.updateCOMPERCO(comperco);
                System.out.println("9");
                compServUp.updateItinerario(itinerario1);
                System.out.println("10");
                compServUp.updateItinerario(itinerario2);
                
                
                System.out.println("11");
                System.out.println("Id comperco: "+comperco.getId_COMPERCO());
                listCompItin.get(0).setId_COMPERCO(comperco.getId_COMPERCO());
                System.out.println("setIdCOMPERCO compItin1");
                listCompItin.get(0).setID_Itinerario(itinerario1.getId_Itinerario());
                System.out.println("setIdItinerario compItin1");
                compServUp.updateCompercoItinerario(listCompItin.get(0));
                System.out.println("12");
                listCompItin.get(1).setId_COMPERCO(comperco.getId_COMPERCO());
                System.out.println("setIdCOMPERCO compItin2");
                listCompItin.get(1).setID_Itinerario(itinerario2.getId_Itinerario());
                System.out.println("setIdItinerario compItin2");
                compServUp.updateCompercoItinerario(listCompItin.get(1));
                System.out.println("13");
               }else{
                   comperco = null;
                   System.out.println("Comperco null: "+comperco);
               }
                System.out.println("Guardo tablas != de omvi");
            
           }catch(Exception e){
               System.out.println("Error al guardar un objeto: "+e.getMessage());
               System.out.println("Detalle: "+e.getStackTrace());
           }
           
           
            try {
                
            System.out.println("1 id_omvi: "+omvi.getId_OMVI());
            if(comperco != null){
                System.out.println("Entro a if y no consultara comperco itinerario...");
                compItin22 = compServUp.getCompercoItinerarioByIdOMVI(omvi.getId_OMVI()).get(0);
                System.out.println("id comperco save omvi: "+compItin22.getId_COMPERCOItinerario());
            }
            
            System.out.println("2");
            destOrdSer2 = OSPN1ServUp.getDestinoOrdserByIdOMVI(omvi.getId_OMVI());
            System.out.println("3");
            objComision2 = OSPN1ServUp.getObjetoComisionByIdOMVI(omvi.getId_OMVI());
            System.out.println("4");
            listViatDN2 = MVN2ServiceUp.getListViaticos_Destinos_NacionalesByIdOMVI(omvi.getId_OMVI());
            System.out.println("5");
            vdn = listViatDN2.get(0);
            
            omvi.setFecha_OMVI(String.valueOf(datepicker));
            omvi.setId_Destino_OrdSer(destOrdSer2.getId_Destino_ORDSER());
            omvi.setId_UR(1);
            omvi.setId_Obj_Comision(objComision2.getId_Obj_Comision());
            omvi.setId_Viaticos_Destino(vdn.getId_Viat_Dest_Nac());
            omvi.setId_COMPERCO(compItin22.getId_COMPERCOItinerario());
            
            System.out.println("id omvi: "+omvi.getId_OMVI());
            System.out.println("fecha: "+omvi.getFecha_OMVI());
            System.out.println("usuario: "+omvi.getId_UsrCom());
            System.out.println("destino ordser: "+omvi.getId_Destino_OrdSer());
            System.out.println("ur: "+omvi.getId_UR());
            System.out.println("obj comision: "+omvi.getId_Obj_Comision());
            System.out.println("viat dest: "+omvi.getId_Viaticos_Destino());
            System.out.println("comperco: "+omvi.getId_COMPERCO());
            
            omviServUp.updateOMVI(omvi);
            System.out.println("Se actualizo correctamente el MOVI...");
        } catch (Exception ex) {
            System.out.println("Error al actualizar OMVI : "+ex.getMessage());
        }
        return "Se actualizo el OMVI "+omvi.getId_OMVI()+" correctamente";
    }
}