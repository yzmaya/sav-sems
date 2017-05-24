package sep.gob.mx.sems.Controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
    private UsersService usrServ;
    @Autowired
    private OCMVN2Service MVN2Service;
    @Autowired
    OSPN1Service OSPN1Serv;
    @Autowired
    private CatalogosService catServ;

    @RequestMapping(value = "/lViaticos", method = RequestMethod.GET)
    public ModelAndView test(Locale locale, ModelAndView model, HttpServletRequest request) {

//            String var = "Hola papu vengo desde controller";
//            model.addAttribute("variab",var);
//            return "ViatLay";
        UsuarioComisionado usuario = new UsuarioComisionado();
        Viaticos_nacionales viatNac = new Viaticos_nacionales();
        Destinos_viat_nac destViatNac = new Destinos_viat_nac();
        OMVI omvi = new OMVI();
        Objeto_comision objComision = new Objeto_comision();
        List<Viaticos_Destinos_Nacionales> listViatDN = new ArrayList<Viaticos_Destinos_Nacionales>();
        List<Destinos_viat_nac> listDestVN = new ArrayList<Destinos_viat_nac>();
        Cat_puesto puesto = new Cat_puesto();

        try {
            omvi = omviServ.getOMVIById(Integer.parseInt(request.getParameter("id")));
            usuario = usrServ.getUsuario(omvi.getId_UsrCom());
            objComision = OSPN1Serv.getObjetoComisionById(omvi.getId_Obj_Comision());
            listViatDN = MVN2Service.getListViaticos_Destinos_NacionalesByIdOMVI(omvi.getId_OMVI());
            listDestVN = MVN2Service.getListDestViatNacByIdOMVI(omvi.getId_OMVI());
            destViatNac = listDestVN.get(0);
            viatNac = MVN2Service.getViaticos_nacionalesById(listViatDN.get(0).getId_Viaticos());
            puesto = catServ.getPuestoById(usuario.getPuesto());
            
        } catch (NumberFormatException e) {
            System.out.println("Error Catch Number Format Exception: " + e.getMessage());
        } catch (Exception e) {
            System.out.println("Error ViatLayController: " + e.getMessage());
        }

        model.addObject("user", usuario);
        model.addObject("viatNac", viatNac);
        model.addObject("omvi", omvi);
         model.addObject("motComision", objComision);
        //------------------------------------------------------------------------------------------------------------------------------------------------
                                                     //En este punto hay que saber si hay un numero maximo de lugares y periodos que puede
         model.addObject("destViatNac", destViatNac);//tener un comisionado para ver de que manera podemos acomodar los objetos y pasarlos
                                                     //al JSP y los layouts para visualizar los datos. Por ahora solo muestra el primer registro 
                                                     //de la tabla, correspondiente al numero de omvi que se este modificando
        //------------------------------------------------------------------------------------------------------------------------------------------------
                
        model.setViewName("ViatLay");
        model.addObject("puesto", puesto);

        return model;
    }
}
