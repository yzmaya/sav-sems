/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sep.gob.mx.sems.Controller;

import java.util.Locale;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import sep.gob.mx.sems.Model.OMVI;
import sep.gob.mx.sems.Model.UsuarioComisionado;
import sep.gob.mx.sems.Service.OmviServ;
import sep.gob.mx.sems.Service.UsersService;

/**
 *
 * @author nestor.yzmaya
 */
@Controller
public class CompLayCont {

    @Autowired
    private OmviServ omviServ;
    @Autowired
    private UsersService usrServ;

    @RequestMapping(value = "/lComprobante", method = RequestMethod.GET)
    public ModelAndView getLayComprobante(Locale locale, ModelAndView model, HttpServletRequest request) {


        OMVI omvi = new OMVI();
        UsuarioComisionado usuario = new UsuarioComisionado();

        try {
            omvi = omviServ.getOMVIById(Integer.parseInt(request.getParameter("id")));
            usuario = usrServ.getUsuario(omvi.getId_UsrCom());
        } catch (Exception e) {
            System.out.println("Error controller Comprobante viaticos: " + e.getMessage());
        }
        model.addObject("omvi", omvi);
        model.addObject("user", usuario);
        model.setViewName("CompLay");

        return model;
    }
}
