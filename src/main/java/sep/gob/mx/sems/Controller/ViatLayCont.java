/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sep.gob.mx.sems.Controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import sep.gob.mx.sems.Model.*;
import sep.gob.mx.sems.Service.*;

/**
 *
 * @author nestor.yzmaya
 */
@Controller
public class ViatLayCont {

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

    @RequestMapping(value = "/lViaticos", method = RequestMethod.GET)
    public ModelAndView test(Locale locale, ModelAndView model, HttpServletRequest request) {

//            String var = "Hola papu vengo desde controller";
//            model.addAttribute("variab",var);
//            return "ViatLay";
        OMVI omvi = new OMVI();
        UsuarioComisionado usuario = new UsuarioComisionado();
//        Viaticos_nacionales viatNac = new Viaticos_nacionales();
//        Destinos_viat_nac destViatNac = new Destinos_viat_nac();
//        ViaticosDestinos viatDest = new ViaticosDestinos();
//        List<ViaticosDestinos> viatDestList = new ArrayList<ViaticosDestinos>();
        Objeto_comision objComision = new Objeto_comision();

        try {
            omvi = omviServ.getOMVIById(Integer.parseInt(request.getParameter("id")));
            usuario = usrServ.getUsuario(omvi.getId_UsrCom());
            objComision = OSPN1Serv.getObjetoComisionById(omvi.getId_Obj_Comision());
//            viatDestList = MVN2Service.getViaticosDestinosListByIdOMVI(omvi.getId_OMVI());
//            destViatNac = MVN2Service.getDestViatNacById(viatDest.getId_Destino());
//            viatNac = MVN2Service.getViaticos_nacionalesById(viatDest.getId_Viaticos());
            
//            System.out.println("Lista DestinosViaticos: "+viatDestList.size());

        } catch (NumberFormatException e) {
            System.out.println("Error Number Format Exception ViatLayController: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("Error Controller ViatLay: " + e.getMessage());
        }

        model.addObject("user", usuario);
//        model.addObject("viatNac", viatNac);
        model.addObject("omvi", omvi);
        model.addObject("motComision", objComision);
//        model.addObject("destViatNac", destViatNac);
        model.setViewName("ViatLay");
        return model;
    }
}
