package sep.gob.mx.sems.Controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.jboss.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import sep.gob.mx.sems.Model.Gas;
import sep.gob.mx.sems.Model.National_tours;
import sep.gob.mx.sems.Model.Sav_omvi;
import sep.gob.mx.sems.Model.TablaOmvi;
import sep.gob.mx.sems.Model.Users;
import sep.gob.mx.sems.Service.GasService;
import sep.gob.mx.sems.Service.National_toursService;
import sep.gob.mx.sems.Service.OmviService;
import sep.gob.mx.sems.Service.Sav_omviService;
import sep.gob.mx.sems.Service.UsersService;

@Controller
public class SavOmviController {

	@SuppressWarnings("unused")
	private static final Logger logger = Logger.getLogger(Sav_omvi.class);

	public SavOmviController() {
		System.out.println("Sav Omvi Controller()");
	}

	@Autowired
	private Sav_omviService omviService;

	@Autowired
	private OmviService omviServ;
	
	@Autowired
	private UsersService userService;
	
	@Autowired
	private GasService gasServ;
	
	@Autowired
	private National_toursService natService;

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
			listaTablaOmvi = omviServ.llenaTablaOmvi();
			//System.out.println("Tamaño lista TRY: " + listaTablaOmvi.size());
		} catch (Exception e) {
			//System.out.println("Error OMVI controller: " + e.getMessage());
			//System.out.println("Tamaño lista CATCH: " + listaTablaOmvi.size());
			e.printStackTrace();
		}

		@SuppressWarnings("rawtypes")
		Iterator itr = listaTablaOmvi.iterator();

		List<TablaOmvi> newTab = new ArrayList<TablaOmvi>();
		TablaOmvi tab;
		while (itr.hasNext()) {
			Object[] obj = (Object[]) itr.next();

			tab = new TablaOmvi();
			tab.setID_OMVI(Integer.valueOf(obj[0].toString()));
			tab.setFULL_NAME(obj[1].toString());
			tab.setAREA_OF_ADSCRIPTION(obj[2].toString());
			tab.setMOT_COMISION(obj[3].toString());
			tab.setTOTAL_IMPORT(Integer.valueOf(obj[4].toString()));
			newTab.add(tab);
		}
		model.addObject("listaTablaOmvi", newTab);
		model.setViewName("omvi");

		return model;
	}
	
	@RequestMapping(value="/editOmvi")
	public ModelAndView editOmvi(ModelAndView model, HttpServletRequest request){
		
		Users user = new Users();
		Gas gas = new Gas();
		National_tours natTour = new National_tours();
		Sav_omvi omvi = new Sav_omvi();
		
		try {
			omvi = omviService.getOmvi(Integer.parseInt(request.getParameter("id")));
			user = userService.getUserById(omvi.getFK_ID_USUARIO());
			gas = gasServ.getViaticosCombustibleById(omvi.getFK_ID_GAS());
			natTour = natService.getNationalToursById(omvi.getFK_ID_VIAT());
			
		} catch (NumberFormatException e) {
			System.out.println("Error Catch Number Format Exception: "+e.getMessage());
			e.printStackTrace();
		} catch (Exception e) {
			System.out.println("Error Exception: "+e.getMessage());
			e.printStackTrace();
		}
		
		model.addObject("user", user);
		model.addObject("gas", gas);
		model.addObject("natTour",natTour);
		model.addObject("omvi", omvi);
		model.setViewName("E_Omvi");
		
		return model;
	}

	@RequestMapping(value = "/getOmvi", method = RequestMethod.GET)
	public ModelAndView getOmvi(HttpServletRequest request, ModelAndView model)
			throws IOException {

		Sav_omvi omvi = new Sav_omvi();

		try {
			omvi = omviService.getOmvi(Integer.parseInt(request
					.getParameter("id")));
			System.out.println("OMVI TRY:  " + omvi);
		} catch (Exception e) {
			System.out.println("Error en controller: " + e.getMessage());
			System.out.println("OMVI CATCH:  " + omvi);
			e.printStackTrace();
		}

		model.addObject("omvi", omvi);
		model.setViewName("G_Omvi");
		return model;
	}

}