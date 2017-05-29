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
public class GasLayCont {

    @Autowired
    private OmviServ omviServ;
    @Autowired
    private COMPERCO3Service compServ;
    @Autowired
    private UsersService usrServ;
    @Autowired
    OSPN1Service OSPN1Serv;
    @Autowired
    private CatalogosService catServ;

    @RequestMapping(value = "/lComperco", method = RequestMethod.GET)
    public ModelAndView getLayComperco(ModelAndView model, HttpServletRequest request) {

        UsuarioComisionado usuario = new UsuarioComisionado();
        COMPERCO comperco = new COMPERCO();
        OMVI omvi = new OMVI();
        Objeto_comision objComision = new Objeto_comision();
        Itinerario itinerario = new Itinerario();
        Cat_puesto puesto = new Cat_puesto();
        
        CompercoItinerario compItin = new CompercoItinerario();

        try {
            omvi = omviServ.getOMVIById(Integer.parseInt(request.getParameter("id")));
            System.out.println("id omvi: "+omvi.getId_OMVI());
            usuario = usrServ.getUsuario(omvi.getId_UsrCom());
            System.out.println("id user: "+usuario.getId_UsrCom());
            objComision = OSPN1Serv.getObjetoComisionById(omvi.getId_Obj_Comision());
            System.out.println("obj comision: "+objComision.getId_Obj_Comision());
            puesto = catServ.getPuestoById(usuario.getPuesto());
            System.out.println("Puesto: "+puesto.getId_Puesto());
//            System.out.println("omvi.getIdCOMPERCO: "+omvi.getId_COMPERCO());
            
            if(omvi.getId_COMPERCO() != null){
                compItin = compServ.getCompercoItinerarioById(omvi.getId_COMPERCO());
                System.out.println("id comperco itinerario: "+compItin.getId_COMPERCOItinerario());
                comperco = compServ.getCOMPERCOById(compItin.getId_COMPERCO());
                System.out.println("comperco"+comperco.getId_COMPERCO());
                itinerario = compServ.getItinerarioById(compItin.getID_Itinerario());
                System.out.println("itinerario: "+itinerario.getId_Itinerario());
            }
            
        } catch (NumberFormatException e) {
            System.out.println("Error Catch Number Format Exception GasLayController: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("Error Exception Modifica OMVI: " + e.getMessage());
        }

        model.addObject("user", usuario);
        model.addObject("puesto", puesto);
        model.addObject("omvi", omvi);
        model.addObject("motComision", objComision);
        model.addObject("comperco", comperco);
        model.addObject("itinerario", itinerario);
        
        
        model.setViewName("GasLay");
        return model;
    }
}
