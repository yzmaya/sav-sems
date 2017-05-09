package sep.gob.mx.sems.Controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import sep.gob.mx.sems.Model.Cat_partidas;
import sep.gob.mx.sems.Model.Cat_puesto;
import sep.gob.mx.sems.Model.Cat_unidad_responsable;
import sep.gob.mx.sems.Service.CatalogosService;

/**
 *
 * @author brayan.padilla
 */

@Controller
public class CatalogosController {
    
    @Autowired
    CatalogosService catServ;
    
    @RequestMapping(value="/catParidas")
    public ModelAndView getCatPartidas(ModelAndView model, HttpServletRequest request, HttpServletResponse response)throws Exception{
        
        List<Cat_partidas> partidas = catServ.getCatPartidas();
        
        model.addObject("partidas", partidas);
        
        return model;
    }
    
    @RequestMapping(value="/catPuesto")
    public ModelAndView getCatPuesto(ModelAndView model, HttpServletRequest request, HttpServletResponse response)throws Exception{
        
        List<Cat_puesto> puestos = catServ.getCatPuesto();
        
        model.addObject("partidas", puestos);
        
        return model;
    }
    
    @RequestMapping(value="/catUR")
    public ModelAndView getCatUR(ModelAndView model, HttpServletResponse response, HttpServletRequest request)throws Exception{
        List<Cat_unidad_responsable> urs = catServ.getCatUR();
        model.addObject("urs", urs);
        return model;
    }
    
}
