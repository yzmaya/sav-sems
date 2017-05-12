package sep.gob.mx.sems.Controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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
            System.out.println("Tamaño lista TRY: " + listaTablaOmvi.size());
        } catch (Exception e) {
            System.out.println("Error OMVI controller: " + e.getMessage());
            System.out.println("Tamaño lista CATCH: " + listaTablaOmvi.size());
        }

        @SuppressWarnings("rawtypes")
        Iterator itr = listaTablaOmvi.iterator();

        List<TablaOmvi> newTab = new ArrayList<TablaOmvi>();
        TablaOmvi tab;

        System.out.println("Cargando info...");
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
        System.out.println("Tamaño newTab " + a);

        System.out.println("Info cargada...");
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
//        ViaticosDestinos viatDest = new ViaticosDestinos();
        CompercoItinerario compItin = new CompercoItinerario();

        try {
            omvi = omviServ.getOMVIById(Integer.parseInt(request.getParameter("id")));
            usuario = usrServ.getUsuario(omvi.getId_UsrCom());
            compItin = compServ.getCompercoItinerarioById(omvi.getId_COMPERCO());
            comperco = compServ.getCOMPERCOById(compItin.getId_COMPERCO());
            itinerario = compServ.getItinerarioById(compItin.getID_Itinerario());
            destOrdSer = OSPN1Serv.getDestinoOrdserById(omvi.getId_Destino_OrdSer());
            objComision = OSPN1Serv.getObjetoComisionById(omvi.getId_Obj_Comision());
//            viatDest = MVN2Service.getviaticosDestinosById(omvi.getId_Viaticos());
//            destViatNac = MVN2Service.getDestViatNacById(viatDest.getId_Destino());
//            viatNac = MVN2Service.getViaticos_nacionalesById(viatDest.getId_Viaticos());

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
        model.addObject("destViatNac", destViatNac);
        model.addObject("itinerario", itinerario);
                
        model.setViewName("E_Omvi");

        return model;
    }

//    @RequestMapping(value = "/getOmvi", method = RequestMethod.GET)
//    public ModelAndView getOmvi(HttpServletRequest request, ModelAndView model)
//            throws IOException {
//
//        Sav_omvi omvi = new Sav_omvi();
//
//        try {
//            omvi = omviService.getOmvi(Integer.parseInt(request.getParameter("id")));
//            System.out.println("OMVI TRY:  " + omvi);
//        } catch (Exception e) {
//            System.out.println("Error en controller: " + e.getMessage());
//            System.out.println("OMVI CATCH:  " + omvi);
//        }
//
//        model.addObject("omvi", omvi);
//        model.setViewName("G_Omvi");
//        return model;
//    }
}