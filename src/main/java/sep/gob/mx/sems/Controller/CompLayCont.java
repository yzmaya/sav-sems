/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sep.gob.mx.sems.Controller;


import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


/**
 *
 * @author nestor.yzmaya
 */
  @Controller
public class CompLayCont {
	
	
	@RequestMapping(value = "/lComprobante", method = RequestMethod.GET)
	public String test(Locale locale, Model model){
            
            String var = "Hola papu vengo desde controller";
            model.addAttribute("variab",var);
            
            return "CompLay";
        }

		
        
    
}