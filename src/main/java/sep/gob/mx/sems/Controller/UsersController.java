package sep.gob.mx.sems.Controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.jboss.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import sep.gob.mx.sems.Model.ListaTablaConciliacion;

import sep.gob.mx.sems.Model.UsuarioComisionado;
import sep.gob.mx.sems.Service.UsersService;

@Controller
public class UsersController {

    public UsersController() {
        System.out.println("Users Controller()");
    }
    @Autowired
    private UsersService usersService;

    @RequestMapping(value = "/comissioner")
    public ModelAndView listUsers(ModelAndView model, HttpServletRequest request) throws IOException {

        List<UsuarioComisionado> listaUsers = new ArrayList<UsuarioComisionado>();

        try {
            listaUsers = usersService.listUsuarios();
            System.out.println("Numero Integrantes: " + listaUsers.size());
        } catch (Exception e) {
            System.out.println("Error en controller: " + e.getMessage());
        }
//		for(UsuarioComisionado usr:listaUsers){
//                    System.out.println("Nombre: "+usr.getAp_Paterno()+" "+usr.getAp_Materno()+" "+usr.getNombre_s());
//                }
//		System.out.println("-------------------------------------------------");
        model.addObject("listaUsers", listaUsers);
        model.setViewName("comissioner");
        return model;
    }

    @RequestMapping(value = "/tablaConciliacion")
    public ModelAndView tablaConciliacion(ModelAndView model, HttpServletRequest request) {
        List<ListaTablaConciliacion> listaUsers = new ArrayList<ListaTablaConciliacion>();

        try {
            listaUsers = usersService.getTablaConciliacion();

        } catch (Exception e) {
            System.out.println("Error en tabla conciliacion: " + e.getMessage());
        }

        @SuppressWarnings("rawtypes")
        Iterator itr = listaUsers.iterator();
        List<ListaTablaConciliacion> newTab = new ArrayList<ListaTablaConciliacion>();
        ListaTablaConciliacion ltc;
        
        while(itr.hasNext()){
            Object[] obj = (Object[]) itr.next();
            ltc = new ListaTablaConciliacion();
            ltc.setAp_Paterno(obj[1].toString().trim());
            ltc.setAp_Materno(obj[2].toString().trim());// La posicion del arreglo del objeto  cambia de lugar en las variables los valores
            ltc.setNombre_s(obj[0].toString().trim());
            newTab.add(ltc);
        }
        

        model.addObject("listaUsersConciliacion", newTab);
        model.setViewName("TablaConciliacion");
        return model;

    }
}
