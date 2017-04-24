package sep.gob.mx.sems.Controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.jboss.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import sep.gob.mx.sems.Model.Gas;
import sep.gob.mx.sems.Model.Users;
import sep.gob.mx.sems.Service.GasService;

@Controller
public class GasController {
	
	private static final Logger logger = Logger
			.getLogger(Gas.class);

	public GasController() {
		System.out.println("Gas Controller()");
	}
	
	@Autowired
	GasService gasService;
	
	@RequestMapping(value = "/gas")
	public ModelAndView listUsers(ModelAndView model, HttpServletRequest request) throws IOException {

		List<Gas> listaGas = new ArrayList<Gas>();
		
		try {
			listaGas = gasService.listaViaticosCombustible();
		} catch (Exception e) {
			System.out.println("Error en controller: "+e.getMessage());
			e.printStackTrace();
		}
		
		System.out.println("-------------------------------------------------");
		model.addObject("listaGas", listaGas);
		model.setViewName("gas");
		return model;
	}

}
