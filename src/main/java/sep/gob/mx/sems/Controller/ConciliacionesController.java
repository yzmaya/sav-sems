package sep.gob.mx.sems.Controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import sep.gob.mx.sems.Model.Conciliacion;
import sep.gob.mx.sems.Service.ConciliacionesService;

/**
 *
 * @author brayan.padilla
 */
@Controller
public class ConciliacionesController {

    @Autowired
    ConciliacionesService conciliacionServ;
    List<Conciliacion> listaConciliacion;

    @RequestMapping(value = "/generaConciliacion")
    public ModelAndView generaConciliacion(HttpServletRequest request) {
        
        String paterno = request.getParameter("pat");
        String materno = request.getParameter("mat");
        String nombre = request.getParameter("nom");

        ModelAndView model = new ModelAndView();
        model.addObject("nombre", nombre);
        model.addObject("paterno", paterno);
        model.addObject("materno", materno);
        model.setViewName("archivo");
        
        return model;
    }

    @RequestMapping(value = "/generarExcelConciliacion", method = RequestMethod.POST)
    protected ModelAndView leerArchivo(@RequestParam("file") MultipartFile file, @RequestParam("nombre") String nombre, @RequestParam("paterno") String paterno, @RequestParam("materno") String materno, HttpServletRequest request) {
        
        listaConciliacion = new ArrayList<Conciliacion>();
        
        try {
            String fileRuta = request.getSession().getServletContext().getRealPath("/ficheros/") + "/";
            listaConciliacion = conciliacionServ.leerArchivo(file, nombre, paterno, materno, fileRuta);
        } catch (Exception ex) {
            System.out.println("Error en leer archivo controller: "+ex.getMessage());
        }

        String nombres = listaConciliacion.get(0).getNombre_s();
        String paternoObj = listaConciliacion.get(0).getApPaterno();
        String maternoObj = listaConciliacion.get(0).getApMaterno();

        ModelAndView model = new ModelAndView();
        model.addObject("nombres", nombres);
        model.addObject("paterno", paternoObj);
        model.addObject("materno", maternoObj);
        model.addObject("valConc", listaConciliacion);
        model.setViewName("Conciliacion");
        
        return model;
    }

    @RequestMapping(value = "/download/xls", method = RequestMethod.GET)
    public ModelAndView doSalesReportXLS(ModelAndView modelAndView) {

        JRDataSource datasource = new JRBeanCollectionDataSource(listaConciliacion);

        Map<String, Object> parameterMap = new HashMap<String, Object>();
        parameterMap.put("datasource", datasource);

        modelAndView = new ModelAndView("xlsReport", parameterMap);

        return modelAndView;
    }
}