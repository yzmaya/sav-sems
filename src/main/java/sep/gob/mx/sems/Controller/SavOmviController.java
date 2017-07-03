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
    private OSPN1Service OSPN1Serv;
    @Autowired
    private CatalogosService catServ;
    
    
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
        } catch (Exception e) {
            System.out.println("Error OMVI controller: " + e.getMessage());
            System.out.println("Tamaño lista CATCH: " + listaTablaOmvi.size());
        }

        @SuppressWarnings("rawtypes")
        Iterator itr = listaTablaOmvi.iterator();

        List<TablaOmvi> newTab = new ArrayList<TablaOmvi>();
        TablaOmvi tab;

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

        model.addObject("tablaOmvi", newTab);
        model.setViewName("omvi");

        return model;
    }
    
    @RequestMapping(value="/generaOmvi")
	public ModelAndView generaOmvi(ModelAndView model, HttpServletRequest request){
		
		UsuarioComisionado user = new UsuarioComisionado();
		Integer idUser = Integer.parseInt(request.getParameter("id"));
                Integer idUltOmvi=0;
                Cat_puesto puesto = new Cat_puesto();
                
		try{
			user = usrServ.getUsuario(idUser);
                        omvi.setId_UsrCom(idUser);
                        idUltOmvi = omviServ.getUltimoOmvi();
                        puesto = catServ.getPuestoById(user.getPuesto());
		}catch(Exception e){
			System.out.println("Error en GeneraOmvi: "+e.getMessage());
		}
                System.out.println("Ultimo omvi: "+idUltOmvi);
                model.addObject("ultOmvi",idUltOmvi);
		model.addObject("user",user);
                model.addObject("puesto", puesto);
		model.setViewName("G_Omvi");
		return model;
	}
    
    @RequestMapping(value="/addDestinoOrdSer", method = RequestMethod.POST)
    public String addDestinoOrdSer(@RequestParam("punto_partida") String punto_partida,
                                   @RequestParam("punto_llegada") String punto_llegada,
                                   @RequestParam("otro_destino") String otro_destino, 
                                   @RequestParam("selectClase") String selectClase) {
        System.out.println("***********************addDestinoOrdSer");

        destinoOrdSer.setId_OMVI(omvi.getId_OMVI());
        destinoOrdSer.setPunto_Partida(punto_partida);
        destinoOrdSer.setPunto_Llegada(punto_llegada);
        destinoOrdSer.setOtro_Destino(otro_destino);
        destinoOrdSer.setClase_Servicio(selectClase);
      
        return "Se hizo set de Destino Orden de Servicio";
    }
    
    
    @RequestMapping(value="/addObjComision", method = RequestMethod.POST)
    public String addObjComision(@RequestParam("Motivo_Comision") String Motivo_Comision, 
                                 @RequestParam("Observaciones") String Observaciones){
        
        System.out.println("*******************addObjComision");

        objCom.setId_OMVI(omvi.getId_OMVI());
        objCom.setMotivo_Comision(Motivo_Comision);
        objCom.setObservaciones(Observaciones);
        
        return "Se hizo set de Objeto Comision";
    }
    
    
    
    @RequestMapping(value="/addDestViatNac", method = RequestMethod.POST)
    public String addDestViatNac(@RequestParam("Lugar") String Lugar, 
                                 @RequestParam("Periodo") String Periodo, 
                                 @RequestParam("Cuota_Diaria") Double Cuota_Diaria, 
                                 @RequestParam("Dias") Double Dias, 
                                 @RequestParam("Importe") Double Importe,
                                 @RequestParam("Total_Importe") Double Total_Importe,
                                 @RequestParam("Caracteristicas_Viat") String Caracteristicas_Viat){
        
        System.out.println("***********************addDestViatNac");

        destViatNac.setLugar(Lugar);
        destViatNac.setPeriodo(Periodo);
        destViatNac.setCuota_Diaria(Cuota_Diaria);
        destViatNac.setDias(Dias);
        destViatNac.setImporte(Importe);
        
        viatNac.setTotal_Importe(Total_Importe);
        viatNac.setCaracteristicas_Viat(Caracteristicas_Viat);
        
        viatDestNac.setId_OMVI(omvi.getId_OMVI());
        viatDestNac.setId_Destino(destViatNac.getId_Destino());
        viatDestNac.setId_Viaticos(viatNac.getId_Viaticos());
        
        
        return "Se hizo set de Destinos viaticos Nacionales";
    }
    
    @RequestMapping(value="/addDocumentoContabilizador", method= RequestMethod.POST)
    public String addDocumentoContabilizador(@RequestParam("pp2")String ppOrdServ,
                                             @RequestParam("og2")Integer ogOrdServ,
                                             @RequestParam("importeDC2")Double importeDCOrdServ,
                                             @RequestParam("pp3")String ppCOMPERCO,
                                             @RequestParam("og3")Integer ogCOMPERCO,
                                             @RequestParam("importeDC3")Double importeDCCOMPERCO,
                                             @RequestParam("pp4")String ppViatNac,
                                             @RequestParam("og4")Integer ogViatNac,
                                             @RequestParam("importeDC4")Double importeDCViatNac){
        
        System.out.println("********************************************addDocumentoContabilizador");
        
        viatDestNac.setPP_Ord_Serv(ppOrdServ);
        System.out.println("ppOrdServ: "+ppOrdServ);
        viatDestNac.setOG_Ord_Serv(ogOrdServ);
        System.out.println("ogOrdServ: "+ogOrdServ);
        viatDestNac.setImporteDC_Ord_Serv(importeDCOrdServ);
        System.out.println("importeDCOrdServ: "+importeDCOrdServ);
        viatDestNac.setPP_COMPERCO(ppCOMPERCO);
        System.out.println("ppCOMPERCO: "+ppCOMPERCO);
        viatDestNac.setOG_COMPERCO(ogCOMPERCO);
        System.out.println("ogCOMPERCO: "+ogCOMPERCO);
        viatDestNac.setImporteDC_COMPERCO(importeDCCOMPERCO);
        System.out.println("importeDCCOMPERCO: "+importeDCCOMPERCO);
        viatDestNac.setPP_Viat_Nac(ppViatNac);
        System.out.println("ppViatNac"+ppViatNac);
        viatDestNac.setOG_Viat_Nac(ogViatNac);
        System.out.println("ogViatNac: "+ogViatNac);
        viatDestNac.setImporteDC_Viat_Nac(importeDCViatNac);
        System.out.println("importeDCViatNac: "+importeDCViatNac);
        
        return "Se hizo set de Documento Contabilizador";
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
        System.out.println("********************************************addCOMPERCO");

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
        
        compItin1.setId_OMVI(omvi.getId_OMVI());
        
        compItin2.setId_OMVI(omvi.getId_OMVI());
        
    return "Se hizo set de COMPERCO";
    }
    
    @RequestMapping(value = "/addOMVI", method = RequestMethod.POST)
    public String addOMVI(@RequestParam("omvi") Integer omviV,
                          @RequestParam("datepicker") String datepicker, HttpServletRequest request) {

        System.out.println("**********************addOMVI");

        Destino_ordser destOrdSer2 = new Destino_ordser();
        Objeto_comision objComision2 = new Objeto_comision();
        List<Viaticos_Destinos_Nacionales> listViatDN2 = new ArrayList<Viaticos_Destinos_Nacionales>();
        CompercoItinerario compItin22 = new CompercoItinerario();
        Viaticos_Destinos_Nacionales vdn = new Viaticos_Destinos_Nacionales();
        boolean guardaCOMPERCO = false;
        try {

            OSPN1Serv.saveDestinoOrdser(destinoOrdSer);
            OSPN1Serv.saveObjetoComision(objCom);
            MVN2Service.saveDestViatNac(destViatNac);
            MVN2Service.saveViaticos_nacionales(viatNac);
            viatDestNac.setId_Destino(destViatNac.getId_Destino());
            viatDestNac.setId_Viaticos(viatNac.getId_Viaticos());
            MVN2Service.saveViaticos_Destinos_Nacionales(viatDestNac);

            System.out.println("getImporte_Gasolina: " + comperco.getImporte_Gasolina());
            System.out.println("getLitros_Gasolina: " + comperco.getLitros_Gasolina());
            System.out.println("getPrecio_Vigente_Gasolina: " + comperco.getPrecio_Vigente_Gasolina());
            System.out.println("getFecha_COMPERCO: " + comperco.getFecha_COMPERCO());

            if (comperco.getFecha_COMPERCO() != null) {
                guardaCOMPERCO = true;
                compServ.saveCOMPERCO(comperco);
                compServ.saveItinerario(itinerario1);
                compServ.saveItinerario(itinerario2);
                compItin1.setId_COMPERCO(comperco.getId_COMPERCO());
                compItin1.setID_Itinerario(itinerario1.getId_Itinerario());
                compServ.saveCompercoItinerario(compItin1);
                compItin2.setId_COMPERCO(comperco.getId_COMPERCO());
                compItin2.setID_Itinerario(itinerario2.getId_Itinerario());
                compServ.saveCompercoItinerario(compItin2);
            }

        } catch (Exception e) {
            System.out.println("Error al guardar un objeto: " + e.getMessage());
            System.out.println("StackTrace: " + e.getStackTrace());
        }

        try {
            if (guardaCOMPERCO) {
                System.out.println("Va a traer Comperco Itinerario...");
                compItin22 = compServ.getCompercoItinerarioByIdOMVI(omvi.getId_OMVI()).get(0);
            }

            destOrdSer2 = OSPN1Serv.getDestinoOrdserByIdOMVI(omvi.getId_OMVI());
            objComision2 = OSPN1Serv.getObjetoComisionByIdOMVI(omvi.getId_OMVI());
            listViatDN2 = MVN2Service.getListViaticos_Destinos_NacionalesByIdOMVI(omvi.getId_OMVI());

            vdn = listViatDN2.get(0);

            omvi.setFecha_OMVI(String.valueOf(datepicker));
            omvi.setId_Destino_OrdSer(destOrdSer2.getId_Destino_ORDSER());
            omvi.setId_UR(1);
            omvi.setId_Obj_Comision(objComision2.getId_Obj_Comision());
            omvi.setId_Viaticos_Destino(vdn.getId_Viat_Dest_Nac());
            omvi.setId_COMPERCO(compItin22.getId_COMPERCOItinerario());
            omviServ.saveOMVI(omvi);
            
            System.out.println("Se genero correctamente el MOVI...");
            
        } catch (Exception ex) {
            System.out.println("Error al guardar OMVI : " + ex.getMessage());
        }
        return "Se guardo OMVI correctamente";
    }
    
    @RequestMapping(value="/setIdOMVI", method= RequestMethod.POST)
    public void setIdOMVI(@RequestParam("omvi")Integer omviV){
        omvi.setId_OMVI(omviV);
        System.out.println("OMVI a guardar: "+omvi.getId_OMVI());
    }
}