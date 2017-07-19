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
    private List<Conciliacion> listaConciliacion;
    String result = "";

    @RequestMapping(value = "/opcionesConciliaciones")
    public ModelAndView opcionesConciliaciones(HttpServletRequest request) {

        result = "NINGUN ARCHIVO CARGADO";
        ModelAndView model = new ModelAndView();

        model.addObject("respuesta", result);
        model.setViewName("opcionesConciliaciones");

        return model;
    }

//    @RequestMapping(value = "/generaConciliacion")
//    public ModelAndView generaConciliacion(HttpServletRequest request) {
//
//        String paterno = request.getParameter("pat");
//        String materno = request.getParameter("mat");
//        String nombre = request.getParameter("nom");
//
//        ModelAndView model = new ModelAndView();
//        model.addObject("nombre", nombre);
//        model.addObject("paterno", paterno);
//        model.addObject("materno", materno);
//        model.setViewName("archivo");
//
//        return model;
//    }
    @RequestMapping(value = "/cargarArchivoExcel")
    public ModelAndView cargaArchivoExcel(@RequestParam("file") MultipartFile file, HttpServletRequest request) throws Exception {
        String fileRuta = request.getSession().getServletContext().getRealPath("/ficheros/") + "/";
        result = conciliacionServ.cargaArchivoExcel(file, fileRuta);
        ModelAndView model = new ModelAndView();

        model.addObject("respuesta", result);
        model.setViewName("opcionesConciliaciones");

        return model;
    }

    @RequestMapping(value = "/generarExcelConciliacion", method = RequestMethod.GET)
    protected ModelAndView leerArchivo(HttpServletRequest request) {

        listaConciliacion = new ArrayList<Conciliacion>();

        String nombre = request.getParameter("nom");
        String paterno = request.getParameter("pat");
        String materno = request.getParameter("mat");
        try {

            String fileRuta = request.getSession().getServletContext().getRealPath("/ficheros/") + "/";

            System.out.println("Nombre: " + nombre);
            System.out.println("Paterno: " + paterno);
            System.out.println("Materno: " + materno);
//            System.out.println("Ruta: " + fileRuta);

            listaConciliacion = conciliacionServ.leerArchivo(nombre, paterno, materno, fileRuta);
        } catch (Exception ex) {
            System.out.println("Error en leer archivo controller: " + ex.getMessage()+" | "+ex.getLocalizedMessage());
        }

        ModelAndView model = new ModelAndView();
        model.addObject("nombres", nombre);
        model.addObject("paterno", paterno);
        model.addObject("materno", materno);
        model.addObject("valConc", listaConciliacion);
        model.setViewName("Conciliacion");

        return model;
    }

    @RequestMapping(value = "/download/xls", method = RequestMethod.GET)
    public ModelAndView conciliacionXLSx(ModelAndView modelAndView) {

        JRDataSource datasource = new JRBeanCollectionDataSource(listaConciliacion);

        Map<String, Object> parameterMap = new HashMap<String, Object>();
        parameterMap.put("datasource", datasource);

        modelAndView = new ModelAndView("xlsReport", parameterMap);

        return modelAndView;
    }
}