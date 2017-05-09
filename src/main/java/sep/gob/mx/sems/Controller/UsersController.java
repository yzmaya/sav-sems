package sep.gob.mx.sems.Controller;

import java.io.IOException;
import java.util.ArrayList;
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

import sep.gob.mx.sems.Model.National_tours;
import sep.gob.mx.sems.Model.Sav_omvi;
import sep.gob.mx.sems.Model.Users;
import sep.gob.mx.sems.Model.UsuarioComisionado;
import sep.gob.mx.sems.Service.National_toursService;
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
                        System.out.println("Numero Integrantes: "+listaUsers.size());
		} catch (Exception e) {
			System.out.println("Error en controller: "+e.getMessage());
		}
//		for(UsuarioComisionado usr:listaUsers){
//                    System.out.println("Nombre: "+usr.getAp_Paterno()+" "+usr.getAp_Materno()+" "+usr.getNombre_s());
//                }
//		System.out.println("-------------------------------------------------");
		model.addObject("listaUsers", listaUsers);
		model.setViewName("comissioner");
		return model;
	}
	
	@RequestMapping(value="/generaOmvi")
	public ModelAndView generaOmvi(/*@RequestBody Users usr,@RequestBody Sav_omvi omvi,*/ ModelAndView model, HttpServletRequest request){
		
		UsuarioComisionado user = new UsuarioComisionado();
		
		try{
			user = usersService.getUsuario(Integer.parseInt(request.getParameter("id")));
		}catch(Exception e){
			System.out.println("Error en GeneraOmvi: "+e.getMessage());
		}
		model.addObject("user",user);
		model.setViewName("G_Omvi");
		return model;
	}
	
}
