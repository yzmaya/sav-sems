/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package sep.gob.mx.sems.Service;

import java.util.List;
import org.springframework.web.multipart.MultipartFile;
import sep.gob.mx.sems.Model.Conciliacion;

/**
 *
 * @author brayan.padilla
 */
public interface ConciliacionesService {

    public List<Conciliacion> leerArchivo(String nombre, String paterno, String materno, String ruta) throws Exception;
    public String cargaArchivoExcel(MultipartFile file, String ruta)throws Exception;
}
