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
import sep.gob.mx.sems.Service.National_toursService;
import sep.gob.mx.sems.Service.UsersService;

@Controller
public class UsersController {
	
	private static final Logger logger = Logger
			.getLogger(Sav_omvi.class);

	public UsersController() {
		System.out.println("Users Controller()");
	}
	
	@Autowired
	private UsersService usersService;
	
	@Autowired
	private National_toursService natService;
	
	@RequestMapping(value = "/comissioner")
	public ModelAndView listUsers(ModelAndView model, HttpServletRequest request) throws IOException {

		List<Users> listaUsers = new ArrayList<Users>();
		
		try {
			listaUsers = usersService.listUsers();
		} catch (Exception e) {
			System.out.println("Error en controller: "+e.getMessage());
			e.printStackTrace();
		}
		
		System.out.println("-------------------------------------------------");
		model.addObject("listaUsers", listaUsers);
		model.setViewName("comissioner");
		return model;
	}
	
	@RequestMapping(value="/generaOmvi")
	public ModelAndView generaOmvi(/*@RequestBody Users usr,@RequestBody Sav_omvi omvi,*/ ModelAndView model, HttpServletRequest request){
		
		Users user = new Users();
		
		try{
			user = usersService.getUserById(Integer.parseInt(request.getParameter("id")));
		}catch(Exception e){
			System.out.println("Error en GeneraOmvi: "+e.getMessage());
		}
		model.addObject("user",user);
		model.setViewName("G_Omvi");
		return model;
	}
	
	@RequestMapping(value = "/addOmvi", method = RequestMethod.POST)
	public National_tours addOmvi(@ModelAttribute("natTour") National_tours natTour) throws Exception {
		
		String lug1 = natTour.getPLACE1();
		String lug2 = natTour.getPLACE2();
		System.out.println("Origen: "+lug1);
		System.out.println("Destino: "+lug2);
		return natTour;
	}

}
