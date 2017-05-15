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
public class PasLayCont {

    @Autowired
    private OmviServ omviServ;
    @Autowired
    private UsersService usrServ;
    @Autowired
    OSPN1Service OSPN1Serv;

    @RequestMapping(value = "/lPasajes", method = RequestMethod.GET)
    public ModelAndView getLayPasajes(Locale locale, ModelAndView model, HttpServletRequest request) {
        UsuarioComisionado usuario = new UsuarioComisionado();

        OMVI omvi = new OMVI();
        Destino_ordser destOrdSer = new Destino_ordser();
        Objeto_comision objComision = new Objeto_comision();


        try {
            omvi = omviServ.getOMVIById(Integer.parseInt(request.getParameter("id")));
            usuario = usrServ.getUsuario(omvi.getId_UsrCom());
            destOrdSer = OSPN1Serv.getDestinoOrdserById(omvi.getId_Destino_OrdSer());
            objComision = OSPN1Serv.getObjetoComisionById(omvi.getId_Obj_Comision());

        } catch (NumberFormatException e) {
            System.out.println("Error Catch Number Format Exception: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("Error Exception Modifica OMVI: " + e.getMessage());
        }

        model.addObject("user", usuario);
        model.addObject("omvi", omvi);
        model.addObject("destOrdSer", destOrdSer);
        model.addObject("motComision", objComision);

        model.setViewName("PasLay");
        return model;
    }
}
